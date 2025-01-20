@interface NUHDRGainMapMultiplyNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUHDRGainMapMultiplyNode)initWithInput:(id)a3 settings:(id)a4;
- (NUHDRGainMapMultiplyNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)inputNode;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NUHDRGainMapMultiplyNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 evaluationMode])
  {
    if ([v9 auxiliaryImageType] == 1)
    {
      v10 = (void *)[v9 copy];
      [v10 setAuxiliaryImageType:7];
      v11 = [(NUHDRGainMapMultiplyNode *)self inputNode];
      v12 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

      if (v12)
      {
        v13 = [(NUHDRGainMapMultiplyNode *)self inputNode];
        v14 = [v13 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];

        if (v14)
        {
          v15 = [(NURenderNode *)self settings];
          v16 = (void *)[v15 mutableCopy];

          [v16 setObject:@"inputImage" forKeyedSubscript:@"__dominantInputSettingsKey"];
          [v16 setObject:&unk_1F0049D40 forKeyedSubscript:@"__gainMapMode"];
          v22[0] = @"inputImage";
          v22[1] = @"inputGainMap";
          v23[0] = v14;
          v23[1] = v12;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
          v18 = [[NUFilterNode alloc] initWithFilterName:@"NUHDRMultiplyGainMapFilter" settings:v16 inputs:v17];
          v19 = [(NURenderNode *)v18 resolvedNodeWithCachedInputs:v17 cache:v8 pipelineState:v9 error:a5];
        }
        else
        {
          v19 = 0;
        }
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v10 = [(NUHDRGainMapMultiplyNode *)self inputNode];
      v19 = [v10 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)NUHDRGainMapMultiplyNode;
    v19 = [(NURenderNode *)&v21 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v19;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NUHDRGainMapMultiplyNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return [a3 evaluationMode] == 0;
}

- (id)inputNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return v3;
}

- (NUHDRGainMapMultiplyNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_9740();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_9740();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v32 = v19;
        __int16 v33 = 2114;
        v34 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapMultiplyNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 512, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"input != nil");
  }
  objc_super v8 = v7;
  uint64_t v29 = *MEMORY[0x1E4F1E480];
  id v30 = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v28.receiver = self;
  v28.super_class = (Class)NUHDRGainMapMultiplyNode;
  v10 = [(NURenderNode *)&v28 initWithSettings:v8 inputs:v9];

  return v10;
}

- (NUHDRGainMapMultiplyNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
  }
  objc_super v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    BOOL v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v17 = (void *)MEMORY[0x1E4F29060];
    v18 = v16;
    v19 = [v17 callStackSymbols];
    v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  v18 = v21;
  uint64_t v25 = [v23 callStackSymbols];
  uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapMultiplyNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 508, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end