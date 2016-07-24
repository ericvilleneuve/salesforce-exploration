public class FundraiserGoal {
    public static void stretchGoal(Fundraiser__c[] fundraisers) {
        System.debug(fundraisers);
        for (Fundraiser__c fundraiser : fundraisers) {

            if (fundraiser.AmountRaised__c >= fundraiser.Goal__c) {
                fundraiser.Goal__c = fundraiser.AmountRaised__c;
                fundraiser.Goal__c *= 1.1;
            }
        }
    }

}