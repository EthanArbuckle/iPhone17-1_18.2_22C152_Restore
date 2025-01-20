@interface PKPaymentTransactionFeeItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFeeItem:(id)a3;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (PKCurrencyAmount)currencyAmount;
- (PKPaymentTransactionFeeItem)initWithCoder:(id)a3;
- (PKPaymentTransactionFeeItem)initWithFeeDictionary:(id)a3;
- (id)description;
- (id)jsonDictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_initWithFeeDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentTransactionFeeItem

- (PKPaymentTransactionFeeItem)initWithFeeDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentTransactionFeeItem;
    v5 = [(PKPaymentTransactionFeeItem *)&v9 init];
    v6 = v5;
    if (v5) {
      [(PKPaymentTransactionFeeItem *)v5 _initWithFeeDictionary:v4];
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

- (void)_initWithFeeDictionary:(id)a3
{
  id v15 = a3;
  id v4 = [v15 objectForKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v4;

  v6 = [v15 objectForKey:@"type"];
  self->_type = PKPaymentTransactionFeeItemTypeFromString(v6);

  v7 = [v15 PKDecimalNumberFromStringForKey:@"amount"];
  v8 = [v15 objectForKey:@"currencyCode"];
  if (v7)
  {
    objc_super v9 = [MEMORY[0x1E4F28C28] notANumber];
    char v10 = [v7 isEqualToNumber:v9];

    if ((v10 & 1) == 0)
    {
      if (v8)
      {
        v11 = [[PKCurrencyAmount alloc] initWithAmount:v7 currency:v8 exponent:0];
        currencyAmount = self->_currencyAmount;
        self->_currencyAmount = v11;
      }
    }
  }
  v13 = [v15 objectForKey:@"localizedDisplayName"];
  localizedDisplayName = self->_localizedDisplayName;
  self->_localizedDisplayName = v13;
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
  localizedDisplayName = self->_localizedDisplayName;
  if (localizedDisplayName) {
    [v4 setObject:localizedDisplayName forKey:@"localizedDisplayName"];
  }
  unint64_t type = self->_type;
  v12 = @"creditCard";
  switch(type)
  {
    case 1uLL:
      break;
    case 2uLL:
      v12 = @"foreignTransaction";
      break;
    case 3uLL:
      v12 = @"serviceCharge";
      break;
    case 4uLL:
      v12 = @"instantWithdrawal";
      break;
    default:
      if (type == 100) {
        v12 = @"other";
      }
      else {
        v12 = @"unknown";
      }
      break;
  }
  [v4 setObject:v12 forKey:@"type"];
  v13 = (void *)[v4 copy];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionFeeItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionFeeItem;
  v5 = [(PKPaymentTransactionFeeItem *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_unint64_t type = PKPaymentTransactionFeeItemTypeFromString(v10);

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  [v6 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  unint64_t type = self->_type;
  v5 = @"creditCard";
  switch(type)
  {
    case 1uLL:
      break;
    case 2uLL:
      v5 = @"foreignTransaction";
      break;
    case 3uLL:
      v5 = @"serviceCharge";
      break;
    case 4uLL:
      v5 = @"instantWithdrawal";
      break;
    default:
      if (type == 100) {
        v5 = @"other";
      }
      else {
        v5 = @"unknown";
      }
      break;
  }
  [v6 encodeObject:v5 forKey:@"type"];
  [v6 encodeObject:self->_localizedDisplayName forKey:@"localizedDisplayName"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_localizedDisplayName];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentTransactionFeeItem *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionFeeItem *)self isEqualToFeeItem:v5];

  return v6;
}

- (BOOL)isEqualToFeeItem:(id)a3
{
  uint64_t v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[1];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_19;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_19;
  }
  currencyAmount = self->_currencyAmount;
  objc_super v9 = (PKCurrencyAmount *)v4[3];
  if (currencyAmount && v9)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
      goto LABEL_19;
    }
  }
  else if (currencyAmount != v9)
  {
    goto LABEL_19;
  }
  localizedDisplayName = self->_localizedDisplayName;
  uint64_t v11 = (NSString *)v4[4];
  if (!localizedDisplayName || !v11)
  {
    if (localizedDisplayName == v11) {
      goto LABEL_17;
    }
LABEL_19:
    BOOL v12 = 0;
    goto LABEL_20;
  }
  if ((-[NSString isEqual:](localizedDisplayName, "isEqual:") & 1) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  BOOL v12 = self->_type == v4[2];
LABEL_20:

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  uint64_t v4 = @"creditCard";
  switch(self->_type)
  {
    case 1uLL:
      break;
    case 2uLL:
      uint64_t v4 = @"foreignTransaction";
      break;
    case 3uLL:
      uint64_t v4 = @"serviceCharge";
      break;
    case 4uLL:
      uint64_t v4 = @"instantWithdrawal";
      break;
    default:
      uint64_t v4 = @"other";
      if (@"creditCard" != (__CFString *)100) {
        uint64_t v4 = @"unknown";
      }
      break;
  }
  [v3 appendFormat:@"type: '%@'; ", v4];
  [v3 appendFormat:@"currencyAmount: '%@'; ", self->_currencyAmount];
  [v3 appendFormat:@"localizedDisplayName: '%@'; ", self->_localizedDisplayName];
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
  self->_unint64_t type = a3;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end