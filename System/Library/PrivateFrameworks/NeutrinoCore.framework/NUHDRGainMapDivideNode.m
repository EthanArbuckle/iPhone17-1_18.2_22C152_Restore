@interface NUHDRGainMapDivideNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUHDRGainMapDivideNode)initWithInput:(id)a3 lightMap:(id)a4 settings:(id)a5;
- (NUHDRGainMapDivideNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)inputNode;
- (id)lightMapNode;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
@end

@implementation NUHDRGainMapDivideNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 auxiliaryImageType] == 7)
  {
    v10 = (void *)[v9 copy];
    [v10 setAuxiliaryImageType:1];
    v11 = [(NUHDRGainMapDivideNode *)self lightMapNode];
    v12 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

    if (v12)
    {
      v13 = [(NUHDRGainMapDivideNode *)self inputNode];
      v14 = [v13 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

      if (v14)
      {
        v15 = [(NURenderNode *)self settings];
        v16 = (void *)[v15 mutableCopy];

        [v16 setObject:@"inputImage" forKeyedSubscript:@"__dominantInputSettingsKey"];
        [v16 setObject:&unk_1F0049D40 forKeyedSubscript:@"__gainMapMode"];
        v21[0] = @"inputImage";
        v21[1] = @"inputLightMap";
        v22[0] = v14;
        v22[1] = v12;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
        v18 = [[NUFilterNode alloc] initWithFilterName:@"NUHDRDivideGainMapFilter" settings:v16 inputs:v17];
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
    v10 = [(NUHDRGainMapDivideNode *)self inputNode];
    v19 = [v10 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v19;
}

- (id)lightMapNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:@"inputLightMap"];

  return v3;
}

- (id)inputNode
{
  v2 = [(NURenderNode *)self inputs];
  v3 = [v2 objectForKeyedSubscript:@"inputImage"];

  return v3;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 evaluationMode] == 1 && objc_msgSend(v3, "auxiliaryImageType") == 7;

  return v4;
}

- (NUHDRGainMapDivideNode)initWithInput:(id)a3 lightMap:(id)a4 settings:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v15 = NUAssertLogger_9740();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_9740();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v35 = v22;
        __int16 v36 = 2114;
        v37 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapDivideNode initWithInput:lightMap:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 750, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"input != nil");
  }
  v11 = v10;
  v32[0] = @"inputLightMap";
  v32[1] = @"inputImage";
  v33[0] = v9;
  v33[1] = v8;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  v31.receiver = self;
  v31.super_class = (Class)NUHDRGainMapDivideNode;
  v13 = [(NURenderNode *)&v31 initWithSettings:v11 inputs:v12];

  return v13;
}

- (NUHDRGainMapDivideNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_311);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
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
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v17 = (void *)MEMORY[0x1E4F29060];
    v18 = v16;
    BOOL v19 = [v17 callStackSymbols];
    v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v23 = (void *)MEMORY[0x1E4F29060];
  id v24 = specific;
  v18 = v21;
  v25 = [v23 callStackSymbols];
  v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  __int16 v35 = 2114;
  __int16 v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapDivideNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 746, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end