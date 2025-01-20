@interface RTTNanoSettings
+ (id)sharedInstance;
- (NPSDomainAccessor)domainAccessor;
- (NPSDomainAccessor)globalDomainAccessor;
- (RTTNanoSettings)init;
- (id)currentLocale;
- (id)uuidFromContext:(id)a3;
- (id)valueForPreferenceKey:(id)a3 andContext:(id)a4;
- (void)_setValue:(id)a3 forPreferenceKey:(id)a4;
- (void)setDomainAccessor:(id)a3;
- (void)setGlobalDomainAccessor:(id)a3;
@end

@implementation RTTNanoSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_353 != -1) {
    dispatch_once(&sharedInstance_onceToken_353, &__block_literal_global_355);
  }
  v2 = (void *)sharedInstance_Settings_352;

  return v2;
}

uint64_t __33__RTTNanoSettings_sharedInstance__block_invoke()
{
  sharedInstance_Settings_352 = objc_alloc_init(RTTNanoSettings);

  return MEMORY[0x270F9A758]();
}

- (RTTNanoSettings)init
{
  v9.receiver = self;
  v9.super_class = (Class)RTTNanoSettings;
  v2 = [(RTTSettings *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F57520]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x263F8B3A0]];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = (NPSDomainAccessor *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@".GlobalPreferences"];
    globalDomainAccessor = v2->_globalDomainAccessor;
    v2->_globalDomainAccessor = (NPSDomainAccessor *)v6;

    if (([MEMORY[0x263F472B0] currentProcessIsHeard] & 1) == 0
      && ([MEMORY[0x263F472B0] currentProcessIsPreferences] & 1) == 0)
    {
      [(RTTNanoSettings *)v2 _setValue:MEMORY[0x263EFFA88] forPreferenceKey:@"TTYNanoIndependencePreference"];
    }
  }
  return v2;
}

- (id)currentLocale
{
  id v3 = (id)[(NPSDomainAccessor *)self->_globalDomainAccessor synchronize];
  globalDomainAccessor = self->_globalDomainAccessor;

  return (id)[(NPSDomainAccessor *)globalDomainAccessor objectForKey:@"AppleLocale"];
}

- (id)uuidFromContext:(id)a3
{
  return @"RTTWildcardContext";
}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Setting value '%@' for key: '%@'", buf, 0x16u);
  }

  [(NPSDomainAccessor *)self->_domainAccessor setObject:v6 forKey:v7];
  id v9 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
  v10 = objc_opt_new();
  uint64_t v11 = *MEMORY[0x263F8B3A0];
  v12 = (void *)MEMORY[0x263EFFA08];
  id v15 = v7;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v14 = [v12 setWithArray:v13];
  [v10 synchronizeNanoDomain:v11 keys:v14];
}

- (id)valueForPreferenceKey:(id)a3 andContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
  id v7 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:v5];
  v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Retrieved value '%@' for key: '%@'", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (NPSDomainAccessor)globalDomainAccessor
{
  return self->_globalDomainAccessor;
}

- (void)setGlobalDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, 0);

  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end