@interface SRSensorDescription
+ (id)sensorDescriptionForDeletionRecordFromDescription:(id)a3;
+ (id)sensorDescriptionForSensor:(id)a3;
+ (id)sensorDescriptionsForAuthorizationService:(id)a3;
+ (void)initialize;
- (BOOL)metadataEnabled;
- (BOOL)sensorConfigurationEnabled;
- (BOOL)supportsCurrentPlatform;
- (BOOL)supportsPlatform:(id)a3;
- (NSArray)filters;
- (NSArray)relatedSettingsCategories;
- (NSSet)eligibleDaemons;
- (NSString)authorizationService;
- (NSString)authorizationStoreCohort;
- (NSString)exportingSampleClass;
- (NSString)infoPlistAuthorizationCategory;
- (NSString)legacyName;
- (NSString)localizedAdditionalSampleDataNote;
- (NSString)name;
- (NSString)onDemandWriterService;
- (NSString)publicEntitlementValue;
- (NSString)sampleClass;
- (NSString)writerAuthorizationService;
- (NSString)writerBundleIdentifier;
- (SRSensorDescription)initWithDictionary:(id)a3;
- (double)roundingInterval;
- (id)description;
- (int64_t)authorizationVersion;
- (int64_t)datastoreBackend;
- (void)dealloc;
@end

@implementation SRSensorDescription

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogDataStream = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogDataStream");
  }
}

+ (id)sensorDescriptionForSensor:(id)a3
{
  uint64_t v4 = +[SRSensorsCache defaultCache]();

  return -[SRSensorsCache descriptionForSensor:](v4, a3);
}

- (SRSensorDescription)initWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SRSensorDescription;
  uint64_t v4 = [(SRSensorDescription *)&v17 init];
  if (v4)
  {
    v5 = (NSString *)(id)[a3 objectForKeyedSubscript:@"Name"];
    v4->_name = v5;
    if (!v5)
    {
      v6 = SRLogDataStream;
      if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = a3;
        _os_log_fault_impl(&dword_25C11B000, v6, OS_LOG_TYPE_FAULT, "Data stream defined without a name: %{public}@", buf, 0xCu);
      }
    }
    v7 = (NSString *)(id)[a3 objectForKeyedSubscript:@"AuthService"];
    v4->_authorizationService = v7;
    if (!v7)
    {
      v8 = SRLogDataStream;
      if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = a3;
        _os_log_fault_impl(&dword_25C11B000, v8, OS_LOG_TYPE_FAULT, "Data stream defined without an authorization service: %{public}@", buf, 0xCu);
      }
    }
    v4->_writerBundleIdentifier = (NSString *)(id)[a3 objectForKeyedSubscript:@"WriterBundleId"];
    uint64_t v9 = [a3 objectForKeyedSubscript:@"RelatedSettingsCategories"];
    v10 = (void *)MEMORY[0x263EFFA68];
    if (v9) {
      v10 = (void *)v9;
    }
    v4->_relatedSettingsCategories = (NSArray *)v10;
    v4->_publicEntitlementValue = (NSString *)(id)[a3 objectForKeyedSubscript:@"PublicEntitlementValue"];
    v4->_sampleClass = (NSString *)(id)[a3 objectForKeyedSubscript:@"SampleClass"];
    v4->_exportingSampleClass = (NSString *)(id)[a3 objectForKeyedSubscript:@"ExportingSampleClass"];
    v4->_legacySampleClass = (NSString *)(id)[a3 objectForKeyedSubscript:@"LegacySampleClass"];
    v4->_legacySampleClassLinkedBefore = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"LegacySampleClassLinkedBefore"), "unsignedIntValue");
    v11 = (NSString *)(id)[a3 objectForKeyedSubscript:@"SRInfoPlistAuthCategory"];
    v4->_infoPlistAuthorizationCategory = v11;
    if (!v11)
    {
      v12 = SRLogDataStream;
      if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = a3;
        _os_log_fault_impl(&dword_25C11B000, v12, OS_LOG_TYPE_FAULT, "Data stream defined without an Info.plist authorization category: %{public}@", buf, 0xCu);
      }
    }
    v4->_authorizationVersion = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AuthorizationVersion"), "integerValue");
    v4->_onDemandWriterService = (NSString *)(id)[a3 objectForKeyedSubscript:@"OnDemandWriterService"];
    v4->_supportedPlatforms = (NSDictionary *)(id)[a3 objectForKeyedSubscript:@"SupportedPlatforms"];
    v4->_writerAuthorizationService = (NSString *)(id)[a3 objectForKeyedSubscript:@"WriterAuthorizationService"];
    v4->_authorizationStoreCohort = (NSString *)(id)[a3 objectForKeyedSubscript:@"AuthorizationStoreCohort"];
    v4->_legacyName = (NSString *)(id)[a3 objectForKeyedSubscript:@"LegacyName"];
    v4->_filters = (NSArray *)(id)[a3 objectForKeyedSubscript:@"Filters"];
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RoundingIntervalSecs"), "doubleValue");
    v4->_roundingInterval = v13;
    uint64_t v14 = [a3 objectForKeyedSubscript:@"EligibleDaemons"];
    if (v14) {
      v4->_eligibleDaemons = (NSSet *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v14];
    }
    uint64_t v15 = [a3 objectForKeyedSubscript:@"Additions"];
    if (v15) {
      v4->_additions = (NSSet *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v15];
    }
    v4->_additionalSampleDataNoteKey = (NSString *)(id)[a3 objectForKeyedSubscript:@"AdditionalDataNote"];
    v4->_datastoreBackend = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StorageBackend"), "integerValue");
  }
  return v4;
}

