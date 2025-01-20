@interface PKTransactionReceiptSummaryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransactionReceiptSummaryItem:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)label;
- (PKCurrencyAmount)currencyAmount;
- (PKTransactionReceiptSummaryItem)initWithCoder:(id)a3;
- (PKTransactionReceiptSummaryItem)initWithDictionary:(id)a3 bundle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setLabel:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKTransactionReceiptSummaryItem

- (PKTransactionReceiptSummaryItem)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PKTransactionReceiptSummaryItem;
  v8 = [(PKTransactionReceiptSummaryItem *)&v31 init];
  if (!v8) {
    goto LABEL_19;
  }
  v9 = [v6 PKStringForKey:@"type"];
  v10 = v9;
  if (v9 == @"tax") {
    goto LABEL_5;
  }
  if (!v9)
  {
LABEL_15:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  char v11 = [(__CFString *)v9 isEqualToString:@"tax"];

  if ((v11 & 1) == 0)
  {
    v13 = v10;
    if (v13 == @"shipping"
      || (v14 = v13,
          char v15 = [(__CFString *)v13 isEqualToString:@"shipping"],
          v14,
          (v15 & 1) != 0))
    {
      uint64_t v12 = 2;
      goto LABEL_16;
    }
    v16 = v14;
    if (v16 == @"fee"
      || (v17 = v16,
          char v18 = [(__CFString *)v16 isEqualToString:@"fee"],
          v17,
          (v18 & 1) != 0))
    {
      uint64_t v12 = 3;
      goto LABEL_16;
    }
    v19 = v17;
    if (v19 == @"credit"
      || (v20 = v19,
          int v21 = [(__CFString *)v19 isEqualToString:@"credit"],
          v20,
          v21))
    {
      uint64_t v12 = 4;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v12 = 1;
LABEL_16:

  v8->_type = v12;
  v22 = [v6 PKStringForKey:@"itemDescription"];
  v23 = v22;
  if (v22)
  {
    uint64_t v24 = PKLocalizedReceiptStringForReceiptBundle(v22, v7);
    label = v8->_label;
    v8->_label = (NSString *)v24;
  }
  uint64_t v26 = [v6 PKDecimalNumberFromStringForKey:@"amount"];
  amount = v8->_amount;
  v8->_amount = (NSDecimalNumber *)v26;

  uint64_t v28 = [v6 PKStringForKey:@"currencyCode"];
  currencyCode = v8->_currencyCode;
  v8->_currencyCode = (NSString *)v28;

LABEL_19:
  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [NSNumber numberWithInteger:self->_type];
  [v3 appendFormat:@"type: '%@'; ", v4];

  [v3 appendFormat:@"label: '%@'; ", self->_label];
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  [v3 appendFormat:@">"];
  v5 = (void *)[v3 copy];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKTransactionReceiptSummaryItem *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionReceiptSummaryItem *)self isEqualToTransactionReceiptSummaryItem:v5];

  return v6;
}

- (BOOL)isEqualToTransactionReceiptSummaryItem:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4 && self->_type == v4[1])
  {
    BOOL v6 = (void *)v4[2];
    id v7 = self->_label;
    v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
LABEL_20:

        goto LABEL_18;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_18;
      }
    }
    amount = self->_amount;
    uint64_t v12 = (NSDecimalNumber *)v5[3];
    if (amount && v12)
    {
      if (-[NSDecimalNumber isEqual:](amount, "isEqual:")) {
        goto LABEL_12;
      }
    }
    else if (amount == v12)
    {
LABEL_12:
      currencyCode = self->_currencyCode;
      v14 = (void *)v5[4];
      id v7 = currencyCode;
      char v15 = v14;
      if (v7 == v15)
      {
        LOBYTE(v10) = 1;
        v9 = v7;
      }
      else
      {
        v9 = v15;
        LOBYTE(v10) = 0;
        if (v7 && v15) {
          LOBYTE(v10) = [(NSString *)v7 isEqualToString:v15];
        }
      }
      goto LABEL_20;
    }
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_label];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_currencyCode];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReceiptSummaryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionReceiptSummaryItem;
  unint64_t v5 = [(PKTransactionReceiptSummaryItem *)&v13 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemDescription"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_label forKey:@"itemDescription"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_currencyCode copyWithZone:a3];
  char v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (PKCurrencyAmount)currencyAmount
{
  amount = self->_amount;
  if (amount)
  {
    currencyCode = self->_currencyCode;
    if (currencyCode)
    {
      PKCurrencyAmountCreate(amount, currencyCode, 0);
      amount = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      amount = 0;
    }
  }
  return (PKCurrencyAmount *)amount;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
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
  objc_storeStrong((id *)&self->_label, 0);
}

@end