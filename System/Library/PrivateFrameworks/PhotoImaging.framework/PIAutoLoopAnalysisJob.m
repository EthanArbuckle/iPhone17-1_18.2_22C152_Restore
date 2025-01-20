@interface PIAutoLoopAnalysisJob
- (AVAsset)videoSource;
- (BOOL)prepare:(id *)a3;
- (BOOL)render:(id *)a3;
- (BOOL)wantsCompleteStage;
- (BOOL)wantsOutputGeometry;
- (BOOL)wantsOutputVideo;
- (NSDictionary)recipe;
- (id)cacheKey;
- (id)result;
- (id)scalePolicy;
- (void)setRecipe:(id)a3;
- (void)setVideoSource:(id)a3;
@end

@implementation PIAutoLoopAnalysisJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_videoSource, 0);
}

- (void)setRecipe:(id)a3
{
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setVideoSource:(id)a3
{
}

- (AVAsset)videoSource
{
  return self->_videoSource;
}

- (id)result
{
  v3 = objc_alloc_init(_PIAutoLoopAnalysisResult);
  v4 = [(PIAutoLoopAnalysisJob *)self recipe];
  [(_PIAutoLoopAnalysisResult *)v3 setRecipe:v4];

  return v3;
}

- (BOOL)render:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v15 = NUAssertLogger_6249();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger_6249();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v23;
        __int16 v33 = 2114;
        v34 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = NSTemporaryDirectory();
  v7 = [v5 fileURLWithPath:v6];

  int v31 = 0;
  v8 = [(PIAutoLoopAnalysisJob *)self videoSource];
  createAutoLoopSettingsForAsset();

  objc_initWeak(&location, self);
  *(_DWORD *)&buf[8] = 2;
  *(void *)buf = 0x100000000;
  uint64_t v29 = 0;
  int v9 = v31;
  if (v31)
  {
    BOOL v10 = 0;
LABEL_13:
    if (v9 == 1)
    {
      [MEMORY[0x1E4F7A438] canceledError:@"canceled" object:objc_opt_class()];
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F7A438];
      uint64_t v13 = autoloopErrorCodeToString();
      [v12 failureError:v13 object:objc_opt_class()];
    }
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_copyWeak(&v28, &location);
  int v31 = runLiveAnalysisPipeline();
  objc_destroyWeak(&v28);
  if (v31)
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = liveAnalysisResultToDictionary();
    BOOL v10 = v11 != 0;
    if (v11)
    {
      [(PIAutoLoopAnalysisJob *)self setRecipe:v11];
    }
    else
    {
      *a3 = [MEMORY[0x1E4F7A438] failureError:@"could not extract dictionary results" object:objc_opt_class()];
    }
  }
  if (v29) {
    liveAnalysisResultDestroy();
  }
  int v9 = v31;
  if (v31) {
    goto LABEL_13;
  }
LABEL_17:
  autoloopSettingsDestroy();
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __32__PIAutoLoopAnalysisJob_render___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = [WeakRetained isCanceled] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)prepare:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v13 = NUAssertLogger_6249();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      id v28 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_6249();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        id v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v28 = v21;
        __int16 v29 = 2114;
        v30 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v28 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v26.receiver = self;
  v26.super_class = (Class)PIAutoLoopAnalysisJob;
  if (!-[NURenderJob prepare:](&v26, sel_prepare_)) {
    return 0;
  }
  v5 = [(NURenderJob *)self renderNode];
  v6 = PIAutoLoopFindVideoSourceNode(v5);

  if (v6)
  {
    v7 = [v6 asset:a3];
    videoSource = self->_videoSource;
    self->_videoSource = v7;

    BOOL v9 = self->_videoSource != 0;
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1E4F7A438];
    v11 = [(NURenderJob *)self renderNode];
    *a3 = [v10 missingError:@"unable to find video source node" object:v11];

    BOOL v9 = 0;
  }

  return v9;
}

- (id)scalePolicy
{
  return (id)[MEMORY[0x1E4F7A478] oneToOneScalePolicy];
}

- (id)cacheKey
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A428]);
  v4 = [(NURenderJob *)self renderNode];
  v5 = PIAutoLoopFindVideoSourceNode(v4);

  objc_msgSend(v5, "nu_updateDigest:", v3);
  [v3 finalize];
  v6 = [v3 stringValue];

  return v6;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

@end