trigger CreateAccountForLead on Lead (after insert) {
    public List<Account> accountsToInsert = new List<Account>();
    
    
    for (Lead lead : Trigger.new) {
        Account account = new Account();
        account.Name = lead.Company;
        account.Phone = lead.Phone;
        account.Website = lead.Website;
        // Set other desired fields from the Lead to the Account
        
        accountsToInsert.add(account);
    }
    
    if (!accountsToInsert.isEmpty()) {
        insert accountsToInsert;
    }
}