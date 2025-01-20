@interface NUCoalescer
- (NUCoalescer)init;
- (NUCoalescer)initWithDelay:(double)a3;
- (NUCoalescer)initWithDelay:(double)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (double)delay;
- (void)coalesceBlock:(id)a3;
- (void)dealloc;
@end

@implementation NUCoalescer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (double)delay
{
  return self->_delay;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)NUCoalescer;
  [(NUCoalescer *)&v3 dealloc];
}

- (void)coalesceBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_block_t handler = a3;
  if (!handler)
  {
    v8 = NUAssertLogger_7745();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_7745();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E4F29060];
        id v17 = v15;
        v18 = [v16 callStackSymbols];
        v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        __int16 v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCoalescer coalesceBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUCoalescer.m", 47, @"Invalid parameter not satisfying: %s", v20, v21, v22, v23, (uint64_t)"block != nil");
  }
  dispatch_suspend((dispatch_object_t)self->_timer);
  timer = self->_timer;
  [(NUCoalescer *)self delay];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  [(NUCoalescer *)self delay];
  dispatch_source_set_timer(timer, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v7 * 0.1 * 1000000000.0));
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, handler);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (NUCoalescer)initWithDelay:(double)a3 queue:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 <= 0.0)
  {
    v14 = NUAssertLogger_7745();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "delay > 0.0");
      *(_DWORD *)buf = 138543362;
      v48 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v17 = NUAssertLogger_7745();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v48 = v28;
        __int16 v49 = 2114;
        v50 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v48 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCoalescer initWithDelay:queue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUCoalescer.m", 26, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"delay > 0.0");
  }
  double v7 = v6;
  if (!v6)
  {
    uint64_t v21 = NUAssertLogger_7745();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "queue != nil");
      *(_DWORD *)buf = 138543362;
      v48 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_7745();
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
        v48 = v37;
        __int16 v49 = 2114;
        v50 = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v48 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCoalescer initWithDelay:queue:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUCoalescer.m", 27, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"queue != nil");
  }
  v46.receiver = self;
  v46.super_class = (Class)NUCoalescer;
  id v8 = [(NUCoalescer *)&v46 init];
  v9 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v7;
  v10 = v7;

  *((double *)v8 + 2) = a3;
  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);
  BOOL v12 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v11;

  dispatch_source_set_timer(*((dispatch_source_t *)v8 + 1), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  dispatch_source_set_event_handler(*((dispatch_source_t *)v8 + 1), &__block_literal_global_7770);
  dispatch_resume(*((dispatch_object_t *)v8 + 1));

  return (NUCoalescer *)v8;
}

- (NUCoalescer)initWithDelay:(double)a3
{
  return [(NUCoalescer *)self initWithDelay:MEMORY[0x1E4F14428] queue:a3];
}

- (NUCoalescer)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_38);
  }
  objc_super v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    double v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_38);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_38);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    dispatch_source_t v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  uint64_t v20 = [v18 callStackSymbols];
  uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCoalescer init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUCoalescer.m", 16, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end