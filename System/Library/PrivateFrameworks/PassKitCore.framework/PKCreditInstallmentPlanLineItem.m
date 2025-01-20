@interface PKCreditInstallmentPlanLineItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentPlanLineItem:(id)a3;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)paymentsToDateAmount;
- (NSString)identifier;
- (NSString)itemDescription;
- (PKCreditInstallmentPlanLineItem)initWithCoder:(id)a3;
- (PKCreditInstallmentPlanLineItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)state;
- (int64_t)type;
- (unint64_t)duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setPaymentsToDateAmount:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKCreditInstallmentPlanLineItem

- (PKCreditInstallmentPlanLineItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKCreditInstallmentPlanLineItem;
  v5 = [(PKCreditInstallmentPlanLineItem *)&v35 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v7 = v6;
    if (v6 != @"product")
    {
      if (v6)
      {
        char v8 = [(__CFString *)v6 isEqualToString:@"product"];

        if (v8) {
          goto LABEL_5;
        }
        v10 = v7;
        if (v10 == @"tax"
          || (v11 = v10,
              char v12 = [(__CFString *)v10 isEqualToString:@"tax"],
              v11,
              (v12 & 1) != 0))
        {
          uint64_t v9 = 2;
          goto LABEL_22;
        }
        v13 = v11;
        if (v13 == @"shipping"
          || (v14 = v13,
              char v15 = [(__CFString *)v13 isEqualToString:@"shipping"],
              v14,
              (v15 & 1) != 0))
        {
          uint64_t v9 = 3;
          goto LABEL_22;
        }
        v16 = v14;
        if (v16 == @"other"
          || (v17 = v16,
              char v18 = [(__CFString *)v16 isEqualToString:@"other"],
              v17,
              (v18 & 1) != 0))
        {
          uint64_t v9 = 4;
          goto LABEL_22;
        }
        v19 = v17;
        if (v19 == @"tradeIn"
          || (v20 = v19,
              char v21 = [(__CFString *)v19 isEqualToString:@"tradeIn"],
              v20,
              (v21 & 1) != 0))
        {
          uint64_t v9 = 5;
          goto LABEL_22;
        }
        v22 = v20;
        if (v22 == @"accessory"
          || (v23 = v22,
              int v24 = [(__CFString *)v22 isEqualToString:@"accessory"],
              v23,
              v24))
        {
          uint64_t v9 = 6;
          goto LABEL_22;
        }
      }
      uint64_t v9 = 0;
      goto LABEL_22;
    }
LABEL_5:
    uint64_t v9 = 1;
LABEL_22:

    v5->_type = v9;
    uint64_t v25 = [v4 PKDecimalNumberFromStringForKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v25;

    v5->_duration = [v4 PKIntegerForKey:@"duration"];
    uint64_t v27 = [v4 PKStringForKey:@"description"];
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v27;

    v29 = [v4 PKStringForKey:@"state"];
    v5->_state = PKInstallmentPlanStateFromString(v29);

    uint64_t v30 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v30;

    uint64_t v32 = [v4 PKDecimalNumberFromStringForKey:@"paymentsToDateAmount"];
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v32;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCreditInstallmentPlanLineItem *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditInstallmentPlanLineItem *)self isEqualToInstallmentPlanLineItem:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentPlanLineItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || self->_type != v4[1]) {
    goto LABEL_22;
  }
  amount = self->_amount;
  v7 = (NSDecimalNumber *)v5[2];
  if (amount && v7)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0) {
      goto LABEL_22;
    }
  }
  else if (amount != v7)
  {
    goto LABEL_22;
  }
  if (self->_duration != v5[3]) {
    goto LABEL_22;
  }
  char v8 = (void *)v5[4];
  uint64_t v9 = self->_itemDescription;
  v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    v11 = v10;
    if (!v9 || !v10) {
      goto LABEL_21;
    }
    BOOL v12 = [(NSString *)v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_22;
    }
  }
  if (self->_state != v5[5]) {
    goto LABEL_22;
  }
  v13 = (void *)v5[6];
  uint64_t v9 = self->_identifier;
  v14 = v13;
  if (v9 != v14)
  {
    v11 = v14;
    if (v9 && v14)
    {
      BOOL v15 = [(NSString *)v9 isEqualToString:v14];

      if (v15) {
        goto LABEL_25;
      }
LABEL_22:
      char v16 = 0;
      goto LABEL_23;
    }
LABEL_21:

    goto LABEL_22;
  }

LABEL_25:
  paymentsToDateAmount = self->_paymentsToDateAmount;
  v19 = (NSDecimalNumber *)v5[7];
  if (paymentsToDateAmount && v19) {
    char v16 = -[NSDecimalNumber isEqual:](paymentsToDateAmount, "isEqual:");
  }
  else {
    char v16 = paymentsToDateAmount == v19;
  }
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_itemDescription];
  [v3 safelyAddObject:self->_paymentsToDateAmount];
  [v3 safelyAddObject:self->_identifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_duration - v5 + 32 * v5;
  unint64_t v7 = self->_state - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"type: '%ld'; ", self->_type);
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  objc_msgSend(v3, "appendFormat:", @"duration: '%lu'; ", self->_duration);
  [v3 appendFormat:@"itemDescription: '%@'; ", self->_itemDescription];
  objc_msgSend(v3, "appendFormat:", @"state: '%ld'; ", self->_state);
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"paymentsToDateAmount: '%@'; ", self->_paymentsToDateAmount];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlanLineItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCreditInstallmentPlanLineItem;
  int64_t v5 = [(PKCreditInstallmentPlanLineItem *)&v15 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    v5->_duration = [v4 decodeIntegerForKey:@"duration"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    itemDescription = v5->_itemDescription;
    v5->_itemDescription = (NSString *)v8;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentsToDateAmount"];
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeInteger:self->_duration forKey:@"duration"];
  [v5 encodeObject:self->_itemDescription forKey:@"description"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_paymentsToDateAmount forKey:@"paymentsToDateAmount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  uint64_t v6 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = self->_duration;
  uint64_t v8 = [(NSString *)self->_itemDescription copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  v5[5] = self->_state;
  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_paymentsToDateAmount copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDecimalNumber)paymentsToDateAmount
{
  return self->_paymentsToDateAmount;
}

- (void)setPaymentsToDateAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentsToDateAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end