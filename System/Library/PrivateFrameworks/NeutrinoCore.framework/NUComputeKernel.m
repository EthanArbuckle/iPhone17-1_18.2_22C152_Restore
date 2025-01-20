@interface NUComputeKernel
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)gridSizeForThreadGroupSize:(SEL)a3 imageSize:(id *)a4;
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)groupSizeForImageSize:(SEL)a3 pipelineState:(id *)a4;
+ (id)pipelineStateForFunctionWithName:(id)a3 constants:(id)a4 key:(id)a5 device:(id)a6 error:(id *)a7;
+ (id)pipelineStateForFunctionWithName:(id)a3 device:(id)a4 error:(id *)a5;
- (MTLDevice)device;
- (NUComputeKernel)initWithDevice:(id)a3;
- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4;
@end

@implementation NUComputeKernel

- (void).cxx_destruct
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9448);
  }
  v7 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v8 = NSString;
    v9 = v7;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v8 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v11];
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_9448);
      }
      goto LABEL_8;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9448);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v15 = (void *)MEMORY[0x1E4F29060];
    v16 = v14;
    v17 = [v15 callStackSymbols];
    v18 = [v17 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v21 = (void *)MEMORY[0x1E4F29060];
  id v22 = specific;
  v16 = v19;
  v23 = [v21 callStackSymbols];
  v24 = [v23 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v32 = specific;
  __int16 v33 = 2114;
  v34 = v24;
  _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  _NUAssertFailHandler((uint64_t)"-[NUComputeKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 31, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v27, v28, v29, v30, v26);
}

- (NUComputeKernel)initWithDevice:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (MTLDevice *)a3;
  if (!v4)
  {
    v9 = NUAssertLogger_9464();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "device != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_9464();
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
        uint64_t v27 = v16;
        __int16 v28 = 2114;
        uint64_t v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUComputeKernel initWithDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 24, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"device != nil");
  }
  id v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUComputeKernel;
  id v6 = [(NUComputeKernel *)&v25 init];
  device = v6->_device;
  v6->_device = v5;

  return v6;
}

+ (id)pipelineStateForFunctionWithName:(id)a3 constants:(id)a4 key:(id)a5 device:(id)a6 error:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!a7)
  {
    __int16 v28 = NUAssertLogger_9464();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_9464();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v35;
        __int16 v51 = 2114;
        v52 = v39;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      __int16 v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUComputeKernel pipelineStateForFunctionWithName:constants:key:device:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 75, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  v15 = v14;
  id v16 = a1;
  objc_sync_enter(v16);
  v17 = (void *)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey;
  if (!pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v19 = (void *)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey;
    pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey = (uint64_t)v18;

    v17 = (void *)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey;
  }
  v20 = [v17 objectForKey:v13];
  if (!v20)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B50] bundleForClass:v16];
    id v48 = 0;
    v44 = (void *)[v15 newDefaultLibraryWithBundle:v21 error:&v48];
    id v22 = v48;

    if (!v44)
    {
      +[NUError errorWithCode:1 reason:@"Failed to load Metal library for device" object:v15 underlyingError:v22];
      v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (v12)
    {
      id v47 = v22;
      uint64_t v23 = (void *)[v44 newFunctionWithName:v45 constantValues:v12 error:&v47];
      id v24 = v47;

      id v22 = v24;
      if (v23)
      {
LABEL_8:
        id v46 = v22;
        v20 = (void *)[v15 newComputePipelineStateWithFunction:v23 error:&v46];
        id v25 = v46;

        if (v20)
        {
          [(id)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey setObject:v20 forKey:v13];

          id v22 = v25;
LABEL_15:

          goto LABEL_16;
        }
        uint64_t v26 = +[NUError errorWithCode:1 reason:@"Failed to create pipeline state from function" object:v45 underlyingError:v25];
        id v22 = v25;
LABEL_14:
        *a7 = v26;

        v20 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v23 = (void *)[v44 newFunctionWithName:v45];
      if (v23) {
        goto LABEL_8;
      }
    }
    uint64_t v26 = +[NUError errorWithCode:1 reason:@"Failed to load Metal kernel function" object:v45 underlyingError:v22];
    goto LABEL_14;
  }
LABEL_16:
  objc_sync_exit(v16);

  return v20;
}

+ (id)pipelineStateForFunctionWithName:(id)a3 device:(id)a4 error:(id *)a5
{
  return (id)[a1 pipelineStateForFunctionWithName:a3 constants:0 key:a3 device:a4 error:a5];
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)gridSizeForThreadGroupSize:(SEL)a3 imageSize:(id *)a4
{
  unint64_t v5 = (a5->var1 + a4->var1 - 1) / a4->var1;
  retstr->var0 = (a5->var0 + a4->var0 - 1) / a4->var0;
  retstr->var1 = v5;
  retstr->var2 = 1;
  return result;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)groupSizeForImageSize:(SEL)a3 pipelineState:(id *)a4
{
  id v21 = a5;
  unint64_t v7 = [v21 threadExecutionWidth];
  unint64_t v8 = [v21 maxTotalThreadsPerThreadgroup];
  unint64_t v9 = v8 / v7;
  retstr->var0 = v7;
  retstr->unint64_t var1 = v8 / v7;
  retstr->var2 = 1;
  if (v7 <= v8)
  {
    uint64_t v10 = 0;
    unint64_t var1 = a4->var1;
    unint64_t v12 = v7 + a4->var0;
    unint64_t v13 = -1;
    unint64_t v14 = -(uint64_t)(var1 * a4->var0);
    unint64_t v15 = -1;
    do
    {
      if (v7 + v10 <= v9) {
        unint64_t v16 = v9;
      }
      else {
        unint64_t v16 = v7 + v10;
      }
      if (v7 + v10 >= v9) {
        unint64_t v17 = v9;
      }
      else {
        unint64_t v17 = v7 + v10;
      }
      if (v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10) <= v13)
      {
        unint64_t v18 = v16 / v17;
        if (v18 <= v15)
        {
          retstr->var0 = v7 + v10;
          retstr->unint64_t var1 = v9;
          unint64_t v15 = v18;
          unint64_t v13 = v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10);
          retstr->var2 = 1;
        }
      }
      unint64_t v19 = 2 * v7 + v10;
      v10 += v7;
      unint64_t v9 = v8 / v19;
    }
    while (v7 + v10 <= v8);
  }

  return result;
}

@end