@interface PKPaymentSetupFieldText
+ (id)readOnlyPaymentSetupFieldWithDisplayName:(id)a3 value:(id)a4;
- (BOOL)hasDisplayFormat;
- (BOOL)isNumeric;
- (BOOL)isNumericFractional;
- (BOOL)isSecureText;
- (BOOL)isSecureVisibleText;
- (BOOL)keepPaddingCharactersForSubmission;
- (BOOL)submissionStringMeetsAllRequirements;
- (BOOL)submissionStringMeetsValidationRegex;
- (BOOL)useLuhnCheck;
- (NSArray)keyboardAccessories;
- (NSArray)paddingCharacters;
- (NSCharacterSet)allowedCharacters;
- (NSRegularExpression)validationRegex;
- (NSString)currencyCode;
- (NSString)displayFormatPlaceholder;
- (PKPaymentSetupFieldText)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)_allowedCharacters;
- (id)_amountFormatter;
- (id)_currencyFormatter;
- (id)_stringByApplyingCurrencyFormatter:(id)a3 allowPartialFractional:(BOOL)a4;
- (id)_stringByApplyingNumericFractionalFormat:(id)a3;
- (id)_submissionStringForValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decimalSeparator;
- (id)displayFormatPaddingCharacters;
- (id)displayString;
- (id)stringByApplyingDisplayFormat:(id)a3;
- (id)stringByApplyingDisplayFormat:(id)a3 allowPartialFractional:(BOOL)a4;
- (int64_t)codeOnError;
- (unint64_t)alignment;
- (unint64_t)fieldType;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (void)setAlignment:(unint64_t)a3;
- (void)setAllowedCharacters:(id)a3;
- (void)setCodeOnError:(int64_t)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDisplayFormatPlaceholder:(id)a3;
- (void)setKeepPaddingCharactersForSubmission:(BOOL)a3;
- (void)setKeyboardAccessories:(id)a3;
- (void)setLuhnCheck:(BOOL)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
- (void)setNumeric:(BOOL)a3;
- (void)setNumericFractional:(BOOL)a3;
- (void)setPaddingCharacters:(id)a3;
- (void)setSecureText:(BOOL)a3;
- (void)setSecureVisibleText:(BOOL)a3;
- (void)setValidationRegex:(id)a3;
- (void)updateDisplayFormat:(id)a3;
- (void)updateWithAttribute:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PKPaymentSetupFieldText

- (PKPaymentSetupFieldText)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupFieldText;
  result = [(PKPaymentSetupField *)&v5 initWithIdentifier:a3 type:a4];
  if (result)
  {
    result->_minLength = 0;
    result->_maxLength = 0;
    result->_secureText = 1;
    result->_secureVisibleText = 1;
    result->_numeric = 0;
    result->_numericFractional = 0;
    result->_luhnCheck = 0;
    result->_keepPaddingCharactersForSubmission = 0;
    result->_alignment = 0;
    result->_codeOnError = 0;
  }
  return result;
}

+ (id)readOnlyPaymentSetupFieldWithDisplayName:(id)a3 value:(id)a4
{
  objc_super v5 = a4;
  id v6 = a3;
  v7 = [[PKPaymentSetupFieldText alloc] initWithIdentifier:v6 type:1];
  [(PKPaymentSetupField *)v7 setLocalizedDisplayName:v6];

  currentValue = v7->super._currentValue;
  v7->super._currentValue = v5;

  [(PKPaymentSetupField *)v7 setReadonly:1];
  return v7;
}

