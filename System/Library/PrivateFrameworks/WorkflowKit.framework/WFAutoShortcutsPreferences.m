@interface WFAutoShortcutsPreferences
+ (BOOL)supportsSecureCoding;
+ (id)appDescriptorWithBundleIdentifier:(id)a3;
+ (id)defaultSettingsForAppDescriptor:(id)a3;
+ (int)crossPlatformHashForAppDescriptor:(id)a3;
- (BOOL)isSiriEnabled;
- (BOOL)isSpotlightEnabled;
- (INAppDescriptor)appDescriptor;
- (NSData)cloudKitMetadata;
- (NSSet)disabledAutoShortcuts;
- (NSString)appName;
- (WFAutoShortcutsPreferences)initWithAppDescriptor:(id)a3 isSiriEnabled:(BOOL)a4 isSpotlightEnabled:(BOOL)a5 disabledAutoShortcuts:(id)a6 cloudKitMetadata:(id)a7;
- (WFAutoShortcutsPreferences)initWithAppDescriptor:(id)a3 isSiriEnabled:(BOOL)a4 isSpotlightEnabled:(BOOL)a5 disabledAutoShortcuts:(id)a6 cloudKitMetadata:(id)a7 lastSyncedHash:(int64_t)a8;
- (WFAutoShortcutsPreferences)initWithCoder:(id)a3;
- (int64_t)computedSyncHash;
- (int64_t)lastSyncedHash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppDescriptor:(id)a3;
- (void)setAppName:(id)a3;
- (void)setCloudKitMetadata:(id)a3;
- (void)setDisabledAutoShortcuts:(id)a3;
- (void)setIsSiriEnabled:(BOOL)a3;
- (void)setIsSpotlightEnabled:(BOOL)a3;
- (void)setLastSyncedHash:(int64_t)a3;
@end

