@interface PKPaymentTransactionRewardsItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEnhancedMerchantProgramIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRewardsItem:(id)a3;
- (NSDecimalNumber)eligibleValue;
- (NSString)identifier;
- (NSString)programIdentifier;
- (NSString)promotionIdentifier;
- (NSString)promotionName;
- (PKCurrencyAmount)currencyAmount;
- (PKPaymentTransactionRewardsItem)initWithCoder:(id)a3;
- (PKPaymentTransactionRewardsItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonDictionaryRepresentation;
- (unint64_t)eligibleValueUnit;
- (unint64_t)hash;
- (unint64_t)state;
- (unint64_t)type;
- (void)_initWithRewardsDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setEligibleValue:(id)a3;
- (void)setEligibleValueUnit:(unint64_t)a3;
- (void)setHasEnhancedMerchantProgramIdentifier:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setProgramIdentifier:(id)a3;
- (void)setPromotionIdentifier:(id)a3;
- (void)setPromotionName:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentTransactionRewardsItem

- (PKPaymentTransactionRewardsItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentTransactionRewardsItem;
    v5 = [(PKPaymentTransactionRewardsItem *)&v9 init];
    v6 = v5;
    if (v5) {
      [(PKPaymentTransactionRewardsItem *)v5 _initWithRewardsDictionary:v4];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_initWithRewardsDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  v7 = [v4 objectForKey:@"category"];
  self->_type = PKPaymentTransactionRewardsItemTypeFromString(v7);

  v8 = [v4 objectForKey:@"state"];
  self->_state = PKPaymentTransactionRewardsItemStateFromString(v8);

  objc_super v9 = [v4 objectForKey:@"eligibleValueUnit"];
  self->_eligibleValueUnit = PKPaymentTransactionRewardsItemValueUnitFromString(v9);

  v10 = [v4 PKDecimalNumberFromStringForKey:@"eligibleValue"];
  eligibleValue = self->_eligibleValue;
  self->_eligibleValue = v10;

  v12 = [v4 objectForKey:@"promotionName"];
  promotionName = self->_promotionName;
  self->_promotionName = v12;

  v14 = [v4 objectForKey:@"promotionIdentifier"];
  promotionIdentifier = self->_promotionIdentifier;
  self->_promotionIdentifier = v14;

  v16 = [v4 objectForKey:@"programId"];
  programIdentifier = self->_programIdentifier;
  self->_programIdentifier = v16;

  id v23 = [v4 PKDecimalNumberFromStringForKey:@"amount"];
  v18 = [v4 objectForKey:@"currencyCode"];

  if (v23)
  {
    v19 = [MEMORY[0x1E4F28C28] notANumber];
    char v20 = [v23 isEqualToNumber:v19];

    if ((v20 & 1) == 0)
    {
      if (v18)
      {
        v21 = [[PKCurrencyAmount alloc] initWithAmount:v23 currency:v18 exponent:0];
        currencyAmount = self->_currencyAmount;
        self->_currencyAmount = v21;
      }
    }
  }
}

- (id)jsonDictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    v7 = [(PKCurrencyAmount *)currencyAmount currency];
    v8 = [(PKCurrencyAmount *)self->_currencyAmount amount];
    if (v7) {
      [v4 setObject:v7 forKey:@"currencyCode"];
    }
    if (v8)
    {
      objc_super v9 = [v8 stringValue];
      [v4 setObject:v9 forKey:@"amount"];
    }
  }
  unint64_t v10 = self->_type - 1;
  if (v10 > 5) {
    v11 = @"unknown";
  }
  else {
    v11 = off_1E56DDA00[v10];
  }
  [v4 setObject:v11 forKey:@"category"];
  unint64_t v12 = self->_state - 1;
  v13 = @"unknown";
  if (v12 <= 3) {
    v13 = off_1E56DDA30[v12];
  }
  [v4 setObject:v13 forKey:@"state"];
  eligibleValue = self->_eligibleValue;
  if (eligibleValue)
  {
    v15 = [(NSDecimalNumber *)eligibleValue stringValue];
    [v4 setObject:v15 forKey:@"eligibleValue"];
  }
  unint64_t eligibleValueUnit = self->_eligibleValueUnit;
  v17 = @"cash";
  if (eligibleValueUnit != 2) {
    v17 = @"unknown";
  }
  if (eligibleValueUnit == 1) {
    v18 = @"percent";
  }
  else {
    v18 = v17;
  }
  [v4 setObject:v18 forKey:@"eligibleValueUnit"];
  promotionName = self->_promotionName;
  if (promotionName) {
    [v4 setObject:promotionName forKey:@"promotionName"];
  }
  promotionIdentifier = self->_promotionIdentifier;
  if (promotionIdentifier) {
    [v4 setObject:promotionIdentifier forKey:@"promotionIdentifier"];
  }
  programIdentifier = self->_programIdentifier;
  if (programIdentifier) {
    [v4 setObject:programIdentifier forKey:@"programId"];
  }
  v22 = (void *)[v4 copy];

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionRewardsItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentTransactionRewardsItem;
  v5 = [(PKPaymentTransactionRewardsItem *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    v5->_type = PKPaymentTransactionRewardsItemTypeFromString(v10);

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->_state = PKPaymentTransactionRewardsItemStateFromString(v11);

    unint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibleValueUnit"];
    v5->_unint64_t eligibleValueUnit = PKPaymentTransactionRewardsItemValueUnitFromString(v12);

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibleValue"];
    eligibleValue = v5->_eligibleValue;
    v5->_eligibleValue = (NSDecimalNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promotionName"];
    promotionName = v5->_promotionName;
    v5->_promotionName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"promotionIdentifier"];
    promotionIdentifier = v5->_promotionIdentifier;
    v5->_promotionIdentifier = (NSString *)v17;

    v5->_hasEnhancedMerchantProgramIdentifier = [v4 decodeBoolForKey:@"hasEnhancedMerchantProgramIdentifier"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programId"];
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  [v11 encodeObject:self->_identifier forKey:@"identifier"];
  [v11 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  unint64_t v4 = self->_type - 1;
  if (v4 > 5) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56DDA00[v4];
  }
  [v11 encodeObject:v5 forKey:@"category"];
  unint64_t v6 = self->_state - 1;
  v7 = @"unknown";
  if (v6 <= 3) {
    v7 = off_1E56DDA30[v6];
  }
  [v11 encodeObject:v7 forKey:@"state"];
  unint64_t eligibleValueUnit = self->_eligibleValueUnit;
  objc_super v9 = @"cash";
  if (eligibleValueUnit != 2) {
    objc_super v9 = @"unknown";
  }
  if (eligibleValueUnit == 1) {
    unint64_t v10 = @"percent";
  }
  else {
    unint64_t v10 = v9;
  }
  [v11 encodeObject:v10 forKey:@"eligibleValueUnit"];
  [v11 encodeObject:self->_eligibleValue forKey:@"eligibleValue"];
  [v11 encodeObject:self->_promotionName forKey:@"promotionName"];
  [v11 encodeObject:self->_promotionIdentifier forKey:@"promotionIdentifier"];
  [v11 encodeBool:self->_hasEnhancedMerchantProgramIdentifier forKey:@"hasEnhancedMerchantProgramIdentifier"];
  [v11 encodeObject:self->_programIdentifier forKey:@"programId"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(PKCurrencyAmount *)self->_currencyAmount copyWithZone:a3];
  objc_super v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  *(void *)(v5 + 24) = self->_type;
  *(void *)(v5 + 32) = self->_state;
  *(void *)(v5 + 56) = self->_eligibleValueUnit;
  uint64_t v10 = [(NSDecimalNumber *)self->_eligibleValue copyWithZone:a3];
  id v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_promotionName copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_promotionIdentifier copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  *(unsigned char *)(v5 + 8) = self->_hasEnhancedMerchantProgramIdentifier;
  uint64_t v16 = [(NSString *)self->_programIdentifier copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v16;

  return (id)v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_eligibleValue];
  [v3 safelyAddObject:self->_promotionName];
  [v3 safelyAddObject:self->_promotionIdentifier];
  [v3 safelyAddObject:self->_programIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_state - v5 + 32 * v5;
  unint64_t v7 = self->_eligibleValueUnit - v6 + 32 * v6;
  unint64_t v8 = self->_hasEnhancedMerchantProgramIdentifier - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentTransactionRewardsItem *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionRewardsItem *)self isEqualToRewardsItem:v5];

  return v6;
}

- (BOOL)isEqualToRewardsItem:(id)a3
{
  uint64_t v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[2];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_38;
    }
  }
  else
  {
    char v8 = -[NSString isEqual:](identifier, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_38;
    }
  }
  currencyAmount = self->_currencyAmount;
  uint64_t v10 = (PKCurrencyAmount *)v4[5];
  if (currencyAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
      goto LABEL_38;
    }
  }
  else if (currencyAmount != v10)
  {
    goto LABEL_38;
  }
  eligibleValue = self->_eligibleValue;
  uint64_t v12 = (NSDecimalNumber *)v4[6];
  if (eligibleValue && v12)
  {
    if ((-[NSDecimalNumber isEqual:](eligibleValue, "isEqual:") & 1) == 0) {
      goto LABEL_38;
    }
  }
  else if (eligibleValue != v12)
  {
    goto LABEL_38;
  }
  uint64_t v13 = (void *)v4[8];
  uint64_t v14 = self->_promotionName;
  uint64_t v15 = v13;
  if (v14 == v15)
  {
  }
  else
  {
    uint64_t v16 = v15;
    if (!v14 || !v15) {
      goto LABEL_37;
    }
    BOOL v17 = [(NSString *)v14 isEqualToString:v15];

    if (!v17) {
      goto LABEL_38;
    }
  }
  v18 = (void *)v4[9];
  uint64_t v14 = self->_promotionIdentifier;
  uint64_t v19 = v18;
  if (v14 == v19)
  {
  }
  else
  {
    uint64_t v16 = v19;
    if (!v14 || !v19) {
      goto LABEL_37;
    }
    BOOL v20 = [(NSString *)v14 isEqualToString:v19];

    if (!v20) {
      goto LABEL_38;
    }
  }
  if (self->_hasEnhancedMerchantProgramIdentifier != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_38;
  }
  v21 = (void *)v4[10];
  uint64_t v14 = self->_programIdentifier;
  objc_super v22 = v21;
  if (v14 != v22)
  {
    uint64_t v16 = v22;
    if (v14 && v22)
    {
      BOOL v23 = [(NSString *)v14 isEqualToString:v22];

      if (!v23) {
        goto LABEL_38;
      }
      goto LABEL_41;
    }
LABEL_37:

    goto LABEL_38;
  }

