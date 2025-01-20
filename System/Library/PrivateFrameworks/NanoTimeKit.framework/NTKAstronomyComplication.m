@interface NTKAstronomyComplication
+ (BOOL)supportsSecureCoding;
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (NTKAstronomyComplication)initWithCoder:(id)a3;
- (id)_generateUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)appIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)localizedDetailText;
- (id)localizedKeylineLabelText;
- (unint64_t)vista;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKAstronomyComplication

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = a3 - 39;
  if (a3 - 39 <= 2)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithComplicationType:a3];
    v7[4] = v6;
    v8 = [v7 _generateUniqueIdentifier];
    [v7 setUniqueIdentifier:v8];

    [v5 addObject:v7];
  }
  return v5;
}

- (id)appIdentifier
{
  return @"com.apple.nanotimekit.astronomy";
}

- (id)localizedKeylineLabelText
{
  v2 = NUNIAstronomyVistaNameLocalizationKeyForValue(self->_vista);
  v3 = [v2 stringByAppendingString:@"_COMPANION"];

  v4 = NTKCompanionClockFaceLocalizedString(v3, v3);

  return v4;
}

- (id)localizedDetailText
{
  v2 = NUNIAstronomyVistaNameLocalizationKeyForValue(self->_vista);
  v3 = [v2 stringByAppendingString:@"_COMPANION"];

  v4 = NTKCompanionClockFaceLocalizedString(v3, v3);

  return v4;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  return NUNIAstronomyVistaNameForValue(self->_vista);
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return [a3 localeMatchesContext:a4] ^ 1;
}

- (id)_generateUniqueIdentifier
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v5 = [v4 stringValue];
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_vista];
  v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyComplication;
  id result = [(NTKComplication *)&v5 copyWithZone:a3];
  *((void *)result + 4) = self->_vista;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKAstronomyComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKAstronomyComplication;
  objc_super v5 = [(NTKComplication *)&v10 initWithCoder:v4];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAstronomyComplicationVistaKey"];
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil _vista", objc_opt_class() format];
    }
    uint64_t v7 = NUNIAstronomyVistaValueForName(v6);
    v5->_vista = v7;
    if (v7 == -1) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have invalid _vista '%@'", objc_opt_class(), v6 format];
    }
    v8 = [(NTKAstronomyComplication *)v5 _generateUniqueIdentifier];
    [(NTKComplication *)v5 setUniqueIdentifier:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKAstronomyComplication;
  id v4 = a3;
  [(NTKComplication *)&v6 encodeWithCoder:v4];
  objc_super v5 = NUNIAstronomyVistaNameForValue(self->_vista);
  objc_msgSend(v4, "encodeObject:forKey:", v5, @"kAstronomyComplicationVistaKey", v6.receiver, v6.super_class);
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKAstronomyComplication;
  id v4 = a3;
  [(NTKComplication *)&v6 _addKeysToJSONDictionary:v4];
  objc_super v5 = NUNIAstronomyVistaNameForValue(self->_vista);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, @"astronomy vista", v6.receiver, v6.super_class);
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKAstronomyComplication;
  uint64_t v7 = [(NTKComplication *)&v12 _initWithComplicationType:a3 JSONDictionary:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"astronomy vista"];
    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"missing value for key '%@'", @"astronomy vista" format];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"value for key '%@' must be String - invalid value: %@", @"astronomy vista", v8 format];
    }
    uint64_t v9 = NUNIAstronomyVistaValueForName(v8);
    v7[4] = v9;
    if (v9 == -1) {
      [MEMORY[0x1E4F1CA00] raise:@"NTKFaceBundleException", @"invalid value '%@' for key '%@'", v8, @"astronomy vista" format];
    }
    objc_super v10 = [v7 _generateUniqueIdentifier];
    [v7 setUniqueIdentifier:v10];
  }
  return v7;
}

- (unint64_t)vista
{
  return self->_vista;
}

@end