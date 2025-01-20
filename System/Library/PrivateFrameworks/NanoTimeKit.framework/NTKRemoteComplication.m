@interface NTKRemoteComplication
+ (BOOL)supportsSecureCoding;
+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3;
+ (id)_remoteStocksComplicationDescriptorWithIdentifier:(id)a3 forDevice:(id)a4;
+ (id)_remoteStocksComplicationWithIdentifier:(id)a3 forDevice:(id)a4;
+ (id)complicationWithClientIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5;
- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
- (CLKComplicationDescriptor)complicationDescriptor;
- (NSString)appBundleIdentifier;
- (NSString)clientIdentifier;
- (NTKRemoteComplication)initWithCoder:(id)a3;
- (NTKRemoteComplication)initWithComplicationType:(unint64_t)a3;
- (id)_generateUniqueIdentifier;
- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4;
- (id)analyticsIdentifier;
- (id)clkClientIdentifier;
- (id)clkComplicationDescriptor;
- (id)companionLocalizedKeylineLabelText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4;
- (id)description;
- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4;
- (id)watchLocalizedKeylineLabelText;
- (void)_addKeysToJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resetComplicationDescriptor;
@end

@implementation NTKRemoteComplication

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  if (a3 <= 1) {
    char v5 = 1;
  }
  else {
    char v5 = a3;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  v6 = NTKClockFaceLocalizedString(@"COMPLICATION_JOINED_DESCRIPTORS", @"%@: %@");
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __99__NTKRemoteComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke;
  v24 = &unk_1E62C0C78;
  v26 = &v27;
  id v7 = v6;
  id v25 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(&v21);
  if ((v5 & 2) != 0)
  {
    v9 = [(NTKComplication *)self localizedSectionHeaderName];
    v8[2](v8, v9);
  }
  if (v5)
  {
    v10 = [(NTKRemoteComplication *)self complicationDescriptor];
    v11 = [v10 displayName];
    v12 = [(id)v28[5] localizedLowercaseString];
    v13 = [v11 localizedLowercaseString];
    char v14 = NTKEqualObjects(v12, v13);

    if ((v14 & 1) == 0) {
      v8[2](v8, v11);
    }
  }
  if (!objc_msgSend((id)v28[5], "length", v21, v22, v23, v24))
  {
    v15 = NTKSharedRemoteComplicationProvider();
    v16 = [(NTKRemoteComplication *)self clientIdentifier];
    uint64_t v17 = [v15 localizedAppNameForClientIdentifier:v16];
    v18 = (void *)v28[5];
    v28[5] = v17;
  }
  v19 = (void *)[(id)v28[5] copy];

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __99__NTKRemoteComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke(uint64_t a1, void *a2)
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

- (NTKRemoteComplication)initWithComplicationType:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRemoteComplication;
  uint64_t v4 = [(NTKComplication *)&v14 initWithComplicationType:31];
  if (a3 == 9)
  {
    char v5 = [MEMORY[0x1E4F19A30] currentDevice];
    if ([v5 nrDeviceVersion] >> 16 <= 6) {
      uint64_t v6 = @"com.apple.stocks.watchapp.watchextension";
    }
    else {
      uint64_t v6 = @"com.apple.stocks.watchapp";
    }
    objc_storeStrong((id *)&v4->_clientIdentifier, v6);

    appBundleIdentifier = v4->_appBundleIdentifier;
    v4->_appBundleIdentifier = (NSString *)@"com.apple.stocks.watchapp";

    uint64_t v8 = *MEMORY[0x1E4F19658];
    v9 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v10 = +[NTKRemoteComplication _remoteStocksComplicationDescriptorWithIdentifier:v8 forDevice:v9];
    complicationDescriptor = v4->_complicationDescriptor;
    v4->_complicationDescriptor = (CLKComplicationDescriptor *)v10;
  }
  v12 = [(NTKRemoteComplication *)v4 _generateUniqueIdentifier];
  [(NTKComplication *)v4 setUniqueIdentifier:v12];

  return v4;
}

+ (id)complicationWithClientIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithComplicationType:31];
  v12 = (void *)v11[4];
  v11[4] = v8;
  id v13 = v8;

  objc_super v14 = (void *)v11[5];
  v11[5] = v9;
  id v15 = v9;

  v16 = (void *)v11[6];
  v11[6] = v10;

  uint64_t v17 = [v11 _generateUniqueIdentifier];
  [v11 setUniqueIdentifier:v17];

  return v11;
}

- (id)analyticsIdentifier
{
  uint64_t v3 = NSString;
  uint64_t v4 = NTKReportingValueForComplication(self);
  char v5 = [(NTKRemoteComplication *)self appBundleIdentifier];
  uint64_t v6 = [(CLKComplicationDescriptor *)self->_complicationDescriptor identifier];
  id v7 = [v3 stringWithFormat:@"%@:%@:%@", v4, v5, v6];

  return v7;
}

