@interface NUFactory
+ (BOOL)hasSharedFactory;
+ (id)sharedFactory;
+ (void)freeAllResources:(BOOL)a3;
+ (void)reapAllStoragePools;
+ (void)reset;
+ (void)setSharedFactory:(id)a3;
+ (void)shutdownSharedFactory;
- (CIFilter)repairMLFilter;
- (NSString)defaultNamespace;
- (NUCacheNodeRegistry)cacheNodeRegistry;
- (NUMLModelRegistry)modelRegistry;
- (NUPlatform)platform;
- (NUPurgeableStoragePool)bufferStoragePool;
- (NUPurgeableStoragePool)surfaceStoragePool;
- (NURenderNodeCache)renderNodeCache;
- (NURenderPipelineRegistry)renderPipelineRegistry;
- (NURenderResourcePool)renderResourcePool;
- (NURenderResultCache)renderResultCache;
- (NUScheduler)scheduler;
- (NUSchemaRegistry)schemaRegistry;
- (NUStorageFactory)bufferFactory;
- (NUStorageFactory)surfaceFactory;
- (VNSession)visionSession;
- (void)setBufferFactory:(id)a3;
- (void)setBufferStoragePool:(id)a3;
- (void)setCacheNodeRegistry:(id)a3;
- (void)setDefaultNamespace:(id)a3;
- (void)setModelRegistry:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRenderNodeCache:(id)a3;
- (void)setRenderPipelineRegistry:(id)a3;
- (void)setRenderResourcePool:(id)a3;
- (void)setRenderResultCache:(id)a3;
- (void)setRepairMLFilter:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSchemaRegistry:(id)a3;
- (void)setSurfaceFactory:(id)a3;
- (void)setSurfaceStoragePool:(id)a3;
- (void)setVisionSession:(id)a3;
- (void)start;
@end

@implementation NUFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionSession, 0);
  objc_storeStrong((id *)&self->_modelRegistry, 0);
  objc_storeStrong((id *)&self->_repairMLFilter, 0);
  objc_storeStrong((id *)&self->_cacheNodeRegistry, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_renderResourcePool, 0);
  objc_storeStrong((id *)&self->_renderResultCache, 0);
  objc_storeStrong((id *)&self->_renderNodeCache, 0);
  objc_storeStrong((id *)&self->_surfaceFactory, 0);
  objc_storeStrong((id *)&self->_bufferFactory, 0);
  objc_storeStrong((id *)&self->_surfaceStoragePool, 0);
  objc_storeStrong((id *)&self->_bufferStoragePool, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_defaultNamespace, 0);
  objc_storeStrong((id *)&self->_renderPipelineRegistry, 0);

  objc_storeStrong((id *)&self->_schemaRegistry, 0);
}

- (void)setVisionSession:(id)a3
{
}

- (VNSession)visionSession
{
  return self->_visionSession;
}

- (void)setModelRegistry:(id)a3
{
}

- (NUMLModelRegistry)modelRegistry
{
  return self->_modelRegistry;
}

- (void)setRepairMLFilter:(id)a3
{
}

- (CIFilter)repairMLFilter
{
  return self->_repairMLFilter;
}

- (void)setCacheNodeRegistry:(id)a3
{
}

- (NUCacheNodeRegistry)cacheNodeRegistry
{
  return self->_cacheNodeRegistry;
}

- (void)setPlatform:(id)a3
{
}

- (NUPlatform)platform
{
  return self->_platform;
}

- (void)setRenderResourcePool:(id)a3
{
}

- (NURenderResourcePool)renderResourcePool
{
  return self->_renderResourcePool;
}

- (void)setRenderResultCache:(id)a3
{
}

- (NURenderResultCache)renderResultCache
{
  return self->_renderResultCache;
}

- (void)setRenderNodeCache:(id)a3
{
}

- (NURenderNodeCache)renderNodeCache
{
  return self->_renderNodeCache;
}

- (void)setSurfaceFactory:(id)a3
{
}

- (NUStorageFactory)surfaceFactory
{
  return self->_surfaceFactory;
}

- (void)setBufferFactory:(id)a3
{
}

- (NUStorageFactory)bufferFactory
{
  return self->_bufferFactory;
}

