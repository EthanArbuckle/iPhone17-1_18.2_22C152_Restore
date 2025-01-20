@interface NUHDROpticalScaleNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUHDROpticalScaleNode)initWithInput:(id)a3 opticalScale:(double)a4;
- (NUHDROpticalScaleNode)initWithSettings:(id)a3 inputs:(id)a4;
- (double)opticalScale;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
@end

@implementation NUHDROpticalScaleNode

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
        if (([v14 isHDR] & 1) != 0 && (objc_msgSend(v15, "contentHeadroom"), v16 > 1.0))
        {
          double v17 = v16;
          [(NUHDROpticalScaleNode *)self opticalScale];
          double v19 = 1.0;
          if (v18 <= 1.0)
          {
            if (v18 < 1.0) {
              double v19 = fmax(v18 * v17, 1.0);
            }
          }
          else
          {
            double v19 = fmin(v18 / v17, 1.0);
          }
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v22 = [MEMORY[0x1E4F1E080] vectorWithX:v19 Y:0.0 Z:0.0];
          [v21 setObject:v22 forKeyedSubscript:@"inputRVector"];

          v23 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:v19 Z:0.0];
          [v21 setObject:v23 forKeyedSubscript:@"inputGVector"];

          v24 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:v19];
          [v21 setObject:v24 forKeyedSubscript:@"inputBVector"];

          v25 = [NUFilterNode alloc];
          uint64_t v30 = v11;
          v31[0] = v13;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
          v27 = [(NUFilterNode *)v25 initWithFilterName:@"CIColorMatrix" settings:v21 inputs:v26];

          v28 = [(NURenderNode *)v27 inputs];
          id v20 = [(NURenderNode *)v27 resolvedNodeWithCachedInputs:v28 cache:v8 pipelineState:v9 error:a5];
        }
        else
        {
          id v20 = v13;
        }
      }
      else
      {
        id v20 = 0;
      }
    }
    else
    {
      id v20 = v13;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return [a3 auxiliaryImageType] == 1;
}

- (double)opticalScale
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"opticalScale"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (NUHDROpticalScaleNode)initWithInput:(id)a3 opticalScale:(double)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v13 = NUAssertLogger_9740();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v51 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    float v16 = NUAssertLogger_9740();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v27;
        __int16 v52 = 2114;
        v53 = v31;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      double v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDROpticalScaleNode initWithInput:opticalScale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 413, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"input != nil");
  }
  if (a4 <= 0.0)
  {
    id v20 = NUAssertLogger_9740();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "opticalScale > 0.0");
      *(_DWORD *)buf = 138543362;
      v51 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v23 = NUAssertLogger_9740();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        __int16 v52 = 2114;
        v53 = v40;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v51 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUHDROpticalScaleNode initWithInput:opticalScale:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 414, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"opticalScale > 0.0");
  }
  v7 = v6;
  v48 = @"opticalScale";
  id v8 = [NSNumber numberWithDouble:a4];
  v49 = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  uint64_t v46 = *MEMORY[0x1E4F1E480];
  v47 = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  v45.receiver = self;
  v45.super_class = (Class)NUHDROpticalScaleNode;
  uint64_t v11 = [(NURenderNode *)&v45 initWithSettings:v9 inputs:v10];

  return v11;
}

- (NUHDROpticalScaleNode)initWithSettings:(id)a3 inputs:(id)a4
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
    uint64_t v34 = v14;
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
    float v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v17 = (void *)MEMORY[0x1E4F29060];
    double v18 = v16;
    double v19 = [v17 callStackSymbols];
    id v20 = [v19 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v20;
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
  double v18 = v21;
  v25 = [v23 callStackSymbols];
  v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUHDROpticalScaleNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUHDRGainMapNode.m", 409, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end