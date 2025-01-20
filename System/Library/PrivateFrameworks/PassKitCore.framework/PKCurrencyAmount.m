@interface PKCurrencyAmount
+ (BOOL)supportsSecureCoding;
+ (id)maximumCurrencyAmount:(id)a3 otherCurrencyAmount:(id)a4;
+ (id)minimumCurrencyAmount:(id)a3 otherCurrencyAmount:(id)a4;
- (BOOL)currencyAmountEqualToCurrencyAmount:(id)a3;
- (BOOL)currencyAmountGreaterThanCurrencyAmount:(id)a3;
- (BOOL)currencyAmountLessThanCurrencyAmount:(id)a3;
- (BOOL)isCurrency;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCurrencyAmount:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)currency;
- (NSString)preformattedString;
- (PKCurrencyAmount)initWithAmount:(id)a3 currency:(id)a4;
- (PKCurrencyAmount)initWithAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5;
- (PKCurrencyAmount)initWithAmount:(id)a3 exponent:(int64_t)a4 preformattedString:(id)a5;
- (PKCurrencyAmount)initWithCoder:(id)a3;
- (PKCurrencyAmount)initWithDictionary:(id)a3;
- (id)absoluteValue;
- (id)amountByConvertingToSmallestCommonCurrencyUnit;
- (id)currencyAmountByAddingCurrencyAmount:(id)a3;
- (id)currencyAmountBySubtractingCurrencyAmount:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedStringValue;
- (id)minimalFormattedStringValue;
- (id)minimalFormattedStringValueInLocale:(id)a3;
- (id)negativeValue;
- (int64_t)compareToCurrencyCode:(id)a3 amount:(id)a4;
- (int64_t)exponent;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setExponent:(int64_t)a3;
- (void)setPreformattedString:(id)a3;
@end

@implementation PKCurrencyAmount

- (int64_t)compareToCurrencyCode:(id)a3 amount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKCurrencyAmount *)self currency];
  uint64_t v9 = [v8 caseInsensitiveCompare:v7];

  if (v9)
  {
    int64_t v10 = -1;
  }
  else
  {
    v11 = [(PKCurrencyAmount *)self amount];
    int64_t v10 = [v11 compare:v6];
  }
  return v10;
}

- (PKCurrencyAmount)initWithAmount:(id)a3 currency:(id)a4
{
  return [(PKCurrencyAmount *)self initWithAmount:a3 currency:a4 exponent:0];
}

- (PKCurrencyAmount)initWithAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKCurrencyAmount;
    v12 = [(PKCurrencyAmount *)&v18 init];
    if (v12)
    {
      uint64_t v13 = [v8 copy];
      amount = v12->_amount;
      v12->_amount = (NSDecimalNumber *)v13;

      uint64_t v15 = [v10 copy];
      currency = v12->_currency;
      v12->_currency = (NSString *)v15;

      v12->_exponent = a5;
    }
    self = v12;
    v11 = self;
  }

  return v11;
}

- (PKCurrencyAmount)initWithAmount:(id)a3 exponent:(int64_t)a4 preformattedString:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  int64_t v10 = 0;
  if (a3 && v8)
  {
    v11 = [(PKCurrencyAmount *)self initWithAmount:a3 currency:@"XXX" exponent:a4];
    if (v11)
    {
      uint64_t v12 = [v9 copy];
      preformattedString = v11->_preformattedString;
      v11->_preformattedString = (NSString *)v12;
    }
    self = v11;
    int64_t v10 = self;
  }

  return v10;
}

- (PKCurrencyAmount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (unint64_t)[v4 count] >= 2)
  {
    id v7 = [v5 PKDecimalNumberFromStringForKey:@"amount"];
    id v8 = [v5 PKStringForKey:@"currencyCode"];
    id v9 = v8;
    if (v8)
    {
      int64_t v10 = v8;
    }
    else
    {
      int64_t v10 = [v5 PKStringForKey:@"currency"];
    }
    v11 = v10;

    id v6 = 0;
    if (v7 && v11)
    {
      PKCurrencyAmountCreate(v7, v11, 0);
      id v6 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCurrencyAmount *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCurrencyAmount *)self isEqualToCurrencyAmount:v5];

  return v6;
}

- (BOOL)isEqualToCurrencyAmount:(id)a3
{
  id v4 = a3;
  amount = self->_amount;
  BOOL v6 = (NSDecimalNumber *)v4[1];
  if (amount) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (amount != v6)
    {
LABEL_20:
      char v16 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    char v8 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_20;
    }
  }
  if (self->_exponent != v4[3]) {
    goto LABEL_20;
  }
  id v9 = (void *)v4[4];
  int64_t v10 = self->_preformattedString;
  v11 = v9;
  if (v10 == v11)
  {

    goto LABEL_16;
  }
  uint64_t v12 = v11;
  if (!v10 || !v11)
  {

    goto LABEL_20;
  }
  BOOL v13 = [(NSString *)v10 isEqualToString:v11];

  if (!v13) {
    goto LABEL_20;
  }
