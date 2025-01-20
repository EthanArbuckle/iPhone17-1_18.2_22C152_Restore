@interface NURenderResourcePool
+ (id)shared;
- (NURenderResourcePool)init;
- (id)_checkOutResourceForKey:(id)a3 matching:(id)a4;
- (id)_resourceMatching:(id)a3;
- (id)checkOutResourceForKey:(id)a3 matching:(id)a4;
- (id)description;
- (void)_checkInResource:(id)a3 forKey:(id)a4;
- (void)_evictResource:(id)a3 ifNotUsedSince:(id)a4;
- (void)_flush;
- (void)_scheduleEvictionOfResource:(id)a3;
- (void)checkInResource:(id)a3 forKey:(id)a4;
- (void)flush;
@end

@implementation NURenderResourcePool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p resources:%@>", objc_opt_class(), self, self->_resources];
}

- (void)_flush
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10451);
  }
  v3 = (id)_NULogger;
  v4 = v3;
  os_signpost_id_t sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = [(NSMutableArray *)self->_resources count];
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9892000, v4, OS_SIGNPOST_EVENT, sid, "NURenderResourcePool.flush", "count=%lu", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableArray *)self->_resources removeAllObjects];
}

- (void)flush
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__NURenderResourcePool_flush__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __29__NURenderResourcePool_flush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flush];
}

- (void)_evictResource:(id)a3 ifNotUsedSince:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 inUse] & 1) == 0)
  {
    uint64_t v8 = [v6 lastUseTime];
    int v9 = [v8 isEqualToDate:v7];

    if (v9)
    {
      uint64_t v10 = [(NSMutableArray *)self->_resources indexOfObjectIdenticalTo:v6];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableArray *)self->_resources removeObjectAtIndex:v10];
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_10451);
        }
        v11 = (void *)_NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
        {
          v12 = v11;
          v13 = [v6 key];
          v14 = [v6 object];
          uint64_t v15 = [v6 useCount];
          uint64_t v16 = [(NSMutableArray *)self->_resources count];
          int v23 = 138413058;
          v24 = v13;
          __int16 v25 = 2048;
          v26 = v14;
          __int16 v27 = 2048;
          uint64_t v28 = v15;
          __int16 v29 = 2048;
          uint64_t v30 = v16;
          _os_log_impl(&dword_1A9892000, v12, OS_LOG_TYPE_INFO, "NURenderResource: evicted unused resource: %@ %p [%lu] (%lu remaining)", (uint8_t *)&v23, 0x2Au);

          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10451);
          }
        }
        v17 = (id)_NULogger;
        uint64_t v18 = [v6 sid];
        if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v19 = v18;
          if (os_signpost_enabled(v17))
          {
            v20 = [v6 key];
            v21 = [v6 object];
            uint64_t v22 = [v6 useCount];
            int v23 = 138412802;
            v24 = v20;
            __int16 v25 = 2048;
            v26 = v21;
            __int16 v27 = 2048;
            uint64_t v28 = v22;
            _os_signpost_emit_with_name_impl(&dword_1A9892000, v17, OS_SIGNPOST_EVENT, v19, "NURenderResource.evicted", "key=%@, obj=%p, count=%lu", (uint8_t *)&v23, 0x20u);
          }
        }
      }
    }
  }
}

- (void)_scheduleEvictionOfResource:(id)a3
{
  id v4 = a3;
  v5 = [v4 lastUseTime];
  +[NUGlobalSettings renderResourceEvictionDelay];
  if (v6 <= 0.0)
  {
    [(NURenderResourcePool *)self _evictResource:v4 ifNotUsedSince:v5];
  }
  else
  {
    double v7 = v6;
    objc_initWeak(&location, self);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__NURenderResourcePool__scheduleEvictionOfResource___block_invoke;
    v10[3] = &unk_1E5D946F8;
    objc_copyWeak(&v13, &location);
    id v11 = v4;
    id v12 = v5;
    dispatch_after(v8, queue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __52__NURenderResourcePool__scheduleEvictionOfResource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _evictResource:*(void *)(a1 + 32) ifNotUsedSince:*(void *)(a1 + 40)];
}

- (void)_checkInResource:(id)a3 forKey:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __48__NURenderResourcePool__checkInResource_forKey___block_invoke;
  uint64_t v22 = &unk_1E5D946D0;
  id v9 = v7;
  id v23 = v9;
  id v10 = v6;
  id v24 = v10;
  id v11 = [(NURenderResourcePool *)self _resourceMatching:&v19];
  if (!v11)
  {
    id v12 = [_NURenderResource alloc];
    id v11 = -[_NURenderResource initWithResource:key:](v12, "initWithResource:key:", v10, v9, v19, v20, v21, v22, v23);
    [(NSMutableArray *)self->_resources addObject:v11];
  }
  -[_NURenderResource setInUse:](v11, "setInUse:", 0, v19, v20, v21, v22);
  [(_NURenderResource *)v11 setUseCount:[(_NURenderResource *)v11 useCount] + 1];
  [(_NURenderResource *)v11 setLastUseTime:v8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10451);
  }
  id v13 = (id)_NULogger;
  uint64_t v14 = [(_NURenderResource *)v11 sid];
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      uint64_t v16 = [(_NURenderResource *)v11 key];
      v17 = [(_NURenderResource *)v11 object];
      uint64_t v18 = [(_NURenderResource *)v11 useCount];
      *(_DWORD *)buf = 138412802;
      v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v13, OS_SIGNPOST_INTERVAL_END, v15, "NURenderResource.use", "key=%@, obj=%p, count=%lu", buf, 0x20u);
    }
  }

  [(NURenderResourcePool *)self _scheduleEvictionOfResource:v11];
}

