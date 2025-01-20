@interface NTKWidgetComplication
+ (BOOL)supportsSecureCoding;
+ (NTKWidgetComplication)complicationWithDescriptor:(id)a3;
- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (CLKWidgetComplicationDescriptor)descriptor;
- (INIntent)intent;
- (NSString)containerBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (NTKWidgetComplication)initWithCoder:(id)a3;
- (id)_createUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)analyticsIdentifier;
- (id)appIdentifier;
- (id)clkComplicationDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)description;
- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKWidgetComplication

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  if (a3 <= 1) {
    char v5 = 1;
  }
  else {
    char v5 = a3;
  }
  uint64_t v33 = 0;
  v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  id v38 = 0;
  v6 = NTKClockFaceLocalizedString(@"COMPLICATION_JOINED_DESCRIPTORS", @"%@: %@");
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __99__NTKWidgetComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke;
  v30 = &unk_1E62C0C78;
  v32 = &v33;
  id v7 = v6;
  id v31 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(&v27);
  if ((v5 & 2) != 0)
  {
    v9 = [(NTKComplication *)self localizedSectionHeaderName];
    v8[2](v8, v9);
  }
  v10 = objc_msgSend(MEMORY[0x1E4F19A30], "currentDevice", v27, v28, v29, v30);
  v11 = NTKSharedWidgetComplicationProvider((uint64_t)v10);
  v12 = [(NTKWidgetComplication *)self descriptor];
  v13 = [v11 infoForDescriptor:v12];

  if (v5)
  {
    v14 = [v13 localizedDisplayName];
    v15 = [v34[5] localizedLowercaseString];
    v16 = [v14 localizedLowercaseString];
    char v17 = NTKEqualObjects(v15, v16);

    if ((v17 & 1) == 0) {
      v8[2](v8, v14);
    }
  }
  if (![v34[5] length])
  {
    uint64_t v18 = [v13 localizedAppName];
    id v19 = v34[5];
    v34[5] = (id)v18;

    id v20 = v34[5];
    v21 = [(NTKWidgetComplication *)self descriptor];
    v22 = [v21 containerBundleIdentifier];
    LOBYTE(v20) = NTKEqualObjects(v20, v22);

    char v23 = v20 ^ 1;
    if ((v5 & 1) == 0) {
      char v23 = 1;
    }
    if ((v23 & 1) == 0)
    {
      v24 = [(NTKComplication *)self localizedSectionHeaderName];
      if ([v24 length]) {
        objc_storeStrong(v34 + 5, v24);
      }
    }
  }
  v25 = (void *)[v34[5] copy];

  _Block_object_dispose(&v33, 8);
  return v25;
}

void __99__NTKWidgetComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 length])
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length])
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      char v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    else
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = v8;
      char v5 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v7;
    }
  }
}

+ (NTKWidgetComplication)complicationWithDescriptor:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithComplicationType:56];
  uint64_t v6 = [v4 copy];

  id v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [v5 _createUniqueIdentifier];
  [v5 setUniqueIdentifier:v8];

  return (NTKWidgetComplication *)v5;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  uint64_t v6 = +[NTKCompanionWidgetComplicationManager instanceForDevice:a4];
  id v7 = [(NTKWidgetComplication *)self descriptor];
  id v8 = [v6 sampleTemplateForWidget:v7 family:a3];

  v9 = [v8 creationDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  v12 = NSString;
  v13 = [(NTKComplication *)self uniqueIdentifier];
  v14 = [v12 stringWithFormat:@"%@,%ld", v13, (uint64_t)v11];

  return v14;
}

- (id)analyticsIdentifier
{
  uint64_t v3 = NSString;
  id v4 = NTKReportingValueForComplication(self);
  char v5 = [(NTKWidgetComplication *)self descriptor];
  uint64_t v6 = [v5 extensionBundleIdentifier];
  id v7 = [(NTKWidgetComplication *)self descriptor];
  id v8 = [v7 kind];
  v9 = [v3 stringWithFormat:@"%@:%@:%@", v4, v6, v8];

  return v9;
}

- (id)_createUniqueIdentifier
{
  uint64_t v3 = NSString;
  id v4 = [(NTKWidgetComplication *)self descriptor];
  char v5 = [v4 containerBundleIdentifier];
  uint64_t v6 = [(NTKWidgetComplication *)self descriptor];
  id v7 = [v6 extensionBundleIdentifier];
  id v8 = [(NTKWidgetComplication *)self descriptor];
  v9 = [v8 kind];
  double v10 = [(NTKWidgetComplication *)self descriptor];
  double v11 = [v10 intentReference];
  v12 = [v3 stringWithFormat:@"%@-%@-%@-%li", v5, v7, v9, objc_msgSend(v11, "indexingHash")];

  return v12;
}

