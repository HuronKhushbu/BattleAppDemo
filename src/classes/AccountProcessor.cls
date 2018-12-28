public class AccountProcessor {
  
    @future
    public static void countContacts(Set<Id> accIds){
    List<Account> lstAccount  = [Select Id,Number_of_Contacts__c,(select id from contacts ) from Account Where Id IN :accIds]; 
        System.debug('List of Account '+lstAccount);
        for(Account acc : lstAccount)
        {
            List<Contact> lstCont = acc.contacts ;
            
             System.debug('List of Contact'+lstCont);
            
            acc.Number_of_Contacts__c = lstCont.size();
        }
        update lstAccount;
    }
}