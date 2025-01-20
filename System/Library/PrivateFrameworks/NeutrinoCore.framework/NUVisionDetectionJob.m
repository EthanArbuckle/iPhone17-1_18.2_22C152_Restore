@interface NUVisionDetectionJob
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputImage;
- (NSArray)observations;
- (NUVisionDetectionJob)initWithRequest:(id)a3;
- (NUVisionDetectionJob)initWithVisionDetectionRequest:(id)a3;
- (id)result;
- (id)scalePolicy;
- (void)cleanUp;
- (void)setObservations:(id)a3;
@end

@implementation NUVisionDetectionJob

- (void).cxx_destruct
{
}

- (void)setObservations:(id)a3
{
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)cleanUp
{
  v3.receiver = self;
  v3.super_class = (Class)NUVisionDetectionJob;
  [(NURenderJob *)&v3 cleanUp];
  [(NUVisionDetectionJob *)self setObservations:0];
}

- (id)result
{
  objc_super v3 = objc_alloc_init(_NUVisionDetectionResult);
  v4 = [(NUVisionDetectionJob *)self observations];
  [(_NUVisionDetectionResult *)v3 setObservations:v4];

  v5 = [(NURenderJob *)self outputGeometry];
  uint64_t v6 = [v5 size];
  -[_NUVisionDetectionResult setImageSize:](v3, "setImageSize:", v6, v7);

  return v3;
}

- (BOOL)render:(id *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v27 = NUAssertLogger_15829();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v56 = v28;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v30 = NUAssertLogger_15829();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v56 = v34;
        __int16 v57 = 2114;
        v58 = v38;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v56 = v33;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVisionDetectionJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionDetectionRequest.m", 121, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"error != nil");
  }
  v5 = -[NURenderJob renderer:](self, "renderer:");
  if (v5)
  {
    uint64_t v6 = [(NURenderJob *)self outputImage];
    uint64_t v7 = [v5 context];
    id v8 = objc_alloc(MEMORY[0x1E4F45890]);
    uint64_t v53 = *MEMORY[0x1E4F45CA0];
    v54 = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v10 = +[NUFactory sharedFactory];
    v11 = [v10 visionSession];
    v12 = (void *)[v8 initWithCIImage:v6 options:v9 session:v11];

    v13 = [(NUVisionDetectionJob *)self detectionRequest];
    v14 = [v13 visionRequests];

    id v51 = 0;
    char v15 = [v12 performRequests:v14 error:&v51];
    id v16 = v51;
    v17 = v16;
    if (v15)
    {
      id v43 = v16;
      v44 = v12;
      v45 = v7;
      v46 = v6;
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v19 = v14;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = [*(id *)(*((void *)&v47 + 1) + 8 * i) results];
            if (v24) {
              [v18 addObjectsFromArray:v24];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v21);
      }

      v25 = (void *)[v18 copy];
      [(NUVisionDetectionJob *)self setObservations:v25];

      uint64_t v7 = v45;
      uint64_t v6 = v46;
      v17 = v43;
      v12 = v44;
    }
    else
    {
      *a3 = +[NUError errorWithCode:1 reason:@"Vision detection failed" object:v14 underlyingError:v16];
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (id)scalePolicy
{
  v2 = [(NUVisionDetectionJob *)self detectionRequest];
  objc_super v3 = [v2 scalePolicy];

  return v3;
}

- (NUVisionDetectionJob)initWithRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_150);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = NSString;
    uint64_t v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a2);
    v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_150);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_150);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E4F29060];
    char v15 = v13;
    id v16 = [v14 callStackSymbols];
    v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    BOOL v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  char v15 = v18;
  uint64_t v22 = [v20 callStackSymbols];
  v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  BOOL v31 = specific;
  __int16 v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUVisionDetectionJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVisionDetectionRequest.m", 96, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUVisionDetectionJob)initWithVisionDetectionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUVisionDetectionJob;
  return [(NURenderJob *)&v4 initWithRequest:a3];
}

@end