@interface VUIFeatureManager
+ (BOOL)isUniquelyiPadEnabled;
+ (id)sharedInstance;
- (BOOL)isFeatureEnabled:(id)a3;
- (NSDictionary)features;
- (VUIFeatureManager)init;
- (id)_allFeatures;
- (id)availableFeatures;
- (id)osFeatureFlagsJSON;
- (void)setFeatureValue:(BOOL)a3 forFeature:(id)a4;
- (void)setFeatures:(id)a3;
@end

@implementation VUIFeatureManager

- (id)osFeatureFlagsJSON
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v3 forKeyedSubscript:@"pearl"];

  v4 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v4 forKeyedSubscript:@"hublot"];

  v5 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v5 forKeyedSubscript:@"monaco"];

  v6 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v6 forKeyedSubscript:@"sports_register_init2"];

  v7 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v7 forKeyedSubscript:@"sports_tier_manager"];

  v8 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v8 forKeyedSubscript:@"sctie"];

  v9 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v9 forKeyedSubscript:@"ludicolo"];

  v10 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v10 forKeyedSubscript:@"fromm"];

  v11 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v11 forKeyedSubscript:@"barrette_menu"];

  v12 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v12 forKeyedSubscript:@"tractor"];

  v13 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v13 forKeyedSubscript:@"coral"];

  v14 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v14 forKeyedSubscript:@"garnet"];

  v15 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v15 forKeyedSubscript:@"chiolite"];

  v16 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v16 forKeyedSubscript:@"peppermint"];

  v17 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v17 forKeyedSubscript:@"swiftui_sports_scoreboard"];

  v18 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v18 forKeyedSubscript:@"stratocaster"];

  v19 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v19 forKeyedSubscript:@"cayman718"];

  v20 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v20 forKeyedSubscript:@"nebula"];

  v21 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v21 forKeyedSubscript:@"metate"];

  v22 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v22 forKeyedSubscript:@"mocha"];

  v23 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v23 forKeyedSubscript:@"nyctosaurus"];

  v24 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v24 forKeyedSubscript:@"diamond"];

  v25 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v25 forKeyedSubscript:@"sports_app_live_activities"];

  v26 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v26 forKeyedSubscript:@"vampire"];

  v27 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v27 forKeyedSubscript:@"jintasaur"];

  v28 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v28 forKeyedSubscript:@"nimbus"];

  v29 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v29 forKeyedSubscript:@"testarossa"];

  v30 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  [v2 setObject:v30 forKeyedSubscript:@"malone"];

  return v2;
}

uint64_t __35__VUIFeatureManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIFeatureManager);
  uint64_t v1 = sharedInstance_sharedSettings;
  sharedInstance_sharedSettings = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (VUIFeatureManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)VUIFeatureManager;
  id v2 = [(VUIFeatureManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(VUIFeatureManager *)v2 _allFeatures];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __25__VUIFeatureManager_init__block_invoke;
    v10[3] = &unk_1E6DDCD38;
    id v11 = v5;
    id v6 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
    uint64_t v7 = [v6 copy];
    features = v3->_features;
    v3->_features = (NSDictionary *)v7;
  }
  return v3;
}

- (id)_allFeatures
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_3);
  }
  id v2 = (void *)sharedInstance_sharedSettings;
  return v2;
}

void __25__VUIFeatureManager_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[VUIFeatureFlag alloc] initWithFeatureDict:v5];

  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
}

- (id)availableFeatures
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  features = self->_features;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__VUIFeatureManager_availableFeatures__block_invoke;
  v8[3] = &unk_1E6DDCD60;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)features enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __38__VUIFeatureManager_availableFeatures__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 isAvailableForOS]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (BOOL)isFeatureEnabled:(id)a3
{
  id v3 = [(NSDictionary *)self->_features objectForKey:a3];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 enabled];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)setFeatureValue:(BOOL)a3 forFeature:(id)a4
{
  BOOL v4 = a3;
  char v5 = [(NSDictionary *)self->_features objectForKey:a4];
  if (v5)
  {
    id v6 = v5;
    [v5 setEnabled:v4];
    char v5 = v6;
  }
}

+ (BOOL)isUniquelyiPadEnabled
{
  if (!_os_feature_enabled_impl() || !_os_feature_enabled_impl()) {
    return 0;
  }
  return +[VUIDevice isPad];
}

- (NSDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
}

@end