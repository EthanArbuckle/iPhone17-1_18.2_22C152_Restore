@interface PKPassTileValueDate
+ (BOOL)supportsSecureCoding;
+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4;
+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4 timeStyle:(int64_t)a5;
+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4 timeStyle:(int64_t)a5 ignoresTimeZone:(BOOL)a6 isRelative:(BOOL)a7;
+ (id)createWithContent:(id)a3 timeStyle:(int64_t)a4;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)ignoresTimeZone;
- (BOOL)isRelative;
- (NSString)content;
- (PKPassTileValueDate)initWithCoder:(id)a3;
- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4;
- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4;
- (int64_t)dateStyle;
- (int64_t)timeStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setDateStyle:(int64_t)a3;
- (void)setIgnoresTimeZone:(BOOL)a3;
- (void)setIsRelative:(BOOL)a3;
- (void)setTimeStyle:(int64_t)a3;
@end

@implementation PKPassTileValueDate

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPassTileValueDate;
  if ([(PKPassTileValue *)&v23 _setUpWithDictionary:v4]
    && ([v4 PKStringForKey:@"content"],
        v5 = (NSString *)objc_claimAutoreleasedReturnValue(),
        content = self->_content,
        self->_content = v5,
        content,
        self->_content))
  {
    v7 = [v4 PKStringForKey:@"dateStyle"];
    v12 = v7;
    if (v7) {
      int64_t v13 = (int)_PKEnumValueFromString(v7, 0, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v8, v9, v10, v11, 0);
    }
    else {
      int64_t v13 = 0;
    }
    self->_dateStyle = v13;
    v15 = [v4 PKStringForKey:@"timeStyle"];
    v20 = v15;
    if (v15) {
      int64_t v21 = (int)_PKEnumValueFromString(v15, 0, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v16, v17, v18, v19, 0);
    }
    else {
      int64_t v21 = 0;
    }
    self->_timeStyle = v21;
    self->_ignoresTimeZone = [v4 PKBoolForKey:@"ignoresTimeZone"];
    self->_isRelative = [v4 PKBoolForKey:@"isRelative"];

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4
{
  return (id)[a1 createWithContent:a3 dateStyle:a4 timeStyle:0];
}

+ (id)createWithContent:(id)a3 timeStyle:(int64_t)a4
{
  return (id)[a1 createWithContent:a3 dateStyle:0 timeStyle:a4];
}

+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4 timeStyle:(int64_t)a5
{
  v5 = (void *)[a1 createWithContent:a3 dateStyle:a4 timeStyle:a5 ignoresTimeZone:0 isRelative:0];
  return v5;
}

+ (id)createWithContent:(id)a3 dateStyle:(int64_t)a4 timeStyle:(int64_t)a5 ignoresTimeZone:(BOOL)a6 isRelative:(BOOL)a7
{
  id v12 = a3;
  if (v12)
  {
    int64_t v13 = +[PKPassTileValue _createForType:1 resolved:1];
    objc_storeStrong(v13 + 4, a3);
    v13[5] = (id)a4;
    v13[6] = (id)a5;
    *((unsigned char *)v13 + 24) = a6;
    *((unsigned char *)v13 + 25) = a7;
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileValueDate;
  v5 = [(PKPassTileValue *)&v7 createResolvedValueWithBundle:a3 privateBundle:a4];
  objc_storeStrong(v5 + 4, self->_content);
  v5[5] = self->_dateStyle;
  v5[6] = self->_timeStyle;
  *((unsigned char *)v5 + 25) = self->_isRelative;
  *((unsigned char *)v5 + 24) = self->_ignoresTimeZone;
  return v5;
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateStyle:self->_dateStyle];
  [v5 setTimeStyle:self->_timeStyle];
  [v5 setDoesRelativeDateFormatting:self->_isRelative];
  v6 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v5 setLocale:v6];

  objc_super v7 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  [v5 setCalendar:v7];

  if (self->_ignoresTimeZone)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [v5 setTimeZone:v8];

    char ignoresTimeZone = self->_ignoresTimeZone;
  }
  else
  {
    char ignoresTimeZone = 0;
  }
  uint64_t v10 = _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(self->_content, ignoresTimeZone, 0);
  uint64_t v11 = [v5 stringFromDate:v10];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValueDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPassTileValueDate;
  id v5 = [(PKPassTileValue *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateStyle"];
    v5->_dateStyle = (int)_PKEnumValueFromString(v8, 0, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v9, v10, v11, v12, 0);

    int64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeStyle"];
    v5->_timeStyle = (int)_PKEnumValueFromString(v13, 0, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v14, v15, v16, v17, 0);

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ignoresTimeZone"];
    v5->_char ignoresTimeZone = [v18 BOOLValue];

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRelative"];
    v5->_isRelative = [v19 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PKPassTileValueDate;
  id v4 = a3;
  [(PKPassTileValue *)&v19 encodeWithCoder:v4];
  [v4 encodeObject:self->_content forKey:@"content"];
  uint64_t v10 = _PKEnumValueToString(self->_dateStyle, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v5, v6, v7, v8, v9, 0);
  [v4 encodeObject:v10 forKey:@"dateStyle"];

  uint64_t v16 = _PKEnumValueToString(self->_timeStyle, @"PKDateStyle", @"PKDateStyleNone, WLDateStyleNone,PKDateStyleShort, WLDateStyleShort, PKDateStyleMedium, WLDateStyleMedium, PKDateStyleLong, WLDateStyleLong, PKDateStyleFull, WLDateStyleFull", v11, v12, v13, v14, v15, 0);
  [v4 encodeObject:v16 forKey:@"timeStyle"];

  uint64_t v17 = [NSNumber numberWithBool:self->_ignoresTimeZone];
  [v4 encodeObject:v17 forKey:@"ignoresTimeZone"];

  uint64_t v18 = [NSNumber numberWithBool:self->_isRelative];
  [v4 encodeObject:v18 forKey:@"isRelative"];
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueDate;
  id v7 = [(PKPassTileValue *)&v6 hash];
  NSUInteger v3 = [(NSString *)self->_content hash];
  int64_t dateStyle = self->_dateStyle;
  NSUInteger v8 = v3;
  int64_t v9 = dateStyle;
  int64_t timeStyle = self->_timeStyle;
  BOOL ignoresTimeZone = self->_ignoresTimeZone;
  BOOL isRelative = self->_isRelative;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileValueDate;
  if ([(PKPassTileValue *)&v14 _isEqual:v4])
  {
    uint64_t v5 = (id *)v4;
    content = self->_content;
    id v7 = (NSString *)v5[4];
    NSUInteger v8 = content;
    if (v7 == v8)
    {
    }
    else
    {
      int64_t v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {

        goto LABEL_16;
      }
      BOOL v12 = [(NSString *)v7 isEqualToString:v8];

      if (!v12) {
        goto LABEL_16;
      }
    }
    if (v5[5] == self->_dateStyle
      && v5[6] == self->_timeStyle
      && *((unsigned __int8 *)v5 + 24) == self->_ignoresTimeZone)
    {
      BOOL v11 = *((unsigned __int8 *)v5 + 25) == self->_isRelative;
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    BOOL v11 = 0;
    goto LABEL_17;
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
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

- (BOOL)ignoresTimeZone
{
  return self->_ignoresTimeZone;
}

- (void)setIgnoresTimeZone:(BOOL)a3
{
  self->_BOOL ignoresTimeZone = a3;
}

- (BOOL)isRelative
{
  return self->_isRelative;
}

- (void)setIsRelative:(BOOL)a3
{
  self->_BOOL isRelative = a3;
}

- (void).cxx_destruct
{
}

@end