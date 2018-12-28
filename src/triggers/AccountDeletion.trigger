trigger AccountDeletion on Account (before delete) {
    
    for(Account a: [Select id from account where id IN (select AccountID from opportunity) AND ID IN: Trigger.old]){
     trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.'); 
    }

}