@interface NURenderResultCache
+ (id)shared;
- (NURenderResultCache)init;
- (id)resultForJob:(id)a3;
- (void)flush;
- (void)setResult:(id)a3 forJob:(id)a4;
@end

@implementation NURenderResultCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)flush
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__NURenderResultCache_flush__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __28__NURenderResultCache_flush__block_invoke(uint64_t a1)
{
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_31_26890);
  }
  v2 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1A9892000, v2, OS_LOG_TYPE_DEBUG, "MEMOIZE CACHE FLUSH", v4, 2u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)setResult:(id)a3 forJob:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v14 = NUAssertLogger_26895();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "job != nil");
      *(_DWORD *)buf = 138543362;
      v51 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_26895();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v28;
        __int16 v52 = 2114;
        v53 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResultCache setResult:forJob:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResultCache.m", 52, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"job != nil");
  }
  if (!v6)
  {
    v21 = NUAssertLogger_26895();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "result != nil");
      *(_DWORD *)buf = 138543362;
      v51 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_26895();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v40 = [v38 callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v37;
        __int16 v52 = 2114;
        v53 = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResultCache setResult:forJob:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResultCache.m", 53, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"result != nil");
  }
  v8 = v7;
  v9 = [v7 memoizationCacheKey];
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__NURenderResultCache_setResult_forJob___block_invoke;
    block[3] = &unk_1E5D95B90;
    block[4] = self;
    id v47 = v11;
    id v48 = v9;
    id v49 = v6;
    id v13 = v11;
    dispatch_sync(queue, block);
  }
}

void __40__NURenderResultCache_setResult_forJob___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    v3 = [NSString stringWithFormat:@"%@ result cache", a1[5]];
    [v2 setName:v3];

    [v2 setCountLimit:16];
    [*(id *)(a1[4] + 16) setObject:v2 forKeyedSubscript:a1[5]];
  }
  v4 = [v2 objectForKey:a1[6]];

  if (!v4)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_31_26890);
    }
    v5 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = a1[5];
      uint64_t v7 = a1[6];
      *(_DWORD *)buf = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_debug_impl(&dword_1A9892000, v5, OS_LOG_TYPE_DEBUG, "MEMOIZE %@ %@ CACHE STORE", buf, 0x16u);
    }
    [v2 setObject:a1[7] forKey:a1[6]];
  }
}

- (id)resultForJob:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v16 = NUAssertLogger_26895();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "job != nil");
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_26895();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)v40 = 138543618;
        *(void *)&v40[4] = v23;
        *(_WORD *)&v40[12] = 2114;
        *(void *)&v40[14] = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)v40 = 138543362;
      *(void *)&v40[4] = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResultCache resultForJob:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResultCache.m", 27, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"job != nil");
  }
  v5 = v4;
  uint64_t v6 = [v4 memoizationCacheKey];
  if (!v6)
  {
    id v14 = 0;
    goto LABEL_13;
  }
  *(void *)v40 = 0;
  *(void *)&v40[8] = v40;
  *(void *)&v40[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__26926;
  uint64_t v42 = __Block_byref_object_dispose__26927;
  id v43 = 0;
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NURenderResultCache_resultForJob___block_invoke;
  block[3] = &unk_1E5D95EE0;
  block[4] = self;
  id v10 = v8;
  id v33 = v10;
  uint64_t v35 = v40;
  id v11 = v6;
  id v34 = v11;
  dispatch_sync(queue, block);
  if (*(void *)(*(void *)&v40[8] + 40))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_31_26890);
    }
    uint64_t v12 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412546;
    id v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    id v13 = "MEMOIZE %@ %@ CACHE HIT";
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_31_26890);
    }
    uint64_t v12 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412546;
    id v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    id v13 = "MEMOIZE %@ %@ CACHE MISS";
  }
  _os_log_debug_impl(&dword_1A9892000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0x16u);
LABEL_12:
  id v14 = *(id *)(*(void *)&v40[8] + 40);

  _Block_object_dispose(v40, 8);
LABEL_13:

  return v14;
}

void __36__NURenderResultCache_resultForJob___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 objectForKey:a1[6]];
    uint64_t v4 = *(void *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = v6;
  }
}

- (NURenderResultCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)NURenderResultCache;
  id v2 = [(NURenderResultCache *)&v9 init];
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("NURenderResultCache", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cache = v2->_cache;
  v2->_cache = v6;

  return v2;
}

+ (id)shared
{
  id v2 = +[NUFactory sharedFactory];
  uint64_t v3 = [v2 renderResultCache];

  return v3;
}

@end