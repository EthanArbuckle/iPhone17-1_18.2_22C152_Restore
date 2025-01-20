@interface FCMockPurchaseIntegrityChecker
+ (id)mockPurchaseIntegrityCheckForFailure;
+ (id)mockPurchaseIntegrityCheckForSuccess;
- (unint64_t)mockedCheckResult;
- (void)isUserEntitledToSubscriptionForPurchaseID:(id)a3 completion:(id)a4;
- (void)setMockedCheckResult:(unint64_t)a3;
@end

@implementation FCMockPurchaseIntegrityChecker

+ (id)mockPurchaseIntegrityCheckForSuccess
{
  v2 = objc_alloc_init(FCMockPurchaseIntegrityChecker);
  [(FCMockPurchaseIntegrityChecker *)v2 setMockedCheckResult:0];
  return v2;
}

+ (id)mockPurchaseIntegrityCheckForFailure
{
  v2 = objc_alloc_init(FCMockPurchaseIntegrityChecker);
  [(FCMockPurchaseIntegrityChecker *)v2 setMockedCheckResult:1];
  return v2;
}

- (void)isUserEntitledToSubscriptionForPurchaseID:(id)a3 completion:(id)a4
{
  id v13 = a4;
  if ([(FCMockPurchaseIntegrityChecker *)self mockedCheckResult])
  {
    [(FCMockPurchaseIntegrityChecker *)self mockedCheckResult];
    v5 = v13;
    if (!v13) {
      goto LABEL_8;
    }
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  else
  {
    v6 = [FCSubscriptionEntitlement alloc];
    v7 = [NSNumber numberWithInt:1];
    v8 = [NSNumber numberWithInt:2];
    v9 = [MEMORY[0x1E4F1C9C8] date];
    v10 = [MEMORY[0x1E4F1C9C8] date];
    LOBYTE(v12) = 0;
    v11 = [(FCSubscriptionEntitlement *)v6 initWithAppAdamID:v7 inAppAdamID:v8 chargeCurrencyCode:@"mockchargeCurrencyCode" newsAppPurchase:1 isTrialPeriod:0 isPurchaser:0 servicesBundleAdamID:0 isAmplifyUser:v12 startDate:v9 expiryDate:v10 initialPurchaseTimestamp:0 serviceBeginsTimestamp:0 vendorAdHocOfferID:0];

    if (v13) {
      (*((void (**)(id, FCSubscriptionEntitlement *))v13 + 2))(v13, v11);
    }
  }
  v5 = v13;
LABEL_8:
}

- (unint64_t)mockedCheckResult
{
  return self->_mockedCheckResult;
}

- (void)setMockedCheckResult:(unint64_t)a3
{
  self->_mockedCheckResult = a3;
}

@end