LABEL_16:
  currency = self->_currency;
  uint64_t v15 = (NSString *)v4[2];
  if (currency && v15) {
    char v16 = -[NSString isEqual:](currency, "isEqual:");
  }
  else {
    char v16 = currency == v15;
  }
LABEL_21:

  return v16;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_currency];
  [v3 safelyAddObject:self->_preformattedString];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_exponent - v4 + 32 * v4;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeInteger:self->_exponent forKey:@"exponent"];
  [v5 encodeObject:self->_preformattedString forKey:@"preformattedString"];
}

- (PKCurrencyAmount)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCurrencyAmount;
  id v5 = [(PKCurrencyAmount *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v5->_exponent = [v4 decodeIntegerForKey:@"exponent"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preformattedString"];
    preformattedString = v5->_preformattedString;
    v5->_preformattedString = (NSString *)v10;

    if (!v5->_amount || !v5->_currency && !v5->_preformattedString)
    {

      id v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"currency: %@; ", self->_currency];
  [v3 appendFormat:@"amount: %@; ", self->_amount];
  objc_msgSend(v3, "appendFormat:", @"exponent: %ld; ", self->_exponent);
  [v3 appendFormat:@"preformatted string: %@; ", self->_preformattedString];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)formattedStringValue
{
  preformattedString = self->_preformattedString;
  if (preformattedString)
  {
    v3 = preformattedString;
  }
  else if (self->_currency && self->_amount)
  {
    BOOL v5 = [(PKCurrencyAmount *)self isCurrency];
    amount = self->_amount;
    if (v5) {
      PKFormattedCurrencyStringFromNumber(amount, self->_currency);
    }
    else {
      PKFormattedStringMinimalFractionDigitsFromNumber(amount, self->_exponent);
    }
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)minimalFormattedStringValue
{
  return [(PKCurrencyAmount *)self minimalFormattedStringValueInLocale:0];
}

- (BOOL)isCurrency
{
  currency = self->_currency;
  if (currency) {
    LOBYTE(currency) = ![(NSString *)currency isEqualToString:@"XXX"];
  }
  return (char)currency;
}

- (id)minimalFormattedStringValueInLocale:(id)a3
{
  id v4 = a3;
  preformattedString = self->_preformattedString;
  if (preformattedString)
  {
    uint64_t v6 = preformattedString;
LABEL_3:
    BOOL v7 = v6;
    goto LABEL_15;
  }
  if (self->_currency)
  {
    amount = self->_amount;
    if (amount)
    {
      int v9 = [(NSDecimalNumber *)amount pk_isIntegralNumber];
      if (v4)
      {
        if (v9) {
          PKMutableNumberFormatterWithMinimalFractionDigitsForCurrencyCode(self->_currency);
        }
        else {
        v11 = PKMutableNumberFormatterForCurrencyCode(self->_currency);
        }
        [v11 setLocale:v4];
        BOOL v7 = [v11 stringFromNumber:self->_amount];

        goto LABEL_15;
      }
      currency = self->_currency;
      if (v9) {
        PKFormattedCurrencyStringWithMinimalFractionDigitsFromNumber(self->_amount, currency);
      }
      else {
        PKFormattedCurrencyStringFromNumber(self->_amount, currency);
      }
      uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  BOOL v7 = 0;
LABEL_15:

  return v7;
}

- (id)dictionaryRepresentation
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"amount";
  v3 = [(NSDecimalNumber *)self->_amount stringValue];
  v6[1] = @"currency";
  v7[0] = v3;
  v7[1] = self->_currency;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)absoluteValue
{
  v3 = [(NSDecimalNumber *)self->_amount pk_absoluteValue];
  preformattedString = self->_preformattedString;
  BOOL v5 = [PKCurrencyAmount alloc];
  if (preformattedString) {
    uint64_t v6 = [(PKCurrencyAmount *)v5 initWithAmount:v3 exponent:self->_exponent preformattedString:self->_preformattedString];
  }
  else {
    uint64_t v6 = [(PKCurrencyAmount *)v5 initWithAmount:v3 currency:self->_currency exponent:self->_exponent];
  }
  BOOL v7 = (void *)v6;

  return v7;
}

- (id)negativeValue
{
  v3 = [(NSDecimalNumber *)self->_amount pk_negativeValue];
  preformattedString = self->_preformattedString;
  BOOL v5 = [PKCurrencyAmount alloc];
  if (preformattedString) {
    uint64_t v6 = [(PKCurrencyAmount *)v5 initWithAmount:v3 exponent:self->_exponent preformattedString:self->_preformattedString];
  }
  else {
    uint64_t v6 = [(PKCurrencyAmount *)v5 initWithAmount:v3 currency:self->_currency exponent:self->_exponent];
  }
  BOOL v7 = (void *)v6;

  return v7;
}

- (id)currencyAmountByAddingCurrencyAmount:(id)a3
{
  id v4 = a3;
  currency = self->_currency;
  uint64_t v6 = [v4 currency];
  BOOL v7 = currency;
  uint64_t v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  int v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {

    v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  int v12 = [(NSDecimalNumber *)v7 isEqualToString:v8];

  if (v12)
  {
LABEL_10:
    amount = self->_amount;
    v14 = [v4 amount];
    int v9 = [(NSDecimalNumber *)amount decimalNumberByAdding:v14];

    v11 = PKCurrencyAmountCreate(v9, self->_currency, 0);
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)currencyAmountBySubtractingCurrencyAmount:(id)a3
{
  id v4 = a3;
  currency = self->_currency;
  uint64_t v6 = [v4 currency];
  BOOL v7 = currency;
  uint64_t v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  int v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {

    v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  int v12 = [(NSDecimalNumber *)v7 isEqualToString:v8];

  if (v12)
  {
LABEL_10:
    amount = self->_amount;
    v14 = [v4 amount];
    int v9 = [(NSDecimalNumber *)amount decimalNumberBySubtracting:v14];

    v11 = PKCurrencyAmountCreate(v9, self->_currency, 0);
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (id)minimumCurrencyAmount:(id)a3 otherCurrencyAmount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 currency];
  uint64_t v8 = [v6 currency];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  v11 = v10;
  if (v9 && v10)
  {
    char v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_7:
    objc_super v13 = [v5 amount];
    v14 = [v6 amount];
    uint64_t v15 = [v13 compare:v14];

    if (v15 == -1) {
      id v16 = v5;
    }
    else {
      id v16 = v6;
    }
    v17 = v16;
    goto LABEL_13;
  }

LABEL_10:
  v17 = 0;
LABEL_13:

  return v17;
}

+ (id)maximumCurrencyAmount:(id)a3 otherCurrencyAmount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 currency];
  uint64_t v8 = [v6 currency];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  v11 = v10;
  if (v9 && v10)
  {
    char v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_7:
    objc_super v13 = [v5 amount];
    v14 = [v6 amount];
    uint64_t v15 = [v13 compare:v14];

    if (v15 == 1) {
      id v16 = v5;
    }
    else {
      id v16 = v6;
    }
    v17 = v16;
    goto LABEL_13;
  }

LABEL_10:
  v17 = 0;
LABEL_13:

  return v17;
}

- (id)amountByConvertingToSmallestCommonCurrencyUnit
{
  if ([(PKCurrencyAmount *)self isCurrency])
  {
    __int16 v3 = PKDefaultFractionDigitsForCurrencyCode(self->_currency);
    id v4 = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:0 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    id v5 = [(NSDecimalNumber *)self->_amount decimalNumberByMultiplyingByPowerOf10:(__int16)(LOWORD(self->_exponent) + v3) withBehavior:v4];
    id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)currencyAmountLessThanCurrencyAmount:(id)a3
{
  id v4 = a3;
  currency = self->_currency;
  id v6 = [v4 currency];
  BOOL v7 = currency;
  uint64_t v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    id v9 = [v4 amount];
    BOOL v11 = [(NSDecimalNumber *)amount compare:v9] == NSOrderedAscending;
    goto LABEL_11;
  }
  id v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    BOOL v12 = [(NSString *)v7 isEqualToString:v8];

    if (!v12)
    {
      BOOL v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  BOOL v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (BOOL)currencyAmountGreaterThanCurrencyAmount:(id)a3
{
  id v4 = a3;
  currency = self->_currency;
  id v6 = [v4 currency];
  BOOL v7 = currency;
  uint64_t v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    id v9 = [v4 amount];
    BOOL v11 = [(NSDecimalNumber *)amount compare:v9] == NSOrderedDescending;
    goto LABEL_11;
  }
  id v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    BOOL v12 = [(NSString *)v7 isEqualToString:v8];

    if (!v12)
    {
      BOOL v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  BOOL v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (BOOL)currencyAmountEqualToCurrencyAmount:(id)a3
{
  id v4 = a3;
  currency = self->_currency;
  id v6 = [v4 currency];
  BOOL v7 = currency;
  uint64_t v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    id v9 = [v4 amount];
    BOOL v11 = [(NSDecimalNumber *)amount compare:v9] == NSOrderedSame;
    goto LABEL_11;
  }
  id v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    BOOL v12 = [(NSString *)v7 isEqualToString:v8];

    if (!v12)
    {
      BOOL v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  BOOL v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
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

- (NSString)preformattedString
{
  return self->_preformattedString;
}

- (void)setPreformattedString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preformattedString, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end