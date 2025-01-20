@interface PKPayLaterAccountUserInfoValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasHiddenValue;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)odiAttribute;
- (NSString)text;
- (PKCurrencyAmount)currencyAmount;
- (PKPayLaterAccountUserInfoValue)initWithCoder:(id)a3;
- (PKPayLaterAccountUserInfoValue)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setDate:(id)a3;
- (void)setHasHiddenValue:(BOOL)a3;
- (void)setOdiAttribute:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PKPayLaterAccountUserInfoValue

- (PKPayLaterAccountUserInfoValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterAccountUserInfoValue;
  v5 = [(PKPayLaterAccountUserInfoValue *)&v13 init];
  if (v5)
  {
    v6 = [v4 PKDateForKey:@"text"];
    if (v6) {
      objc_storeStrong((id *)&v5->_date, v6);
    }
    v7 = [v4 PKStringForKey:@"text"];
    if (v7) {
      objc_storeStrong((id *)&v5->_text, v7);
    }
    uint64_t v8 = [v4 PKCurrencyAmountForKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"odiAttribute"];
    odiAttribute = v5->_odiAttribute;
    v5->_odiAttribute = (NSString *)v10;

    v5->_hasHiddenValue = [v4 PKBoolForKey:@"hasHiddenValue"];
  }

  return v5;
}

- (NSString)text
{
  text = self->_text;
  if (text)
  {
    v3 = text;
LABEL_5:
    v6 = v3;
    goto LABEL_6;
  }
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    v3 = [(PKCurrencyAmount *)currencyAmount formattedStringValue];
    goto LABEL_5;
  }
  if (self->_date)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [v8 setCalendar:v9];

    [v8 setDateStyle:1];
    v6 = [v8 stringFromDate:self->_date];
  }
  else
  {
    v6 = 0;
  }
LABEL_6:
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountUserInfoValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterAccountUserInfoValue;
  v5 = [(PKPayLaterAccountUserInfoValue *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAttribute"];
    odiAttribute = v5->_odiAttribute;
    v5->_odiAttribute = (NSString *)v12;

    v5->_hasHiddenValue = [v4 decodeBoolForKey:@"hasHiddenValue"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_odiAttribute forKey:@"odiAttribute"];
  [v5 encodeBool:self->_hasHiddenValue forKey:@"hasHiddenValue"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PKPayLaterAccountUserInfoValue *)self text];
    uint64_t v6 = [v4 text];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      if (!v7 || !v8)
      {

        goto LABEL_28;
      }
      int v10 = [v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_28;
      }
    }
    date = self->_date;
    objc_super v13 = (NSDate *)*((void *)v4 + 3);
    if (date && v13)
    {
      if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0) {
        goto LABEL_28;
      }
    }
    else if (date != v13)
    {
      goto LABEL_28;
    }
    currencyAmount = self->_currencyAmount;
    objc_super v15 = (PKCurrencyAmount *)*((void *)v4 + 4);
    if (currencyAmount && v15)
    {
      if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
        goto LABEL_28;
      }
    }
    else if (currencyAmount != v15)
    {
      goto LABEL_28;
    }
    v16 = (void *)*((void *)v4 + 5);
    v17 = self->_odiAttribute;
    v18 = v16;
    if (v17 == v18)
    {

      goto LABEL_26;
    }
    v19 = v18;
    if (v17 && v18)
    {
      BOOL v20 = [(NSString *)v17 isEqualToString:v18];

      if (!v20) {
        goto LABEL_28;
      }
LABEL_26:
      BOOL v11 = self->_hasHiddenValue == v4[8];
LABEL_29:

      goto LABEL_30;
    }

LABEL_28:
    BOOL v11 = 0;
    goto LABEL_29;
  }
  BOOL v11 = 0;
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_text];
  [v3 safelyAddObject:self->_date];
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_odiAttribute];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_hasHiddenValue - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"text: '%@'; ", self->_text];
  uint64_t v4 = [(NSDate *)self->_date description];
  [v3 appendFormat:@"date: '%@'; ", v4];

  unint64_t v5 = [(PKCurrencyAmount *)self->_currencyAmount formattedStringValue];
  [v3 appendFormat:@"currencyAmount: '%@'; ", v5];

  [v3 appendFormat:@"odiAttribute: '%@'; ", self->_odiAttribute];
  if (self->_hasHiddenValue) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"hasHiddenValue: '%@'; ", v6];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPayLaterAccountUserInfoValue allocWithZone:](PKPayLaterAccountUserInfoValue, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  text = v5->_text;
  v5->_text = (NSString *)v6;

  uint64_t v8 = [(NSDate *)self->_date copyWithZone:a3];
  date = v5->_date;
  v5->_date = (NSDate *)v8;

  int v10 = [(PKCurrencyAmount *)self->_currencyAmount copyWithZone:a3];
  currencyAmount = v5->_currencyAmount;
  v5->_currencyAmount = v10;

  uint64_t v12 = [(NSString *)self->_odiAttribute copyWithZone:a3];
  odiAttribute = v5->_odiAttribute;
  v5->_odiAttribute = (NSString *)v12;

  v5->_hasHiddenValue = self->_hasHiddenValue;
  return v5;
}

- (void)setText:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (NSString)odiAttribute
{
  return self->_odiAttribute;
}

- (void)setOdiAttribute:(id)a3
{
}

- (BOOL)hasHiddenValue
{
  return self->_hasHiddenValue;
}

- (void)setHasHiddenValue:(BOOL)a3
{
  self->_hasHiddenValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAttribute, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end