- (id)_generateUniqueIdentifier
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  char v5 = [v4 stringValue];
  uint64_t v6 = [(NTKRemoteComplication *)self appBundleIdentifier];
  id v7 = [(CLKComplicationDescriptor *)self->_complicationDescriptor identifier];
  id v8 = [v3 stringWithFormat:@"%@-%@-%@", v5, v6, v7];

  return v8;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 9)
  {
    uint64_t v4 = *MEMORY[0x1E4F19658];
    char v5 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v6 = [a1 _remoteStocksComplicationWithIdentifier:v4 forDevice:v5];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (void)resetComplicationDescriptor
{
  id v5 = [(CLKComplicationDescriptor *)self->_complicationDescriptor supportedFamilies];
  uint64_t v3 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptorWithSupportedFamilies:v5];
  complicationDescriptor = self->_complicationDescriptor;
  self->_complicationDescriptor = v3;
}

- (id)watchLocalizedKeylineLabelText
{
  uint64_t v3 = [(NTKRemoteComplication *)self complicationDescriptor];
  uint64_t v4 = [v3 displayName];
  if (![v4 length])
  {
    id v5 = NTKSharedRemoteComplicationProvider();
    uint64_t v6 = [(NTKRemoteComplication *)self clientIdentifier];
    uint64_t v7 = [v5 localizedAppNameForClientIdentifier:v6];

    uint64_t v4 = (void *)v7;
  }

  return v4;
}

- (id)companionLocalizedKeylineLabelText
{
  uint64_t v3 = [(NTKRemoteComplication *)self complicationDescriptor];
  uint64_t v4 = [v3 displayName];
  if (![v4 length])
  {
    id v5 = NTKSharedRemoteComplicationProvider();
    uint64_t v6 = [(NTKRemoteComplication *)self clientIdentifier];
    uint64_t v7 = [v5 localizedAppNameForClientIdentifier:v6];

    uint64_t v4 = (void *)v7;
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)NTKRemoteComplication;
  uint64_t v4 = [(NTKComplication *)&v9 description];
  id v5 = [(NTKRemoteComplication *)self clientIdentifier];
  uint64_t v6 = [(CLKComplicationDescriptor *)self->_complicationDescriptor identifier];
  uint64_t v7 = [v3 stringWithFormat:@"%@ (%@, %@)", v4, v5, v6];

  return v7;
}

+ (id)_remoteStocksComplicationDescriptorWithIdentifier:(id)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v5 isRunningGraceOrLater])
  {
    uint64_t v7 = [&unk_1F16E9C88 arrayByAddingObject:&unk_1F16E1830];
  }
  else
  {
    uint64_t v7 = &unk_1F16E9C88;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"63DBFE2B-B226-4EF1-AFBB-43E4CCE6A43E"];
  int v9 = [v5 supportsCapability:v8];

  if (v9)
  {
    uint64_t v10 = [v7 arrayByAddingObject:&unk_1F16E1848];

    uint64_t v7 = (void *)v10;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F196C8]);
  v12 = (void *)[v11 initWithIdentifier:v6 displayName:&stru_1F1635E90 supportedFamilies:v7 userInfo:MEMORY[0x1E4F1CC08]];

  return v12;
}

