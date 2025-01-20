@interface NURawFilterNode
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NURawFilterNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5;
- (NURawFilterNode)initWithRawFilter:(id)a3 type:(int)a4 settings:(id)a5 input:(id)a6;
- (NURawFilterNode)initWithRawFilterName:(id)a3 type:(int)a4 settings:(id)a5 inputs:(id)a6;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int)rawFilterType;
@end

@implementation NURawFilterNode

- (int)rawFilterType
{
  return self->_rawFilterType;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  id v4 = a3;
  if ([v4 auxiliaryImageType] == 10)
  {
    unsigned __int8 v5 = (([(NURawFilterNode *)self rawFilterType] - 10) & 0xFFFFFFFB) != 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NURawFilterNode;
    unsigned __int8 v5 = [(NUFilterNode *)&v7 shouldCacheNodeForPipelineState:v4];
  }

  return v5;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v9.receiver = self;
  v9.super_class = (Class)NURawFilterNode;
  objc_super v7 = [(NUFilterNode *)&v9 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  if (v7) {
    v7[46] = self->_rawFilterType;
  }

  return v7;
}

- (NURawFilterNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_709);
  }
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = NSString;
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
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
  _NUAssertFailHandler((uint64_t)"-[NURawFilterNode initWithFilterName:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1065, @"Initializer not available: -[%@ %@], use designated initializer instead.", v32, v33, v34, v35, v31);
}

- (NURawFilterNode)initWithRawFilterName:(id)a3 type:(int)a4 settings:(id)a5 inputs:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)NURawFilterNode;
  result = [(NUFilterNode *)&v8 initWithFilterName:a3 settings:a5 inputs:a6];
  result->_rawFilterType = a4;
  return result;
}

- (NURawFilterNode)initWithRawFilter:(id)a3 type:(int)a4 settings:(id)a5 input:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    v28 = NUAssertLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "filter != nil");
      *(_DWORD *)buf = 138543362;
      v70 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v31 = NUAssertLogger();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v42;
        __int16 v71 = 2114;
        v72 = v46;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURawFilterNode initWithRawFilter:type:settings:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1038, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"filter != nil");
  }
  v13 = v12;
  if (!v12)
  {
    uint64_t v35 = NUAssertLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v70 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    __int16 v38 = NUAssertLogger();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v70 = v51;
        __int16 v71 = 2114;
        v72 = v55;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v70 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURawFilterNode initWithRawFilter:type:settings:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1039, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"input != nil");
  }
  v60 = self;
  unsigned int v61 = a4;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v15 = [v10 inputKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v63 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        v21 = [v10 valueForKey:v20];
        [v14 setObject:v21 forKeyedSubscript:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v17);
  }

  uint64_t v22 = *MEMORY[0x1E4F1E510];
  v23 = [v10 valueForKey:*MEMORY[0x1E4F1E510]];
  [v14 setObject:v23 forKeyedSubscript:v22];

  [v14 addEntriesFromDictionary:v11];
  v24 = [v10 name];
  uint64_t v66 = *MEMORY[0x1E4F1E480];
  v67 = v13;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
  v26 = [(NURawFilterNode *)v60 initWithRawFilterName:v24 type:v61 settings:v14 inputs:v25];

  return v26;
}

@end