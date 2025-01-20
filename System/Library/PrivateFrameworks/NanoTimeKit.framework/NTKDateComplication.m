@interface NTKDateComplication
+ (BOOL)supportsSecureCoding;
+ (id)complicationWithDateStyle:(unint64_t)a3;
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (NTKDateComplication)initWithCoder:(id)a3;
- (NTKDateComplication)initWithComplicationType:(unint64_t)a3;
- (id)_generateUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4;
- (id)ntk_sectionIdentifier;
- (unint64_t)dateStyle;
- (unint64_t)hash;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)_migrateFromSkiHillWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKDateComplication

- (id)ntk_sectionIdentifier
{
  v2 = @"com.apple.NanoCalendar";
  if (NTKIsSystemAppRestrictedOrRemoved(@"com.apple.NanoCalendar")) {
    v2 = @"com.apple.DateComplicationsHost";
  }
  return v2;
}

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[NTKDateComplicationController textForDateStyle:[(NTKDateComplication *)self dateStyle]];
  if (![v7 length])
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKDateComplication;
    uint64_t v8 = [(NTKComplication *)&v10 ntk_localizedNameWithOptions:a3 forRichComplicationSlot:v4];

    v7 = (void *)v8;
  }
  return v7;
}

+ (id)complicationWithDateStyle:(unint64_t)a3
{
  BOOL v4 = (void *)[objc_alloc((Class)a1) initWithComplicationType:1];
  v4[4] = a3;
  uint64_t v5 = [v4 _generateUniqueIdentifier];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NTKDateComplication)initWithComplicationType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKDateComplication;
  v3 = [(NTKComplication *)&v8 initWithComplicationType:a3];
  BOOL v4 = v3;
  if (v3)
  {
    v3->_dateStyle = 0;
    uint64_t v5 = [(NTKDateComplication *)v3 _generateUniqueIdentifier];
    uniqueIdentifier = v4->super._uniqueIdentifier;
    v4->super._uniqueIdentifier = (NSString *)v5;
  }
  return v4;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4, self->_dateStyle);
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 localeMatchesContext:v7])
  {
    if ([(NTKComplication *)self complicationType] == 16) {
      int v8 = [v6 lunarCalendarLocaleIDMatchesContext:v7] ^ 1;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)_generateUniqueIdentifier
{
  v3 = NSString;
  BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  uint64_t v5 = [v4 stringValue];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_dateStyle];
  id v7 = [v3 stringWithFormat:@"%@-datestyle:%@", v5, v6];

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDateComplication;
  return [(NTKComplication *)&v3 hash] + 1000000 * self->_dateStyle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKDateComplication;
  id result = [(NTKComplication *)&v5 copyWithZone:a3];
  *((void *)result + 4) = self->_dateStyle;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKDateComplication;
  id v4 = a3;
  [(NTKComplication *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dateStyle, @"DateComplicationDateStyleKey", v5.receiver, v5.super_class);
}

- (NTKDateComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKDateComplication;
  objc_super v5 = [(NTKComplication *)&v9 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"DateComplicationDateStyleKey"]) {
      v5->_dateStyle = [v4 decodeIntegerForKey:@"DateComplicationDateStyleKey"];
    }
    else {
      [(NTKDateComplication *)v5 _migrateFromSkiHillWithCoder:v4];
    }
    uint64_t v6 = [(NTKDateComplication *)v5 _generateUniqueIdentifier];
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)_migrateFromSkiHillWithCoder:(id)a3
{
  unint64_t v4 = [(NTKComplication *)self complicationType];
  switch(v4)
  {
    case 0x4000000uLL:
      unint64_t v5 = 8;
LABEL_7:
      self->_dateStyle = v5;
      break;
    case 0x2000000uLL:
      unint64_t v5 = 4;
      goto LABEL_7;
    case 1uLL:
      self->_dateStyle = 0;
      break;
    default:
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F28498];
      int v8 = [NSNumber numberWithUnsignedInteger:v4];
      [v6 raise:v7, @"Unknown date complication type %@", v8 format];

      break;
  }
  [(NTKComplication *)self _setComplicationType:1];
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKDateComplication;
  [(NTKComplication *)&v7 _addKeysToJSONDictionary:v4];
  unint64_t dateStyle = self->_dateStyle;
  if (dateStyle)
  {
    uint64_t v6 = NTKFaceBundleStringFromDateStyle(dateStyle);
    [v4 setObject:v6 forKeyedSubscript:@"date style"];
  }
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKDateComplication;
  objc_super v7 = [(NTKComplication *)&v13 _initWithComplicationType:a3 JSONDictionary:v6];
  if (v7)
  {
    int v8 = [v6 objectForKeyedSubscript:@"date style"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for key '%@' must be a string - invalid value: %@", @"date style", v8 format];
      }
      uint64_t v12 = 0;
      if (!NTKFaceBundleGetDateStyleFromString(v8, &v12)) {
        [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"invalid value for '%@': %@", @"date style", v8 format];
      }
      v7[4] = v12;
    }
    else
    {
      v7[4] = 0;
    }
    uint64_t v9 = [v7 _generateUniqueIdentifier];
    objc_super v10 = (void *)v7[1];
    v7[1] = v9;
  }
  return v7;
}

- (unint64_t)dateStyle
{
  return self->_dateStyle;
}

@end