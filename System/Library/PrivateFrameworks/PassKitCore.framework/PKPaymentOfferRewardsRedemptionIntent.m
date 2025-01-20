@interface PKPaymentOfferRewardsRedemptionIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFullBalanceSelected;
- (BOOL)isEmptyValued;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)value;
- (NSString)balanceIdentifier;
- (NSString)programName;
- (PKCurrencyAmount)monetaryValue;
- (PKPaymentOfferRewardsRedemptionIntent)initWithCoder:(id)a3;
- (PKPaymentOfferRewardsRedemptionIntent)initWithRewardsBalance:(id)a3 amount:(id)a4 value:(id)a5;
- (PKPaymentRewardsBalance)rewardsBalance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rewardsType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferRewardsRedemptionIntent

- (PKPaymentOfferRewardsRedemptionIntent)initWithRewardsBalance:(id)a3 amount:(id)a4 value:(id)a5
{
  id v8 = a3;
  v9 = (NSDecimalNumber *)a4;
  id v10 = a5;
  v11 = [v8 monetaryValue];
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentOfferRewardsRedemptionIntent;
  v12 = [(PKPaymentOfferRewardsRedemptionIntent *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    rewardsBalance = v12->_rewardsBalance;
    v12->_rewardsBalance = (PKPaymentRewardsBalance *)v13;

    if (v10)
    {
      uint64_t v15 = [v10 copy];
    }
    else
    {
      uint64_t v15 = [v8 convertValueFromAmount:v9];
    }
    value = v12->_value;
    v12->_value = (NSDecimalNumber *)v15;

    v17 = [v11 currency];
    uint64_t v18 = PKCurrencyAmountCreate(v9, v17, 0);
    monetaryValue = v12->_monetaryValue;
    v12->_monetaryValue = (PKCurrencyAmount *)v18;
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPaymentOfferRewardsRedemptionIntent *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        rewardsBalance = self->_rewardsBalance;
        id v8 = v6->_rewardsBalance;
        if (rewardsBalance && v8)
        {
          if (!-[PKPaymentRewardsBalance isEqual:](rewardsBalance, "isEqual:")) {
            goto LABEL_18;
          }
        }
        else if (rewardsBalance != v8)
        {
          goto LABEL_18;
        }
        monetaryValue = self->_monetaryValue;
        v11 = v6->_monetaryValue;
        if (monetaryValue && v11)
        {
          if (-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:"))
          {
LABEL_14:
            value = self->_value;
            uint64_t v13 = v6->_value;
            if (value && v13) {
              char v9 = -[NSDecimalNumber isEqual:](value, "isEqual:");
            }
            else {
              char v9 = value == v13;
            }
            goto LABEL_19;
          }
        }
        else if (monetaryValue == v11)
        {
          goto LABEL_14;
        }
LABEL_18:
        char v9 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    char v9 = 0;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_rewardsBalance];
  [v3 safelyAddObject:self->_monetaryValue];
  [v3 safelyAddObject:self->_value];
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentOfferRewardsRedemptionIntent;
  id v4 = [(PKPaymentOfferRewardsRedemptionIntent *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKPaymentOfferRewardsRedemptionIntent *)self balanceIdentifier];
  [v3 appendFormat:@"balanceIdentifier: '%@'; ", v4];

  unint64_t v5 = [(PKPaymentOfferRewardsRedemptionIntent *)self programName];
  [v3 appendFormat:@"programName: '%@'; ", v5];

  v6 = PKPaymentRewardsBalanceTypeToString([(PKPaymentOfferRewardsRedemptionIntent *)self rewardsType]);
  [v3 appendFormat:@"rewardsType: '%@'; ", v6];

  [v3 appendFormat:@"monetaryValue: '%@'; ", self->_monetaryValue];
  [v3 appendFormat:@"value: '%@'; ", self->_value];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)balanceIdentifier
{
  return [(PKPaymentRewardsBalance *)self->_rewardsBalance identifier];
}

- (NSString)programName
{
  return [(PKPaymentRewardsBalance *)self->_rewardsBalance programName];
}

- (unint64_t)rewardsType
{
  return [(PKPaymentRewardsBalance *)self->_rewardsBalance type];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferRewardsRedemptionIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferRewardsRedemptionIntent;
  unint64_t v5 = [(PKPaymentOfferRewardsRedemptionIntent *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsBalance"];
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (PKPaymentRewardsBalance *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monetaryValue"];
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rewardsBalance = self->_rewardsBalance;
  id v5 = a3;
  [v5 encodeObject:rewardsBalance forKey:@"rewardsBalance"];
  [v5 encodeObject:self->_monetaryValue forKey:@"monetaryValue"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKPaymentRewardsBalance *)self->_rewardsBalance copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKCurrencyAmount *)self->_monetaryValue copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_value copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKPaymentRewardsBalance *)self->_rewardsBalance identifier];
  [v3 setObject:v4 forKeyedSubscript:@"balanceIdentifier"];

  id v5 = PKPaymentRewardsBalanceTypeToString([(PKPaymentRewardsBalance *)self->_rewardsBalance type]);
  [v3 setObject:v5 forKeyedSubscript:@"rewardsType"];

  id v6 = [(PKCurrencyAmount *)self->_monetaryValue dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"monetaryValue"];

  objc_super v7 = [(PKPaymentRewardsBalance *)self->_rewardsBalance monetaryValue];
  id v8 = [v7 amount];
  char v9 = [v8 stringValue];
  [v3 setObject:v9 forKeyedSubscript:@"displayedBalanceAmount"];

  if ([(PKPaymentRewardsBalance *)self->_rewardsBalance isQuantitative])
  {
    value = self->_value;
    if (value)
    {
      v11 = [(NSDecimalNumber *)value stringValue];
      [v3 setObject:v11 forKeyedSubscript:@"value"];

      v12 = [(PKPaymentRewardsBalance *)self->_rewardsBalance value];
      objc_super v13 = [v12 stringValue];
      [v3 setObject:v13 forKeyedSubscript:@"displayedBalanceValue"];
    }
  }
  v14 = (void *)[v3 copy];

  return v14;
}

- (BOOL)isEmptyValued
{
  return !self->_monetaryValue && self->_value == 0;
}

- (BOOL)hasFullBalanceSelected
{
  id v3 = [(PKPaymentRewardsBalance *)self->_rewardsBalance monetaryValue];
  monetaryValue = self->_monetaryValue;
  if (monetaryValue) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5 && [(PKCurrencyAmount *)monetaryValue isEqual:v3];

  return v6;
}

- (PKPaymentRewardsBalance)rewardsBalance
{
  return self->_rewardsBalance;
}

- (PKCurrencyAmount)monetaryValue
{
  return self->_monetaryValue;
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
}

@end