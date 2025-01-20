@interface PKPaymentOfferInstallmentCriteriaEligibilityConfiguration
- (NSArray)supportedNetworks;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)description;
- (NSString)deviceRegion;
- (NSString)merchantCountryCode;
- (PKPaymentOfferInstallmentCriteriaEligibilityConfiguration)initWithAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 deviceRegion:(id)a6 supportedNetworks:(id)a7 merchantCapabilities:(unint64_t)a8 payLaterSuppressionMode:(int64_t)a9 options:(unint64_t)a10;
- (int64_t)payLaterSuppressionMode;
- (unint64_t)merchantCapabilities;
- (unint64_t)options;
@end

@implementation PKPaymentOfferInstallmentCriteriaEligibilityConfiguration

- (PKPaymentOfferInstallmentCriteriaEligibilityConfiguration)initWithAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 deviceRegion:(id)a6 supportedNetworks:(id)a7 merchantCapabilities:(unint64_t)a8 payLaterSuppressionMode:(int64_t)a9 options:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v24 = a5;
  v19 = (NSString *)a6;
  id v20 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentOfferInstallmentCriteriaEligibilityConfiguration;
  v21 = [(PKPaymentOfferInstallmentCriteriaEligibilityConfiguration *)&v25 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_amount, a3);
    objc_storeStrong((id *)&v22->_currencyCode, a4);
    objc_storeStrong((id *)&v22->_merchantCountryCode, a5);
    objc_storeStrong((id *)&v22->_supportedNetworks, a7);
    v22->_merchantCapabilities = a8;
    v22->_payLaterSuppressionMode = a9;
    v22->_deviceRegion = v19;
    v22->_options = a10;
  }

  return v22;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  [v3 appendFormat:@"merchantCountryCode: '%@'; ", self->_merchantCountryCode];
  [v3 appendFormat:@"deviceRegion: '%@'; ", self->_deviceRegion];
  [v3 appendFormat:@"supportedNetworks: '%@'; ", self->_supportedNetworks];
  v4 = PKMerchantCapabilityToStrings(self->_merchantCapabilities);
  [v3 appendFormat:@"merchantCapabilities: '%@'; ", v4];

  v5 = PKApplePayLaterAvailabilityToString(self->_payLaterSuppressionMode);
  [v3 appendFormat:@"payLaterSuppressionMode: '%@'; ", v5];

  if (self->_options) {
    objc_msgSend(v3, "appendFormat:", @"options: %ld; ", self->_options);
  }
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (int64_t)payLaterSuppressionMode
{
  return self->_payLaterSuppressionMode;
}

- (NSString)deviceRegion
{
  return self->_deviceRegion;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end