+ (id)_remoteStocksComplicationWithIdentifier:(id)a3 forDevice:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F19A30];
  id v7 = a4;
  id v8 = a3;
  int v9 = [v6 currentDevice];
  if ([v9 nrDeviceVersion] >> 16 <= 6) {
    uint64_t v10 = @"com.apple.stocks.watchapp.watchextension";
  }
  else {
    uint64_t v10 = @"com.apple.stocks.watchapp";
  }
  id v11 = v10;
  v12 = [a1 _remoteStocksComplicationDescriptorWithIdentifier:v8 forDevice:v7];

  id v13 = [a1 complicationWithClientIdentifier:v11 appBundleIdentifier:@"com.apple.stocks.watchapp" complicationDescriptor:v12];

  return v13;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = [(NTKRemoteComplication *)self complicationDescriptor];
  id v6 = [v5 supportedFamilies];
  id v7 = [NSNumber numberWithInteger:a3];
  char v8 = [v6 containsObject:v7];

  return v8;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  id v6 = +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:a4];
  id v7 = [(NTKRemoteComplication *)self clientIdentifier];
  complicationDescriptor = self->_complicationDescriptor;
  int v9 = [(NTKRemoteComplication *)self appBundleIdentifier];
  uint64_t v10 = [v6 sampleTemplateForClientIdentifier:v7 descriptor:complicationDescriptor applicationID:v9 family:a3];

  id v11 = [v10 creationDate];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  objc_super v14 = NSString;
  id v15 = [(NTKRemoteComplication *)self appBundleIdentifier];
  v16 = [(CLKComplicationDescriptor *)self->_complicationDescriptor identifier];
  uint64_t v17 = [v14 stringWithFormat:@"%@,%@,%lx", v15, v16, (uint64_t)v13];

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKRemoteComplication;
  id v4 = [(NTKComplication *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NTKRemoteComplication *)self clientIdentifier];
  id v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;

  uint64_t v7 = [(NTKRemoteComplication *)self appBundleIdentifier];
  char v8 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v7;

  objc_storeStrong((id *)v4 + 6, self->_complicationDescriptor);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKRemoteComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NTKRemoteComplication;
  uint64_t v5 = [(NTKComplication *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteComplicationClientIdentifierKey"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    char v8 = [(NTKRemoteComplication *)v5 clientIdentifier];

    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil client identifier", objc_opt_class() format];
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteComplicationAppBundleIdentifierKey"];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v9;

    id v11 = [(NTKRemoteComplication *)v5 appBundleIdentifier];

    if (!v11) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ cannot have nil app bundle identifier", objc_opt_class() format];
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteComplicationComplicationDescriptorKey"];
    complicationDescriptor = v5->_complicationDescriptor;
    v5->_complicationDescriptor = (CLKComplicationDescriptor *)v12;

    if (!v5->_complicationDescriptor)
    {
      uint64_t v14 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
      id v15 = v5->_complicationDescriptor;
      v5->_complicationDescriptor = (CLKComplicationDescriptor *)v14;
    }
    v16 = [(NTKRemoteComplication *)v5 _generateUniqueIdentifier];
    [(NTKComplication *)v5 setUniqueIdentifier:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRemoteComplication;
  [(NTKThirdPartyComplication *)&v3 encodeWithCoder:a3];
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRemoteComplication;
  [(NTKThirdPartyComplication *)&v3 _addKeysToJSONDictionary:a3];
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)NTKRemoteComplication;
  uint64_t v7 = [(NTKComplication *)&v28 _initWithComplicationType:31 JSONDictionary:v6];
  char v8 = (id *)v7;
  if (v7)
  {
    if (a3 == 9)
    {
      uint64_t v9 = (void *)v7[5];
      v7[5] = @"com.apple.stocks.watchapp";

      objc_super v10 = [MEMORY[0x1E4F19A30] currentDevice];
      if ([v10 nrDeviceVersion] >> 16 <= 6) {
        id v11 = @"com.apple.stocks.watchapp.watchextension";
      }
      else {
        id v11 = @"com.apple.stocks.watchapp";
      }
      objc_storeStrong(v8 + 4, v11);

      uint64_t v12 = *MEMORY[0x1E4F19658];
      double v13 = [MEMORY[0x1E4F19A30] currentDevice];
      uint64_t v14 = +[NTKRemoteComplication _remoteStocksComplicationDescriptorWithIdentifier:v12 forDevice:v13];
      id v15 = v8[6];
      v8[6] = (id)v14;
    }
    else
    {
      uint64_t v16 = [v6 objectForKeyedSubscript:@"app"];
      id v17 = v8[5];
      v8[5] = (id)v16;

      objc_super v18 = [v6 objectForKeyedSubscript:@"extension"];
      if (!v18)
      {
        v19 = (void *)MEMORY[0x1E4F1CA00];
        v20 = [v8 appBundleIdentifier];
        [v19 raise:@"NTKFaceBundleException", @"complication of type '%@' missing value for key '%@'", v20, @"extension" format];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v22 = [v8 appBundleIdentifier];
        [v21 raise:@"NTKFaceBundleException", @"complication of type '%@' value for key '%@' must be a string - invalid value: %@", v22, @"extension", v18 format];
      }
      id v23 = v8[4];
      v8[4] = v18;
      id v15 = v18;

      double v13 = [v6 objectForKeyedSubscript:@"complication descriptor"];
      if (v13)
      {
        uint64_t v24 = [objc_alloc(MEMORY[0x1E4F196C8]) initWithJSONObjectRepresentation:v13];
      }
      else
      {
        uint64_t v24 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
      }
      id v25 = v8[6];
      v8[6] = (id)v24;
    }
    v26 = [v8 _generateUniqueIdentifier];
    [v8 setUniqueIdentifier:v26];
  }
  return v8;
}

- (id)clkClientIdentifier
{
  return self->_clientIdentifier;
}

- (id)clkComplicationDescriptor
{
  return self->_complicationDescriptor;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end