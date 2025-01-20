@interface NUMetalRenderer
- (NUMetalRenderer)initWithCIContext:(id)a3 priority:(int64_t)a4;
- (NUMetalRenderer)initWithMetalDevice:(id)a3 options:(id)a4;
- (id)imageForSurface:(id)a3 options:(id)a4;
- (id)name;
- (id)renderDestinationForSurface:(id)a3;
- (void)_configureCommandQueue:(id)a3 withOptions:(id)a4;
@end

@implementation NUMetalRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (id)renderDestinationForSurface:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v11 = NUAssertLogger_21148();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != nil");
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_21148();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v45 = v25;
        __int16 v46 = 2114;
        v47 = v29;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMetalRenderer renderDestinationForSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 288, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"surface != nil");
  }
  v5 = v4;
  v6 = [v4 textureForDevice:self->_device];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithMTLTexture:v6 commandBuffer:0];
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1E070]);
    v9 = [v5 IOSurface];
    v7 = (void *)[v8 initWithIOSurface:v9];

    if (!v7)
    {
      v18 = NUAssertLogger_21148();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = [NSString stringWithFormat:@"Failed to create render destination!"];
        *(_DWORD *)buf = 138543362;
        v45 = v19;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v21 = NUAssertLogger_21148();
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
          v45 = v34;
          __int16 v46 = 2114;
          v47 = v38;
          _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v22)
      {
        v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v45 = v24;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUMetalRenderer renderDestinationForSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 296, @"Failed to create render destination!", v39, v40, v41, v42, v43);
    }
  }
  [v7 setLabel:@"NUMetalRenderer-surface"];
  [v7 setFlipped:1];

  return v7;
}

- (id)imageForSurface:(id)a3 options:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v10 = NUAssertLogger_21148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "surface != nil");
      *(_DWORD *)buf = 138543362;
      id v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_21148();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v27 = v17;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMetalRenderer imageForSurface:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 279, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"surface != nil");
  }
  v7 = v6;
  id v8 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithIOSurface:options:", objc_msgSend(v5, "IOSurfaceRef"), v6);

  return v8;
}

- (id)name
{
  v2 = NSString;
  v3 = [(MTLDevice *)self->_device name];
  id v4 = [v2 stringWithFormat:@"Metal renderer: %@", v3];

  return v4;
}

- (void)_configureCommandQueue:(id)a3 withOptions:(id)a4
{
  id v12 = a4;
  uint64_t v5 = *MEMORY[0x1E4F1E220];
  id v6 = a3;
  v7 = [v12 objectForKeyedSubscript:v5];
  char v8 = [v7 BOOLValue];

  if (v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
    v10 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F1E228]];
    int v11 = [v10 BOOLValue];

    if (v11) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  [v6 setGPUPriority:v9];
  [v6 setBackgroundGPUPriority:2];
}

- (NUMetalRenderer)initWithMetalDevice:(id)a3 options:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v19 = NUAssertLogger_21148();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metalDevice != nil");
      *(_DWORD *)buf = 138543362;
      v37 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_21148();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        __int16 v38 = 2114;
        uint64_t v39 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMetalRenderer initWithMetalDevice:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 233, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"metalDevice != nil");
  }
  char v8 = v7;
  uint64_t v9 = (MTLCommandQueue *)[v6 newCommandQueue];
  v10 = +[NURenderer _renderContextOptionsWithOptions:v8 nameSuffix:@"Metal"];
  int v11 = [MEMORY[0x1E4F1E018] contextWithMTLCommandQueue:v9 options:v10];
  [(NUMetalRenderer *)self _configureCommandQueue:v9 withOptions:v10];
  id v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E228]];
  if ([v12 BOOLValue]) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }

  v35.receiver = self;
  v35.super_class = (Class)NUMetalRenderer;
  BOOL v14 = [(NURenderer *)&v35 initWithCIContext:v11 priority:v13];
  queue = v14->_queue;
  v14->_queue = v9;
  v16 = v9;

  device = v14->_device;
  v14->_device = (MTLDevice *)v6;

  return v14;
}

- (NUMetalRenderer)initWithCIContext:(id)a3 priority:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
  }
  id v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v7 = NSString;
    char v8 = v6;
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    int v11 = NSStringFromSelector(a2);
    id v12 = [v7 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v10, v11];
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v12;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
      }
      goto LABEL_8;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_21171);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v15 = (void *)MEMORY[0x1E4F29060];
    v16 = v14;
    v17 = [v15 callStackSymbols];
    v18 = [v17 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v18;
    _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v21 = (void *)MEMORY[0x1E4F29060];
  id v22 = specific;
  v16 = v19;
  BOOL v23 = [v21 callStackSymbols];
  uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v32 = specific;
  __int16 v33 = 2114;
  uint64_t v34 = v24;
  _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUMetalRenderer initWithCIContext:priority:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 228, @"Initializer not available: -[%@ %@], use designated initializer instead.", v27, v28, v29, v30, v26);
}

@end