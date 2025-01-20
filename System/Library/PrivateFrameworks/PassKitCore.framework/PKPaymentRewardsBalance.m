@interface PKPaymentRewardsBalance
+ (BOOL)supportsSecureCoding;
+ (id)cashbackRewardsBalanceWithIdentifier:(id)a3 monetaryValue:(id)a4 eligibility:(unint64_t)a5 programName:(id)a6 programURL:(id)a7 lastFetchedAt:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFresh;
- (BOOL)isFreshForNow:(id)a3;
- (BOOL)isQuantitative;
- (BOOL)isRedeemable;
- (BOOL)isValid;
- (NSDate)lastFetchedAt;
- (NSDecimalNumber)conversionRate;
- (NSDecimalNumber)value;
- (NSString)identifier;
- (NSString)programName;
- (NSURL)programURL;
- (PKCurrencyAmount)monetaryValue;
- (PKPaymentRewardsBalance)initWithCoder:(id)a3;
- (PKPaymentRewardsBalance)initWithDictionary:(id)a3;
- (PKPaymentRewardsBalance)initWithIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5 monetaryValue:(id)a6 conversionRate:(id)a7 roundingStrategy:(unint64_t)a8 eligibility:(unint64_t)a9 programName:(id)a10 programURL:(id)a11 lastFetchedAt:(id)a12;
- (id)_nsDecimalRoundingBehavior;
- (id)convertAmountFromValue:(id)a3;
- (id)convertMonetaryValueFromValue:(id)a3;
- (id)convertValueFromAmount:(id)a3;
- (id)convertValueFromMonetaryValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedMonetaryValue;
- (id)formattedQuantityValue;
- (unint64_t)_nsDecimalRoundingMode;
- (unint64_t)eligibility;
- (unint64_t)hash;
- (unint64_t)roundingStrategy;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setConversionRate:(id)a3;
- (void)setEligibility:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastFetchedAt:(id)a3;
- (void)setMonetaryValue:(id)a3;
- (void)setProgramName:(id)a3;
- (void)setProgramURL:(id)a3;
- (void)setRoundingStrategy:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation PKPaymentRewardsBalance

- (PKPaymentRewardsBalance)initWithIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5 monetaryValue:(id)a6 conversionRate:(id)a7 roundingStrategy:(unint64_t)a8 eligibility:(unint64_t)a9 programName:(id)a10 programURL:(id)a11 lastFetchedAt:(id)a12
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v47.receiver = self;
  v47.super_class = (Class)PKPaymentRewardsBalance;
  v24 = [(PKPaymentRewardsBalance *)&v47 init];
  if (v24)
  {
    uint64_t v25 = [v46 copy];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    v24->_type = a4;
    uint64_t v27 = [v18 copy];
    value = v24->_value;
    v24->_value = (NSDecimalNumber *)v27;

    uint64_t v29 = [v19 copy];
    monetaryValue = v24->_monetaryValue;
    v24->_monetaryValue = (PKCurrencyAmount *)v29;

    uint64_t v31 = [v20 copy];
    conversionRate = v24->_conversionRate;
    v24->_conversionRate = (NSDecimalNumber *)v31;

    v24->_roundingStrategy = a8;
    v24->_eligibility = a9;
    uint64_t v33 = [v21 copy];
    programName = v24->_programName;
    v24->_programName = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    programURL = v24->_programURL;
    v24->_programURL = (NSURL *)v35;

    uint64_t v37 = [v23 copy];
    lastFetchedAt = v24->_lastFetchedAt;
    v24->_lastFetchedAt = (NSDate *)v37;

    if (!v24->_lastFetchedAt)
    {
      uint64_t v39 = [MEMORY[0x1E4F1C9C8] now];
      v40 = v24->_lastFetchedAt;
      v24->_lastFetchedAt = (NSDate *)v39;
    }
  }
  v41 = v24->_identifier;
  if (v41 && v24->_monetaryValue && v24->_programName)
  {
    v42 = v24;
  }
  else
  {
    v43 = PKLogFacilityTypeGetObject(0x31uLL);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = v24->_programName;
      *(_DWORD *)buf = 138412546;
      v49 = v41;
      __int16 v50 = 2112;
      v51 = v44;
      _os_log_impl(&dword_190E10000, v43, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Balance, with identifier: %@, programName: %@", buf, 0x16u);
    }

    v42 = 0;
  }

  return v42;
}

