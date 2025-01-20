@interface PKPaymentOfferInstallmentDownpaymentDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)paymentDate;
- (PKCurrencyAmount)amount;
- (PKPaymentOfferInstallmentDownpaymentDetails)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentDownpaymentDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferInstallmentDownpaymentDetails

- (PKPaymentOfferInstallmentDownpaymentDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferInstallmentDownpaymentDetails;
  v5 = [(PKPaymentOfferInstallmentDownpaymentDetails *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKCurrencyAmountForKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"paymentDate"];
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v8;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKCurrencyAmount *)self->_amount dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"amount"];

  v5 = PKISO8601DateStringFromDate(self->_paymentDate);
  [v3 setObject:v5 forKeyedSubscript:@"paymentDate"];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentDownpaymentDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        amount = self->_amount;
        uint64_t v8 = v6->_amount;
        if (amount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](amount, "isEqual:"))
          {
LABEL_7:
            paymentDate = self->_paymentDate;
            v10 = v6->_paymentDate;
            if (paymentDate && v10) {
              char v11 = -[NSDate isEqual:](paymentDate, "isEqual:");
            }
            else {
              char v11 = paymentDate == v10;
            }
            goto LABEL_15;
          }
        }
        else if (amount == v8)
        {
          goto LABEL_7;
        }
        char v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_paymentDate];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  [v3 appendFormat:@"paymentDate: '%@'; ", self->_paymentDate];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentDownpaymentDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferInstallmentDownpaymentDetails;
  v5 = [(PKPaymentOfferInstallmentDownpaymentDetails *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDate"];
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeObject:self->_paymentDate forKey:@"paymentDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferInstallmentDownpaymentDetails allocWithZone:](PKPaymentOfferInstallmentDownpaymentDetails, "allocWithZone:") init];
  uint64_t v6 = [(PKCurrencyAmount *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = v6;

  uint64_t v8 = [(NSDate *)self->_paymentDate copyWithZone:a3];
  paymentDate = v5->_paymentDate;
  v5->_paymentDate = (NSDate *)v8;

  return v5;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end