- (void)setCurrentValue:(id)a3
{
  id v4 = a3;
  allowedCharacters = self->_allowedCharacters;
  id v6 = v4;
  if (allowedCharacters)
  {
    v7 = [(NSCharacterSet *)allowedCharacters invertedSet];
    uint64_t v8 = [v4 rangeOfCharacterFromSet:v7 options:0];

    id v6 = v4;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {

      id v6 = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldText;
  [(PKPaymentSetupField *)&v9 setCurrentValue:v6];
}

- (void)setDefaultValue:(id)a3
{
  id v4 = a3;
  allowedCharacters = self->_allowedCharacters;
  if (allowedCharacters)
  {
    id v6 = [(NSCharacterSet *)allowedCharacters invertedSet];
    uint64_t v7 = [v4 rangeOfCharacterFromSet:v6 options:0];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {

      id v4 = 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldText;
  [(PKPaymentSetupField *)&v8 setDefaultValue:v4];
}

- (void)setCurrencyCode:(id)a3
{
  id v20 = a3;
  uint64_t v5 = [v20 length];
  id v6 = v20;
  if (v5)
  {
    uint64_t v7 = self->_currencyCode;
    objc_super v8 = (NSString *)v20;
    objc_super v9 = v8;
    if (v7 == v8)
    {
      v11 = v8;
    }
    else
    {
      if (v8 && v7)
      {
        BOOL v10 = [(NSString *)v7 isEqualToString:v8];

        id v6 = v20;
        if (v10) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_currencyCode, a3);
      v11 = [(PKPaymentSetupFieldText *)self _currencyFormatter];
      [v11 setCurrencyCode:self->_currencyCode];
      id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v13 = [v11 groupingSeparator];
      v14 = [v11 currencySymbol];
      v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, @" ", @" ", 0);
      v16 = [v15 allObjects];
      paddingCharacters = self->_paddingCharacters;
      self->_paddingCharacters = v16;

      objc_super v9 = [(PKPaymentSetupFieldText *)self _allowedCharacters];
      v18 = (NSCharacterSet *)[v9 copy];
      allowedCharacters = self->_allowedCharacters;
      self->_allowedCharacters = v18;
    }
    id v6 = v20;
  }
LABEL_11:
}

- (void)setNumericFractional:(BOOL)a3
{
  if (self->_numericFractional != a3)
  {
    self->_numericFractional = a3;
    currencyFormatter = self->_currencyFormatter;
    self->_currencyFormatter = 0;

    amountFormatter = self->_amountFormatter;
    self->_amountFormatter = 0;
  }
}

- (id)displayString
{
  v3 = [(PKPaymentSetupField *)self currentValue];
  if (!v3)
  {
    v3 = [(PKPaymentSetupField *)self defaultValue];
  }
  if ([(PKPaymentSetupFieldText *)self hasDisplayFormat])
  {
    uint64_t v4 = [(PKPaymentSetupFieldText *)self stringByApplyingDisplayFormat:v3];

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_submissionStringForValue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (![v4 length])
  {
    uint64_t v5 = [(PKPaymentSetupField *)self defaultValue];
  }
  id v6 = [(PKPaymentSetupFieldText *)self decimalSeparator];
  if ([(PKPaymentSetupFieldText *)self hasDisplayFormat]
    && !self->_keepPaddingCharactersForSubmission)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [(PKPaymentSetupFieldText *)self displayFormatPaddingCharacters];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (![(PKPaymentSetupFieldText *)self isNumericFractional]
            || ([v12 isEqualToString:v6] & 1) == 0)
          {
            uint64_t v13 = [v5 stringByReplacingOccurrencesOfString:v12 withString:&stru_1EE0F5368];

            uint64_t v5 = (void *)v13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
  }
  if ([(PKPaymentSetupFieldText *)self isNumericFractional])
  {
    uint64_t v14 = [v5 rangeOfString:v6 options:4];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1EE0F5368, 0, 0, v14);

      uint64_t v5 = (void *)v15;
    }
  }
  uint64_t v16 = [(PKPaymentSetupFieldText *)self _currencyFormatter];
  if (v16)
  {
    v17 = (void *)v16;
    if ([(PKPaymentSetupFieldText *)self isNumeric])
    {
    }
    else
    {
      BOOL v18 = [(PKPaymentSetupFieldText *)self isNumericFractional];

      if (!v18) {
        goto LABEL_24;
      }
    }
    uint64_t v19 = [v5 stringByApplyingTransform:*MEMORY[0x1E4F1C4E0] reverse:0];

    uint64_t v5 = (void *)v19;
  }
LABEL_24:
  id v20 = objc_msgSend(v5, "pk_zString");

  return v20;
}

- (id)decimalSeparator
{
  v3 = [(PKPaymentSetupFieldText *)self _currencyFormatter];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 currencyDecimalSeparator];
  }
  else
  {
    id v6 = [(PKPaymentSetupFieldText *)self _amountFormatter];
    uint64_t v5 = [v6 decimalSeparator];
  }
  return v5;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  v3 = [(PKPaymentSetupField *)self submissionString];
  if ([(PKPaymentSetupFieldText *)self minLength])
  {
    unint64_t v4 = [v3 length];
    BOOL v5 = v4 >= [(PKPaymentSetupFieldText *)self minLength];
  }
  else
  {
    BOOL v5 = 1;
  }
  if ([(PKPaymentSetupFieldText *)self maxLength])
  {
    unint64_t v6 = [v3 length];
    if (v6 > [(PKPaymentSetupFieldText *)self maxLength]) {
      BOOL v5 = 0;
    }
  }
  if ([(PKPaymentSetupFieldText *)self useLuhnCheck] && !PKLuhnCheck(v3)) {
    BOOL v5 = 0;
  }
  if ([(PKPaymentSetupFieldText *)self isNumeric]
    || [(PKPaymentSetupFieldText *)self isNumericFractional])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    uint64_t v8 = [v3 rangeOfCharacterFromSet:v7];

    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      BOOL v5 = 0;
    }
  }
  BOOL v9 = [(PKPaymentSetupFieldText *)self submissionStringMeetsValidationRegex]
    && v5;

  return v9;
}

