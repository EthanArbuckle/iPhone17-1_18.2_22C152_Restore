@interface RERelevanceProviderManagerLoader
+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithBlock:(id)a3;
+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithDirectories:(id)a3;
+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithDirectories:(id)a3 relevanceProviderManagerKey:(id)a4;
+ (id)aggregateRelevanceProviderManagerLoaderWithrelevanceProviderManagerLoaders:(id)a3;
+ (id)disabledRelevanceProviderManagerLoader;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)enumerateBundleConfigurations:(id)a3;
- (void)enumerationDataSourceClassesWithBlock:(id)a3;
- (void)prewarm;
@end

@implementation RERelevanceProviderManagerLoader

+ (id)disabledRelevanceProviderManagerLoader
{
  if (disabledRelevanceProviderManagerLoader_onceToken != -1) {
    dispatch_once(&disabledRelevanceProviderManagerLoader_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)disabledRelevanceProviderManagerLoader_DisabledLoader;
  return v2;
}

uint64_t __74__RERelevanceProviderManagerLoader_disabledRelevanceProviderManagerLoader__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)disabledRelevanceProviderManagerLoader_DisabledLoader;
  disabledRelevanceProviderManagerLoader_DisabledLoader = v0;

  v2 = objc_alloc_init(REClassLoader);
  *(void *)(disabledRelevanceProviderManagerLoader_DisabledLoader + 8) = v2;
  return MEMORY[0x270F9A758]();
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RERelevanceProviderManagerLoader *)a3;
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
      v7 = loader;
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

- (void)enumerationDataSourceClassesWithBlock:(id)a3
{
}

+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[RERelevanceProviderManagerLoaderConfiguration sharedInstance];
  uint64_t v6 = +[REClassLoader loaderWithBlock:v3 configuration:v5];

  v7 = (void *)v4[1];
  v4[1] = v6;

  return (RERelevanceProviderManagerLoader *)v4;
}

+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithDirectories:(id)a3
{
  return (RERelevanceProviderManagerLoader *)[a1 relevanceProviderManagerLoaderWithDirectories:a3 relevanceProviderManagerKey:0];
}

+ (RERelevanceProviderManagerLoader)relevanceProviderManagerLoaderWithDirectories:(id)a3 relevanceProviderManagerKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = +[RERelevanceProviderManagerLoaderConfiguration sharedInstance];
  uint64_t v9 = +[REClassLoader loaderWithDirectories:v6 dataSourceKey:v5 configuration:v8];

  v10 = (void *)v7[1];
  v7[1] = v9;

  return (RERelevanceProviderManagerLoader *)v7;
}

+ (id)aggregateRelevanceProviderManagerLoaderWithrelevanceProviderManagerLoaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9B0] orderedSet];
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

  v10 = objc_opt_new();
  uint64_t v11 = +[REClassLoader groupLoaderWithLoaders:v4];
  v12 = (void *)v10[1];
  v10[1] = v11;

  return v10;
}

- (void)prewarm
{
}

- (void)enumerateBundleConfigurations:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_loader);
  return v4;
}

- (void).cxx_destruct
{
}

@end