@implementation WFAutoShortcutsPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitMetadata, 0);
  objc_storeStrong((id *)&self->_disabledAutoShortcuts, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setCloudKitMetadata:(id)a3
{
}

- (NSData)cloudKitMetadata
{
  return self->_cloudKitMetadata;
}

- (void)setDisabledAutoShortcuts:(id)a3
{
}

- (NSSet)disabledAutoShortcuts
{
  return self->_disabledAutoShortcuts;
}

- (void)setIsSpotlightEnabled:(BOOL)a3
{
  self->_isSpotlightEnabled = a3;
}

- (BOOL)isSpotlightEnabled
{
  return self->_isSpotlightEnabled;
}

- (void)setIsSiriEnabled:(BOOL)a3
{
  self->_isSiriEnabled = a3;
}

- (BOOL)isSiriEnabled
{
  return self->_isSiriEnabled;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppDescriptor:(id)a3
{
}

- (INAppDescriptor)appDescriptor
{
  return self->_appDescriptor;
}

- (int64_t)computedSyncHash
{
  v3 = objc_opt_new();
  v4 = [(WFAutoShortcutsPreferences *)self appDescriptor];

  if (v4)
  {
    v5 = [(WFAutoShortcutsPreferences *)self appDescriptor];
    id v6 = (id)objc_msgSend(v3, "combineInteger:", +[WFAutoShortcutsPreferences crossPlatformHashForAppDescriptor:](WFAutoShortcutsPreferences, "crossPlatformHashForAppDescriptor:", v5));
  }
  v7 = [(WFAutoShortcutsPreferences *)self disabledAutoShortcuts];

  if (v7)
  {
    v8 = [(WFAutoShortcutsPreferences *)self disabledAutoShortcuts];
    v9 = [v8 allObjects];
    v10 = [v9 sortedArrayUsingSelector:sel_compare_];

    id v11 = (id)[v3 combineContentsOfPropertyListObject:v10];
  }
  id v12 = (id)objc_msgSend(v3, "combineBool:", -[WFAutoShortcutsPreferences isSiriEnabled](self, "isSiriEnabled"));
  id v13 = (id)objc_msgSend(v3, "combineBool:", -[WFAutoShortcutsPreferences isSpotlightEnabled](self, "isSpotlightEnabled"));
  int64_t v14 = [v3 finalize];

  return v14;
}

- (WFAutoShortcutsPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appDescriptor"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isSiriEnabled"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isSpotlightEnabled"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"disabledAutoShortcuts"];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudKitMetadata"];
  uint64_t v13 = [v4 decodeInt64ForKey:@"lastSyncedHash"];

  int64_t v14 = [(WFAutoShortcutsPreferences *)self initWithAppDescriptor:v5 isSiriEnabled:v6 isSpotlightEnabled:v7 disabledAutoShortcuts:v11 cloudKitMetadata:v12 lastSyncedHash:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(WFAutoShortcutsPreferences *)self appDescriptor];
  [v7 encodeObject:v4 forKey:@"appDescriptor"];

  objc_msgSend(v7, "encodeBool:forKey:", -[WFAutoShortcutsPreferences isSiriEnabled](self, "isSiriEnabled"), @"isSiriEnabled");
  objc_msgSend(v7, "encodeBool:forKey:", -[WFAutoShortcutsPreferences isSpotlightEnabled](self, "isSpotlightEnabled"), @"isSpotlightEnabled");
  v5 = [(WFAutoShortcutsPreferences *)self disabledAutoShortcuts];
  [v7 encodeObject:v5 forKey:@"disabledAutoShortcuts"];

  uint64_t v6 = [(WFAutoShortcutsPreferences *)self cloudKitMetadata];
  [v7 encodeObject:v6 forKey:@"cloudKitMetadata"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[WFAutoShortcutsPreferences lastSyncedHash](self, "lastSyncedHash"), @"lastSyncedHash");
}

- (WFAutoShortcutsPreferences)initWithAppDescriptor:(id)a3 isSiriEnabled:(BOOL)a4 isSpotlightEnabled:(BOOL)a5 disabledAutoShortcuts:(id)a6 cloudKitMetadata:(id)a7
{
  return [(WFAutoShortcutsPreferences *)self initWithAppDescriptor:a3 isSiriEnabled:a4 isSpotlightEnabled:a5 disabledAutoShortcuts:a6 cloudKitMetadata:a7 lastSyncedHash:0x7FFFFFFFFFFFFFFFLL];
}

- (WFAutoShortcutsPreferences)initWithAppDescriptor:(id)a3 isSiriEnabled:(BOOL)a4 isSpotlightEnabled:(BOOL)a5 disabledAutoShortcuts:(id)a6 cloudKitMetadata:(id)a7 lastSyncedHash:(int64_t)a8
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFAutoShortcutsPreferences;
  v18 = [(WFAutoShortcutsPreferences *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_appDescriptor, a3);
    v19->_isSiriEnabled = a4;
    v19->_isSpotlightEnabled = a5;
    objc_storeStrong((id *)&v19->_disabledAutoShortcuts, a6);
    objc_storeStrong((id *)&v19->_cloudKitMetadata, a7);
    v19->_lastSyncedHash = a8;
    v20 = v19;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)crossPlatformHashForAppDescriptor:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"WFAutoShortcutsPreferences.m", 49, @"Invalid parameter not satisfying: %@", @"appDescriptor" object file lineNumber description];
  }
  uint64_t v6 = objc_opt_new();
  id v7 = [v5 applicationRecord];
  v8 = [v7 infoDictionary];
  uint64_t v9 = [v8 objectForKey:@"CFBundleDisplayName" ofClass:objc_opt_class()];
  if (!v9)
  {
    uint64_t v9 = [v8 objectForKey:@"CFBundleName" ofClass:objc_opt_class()];
  }
  uint64_t v10 = [v9 hash];
  id v11 = [v5 teamIdentifier];
  uint64_t v12 = [v11 hash];

  id v13 = (id)[v6 combineInteger:v10];
  id v14 = (id)[v6 combineInteger:v12];
  LODWORD(v10) = [v6 finalize];

  return v10;
}

+ (id)appDescriptorWithBundleIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithApplicationRecord:v5];
  return v6;
}

+ (id)defaultSettingsForAppDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  uint64_t v6 = [v5 lowercaseString];
  uint64_t v7 = [v6 hasPrefix:@"com.apple."];

  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = (void *)[v8 initWithAppDescriptor:v4 isSiriEnabled:v7 isSpotlightEnabled:1 disabledAutoShortcuts:v9 cloudKitMetadata:0 lastSyncedHash:0x7FFFFFFFFFFFFFFFLL];

  return v10;
}

@end