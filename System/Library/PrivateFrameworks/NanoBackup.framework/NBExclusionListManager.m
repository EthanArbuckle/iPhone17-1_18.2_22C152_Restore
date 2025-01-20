@interface NBExclusionListManager
- (BOOL)hasReadConfiguration;
- (NSMutableDictionary)excludedPerGizmoDomainSettings;
- (NSSet)excludedPerGizmoDomains;
- (id)excludedKeysInDomain:(id)a3;
- (void)purgeCache;
- (void)readConfigurationIfNeeded;
- (void)setExcludedPerGizmoDomainSettings:(id)a3;
- (void)setExcludedPerGizmoDomains:(id)a3;
- (void)setHasReadConfiguration:(BOOL)a3;
@end

@implementation NBExclusionListManager

- (NSSet)excludedPerGizmoDomains
{
  [(NBExclusionListManager *)self readConfigurationIfNeeded];
  excludedPerGizmoDomains = self->_excludedPerGizmoDomains;

  return excludedPerGizmoDomains;
}

- (id)excludedKeysInDomain:(id)a3
{
  id v4 = a3;
  [(NBExclusionListManager *)self readConfigurationIfNeeded];
  v5 = [(NSMutableDictionary *)self->_excludedPerGizmoDomainSettings objectForKeyedSubscript:v4];

  return v5;
}

- (void)purgeCache
{
  self->_hasReadConfiguration = 0;
  excludedPerGizmoDomains = self->_excludedPerGizmoDomains;
  self->_excludedPerGizmoDomains = 0;

  excludedPerGizmoDomainSettings = self->_excludedPerGizmoDomainSettings;
  self->_excludedPerGizmoDomainSettings = 0;
}

- (void)readConfigurationIfNeeded
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!self->_hasReadConfiguration)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 bundlePath];
    v5 = [v4 stringByAppendingPathComponent:@"PerGizmoSettingsExclusionList.plist"];

    v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5];
    if (v6)
    {
      v7 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:0];
      v8 = [v7 objectForKeyedSubscript:@"ExcludedDomains"];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        while (1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          if (!--v10)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (!v10) {
              break;
            }
          }
        }
      }
      v12 = [MEMORY[0x263EFFA08] setWithArray:v8];
      excludedPerGizmoDomains = self->_excludedPerGizmoDomains;
      self->_excludedPerGizmoDomains = v12;

      v14 = [v7 objectForKeyedSubscript:@"ExcludedSettings"];
      v15 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v14, "count"));
      excludedPerGizmoDomainSettings = self->_excludedPerGizmoDomainSettings;
      self->_excludedPerGizmoDomainSettings = v15;

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __51__NBExclusionListManager_readConfigurationIfNeeded__block_invoke;
      v17[3] = &unk_2645968F8;
      v17[4] = self;
      [v14 enumerateKeysAndObjectsUsingBlock:v17];
    }
    self->_hasReadConfiguration = 1;
  }
}

void __51__NBExclusionListManager_readConfigurationIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      if (!--v8)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }
  uint64_t v10 = [MEMORY[0x263EFFA08] setWithArray:v6];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v10 forKeyedSubscript:v5];
}

- (void)setExcludedPerGizmoDomains:(id)a3
{
}

- (BOOL)hasReadConfiguration
{
  return self->_hasReadConfiguration;
}

- (void)setHasReadConfiguration:(BOOL)a3
{
  self->_hasReadConfiguration = a3;
}

- (NSMutableDictionary)excludedPerGizmoDomainSettings
{
  return self->_excludedPerGizmoDomainSettings;
}

- (void)setExcludedPerGizmoDomainSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedPerGizmoDomainSettings, 0);

  objc_storeStrong((id *)&self->_excludedPerGizmoDomains, 0);
}

@end