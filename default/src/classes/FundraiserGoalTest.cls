@IsTest
public class FundraiserGoalTest {

    static testMethod void goalShouldBeStretchedWhenReached() {
        Fundraiser__c fundraiser = TestDataFactory.createFundraiser(5000, 0);

        fundraiser.AmountRaised__c = 5000;
        update fundraiser;
        fundraiser = [SELECT Goal__c, AmountRaised__c FROM Fundraiser__c WHERE Id = :fundraiser.Id];

        System.assertEquals(5500, fundraiser.Goal__c);
    }

    static testMethod void goalStaysTheSameIfNotReached() {
        Fundraiser__c fundraiser = TestDataFactory.createFundraiser(5000, 0);

        fundraiser.AmountRaised__c = 150;
        update fundraiser;
        fundraiser = [SELECT Goal__c, AmountRaised__c FROM Fundraiser__c WHERE Id = :fundraiser.Id];

        System.assertEquals(5000, fundraiser.Goal__c);
    }

    static testMethod void goalIsStretchedWhenExceeded() {
        Fundraiser__c fundraiser = TestDataFactory.createFundraiser(5000, 0);

        fundraiser.AmountRaised__c = 6000;
        update fundraiser;
        fundraiser = [SELECT Goal__c, AmountRaised__c FROM Fundraiser__c WHERE Id = :fundraiser.Id];

        System.assertEquals(6600, fundraiser.Goal__c);
    }

    static testMethod void triggerWorksOnBulk() {
        List<Fundraiser__c> fundraisers = TestDataFactory.createManyFundraisers(20, 4000);

        for(Fundraiser__c fundraiser: fundraisers) {
            fundraiser.AmountRaised__c = 6000;
        }
        update fundraisers;
        fundraisers = [SELECT Goal__c, AmountRaised__c FROM Fundraiser__c];

        System.assertEquals(6600, fundraisers[0].Goal__c);
        System.assertEquals(6600, fundraisers[18].Goal__c);
    }

}