+ (id)cashbackRewardsBalanceWithIdentifier:(id)a3 monetaryValue:(id)a4 eligibility:(unint64_t)a5 programName:(id)a6 programURL:(id)a7 lastFetchedAt:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v18 type:3 value:0 monetaryValue:v17 conversionRate:0 roundingStrategy:0 eligibility:a5 programName:v16 programURL:v15 lastFetchedAt:v14];

  return v19;
}

- (PKPaymentRewardsBalance)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentRewardsBalance;
  v5 = [(PKPaymentRewardsBalance *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"balanceIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"rewardsType"];
    v5->_type = PKPaymentRewardsBalanceTypeFromString(v8);

    uint64_t v9 = [v4 PKDecimalNumberFromStringForKey:@"value"];
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v9;

    uint64_t v11 = [v4 PKCurrencyAmountForKey:@"monetaryValue"];
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v11;

    uint64_t v13 = [v4 PKDecimalNumberFromStringForKey:@"conversionRate"];
    conversionRate = v5->_conversionRate;
    v5->_conversionRate = (NSDecimalNumber *)v13;

    id v15 = [v4 PKStringForKey:@"roundingStrategy"];
    v5->_roundingStrategy = PKPaymentRewardsBalanceRoundingStrategyFromString(v15);

    id v16 = [v4 PKStringForKey:@"eligibility"];
    v5->_eligibility = PKPaymentRewardsBalanceEligibilityFromString(v16);

    uint64_t v17 = [v4 PKStringForKey:@"programName"];
    programName = v5->_programName;
    v5->_programName = (NSString *)v17;

    uint64_t v19 = [v4 PKURLForKey:@"programURL"];
    programURL = v5->_programURL;
    v5->_programURL = (NSURL *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
    lastFetchedAt = v5->_lastFetchedAt;
    v5->_lastFetchedAt = (NSDate *)v21;
  }
  id v23 = v5->_identifier;
  if (v23 && v5->_monetaryValue && v5->_programName)
  {
    v24 = v5;
  }
  else
  {
    uint64_t v25 = PKLogFacilityTypeGetObject(0x31uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v5->_programName;
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      __int16 v31 = 2112;
      v32 = v26;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Balance, with identifier: %@, programName: %@", buf, 0x16u);
    }

    v24 = 0;
  }

  return v24;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"balanceIdentifier"];
  id v4 = PKPaymentRewardsBalanceTypeToString(self->_type);
  [v3 setObject:v4 forKeyedSubscript:@"rewardsType"];

  v5 = [(NSDecimalNumber *)self->_value stringValue];
  [v3 setObject:v5 forKeyedSubscript:@"value"];

  uint64_t v6 = [(PKCurrencyAmount *)self->_monetaryValue dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"monetaryValue"];

  v7 = [(NSDecimalNumber *)self->_conversionRate stringValue];
  [v3 setObject:v7 forKeyedSubscript:@"conversionRate"];

  v8 = PKPaymentRewardsBalanceRoundingStrategyToString(self->_roundingStrategy);
  [v3 setObject:v8 forKeyedSubscript:@"roundingStrategy"];

  unint64_t eligibility = self->_eligibility;
  v10 = @"unknown";
  if (eligibility == 2) {
    v10 = @"ineligible";
  }
  if (eligibility == 1) {
    uint64_t v11 = @"redeemable";
  }
  else {
    uint64_t v11 = v10;
  }
  [v3 setObject:v11 forKeyedSubscript:@"eligibility"];
  [v3 setObject:self->_programName forKeyedSubscript:@"programName"];
  v12 = [(NSURL *)self->_programURL absoluteString];
  [v3 setObject:v12 forKeyedSubscript:@"programURL"];

  uint64_t v13 = (void *)[v3 copy];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentRewardsBalance *)a3;
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
        identifier = self->_identifier;
        v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
            goto LABEL_44;
          }
        }
        else if (identifier != v8)
        {
          goto LABEL_44;
        }
        value = self->_value;
        uint64_t v11 = v6->_value;
        if (value && v11)
        {
          if ((-[NSDecimalNumber isEqual:](value, "isEqual:") & 1) == 0) {
            goto LABEL_44;
          }
        }
        else if (value != v11)
        {
          goto LABEL_44;
        }
        monetaryValue = self->_monetaryValue;
        uint64_t v13 = v6->_monetaryValue;
        if (monetaryValue && v13)
        {
          if (!-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:")) {
            goto LABEL_44;
          }
        }
        else if (monetaryValue != v13)
        {
          goto LABEL_44;
        }
        conversionRate = self->_conversionRate;
        id v15 = v6->_conversionRate;
        if (conversionRate && v15)
        {
          if ((-[NSDecimalNumber isEqual:](conversionRate, "isEqual:") & 1) == 0) {
            goto LABEL_44;
          }
        }
        else if (conversionRate != v15)
        {
          goto LABEL_44;
        }
        lastFetchedAt = self->_lastFetchedAt;
        uint64_t v17 = v6->_lastFetchedAt;
        if (lastFetchedAt && v17)
        {
          if ((-[NSDate isEqual:](lastFetchedAt, "isEqual:") & 1) == 0) {
            goto LABEL_44;
          }
        }
        else if (lastFetchedAt != v17)
        {
          goto LABEL_44;
        }
        programName = self->_programName;
        uint64_t v19 = v6->_programName;
        if (programName && v19)
        {
          if ((-[NSString isEqual:](programName, "isEqual:") & 1) == 0) {
            goto LABEL_44;
          }
        }
        else if (programName != v19)
        {
          goto LABEL_44;
        }
        programURL = self->_programURL;
        uint64_t v21 = v6->_programURL;
        if (programURL && v21)
        {
          if ((-[NSURL isEqual:](programURL, "isEqual:") & 1) == 0) {
            goto LABEL_44;
          }
        }
        else if (programURL != v21)
        {
          goto LABEL_44;
        }
        if (self->_type == v6->_type && self->_roundingStrategy == v6->_roundingStrategy)
        {
          BOOL v9 = self->_eligibility == v6->_eligibility;
LABEL_45:

          goto LABEL_46;
        }