- (void)setSurfaceStoragePool:(id)a3
{
}

- (NUPurgeableStoragePool)surfaceStoragePool
{
  return self->_surfaceStoragePool;
}

- (void)setBufferStoragePool:(id)a3
{
}

- (NUPurgeableStoragePool)bufferStoragePool
{
  return self->_bufferStoragePool;
}

- (void)setScheduler:(id)a3
{
}

- (NUScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setDefaultNamespace:(id)a3
{
}

- (NSString)defaultNamespace
{
  return self->_defaultNamespace;
}

- (void)setRenderPipelineRegistry:(id)a3
{
}

- (NURenderPipelineRegistry)renderPipelineRegistry
{
  return self->_renderPipelineRegistry;
}

- (void)setSchemaRegistry:(id)a3
{
}

- (NUSchemaRegistry)schemaRegistry
{
  return self->_schemaRegistry;
}

- (void)start
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!self->_schemaRegistry)
  {
    v3 = objc_alloc_init(NUSchemaRegistry);
    schemaRegistry = self->_schemaRegistry;
    self->_schemaRegistry = v3;
  }
  if (!self->_renderPipelineRegistry)
  {
    v5 = objc_alloc_init(NURenderPipelineRegistry);
    renderPipelineRegistry = self->_renderPipelineRegistry;
    self->_renderPipelineRegistry = v5;
  }
  if (!self->_defaultNamespace)
  {
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    v8 = [v7 bundleIdentifier];

    if (!v8)
    {
      if (NSClassFromString(&cfstr_Xctestprobe.isa)) {
        v8 = @"com.apple.test";
      }
      else {
        v8 = @"com.apple.Photos";
      }
    }
    defaultNamespace = self->_defaultNamespace;
    self->_defaultNamespace = &v8->isa;
  }
  if (!self->_scheduler)
  {
    v10 = [[NUScheduler alloc] initWithName:@"shared"];
    scheduler = self->_scheduler;
    self->_scheduler = v10;
  }
  if (!self->_bufferStoragePool)
  {
    v12 = [[NUPurgeableStoragePool alloc] initWithStorageClass:objc_opt_class()];
    bufferStoragePool = self->_bufferStoragePool;
    self->_bufferStoragePool = v12;
  }
  if (!self->_surfaceStoragePool)
  {
    v14 = [[NUPurgeableStoragePool alloc] initWithStorageClass:objc_opt_class()];
    surfaceStoragePool = self->_surfaceStoragePool;
    self->_surfaceStoragePool = v14;
  }
  if (!self->_bufferFactory)
  {
    BOOL v16 = +[NUGlobalSettings bufferStorageFactoryUsePool];
    v17 = [NUPurgeableStorageFactory alloc];
    if (v16) {
      v18 = [(NUPurgeableStorageFactory *)v17 initWithStoragePool:self->_bufferStoragePool];
    }
    else {
      v18 = [(NUPurgeableStorageFactory *)v17 initWithStorageClass:objc_opt_class()];
    }
    bufferFactory = self->_bufferFactory;
    self->_bufferFactory = v18;
  }
  if (!self->_surfaceFactory)
  {
    BOOL v20 = +[NUGlobalSettings surfaceStorageFactoryUsePool];
    v21 = [NUPurgeableStorageFactory alloc];
    if (v20) {
      v22 = [(NUPurgeableStorageFactory *)v21 initWithStoragePool:self->_surfaceStoragePool];
    }
    else {
      v22 = [(NUPurgeableStorageFactory *)v21 initWithStorageClass:objc_opt_class()];
    }
    surfaceFactory = self->_surfaceFactory;
    self->_surfaceFactory = v22;
  }
  if (!self->_renderNodeCache)
  {
    v24 = objc_alloc_init(NURenderNodeCache);
    renderNodeCache = self->_renderNodeCache;
    self->_renderNodeCache = v24;
  }
  if (!self->_renderResultCache)
  {
    v26 = objc_alloc_init(NURenderResultCache);
    renderResultCache = self->_renderResultCache;
    self->_renderResultCache = v26;
  }
  if (!self->_platform)
  {
    v28 = objc_alloc_init(NUPlatform_iOS);
    platform = self->_platform;
    self->_platform = &v28->super;
  }
  if (!self->_cacheNodeRegistry)
  {
    v30 = objc_alloc_init(NUCacheNodeRegistry);
    cacheNodeRegistry = self->_cacheNodeRegistry;
    self->_cacheNodeRegistry = v30;
  }
  if (!self->_visionSession)
  {
    v32 = (VNSession *)[objc_alloc(MEMORY[0x1E4F45968]) initWithCachingBehavior:1];
    visionSession = self->_visionSession;
    self->_visionSession = v32;
  }
  if (!self->_renderResourcePool)
  {
    v34 = objc_alloc_init(NURenderResourcePool);
    renderResourcePool = self->_renderResourcePool;
    self->_renderResourcePool = v34;
  }
  uint64_t v36 = +[NUGlobalSettings debugSoftMemoryLimit];
  if (v36 >= 1)
  {
    uint64_t v37 = v36;
    getpid();
    int v38 = memorystatus_control();
    if (v38)
    {
      int v39 = v38;
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_152_2637);
      }
      v40 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v45) = v39;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Failed to set soft memory limit (%d)", buf, 8u);
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_152_2637);
      }
      v41 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v45 = v37;
        _os_log_impl(&dword_1A9892000, v41, OS_LOG_TYPE_DEFAULT, "Successfully set soft memory limit to %ld MB", buf, 0xCu);
      }
    }
  }
  if (!self->_modelRegistry)
  {
    v42 = objc_alloc_init(NUMLModelRegistry);
    modelRegistry = self->_modelRegistry;
    self->_modelRegistry = v42;
  }
}

