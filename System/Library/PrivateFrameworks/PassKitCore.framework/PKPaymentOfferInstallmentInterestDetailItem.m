@interface PKPaymentOfferInstallmentInterestDetailItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)interestPercentage;
- (PKCurrencyAmount)totalInterest;
- (PKPaymentOfferInstallmentInterestDetailItem)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentInterestDetailItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferInstallmentInterestDetailItem

- (PKPaymentOfferInstallmentInterestDetailItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentOfferInstallmentInterestDetailItem;
  v5 = [(PKPaymentOfferInstallmentInterestDetailItem *)&v18 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v7 = v6;
    if (v6 != @"apr")
    {
      if (v6)
      {
        char v8 = [(__CFString *)v6 isEqualToString:@"apr"];

        if (v8) {
          goto LABEL_5;
        }
        v10 = v7;
        if (v10 == @"pa"
          || (v11 = v10,
              int v12 = [(__CFString *)v10 isEqualToString:@"pa"],
              v11,
              v12))
        {
          uint64_t v9 = 2;
          goto LABEL_10;
        }
      }
      uint64_t v9 = 0;
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v9 = 1;
LABEL_10:

    v5->_type = v9;
    uint64_t v13 = [v4 PKDecimalNumberFromStringForKey:@"interestPercentage"];
    interestPercentage = v5->_interestPercentage;
    v5->_interestPercentage = (NSDecimalNumber *)v13;

    uint64_t v15 = [v4 PKCurrencyAmountForKey:@"totalInterest"];
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v15;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  unint64_t type = self->_type;
  v6 = @"unknown";
  if (type == 1) {
    v6 = @"apr";
  }
  if (type == 2) {
    v7 = @"pa";
  }
  else {
    v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"type"];
  char v8 = [(NSDecimalNumber *)self->_interestPercentage stringValue];
  [v4 setObject:v8 forKeyedSubscript:@"interestPercentage"];

  uint64_t v9 = [(PKCurrencyAmount *)self->_totalInterest dictionaryRepresentation];
  [v4 setObject:v9 forKeyedSubscript:@"totalInterest"];

  v10 = (void *)[v4 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentInterestDetailItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        interestPercentage = self->_interestPercentage;
        char v8 = v6->_interestPercentage;
        if (interestPercentage && v8)
        {
          if ((-[NSDecimalNumber isEqual:](interestPercentage, "isEqual:") & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if (interestPercentage != v8)
        {
          goto LABEL_16;
        }
        totalInterest = self->_totalInterest;
        v11 = v6->_totalInterest;
        if (totalInterest && v11)
        {
          if (-[PKCurrencyAmount isEqual:](totalInterest, "isEqual:"))
          {
LABEL_14:
            BOOL v9 = self->_type == v6->_type;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (totalInterest == v11)
        {
          goto LABEL_14;
        }
LABEL_16:
        BOOL v9 = 0;
        goto LABEL_17;
      }
    }
    BOOL v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_interestPercentage];
  [v3 safelyAddObject:self->_totalInterest];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t type = self->_type;
  unint64_t v5 = @"unknown";
  if (type == 1) {
    unint64_t v5 = @"apr";
  }
  if (type == 2) {
    v6 = @"pa";
  }
  else {
    v6 = v5;
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  [v3 appendFormat:@"interestPercentage: '%@'; ", self->_interestPercentage];
  [v3 appendFormat:@"totalInterest: '%@'; ", self->_totalInterest];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentInterestDetailItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferInstallmentInterestDetailItem;
  unint64_t v5 = [(PKPaymentOfferInstallmentInterestDetailItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestPercentage"];
    interestPercentage = v5->_interestPercentage;
    v5->_interestPercentage = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalInterest"];
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v8;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  interestPercentage = self->_interestPercentage;
  id v5 = a3;
  [v5 encodeObject:interestPercentage forKey:@"interestPercentage"];
  [v5 encodeObject:self->_totalInterest forKey:@"totalInterest"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferInstallmentInterestDetailItem allocWithZone:](PKPaymentOfferInstallmentInterestDetailItem, "allocWithZone:") init];
  uint64_t v6 = [(PKCurrencyAmount *)self->_totalInterest copyWithZone:a3];
  totalInterest = v5->_totalInterest;
  v5->_totalInterest = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_interestPercentage copyWithZone:a3];
  interestPercentage = v5->_interestPercentage;
  v5->_interestPercentage = (NSDecimalNumber *)v8;

  v5->_unint64_t type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDecimalNumber)interestPercentage
{
  return self->_interestPercentage;
}

- (PKCurrencyAmount)totalInterest
{
  return self->_totalInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalInterest, 0);
  objc_storeStrong((id *)&self->_interestPercentage, 0);
}

@end