LABEL_44:
        BOOL v9 = 0;
        goto LABEL_45;
      }
    }
    BOOL v9 = 0;
  }
LABEL_46:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_value];
  [v3 safelyAddObject:self->_monetaryValue];
  [v3 safelyAddObject:self->_conversionRate];
  [v3 safelyAddObject:self->_lastFetchedAt];
  [v3 safelyAddObject:self->_programName];
  [v3 safelyAddObject:self->_programURL];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentRewardsBalance;
  id v4 = [(PKPaymentRewardsBalance *)&v10 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  unint64_t v6 = self->_type - v5 + 32 * v5;
  unint64_t v7 = self->_roundingStrategy - v6 + 32 * v6;
  unint64_t v8 = self->_eligibility - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  id v4 = PKPaymentRewardsBalanceTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  uint64_t v5 = [(NSDecimalNumber *)self->_value stringValue];
  [v3 appendFormat:@"value: '%@'; ", v5];

  unint64_t v6 = [(PKCurrencyAmount *)self->_monetaryValue formattedStringValue];
  [v3 appendFormat:@"monetaryValue: '%@'; ", v6];

  unint64_t v7 = [(NSDecimalNumber *)self->_conversionRate stringValue];
  [v3 appendFormat:@"conversionRate: '%@'; ", v7];

  unint64_t v8 = PKPaymentRewardsBalanceRoundingStrategyToString(self->_roundingStrategy);
  [v3 appendFormat:@"roundingStrategy: '%@'; ", v8];

  unint64_t eligibility = self->_eligibility;
  objc_super v10 = @"unknown";
  if (eligibility == 2) {
    objc_super v10 = @"ineligible";
  }
  if (eligibility == 1) {
    uint64_t v11 = @"redeemable";
  }
  else {
    uint64_t v11 = v10;
  }
  [v3 appendFormat:@"eligibility: '%@'; ", v11];
  [v3 appendFormat:@"programName: '%@'; ", self->_programName];
  [v3 appendFormat:@"programUrl: '%@'; ", self->_programURL];
  [v3 appendFormat:@"lastFetchedAt: '%@'; ", self->_lastFetchedAt];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsBalance)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentRewardsBalance;
  uint64_t v5 = [(PKPaymentRewardsBalance *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balanceIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"rewardsType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monetaryValue"];
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversionRate"];
    conversionRate = v5->_conversionRate;
    v5->_conversionRate = (NSDecimalNumber *)v12;

    v5->_roundingStrategy = [v4 decodeIntegerForKey:@"roundingStrategy"];
    v5->_unint64_t eligibility = [v4 decodeIntegerForKey:@"eligibility"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFetchedAt"];
    lastFetchedAt = v5->_lastFetchedAt;
    v5->_lastFetchedAt = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programName"];
    programName = v5->_programName;
    v5->_programName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programURL"];
    programURL = v5->_programURL;
    v5->_programURL = (NSURL *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"balanceIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"rewardsType"];
  [v5 encodeObject:self->_value forKey:@"value"];
  [v5 encodeObject:self->_monetaryValue forKey:@"monetaryValue"];
  [v5 encodeObject:self->_conversionRate forKey:@"conversionRate"];
  [v5 encodeInteger:self->_roundingStrategy forKey:@"roundingStrategy"];
  [v5 encodeInteger:self->_eligibility forKey:@"eligibility"];
  [v5 encodeObject:self->_lastFetchedAt forKey:@"lastFetchedAt"];
  [v5 encodeObject:self->_programName forKey:@"programName"];
  [v5 encodeObject:self->_programURL forKey:@"programURL"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_type;
  uint64_t v8 = [(NSDecimalNumber *)self->_value copyWithZone:a3];
  BOOL v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(PKCurrencyAmount *)self->_monetaryValue copyWithZone:a3];
  uint64_t v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_conversionRate copyWithZone:a3];
  uint64_t v13 = (void *)v5[5];
  v5[5] = v12;

  v5[6] = self->_roundingStrategy;
  v5[7] = self->_eligibility;
  uint64_t v14 = [(NSDate *)self->_lastFetchedAt copyWithZone:a3];
  id v15 = (void *)v5[10];
  v5[10] = v14;

  uint64_t v16 = [(NSString *)self->_programName copyWithZone:a3];
  uint64_t v17 = (void *)v5[8];
  v5[8] = v16;

  uint64_t v18 = [(NSURL *)self->_programURL copyWithZone:a3];
  uint64_t v19 = (void *)v5[9];
  v5[9] = v18;

  return v5;
}

- (BOOL)isValid
{
  if (!self->_identifier || !self->_programName) {
    return 0;
  }
  unint64_t type = self->_type;
  if (type != 3) {
    return type - 1 > 1 || self->_value && self->_monetaryValue && self->_conversionRate;
  }
  return self->_monetaryValue != 0;
}

- (BOOL)isQuantitative
{
  return self->_type - 1 < 2;
}

- (BOOL)isFresh
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(self) = [(PKPaymentRewardsBalance *)self isFreshForNow:v3];

  return (char)self;
}

