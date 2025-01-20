@interface NURedEyeDetectionRequest
- (NURedEyeDetectionRequest)initWithComposition:(id)a3 dataExtractor:(id)a4 options:(id)a5;
- (NURedEyeDetectionRequest)initWithComposition:(id)a3 options:(id)a4;
- (NURedEyeDetectionRequest)initWithRequest:(id)a3 dataExtractor:(id)a4 options:(id)a5;
- (NURedEyeDetectionRequest)initWithRequest:(id)a3 options:(id)a4;
- (id)newRenderJob;
@end

@implementation NURedEyeDetectionRequest

- (id)newRenderJob
{
  v3 = [NURedEyeDetectionJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

- (NURedEyeDetectionRequest)initWithComposition:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NURedEyeDetectionRequest;
  return [(NUImageDataRequest *)&v5 initWithComposition:a3 dataExtractor:@"CIAutoRedEye" options:a4];
}

- (NURedEyeDetectionRequest)initWithRequest:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NURedEyeDetectionRequest;
  return [(NUImageDataRequest *)&v5 initWithRequest:a3 dataExtractor:@"CIAutoRedEye" options:a4];
}

- (NURedEyeDetectionRequest)initWithRequest:(id)a3 dataExtractor:(id)a4 options:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3423);
  }
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = NSString;
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    v17 = [v12 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v15, v16];
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3423);
      }
      goto LABEL_8;
    }
    if (v18 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3423);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x1E4F29060];
    v21 = v19;
    v22 = [v20 callStackSymbols];
    v23 = [v22 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E4F29060];
  id v27 = specific;
  v21 = v24;
  v28 = [v26 callStackSymbols];
  v29 = [v28 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  __int16 v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  uint64_t v31 = NSStringFromClass(v30);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURedEyeDetectionRequest initWithRequest:dataExtractor:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURedEyeDetectionRequest.m", 25, @"Initializer not available: -[%@ %@], use designated initializer instead.", v32, v33, v34, v35, v31);
}

- (NURedEyeDetectionRequest)initWithComposition:(id)a3 dataExtractor:(id)a4 options:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3423);
  }
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = NSString;
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    v17 = [v12 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v15, v16];
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3423);
      }
      goto LABEL_8;
    }
    if (v18 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3423);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x1E4F29060];
    v21 = v19;
    v22 = [v20 callStackSymbols];
    v23 = [v22 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E4F29060];
  id v27 = specific;
  v21 = v24;
  v28 = [v26 callStackSymbols];
  v29 = [v28 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  __int16 v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  uint64_t v31 = NSStringFromClass(v30);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURedEyeDetectionRequest initWithComposition:dataExtractor:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURedEyeDetectionRequest.m", 20, @"Initializer not available: -[%@ %@], use designated initializer instead.", v32, v33, v34, v35, v31);
}

@end