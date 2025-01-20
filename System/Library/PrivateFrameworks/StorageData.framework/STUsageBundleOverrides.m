@interface STUsageBundleOverrides
+ (id)overrides;
+ (id)overridesFor:(id)a3;
- (BOOL)ignore;
- (NSString)replaceWithZeroSizeApp;
- (STUsageBundleOverrides)initWithDictionary:(id)a3;
@end

@implementation STUsageBundleOverrides

- (STUsageBundleOverrides)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STUsageBundleOverrides;
  v5 = [(STUsageBundleOverrides *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__STUsageBundleOverrides_initWithDictionary___block_invoke;
    v8[3] = &unk_264305340;
    v9 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v6;
}

uint64_t __45__STUsageBundleOverrides_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

+ (id)overrides
{
  if (overrides_onceToken != -1) {
    dispatch_once(&overrides_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_bundleOverrides;

  return v2;
}

void __35__STUsageBundleOverrides_overrides__block_invoke()
{
  v26[4] = *MEMORY[0x263EF8340];
  v23 = @"ignore";
  v24 = &unk_26C92C288;
  v25[0] = @"MailUsage.bundle";
  v0 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v26[0] = v0;
  v25[1] = @"MessagesUsagePreferencesPlugin.bundle";
  v21 = @"ignore";
  v22 = &unk_26C92C288;
  v1 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v26[1] = v1;
  v25[2] = @"SoftwareUpdateUsage.bundle";
  v19 = @"replaceWithZeroSizeApp";
  v20 = @"com.apple.Preferences";
  v2 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v26[2] = v2;
  v25[3] = @"VisualVoicemailUsage.bundle";
  v17 = @"replaceWithZeroSizeApp";
  v18 = @"com.apple.mobilephone";
  v3 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v26[3] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __35__STUsageBundleOverrides_overrides__block_invoke_80;
  v15 = &unk_264305340;
  id v6 = v5;
  id v16 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v12];
  v7 = (void *)_bundleOverrides;
  _bundleOverrides = (uint64_t)v6;
  id v8 = v6;

  v9 = [STUsageBundleOverrides alloc];
  uint64_t v10 = -[STUsageBundleOverrides initWithDictionary:](v9, "initWithDictionary:", MEMORY[0x263EFFA78], v12, v13, v14, v15);
  v11 = (void *)_defaultBundleOverrides;
  _defaultBundleOverrides = v10;
}

void __35__STUsageBundleOverrides_overrides__block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [[STUsageBundleOverrides alloc] initWithDictionary:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (id)overridesFor:(id)a3
{
  id v4 = a3;
  id v5 = [a1 overrides];
  id v6 = [v5 objectForKey:v4];

  v7 = (void *)_defaultBundleOverrides;
  if (v6) {
    v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)ignore
{
  return self->_ignore;
}

- (NSString)replaceWithZeroSizeApp
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end