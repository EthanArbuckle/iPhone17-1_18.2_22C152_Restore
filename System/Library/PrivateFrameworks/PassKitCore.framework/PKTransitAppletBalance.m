@interface PKTransitAppletBalance
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrency;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBalance:(id)a3;
- (NSDate)expirationDate;
- (NSDecimalNumber)balance;
- (NSString)currency;
- (NSString)identifier;
- (PKTransitAppletBalance)initWithCoder:(id)a3;
- (PKTransitAppletBalance)initWithDictionary:(id)a3;
- (PKTransitAppletBalance)initWithIdentifier:(id)a3 balance:(id)a4 currency:(id)a5 exponent:(int64_t)a6 expirationDate:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)exponent;
- (unint64_t)hash;
- (void)_setIdentifierFromObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBalance:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExponent:(int64_t)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PKTransitAppletBalance

- (PKTransitAppletBalance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKTransitAppletBalance;
  v5 = [(PKTransitAppletBalance *)&v34 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [v4 objectForKeyedSubscript:@"BalanceIdentifier"];
    [(PKTransitAppletBalance *)v6 _setIdentifierFromObject:v7];

    v8 = [v4 objectForKeyedSubscript:@"Balance"];
    uint64_t v9 = [v8 copy];
    balance = v6->_balance;
    v6->_balance = (NSDecimalNumber *)v9;

    if (v6->_balance)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F28C28]);
        v12 = v6->_balance;
        if (v12)
        {
          [(NSDecimalNumber *)v12 decimalValue];
        }
        else
        {
          v32[0] = 0;
          v32[1] = 0;
          int v33 = 0;
        }
        uint64_t v13 = [v11 initWithDecimal:v32];
        v14 = v6->_balance;
        v6->_balance = (NSDecimalNumber *)v13;
      }
    }
    v15 = [v4 objectForKeyedSubscript:@"BalanceCurrency"];
    uint64_t v16 = [v15 copy];
    currency = v6->_currency;
    v6->_currency = (NSString *)v16;

    v18 = [v4 objectForKeyedSubscript:@"BalanceCurrencyExponent"];
    v6->_exponent = [v18 integerValue];

    v19 = [v4 objectForKeyedSubscript:@"BalanceExpirationDate"];
    if (([v19 isValidDate] & 1) == 0)
    {
      v20 = [v19 calendar];

      if (!v20)
      {
        v21 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
        [v19 setCalendar:v21];
      }
      v22 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      [v19 setTimeZone:v22];
    }
    uint64_t v23 = [v19 date];
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v23;

    if (!v19 && ![(PKTransitAppletBalance *)v6 isCurrency])
    {
      v25 = v6->_balance;
      v26 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v27 = [(NSDecimalNumber *)v25 compare:v26];

      if (!v27)
      {
        v28 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v29 = [v28 dateByAddingTimeInterval:86400.0];
        v30 = v6->_expirationDate;
        v6->_expirationDate = (NSDate *)v29;
      }
    }
  }
  return v6;
}

- (PKTransitAppletBalance)initWithIdentifier:(id)a3 balance:(id)a4 currency:(id)a5 exponent:(int64_t)a6 expirationDate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PKTransitAppletBalance;
  v17 = [(PKTransitAppletBalance *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    uint64_t v19 = [v14 copy];
    balance = v18->_balance;
    v18->_balance = (NSDecimalNumber *)v19;

    uint64_t v21 = [v15 copy];
    currency = v18->_currency;
    v18->_currency = (NSString *)v21;

    v18->_exponent = a6;
    uint64_t v23 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v24 = [v23 dateFromComponents:v16];
    expirationDate = v18->_expirationDate;
    v18->_expirationDate = (NSDate *)v24;
  }
  return v18;
}

- (void)_setIdentifierFromObject:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v6 hexEncoding];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v4 = (NSString *)v6;
  }
  identifier = self->_identifier;
  self->_identifier = v4;

LABEL_6:
}

- (BOOL)isCurrency
{
  currency = self->_currency;
  if (currency) {
    LOBYTE(currency) = ![(NSString *)currency isEqualToString:@"XXX"];
  }
  return (char)currency;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_balance copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_currency copyWithZone:a3];
  id v11 = (void *)v5[3];
  v5[3] = v10;

  v5[4] = self->_exponent;
  uint64_t v12 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  id v13 = (void *)v5[5];
  v5[5] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKTransitAppletBalance *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransitAppletBalance *)self isEqualToBalance:v5];

  return v6;
}

- (BOOL)isEqualToBalance:(id)a3
{
  id v4 = a3;
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
      goto LABEL_22;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_22;
  }
  balance = self->_balance;
  uint64_t v9 = (NSDecimalNumber *)v4[2];
  if (balance && v9)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0) {
      goto LABEL_22;
    }
  }
  else if (balance != v9)
  {
    goto LABEL_22;
  }
  if (self->_exponent != v4[4]) {
    goto LABEL_22;
  }
  currency = self->_currency;
  id v11 = (NSString *)v4[3];
  if (!currency || !v11)
  {
    if (currency == v11) {
      goto LABEL_18;
    }
LABEL_22:
    char v14 = 0;
    goto LABEL_23;
  }
  if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  expirationDate = self->_expirationDate;
  id v13 = (NSDate *)v4[5];
  if (expirationDate && v13) {
    char v14 = -[NSDate isEqual:](expirationDate, "isEqual:");
  }
  else {
    char v14 = expirationDate == v13;
  }
LABEL_23:

  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_balance];
  [v3 safelyAddObject:self->_currency];
  [v3 safelyAddObject:self->_expirationDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_exponent - v4 + 32 * v4;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_balance forKey:@"finalBalance"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeInteger:self->_exponent forKey:@"currencyExponent"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDateAndTime"];
}

- (PKTransitAppletBalance)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitAppletBalance;
  id v5 = [(PKTransitAppletBalance *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finalBalance"];
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v10;

    v5->_exponent = [v4 decodeIntegerForKey:@"currencyExponent"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDateAndTime"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = v3;
  if (self->_balance) {
    [v3 appendFormat:@"balance:%@ ", self->_balance];
  }
  if (self->_exponent) {
    objc_msgSend(v4, "appendFormat:", @"exponent:%ld ", self->_exponent);
  }
  if (self->_currency) {
    [v4 appendFormat:@"currency:%@ ", self->_currency];
  }
  if (self->_expirationDate) {
    [v4 appendFormat:@"expirationDate:%@ ", self->_expirationDate];
  }
  if (self->_identifier) {
    [v4 appendFormat:@"identifier:%@ ", self->_identifier];
  }
  uint64_t v5 = [v4 length];
  uint64_t v6 = NSString;
  uint64_t v7 = objc_opt_class();
  if (v5) {
    [v6 stringWithFormat:@"<%@: %p> {%@}", v7, self, v4];
  }
  else {
  uint64_t v8 = [v6 stringWithFormat:@"<%@: %p>", v7, self, v10];
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int64_t)a3
{
  self->_exponent = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end