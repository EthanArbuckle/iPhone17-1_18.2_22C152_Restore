@interface PKPayLaterMerchandisingConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)_numberFormatter;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)currency;
- (PKPayLaterMerchandisingConfiguration)initWithAmount:(id)a3 currency:(id)a4 displayStyle:(int64_t)a5 action:(int64_t)a6 theme:(unint64_t)a7 environmentType:(unint64_t)a8;
- (PKPayLaterMerchandisingConfiguration)initWithCoder:(id)a3;
- (id)amountString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localeString;
- (id)region;
- (id)stringValueForProperty:(unint64_t)a3;
- (int64_t)action;
- (int64_t)displayStyle;
- (unint64_t)environmentType;
- (unint64_t)hash;
- (unint64_t)theme;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setAmount:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setEnvironmentType:(unint64_t)a3;
- (void)setTheme:(unint64_t)a3;
@end

@implementation PKPayLaterMerchandisingConfiguration

- (PKPayLaterMerchandisingConfiguration)initWithAmount:(id)a3 currency:(id)a4 displayStyle:(int64_t)a5 action:(int64_t)a6 theme:(unint64_t)a7 environmentType:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  v17 = [(PKPayLaterMerchandisingConfiguration *)self init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_amount, a3);
    objc_storeStrong((id *)&v18->_currency, a4);
    v18->_displayStyle = a5;
    v18->_action = a6;
    v18->_environmentType = a8;
    v18->_theme = a7;
  }

  return v18;
}

- (id)amountString
{
  v3 = [(id)objc_opt_class() _numberFormatter];
  v4 = [v3 stringFromNumber:self->_amount];

  return v4;
}

- (id)localeString
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 localeIdentifier];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  return v4;
}

- (id)region
{
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 regionCode];

  return v3;
}

- (id)stringValueForProperty:(unint64_t)a3
{
  v4 = 0;
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64)
      {
        PKPayLaterActionToString((__CFString *)self->_action);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else if (a3 == 128)
      {
        PKPayLaterEnvironmentTypeToString((__CFString *)self->_environmentType);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a3 == 16)
    {
      PKPayLaterDisplayStyleToString((__CFString *)self->_displayStyle);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 32)
    {
      PKPayLaterThemeToString((__CFString *)self->_theme);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        v4 = &stru_1EE0F5368;
        break;
      case 1uLL:
        v4 = [(PKPayLaterMerchandisingConfiguration *)self amountString];
        break;
      case 2uLL:
        v4 = self->_currency;
        break;
      case 4uLL:
        v4 = [(PKPayLaterMerchandisingConfiguration *)self region];
        break;
      case 8uLL:
        v4 = [(PKPayLaterMerchandisingConfiguration *)self localeString];
        break;
      default:
        break;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterMerchandisingConfiguration *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterMerchandisingConfiguration *)self isEqualToConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_21;
  }
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
LABEL_21:
      BOOL v14 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    char v8 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_21;
    }
  }
  v9 = (void *)v4[2];
  v10 = self->_currency;
  v11 = v9;
  if (v10 == v11)
  {

    goto LABEL_16;
  }
  v12 = v11;
  if (!v10 || !v11)
  {

    goto LABEL_21;
  }
  BOOL v13 = [(NSString *)v10 isEqualToString:v11];

  if (!v13) {
    goto LABEL_21;
  }
LABEL_16:
  if (self->_displayStyle != v4[3] || self->_theme != v4[6] || self->_action != v4[4]) {
    goto LABEL_21;
  }
  BOOL v14 = self->_environmentType == v4[5];
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_currency];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_displayStyle - v4 + 32 * v4;
  unint64_t v6 = self->_theme - v5 + 32 * v5;
  int64_t v7 = self->_action - v6 + 32 * v6;
  unint64_t v8 = self->_environmentType - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(PKPayLaterMerchandisingConfiguration *)self amount];
  [v3 appendFormat:@"amount: '%@'; ", v4];

  [v3 appendFormat:@"currency: '%@'; ", self->_currency];
  int64_t v5 = [(PKPayLaterMerchandisingConfiguration *)self region];
  [v3 appendFormat:@"region: '%@'; ", v5];

  unint64_t v6 = [(PKPayLaterMerchandisingConfiguration *)self localeString];
  [v3 appendFormat:@"locale: '%@'; ", v6];

  int64_t v7 = PKPayLaterDisplayStyleToString((__CFString *)self->_displayStyle);
  [v3 appendFormat:@"displayStyle: '%@'; ", v7];

  unint64_t v8 = PKPayLaterThemeToString((__CFString *)self->_theme);
  [v3 appendFormat:@"theme: '%@'; ", v8];

  v9 = PKPayLaterActionToString((__CFString *)self->_action);
  [v3 appendFormat:@"secondaryAction: '%@'; ", v9];

  v10 = PKPayLaterEnvironmentTypeToString((__CFString *)self->_environmentType);
  [v3 appendFormat:@"environmentType: '%@'; ", v10];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [+[PKPayLaterMerchandisingConfiguration allocWithZone:](PKPayLaterMerchandisingConfiguration, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  amount = v5->_amount;
  v5->_amount = (NSDecimalNumber *)v6;

  uint64_t v8 = [(NSString *)self->_currency copyWithZone:a3];
  currency = v5->_currency;
  v5->_currency = (NSString *)v8;

  v5->_displayStyle = self->_displayStyle;
  v5->_theme = self->_theme;
  v5->_action = self->_action;
  v5->_environmentType = self->_environmentType;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterMerchandisingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterMerchandisingConfiguration;
  int64_t v5 = [(PKPayLaterMerchandisingConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currency"];
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v5->_displayStyle = [v4 decodeIntegerForKey:@"displayStyle"];
    v5->_theme = [v4 decodeIntegerForKey:@"theme"];
    v5->_action = [v4 decodeIntegerForKey:@"action"];
    v5->_environmentType = [v4 decodeIntegerForKey:@"environmentType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeObject:self->_currency forKey:@"currency"];
  [v5 encodeInteger:self->_displayStyle forKey:@"displayStyle"];
  [v5 encodeInteger:self->_theme forKey:@"theme"];
  [v5 encodeInteger:self->_action forKey:@"action"];
  [v5 encodeInteger:self->_environmentType forKey:@"environmentType"];
}

+ (id)_numberFormatter
{
  if (qword_1EB403478 != -1) {
    dispatch_once(&qword_1EB403478, &__block_literal_global_198);
  }
  v2 = (void *)_MergedGlobals_277;
  return v2;
}

uint64_t __56__PKPayLaterMerchandisingConfiguration__numberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_MergedGlobals_277;
  _MergedGlobals_277 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_277;
  return [v2 setNumberStyle:0];
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

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (void)setEnvironmentType:(unint64_t)a3
{
  self->_environmentType = a3;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (void)setTheme:(unint64_t)a3
{
  self->_theme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end