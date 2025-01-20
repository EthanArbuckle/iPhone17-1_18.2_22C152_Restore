@interface NUPipelineBuilderRegistry
+ (id)pipelineBuilderForIdentifier:(id)a3;
+ (void)registerPipelineBuilder:(id)a3 forIdentifier:(id)a4;
@end

@implementation NUPipelineBuilderRegistry

+ (id)pipelineBuilderForIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v9 = NUAssertLogger_5149();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v10;
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
        v26 = v16;
        __int16 v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUPipelineBuilderRegistry pipelineBuilderForIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1197, @"Invalid parameter not satisfying: %s", v21, v22, v23, v24, (uint64_t)"identifier != nil");
  }
  v4 = v3;
  v5 = +[NURenderPipelineRegistry sharedRegistry];
  v6 = [v5 renderPipelineForIdentifier:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 pipelineBuilder];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)registerPipelineBuilder:(id)a3 forIdentifier:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v5 = a4;
  if (!v40)
  {
    v8 = NUAssertLogger_5149();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "builder != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v11 = NUAssertLogger_5149();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v22;
        __int16 v43 = 2114;
        v44 = v26;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      BOOL v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUPipelineBuilderRegistry registerPipelineBuilder:forIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1190, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"builder != nil");
  }
  if (!v5)
  {
    v15 = NUAssertLogger_5149();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v18 = NUAssertLogger_5149();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        __int16 v43 = 2114;
        v44 = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUPipelineBuilderRegistry registerPipelineBuilder:forIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1191, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"identifier != nil");
  }
  v6 = [[_NUPipelineBuilderRenderPipeline alloc] initWithPipelineBuilder:v40];
  v7 = +[NURenderPipelineRegistry sharedRegistry];
  [v7 registerRenderPipeline:v6 forIdentifier:v5];
}

@end