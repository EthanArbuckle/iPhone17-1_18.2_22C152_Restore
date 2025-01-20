@interface REDataSourceLoader
+ (id)aggregateDataSourceLoaderWithDataSourceLoaders:(id)a3;
+ (id)dataSourceLoaderWithBlock:(id)a3;
+ (id)dataSourceLoaderWithDataSources:(id)a3;
+ (id)dataSourceLoaderWithDirectories:(id)a3;
+ (id)dataSourceLoaderWithDirectories:(id)a3 dataSourceKey:(id)a4;
+ (id)dataSourceLoaderWithDirectory:(id)a3;
+ (id)defaultDataSourceLoader;
+ (id)disabledDataSourceLoader;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)enumerateBundleConfigurations:(id)a3;
- (void)enumerateDataSourceClassesWithBlock:(id)a3;
- (void)enumerateDataSourceObjectsWithBlock:(id)a3;
- (void)prewarm;
@end

@implementation REDataSourceLoader

- (void).cxx_destruct
{
}

void __45__REDataSourceLoader_defaultDataSourceLoader__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v1 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v2 = [v1 builtInPlugInsURL];

  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 bundleURL];

  v5 = [MEMORY[0x263F086E0] mainBundle];
  v6 = [v5 bundleURL];
  uint64_t v7 = [v6 URLByDeletingPathExtension];

  v20 = (void *)v7;
  v21 = (void *)v4;
  v23 = (void *)v2;
  v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v2, v4, v7, 0);
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
        v13 = [NSURL fileURLWithPath:*(void *)(*((void *)&v25 + 1) + 8 * v12)];
        v14 = [v13 URLByAppendingPathComponent:@"RelevanceEngine"];
        v15 = [v14 URLByAppendingPathComponent:@"DataSources"];

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
  uint64_t v18 = [v16 dataSourceLoaderWithDirectories:v17];
  v19 = (void *)defaultDataSourceLoader_BundleLoader;
  defaultDataSourceLoader_BundleLoader = v18;
}

+ (id)defaultDataSourceLoader
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__REDataSourceLoader_defaultDataSourceLoader__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultDataSourceLoader_onceToken != -1) {
    dispatch_once(&defaultDataSourceLoader_onceToken, block);
  }
  uint64_t v2 = (void *)defaultDataSourceLoader_BundleLoader;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (REDataSourceLoader *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      loader = self->_loader;
      v6 = v4->_loader;
      uint64_t v7 = loader;
      v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(REClassLoader *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (void)enumerateDataSourceObjectsWithBlock:(id)a3
{
}

- (void)enumerateDataSourceClassesWithBlock:(id)a3
{
}

- (void)enumerateBundleConfigurations:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_loader);
  return v4;
}

+ (id)dataSourceLoaderWithDirectories:(id)a3 dataSourceKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  v8 = +[REDataSourceLoaderConfiguration sharedInstance];
  uint64_t v9 = +[REClassLoader loaderWithDirectories:v6 dataSourceKey:v5 configuration:v8];

  uint64_t v10 = (void *)v7[1];
  v7[1] = v9;

  return v7;
}

+ (id)dataSourceLoaderWithDirectories:(id)a3
{
  return (id)[a1 dataSourceLoaderWithDirectories:a3 dataSourceKey:0];
}

+ (id)dataSourceLoaderWithDataSources:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = +[REDataSourceLoaderConfiguration sharedInstance];
  uint64_t v6 = +[REClassLoader loaderWithObjects:v3 configuration:v5];

  uint64_t v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

+ (id)dataSourceLoaderWithBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = +[REDataSourceLoaderConfiguration sharedInstance];
  uint64_t v6 = +[REClassLoader loaderWithBlock:v3 configuration:v5];

  uint64_t v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

+ (id)aggregateDataSourceLoaderWithDataSourceLoaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(void *)(*(void *)(*((void *)&v14 + 1) + 8 * i) + 8)) {
          [v4 addObject:(void)v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v10 = objc_opt_new();
  uint64_t v11 = +[REClassLoader groupLoaderWithLoaders:v4];
  uint64_t v12 = (void *)v10[1];
  v10[1] = v11;

  return v10;
}

+ (id)disabledDataSourceLoader
{
  if (disabledDataSourceLoader_onceToken != -1) {
    dispatch_once(&disabledDataSourceLoader_onceToken, &__block_literal_global_0);
  }
  uint64_t v2 = (void *)disabledDataSourceLoader_DisabledLoader;
  return v2;
}

uint64_t __46__REDataSourceLoader_disabledDataSourceLoader__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)disabledDataSourceLoader_DisabledLoader;
  disabledDataSourceLoader_DisabledLoader = v0;

  uint64_t v2 = objc_alloc_init(REClassLoader);
  *(void *)(disabledDataSourceLoader_DisabledLoader + 8) = v2;
  return MEMORY[0x270F9A758]();
}

+ (id)dataSourceLoaderWithDirectory:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    uint64_t v7 = [a1 dataSourceLoaderWithDirectories:v6];
  }
  else
  {
    uint64_t v7 = [a1 dataSourceLoaderWithDirectories:MEMORY[0x263EFFA68]];
  }

  return v7;
}

- (void)prewarm
{
}

@end