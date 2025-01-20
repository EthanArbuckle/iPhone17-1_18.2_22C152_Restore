@interface REClassLoader
+ (REClassLoader)loaderWithBlock:(id)a3 configuration:(id)a4;
+ (REClassLoader)loaderWithDirectories:(id)a3 dataSourceKey:(id)a4 configuration:(id)a5;
+ (REClassLoader)loaderWithObjects:(id)a3 configuration:(id)a4;
+ (id)groupLoaderWithLoaders:(id)a3;
- (BOOL)isEqual:(id)a3;
- (REClassLoader)init;
- (REClassLoader)initWithConfiguration:(id)a3;
- (REClassLoaderConfiguration)configuration;
- (void)enumerateBundleConfigurations:(id)a3;
- (void)enumerateClassesWithBlock:(id)a3;
- (void)prewarm;
@end

@implementation REClassLoader

- (REClassLoaderConfiguration)configuration
{
  return self->_configuration;
}

- (void)enumerateClassesWithBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadingLock);
    if (!self->_cachedDataSources)
    {
      v5 = [MEMORY[0x263EFF9C0] set];
      uint64_t v6 = [(REClassLoaderConfiguration *)self->_configuration desiredClassForLoader];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __43__REClassLoader_enumerateClassesWithBlock___block_invoke;
      v19[3] = &unk_2644BD408;
      id v20 = v5;
      uint64_t v21 = v6;
      id v7 = v5;
      [(REClassLoader *)self _enumerateClassesWithBlock:v19];
      v8 = (NSArray *)[v7 copy];
      cachedDataSources = self->_cachedDataSources;
      self->_cachedDataSources = v8;
    }
    os_unfair_lock_unlock(&self->_loadingLock);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v10 = self->_cachedDataSources;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (void)enumerateBundleConfigurations:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadingLock);
    if (!self->_cachedBundleConfigurations)
    {
      v5 = [MEMORY[0x263EFF980] array];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __47__REClassLoader_enumerateBundleConfigurations___block_invoke;
      v18[3] = &unk_2644BD430;
      id v19 = v5;
      id v6 = v5;
      [(REClassLoader *)self _enumerateBundleConfigurations:v18];
      id v7 = (NSArray *)[v6 copy];
      cachedBundleConfigurations = self->_cachedBundleConfigurations;
      self->_cachedBundleConfigurations = v7;
    }
    os_unfair_lock_unlock(&self->_loadingLock);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = self->_cachedBundleConfigurations;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

+ (REClassLoader)loaderWithBlock:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[REBlockClassLoader alloc] initWithBlock:v6 configuration:v5];

  return (REClassLoader *)v7;
}

- (REClassLoader)initWithConfiguration:(id)a3
{
  id v5 = a3;
  id v6 = [(REClassLoader *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (REClassLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)REClassLoader;
  result = [(REClassLoader *)&v3 init];
  if (result) {
    result->_loadingLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

uint64_t __47__REClassLoader_enumerateBundleConfigurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __43__REClassLoader_enumerateClassesWithBlock___block_invoke(uint64_t a1, Class aClass)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = NSStringFromClass(aClass);
  if (*(void *)(a1 + 40) && (-[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:") & 1) == 0)
  {
    id v5 = RELogForDomain(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__REClassLoader_enumerateClassesWithBlock___block_invoke_cold_1((uint64_t)v4, (Class *)(a1 + 40), v5);
    }
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) containsObject:aClass])
  {
    id v5 = RELogForDomain(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_21E6E6000, v5, OS_LOG_TYPE_INFO, "Skipping %@ - Already loaded", (uint8_t *)&v6, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  [*(id *)(a1 + 32) addObject:aClass];
LABEL_10:
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (REClassLoader)loaderWithObjects:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[REObjectClassLoader alloc] initWithObjects:v6 configuration:v5];

  return (REClassLoader *)v7;
}

+ (REClassLoader)loaderWithDirectories:(id)a3 dataSourceKey:(id)a4 configuration:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[REDirectoryClassLoader alloc] initWithDirectories:v9 dataSourceKey:v8 configuration:v7];

  return (REClassLoader *)v10;
}

+ (id)groupLoaderWithLoaders:(id)a3
{
  id v3 = a3;
  v4 = [[REGroupClassLoader alloc] initWithLoaders:v3];

  return v4;
}

- (void)prewarm
{
  [(REClassLoader *)self enumerateObjectsWithBlock:&__block_literal_global_14];
  [(REClassLoader *)self enumerateBundleConfigurations:&__block_literal_global_6];
  [(REClassLoader *)self enumerateClassesWithBlock:&__block_literal_global_9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cachedBundleConfigurations, 0);
  objc_storeStrong((id *)&self->_cachedDataSources, 0);
}

void __43__REClassLoader_enumerateClassesWithBlock___block_invoke_cold_1(uint64_t a1, Class *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromClass(*a2);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_21E6E6000, a3, OS_LOG_TYPE_ERROR, "Skipping %@ - Unsupported class, expecting %@", (uint8_t *)&v6, 0x16u);
}

@end