- (BOOL)submissionStringMeetsValidationRegex
{
  v3 = [(PKPaymentSetupField *)self submissionString];
  unint64_t v4 = [(PKPaymentSetupFieldText *)self validationRegex];
  BOOL v5 = 1;
  if (v4 && v3) {
    BOOL v5 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;
  }

  return v5;
}

- (id)_currencyFormatter
{
  if (self->_currencyCode)
  {
    currencyFormatter = self->_currencyFormatter;
    if (!currencyFormatter)
    {
      unint64_t v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
      BOOL v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
      unint64_t v6 = self->_currencyFormatter;
      self->_currencyFormatter = v5;

      [(NSNumberFormatter *)self->_currencyFormatter setLocale:v4];
      [(NSNumberFormatter *)self->_currencyFormatter setCurrencyCode:self->_currencyCode];
      [(NSNumberFormatter *)self->_currencyFormatter setNumberStyle:2];
      if (![(PKPaymentSetupFieldText *)self isNumericFractional]) {
        [(NSNumberFormatter *)self->_currencyFormatter setMinimumFractionDigits:0];
      }
      amountFormatter = self->_amountFormatter;
      self->_amountFormatter = 0;

      currencyFormatter = self->_currencyFormatter;
    }
    uint64_t v8 = currencyFormatter;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)_amountFormatter
{
  amountFormatter = self->_amountFormatter;
  if (!amountFormatter)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    BOOL v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    unint64_t v6 = self->_amountFormatter;
    self->_amountFormatter = v5;

    [(NSNumberFormatter *)self->_amountFormatter setLocale:v4];
    uint64_t v7 = [(PKPaymentSetupFieldText *)self _currencyFormatter];
    uint64_t v8 = v7;
    if (v7)
    {
      -[NSNumberFormatter setMinimumFractionDigits:](self->_amountFormatter, "setMinimumFractionDigits:", [v7 minimumFractionDigits]);
      -[NSNumberFormatter setMaximumFractionDigits:](self->_amountFormatter, "setMaximumFractionDigits:", [v8 maximumFractionDigits]);
      -[NSNumberFormatter setMinimumIntegerDigits:](self->_amountFormatter, "setMinimumIntegerDigits:", [v8 minimumIntegerDigits]);
      -[NSNumberFormatter setMaximumIntegerDigits:](self->_amountFormatter, "setMaximumIntegerDigits:", [v8 maximumIntegerDigits]);
    }
    else if ([(PKPaymentSetupFieldText *)self isNumericFractional])
    {
      [(NSNumberFormatter *)self->_amountFormatter setMinimumFractionDigits:100];
    }

    amountFormatter = self->_amountFormatter;
  }
  return amountFormatter;
}

- (id)_allowedCharacters
{
  v3 = [MEMORY[0x1E4F28E58] decimalDigitCharacterSet];
  paddingCharacters = self->_paddingCharacters;
  if (paddingCharacters)
  {
    BOOL v5 = [(NSArray *)paddingCharacters componentsJoinedByString:&stru_1EE0F5368];
    [v3 addCharactersInString:v5];
  }
  if ([(PKPaymentSetupFieldText *)self isNumericFractional])
  {
    unint64_t v6 = [(PKPaymentSetupFieldText *)self decimalSeparator];
    [v3 addCharactersInString:v6];
  }
  uint64_t v7 = (NSCharacterSet *)[v3 copy];
  allowedCharacters = self->_allowedCharacters;
  self->_allowedCharacters = v7;

  return v3;
}