- (BOOL)isFreshForNow:(id)a3
{
  lastFetchedAt = self->_lastFetchedAt;
  if (lastFetchedAt) {
    LOBYTE(lastFetchedAt) = (unint64_t)PKDateRangeNumberOfIntervalsForUnit(lastFetchedAt, a3, 64) < 6;
  }
  return (char)lastFetchedAt;
}

- (BOOL)isRedeemable
{
  return self->_eligibility == 1;
}

- (id)formattedQuantityValue
{
  if (self->_value && self->_type - 1 <= 1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v3 setNumberStyle:1];
    [v3 setUsesGroupingSeparator:1];
    id v4 = [v3 stringFromNumber:self->_value];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)formattedMonetaryValue
{
  return [(PKCurrencyAmount *)self->_monetaryValue formattedStringValue];
}

- (id)convertValueFromAmount:(id)a3
{
  id v4 = a3;
  if (self->_type == 3 || (id v5 = self->_conversionRate) == 0)
  {
    id v7 = 0;
  }
  else
  {
    int v6 = [(NSDecimalNumber *)v5 pk_isPositiveNumber];
    id v7 = 0;
    if (v4 && v6)
    {
      conversionRate = self->_conversionRate;
      BOOL v9 = [(PKPaymentRewardsBalance *)self _nsDecimalRoundingBehavior];
      id v10 = [v4 decimalNumberByDividingBy:conversionRate withBehavior:v9];

      if (v10 && (objc_msgSend(v10, "pk_isNotANumber") & 1) == 0) {
        id v7 = v10;
      }
      else {
        id v7 = 0;
      }
    }
  }

  return v7;
}

