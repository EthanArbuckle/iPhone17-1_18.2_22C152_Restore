@interface NTKBundleComplication
+ (BOOL)supportsSecureCoding;
+ (id)_revertedBundleComplicationFromJSONDictionary:(id)a3;
+ (id)bundledComplicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4;
+ (id)bundledComplicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5;
+ (id)bundledComplicationWithComplication:(id)a3;
- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (CLKCBundleComplication)complication;
- (CLKComplicationDescriptor)complicationDescriptor;
- (NTKBundleComplication)initWithCoder:(id)a3;
- (id)_generateUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4;
- (id)analyticsIdentifier;
- (id)appIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)description;
- (id)localizedKeylineLabelText;
- (id)ntk_sectionIdentifier;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKBundleComplication

- (id)ntk_sectionIdentifier
{
  v2 = [(NTKBundleComplication *)self complication];
  v3 = [v2 bundleIdentifier];
  v4 = +[NTKBundleComplicationManager sharedManager];
  v5 = [v4 sectionIdentifierForBundleIdentifier:v3];

  return v5;
}

+ (id)bundledComplicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  return (id)[a1 bundledComplicationWithBundleIdentifier:a3 appBundleIdentifier:a4 complicationDescriptor:0];
}

+ (id)bundledComplicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NTKBundleComplicationManager sharedManager];
  int v12 = [v11 bundleComplicationExistsForAppBundleIdentifier:v9];

  if (v12)
  {
    v13 = [MEMORY[0x1E4F59148] complicationWithBundleIdentifier:v8 appBundleIdentifier:v9 complicationDescriptor:v10];
    v14 = [a1 bundledComplicationWithComplication:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)bundledComplicationWithComplication:(id)a3
{
  v3 = (CLKCBundleComplication *)a3;
  v4 = [(NTKComplication *)[NTKBundleComplication alloc] initWithComplicationType:48];
  complication = v4->_complication;
  v4->_complication = v3;
  v6 = v3;

  uint64_t v7 = [(NTKBundleComplication *)v4 _generateUniqueIdentifier];
  uniqueIdentifier = v4->super._uniqueIdentifier;
  v4->super._uniqueIdentifier = (NSString *)v7;

  return v4;
}

- (id)_generateUniqueIdentifier
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v5 = [v4 stringValue];
  v6 = [(CLKCBundleComplication *)self->_complication appBundleIdentifier];
  uint64_t v7 = [(CLKCBundleComplication *)self->_complication bundleIdentifier];
  id v8 = [v3 stringWithFormat:@"%@-%@-%@", v5, v6, v7];

  id v9 = [(CLKCBundleComplication *)self->_complication complicationDescriptor];

  if (v9)
  {
    id v10 = [(CLKCBundleComplication *)self->_complication complicationDescriptor];
    v11 = [v10 identifier];
    uint64_t v12 = [v8 stringByAppendingFormat:@"-%@", v11];

    id v8 = (void *)v12;
  }

  return v8;
}

- (id)analyticsIdentifier
{
  v3 = NSString;
  v4 = NTKReportingValueForComplication(self);
  v5 = [v3 stringWithFormat:@"%@:", v4];

  v6 = [(CLKCBundleComplication *)self->_complication complicationDescriptor];

  if (v6)
  {
    uint64_t v7 = [(CLKCBundleComplication *)self->_complication complicationDescriptor];
    id v8 = [v7 identifier];
    uint64_t v9 = [v5 stringByAppendingFormat:@"%@", v8];

    v5 = (void *)v9;
  }

  return v5;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  return (CLKComplicationDescriptor *)[(CLKCBundleComplication *)self->_complication complicationDescriptor];
}

- (id)appIdentifier
{
  v3 = +[NTKBundleComplicationManager sharedManager];
  v4 = [(CLKCBundleComplication *)self->_complication bundleIdentifier];
  v5 = [v3 groupIdentifierForBundleIdentifier:v4];

  if (v5)
  {
    v6 = v5;
LABEL_5:
    id v8 = v6;
    goto LABEL_6;
  }
  uint64_t v7 = [(CLKCBundleComplication *)self->_complication appBundleIdentifier];

  if (v7)
  {
    v6 = [(CLKCBundleComplication *)self->_complication appBundleIdentifier];
    goto LABEL_5;
  }
  id v8 = @"com.apple.nanotimekit.internal";
LABEL_6:

  return v8;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = +[NTKBundleComplicationManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__NTKBundleComplication_supportsComplicationFamily_forDevice___block_invoke;
  v9[3] = &unk_1E62C5C58;
  v9[4] = self;
  v9[5] = &v10;
  [v7 enumerateBundlesForComplicationFamily:a3 device:v6 withBlock:v9];

  LOBYTE(a3) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return a3;
}

void __62__NTKBundleComplication_supportsComplicationFamily_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = a2;
  uint64_t v9 = [v7 bundleIdentifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  v4 = NSString;
  v5 = [(NTKComplication *)self uniqueIdentifier];
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"%lx", objc_msgSend(v5, "hash"));

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Complication Bundle of %@", self->_complication];
}