- (id)appIdentifier
{
  v2 = [(NTKWidgetComplication *)self descriptor];
  uint64_t v3 = [v2 containerBundleIdentifier];

  return v3;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = NTKSharedWidgetComplicationProvider((uint64_t)a4);
  id v7 = [NSNumber numberWithInteger:a3];
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  LOBYTE(a3) = [v6 isComplicationAvailable:self forFamilies:v8];

  return a3;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return 1;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKWidgetComplication;
  return [(NTKComplication *)&v5 snapshotContext:a3 isStaleRelativeToContext:a4];
}

- (NSString)containerBundleIdentifier
{
  return (NSString *)[(CLKWidgetComplicationDescriptor *)self->_descriptor containerBundleIdentifier];
}

- (NSString)extensionBundleIdentifier
{
  return (NSString *)[(CLKWidgetComplicationDescriptor *)self->_descriptor extensionBundleIdentifier];
}

- (NSString)kind
{
  return (NSString *)[(CLKWidgetComplicationDescriptor *)self->_descriptor kind];
}

- (INIntent)intent
{
  v2 = [(CLKWidgetComplicationDescriptor *)self->_descriptor intentReference];
  uint64_t v3 = [v2 intent];

  return (INIntent *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKWidgetComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKWidgetComplication;
  objc_super v5 = [(NTKComplication *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (CLKWidgetComplicationDescriptor *)v6;

    id v8 = [(NTKWidgetComplication *)v5 _createUniqueIdentifier];
    [(NTKComplication *)v5 setUniqueIdentifier:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKWidgetComplication;
  id v4 = a3;
  [(NTKThirdPartyComplication *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptor, @"descriptor", v5.receiver, v5.super_class);
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKWidgetComplication;
  id v7 = [(NTKComplication *)&v14 _initWithComplicationType:a3 JSONDictionary:v6];
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"descriptor"];
    v9 = (void *)MEMORY[0x1E4F28498];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [MEMORY[0x1E4F1CA00] raise:*v9 format:@"CLKWidgetComplicationDescriptor dictionary is nil or not a dictionary"];
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F19AF8]) initWithJSONObjectRepresentation:v8];
    double v11 = (void *)v7[4];
    v7[4] = v10;

    if (!v7[4] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [MEMORY[0x1E4F1CA00] raise:*v9 format:@"CLKWidgetComplicationDescriptor is not defined or an incorrect class"];
    }
    v12 = [v7 _createUniqueIdentifier];
    [v7 setUniqueIdentifier:v12];
  }
  return v7;
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKWidgetComplication;
  id v4 = a3;
  [(NTKThirdPartyComplication *)&v9 _addKeysToJSONDictionary:v4];
  objc_super v5 = [(NTKWidgetComplication *)self descriptor];
  id v6 = [v5 containerBundleIdentifier];
  [v4 setObject:v6 forKeyedSubscript:@"app"];

  id v7 = [(NTKWidgetComplication *)self descriptor];
  id v8 = [v7 JSONObjectRepresentation];
  [v4 setObject:v8 forKeyedSubscript:@"descriptor"];
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)NTKWidgetComplication;
  id v4 = [(NTKComplication *)&v10 description];
  objc_super v5 = [(CLKWidgetComplicationDescriptor *)self->_descriptor extensionBundleIdentifier];
  id v6 = [(CLKWidgetComplicationDescriptor *)self->_descriptor kind];
  id v7 = [(CLKWidgetComplicationDescriptor *)self->_descriptor intentReference];
  id v8 = [v3 stringWithFormat:@"%@ (%@, %@, %lli)", v4, v5, v6, objc_msgSend(v7, "indexingHash")];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKWidgetComplication;
  id v4 = [(NTKComplication *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_descriptor);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(NTKWidgetComplication *)self descriptor],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        [v4 descriptor],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqual:v6],
        v6,
        v5,
        v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKWidgetComplication;
    BOOL v8 = [(NTKComplication *)&v10 isEqual:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)clkComplicationDescriptor
{
  return 0;
}

- (CLKWidgetComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
}

@end