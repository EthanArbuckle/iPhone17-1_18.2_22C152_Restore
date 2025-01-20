@interface PKNumericSuggestion
+ (id)suggestionWithTitle:(id)a3 value:(id)a4 currencyCode:(id)a5;
+ (id)suggestionWithValue:(id)a3 currencyCode:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)usedMaximumSuggestion;
- (NSDecimalNumber)value;
- (NSString)currencyDisplayValue;
- (NSString)displayValue;
- (NSString)title;
- (PKNumericSuggestion)initWithTitle:(id)a3 value:(id)a4 currencyCode:(id)a5;
- (PKNumericSuggestion)initWithValue:(id)a3 currencyCode:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)setDisplayValue:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsedMaximumSuggestion:(BOOL)a3;
@end

@implementation PKNumericSuggestion

+ (id)suggestionWithTitle:(id)a3 value:(id)a4 currencyCode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithTitle:v10 value:v9 currencyCode:v8];

  return v11;
}

+ (id)suggestionWithValue:(id)a3 currencyCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTitle:0 value:v7 currencyCode:v6];

  return v8;
}

- (PKNumericSuggestion)initWithValue:(id)a3 currencyCode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKNumericSuggestion;
  id v9 = [(PKNumericSuggestion *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    v10->_usedMaximumSuggestion = 0;
    v11 = [[PKCurrencyAmount alloc] initWithAmount:v7 currency:v8 exponent:0];
    uint64_t v12 = [(PKCurrencyAmount *)v11 minimalFormattedStringValue];
    displayValue = v10->_displayValue;
    v10->_displayValue = (NSString *)v12;

    objc_storeStrong((id *)&v10->_currencyDisplayValue, v10->_displayValue);
  }

  return v10;
}

- (PKNumericSuggestion)initWithTitle:(id)a3 value:(id)a4 currencyCode:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKNumericSuggestion;
  uint64_t v12 = [(PKNumericSuggestion *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    v13->_usedMaximumSuggestion = 0;
    v14 = [[PKCurrencyAmount alloc] initWithAmount:v10 currency:v11 exponent:0];
    objc_super v15 = [(PKCurrencyAmount *)v14 minimalFormattedStringValue];
    objc_storeStrong((id *)&v13->_currencyDisplayValue, v15);
    if (v9)
    {
      v16 = [NSString stringWithFormat:@"%@\n%@", v9, v15];
    }
    else
    {
      v16 = v15;
    }
    displayValue = v13->_displayValue;
    v13->_displayValue = v16;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  value = self->_value;
  id v6 = (NSDecimalNumber *)v4[3];
  if (!value || !v6)
  {
    if (value == v6) {
      goto LABEL_5;
    }
LABEL_9:
    char v9 = 0;
    goto LABEL_10;
  }
  if ((-[NSDecimalNumber isEqual:](value, "isEqual:") & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  title = self->_title;
  id v8 = (NSString *)v4[4];
  if (title && v8) {
    char v9 = -[NSString isEqual:](title, "isEqual:");
  }
  else {
    char v9 = title == v8;
  }
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_value];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"value: '%@'; ", self->_value];
  [v3 appendFormat:@"displayValue: '%@'; ", self->_displayValue];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (void)setDisplayValue:(id)a3
{
}

- (NSString)currencyDisplayValue
{
  return self->_currencyDisplayValue;
}

- (BOOL)usedMaximumSuggestion
{
  return self->_usedMaximumSuggestion;
}

- (void)setUsedMaximumSuggestion:(BOOL)a3
{
  self->_usedMaximumSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_currencyDisplayValue, 0);
}

@end