@interface PKTextfieldTableViewSettingsRowCurrencyFormatter
- (BOOL)isEqual:(id)a3;
- (PKTextfieldTableViewSettingsRowCurrencyFormatter)initWithCurrencyCode:(id)a3;
- (id)formattedValueFromInput:(id)a3;
- (id)numberFromInput:(id)a3;
- (id)submissionValueFromFormattedInput:(id)a3;
@end

@implementation PKTextfieldTableViewSettingsRowCurrencyFormatter

- (PKTextfieldTableViewSettingsRowCurrencyFormatter)initWithCurrencyCode:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKTextfieldTableViewSettingsRowCurrencyFormatter;
  v5 = [(PKTextfieldTableViewSettingsRowCurrencyFormatter *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    currencyFormatter = v5->_currencyFormatter;
    v5->_currencyFormatter = v9;

    [(NSNumberFormatter *)v5->_currencyFormatter setCurrencyCode:v5->_currencyCode];
    [(NSNumberFormatter *)v5->_currencyFormatter setNumberStyle:2];
    [(NSNumberFormatter *)v5->_currencyFormatter setMinimumFractionDigits:0];
    [(NSNumberFormatter *)v5->_currencyFormatter setLocale:v8];
    v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    amountFormatter = v5->_amountFormatter;
    v5->_amountFormatter = v11;

    v13 = v5->_amountFormatter;
    v14 = [NSNumber numberWithInt:0];
    [(NSNumberFormatter *)v13 setMinimum:v14];

    [(NSNumberFormatter *)v5->_amountFormatter setLocale:v8];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v16 = [(NSNumberFormatter *)v5->_currencyFormatter groupingSeparator];
    v17 = [(NSNumberFormatter *)v5->_currencyFormatter currencySymbol];
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, @" ", @" ", 0);

    [(PKTextFieldTableViewSettingsRowFormatter *)v5 setFormatPaddingCharacters:v18];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKTextfieldTableViewSettingsRowCurrencyFormatter *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (PKEqualObjects())
    {
      v9.receiver = self;
      v9.super_class = (Class)PKTextfieldTableViewSettingsRowCurrencyFormatter;
      BOOL v7 = [(PKTextFieldTableViewSettingsRowFormatter *)&v9 isEqual:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)formattedValueFromInput:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(PKTextfieldTableViewSettingsRowCurrencyFormatter *)self numberFromInput:v4];
    uint64_t v6 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:v5];

    id v4 = v6;
    BOOL v7 = v4;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)numberFromInput:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

    BOOL v7 = [(NSNumberFormatter *)self->_currencyFormatter groupingSeparator];
    v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:&stru_1EF1B5B50];

    objc_super v9 = [(NSNumberFormatter *)self->_currencyFormatter currencySymbol];
    id v4 = [v8 stringByReplacingOccurrencesOfString:v9 withString:&stru_1EF1B5B50];

    v10 = [(NSNumberFormatter *)self->_amountFormatter numberFromString:v4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)submissionValueFromFormattedInput:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKTextfieldTableViewSettingsRowCurrencyFormatter;
  id v4 = [(PKTextFieldTableViewSettingsRowFormatter *)&v8 submissionValueFromFormattedInput:a3];
  v5 = v4;
  if (self->_currencyFormatter)
  {
    uint64_t v6 = [v4 stringByApplyingTransform:*MEMORY[0x1E4F1C4E0] reverse:0];

    v5 = (void *)v6;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);

  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end