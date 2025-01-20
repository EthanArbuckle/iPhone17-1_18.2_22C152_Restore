@interface PKPaymentRewardsRedemptionUnit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)value;
- (PKCurrencyAmount)monetaryValue;
- (PKPaymentRewardsRedemptionUnit)initWithCoder:(id)a3;
- (PKPaymentRewardsRedemptionUnit)initWithDictionary:(id)a3;
- (PKPaymentRewardsRedemptionUnit)initWithType:(unint64_t)a3 monetaryValue:(id)a4 value:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setMonetaryValue:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation PKPaymentRewardsRedemptionUnit

- (PKPaymentRewardsRedemptionUnit)initWithType:(unint64_t)a3 monetaryValue:(id)a4 value:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  v10 = [(PKPaymentRewardsRedemptionUnit *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v9 copy];
    value = v11->_value;
    v11->_value = (NSDecimalNumber *)v12;

    uint64_t v14 = [v8 copy];
    monetaryValue = v11->_monetaryValue;
    v11->_monetaryValue = (PKCurrencyAmount *)v14;
  }
  return v11;
}

- (PKPaymentRewardsRedemptionUnit)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  v5 = [(PKPaymentRewardsRedemptionUnit *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"value"];
  value = v5->_value;
  v5->_value = (NSDecimalNumber *)v6;

  id v8 = [v4 PKStringForKey:@"type"];
  v5->_type = PKPaymentRewardsBalanceTypeFromString(v8);

  uint64_t v9 = [v4 PKCurrencyAmountForKey:@"monetaryValue"];
  monetaryValue = v5->_monetaryValue;
  v5->_monetaryValue = (PKCurrencyAmount *)v9;

  if (!v5->_monetaryValue) {
    goto LABEL_5;
  }
  if (v5->_type) {
LABEL_4:
  }
    v11 = v5;
  else {
LABEL_5:
  }
    v11 = 0;

  return v11;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = PKPaymentRewardsBalanceTypeToString(self->_type);
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  v5 = [(NSDecimalNumber *)self->_value stringValue];
  [v3 setObject:v5 forKeyedSubscript:@"value"];

  uint64_t v6 = [(PKCurrencyAmount *)self->_monetaryValue dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"monetaryValue"];

  v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentRewardsRedemptionUnit *)a3;
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
        uint64_t v6 = v5;
        value = self->_value;
        id v8 = v6->_value;
        if (value && v8)
        {
          if ((-[NSDecimalNumber isEqual:](value, "isEqual:") & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if (value != v8)
        {
          goto LABEL_16;
        }
        monetaryValue = self->_monetaryValue;
        v11 = v6->_monetaryValue;
        if (monetaryValue && v11)
        {
          if (-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:"))
          {
LABEL_14:
            BOOL v9 = self->_type == v6->_type;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (monetaryValue == v11)
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
  [v3 safelyAddObject:self->_value];
  [v3 safelyAddObject:self->_monetaryValue];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  id v4 = [(PKPaymentRewardsRedemptionUnit *)&v8 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  unint64_t v6 = self->_type - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = PKPaymentRewardsBalanceTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  uint64_t v5 = [(NSDecimalNumber *)self->_value stringValue];
  [v3 appendFormat:@"value: '%@'; ", v5];

  unint64_t v6 = [(PKCurrencyAmount *)self->_monetaryValue formattedStringValue];
  [v3 appendFormat:@"monetaryValue: '%@'; ", v6];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemptionUnit)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  uint64_t v5 = [(PKPaymentRewardsRedemptionUnit *)&v11 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monetaryValue"];
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_value forKey:@"value"];
  [v5 encodeObject:self->_monetaryValue forKey:@"monetaryValue"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  uint64_t v6 = [(NSDecimalNumber *)self->_value copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PKCurrencyAmount *)self->_monetaryValue copyWithZone:a3];
  BOOL v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (PKCurrencyAmount)monetaryValue
{
  return self->_monetaryValue;
}

- (void)setMonetaryValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end