- (BOOL)hasDisplayFormat
{
  if (self->_currencyCode) {
    return 1;
  }
  v3 = [(PKPaymentSetupField *)self displayFormat];
  BOOL v2 = [v3 length] != 0;

  return v2;
}

- (id)_stringByApplyingCurrencyFormatter:(id)a3 allowPartialFractional:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 length])
  {
    long long v23 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = [(PKPaymentSetupFieldText *)self _amountFormatter];
  uint64_t v8 = [(PKPaymentSetupFieldText *)self _currencyFormatter];
  BOOL v9 = [v8 groupingSeparator];
  uint64_t v10 = [v6 stringByReplacingOccurrencesOfString:v9 withString:&stru_1EE0F5368];

  v11 = [v8 currencySymbol];
  id v12 = [v10 stringByReplacingOccurrencesOfString:v11 withString:&stru_1EE0F5368];

  if ([(PKPaymentSetupFieldText *)self isNumericFractional])
  {
    uint64_t v13 = [(PKPaymentSetupFieldText *)self decimalSeparator];
    uint64_t v14 = [v12 rangeOfString:v13 options:4];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:options:range:", v13, &stru_1EE0F5368, 0, 0, v14);

      id v12 = (void *)v15;
    }
    uint64_t v16 = v12;
    id v12 = [v7 numberFromString:v12];
    id v17 = v16;
    id v18 = v13;
    uint64_t v19 = v18;
    BOOL v20 = v17 != v18;
    if (v17 == v18)
    {

      id v25 = v12;
      id v12 = &unk_1EE22B720;
    }
    else
    {
      if (v18 && v17)
      {
        char v21 = [v17 isEqualToString:v18];

        if ((v21 & 1) == 0)
        {
          BOOL v20 = 1;
          goto LABEL_16;
        }
        BOOL v20 = 0;
        long long v22 = &unk_1EE22B720;
LABEL_15:

        id v12 = v22;
LABEL_16:
        v26 = [v7 stringFromNumber:v12];
        uint64_t v27 = [v8 stringFromNumber:v12];
        v28 = v27;
        if (v20 || !v4)
        {
          if (!v4 || (unint64_t v32 = [v17 length], v32 >= objc_msgSend(v26, "length")))
          {
            id v35 = v28;
            goto LABEL_24;
          }
          uint64_t v33 = [v17 length];
          uint64_t v34 = [v28 length];
          uint64_t v31 = v34 + v33 - [v26 length];
        }
        else
        {
          uint64_t v29 = [v27 rangeOfString:v19 options:4];
          uint64_t v31 = v29 + v30;
        }
        id v35 = [v28 substringToIndex:v31];
LABEL_24:
        long long v24 = v35;

        goto LABEL_25;
      }
      id v25 = v17;
    }
    long long v22 = v12;

    id v12 = v25;
    goto LABEL_15;
  }
  uint64_t v19 = [v7 numberFromString:v12];
  long long v24 = [v8 stringFromNumber:v19];
LABEL_25:

  id v6 = v24;
  long long v23 = v6;
LABEL_26:

  return v23;
}

- (id)_stringByApplyingNumericFractionalFormat:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional") || ![v4 length])
  {
    long long v23 = 0;
    goto LABEL_26;
  }
  BOOL v5 = [(PKPaymentSetupFieldText *)self decimalSeparator];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v26 = self;
  id v6 = [(PKPaymentSetupFieldText *)self displayFormatPaddingCharacters];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      id v12 = v5;
      id v13 = v11;
      if (v12 == v13)
      {

        goto LABEL_16;
      }
      uint64_t v14 = v13;
      if (!v5 || !v13)
      {

LABEL_15:
        [v4 stringByReplacingOccurrencesOfString:v14 withString:&stru_1EE0F5368];
        id v12 = v4;
        id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

        continue;
      }
      char v15 = [v12 isEqualToString:v13];

      if ((v15 & 1) == 0) {
        goto LABEL_15;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v8);
