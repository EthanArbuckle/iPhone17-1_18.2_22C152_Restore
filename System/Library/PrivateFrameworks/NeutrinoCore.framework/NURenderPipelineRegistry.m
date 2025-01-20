@interface NURenderPipelineRegistry
+ (id)sharedRegistry;
- (NURenderPipelineRegistry)init;
- (id)_renderPipelineForIdentifier:(id)a3;
- (id)description;
- (id)renderPipelineForIdentifier:(id)a3;
- (void)_registerRenderPipeline:(id)a3 forIdentifier:(id)a4;
- (void)registerRenderPipeline:(id)a3 forIdentifier:(id)a4;
@end

@implementation NURenderPipelineRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__20063;
  v10 = __Block_byref_object_dispose__20064;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__NURenderPipelineRegistry_description__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __39__NURenderPipelineRegistry_description__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSString stringWithFormat:@"<%@:%p> %@", objc_opt_class(), *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 16)];

  return MEMORY[0x1F41817F8]();
}

- (id)renderPipelineForIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v9 = NUAssertLogger_20069();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_20069();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E4F29060];
        id v18 = v16;
        v19 = [v17 callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineRegistry renderPipelineForIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineRegistry.m", 55, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"identifier != nil");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__20063;
  v30 = __Block_byref_object_dispose__20064;
  id v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NURenderPipelineRegistry_renderPipelineForIdentifier___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v26 = v4;
  v27 = buf;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v7;
}

uint64_t __56__NURenderPipelineRegistry_renderPipelineForIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _renderPipelineForIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (id)_renderPipelineForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_registry objectForKeyedSubscript:a3];
}

- (void)registerRenderPipeline:(id)a3 forIdentifier:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = NUAssertLogger_20069();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipeline != nil");
      *(_DWORD *)buf = 138543362;
      v47 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_20069();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v25;
        __int16 v48 = 2114;
        v49 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineRegistry registerRenderPipeline:forIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineRegistry.m", 40, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"pipeline != nil");
  }
  if (!v7)
  {
    id v18 = NUAssertLogger_20069();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v47 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_20069();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v34;
        __int16 v48 = 2114;
        v49 = v38;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineRegistry registerRenderPipeline:forIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineRegistry.m", 41, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"identifier != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__NURenderPipelineRegistry_registerRenderPipeline_forIdentifier___block_invoke;
  block[3] = &unk_1E5D95878;
  block[4] = self;
  id v44 = v6;
  id v45 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __65__NURenderPipelineRegistry_registerRenderPipeline_forIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerRenderPipeline:*(void *)(a1 + 40) forIdentifier:*(void *)(a1 + 48)];
}

- (void)_registerRenderPipeline:(id)a3 forIdentifier:(id)a4
{
}

- (NURenderPipelineRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)NURenderPipelineRegistry;
  v2 = [(NURenderPipelineRegistry *)&v8 init];
  dispatch_queue_t v3 = dispatch_queue_create("NURenderPipelineRegistry", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  registry = v2->_registry;
  v2->_registry = v5;

  return v2;
}

+ (id)sharedRegistry
{
  v2 = +[NUFactory sharedFactory];
  dispatch_queue_t v3 = [v2 renderPipelineRegistry];

  return v3;
}

@end