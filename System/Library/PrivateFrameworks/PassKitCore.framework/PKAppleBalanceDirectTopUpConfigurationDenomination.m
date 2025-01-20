@interface PKAppleBalanceDirectTopUpConfigurationDenomination
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (PKAppleBalanceDirectTopUpConfigurationDenomination)initWithCoder:(id)a3;
- (PKAppleBalanceDirectTopUpConfigurationDenomination)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
@end

@implementation PKAppleBalanceDirectTopUpConfigurationDenomination

- (PKAppleBalanceDirectTopUpConfigurationDenomination)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAppleBalanceDirectTopUpConfigurationDenomination;
  v5 = [(PKAppleBalanceDirectTopUpConfigurationDenomination *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDecimalNumberForKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceDirectTopUpConfigurationDenomination)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKAppleBalanceDirectTopUpConfigurationDenomination *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  amount = self->_amount;
  uint64_t v6 = (NSDecimalNumber *)v4[1];
  if (!amount || !v6)
  {
    if (amount == v6) {
      goto LABEL_5;
    }
LABEL_10:
    char v11 = 0;
    goto LABEL_13;
  }
  if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  v7 = (void *)v4[2];
  uint64_t v8 = self->_currencyCode;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
    if (v8 && v9) {
      char v11 = [(NSString *)v8 isEqualToString:v9];
    }
  }

LABEL_13:
  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_currencyCode];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(NSDecimalNumber *)self->_amount description];
  [v3 appendFormat:@"amount: '%@'; ", v4];

  id v5 = [(NSString *)self->_currencyCode description];
  [v3 appendFormat:@"currencyCode: '%@'; ", v5];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKAppleBalanceDirectTopUpConfigurationDenomination allocWithZone:](PKAppleBalanceDirectTopUpConfigurationDenomination, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = (NSDecimalNumber *)v6;

  uint64_t v8 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v8;

  return v5;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end