@interface STSPaymentRequestBase
+ (BOOL)supportsSecureCoding;
- (NSDate)transactionDate;
- (NSDecimalNumber)transactionAmount;
- (NSString)countryCode;
- (NSString)currencyCode;
- (STSPaymentRequestBase)initWithCoder:(id)a3;
- (STSPaymentRequestBase)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 transactionDate:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation STSPaymentRequestBase

- (STSPaymentRequestBase)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 transactionDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STSPaymentRequestBase;
  v15 = [(STSPaymentRequestBase *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transactionDate, a6);
    objc_storeStrong((id *)&v16->_countryCode, a5);
    objc_storeStrong((id *)&v16->_currencyCode, a4);
    objc_storeStrong((id *)&v16->_transactionAmount, a3);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPaymentRequestBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSPaymentRequestBase;
  v5 = [(STSPaymentRequestBase *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionAmount"];
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  currencyCode = self->_currencyCode;
  id v5 = a3;
  [v5 encodeObject:currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_transactionAmount forKey:@"transactionAmount"];
  [v5 encodeObject:self->_transactionDate forKey:@"transactionDate"];
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
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

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end