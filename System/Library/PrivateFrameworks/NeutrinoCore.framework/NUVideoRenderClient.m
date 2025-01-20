@interface NUVideoRenderClient
- (NSArray)pipelineFilters;
- (NUScalePolicy)scalePolicy;
- (NUVideoRenderClient)initWithName:(id)a3 responseQueue:(id)a4;
- (int64_t)sampleMode;
- (void)setPipelineFilters:(id)a3;
- (void)setSampleMode:(int64_t)a3;
- (void)setScalePolicy:(id)a3;
- (void)submitRequestForComposition:(id)a3 completion:(id)a4;
@end

@implementation NUVideoRenderClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineFilters, 0);

  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

- (void)setPipelineFilters:(id)a3
{
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)submitRequestForComposition:(id)a3 completion:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v6 = a4;
  if (!v43)
  {
    v11 = NUAssertLogger_19274();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      v45 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v14 = NUAssertLogger_19274();
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
    _NUAssertFailHandler((uint64_t)"-[NUVideoRenderClient submitRequestForComposition:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoRenderRequest.m", 45, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"composition != nil");
  }
  if (!v6)
  {
    v18 = NUAssertLogger_19274();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completionBlock != nil");
      *(_DWORD *)buf = 138543362;
      v45 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v21 = NUAssertLogger_19274();
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
    _NUAssertFailHandler((uint64_t)"-[NUVideoRenderClient submitRequestForComposition:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoRenderRequest.m", 46, @"Invalid parameter not satisfying: %s", v39, v40, v41, v42, (uint64_t)"completionBlock != nil");
  }
  v7 = [[NUVideoRenderRequest alloc] initWithComposition:v43];
  v8 = [(NUVideoRenderClient *)self pipelineFilters];
  [(NURenderRequest *)v7 setPipelineFilters:v8];

  v9 = [(NUVideoRenderClient *)self scalePolicy];
  [(NUVideoRenderRequest *)v7 setScalePolicy:v9];

  [(NURenderRequest *)v7 setSampleMode:[(NUVideoRenderClient *)self sampleMode]];
  v10 = [(NURenderClient *)self name];
  [(NURenderRequest *)v7 setName:v10];

  [(NURenderClient *)self submitGenericRequest:v7 completion:v6];
}

- (NUVideoRenderClient)initWithName:(id)a3 responseQueue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NUVideoRenderClient;
  v4 = [(NURenderClient *)&v8 initWithName:a3 responseQueue:a4];
  if (v4)
  {
    uint64_t v5 = +[NUFixedScalePolicy oneToOneScalePolicy];
    scalePolicy = v4->_scalePolicy;
    v4->_scalePolicy = (NUScalePolicy *)v5;

    v4->_sampleMode = 0;
  }
  return v4;
}

@end