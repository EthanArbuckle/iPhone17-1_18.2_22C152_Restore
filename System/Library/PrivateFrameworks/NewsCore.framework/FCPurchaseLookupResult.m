@interface FCPurchaseLookupResult
- (void)setIntroOffer:(uint64_t)a1;
@end

@implementation FCPurchaseLookupResult

- (void)setIntroOffer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introOffer, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_subscriptionPriceFormatted, 0);
  objc_storeStrong((id *)&self->_subscriptionPeriodInISO_8601, 0);
  objc_storeStrong((id *)&self->_offerName, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
}

@end