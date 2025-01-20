@interface NURAWGainMapNode
- (NURAWGainMapNode)initWithFilter:(id)a3 settings:(id)a4 inputs:(id)a5;
- (NURAWGainMapNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5;
- (NURAWGainMapNode)initWithInput:(id)a3 gainMapVersion:(id)a4 gainMapParameters:(id)a5;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation NURAWGainMapNode

- (id)_evaluateImageGeometry:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NURAWGainMapNode;
  v4 = [(NUFilterNode *)&v12 _evaluateImageGeometry:a3];
  if (v4)
  {
    if ([(NURenderNode *)self isCached]
      || (uint64_t v5 = [v4 renderScale], NUScaleCompare(v5, v6, 1, 2) <= 0))
    {
      v8 = v4;
    }
    else
    {
      v7 = [NUImageGeometry alloc];
      [v4 extent];
      v8 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v7, "initWithExtent:renderScale:orientation:", &v11, 1, 2, [v4 orientation]);
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NURAWGainMapNode;
  uint64_t v6 = [(NUFilterNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];

  return v6;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  if ([v8 auxiliaryImageType] == 7)
  {
    v10 = (void *)[v8 copy];
    [v10 setAuxiliaryImageType:1];
    v14.receiver = self;
    v14.super_class = (Class)NURAWGainMapNode;
    uint64_t v11 = [(NUFilterNode *)&v14 nodeByReplayingAgainstCache:v9 pipelineState:v10 error:a5];
  }
  else
  {
    objc_super v12 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
    uint64_t v11 = [v12 nodeByReplayingAgainstCache:v9 pipelineState:v8 error:a5];
  }

  return v11;
}

- (NURAWGainMapNode)initWithFilter:(id)a3 settings:(id)a4 inputs:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
  }
  uint64_t v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    objc_super v12 = NSString;
    v13 = v11;
    objc_super v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    v17 = [v12 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v15, v16];
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
      }
      goto LABEL_8;
    }
    if (v18 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x1E4F29060];
    v21 = v19;
    v22 = [v20 callStackSymbols];
    v23 = [v22 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E4F29060];
  id v27 = specific;
  v21 = v24;
  v28 = [v26 callStackSymbols];
  v29 = [v28 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  __int16 v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  uint64_t v31 = NSStringFromClass(v30);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURAWGainMapNode initWithFilter:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1204, @"Initializer not available: -[%@ %@], use designated initializer instead.", v32, v33, v34, v35, v31);
}

- (NURAWGainMapNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
  }
  uint64_t v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    objc_super v12 = NSString;
    v13 = v11;
    objc_super v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    v17 = [v12 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v15, v16];
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
      }
      goto LABEL_8;
    }
    if (v18 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x1E4F29060];
    v21 = v19;
    v22 = [v20 callStackSymbols];
    v23 = [v22 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E4F29060];
  id v27 = specific;
  v21 = v24;
  v28 = [v26 callStackSymbols];
  v29 = [v28 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  __int16 v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  uint64_t v31 = NSStringFromClass(v30);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURAWGainMapNode initWithFilterName:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1199, @"Initializer not available: -[%@ %@], use designated initializer instead.", v32, v33, v34, v35, v31);
}

- (NURAWGainMapNode)initWithInput:(id)a3 gainMapVersion:(id)a4 gainMapParameters:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v17 = NUAssertLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "node != nil");
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v20 = NUAssertLogger();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        id v27 = [v25 callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v24;
        __int16 v38 = 2114;
        v39 = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURAWGainMapNode initWithInput:gainMapVersion:gainMapParameters:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1186, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"node != nil");
  }
  uint64_t v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v9 isEqualToString:@"GM1"])
  {
    v13 = [v11 firstObject];
    [v12 setObject:v13 forKeyedSubscript:@"inputGain"];
  }
  uint64_t v34 = *MEMORY[0x1E4F1E480];
  id v35 = v8;
  objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v33.receiver = self;
  v33.super_class = (Class)NURAWGainMapNode;
  v15 = [(NUFilterNode *)&v33 initWithFilterName:@"NURAWGainMapFilter" settings:v12 inputs:v14];

  return v15;
}

@end