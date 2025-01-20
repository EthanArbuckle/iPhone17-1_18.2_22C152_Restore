@interface NUHDRToneMapNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUHDRToneMapNode)initWithInput:(id)a3 contentHeadroom:(double)a4 displayHeadroom:(double)a5;
- (NUHDRToneMapNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
@end

@implementation NUHDRToneMapNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(NURenderNode *)self inputs];
  uint64_t v11 = *MEMORY[0x1E4F1E480];
  v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  v13 = [v12 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  if (v13)
  {
    if ([v9 auxiliaryImageType] == 1)
    {
      v14 = [v12 imageProperties:a5];
      v15 = v14;
      if (v14)
      {
        if ([v14 isHDR])
        {
          v29 = v15;
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v17 = [(NURenderNode *)self settings];
          v18 = [v17 objectForKeyedSubscript:@"contentHeadroom"];
          [v16 setObject:v18 forKeyedSubscript:@"inputSourceHeadroom"];

          v19 = [(NURenderNode *)self settings];
          v20 = [v19 objectForKeyedSubscript:@"displayHeadroom"];
          v21 = v16;
          v15 = v29;
          [v21 setObject:v20 forKeyedSubscript:@"inputTargetHeadroom"];

          v22 = [v29 colorSpace];
          [v21 setObject:v22 forKeyedSubscript:@"inputColorSpace"];

          v23 = [NUFilterNode alloc];
          uint64_t v30 = v11;
          v31[0] = v13;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
          v25 = [(NUFilterNode *)v23 initWithFilterName:@"NUHDRApplyToneMapFilter" settings:v21 inputs:v24];

          v26 = [(NURenderNode *)v25 inputs];
          id v27 = [(NURenderNode *)v25 resolvedNodeWithCachedInputs:v26 cache:v8 pipelineState:v9 error:a5];
        }
        else
        {
          id v27 = v13;
        }
      }
      else
      {
        id v27 = 0;
      }
    }
    else
    {
      id v27 = v13;
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return [a3 auxiliaryImageType] == 1;
}

- (NUHDRToneMapNode)initWithSettings:(id)a3 inputs:(id)a4
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
    uint64_t v11 = (objc_class *)objc_opt_class();
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
    id v16 = (void *)_NUAssertLogger;
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
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  id v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHDRToneMapNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 312, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

- (NUHDRToneMapNode)initWithInput:(id)a3 contentHeadroom:(double)a4 displayHeadroom:(double)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    id v16 = NUAssertLogger_9740();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
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
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v40 = [v38 callStackSymbols];
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
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDRToneMapNode initWithInput:contentHeadroom:displayHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 299, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"input != nil");
  }
  if (a4 < 0.0)
  {
    v23 = NUAssertLogger_9740();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contentHeadroom >= 0.0");
      *(_DWORD *)buf = 138543362;
      v70 = v24;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
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
    _NUAssertFailHandler((uint64_t)"-[NUHDRToneMapNode initWithInput:contentHeadroom:displayHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 300, @"Invalid parameter not satisfying: %s", v51, v52, v53, v54, (uint64_t)"contentHeadroom >= 0.0");
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
    _NUAssertFailHandler((uint64_t)"-[NUHDRToneMapNode initWithInput:contentHeadroom:displayHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 301, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"displayHeadroom >= 1.0");
  }
  id v9 = v8;
  v67[0] = @"contentHeadroom";
  v10 = [NSNumber numberWithDouble:a4];
  v67[1] = @"displayHeadroom";
  v68[0] = v10;
  uint64_t v11 = [NSNumber numberWithDouble:a5];
  v68[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
  uint64_t v65 = *MEMORY[0x1E4F1E480];
  v66 = v9;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  v64.receiver = self;
  v64.super_class = (Class)NUHDRToneMapNode;
  v14 = [(NURenderNode *)&v64 initWithSettings:v12 inputs:v13];

  return v14;
}

@end