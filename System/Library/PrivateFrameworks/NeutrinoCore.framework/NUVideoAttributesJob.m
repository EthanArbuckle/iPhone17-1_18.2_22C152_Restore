@interface NUVideoAttributesJob
- (BOOL)prepare:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsRenderStage;
- (NUVideoAttributes)videoAttributes;
- (id)result;
- (void)setVideoAttributes:(id)a3;
@end

@implementation NUVideoAttributesJob

- (void).cxx_destruct
{
}

- (void)setVideoAttributes:(id)a3
{
}

- (NUVideoAttributes)videoAttributes
{
  return self->_videoAttributes;
}

- (id)result
{
  v3 = objc_alloc_init(_NUVideoAttributesResult);
  v4 = [(NUVideoAttributesJob *)self videoAttributes];
  [(_NUVideoAttributesResult *)v3 setVideoAttributes:v4];

  return v3;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v10 = NUAssertLogger_222();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v45 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_222();
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
        v45 = v17;
        __int16 v46 = 2114;
        v47 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v45 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoAttributesJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoAttributesRequest.m", 79, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"error != NULL");
  }
  v43.receiver = self;
  v43.super_class = (Class)NUVideoAttributesJob;
  BOOL v5 = -[NURenderJob prepare:](&v43, sel_prepare_);
  if (v5)
  {
    v6 = [(NURenderJob *)self prepareNode];
    if (!v6)
    {
      v26 = NUAssertLogger_222();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = [NSString stringWithFormat:@"Missing prepareNode"];
        *(_DWORD *)buf = 138543362;
        v45 = v27;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v29 = NUAssertLogger_222();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      if (v28)
      {
        if (v30)
        {
          v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v34 = (void *)MEMORY[0x1E4F29060];
          id v35 = v33;
          v36 = [v34 callStackSymbols];
          v37 = [v36 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v45 = v33;
          __int16 v46 = 2114;
          v47 = v37;
          _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v30)
      {
        v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v45 = v32;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUVideoAttributesJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoAttributesRequest.m", 86, @"Missing prepareNode", v38, v39, v40, v41, v42);
    }
    v7 = v6;
    v8 = [v6 outputVideoAttributes:a3];
    [(NUVideoAttributesJob *)self setVideoAttributes:v8];
  }
  return v5;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsRenderStage
{
  return 0;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

@end