- (id)localizedKeylineLabelText
{
  v3 = [(NTKBundleComplication *)self complication];
  v4 = [v3 complicationDescriptor];
  v5 = [v4 displayName];
  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = +[NTKBundleComplicationManager sharedManager];
    id v8 = [(CLKCBundleComplication *)self->_complication bundleIdentifier];
    id v6 = [v7 localizedComplicationNameForBundleIdentifier:v8];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplication;
  v4 = [(NTKComplication *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_complication);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_revertedBundleComplicationFromJSONDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"bundle identifier"];
  if ([v3 isEqualToString:@"com.apple.NanoReminders.ComplicationBundle"])
  {
    uint64_t v4 = 20;
LABEL_5:
    v5 = [[NTKComplication alloc] initWithComplicationType:v4];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"com.apple.MessagesComplication"])
  {
    uint64_t v4 = 23;
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKBundleComplication;
  uint64_t v7 = [(NTKComplication *)&v17 _initWithComplicationType:a3 JSONDictionary:v6];
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"bundle identifier"];
    uint64_t v9 = [v6 objectForKeyedSubscript:@"bundle app identifier"];
    int v10 = [v6 objectForKeyedSubscript:@"bundle app complication descriptor"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F196C8]) initWithJSONObjectRepresentation:v10];
    }
    else {
      v11 = 0;
    }
    uint64_t v12 = [MEMORY[0x1E4F59148] complicationWithBundleIdentifier:v8 appBundleIdentifier:v9 complicationDescriptor:v11];
    char v13 = (void *)v7[4];
    v7[4] = v12;

    uint64_t v14 = [v7 _generateUniqueIdentifier];
    v15 = (void *)v7[1];
    v7[1] = v14;
  }
  return v7;
}

- (NTKBundleComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKBundleComplication;
  v5 = [(NTKComplication *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ComplicationBundleIdentifierKey"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ComplicationBundleAppIdentifierKey"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ComplicationBundleComplicationDescriptorKey"];
    uint64_t v9 = [MEMORY[0x1E4F59148] complicationWithBundleIdentifier:v6 appBundleIdentifier:v7 complicationDescriptor:v8];
    complication = v5->_complication;
    v5->_complication = (CLKCBundleComplication *)v9;

    if (!v5->_complication) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil complication", objc_opt_class() format];
    }
    uint64_t v11 = [(NTKBundleComplication *)v5 _generateUniqueIdentifier];
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKBundleComplication;
  id v4 = a3;
  [(NTKComplication *)&v8 encodeWithCoder:v4];
  v5 = [(CLKCBundleComplication *)self->_complication bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"_ComplicationBundleIdentifierKey"];

  id v6 = [(CLKCBundleComplication *)self->_complication appBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"_ComplicationBundleAppIdentifierKey"];

  uint64_t v7 = [(CLKCBundleComplication *)self->_complication complicationDescriptor];
  [v4 encodeObject:v7 forKey:@"_ComplicationBundleComplicationDescriptorKey"];
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKBundleComplication;
  id v4 = a3;
  [(NTKComplication *)&v14 _addKeysToJSONDictionary:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v14.receiver, v14.super_class);
  id v6 = [(CLKCBundleComplication *)self->_complication bundleIdentifier];

  if (v6)
  {
    uint64_t v7 = [(CLKCBundleComplication *)self->_complication bundleIdentifier];
    [v5 setObject:v7 forKey:@"bundle identifier"];
  }
  objc_super v8 = [(CLKCBundleComplication *)self->_complication appBundleIdentifier];

  if (v8)
  {
    uint64_t v9 = [(CLKCBundleComplication *)self->_complication appBundleIdentifier];
    [v5 setObject:v9 forKey:@"bundle app identifier"];
  }
  int v10 = [(CLKCBundleComplication *)self->_complication complicationDescriptor];

  if (v10)
  {
    uint64_t v11 = [(CLKCBundleComplication *)self->_complication complicationDescriptor];
    uint64_t v12 = [v11 JSONObjectRepresentation];

    [v5 setObject:v12 forKey:@"bundle app complication descriptor"];
  }
  char v13 = (void *)[v5 copy];
  [v4 addEntriesFromDictionary:v13];
}

- (CLKCBundleComplication)complication
{
  return self->_complication;
}

- (void).cxx_destruct
{
}

- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!NTKIsRichComplicationFamily(a3))
  {
    id v10 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = [(NTKBundleComplication *)self complication];
  objc_super v8 = [v7 bundleIdentifier];

  if (a3 == 11)
  {
    if (![v8 isEqualToString:@"com.apple.NanoCompass.complications.altitude"]) {
      goto LABEL_24;
    }
    goto LABEL_9;
  }
  if (a3 != 8) {
    goto LABEL_24;
  }
  if ([v8 isEqualToString:@"com.apple.NanoCompass.complications.compass"])
  {
LABEL_9:
    v20 = v8;
    uint64_t v9 = @"com.apple.NanoCompass.complications.compass.bearing";
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"com.apple.NanoCompass.complications.altitude"])
  {
    v20 = v8;
    uint64_t v9 = @"com.apple.NanoCompass.complications.altitude.incline";
LABEL_10:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v16 isMemberOfClass:objc_opt_class()])
          {
            id v10 = v16;
            uint64_t v17 = [v10 complication];
            v18 = [(id)v17 bundleIdentifier];

            LOBYTE(v17) = [v18 isEqualToString:v9];
            if (v17) {
              goto LABEL_23;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    uint64_t v11 = _NTKLoggingObjectForDomain(17, (uint64_t)"NTKLoggingDomainMigration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NTKBundleComplication(BlueRidgeMigration) _migrateToFamily:withAllowedComplications:]((uint64_t)v9, v11);
    }
    id v10 = 0;
LABEL_23:
    objc_super v8 = v20;

    goto LABEL_25;
  }
LABEL_24:
  id v10 = 0;
LABEL_25:

LABEL_26:

  return v10;
}

@end