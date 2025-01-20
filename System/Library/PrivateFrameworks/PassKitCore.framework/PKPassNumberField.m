@interface PKPassNumberField
+ (BOOL)supportsSecureCoding;
- (NSString)currencyCode;
- (PKPassNumberField)initWithCoder:(id)a3;
- (id)asDictionary;
- (id)asMutableDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)value;
- (int64_t)numberStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setNumberStyle:(int64_t)a3;
@end

@implementation PKPassNumberField

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id)value
{
  value = self->super._value;
  if (!value)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v5 = self->_currencyCode;
    if (v5)
    {
      [v4 setNumberStyle:2];
      [v4 setCurrencyCode:v5];
    }
    else
    {
      [v4 setNumberStyle:self->_numberStyle];
    }
    v6 = [(PKPassField *)self unformattedValue];
    v7 = [v4 stringFromNumber:v6];
    v8 = self->super._value;
    self->super._value = v7;

    value = self->super._value;
  }
  return value;
}

- (PKPassNumberField)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassNumberField;
  v5 = [(PKPassField *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    [(PKPassNumberField *)v5 setCurrencyCode:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberStyle"];
    -[PKPassNumberField setNumberStyle:](v5, "setNumberStyle:", [v7 integerValue]);
  }
  return v5;
}

- (void)setCurrencyCode:(id)a3
{
}

- (void)setNumberStyle:(int64_t)a3
{
  self->_numberStyle = a3;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassNumberField;
  id v4 = a3;
  [(PKPassField *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currencyCode, @"currencyCode", v6.receiver, v6.super_class);
  v5 = [NSNumber numberWithInteger:self->_numberStyle];
  [v4 encodeObject:v5 forKey:@"numberStyle"];
}

- (id)asDictionary
{
  v2 = [(PKPassNumberField *)self asMutableDictionary];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)asMutableDictionary
{
  v13.receiver = self;
  v13.super_class = (Class)PKPassNumberField;
  v3 = [(PKPassField *)&v13 asMutableDictionary];
  objc_super v9 = v3;
  currencyCode = self->_currencyCode;
  if (currencyCode) {
    [v3 setObject:currencyCode forKeyedSubscript:@"currencyCode"];
  }
  v11 = _PKEnumValueToString(self->_numberStyle, @"PKNumberStyle", @"PKNumberStyleDecimal, WLNumberStyleDecimal, PKNumberStylePercent, WLNumberStylePercent, PKNumberStyleScientific, WLNumberStyleScientific, PKNumberStyleSpellOut, WLNumberStyleSpellOut", v4, v5, v6, v7, v8, 1);
  [v9 setObject:v11 forKeyedSubscript:@"numberStyle"];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassNumberField;
  id v4 = [(PKPassField *)&v7 copyWithZone:a3];
  [v4 setNumberStyle:self->_numberStyle];
  uint64_t v5 = (void *)[(NSString *)self->_currencyCode copy];
  [v4 setCurrencyCode:v5];

  return v4;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (int64_t)numberStyle
{
  return self->_numberStyle;
}

@end