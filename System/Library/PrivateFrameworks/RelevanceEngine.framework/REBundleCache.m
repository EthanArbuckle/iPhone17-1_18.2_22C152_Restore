@interface REBundleCache
+ (id)sharedInstance;
- (REBundleCache)init;
- (id)bundleAtPath:(id)a3;
- (void)dealloc;
@end

@implementation REBundleCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_SharedCache;
  return v2;
}

uint64_t __31__REBundleCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_SharedCache;
  sharedInstance_SharedCache = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (REBundleCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)REBundleCache;
  v2 = [(REBundleCache *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(REConcurrentDictionary);
    cachedBundles = v2->_cachedBundles;
    v2->_cachedBundles = v3;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)REBundleCache;
  [(REBundleCache *)&v2 dealloc];
}

- (id)bundleAtPath:(id)a3
{
  v4 = [a3 stringByStandardizingPath];
  if (v4)
  {
    v5 = [(REConcurrentDictionary *)self->_cachedBundles objectForKeyedSubscript:v4];
    if (!v5)
    {
      v5 = [MEMORY[0x263F086E0] bundleWithPath:v4];
      objc_super v6 = [v5 objectForInfoDictionaryKey:@"NSPrincipalClass"];
      if (v6)
      {
        [v5 load];
        [(REConcurrentDictionary *)self->_cachedBundles setObject:v5 forKeyedSubscript:v4];
      }
      else
      {
        v7 = RELogForDomain(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[REBundleCache bundleAtPath:]((uint64_t)v4, v7);
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)bundleAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Skipping %@ - No NSPrincipalClass", (uint8_t *)&v2, 0xCu);
}

@end