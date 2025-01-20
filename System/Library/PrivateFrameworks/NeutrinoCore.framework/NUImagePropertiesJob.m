@interface NUImagePropertiesJob
- (BOOL)prepare:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsRenderStage;
- (id)result;
@end

@implementation NUImagePropertiesJob

- (void).cxx_destruct
{
}

- (id)result
{
  v3 = objc_alloc_init(_NUImagePropertiesResult);
  [(_NUImagePropertiesResult *)v3 setProperties:self->_imageProperties];

  return v3;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v10 = NUAssertLogger_21543();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v13 = NUAssertLogger_21543();
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
        v46 = v17;
        __int16 v47 = 2114;
        v48 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v46 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImagePropertiesJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImagePropertiesRequest.m", 86, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"error != NULL");
  }
  v44.receiver = self;
  v44.super_class = (Class)NUImagePropertiesJob;
  BOOL v5 = -[NURenderJob prepare:](&v44, sel_prepare_);
  if (v5)
  {
    v6 = [(NURenderJob *)self prepareNode];

    if (!v6)
    {
      v26 = NUAssertLogger_21543();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = [NSString stringWithFormat:@"Missing prepare node"];
        *(_DWORD *)buf = 138543362;
        v46 = v27;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v29 = NUAssertLogger_21543();
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
          v46 = v33;
          __int16 v47 = 2114;
          v48 = v37;
          _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v30)
      {
        v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v46 = v32;
        _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUImagePropertiesJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImagePropertiesRequest.m", 92, @"Missing prepare node", v38, v39, v40, v41, v43);
    }
    v7 = [(NURenderJob *)self prepareNode];
    v8 = [v7 imageProperties:a3];
    imageProperties = self->_imageProperties;
    self->_imageProperties = v8;

    LOBYTE(v5) = self->_imageProperties != 0;
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

@end