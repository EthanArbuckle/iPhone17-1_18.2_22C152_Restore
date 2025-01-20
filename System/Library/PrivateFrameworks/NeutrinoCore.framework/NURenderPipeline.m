@interface NURenderPipeline
- (id)_processedRenderNodeForComposition:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)_runPipelineFiltersForRenderNode:(id)a3 composition:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)processedRenderNodeForComposition:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)processedRenderNodeForComposition:(id)a3 pipelineState:(id)a4 extentPolicy:(id)a5 error:(id *)a6;
@end

@implementation NURenderPipeline

- (id)_runPipelineFiltersForRenderNode:(id)a3 composition:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [[NURenderPipelineHelper alloc] initWithPipelineState:v11];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v21 = v11;
  v13 = [v11 pipelineFilters];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
LABEL_3:
    uint64_t v17 = 0;
    v18 = v9;
    while (1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v13);
      }
      v19 = [*(id *)(*((void *)&v22 + 1) + 8 * v17) filterBlock];
      ((void (**)(void, NURenderPipelineHelper *, id, void *, id *))v19)[2](v19, v12, v10, v18, a6);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9) {
        break;
      }
      ++v17;
      v18 = v9;
      if (v15 == v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v9;
}

- (id)_processedRenderNodeForComposition:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_28544);
  }
  id v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = NSString;
    v13 = v11;
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    uint64_t v16 = [v12 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v15];
    *(_DWORD *)buf = 138543362;
    v36 = v16;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v17 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v17 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_28544);
      }
      goto LABEL_8;
    }
    if (v17 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_28544);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v18 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v19 = (void *)MEMORY[0x1E4F29060];
    v20 = v18;
    v21 = [v19 callStackSymbols];
    long long v22 = [v21 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v36 = v22;
    _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  long long v23 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v25 = (void *)MEMORY[0x1E4F29060];
  id v26 = specific;
  v20 = v23;
  uint64_t v27 = [v25 callStackSymbols];
  v28 = [v27 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v36 = specific;
  __int16 v37 = 2114;
  v38 = v28;
  _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v29 = (objc_class *)objc_opt_class();
  uint64_t v30 = NSStringFromClass(v29);
  _NUAssertFailHandler((uint64_t)"-[NURenderPipeline _processedRenderNodeForComposition:input:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipeline.m", 52, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v31, v32, v33, v34, v30);
}

- (id)processedRenderNodeForComposition:(id)a3 pipelineState:(id)a4 extentPolicy:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(NURenderPipeline *)self _processedRenderNodeForComposition:v10 input:0 pipelineState:v11 error:a6];
  if (v13)
  {
    uint64_t v14 = [(NURenderPipeline *)self _runPipelineFiltersForRenderNode:v13 composition:v10 pipelineState:v11 error:a6];

    if (v14)
    {
      uint64_t v15 = objc_opt_new();
      if ([v11 enableTransparency]) {
        [v15 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"renderTransparencyOpaque"];
      }
      if ([v11 enforceEvenDimensions]) {
        [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enforceEvenDimensions"];
      }
      if (v12) {
        [v15 setObject:v12 forKeyedSubscript:@"extentPolicy"];
      }
      uint64_t v16 = [NUPipelineOutputNode alloc];
      uint64_t v17 = (void *)[v15 copy];
      v13 = [(NUPipelineOutputNode *)v16 initWithInput:v14 settings:v17];
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)processedRenderNodeForComposition:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  return [(NURenderPipeline *)self processedRenderNodeForComposition:a3 pipelineState:a4 extentPolicy:0 error:a5];
}

@end