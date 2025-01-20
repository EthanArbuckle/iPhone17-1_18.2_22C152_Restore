@interface NUHDRGainMapNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUHDRGainMapNode)initWithInput:(id)a3 contentHeadroom:(double)a4 displayHeadroom:(double)a5;
- (NUHDRGainMapNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
@end

@implementation NUHDRGainMapNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(NURenderNode *)self inputs];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v12 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  if (v12)
  {
    if ([v9 auxiliaryImageType] == 1)
    {
      v13 = [v11 imageProperties:a5];
      v14 = v13;
      if (v13)
      {
        if ([v13 hasGainMap] && (objc_msgSend(v14, "gainMapHeadroom"), v15 > 1.0))
        {
          v16 = (void *)[v9 copy];
          [v16 setAuxiliaryImageType:7];
          id v43 = 0;
          uint64_t v17 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v16 error:&v43];
          id v18 = v43;
          v42 = (void *)v17;
          if (v17)
          {
            v19 = (objc_class *)MEMORY[0x1E4F1CA60];
            id v20 = v43;
            id v21 = objc_alloc_init(v19);
            [(NURenderNode *)self settings];
            v22 = v41 = v16;
            [v22 objectForKeyedSubscript:@"displayHeadroom"];
            v23 = id v40 = v18;
            [v23 doubleValue];
            double v25 = v24;

            v26 = [(NURenderNode *)self settings];
            v27 = [v26 objectForKeyedSubscript:@"contentHeadroom"];
            [v27 doubleValue];
            double v29 = v28;

            v30 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(v29, v25));
            [v21 setObject:v30 forKeyedSubscript:@"inputHeadroom"];

            v31 = [v14 flexRangeProperties];
            [v21 setObject:v31 forKeyedSubscript:@"flexRangeProperties"];

            v32 = [v14 flexRangeProperties];
            v33 = [v32 alternateColorSpace];
            [v21 setObject:v33 forKeyedSubscript:@"inputColorSpace"];

            v34 = [NUFilterNode alloc];
            v44[0] = @"inputImage";
            v44[1] = @"inputGainMap";
            v45[0] = v12;
            v45[1] = v42;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
            v36 = [(NUFilterNode *)v34 initWithFilterName:@"NUHDRApplyGainMapFilter" settings:v21 inputs:v35];

            v37 = [(NURenderNode *)v36 inputs];
            id v38 = [(NURenderNode *)v36 resolvedNodeWithCachedInputs:v37 cache:v8 pipelineState:v9 error:a5];

            id v18 = v40;
            v16 = v41;
          }
          else
          {
            +[NUError errorWithCode:1 reason:@"Failed to evaluate gain map image" object:v11 underlyingError:v43];
            id v38 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          id v38 = v12;
        }
      }
      else
      {
        id v38 = 0;
      }
    }
    else
    {
      id v38 = v12;
    }
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return [a3 auxiliaryImageType] == 1;
}

- (NUHDRGainMapNode)initWithSettings:(id)a3 inputs:(id)a4
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
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    id v18 = v16;
    v19 = [v17 callStackSymbols];
    id v20 = [v19 componentsJoinedByString:@"\n"];
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
  id v18 = v21;
  double v25 = [v23 callStackSymbols];
  v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 59, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (NUHDRGainMapNode)initWithInput:(id)a3 contentHeadroom:(double)a4 displayHeadroom:(double)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v16 = NUAssertLogger_9740();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v70 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v19 = NUAssertLogger_9740();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        id v40 = [v38 callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v37;
        __int16 v71 = 2114;
        v72 = v41;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapNode initWithInput:contentHeadroom:displayHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 46, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"input != nil");
  }
  if (a4 < 1.0)
  {
    v23 = NUAssertLogger_9740();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contentHeadroom >= 1.0");
      *(_DWORD *)buf = 138543362;
      v70 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v26 = NUAssertLogger_9740();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        v49 = [v47 callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v46;
        __int16 v71 = 2114;
        v72 = v50;
        _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v29;
      _os_log_error_impl(&dword_1A9892000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapNode initWithInput:contentHeadroom:displayHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 47, @"Invalid parameter not satisfying: %s", v51, v52, v53, v54, (uint64_t)"contentHeadroom >= 1.0");
  }
  if (a5 < 1.0)
  {
    uint64_t v30 = NUAssertLogger_9740();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "displayHeadroom >= 1.0");
      *(_DWORD *)buf = 138543362;
      v70 = v31;
      _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v33 = NUAssertLogger_9740();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v55;
        __int16 v71 = 2114;
        v72 = v59;
        _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      __int16 v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v36;
      _os_log_error_impl(&dword_1A9892000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRGainMapNode initWithInput:contentHeadroom:displayHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 48, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"displayHeadroom >= 1.0");
  }
  id v9 = v8;
  v67[0] = @"contentHeadroom";
  v10 = [NSNumber numberWithDouble:a4];
  v67[1] = @"displayHeadroom";
  v68[0] = v10;
  v11 = [NSNumber numberWithDouble:a5];
  v68[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
  uint64_t v65 = *MEMORY[0x1E4F1E480];
  v66 = v9;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  v64.receiver = self;
  v64.super_class = (Class)NUHDRGainMapNode;
  v14 = [(NURenderNode *)&v64 initWithSettings:v12 inputs:v13];

  return v14;
}

@end