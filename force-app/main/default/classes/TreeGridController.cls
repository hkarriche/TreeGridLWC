public with sharing class TreeGridController {
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
//HKA 21.05.2020 construct the data in the form of treegrid
@AuraEnabled(cacheable=true)
public static List<ProductTypeWrapper> getTreeGridData(){
  List<Product__c> listProducts = [select Id,technology__r.Name,Product_Type__r.Name,Component__r.Name from Product__c];
  List<ProductTypeWrapper> returnedResult = new List<ProductTypeWrapper> ();

  return returnedResult;

}


public Class ProductTypeWrapper{
    @AuraEnabled
    public String Id {get;set;}
    @AuraEnabled
    public String name {get;set;}
    @AuraEnabled
    public List<TechnologyWrapper> technologies {get;set;}
}
public Class TechnologyWrapper{
    @AuraEnabled
    public String Id {get;set;}
    @AuraEnabled
    public String Name {get;set;}
    @AuraEnabled
    public List<ComponentWrapper> components {get;set;}
}
public Class ComponentWrapper{
    @AuraEnabled
    public String Id {get;set;}
    @AuraEnabled
    public String Name {get;set;}
   
}

}