LABEL_19:

  uint64_t v16 = [v4 rangeOfString:v5 options:4];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", v5, &stru_1EE0F5368, 0, 0, v16);

    id v4 = (id)v17;
  }
  id v18 = [(PKPaymentSetupFieldText *)v26 _amountFormatter];
  uint64_t v19 = [v18 numberFromString:v4];
  BOOL v20 = [v18 stringFromNumber:v19];
  unint64_t v21 = [v4 length];
  if (v21 >= [v20 length])
  {
    id v22 = v20;
  }
  else
  {
    objc_msgSend(v20, "substringToIndex:", objc_msgSend(v4, "length"));
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v24 = v22;

  id v4 = v24;
  long long v23 = v4;
LABEL_26:

  return v23;
}

- (id)stringByApplyingDisplayFormat:(id)a3
{
  return [(PKPaymentSetupFieldText *)self stringByApplyingDisplayFormat:a3 allowPartialFractional:1];
}

- (id)stringByApplyingDisplayFormat:(id)a3 allowPartialFractional:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PKPaymentSetupFieldText *)self _currencyFormatter];

  if (v7)
  {
    uint64_t v8 = [(PKPaymentSetupFieldText *)self _stringByApplyingCurrencyFormatter:v6 allowPartialFractional:v4];
  }
  else
  {
    if ([(PKPaymentSetupFieldText *)self isNumericFractional]
      && [(PKPaymentSetupFieldText *)self hasDisplayFormat])
    {
      uint64_t v9 = [(PKPaymentSetupFieldText *)self _stringByApplyingNumericFractionalFormat:v6];

      id v6 = (id)v9;
    }
    uint64_t v10 = [(PKPaymentSetupField *)self displayFormat];
    v11 = [(PKPaymentSetupFieldText *)self displayFormatPaddingCharacters];
    uint64_t v8 = PKApplyFormatToString(v6, v10, v11);
  }
  return v8;
}

- (id)displayFormatPaddingCharacters
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  paddingCharacters = self->_paddingCharacters;
  if (paddingCharacters)
  {
    v3 = paddingCharacters;
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [(PKPaymentSetupFieldText *)self displayFormatPlaceholder];
    uint64_t v7 = [v6 length];

    if (v7 == 1)
    {
      uint64_t v8 = [(PKPaymentSetupField *)self displayFormat];
      if ([v8 length])
      {
        do
        {
          uint64_t v9 = [v8 substringToIndex:1];
          uint64_t v10 = [(PKPaymentSetupFieldText *)self displayFormatPlaceholder];
          if ([v9 isEqualToString:v10])
          {
          }
          else
          {
            char v11 = [v5 containsObject:v9];

            if ((v11 & 1) == 0) {
              [v5 addObject:v9];
            }
          }
          id v12 = [v8 substringFromIndex:1];

          uint64_t v8 = v12;
        }
        while ([v12 length]);
      }
      else
      {
        id v12 = v8;
      }
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v13 = [&unk_1EE22AC70 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(&unk_1EE22AC70);
            }
            uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            id v18 = [(PKPaymentSetupField *)self displayFormat];
            int v19 = [v18 containsString:v17];

            if (v19) {
              [v5 addObject:v17];
            }
          }
          uint64_t v14 = [&unk_1EE22AC70 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }
    }
    v3 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  }
  return v3;
}

- (void)updateDisplayFormat:(id)a3
{
  if (a3)
  {
    -[PKPaymentSetupField setDisplayFormat:](self, "setDisplayFormat:");
    [(PKPaymentSetupField *)self noteCurrentValueChanged];
  }
}

