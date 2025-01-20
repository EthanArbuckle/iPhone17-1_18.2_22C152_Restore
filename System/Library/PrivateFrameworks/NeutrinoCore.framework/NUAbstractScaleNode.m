@interface NUAbstractScaleNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUAbstractScaleNode)initWithInput:(id)a3 settings:(id)a4;
- (NUAbstractScaleNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NURenderNode)inputNode;
@end

@implementation NUAbstractScaleNode

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (NURenderNode)inputNode
{
  v2 = [(NURenderNode *)self inputs];
  unint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  return (NURenderNode *)v3;
}

- (NUAbstractScaleNode)initWithInput:(id)a3 settings:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = NUAssertLogger_11920();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_11920();
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
    _NUAssertFailHandler((uint64_t)"-[NUAbstractScaleNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 29, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"input != nil");
  }
  v8 = v7;
  uint64_t v29 = *MEMORY[0x1E4F1E480];
  id v30 = v6;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v28.receiver = self;
  v28.super_class = (Class)NUAbstractScaleNode;
  v10 = [(NURenderNode *)&v28 initWithSettings:v8 inputs:v9];

  return v10;
}

- (NUAbstractScaleNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
  }
  v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v9 = NSString;
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11937);
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
  _NUAssertFailHandler((uint64_t)"-[NUAbstractScaleNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Scale.m", 24, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end