+ (id)sensorDescriptionForDeletionRecordFromDescription:(id)a3
{
  v9[5] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  v8[0] = @"Name";
  v9[0] = objc_msgSend((id)objc_msgSend(a3, "name"), "sr_sensorForDeletionRecordsFromSensor");
  v8[1] = @"AuthService";
  v9[1] = [a3 authorizationService];
  v9[2] = @"SRDeletionRecord";
  v8[2] = @"SampleClass";
  v8[3] = @"StorageBackend";
  v9[3] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "datastoreBackend"));
  v8[4] = @"SRInfoPlistAuthCategory";
  v9[4] = [a3 infoPlistAuthorizationCategory];
  v5 = objc_msgSend(v4, "initWithDictionary:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 5));
  if ([a3 legacyName]) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "legacyName"), "sr_sensorForDeletionRecordsFromSensor"), @"LegacyName");
  }
  v6 = [[SRSensorDescription alloc] initWithDictionary:v5];

  return v6;
}

- (NSString)localizedAdditionalSampleDataNote
{
  result = self->_localizedAdditionalSampleDataNote;
  if (!result)
  {
    id v4 = (void *)[MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Srsensorreader.isa)];
    if (v4)
    {
      result = (NSString *)(id)[v4 localizedStringForKey:self->_additionalSampleDataNoteKey value:&stru_270985B88 table:0];
      self->_localizedAdditionalSampleDataNote = result;
    }
    else
    {
      return self->_localizedAdditionalSampleDataNote;
    }
  }
  return result;
}

- (NSString)sampleClass
{
  if (!self->_legacySampleClassLinkedBefore) {
    return self->_sampleClass;
  }
  if (self->_legacySampleClass)
  {
    int v3 = dyld_program_sdk_at_least();
    uint64_t v4 = 168;
    if (v3) {
      uint64_t v4 = 72;
    }
    return *(NSString **)((char *)&self->super.isa + v4);
  }
  else
  {
    v6 = SRLogDataStream;
    if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_25C11B000, v6, OS_LOG_TYPE_FAULT, "Found a linked before version but no legacy sample class", v7, 2u);
    }
    return 0;
  }
}

- (NSString)exportingSampleClass
{
  return self->_exportingSampleClass;
}

- (BOOL)metadataEnabled
{
  return [(NSSet *)self->_additions containsObject:@"Metadata"];
}

- (BOOL)sensorConfigurationEnabled
{
  return [(NSSet *)self->_additions containsObject:@"SensorConfiguration"];
}

- (BOOL)supportsPlatform:(id)a3
{
  if (!a3) {
    return 0;
  }
  supportedPlatforms = self->_supportedPlatforms;
  if (!supportedPlatforms) {
    return 1;
  }
  uint64_t v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](supportedPlatforms, "objectForKeyedSubscript:"), "objectForKeyedSubscript:", @"Enabled");

  return [v4 BOOLValue];
}

- (BOOL)supportsCurrentPlatform
{
  return [(SRSensorDescription *)self supportsPlatform:@"Phone"];
}

- (NSSet)eligibleDaemons
{
  result = self->_eligibleDaemons;
  if (!result) {
    return (NSSet *)[MEMORY[0x263EFFA08] set];
  }
  return result;
}

- (void)dealloc
{
  self->_publicEntitlementValue = 0;
  self->_sampleClass = 0;

  self->_exportingSampleClass = 0;
  self->_localizedAdditionalSampleDataNote = 0;

  self->_onDemandWriterService = 0;
  self->_additionalSampleDataNoteKey = 0;

  v3.receiver = self;
  v3.super_class = (Class)SRSensorDescription;
  [(SRSensorDescription *)&v3 dealloc];
}

- (id)description
{
  v5 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", @"%@ (%p): name: %@, authService: %@, writer: %@, relatedSettings: %@, publicEntitlement: %@, sampleClass: %@, exportingSampleClass: %@, additions: %@, onDemandWriterId: %@, writerAuthService: %@, supportedPlatforms: %@, auth store cohort: %@, legacyName: %@, filters: %@, legacySampleClass: %@, legacySampleClassLinkedBefore: %u, roundingInterval: %f, eligibleDaemons: %@, storageBackend: %ld", NSStringFromClass(v3), self, self->_name, self->_authorizationService, self->_writerBundleIdentifier, self->_relatedSettingsCategories, self->_publicEntitlementValue, self->_sampleClass, self->_exportingSampleClass, self->_additions, self->_onDemandWriterService, self->_writerAuthorizationService, self->_supportedPlatforms, self->_authorizationStoreCohort, self->_legacyName, self->_filters,
               self->_legacySampleClass,
               self->_legacySampleClassLinkedBefore,
               *(void *)&self->_roundingInterval,
               [(SRSensorDescription *)self eligibleDaemons],
               self->_datastoreBackend);
}

+ (id)sensorDescriptionsForAuthorizationService:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = (void *)+[SRSensorsCache defaultCache]();
  v6 = -[SRSensorsCache allSensorDescriptions](v5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "authorizationService", (void)v13), "isEqualToString:", a3))objc_msgSend(v4, "addObject:", v11); {
      }
        }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v4, (void)v13);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)authorizationService
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)writerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)relatedSettingsCategories
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)publicEntitlementValue
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)infoPlistAuthorizationCategory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)writerAuthorizationService
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (NSString)onDemandWriterService
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)authorizationStoreCohort
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)legacyName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)filters
{
  return self->_filters;
}

- (double)roundingInterval
{
  return self->_roundingInterval;
}

- (int64_t)datastoreBackend
{
  return self->_datastoreBackend;
}

@end