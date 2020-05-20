public with sharing class TreeGrid {
    @AuraEnabled(cacheable=true)
     public static List<AccountWrapper> getTreeGridData(){
         List<Account> accs = [Select Id , Name,(Select Id , Name from Contacts) from Account order by createddate desc];
         Map<Id , Contact> opps =new Map<Id , Contact>( [Select Id , Name,(Select Id ,Name From Opportunities) from Contact]);
        Map<Id,Opportunity> projects = new Map<Id,Opportunity>([Select Id,(Select Id ,Name From Projects__r) from Opportunity]); 
         
        
         
         List<AccountWrapper> aooo = new List<AccountWrapper>();
         for(Account a : accs){
            AccountWrapper aWraper = new AccountWrapper() ; 
            aWraper.name =a.Name ;
            aWraper.label =a.Name ;
            List<Items> co = new List<Items>();
            
            for(Contact c : a.Contacts){
             
                Items conWrapp = new Items();
                conWrapp.name =c.Name ;
                conWrapp.label =c.Name ;
                
                List<Items> wrapperOooo = new List<Items>();
                List<Items> pjtswrapper = new List<Items>();
                for(Opportunity o : opps.get(c.Id).Opportunities){
                    Items ooo = new Items(); 
                    ooo.name = o.Name ;
                    ooo.label = o.Name ;
                    for(Project__c p : projects.get(o.Id).Projects__r){
                            Items ppp = new Items();
                            ppp.name = p.Name ;
                            ppp.label = p.Name ; 
                            pjtswrapper.add(ppp);                              
                        }
                        ooo.items =pjtswrapper;
                        wrapperOooo.add(ooo);
                }
               
                conWrapp.items =wrapperOooo ;
                co.add(conWrapp);
            }
             aWraper.items = co;
             aooo.add(aWraper);
             
             
         }
         return aooo ;
     } 
     public Class AccountWrapper{
         @AuraEnabled
         public String name {get;set;}
         @AuraEnabled
         public String label {get;set;}
         @AuraEnabled
         public List<Items> items {get;set;}
     }
     public Class Items{
         @AuraEnabled
         public String name {get;set;}
         @AuraEnabled
         public String label {get;set;}
         @AuraEnabled
         public List<Items> items {get;set;}
     }
 }

 /* *
 
 Wrapper product type name, id list technology
 wrapper technology id name, list component
 wrapper component  id, name,

 recuperate list of product__c (soql)

 construct une wrapper product type (list)
 constructy wrapper technoly (list)
 construct wrapper componponent (list)

 concatenate
 
 */