@interface NUCacheNodeRegistry
- (Class)classForCacheNodeType:(id)a3;
- (NUCacheNodeRegistry)init;
- (void)registerClass:(Class)a3 forCacheNodeType:(id)a4;
@end

@implementation NUCacheNodeRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (Class)classForCacheNodeType:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v9 = NUAssertLogger_165();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "type != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_165();
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
    _NUAssertFailHandler((uint64_t)"-[NUCacheNodeRegistry classForCacheNodeType:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNodeRegistry.m", 45, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"type != nil");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2050000000;
  uint64_t v29 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NUCacheNodeRegistry_classForCacheNodeType___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v26 = v4;
  v27 = buf;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = *(id *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);

  return (Class)v7;
}

uint64_t __45__NUCacheNodeRegistry_classForCacheNodeType___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)registerClass:(Class)a3 forCacheNodeType:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!a3)
  {
    v10 = NUAssertLogger_165();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cacheNodeClass != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v13 = NUAssertLogger_165();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v31;
        __int16 v63 = 2114;
        v64 = v35;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNodeRegistry registerClass:forCacheNodeType:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNodeRegistry.m", 33, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"cacheNodeClass != nil");
  }
  id v7 = v6;
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v17 = NUAssertLogger_165();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[cacheNodeClass isSubclassOfClass:NUCacheNode.class]");
      *(_DWORD *)buf = 138543362;
      v62 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger_165();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v40;
        __int16 v63 = 2114;
        v64 = v44;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNodeRegistry registerClass:forCacheNodeType:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNodeRegistry.m", 34, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"[cacheNodeClass isSubclassOfClass:NUCacheNode.class]");
  }
  if (!v7)
  {
    uint64_t v24 = NUAssertLogger_165();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "type != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_165();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v49;
        __int16 v63 = 2114;
        v64 = v53;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCacheNodeRegistry registerClass:forCacheNodeType:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNodeRegistry.m", 35, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"type != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NUCacheNodeRegistry_registerClass_forCacheNodeType___block_invoke;
  block[3] = &unk_1E5D93B50;
  block[4] = self;
  id v59 = v7;
  Class v60 = a3;
  id v9 = v7;
  dispatch_barrier_sync(queue, block);
}

uint64_t __54__NUCacheNodeRegistry_registerClass_forCacheNodeType___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (NUCacheNodeRegistry)init
{
  v9.receiver = self;
  v9.super_class = (Class)NUCacheNodeRegistry;
  v2 = [(NUCacheNodeRegistry *)&v9 init];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("NUCacheNodeRegistry", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  registry = v2->_registry;
  v2->_registry = v6;

  [(NSMutableDictionary *)v2->_registry setObject:objc_opt_class() forKeyedSubscript:@"Image"];
  [(NSMutableDictionary *)v2->_registry setObject:objc_opt_class() forKeyedSubscript:@"Video"];
  [(NSMutableDictionary *)v2->_registry setObject:objc_opt_class() forKeyedSubscript:@"Intermediate"];
  [(NSMutableDictionary *)v2->_registry setObject:objc_opt_class() forKeyedSubscript:@"Memory"];
  return v2;
}

@end