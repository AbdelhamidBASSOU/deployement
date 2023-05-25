trigger CreateOpportunityOnLead on Lead (after insert) {
    List<Opportunity> newOpportunities = new List<Opportunity>();

    for (Lead lead : Trigger.new) {
        Opportunity newOpportunity = new Opportunity();

        // Set opportunity fields based on lead information
        newOpportunity.Name = 'New Opportunity'; // Set appropriate values here
        newOpportunity.StageName = 'Prospecting';
        newOpportunity.CloseDate = Date.today() + 30; // Set appropriate close date
        newOpportunity.Amount = 0; // Set appropriate amount
        newOpportunity.AccountId = null; // Set appropriate account ID

        // Add other opportunity field mappings based on your requirements

        newOpportunities.add(newOpportunity);
    }

    if (!newOpportunities.isEmpty()) {
        insert newOpportunities;
    }
}