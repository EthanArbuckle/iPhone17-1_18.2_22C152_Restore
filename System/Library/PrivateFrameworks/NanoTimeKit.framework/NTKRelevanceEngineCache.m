@interface NTKRelevanceEngineCache
+ (id)_dataSourceLoaderForRelevanceEngineDataSourcesForKey:(id)a3;
+ (id)_globallyCachedCanonicalRelevanceEngine;
+ (id)sampleConfiguration;
+ (id)sharedCache;
- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4;
- (id)canonicalRelevanceEngine;
- (id)canonicalRelevanceEngineIgnoringAppInstallations;
- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5;
@end

@implementation NTKRelevanceEngineCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedCache_cache;
  return v2;
}

void __38__NTKRelevanceEngineCache_sharedCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = v0;
}

+ (id)_dataSourceLoaderForRelevanceEngineDataSourcesForKey:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = MEMORY[0x1C1875300]();
  v5 = [v4 stringByAppendingPathComponent:@"System"];
  v6 = [v5 stringByAppendingPathComponent:@"Library"];

  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = [v6 stringByAppendingPathComponent:@"RelevanceEngine"];
  v9 = [v8 stringByAppendingPathComponent:@"NanoDataSources"];
  v10 = [v7 fileURLWithPath:v9];

  if (NTKInternalBuild(v11, v12, v13, v14))
  {
    v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [@"/AppleInternal/Library/RelevanceEngine" stringByAppendingPathComponent:@"NanoDataSources"];
    v17 = [v15 fileURLWithPath:v16];

    v22[0] = v10;
    v22[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  }
  else
  {
    v21 = v10;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  }
  v19 = [MEMORY[0x1E4F94918] dataSourceLoaderWithDirectories:v18 dataSourceKey:v3];

  return v19;
}

+ (id)sampleConfiguration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NTKRelevanceEngineCache_sampleConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sampleConfiguration_onceToken != -1) {
    dispatch_once(&sampleConfiguration_onceToken, block);
  }
  v2 = (void *)sampleConfiguration_SampleConfiguration;
  return v2;
}

void __46__NTKRelevanceEngineCache_sampleConfiguration__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94990] sampleUpNextConfiguration];
  id v3 = (void *)[v2 mutableCopy];

  v4 = [*(id *)(a1 + 32) _dataSourceLoaderForRelevanceEngineDataSourcesForKey:*MEMORY[0x1E4F94A18]];
  v5 = [MEMORY[0x1E4F94918] dataSourceLoaderWithBlock:&__block_literal_global_20];
  v15[0] = v4;
  v15[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v7 = (void *)MEMORY[0x1E4F94918];
  v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
  v9 = [v7 aggregateDataSourceLoaderWithDataSourceLoaders:v8];
  [v3 setDataSourceLoader:v9];

  v10 = [_NTKRelevanceEngineLocationManager alloc];
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = [(_NTKRelevanceEngineLocationManager *)v10 initWithLocationManager:v11];
  [v3 setLocationManager:v12];

  uint64_t v13 = [v3 copy];
  uint64_t v14 = (void *)sampleConfiguration_SampleConfiguration;
  sampleConfiguration_SampleConfiguration = v13;
}

id __46__NTKRelevanceEngineCache_sampleConfiguration__block_invoke_2()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  v1 = objc_msgSend(v0, "mutableCopy", v4, v5);

  v2 = (void *)[v1 copy];
  return v2;
}

+ (id)_globallyCachedCanonicalRelevanceEngine
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NTKRelevanceEngineCache__globallyCachedCanonicalRelevanceEngine__block_invoke;
  aBlock[3] = &__block_descriptor_40_e24___RERelevanceEngine_8__0l;
  aBlock[4] = a1;
  v2 = (void (**)(void))_Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained(&OnDemandEngine);
  if (!WeakRetained)
  {
    WeakRetained = v2[2](v2);
    objc_storeWeak(&OnDemandEngine, WeakRetained);
  }

  return WeakRetained;
}

id __66__NTKRelevanceEngineCache__globallyCachedCanonicalRelevanceEngine__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sampleConfiguration];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F94988]) initWithName:@"NTK-Sample-OnDemand" configuration:v1];

  return v2;
}

- (id)canonicalRelevanceEngine
{
  v2 = objc_opt_class();
  return (id)[v2 _globallyCachedCanonicalRelevanceEngine];
}

- (id)canonicalRelevanceEngineIgnoringAppInstallations
{
  p_canonicalRelevanceEngineIgnoringAppInstallations = &self->_canonicalRelevanceEngineIgnoringAppInstallations;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canonicalRelevanceEngineIgnoringAppInstallations);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() sampleConfiguration];
    uint64_t v7 = (void *)[v6 mutableCopy];

    if (objc_opt_respondsToSelector()) {
      [v7 setIgnoresInstalledApplications:1];
    }
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F94988]) initWithName:@"NTK-Canonical-OnDemand-IgnoresInstallations" configuration:v7];
    objc_storeWeak((id *)p_canonicalRelevanceEngineIgnoringAppInstallations, v5);
  }
  return v5;
}

- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
  uint64_t v6 = (void (*)(id))*((void *)a4 + 2);
  uint64_t v7 = (void (**)(void))a5;
  v6(a4);
  v7[2]();
}

- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end