+ (void)freeAllResources:(BOOL)a3
{
  BOOL v3 = a3;
  if ([a1 hasSharedFactory])
  {
    +[NUPurgeableStoragePool purge:0];
    v5 = +[NUPlatform currentPlatform];
    [v5 clearCaches];

    if (v3)
    {
      [a1 shutdownSharedFactory];
    }
  }
}

+ (BOOL)hasSharedFactory
{
  id v2 = a1;
  objc_sync_enter(v2);
  BOOL v3 = sCurrentFactory != 0;
  objc_sync_exit(v2);

  return v3;
}

+ (void)reapAllStoragePools
{
  +[NUPurgeableStoragePool reapAllPurged];

  +[NUPurgeableStoragePool reapAllVolatile];
}

+ (void)reset
{
  BOOL v3 = objc_alloc_init(NUFactory);
  [a1 setSharedFactory:v3];
}

+ (void)setSharedFactory:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  if (!v36)
  {
    v6 = NUAssertLogger_2664();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "factory != nil");
      *(_DWORD *)buf = 138543362;
      int v38 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_2664();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        BOOL v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        int v38 = v20;
        __int16 v39 = 2114;
        v40 = v24;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      int v38 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUFactory setSharedFactory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUFactory.m", 70, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"factory != nil");
  }
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  if ((id)sCurrentFactory == v36)
  {
    v13 = NUAssertLogger_2664();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSString stringWithFormat:@"Cannot call [NUFactory setSharedFactory:] with itself. self:%@", a1];
      *(_DWORD *)buf = 138543362;
      int v38 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v16 = NUAssertLogger_2664();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = [MEMORY[0x1E4F29060] callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        int v38 = v29;
        __int16 v39 = 2114;
        v40 = v31;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      int v38 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUFactory setSharedFactory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUFactory.m", 72, @"Cannot call [NUFactory setSharedFactory:] with itself. self:%@", v32, v33, v34, v35, (uint64_t)a1);
  }
  objc_storeStrong((id *)&sCurrentFactory, a3);
  [(id)sCurrentFactory start];
  objc_sync_exit(v5);
}

+ (void)shutdownSharedFactory
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  id v2 = (void *)sCurrentFactory;
  sCurrentFactory = 0;

  objc_sync_exit(obj);
}

+ (id)sharedFactory
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  BOOL v3 = (void *)sCurrentFactory;
  if (!sCurrentFactory)
  {
    v4 = objc_alloc_init(NUFactory);
    v5 = (void *)sCurrentFactory;
    sCurrentFactory = (uint64_t)v4;

    [(id)sCurrentFactory start];
    BOOL v3 = (void *)sCurrentFactory;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

@end