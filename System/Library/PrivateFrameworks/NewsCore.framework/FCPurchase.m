@interface FCPurchase
- (BOOL)isFreeTrialEligible;
- (FCIntroductoryOffer)introductoryOffer;
- (FCPurchase)initWithPurchaseID:(id)a3 appAdamID:(id)a4 subscriptionPriceFormatted:(id)a5 subscriptionPeriodInISO_8601:(id)a6 offerName:(id)a7 storeExternalVersion:(id)a8 bundleID:(id)a9 price:(id)a10 introOffer:(id)a11 payment:(id)a12;
- (NSNumber)appAdamID;
- (NSNumber)price;
- (NSNumber)storeExternalVersion;
- (NSString)bundleID;
- (NSString)offerName;
- (NSString)purchaseID;
- (NSString)subscriptionPeriodInISO_8601;
- (NSString)subscriptionPriceFormatted;
- (SKMutablePayment)payment;
@end

@implementation FCPurchase

- (FCPurchase)initWithPurchaseID:(id)a3 appAdamID:(id)a4 subscriptionPriceFormatted:(id)a5 subscriptionPeriodInISO_8601:(id)a6 offerName:(id)a7 storeExternalVersion:(id)a8 bundleID:(id)a9 price:(id)a10 introOffer:(id)a11 payment:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v27 = a7;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)FCPurchase;
  v22 = [(FCPurchase *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_purchaseID, a3);
    objc_storeStrong((id *)&v23->_appAdamID, obj);
    objc_storeStrong((id *)&v23->_subscriptionPriceFormatted, a5);
    objc_storeStrong((id *)&v23->_subscriptionPeriodInISO_8601, v26);
    objc_storeStrong((id *)&v23->_offerName, v27);
    objc_storeStrong((id *)&v23->_storeExternalVersion, a8);
    objc_storeStrong((id *)&v23->_bundleID, a9);
    objc_storeStrong((id *)&v23->_price, a10);
    objc_storeStrong((id *)&v23->_introductoryOffer, a11);
    objc_storeStrong((id *)&v23->_payment, a12);
  }

  return v23;
}

- (BOOL)isFreeTrialEligible
{
  v3 = NewsCoreUserDefaults();
  uint64_t v4 = [v3 integerForKey:@"newssubscription.bundle_subscriptions.trial_eligible"];

  if (NFInternalBuild())
  {
    if (v4 == 2) {
      return 0;
    }
    if (v4 == 1) {
      return 1;
    }
  }
  v5 = [(FCPurchase *)self introductoryOffer];
  BOOL v6 = [v5 offerType] == 3;

  return v6;
}

- (NSNumber)appAdamID
{
  return self->_appAdamID;
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (NSString)subscriptionPriceFormatted
{
  return self->_subscriptionPriceFormatted;
}

- (NSString)subscriptionPeriodInISO_8601
{
  return self->_subscriptionPeriodInISO_8601;
}

- (NSString)offerName
{
  return self->_offerName;
}

- (NSNumber)storeExternalVersion
{
  return self->_storeExternalVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)price
{
  return self->_price;
}

- (FCIntroductoryOffer)introductoryOffer
{
  return self->_introductoryOffer;
}

- (SKMutablePayment)payment
{
  return self->_payment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_introductoryOffer, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeExternalVersion, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_subscriptionPeriodInISO_8601, 0);
  objc_storeStrong((id *)&self->_subscriptionPriceFormatted, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
}

@end