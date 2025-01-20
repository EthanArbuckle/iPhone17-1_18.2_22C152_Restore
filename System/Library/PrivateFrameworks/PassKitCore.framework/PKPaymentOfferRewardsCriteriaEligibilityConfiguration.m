@interface PKPaymentOfferRewardsCriteriaEligibilityConfiguration
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)description;
- (PKPaymentOfferRewardsCriteriaEligibilityConfiguration)initWithAmount:(id)a3 currencyCode:(id)a4 options:(unint64_t)a5;
- (unint64_t)options;
@end

@implementation PKPaymentOfferRewardsCriteriaEligibilityConfiguration

- (PKPaymentOfferRewardsCriteriaEligibilityConfiguration)initWithAmount:(id)a3 currencyCode:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferRewardsCriteriaEligibilityConfiguration;
  v11 = [(PKPaymentOfferRewardsCriteriaEligibilityConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_amount, a3);
    objc_storeStrong((id *)&v12->_currencyCode, a4);
    v12->_options = a5;
  }

  return v12;
}

- (NSString)description
{
  unint64_t options = self->_options;
  unint64_t v4 = options & 1;
  uint64_t v5 = (options >> 1) & 1;
  uint64_t v6 = (options >> 2) & 1;
  uint64_t v7 = (options >> 3) & 1;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v8 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v8 appendFormat:@"amount: '%@'; ", self->_amount];
  [v8 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  id v9 = [NSNumber numberWithBool:v4];
  [v8 appendFormat:@"options: MultiToken: '%@'; ", v9];

  id v10 = [NSNumber numberWithBool:v5];
  [v8 appendFormat:@"options: MerchantToken: '%@'; ", v10];

  v11 = [NSNumber numberWithBool:v6];
  [v8 appendFormat:@"options: Recurring: '%@'; ", v11];

  v12 = [NSNumber numberWithBool:v7];
  [v8 appendFormat:@"options: Deferred: '%@'; ", v12];

  [v8 appendFormat:@">"];
  return (NSString *)v8;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end