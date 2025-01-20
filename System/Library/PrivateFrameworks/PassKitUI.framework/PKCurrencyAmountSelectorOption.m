@interface PKCurrencyAmountSelectorOption
+ (id)cellReuseIdentifier;
- (BOOL)isCustomOption;
- (BOOL)isEqual:(id)a3;
- (BOOL)selected;
- (BOOL)shouldHighlight;
- (NSString)displayValue;
- (PKCurrencyAmount)currencyAmount;
- (PKCurrencyAmountSelectorOption)initWithCurrencyAmount:(id)a3 displayValue:(id)a4 customOption:(BOOL)a5 selected:(BOOL)a6;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (int64_t)compare:(id)a3;
- (int64_t)editingStyle;
- (unint64_t)hash;
@end

@implementation PKCurrencyAmountSelectorOption

- (PKCurrencyAmountSelectorOption)initWithCurrencyAmount:(id)a3 displayValue:(id)a4 customOption:(BOOL)a5 selected:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKCurrencyAmountSelectorOption;
  v13 = [(PKCurrencyAmountSelectorOption *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_currencyAmount, a3);
    uint64_t v15 = [v12 copy];
    displayValue = v14->_displayValue;
    v14->_displayValue = (NSString *)v15;

    v14->_isCustomOption = a5;
    v14->_selected = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKCurrencyAmountSelectorOption *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        if (PKEqualObjects())
        {
          displayValue = v6->_displayValue;
          v8 = self->_displayValue;
          v9 = displayValue;
          if (v8 == v9)
          {
          }
          else
          {
            v10 = v9;
            if (!v8 || !v9)
            {

              goto LABEL_16;
            }
            BOOL v11 = [(NSString *)v8 isEqualToString:v9];

            if (!v11) {
              goto LABEL_16;
            }
          }
          if (self->_isCustomOption == v6->_isCustomOption)
          {
            BOOL v12 = self->_selected == v6->_selected;
LABEL_17:

            goto LABEL_18;
          }
        }
LABEL_16:
        BOOL v12 = 0;
        goto LABEL_17;
      }
    }
    BOOL v12 = 0;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_displayValue];
  PKCombinedHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (int64_t)compare:(id)a3
{
  currencyAmount = self->_currencyAmount;
  id v4 = a3;
  v5 = [(PKCurrencyAmount *)currencyAmount amount];
  v6 = [v4 currencyAmount];

  v7 = [v6 amount];

  if (v5 == v7)
  {
    int64_t v8 = 0;
  }
  else if (v5)
  {
    if (v7) {
      int64_t v8 = [v5 compare:v7];
    }
    else {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

+ (id)cellReuseIdentifier
{
  return @"SpendLimitOptionCellReuseIdentifier";
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(id)objc_opt_class() cellReuseIdentifier];
  v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  v10 = [v9 defaultContentConfiguration];
  BOOL v11 = [(PKCurrencyAmountSelectorOption *)self displayValue];
  [v10 setText:v11];

  [v9 setContentConfiguration:v10];
  if (self->_selected) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }
  [v9 setAccessoryType:v12];
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];

  return v9;
}

- (BOOL)shouldHighlight
{
  return 1;
}

- (int64_t)editingStyle
{
  return self->_isCustomOption;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (BOOL)isCustomOption
{
  return self->_isCustomOption;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayValue, 0);

  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end