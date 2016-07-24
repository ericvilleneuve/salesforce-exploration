@IsTest
public class TestDataFactory {

    public static List<Fundraiser__c> createManyFundraisers(Integer numFundraisers, Decimal goal) {
        List<Fundraiser__c> fundraisers = new List<Fundraiser__c>();

        for (Integer i = 0; i < numFundraisers; i++) {
            Fundraiser__c fundraiser = new Fundraiser__c(Name = 'TestFundraiser' + i, Goal__c = goal, AmountRaised__c = 0);
            fundraisers.add(fundraiser);
        }
        insert fundraisers;
        return fundraisers;
    }

    public static Fundraiser__c createFundraiser(Decimal goal, Decimal amountRaised) {
        Fundraiser__c fundraiser = new Fundraiser__c(Name = 'TestFundraiser', Goal__c = goal, AmountRaised__c = amountRaised);
        insert fundraiser;
        return fundraiser;
    }
}