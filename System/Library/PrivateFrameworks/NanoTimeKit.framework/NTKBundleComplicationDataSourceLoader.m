@interface NTKBundleComplicationDataSourceLoader
+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithBlock:(id)a3;
+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithDirectories:(id)a3;
+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithDirectory:(id)a3;
+ (id)aggregateComplicationLoaderWithComplicationLoaders:(id)a3;
+ (id)defaultComplicationDataSourceLoader;
+ (id)disabledComplicationDataSourceLoader;
- (NTKBundleComplicationDataSourceLoader)init;
- (id)cachedDataSources;
- (void)enumerateComplicationClassesWithBlock:(id)a3;
@end

@implementation NTKBundleComplicationDataSourceLoader

- (NTKBundleComplicationDataSourceLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplicationDataSourceLoader;
  v2 = [(NTKBundleComplicationDataSourceLoader *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_cachedDataSourcesLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

+ (id)disabledComplicationDataSourceLoader
{
  if (disabledComplicationDataSourceLoader_onceToken != -1) {
    dispatch_once(&disabledComplicationDataSourceLoader_onceToken, &__block_literal_global_52_0);
  }
  v2 = (void *)disabledComplicationDataSourceLoader_DisabledLoader;
  return v2;
}

void __77__NTKBundleComplicationDataSourceLoader_disabledComplicationDataSourceLoader__block_invoke()
{
  v0 = objc_alloc_init(_NTKBundleDisabledComplicationLoader);
  v1 = (void *)disabledComplicationDataSourceLoader_DisabledLoader;
  disabledComplicationDataSourceLoader_DisabledLoader = (uint64_t)v0;
}

+ (id)defaultComplicationDataSourceLoader
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__NTKBundleComplicationDataSourceLoader_defaultComplicationDataSourceLoader__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultComplicationDataSourceLoader_onceToken != -1) {
    dispatch_once(&defaultComplicationDataSourceLoader_onceToken, block);
  }
  v2 = (void *)defaultComplicationDataSourceLoader_BundleLoader;
  return v2;
}

void __76__NTKBundleComplicationDataSourceLoader_defaultComplicationDataSourceLoader__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v1 builtInPlugInsURL];

  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 bundleURL];

  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v6 = [v5 bundleURL];
  uint64_t v7 = [v6 URLByDeletingPathExtension];

  v20 = (void *)v7;
  v21 = (void *)v4;
  v23 = (void *)v2;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v2, v4, v7, 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v25 + 1) + 8 * v12)];
        v14 = [v13 URLByAppendingPathComponent:@"NanoTimeKit"];
        v15 = [v14 URLByAppendingPathComponent:@"Complications"];

        [v8 addObject:v15];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  v16 = *(void **)(a1 + 32);
  v17 = (void *)[v8 copy];
  uint64_t v18 = [v16 complicationDataSourceLoaderWithDirectories:v17];
  v19 = (void *)defaultComplicationDataSourceLoader_BundleLoader;
  defaultComplicationDataSourceLoader_BundleLoader = v18;
}

+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithDirectory:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v7 = [a1 complicationDataSourceLoaderWithDirectories:v6];
  }
  else
  {
    uint64_t v7 = [a1 complicationDataSourceLoaderWithDirectories:MEMORY[0x1E4F1CBF0]];
  }

  return (NTKBundleComplicationDataSourceLoader *)v7;
}

+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithDirectories:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_NTKBundleBundleComplicationLoader);
  v5 = (void *)[v3 copy];

  [(_NTKBundleBundleComplicationLoader *)v4 setUrls:v5];
  return (NTKBundleComplicationDataSourceLoader *)v4;
}

+ (NTKBundleComplicationDataSourceLoader)complicationDataSourceLoaderWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = (void *)[v3 copy];

  [v4 setBlock:v5];
  return (NTKBundleComplicationDataSourceLoader *)v4;
}

+ (id)aggregateComplicationLoaderWithComplicationLoaders:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setLoaders:v3];

  return v4;
}

- (void)enumerateComplicationClassesWithBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  kdebug_trace();
  if (v4)
  {
    v5 = [(NTKBundleComplicationDataSourceLoader *)self cachedDataSources];

    if (!v5)
    {
      objc_super v6 = [MEMORY[0x1E4F1CA80] set];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __79__NTKBundleComplicationDataSourceLoader_enumerateComplicationClassesWithBlock___block_invoke;
      v20[3] = &unk_1E62C80B8;
      id v21 = v6;
      id v7 = v6;
      [(NTKBundleComplicationDataSourceLoader *)self _loadClassesUsingBlock:v20];
      os_unfair_lock_lock(&self->_cachedDataSourcesLock);
      v8 = (NSArray *)[v7 copy];
      cachedDataSources = self->_cachedDataSources;
      self->_cachedDataSources = v8;

      os_unfair_lock_unlock(&self->_cachedDataSourcesLock);
    }
    char v19 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [(NTKBundleComplicationDataSourceLoader *)self cachedDataSources];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        if (v19) {
          break;
        }
        v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * v14++), &v19);
        if (v12 == v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v22 count:16];
          if (v12) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    kdebug_trace();
  }
}

void __79__NTKBundleComplicationDataSourceLoader_enumerateComplicationClassesWithBlock___block_invoke(uint64_t a1, Class aClass)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromClass(aClass);
  if ([(objc_class *)aClass isSubclassOfClass:objc_opt_class()])
  {
    if (![*(id *)(a1 + 32) containsObject:aClass])
    {
      [*(id *)(a1 + 32) addObject:aClass];
      goto LABEL_9;
    }
    v5 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Skipping %@ - Already loaded", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    v5 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }

LABEL_9:
}

- (id)cachedDataSources
{
  p_cachedDataSourcesLock = &self->_cachedDataSourcesLock;
  os_unfair_lock_lock(&self->_cachedDataSourcesLock);
  id v4 = (void *)[(NSArray *)self->_cachedDataSources copy];
  os_unfair_lock_unlock(p_cachedDataSourcesLock);
  return v4;
}

- (void).cxx_destruct
{
}

@end