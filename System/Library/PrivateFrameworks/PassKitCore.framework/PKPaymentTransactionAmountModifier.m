@interface PKPaymentTransactionAmountModifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentTransactionAmountModifier:(id)a3;
- (NSString)modifierDescription;
- (NSString)typeString;
- (PKPaymentTransactionAmountModifier)initWithCoder:(id)a3;
- (PKPaymentTransactionAmountModifier)initWithDictionary:(id)a3;
- (PKTransactionAmount)amount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)order;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setModifierDescription:(id)a3;
- (void)setOrder:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeString:(id)a3;
@end

@implementation PKPaymentTransactionAmountModifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPaymentTransactionAmountModifier allocWithZone:](PKPaymentTransactionAmountModifier, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_typeString copyWithZone:a3];
  typeString = v5->_typeString;
  v5->_typeString = (NSString *)v6;

  v5->_type = self->_type;
  uint64_t v8 = [(NSString *)self->_modifierDescription copyWithZone:a3];
  modifierDescription = v5->_modifierDescription;
  v5->_modifierDescription = (NSString *)v8;

  v5->_order = self->_order;
  v10 = [(PKTransactionAmount *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  typeString = self->_typeString;
  id v5 = a3;
  [v5 encodeObject:typeString forKey:@"type"];
  [v5 encodeObject:self->_modifierDescription forKey:@"description"];
  [v5 encodeInteger:self->_order forKey:@"order"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
}

- (PKPaymentTransactionAmountModifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentTransactionAmountModifier;
  id v5 = [(PKPaymentTransactionAmountModifier *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v6;

    v5->_type = PKPaymentTransactionAmountModifierTypeFromString(v5->_typeString);
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    modifierDescription = v5->_modifierDescription;
    v5->_modifierDescription = (NSString *)v8;

    v5->_order = [v4 decodeIntegerForKey:@"order"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (PKTransactionAmount *)v10;
  }
  return v5;
}

- (PKPaymentTransactionAmountModifier)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionAmountModifier;
  id v5 = [(PKPaymentTransactionAmountModifier *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"type"];
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v6;

    v5->_type = PKPaymentTransactionAmountModifierTypeFromString(v5->_typeString);
    uint64_t v8 = [v4 PKStringForKey:@"description"];
    modifierDescription = v5->_modifierDescription;
    v5->_modifierDescription = (NSString *)v8;

    v5->_order = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = [v4 PKDictionaryForKey:@"amount"];
    v11 = [[PKTransactionAmount alloc] initWithDictionary:v10];
    amount = v5->_amount;
    v5->_amount = v11;
  }
  return v5;
}

- (void)setTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_typeString, a3);
  id v5 = a3;
  int64_t v6 = PKPaymentTransactionAmountModifierTypeFromString(self->_typeString);

  self->_type = v6;
}

- (void)setType:(int64_t)a3
{
  if (a3 == 1) {
    v3 = @"discount";
  }
  else {
    v3 = @"unknown";
  }
  [(PKPaymentTransactionAmountModifier *)self setTypeString:v3];
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_typeString forKeyedSubscript:@"type"];
  [v3 setObject:self->_modifierDescription forKeyedSubscript:@"description"];
  id v4 = [NSNumber numberWithInteger:self->_order];
  [v3 setObject:v4 forKeyedSubscript:@"order"];

  id v5 = [(PKTransactionAmount *)self->_amount dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"amount"];

  return v3;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_typeString];
  [v3 safelyAddObject:self->_modifierDescription];
  [v3 safelyAddObject:self->_amount];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_order - v4 + 32 * v4;
  unint64_t v6 = self->_type - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentTransactionAmountModifier *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentTransactionAmountModifier *)self isEqualToPaymentTransactionAmountModifier:v5];

  return v6;
}

- (BOOL)isEqualToPaymentTransactionAmountModifier:(id)a3
{
  uint64_t v4 = a3;
  int64_t v5 = (void *)v4[5];
  BOOL v6 = self->_typeString;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_14;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_21;
    }
  }
  v11 = (void *)v4[4];
  BOOL v6 = self->_modifierDescription;
  v12 = v11;
  if (v6 == v12)
  {

    goto LABEL_16;
  }
  uint64_t v8 = v12;
  if (!v6 || !v12)
  {
LABEL_14:

LABEL_21:
    BOOL v16 = 0;
    goto LABEL_22;
  }
  BOOL v13 = [(NSString *)v6 isEqualToString:v12];

  if (!v13) {
    goto LABEL_21;
  }
LABEL_16:
  if (self->_order != v4[2] || self->_type != v4[1]) {
    goto LABEL_21;
  }
  amount = self->_amount;
  v15 = (PKTransactionAmount *)v4[3];
  if (amount && v15) {
    BOOL v16 = -[PKTransactionAmount isEqual:](amount, "isEqual:");
  }
  else {
    BOOL v16 = amount == v15;
  }
LABEL_22:

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (PKTransactionAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)modifierDescription
{
  return self->_modifierDescription;
}

- (void)setModifierDescription:(id)a3
{
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_modifierDescription, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end