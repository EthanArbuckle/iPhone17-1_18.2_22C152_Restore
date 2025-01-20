@interface PKPassDateField
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoresTimeZone;
- (BOOL)isRelative;
- (PKPassDateField)initWithCoder:(id)a3;
- (id)asDictionary;
- (id)asMutableDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)value;
- (int64_t)dateStyle;
- (int64_t)timeStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setDateStyle:(int64_t)a3;
- (void)setIgnoresTimeZone:(BOOL)a3;
- (void)setIsRelative:(BOOL)a3;
- (void)setTimeStyle:(int64_t)a3;
@end

@implementation PKPassDateField

- (id)asDictionary
{
  v2 = [(PKPassDateField *)self asMutableDictionary];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)asMutableDictionary
{
  v16.receiver = self;
  v16.super_class = (Class)PKPassDateField;
  v8 = [(PKPassField *)&v16 asMutableDictionary];
  int64_t dateStyle = self->_dateStyle;
  if (dateStyle)
  {
    v10 = _PKEnumValueToString(dateStyle, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v3, v4, v5, v6, v7, 0);
    [v8 setObject:v10 forKeyedSubscript:@"dateStyle"];
  }
  int64_t timeStyle = self->_timeStyle;
  if (timeStyle)
  {
    v12 = _PKEnumValueToString(timeStyle, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v3, v4, v5, v6, v7, 0);
    [v8 setObject:v12 forKeyedSubscript:@"timeStyle"];
  }
  if (self->_isRelative)
  {
    v13 = [NSNumber numberWithBool:1];
    [v8 setObject:v13 forKeyedSubscript:@"isRelative"];
  }
  if (self->_ignoresTimeZone)
  {
    v14 = [NSNumber numberWithBool:1];
    [v8 setObject:v14 forKeyedSubscript:@"ignoresTimeZone"];
  }
  return v8;
}

- (PKPassDateField)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassDateField;
  uint64_t v5 = [(PKPassField *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateStyle"];
    -[PKPassDateField setDateStyle:](v5, "setDateStyle:", [v6 integerValue]);

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStyle"];
    -[PKPassDateField setTimeStyle:](v5, "setTimeStyle:", [v7 integerValue]);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRelative"];
    -[PKPassDateField setIsRelative:](v5, "setIsRelative:", [v8 BOOLValue]);

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ignoresTimeZone"];
    -[PKPassDateField setIgnoresTimeZone:](v5, "setIgnoresTimeZone:", [v9 BOOLValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassDateField;
  id v4 = a3;
  [(PKPassField *)&v9 encodeWithCoder:v4];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", self->_dateStyle, v9.receiver, v9.super_class);
  [v4 encodeObject:v5 forKey:@"dateStyle"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_timeStyle];
  [v4 encodeObject:v6 forKey:@"timeStyle"];

  uint64_t v7 = [NSNumber numberWithBool:self->_isRelative];
  [v4 encodeObject:v7 forKey:@"isRelative"];

  v8 = [NSNumber numberWithBool:self->_ignoresTimeZone];
  [v4 encodeObject:v8 forKey:@"ignoresTimeZone"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassDateField;
  id v4 = [(PKPassField *)&v6 copyWithZone:a3];
  [v4 setDateStyle:self->_dateStyle];
  [v4 setTimeStyle:self->_timeStyle];
  [v4 setIsRelative:self->_isRelative];
  [v4 setIgnoresTimeZone:self->_ignoresTimeZone];
  return v4;
}

- (id)value
{
  value = self->super._value;
  if (!value)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v4 setDateStyle:self->_dateStyle];
    [v4 setTimeStyle:self->_timeStyle];
    [v4 setDoesRelativeDateFormatting:self->_isRelative];
    uint64_t v5 = [(PKPassField *)self unformattedValue];
    if (self->_ignoresTimeZone)
    {
      objc_super v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
      [v4 setTimeZone:v6];
    }
    uint64_t v7 = [v4 stringFromDate:v5];
    v8 = self->super._value;
    self->super._value = v7;

    value = self->super._value;
  }
  return value;
}

- (int64_t)dateStyle
{
  return self->_dateStyle;
}

- (void)setDateStyle:(int64_t)a3
{
  self->_int64_t dateStyle = a3;
}

- (int64_t)timeStyle
{
  return self->_timeStyle;
}

- (void)setTimeStyle:(int64_t)a3
{
  self->_int64_t timeStyle = a3;
}

- (BOOL)isRelative
{
  return self->_isRelative;
}

- (void)setIsRelative:(BOOL)a3
{
  self->_isRelative = a3;
}

- (BOOL)ignoresTimeZone
{
  return self->_ignoresTimeZone;
}

- (void)setIgnoresTimeZone:(BOOL)a3
{
  self->_ignoresTimeZone = a3;
}

@end