LABEL_41:
  if (self->_type == v4[3] && self->_state == v4[4])
  {
    BOOL v24 = self->_eligibleValueUnit == v4[7];
    goto LABEL_39;
  }
LABEL_38:
  BOOL v24 = 0;
LABEL_39:

  return v24;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t v4 = self->_type - 1;
  if (v4 > 5) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56DDA00[v4];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  unint64_t v6 = self->_state - 1;
  BOOL v7 = @"unknown";
  if (v6 <= 3) {
    BOOL v7 = off_1E56DDA30[v6];
  }
  [v3 appendFormat:@"state: '%@'; ", v7];
  [v3 appendFormat:@"currencyAmount: '%@'; ", self->_currencyAmount];
  [v3 appendFormat:@"eligible value: '%@'; ", self->_eligibleValue];
  unint64_t eligibleValueUnit = self->_eligibleValueUnit;
  objc_super v9 = @"cash";
  if (eligibleValueUnit != 2) {
    objc_super v9 = @"unknown";
  }
  if (eligibleValueUnit == 1) {
    uint64_t v10 = @"percent";
  }
  else {
    uint64_t v10 = v9;
  }
  [v3 appendFormat:@"eligible value unit: '%@'; ", v10];
  [v3 appendFormat:@"promotion name: '%@'; ", self->_promotionName];
  [v3 appendFormat:@"promotion identifier: '%@'; ", self->_promotionIdentifier];
  [v3 appendFormat:@"program identifier: '%@'; ", self->_programIdentifier];
  if (self->_hasEnhancedMerchantProgramIdentifier) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  [v3 appendFormat:@"has enhanced merchant program id: '%@'; ", v11];
  [v3 appendFormat:@">"];
  return v3;
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
  self->_type = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (NSDecimalNumber)eligibleValue
{
  return self->_eligibleValue;
}

- (void)setEligibleValue:(id)a3
{
}

- (unint64_t)eligibleValueUnit
{
  return self->_eligibleValueUnit;
}

- (void)setEligibleValueUnit:(unint64_t)a3
{
  self->_unint64_t eligibleValueUnit = a3;
}

- (NSString)promotionName
{
  return self->_promotionName;
}

- (void)setPromotionName:(id)a3
{
}

- (NSString)promotionIdentifier
{
  return self->_promotionIdentifier;
}

- (void)setPromotionIdentifier:(id)a3
{
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
}

- (BOOL)hasEnhancedMerchantProgramIdentifier
{
  return self->_hasEnhancedMerchantProgramIdentifier;
}

- (void)setHasEnhancedMerchantProgramIdentifier:(BOOL)a3
{
  self->_hasEnhancedMerchantProgramIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programIdentifier, 0);
  objc_storeStrong((id *)&self->_promotionIdentifier, 0);
  objc_storeStrong((id *)&self->_promotionName, 0);
  objc_storeStrong((id *)&self->_eligibleValue, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end