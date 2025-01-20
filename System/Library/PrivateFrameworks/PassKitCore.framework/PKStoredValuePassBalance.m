@interface PKStoredValuePassBalance
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrencyBalance;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBalance:(PKStoredValuePassBalance *)balance;
- (BOOL)isExpired;
- (NSDate)expiryDate;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)identifier;
- (PKStoredValuePassBalance)initWithCoder:(id)a3;
- (PKStoredValuePassBalance)initWithCurrencyAmount:(id)a3;
- (PKStoredValuePassBalance)initWithIdentifier:(id)a3 amount:(id)a4 balanceType:(id)a5 expiryDate:(id)a6;
- (PKStoredValuePassBalance)initWithIdentifier:(id)a3 cashAmount:(id)a4 currencyCode:(id)a5 expiryDate:(id)a6;
- (PKStoredValuePassBalance)initWithTransitAppletBalance:(id)a3 balanceField:(id)a4;
- (PKStoredValuePassBalanceType)balanceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PKStoredValuePassBalance

- (PKStoredValuePassBalance)initWithCurrencyAmount:(id)a3
{
  id v4 = a3;
  v5 = [v4 amount];
  v6 = [v4 currency];

  v7 = 0;
  if (v5 && v6)
  {
    self = [(PKStoredValuePassBalance *)self initWithIdentifier:0 cashAmount:v5 currencyCode:v6 expiryDate:0];
    v7 = self;
  }

  return v7;
}

- (PKStoredValuePassBalance)initWithIdentifier:(id)a3 cashAmount:(id)a4 currencyCode:(id)a5 expiryDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKStoredValuePassBalance;
  v14 = [(PKStoredValuePassBalance *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_amount, a4);
    uint64_t v17 = [v12 copy];
    currencyCode = v14->_currencyCode;
    v14->_currencyCode = (NSString *)v17;

    balanceType = v14->_balanceType;
    v14->_balanceType = (NSString *)@"com.apple.wallet.storedvaluepassbalancetype.cash";

    objc_storeStrong((id *)&v14->_expiryDate, a6);
  }

  return v14;
}

- (PKStoredValuePassBalance)initWithTransitAppletBalance:(id)a3 balanceField:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 currency];
  uint64_t v9 = [v6 balance];
  id v10 = (void *)v9;
  id v11 = 0;
  if (v8 && v9)
  {
    id v12 = [v6 currency];
    int v13 = [v12 isEqualToString:@"XXX"];

    if (v13)
    {
      if ((unint64_t)([v7 unitType] + 1) >= 4) {
        v14 = @"com.apple.wallet.storedvaluepassbalancetype.loyaltypoints";
      }
      else {
        v14 = @"com.apple.wallet.storedvaluepassbalancetype.unknown";
      }
      uint64_t v15 = v14;
      v16 = [v6 identifier];
      uint64_t v17 = [v6 balance];
      v18 = [v6 expirationDate];
      v19 = [(PKStoredValuePassBalance *)self initWithIdentifier:v16 amount:v17 balanceType:v15 expiryDate:v18];

      self = v19;
    }
    else
    {
      v16 = [v6 identifier];
      uint64_t v17 = [v6 balance];
      v18 = [v6 currency];
      v20 = [v6 expirationDate];
      self = [(PKStoredValuePassBalance *)self initWithIdentifier:v16 cashAmount:v17 currencyCode:v18 expiryDate:v20];
    }
    id v11 = self;
  }

  return v11;
}

- (PKStoredValuePassBalance)initWithIdentifier:(id)a3 amount:(id)a4 balanceType:(id)a5 expiryDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKStoredValuePassBalance;
  v14 = [(PKStoredValuePassBalance *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_amount, a4);
    currencyCode = v14->_currencyCode;
    v14->_currencyCode = 0;

    uint64_t v18 = [v12 copy];
    balanceType = v14->_balanceType;
    v14->_balanceType = (NSString *)v18;

    objc_storeStrong((id *)&v14->_expiryDate, a6);
  }

  return v14;
}

- (PKStoredValuePassBalance)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKStoredValuePassBalance;
  v5 = [(PKStoredValuePassBalance *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balanceType"];
    balanceType = v5->_balanceType;
    v5->_balanceType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v14;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKStoredValuePassBalance *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKStoredValuePassBalance *)self isEqualToBalance:v5];

  return v6;
}

- (BOOL)isEqualToBalance:(PKStoredValuePassBalance *)balance
{
  id v4 = balance;
  amount = self->_amount;
  BOOL v6 = v4->_amount;
  if (amount) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (amount != v6) {
      goto LABEL_26;
    }
  }
  else
  {
    char v8 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_26;
    }
  }
  currencyCode = self->_currencyCode;
  uint64_t v10 = v4->_currencyCode;
  if (currencyCode && v10)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (currencyCode != v10)
  {
    goto LABEL_26;
  }
  balanceType = v4->_balanceType;
  uint64_t v12 = self->_balanceType;
  id v13 = balanceType;
  if (v12 == v13)
  {
  }
  else
  {
    uint64_t v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_26;
    }
    BOOL v15 = [(NSString *)v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_26;
    }
  }
  expiryDate = self->_expiryDate;
  objc_super v17 = v4->_expiryDate;
  if (expiryDate && v17)
  {
    if (-[NSDate isEqual:](expiryDate, "isEqual:")) {
      goto LABEL_28;
    }
LABEL_26:
    char v18 = 0;
    goto LABEL_27;
  }
  if (expiryDate != v17) {
    goto LABEL_26;
  }
LABEL_28:
  identifier = self->_identifier;
  objc_super v21 = v4->_identifier;
  if (identifier && v21) {
    char v18 = -[NSString isEqual:](identifier, "isEqual:");
  }
  else {
    char v18 = identifier == v21;
  }
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_balanceType];
  [v3 safelyAddObject:self->_expiryDate];
  [v3 safelyAddObject:self->_identifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_balanceType forKey:@"balanceType"];
  [v5 encodeObject:self->_expiryDate forKey:@"expiryDate"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (BOOL)isExpired
{
  if (!self->_expiryDate) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [v3 compare:self->_expiryDate] != -1;

  return v4;
}

- (BOOL)isCurrencyBalance
{
  return self->_currencyCode != 0;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (PKStoredValuePassBalanceType)balanceType
{
  return self->_balanceType;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_balanceType, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end