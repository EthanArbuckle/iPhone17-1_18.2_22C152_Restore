@interface NFECommercePaymentRequest
+ (BOOL)supportsSecureCoding;
- (NFECommercePaymentRequest)initWithCoder:(id)a3;
- (NFECommercePaymentRequest)initWithDictionary:(id)a3;
- (NSData)merchantData;
- (NSData)networkMerchantIdentifier;
- (NSDate)transactionDate;
- (NSDecimalNumber)transactionAmount;
- (NSString)appletIdentifier;
- (NSString)countryCode;
- (NSString)currencyCode;
- (unsigned)merchantCapabilities;
- (unsigned)unpredictableNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAppletIdentifier:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setMerchantCapabilities:(unsigned __int8)a3;
- (void)setMerchantData:(id)a3;
- (void)setNetworkMerchantIdentifier:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionDate:(id)a3;
- (void)setUnpredictableNumber:(unsigned int)a3;
@end

@implementation NFECommercePaymentRequest

- (NFECommercePaymentRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NFECommercePaymentRequest;
  v5 = [(NFECommercePaymentRequest *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"merchantData"];
    merchantData = v5->_merchantData;
    v5->_merchantData = (NSData *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"transactionAmount"];
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v16;

    v18 = [v4 objectForKeyedSubscript:@"merchantCapabilities"];
    v5->_merchantCapabilities = [v18 unsignedIntValue];

    v19 = [v4 objectForKeyedSubscript:@"unpredictableNumber"];
    v5->_unpredictableNumber = [v19 unsignedIntValue];

    uint64_t v20 = [v4 objectForKeyedSubscript:@"merchantIdentifier"];
    networkMerchantIdentifier = v5->_networkMerchantIdentifier;
    v5->_networkMerchantIdentifier = (NSData *)v20;
  }
  return v5;
}

- (NFECommercePaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFECommercePaymentRequest;
  v5 = [(NFECommercePaymentRequest *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantData"];
    merchantData = v5->_merchantData;
    v5->_merchantData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionAmount"];
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v16;

    v5->_merchantCapabilities = [v4 decodeInt32ForKey:@"merchantCapabilities"];
    v5->_unpredictableNumber = [v4 decodeInt32ForKey:@"unpredictableNumber"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    networkMerchantIdentifier = v5->_networkMerchantIdentifier;
    v5->_networkMerchantIdentifier = (NSData *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_appletIdentifier forKey:@"appletIdentifier"];
  [v5 encodeObject:self->_merchantData forKey:@"merchantData"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_transactionAmount forKey:@"transactionAmount"];
  [v5 encodeObject:self->_transactionDate forKey:@"transactionDate"];
  [v5 encodeInt32:self->_merchantCapabilities forKey:@"merchantCapabilities"];
  [v5 encodeInt32:self->_unpredictableNumber forKey:@"unpredictableNumber"];
  networkMerchantIdentifier = self->_networkMerchantIdentifier;
  if (networkMerchantIdentifier) {
    [v5 encodeObject:networkMerchantIdentifier forKey:@"merchantIdentifier"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
}

- (NSData)merchantData
{
  return self->_merchantData;
}

- (void)setMerchantData:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (unsigned)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(unsigned __int8)a3
{
  self->_merchantCapabilities = a3;
}

- (unsigned)unpredictableNumber
{
  return self->_unpredictableNumber;
}

- (void)setUnpredictableNumber:(unsigned int)a3
{
  self->_unpredictableNumber = a3;
}

- (NSData)networkMerchantIdentifier
{
  return self->_networkMerchantIdentifier;
}

- (void)setNetworkMerchantIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_merchantData, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end