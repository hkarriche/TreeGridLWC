import {LightningElement,track,api,wire} from 'lwc';

import getTreeGridData from '@salesforce/apex/TreeGrid.getTreeGridData';
 
export default class TreeGridSample  extends LightningElement {
    @track columns = [{
            type: 'text',
            fieldName: 'name',
            label: 'name'
        },
        {
            type: 'text',
            fieldName: 'label',
            label: 'label'
        }
    ];
     @track treeItems;
     @track error;
     @wire(getTreeGridData)
     wireTreeData({
         error,
         data
     }) {
         if (data) {
             //  alert(data);
             var res = data;
             console.log('res');
             console.log(res);
             var tempjson = JSON.parse(JSON.stringify(data).split('items').join('_children'));
             console.log(tempjson);
             this.treeItems = tempjson;
             console.log(JSON.stringify(tempjson, null, '\t'));
         } else {
             this.error = error;
             //  alert('error' + error);
         }
     }
}