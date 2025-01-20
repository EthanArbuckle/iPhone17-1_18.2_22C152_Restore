@interface NTKBundleComplicationIdentifierCache
- (NSString)overrideIdentifier;
- (NSURL)overrideUrl;
- (NTKBundleComplicationIdentifierCache)init;
- (NTKBundleComplicationIdentifierCacheModel)model;
- (id)_cacheURL;
- (id)_expectedCacheIdentifier;
- (void)_enumerateBundles:(id)a3;
- (void)_load;
- (void)_loadCachedModel;
- (void)_queue_fetchIdentifiersForComplication:(id)a3 completion:(id)a4;
- (void)_updateCacheModel:(id)a3;
- (void)fetchIdentifiersForComplication:(id)a3 completion:(id)a4;
- (void)setOverrideIdentifier:(id)a3;
- (void)setOverrideUrl:(id)a3;
@end

@implementation NTKBundleComplicationIdentifierCache

- (NTKBundleComplicationIdentifierCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplicationIdentifierCache;
  v2 = [(NTKBundleComplicationIdentifierCache *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoTimeKit.NTKBundleComplicationIdentifierCache", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)fetchIdentifiersForComplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__NTKBundleComplicationIdentifierCache_fetchIdentifiersForComplication_completion___block_invoke;
  block[3] = &unk_1E62C0098;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __83__NTKBundleComplicationIdentifierCache_fetchIdentifiersForComplication_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_fetchIdentifiersForComplication:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_fetchIdentifiersForComplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_model) {
    [(NTKBundleComplicationIdentifierCache *)self _load];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 complication];
    id v9 = [v8 bundleIdentifier];
  }
  else
  {
    uint64_t v10 = [v6 complicationType];
    v8 = [(NTKBundleComplicationIdentifierCacheModel *)self->_model legacyComplicationTypeToDataSourceIdentifier];
    v11 = [NSNumber numberWithUnsignedInteger:v10];
    id v9 = [v8 objectForKeyedSubscript:v11];
  }
  id v12 = [(NTKBundleComplicationIdentifierCacheModel *)self->_model dataSourceToBundleIdentifier];
  id v13 = [v12 objectForKeyedSubscript:v9];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__NTKBundleComplicationIdentifierCache__queue_fetchIdentifiersForComplication_completion___block_invoke;
  block[3] = &unk_1E62C22B8;
  id v19 = v13;
  id v20 = v7;
  id v18 = v9;
  id v14 = v13;
  id v15 = v9;
  id v16 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__NTKBundleComplicationIdentifierCache__queue_fetchIdentifiersForComplication_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_cacheURL
{
  dispatch_queue_t v3 = [(NTKBundleComplicationIdentifierCache *)self overrideUrl];

  if (v3)
  {
    v4 = [(NTKBundleComplicationIdentifierCache *)self overrideUrl];
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v6 = NTKCacheDirectory();
    id v7 = (void *)[v5 initFileURLWithPath:v6];

    v4 = [v7 URLByAppendingPathComponent:@"bundle-complication-identifier-cache.plist"];
  }

  return v4;
}

- (id)_expectedCacheIdentifier
{
  overrideIdentifier = self->_overrideIdentifier;
  if (overrideIdentifier)
  {
    dispatch_queue_t v3 = overrideIdentifier;
  }
  else
  {
    NTKBuildVersion();
    dispatch_queue_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_load
{
}

- (void)_loadCachedModel
{
}

- (void)_updateCacheModel:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke;
  id v12 = &unk_1E62C6900;
  id v13 = v5;
  id v14 = v6;
  id v7 = v6;
  id v8 = v5;
  [(NTKBundleComplicationIdentifierCache *)self _enumerateBundles:&v9];
  objc_msgSend(v4, "setDataSourceToBundleIdentifier:", v8, v9, v10, v11, v12);
  [v4 setLegacyComplicationTypeToDataSourceIdentifier:v7];
}

void __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationIdentifierCache: Loading bundle with identifier %{public}@", buf, 0xCu);
  }
  if (([v3 isLoaded] & 1) == 0) {
    [v3 load];
  }
  id v6 = NTKBundleComplicationDataSourceClassesFromBundle(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke_12;
  v8[3] = &unk_1E62C68D8;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __58__NTKBundleComplicationIdentifierCache__updateCacheModel___block_invoke_12(id *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [a2 bundleIdentifier];
    id v5 = [a2 legacyNTKComplicationType];
    id v6 = [a1[5] bundleIdentifier];
    [a1[4] setObject:v6 forKeyedSubscript:v4];

    id v7 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a1[5] bundleIdentifier];
      int v9 = 138543874;
      id v10 = v4;
      __int16 v11 = 2114;
      id v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationIdentifierCache: Discovered %{public}@ in %{public}@, legacy type %{public}@", (uint8_t *)&v9, 0x20u);
    }
    if (v5) {
      [a1[6] setObject:v4 forKeyedSubscript:v5];
    }
  }
}

- (void)_enumerateBundles:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_enumerateBundles__onceToken_0 != -1) {
    dispatch_once(&_enumerateBundles__onceToken_0, &__block_literal_global_118);
  }
  NTKBundleComplicationDirectoryURLs();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v9 = (void *)_enumerateBundles___complicationBundleLoader_0;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2;
        v11[3] = &unk_1E62C4288;
        id v12 = v3;
        [v9 enumerateBundlesFromDirectoryURL:v8 enumerator:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke()
{
  v0 = objc_alloc_init(NTKBundleLoader);
  v1 = (void *)_enumerateBundles___complicationBundleLoader_0;
  _enumerateBundles___complicationBundleLoader_0 = (uint64_t)v0;
}

uint64_t __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 bundleIdentifier];
    int v11 = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationIdentifierCache: Evaluating bundle for identifier %{public}@", (uint8_t *)&v11, 0xCu);
  }
  if ([v3 isLoaded]) {
    goto LABEL_6;
  }
  uint64_t v6 = [v3 objectForInfoDictionaryKey:@"NSPrincipalClass"];
  if (v6)
  {

LABEL_6:
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    }
    uint64_t v8 = 1;
    goto LABEL_9;
  }
  id v10 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2_cold_1(v10);
  }

  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (NTKBundleComplicationIdentifierCacheModel)model
{
  return self->_model;
}

- (NSURL)overrideUrl
{
  return self->_overrideUrl;
}

- (void)setOverrideUrl:(id)a3
{
}

- (NSString)overrideIdentifier
{
  return self->_overrideIdentifier;
}

- (void)setOverrideIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideUrl, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__NTKBundleComplicationIdentifierCache__enumerateBundles___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKBundleComplicationIdentifierCache: Bundle missing principal class", v1, 2u);
}

@end