- (id)convertAmountFromValue:(id)a3
{
  id v4 = a3;
  if (self->_type == 3 || (conversionRate = self->_conversionRate) == 0)
  {
    id v7 = 0;
  }
  else
  {
    int v6 = [(NSDecimalNumber *)conversionRate pk_isPositiveNumber];
    id v7 = 0;
    if (v4 && v6)
    {
      uint64_t v8 = [v4 decimalNumberByMultiplyingBy:self->_conversionRate];
      BOOL v9 = v8;
      if (v8 && (objc_msgSend(v8, "pk_isNotANumber") & 1) == 0) {
        id v7 = v9;
      }
      else {
        id v7 = 0;
      }
    }
  }

  return v7;
}

- (id)convertValueFromMonetaryValue:(id)a3
{
  id v4 = [a3 amount];
  if (v4)
  {
    id v5 = [(PKPaymentRewardsBalance *)self convertValueFromAmount:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)convertMonetaryValueFromValue:(id)a3
{
  id v4 = a3;
  id v5 = [(PKCurrencyAmount *)self->_monetaryValue currency];
  if (v5)
  {
    int v6 = [(PKPaymentRewardsBalance *)self convertAmountFromValue:v4];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = PKCurrencyAmountCreate(v6, v5, 0);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_nsDecimalRoundingBehavior
{
  v2 = (void *)MEMORY[0x1E4F28C30];
  unint64_t v3 = [(PKPaymentRewardsBalance *)self _nsDecimalRoundingMode];
  return (id)[v2 decimalNumberHandlerWithRoundingMode:v3 scale:0 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
}

- (unint64_t)_nsDecimalRoundingMode
{
  if (self->_roundingStrategy - 1 >= 3) {
    return 0;
  }
  else {
    return self->_roundingStrategy;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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

- (NSDecimalNumber)conversionRate
{
  return self->_conversionRate;
}

- (void)setConversionRate:(id)a3
{
}

- (unint64_t)roundingStrategy
{
  return self->_roundingStrategy;
}

- (void)setRoundingStrategy:(unint64_t)a3
{
  self->_roundingStrategy = a3;
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(unint64_t)a3
{
  self->_unint64_t eligibility = a3;
}

- (NSString)programName
{
  return self->_programName;
}

- (void)setProgramName:(id)a3
{
}

- (NSURL)programURL
{
  return self->_programURL;
}

- (void)setProgramURL:(id)a3
{
}

- (NSDate)lastFetchedAt
{
  return self->_lastFetchedAt;
}

- (void)setLastFetchedAt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedAt, 0);
  objc_storeStrong((id *)&self->_programURL, 0);
  objc_storeStrong((id *)&self->_programName, 0);
  objc_storeStrong((id *)&self->_conversionRate, 0);
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end