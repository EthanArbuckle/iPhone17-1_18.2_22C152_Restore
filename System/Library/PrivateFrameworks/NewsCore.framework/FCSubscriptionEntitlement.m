@interface FCSubscriptionEntitlement
- (BOOL)isAmplifyUser;
- (BOOL)isNewsAppPurchase;
- (BOOL)isPurchaser;
- (BOOL)isTrialPeriod;
- (FCSubscriptionEntitlement)initWithASDEntitlement:(id)a3;
- (FCSubscriptionEntitlement)initWithAppAdamID:(id)a3 inAppAdamID:(id)a4 chargeCurrencyCode:(id)a5 newsAppPurchase:(BOOL)a6 isTrialPeriod:(BOOL)a7 isPurchaser:(BOOL)a8 servicesBundleAdamID:(id)a9 isAmplifyUser:(BOOL)a10 startDate:(id)a11 expiryDate:(id)a12 initialPurchaseTimestamp:(id)a13 serviceBeginsTimestamp:(id)a14 vendorAdHocOfferID:(id)a15;
- (NSDate)expiryDate;
- (NSDate)startDate;
- (NSNumber)appAdamID;
- (NSNumber)inAppAdamID;
- (NSNumber)initialPurchaseTimestamp;
- (NSNumber)serviceBeginsTimestamp;
- (NSString)chargeCurrencyCode;
- (NSString)servicesBundleAdamID;
- (NSString)vendorAdHocOfferID;
- (id)description;
@end

@implementation FCSubscriptionEntitlement

- (FCSubscriptionEntitlement)initWithASDEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [v4 appAdamID];
  v20 = [v4 inAppAdamID];
  v19 = [v4 chargeCurrencyCode];
  unsigned int v18 = [v4 isNewsAppPurchase];
  unsigned int v17 = [v4 isTrialPeriod];
  unsigned int v16 = [v4 isPurchaser];
  v6 = [v4 servicesBundlePurchaseID];
  char v7 = [v4 isOfferPeriod];
  v8 = [v4 startDate];
  v9 = [v4 expiryDate];
  v10 = [v4 initialPurchaseTimestamp];
  v11 = [v4 serviceBeginsTimestamp];
  v12 = [v4 vendorAdHocOfferID];

  LOBYTE(v15) = v7;
  v13 = [(FCSubscriptionEntitlement *)self initWithAppAdamID:v5 inAppAdamID:v20 chargeCurrencyCode:v19 newsAppPurchase:v18 isTrialPeriod:v17 isPurchaser:v16 servicesBundleAdamID:v6 isAmplifyUser:v15 startDate:v8 expiryDate:v9 initialPurchaseTimestamp:v10 serviceBeginsTimestamp:v11 vendorAdHocOfferID:v12];

  return v13;
}

- (FCSubscriptionEntitlement)initWithAppAdamID:(id)a3 inAppAdamID:(id)a4 chargeCurrencyCode:(id)a5 newsAppPurchase:(BOOL)a6 isTrialPeriod:(BOOL)a7 isPurchaser:(BOOL)a8 servicesBundleAdamID:(id)a9 isAmplifyUser:(BOOL)a10 startDate:(id)a11 expiryDate:(id)a12 initialPurchaseTimestamp:(id)a13 serviceBeginsTimestamp:(id)a14 vendorAdHocOfferID:(id)a15
{
  id v33 = a3;
  id obj = a4;
  id v19 = a4;
  id v29 = a5;
  id v20 = a5;
  id v35 = a9;
  id v34 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  v36.receiver = self;
  v36.super_class = (Class)FCSubscriptionEntitlement;
  v25 = [(FCSubscriptionEntitlement *)&v36 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_appAdamID, a3);
    objc_storeStrong((id *)&v26->_inAppAdamID, obj);
    objc_storeStrong((id *)&v26->_chargeCurrencyCode, v29);
    v26->_newsAppPurchase = a6;
    v26->_isTrialPeriod = a7;
    v26->_isPurchaser = a8;
    v26->_isAmplifyUser = a10;
    objc_storeStrong((id *)&v26->_servicesBundleAdamID, a9);
    objc_storeStrong((id *)&v26->_startDate, a11);
    objc_storeStrong((id *)&v26->_expiryDate, a12);
    objc_storeStrong((id *)&v26->_initialPurchaseTimestamp, a13);
    objc_storeStrong((id *)&v26->_serviceBeginsTimestamp, a14);
    objc_storeStrong((id *)&v26->_vendorAdHocOfferID, a15);
  }

  return v26;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FCSubscriptionEntitlement *)self inAppAdamID];
  v5 = [(FCSubscriptionEntitlement *)self servicesBundleAdamID];
  v6 = [v3 stringWithFormat:@"{purchaseId=%@, servicesBundleAdamID=%@}", v4, v5];

  return v6;
}

- (NSString)servicesBundleAdamID
{
  return self->_servicesBundleAdamID;
}

- (NSNumber)appAdamID
{
  return self->_appAdamID;
}

- (NSString)chargeCurrencyCode
{
  return self->_chargeCurrencyCode;
}

- (NSNumber)inAppAdamID
{
  return self->_inAppAdamID;
}

- (BOOL)isNewsAppPurchase
{
  return self->_newsAppPurchase;
}

- (BOOL)isTrialPeriod
{
  return self->_isTrialPeriod;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSNumber)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (NSNumber)serviceBeginsTimestamp
{
  return self->_serviceBeginsTimestamp;
}

- (NSString)vendorAdHocOfferID
{
  return self->_vendorAdHocOfferID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorAdHocOfferID, 0);
  objc_storeStrong((id *)&self->_serviceBeginsTimestamp, 0);
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_inAppAdamID, 0);
  objc_storeStrong((id *)&self->_chargeCurrencyCode, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_servicesBundleAdamID, 0);
}

@end