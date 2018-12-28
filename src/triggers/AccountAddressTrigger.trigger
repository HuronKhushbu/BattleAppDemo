trigger AccountAddressTrigger on Account (before insert,before Update) {
    for(Account acc : trigger.new){   
          if(acc.Match_Billing_Address__c == true && 
             acc.BillingPostalCode!=''){
             acc.ShippingPostalCode = acc.BillingPostalCode;         
          }
    }

}