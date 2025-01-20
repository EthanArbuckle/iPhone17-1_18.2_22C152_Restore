@interface PKAccountPaymentReminder
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSDate)paymentDueDate;
- (NSDecimalNumber)minimumDue;
- (NSString)currencyCode;
- (NSString)description;
- (PKAccountPaymentReminder)initWithCoder:(id)a3;
- (PKAccountPaymentReminder)initWithDictionary:(id)a3;
- (PKAccountPaymentReminder)initWithRecord:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setMinimumDue:(id)a3;
- (void)setPaymentDueDate:(id)a3;
@end

@implementation PKAccountPaymentReminder

- (PKAccountPaymentReminder)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountPaymentReminder;
  v5 = [(PKAccountPaymentReminder *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    uint64_t v8 = [v4 PKDecimalNumberFromStringForKey:@"minimumDue"];
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 PKDateForKey:@"paymentDueDate"];
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountPaymentReminder;
  v5 = [(PKAccountPaymentReminder *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumDue"];
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDueDate"];
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  minimumDue = self->_minimumDue;
  id v5 = a3;
  [v5 encodeObject:minimumDue forKey:@"minimumDue"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_paymentDueDate forKey:@"paymentDueDate"];
}

- (PKAccountPaymentReminder)initWithRecord:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountPaymentReminder;
  id v5 = [(PKAccountPaymentReminder *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"paymentDueDate");
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"currencyCode");
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"minimumDue");
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v10;
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v5 = [a3 encryptedValues];
  [v5 setObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 setObject:self->_paymentDueDate forKey:@"paymentDueDate"];
  id v4 = [(NSDecimalNumber *)self->_minimumDue stringValue];
  [v5 setObject:v4 forKey:@"minimumDue"];
}

+ (id)recordType
{
  return @"PaymentReminder";
}

+ (id)recordNamePrefix
{
  return @"paymentReminder-";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  minimumDue = self->_minimumDue;
  uint64_t v6 = (NSDecimalNumber *)v4[1];
  if (minimumDue && v6)
  {
    if ((-[NSDecimalNumber isEqual:](minimumDue, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (minimumDue != v6)
  {
    goto LABEL_14;
  }
  paymentDueDate = self->_paymentDueDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (!paymentDueDate || !v8)
  {
    if (paymentDueDate == v8) {
      goto LABEL_10;
    }
LABEL_14:
    char v11 = 0;
    goto LABEL_15;
  }
  if ((-[NSDate isEqual:](paymentDueDate, "isEqual:") & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  currencyCode = self->_currencyCode;
  uint64_t v10 = (NSString *)v4[2];
  if (currencyCode && v10) {
    char v11 = -[NSString isEqual:](currencyCode, "isEqual:");
  }
  else {
    char v11 = currencyCode == v10;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_minimumDue];
  [v3 safelyAddObject:self->_paymentDueDate];
  [v3 safelyAddObject:self->_currencyCode];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"minimumDue: '%@'; ", self->_minimumDue];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  unint64_t v4 = [(NSDate *)self->_paymentDueDate description];
  [v3 appendFormat:@"paymentDueDate: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDate)paymentDueDate
{
  return self->_paymentDueDate;
}

- (void)setPaymentDueDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
}

@end