@interface _NUPipelineBuilderRenderPipeline
- (NUPipelineBuilder)pipelineBuilder;
- (_NUPipelineBuilderRenderPipeline)initWithPipelineBuilder:(id)a3;
@end

@implementation _NUPipelineBuilderRenderPipeline

- (void).cxx_destruct
{
}

- (NUPipelineBuilder)pipelineBuilder
{
  return self->_pipelineBuilder;
}

- (_NUPipelineBuilderRenderPipeline)initWithPipelineBuilder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (NUPipelineBuilder *)a3;
  if (!v4)
  {
    v9 = NUAssertLogger_5149();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pipelineBuilder != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v12 = NUAssertLogger_5149();
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
        v27 = v16;
        __int16 v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUPipelineBuilderRenderPipeline initWithPipelineBuilder:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1210, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"pipelineBuilder != nil");
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)_NUPipelineBuilderRenderPipeline;
  v6 = [(_NUPipelineBuilderRenderPipeline *)&v25 init];
  pipelineBuilder = v6->_pipelineBuilder;
  v6->_pipelineBuilder = v5;

  return v6;
}

@end