BOOL __48__NURenderResourcePool__checkInResource_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 key];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    v5 = [v3 object];
    BOOL v6 = v5 == *(void **)(a1 + 40);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)checkInResource:(id)a3 forKey:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = NUAssertLogger_10507();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "object != nil");
      *(_DWORD *)buf = 138543362;
      v47 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_10507();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        __int16 v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        __int16 v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v25;
        __int16 v48 = 2114;
        v49 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkInResource:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 78, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"object != nil");
  }
  if (!v7)
  {
    uint64_t v18 = NUAssertLogger_10507();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      v47 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_10507();
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
      id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkInResource:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 79, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"key != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NURenderResourcePool_checkInResource_forKey___block_invoke;
  block[3] = &unk_1E5D95878;
  block[4] = self;
  id v44 = v6;
  id v45 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __47__NURenderResourcePool_checkInResource_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkInResource:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (id)_resourceMatching:(id)a3
{
  id v4 = a3;
  resources = self->_resources;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NURenderResourcePool__resourceMatching___block_invoke;
  v10[3] = &unk_1E5D946A8;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSMutableArray *)resources indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    dispatch_time_t v8 = 0;
  }
  else
  {
    dispatch_time_t v8 = [(NSMutableArray *)self->_resources objectAtIndexedSubscript:v7];
  }

  return v8;
}

uint64_t __42__NURenderResourcePool__resourceMatching___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_checkOutResourceForKey:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __57__NURenderResourcePool__checkOutResourceForKey_matching___block_invoke;
  BOOL v15 = &unk_1E5D94680;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(NURenderResourcePool *)self _resourceMatching:&v12];
  objc_msgSend(v10, "setInUse:", 1, v12, v13, v14, v15);

  return v10;
}

uint64_t __57__NURenderResourcePool__checkOutResourceForKey_matching___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 inUse])
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [v3 key];
    if ([v5 isEqualToString:*(void *)(a1 + 32)])
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = [v3 object];
      uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (id)checkOutResourceForKey:(id)a3 matching:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v20 = NUAssertLogger_10507();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)v60 = 138543362;
      *(void *)&v60[4] = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v60, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v23 = NUAssertLogger_10507();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)v60 = 138543618;
        *(void *)&v60[4] = v34;
        *(_WORD *)&v60[12] = 2114;
        *(void *)&v60[14] = v38;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v60, 0x16u);
      }
    }
    else if (v24)
    {
      __int16 v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)v60 = 138543362;
      *(void *)&v60[4] = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v60, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkOutResourceForKey:matching:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 47, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"key != nil");
  }
  id v8 = v7;
  if (!v7)
  {
    id v27 = NUAssertLogger_10507();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "predicate != nil");
      *(_DWORD *)v60 = 138543362;
      *(void *)&v60[4] = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v60, 0xCu);
    }
    __int16 v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v30 = NUAssertLogger_10507();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)v60 = 138543618;
        *(void *)&v60[4] = v43;
        *(_WORD *)&v60[12] = 2114;
        *(void *)&v60[14] = v47;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v60, 0x16u);
      }
    }
    else if (v31)
    {
      uint64_t v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)v60 = 138543362;
      *(void *)&v60[4] = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v60, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderResourcePool checkOutResourceForKey:matching:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderResourcePool.m", 48, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"predicate != nil");
  }
  *(void *)v60 = 0;
  *(void *)&v60[8] = v60;
  *(void *)&v60[16] = 0x3032000000;
  v61 = __Block_byref_object_copy__10549;
  v62 = __Block_byref_object_dispose__10550;
  id v63 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NURenderResourcePool_checkOutResourceForKey_matching___block_invoke;
  block[3] = &unk_1E5D94658;
  v55 = v60;
  block[4] = self;
  id v10 = v6;
  id v53 = v10;
  id v11 = v8;
  id v54 = v11;
  dispatch_sync(queue, block);
  if (*(void *)(*(void *)&v60[8] + 40))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10451);
    }
    uint64_t v12 = (id)_NULogger;
    os_signpost_id_t v13 = [*(id *)(*(void *)&v60[8] + 40) sid];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      uint64_t v14 = [*(id *)(*(void *)&v60[8] + 40) key];
      BOOL v15 = [*(id *)(*(void *)&v60[8] + 40) object];
      *(_DWORD *)buf = 138412546;
      id v57 = v14;
      __int16 v58 = 2048;
      v59 = v15;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NURenderResource.use", "key=%@, obj=%p", buf, 0x16u);
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10451);
    }
    id v16 = (id)_NULogger;
    uint64_t v12 = v16;
    os_signpost_id_t sid = self->_sid;
    if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v10;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v12, OS_SIGNPOST_EVENT, sid, "NURenderResource.miss", "key=%@", buf, 0xCu);
    }
  }

  uint64_t v18 = [*(id *)(*(void *)&v60[8] + 40) object];

  _Block_object_dispose(v60, 8);

  return v18;
}

uint64_t __56__NURenderResourcePool_checkOutResourceForKey_matching___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _checkOutResourceForKey:*(void *)(a1 + 40) matching:*(void *)(a1 + 48)];

  return MEMORY[0x1F41817F8]();
}

- (NURenderResourcePool)init
{
  v9.receiver = self;
  v9.super_class = (Class)NURenderResourcePool;
  v2 = [(NURenderResourcePool *)&v9 init];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("NURenderResourcePool", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  resources = v2->_resources;
  v2->_resources = v6;

  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10451);
  }
  v2->_os_signpost_id_t sid = os_signpost_id_make_with_pointer((os_log_t)_NULogger, v2);
  return v2;
}

+ (id)shared
{
  v2 = +[NUFactory sharedFactory];
  id v3 = [v2 renderResourcePool];

  return v3;
}

@end