- (void)setAllowedCharacters:(id)a3
{
  id v5 = a3;
  p_allowedCharacters = (id *)&self->_allowedCharacters;
  id v7 = *p_allowedCharacters;
  id v8 = v5;
  if (!v5 || !v7)
  {
    if (v7 == v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((objc_msgSend(v5, "isEqual:") & 1) == 0) {
LABEL_6:
  }
    objc_storeStrong(p_allowedCharacters, a3);
LABEL_7:
}

- (NSCharacterSet)allowedCharacters
{
  allowedCharacters = self->_allowedCharacters;
  if (allowedCharacters)
  {
    v3 = allowedCharacters;
LABEL_5:
    id v5 = v3;
    goto LABEL_6;
  }
  if ([(PKPaymentSetupFieldText *)self isNumeric])
  {
    v3 = [MEMORY[0x1E4F28E58] decimalDigitCharacterSet];
    goto LABEL_5;
  }
  if ([(PKPaymentSetupFieldText *)self isNumericFractional])
  {
    id v5 = [MEMORY[0x1E4F28E58] decimalDigitCharacterSet];
    id v7 = [(PKPaymentSetupFieldText *)self decimalSeparator];
    [v5 addCharactersInString:v7];
  }
  else
  {
    id v5 = 0;
  }
LABEL_6:
  return (NSCharacterSet *)v5;
}

- (void)updateWithAttribute:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldText;
  [(PKPaymentSetupField *)&v10 updateWithAttribute:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    -[PKPaymentSetupFieldText setMinLength:](self, "setMinLength:", [v5 minLength]);
    -[PKPaymentSetupFieldText setMaxLength:](self, "setMaxLength:", [v5 maxLength]);
    -[PKPaymentSetupFieldText setSecureText:](self, "setSecureText:", [v5 isSecureText]);
    -[PKPaymentSetupFieldText setSecureVisibleText:](self, "setSecureVisibleText:", [v5 isSecureVisibleText]);
    -[PKPaymentSetupFieldText setNumeric:](self, "setNumeric:", [v5 isNumeric]);
    -[PKPaymentSetupFieldText setLuhnCheck:](self, "setLuhnCheck:", [v5 useLuhnCheck]);
    id v6 = [v5 defaultValue];
    if ([v6 length]) {
      [(PKPaymentSetupFieldText *)self setDefaultValue:v6];
    }
    id v7 = [(PKPaymentSetupField *)self defaultValue];
    id v8 = [v7 stringByApplyingTransform:*MEMORY[0x1E4F1C4D8] reverse:0];

    if (v8) {
      [v5 setCurrentValue:v8];
    }
    uint64_t v9 = [v5 displayFormatPlaceholder];
    if ([v9 length] == 1) {
      [(PKPaymentSetupFieldText *)self setDisplayFormatPlaceholder:v9];
    }
  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentSetupFieldText;
  [(PKPaymentSetupField *)&v31 updateWithConfiguration:v4];
  id v5 = [v4 PKNumberForKey:@"minLength"];
  id v6 = v5;
  if (v5) {
    -[PKPaymentSetupFieldText setMinLength:](self, "setMinLength:", [v5 unsignedIntegerValue]);
  }
  id v7 = [v4 PKNumberForKey:@"maxLength"];
  id v8 = v7;
  if (v7) {
    -[PKPaymentSetupFieldText setMaxLength:](self, "setMaxLength:", [v7 unsignedIntegerValue]);
  }
  uint64_t v9 = [v4 PKNumberForKey:@"secureText"];
  objc_super v10 = v9;
  if (v9) {
    -[PKPaymentSetupFieldText setSecureText:](self, "setSecureText:", [v9 BOOLValue]);
  }
  char v11 = [v4 PKNumberForKey:@"secureVisibleText"];
  id v12 = v11;
  if (v11) {
    -[PKPaymentSetupFieldText setSecureVisibleText:](self, "setSecureVisibleText:", [v11 BOOLValue]);
  }
  uint64_t v13 = [v4 PKNumberForKey:@"numeric"];
  uint64_t v14 = v13;
  if (v13) {
    -[PKPaymentSetupFieldText setNumeric:](self, "setNumeric:", [v13 BOOLValue]);
  }
  uint64_t v15 = [v4 PKNumberForKey:@"numericFractional"];
  uint64_t v16 = v15;
  if (v15) {
    -[PKPaymentSetupFieldText setNumericFractional:](self, "setNumericFractional:", [v15 BOOLValue]);
  }
  uint64_t v17 = [v4 PKNumberForKey:@"useLuhnCheck"];
  id v18 = v17;
  if (v17) {
    -[PKPaymentSetupFieldText setLuhnCheck:](self, "setLuhnCheck:", [v17 BOOLValue]);
  }
  long long v30 = v6;
  int v19 = [v4 PKStringForKey:@"displayFormatPlaceholder"];
  if ([v19 length] == 1) {
    [(PKPaymentSetupFieldText *)self setDisplayFormatPlaceholder:v19];
  }
  long long v29 = v8;
  BOOL v20 = [v4 PKStringForKey:@"currencyCode"];
  if (v20) {
    [(PKPaymentSetupFieldText *)self setCurrencyCode:v20];
  }
  long long v28 = v10;
  long long v21 = objc_msgSend(v4, "PKStringForKey:", @"alignment", v12);
  long long v22 = v21;
  if (v21) {
    [(PKPaymentSetupFieldText *)self setAlignment:PKPaymentSetupFieldTextAlignmentFromString(v21)];
  }
  long long v23 = [v4 PKStringForKey:@"validationRegex"];
  if (v23)
  {
    long long v24 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v23 options:0 error:0];
    [(PKPaymentSetupFieldText *)self setValidationRegex:v24];
  }
  id v25 = [v4 PKNumberForKey:@"codeOnError"];
  uint64_t v26 = v25;
  if (v25) {
    -[PKPaymentSetupFieldText setCodeOnError:](self, "setCodeOnError:", [v25 integerValue]);
  }
}

- (unint64_t)fieldType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupFieldText;
  id v5 = -[PKPaymentSetupField copyWithZone:](&v15, sel_copyWithZone_);
  *((void *)v5 + 21) = self->_minLength;
  *((void *)v5 + 22) = self->_maxLength;
  *((unsigned char *)v5 + 160) = self->_secureText;
  *((unsigned char *)v5 + 161) = self->_secureVisibleText;
  *((unsigned char *)v5 + 162) = self->_numeric;
  *((unsigned char *)v5 + 163) = self->_numericFractional;
  *((unsigned char *)v5 + 164) = self->_luhnCheck;
  uint64_t v6 = [(NSString *)self->_displayFormatPlaceholder copyWithZone:a3];
  id v7 = (void *)*((void *)v5 + 28);
  *((void *)v5 + 28) = v6;

  uint64_t v8 = [(NSString *)self->_currencyCode copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v5 + 23);
  *((void *)v5 + 23) = v8;

  *((unsigned char *)v5 + 165) = self->_keepPaddingCharactersForSubmission;
  uint64_t v10 = [(NSArray *)self->_paddingCharacters copyWithZone:a3];
  char v11 = (void *)*((void *)v5 + 29);
  *((void *)v5 + 29) = v10;

  objc_storeStrong((id *)v5 + 17, self->_currencyFormatter);
  objc_storeStrong((id *)v5 + 18, self->_amountFormatter);
  objc_storeStrong((id *)v5 + 19, self->_allowedCharacters);
  *((void *)v5 + 24) = self->_alignment;
  uint64_t v12 = [(NSArray *)self->_keyboardAccessories copy];
  uint64_t v13 = (void *)*((void *)v5 + 27);
  *((void *)v5 + 27) = v12;

  return v5;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (BOOL)isSecureText
{
  return self->_secureText;
}

- (void)setSecureText:(BOOL)a3
{
  self->_secureText = a3;
}

- (BOOL)isSecureVisibleText
{
  return self->_secureVisibleText;
}

- (void)setSecureVisibleText:(BOOL)a3
{
  self->_secureVisibleText = a3;
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (BOOL)isNumericFractional
{
  return self->_numericFractional;
}

- (BOOL)useLuhnCheck
{
  return self->_luhnCheck;
}

- (void)setLuhnCheck:(BOOL)a3
{
  self->_luhnCheck = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (BOOL)keepPaddingCharactersForSubmission
{
  return self->_keepPaddingCharactersForSubmission;
}

- (void)setKeepPaddingCharactersForSubmission:(BOOL)a3
{
  self->_keepPaddingCharactersForSubmission = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSRegularExpression)validationRegex
{
  return self->_validationRegex;
}

- (void)setValidationRegex:(id)a3
{
}

- (int64_t)codeOnError
{
  return self->_codeOnError;
}

- (void)setCodeOnError:(int64_t)a3
{
  self->_codeOnError = a3;
}

- (NSArray)keyboardAccessories
{
  return self->_keyboardAccessories;
}

- (void)setKeyboardAccessories:(id)a3
{
}

- (NSString)displayFormatPlaceholder
{
  return self->_displayFormatPlaceholder;
}

- (void)setDisplayFormatPlaceholder:(id)a3
{
}

- (NSArray)paddingCharacters
{
  return self->_paddingCharacters;
}

- (void)setPaddingCharacters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingCharacters, 0);
  objc_storeStrong((id *)&self->_displayFormatPlaceholder, 0);
  objc_storeStrong((id *)&self->_keyboardAccessories, 0);
  objc_storeStrong((id *)&self->_validationRegex, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_allowedCharacters, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
}

@end