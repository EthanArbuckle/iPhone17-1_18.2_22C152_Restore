@interface NUStyleTransferInterpolationNode
- (NUStyleTransferInterpolationNode)initWithInputs:(id)a3 weights:(id)a4 settings:(id)a5;
- (NUStyleTransferInterpolationNode)initWithSettings:(id)a3 inputs:(id)a4;
- (float)interpolationWeightAtIndex:(unint64_t)a3;
- (id)_evaluateImage:(id *)a3;
- (id)configuration;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)styleInputAtIndex:(unint64_t)a3;
- (id)targetColorSpace;
- (id)tuningParameters;
- (unint64_t)inputCount;
@end

@implementation NUStyleTransferInterpolationNode

- (id)_evaluateImage:(id *)a3
{
  unint64_t v5 = [(NUStyleTransferInterpolationNode *)self inputCount];
  if (v5)
  {
    unint64_t v6 = v5;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
    id v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      v11 = v9;
      v12 = [(NUStyleTransferInterpolationNode *)self styleInputAtIndex:v10];
      id v19 = 0;
      v13 = [v12 outputImage:&v19];
      id v9 = v19;

      if (!v13) {
        break;
      }
      [v7 addObject:v13];
      [(NUStyleTransferInterpolationNode *)self interpolationWeightAtIndex:v10];
      v14 = objc_msgSend(NSNumber, "numberWithFloat:");
      [v8 addObject:v14];

      if (v6 == ++v10)
      {
        id v15 = +[_NUStyleTransferInterpolateProcessor interpolateStyles:v7 weights:v8 error:a3];
        goto LABEL_8;
      }
    }
    v17 = [NSNumber numberWithUnsignedInteger:v10];
    *a3 = +[NUError errorWithCode:1 reason:@"Failed to evaluate style at index" object:v17 underlyingError:v9];

    v16 = 0;
  }
  else
  {
    v7 = [(NUStyleTransferInterpolationNode *)self styleInputAtIndex:0];
    id v20 = 0;
    v8 = [v7 outputImage:&v20];
    id v9 = v20;
    if (v8)
    {
      id v15 = v8;
      v8 = v15;
LABEL_8:
      v16 = v15;
    }
    else
    {
      +[NUError errorWithCode:1 reason:@"Failed to evaluate style at index" object:&unk_1F004A208 underlyingError:v9];
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__28296;
  v21 = __Block_byref_object_dispose__28297;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__NUStyleTransferInterpolationNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke;
  v16[3] = &unk_1E5D95C88;
  v16[4] = &v17;
  [v10 enumerateKeysAndObjectsUsingBlock:v16];
  if (v18[5])
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", @"Invalid style input node");
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NUStyleTransferInterpolationNode;
    v13 = [(NUStyleTransferNode *)&v15 resolvedNodeWithCachedInputs:v10 settings:v11 pipelineState:v12 error:a6];
  }
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __94__NUStyleTransferInterpolationNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 auxiliaryImageType] != 1)
  {
    v24 = NUAssertLogger_27648();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [NSString stringWithFormat:@"%@ cannot be applied to aux images", objc_opt_class()];
      *(_DWORD *)buf = 138543362;
      v66 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_27648();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v38;
        __int16 v67 = 2114;
        v68 = v42;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v43 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1238, @"%@ cannot be applied to aux images", v44, v45, v46, v47, v43);
  }
  if ([v7 evaluationMode] == 2)
  {
    v31 = NUAssertLogger_27648();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = [NSString stringWithFormat:@"%@ cannot be evaluated for video", objc_opt_class()];
      *(_DWORD *)buf = 138543362;
      v66 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger_27648();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v48;
        __int16 v67 = 2114;
        v68 = v52;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    uint64_t v53 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1239, @"%@ cannot be evaluated for video", v54, v55, v56, v57, v53);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v9 = [(NURenderNode *)self inputs];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v11 = [(NURenderNode *)self inputs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v61;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v61 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void *)(*((void *)&v60 + 1) + 8 * v15);
      uint64_t v17 = [(NURenderNode *)self inputForKey:v16];
      if ([v17 isCached])
      {
        uint64_t v18 = [v17 evaluatedForMode];
        if (v18 != [v7 evaluationMode])
        {
          id v22 = +[NUError mismatchError:@"Wrong evaluation mode for cached input" object:v17];
LABEL_18:
          *a5 = v22;

          v21 = 0;
          goto LABEL_19;
        }
        [v10 setObject:v17 forKeyedSubscript:v16];
      }
      else
      {
        uint64_t v19 = [v17 nodeByReplayingAgainstCache:v6 pipelineState:v7 error:a5];
        if (!v19)
        {
          id v22 = +[NUError failureError:@"failed to evaluate input" object:v17];
          goto LABEL_18;
        }
        id v20 = (void *)v19;
        [v10 setObject:v19 forKeyedSubscript:v16];
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v64 count:16];
        if (v13) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  v21 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v10 cache:v6 pipelineState:v7 error:a5];
LABEL_19:

  return v21;
}

- (id)targetColorSpace
{
  v2 = [(NUStyleTransferInterpolationNode *)self styleInputAtIndex:0];
  v3 = [v2 targetColorSpace];

  return v3;
}

- (id)configuration
{
  v2 = [(NUStyleTransferInterpolationNode *)self styleInputAtIndex:0];
  v3 = [v2 configuration];

  return v3;
}

- (id)tuningParameters
{
  v2 = [(NUStyleTransferInterpolationNode *)self styleInputAtIndex:0];
  v3 = [v2 tuningParameters];

  return v3;
}

- (unint64_t)inputCount
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"count"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (float)interpolationWeightAtIndex:(unint64_t)a3
{
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"weight#%lu", a3);
  unint64_t v5 = [(NURenderNode *)self settings];
  id v6 = [v5 objectForKeyedSubscript:v4];
  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (id)styleInputAtIndex:(unint64_t)a3
{
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"input#%lu", a3);
  unint64_t v5 = [(NURenderNode *)self inputForKey:v4];

  return v5;
}

- (NUStyleTransferInterpolationNode)initWithInputs:(id)a3 weights:(id)a4 settings:(id)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 count])
  {
    uint64_t v43 = NUAssertLogger_27648();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs.count >= 1");
      *(_DWORD *)buf = 138543362;
      v80 = v44;
      _os_log_error_impl(&dword_1A9892000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v46 = NUAssertLogger_27648();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        uint64_t v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        long long v60 = [v58 callStackSymbols];
        long long v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v57;
        __int16 v81 = 2114;
        v82 = v61;
        _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v47)
    {
      v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v49;
      _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithInputs:weights:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1188, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"inputs.count >= 1");
  }
  uint64_t v11 = [v8 count];
  if (v11 != [v9 count])
  {
    id v50 = NUAssertLogger_27648();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs.count == weights.count");
      *(_DWORD *)buf = 138543362;
      v80 = v51;
      _os_log_error_impl(&dword_1A9892000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v53 = NUAssertLogger_27648();
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (v52)
    {
      if (v54)
      {
        v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v67 = (void *)MEMORY[0x1E4F29060];
        id v68 = v66;
        uint64_t v69 = [v67 callStackSymbols];
        v70 = [v69 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v80 = v66;
        __int16 v81 = 2114;
        v82 = v70;
        _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v54)
    {
      uint64_t v55 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v56 = [v55 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v80 = v56;
      _os_log_error_impl(&dword_1A9892000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithInputs:weights:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1189, @"Invalid parameter not satisfying: %s", v71, v72, v73, v74, (uint64_t)"inputs.count == weights.count");
  }
  v76 = self;
  uint64_t v12 = [v8 count];
  v77 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v12)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"input#%lu", i);
      uint64_t v16 = [v8 objectAtIndexedSubscript:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v27 = NUAssertLogger_27648();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          BOOL v28 = [NSString stringWithFormat:@"Invalid Style Transfer Interpolation input node"];
          *(_DWORD *)buf = 138543362;
          v80 = v28;
          _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = NUAssertLogger_27648();
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        if (v29)
        {
          if (v31)
          {
            v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            BOOL v35 = (void *)MEMORY[0x1E4F29060];
            id v36 = v34;
            v37 = [v35 callStackSymbols];
            v38 = [v37 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v80 = v34;
            __int16 v81 = 2114;
            v82 = v38;
            _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v31)
        {
          v32 = [MEMORY[0x1E4F29060] callStackSymbols];
          v33 = [v32 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v80 = v33;
          _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithInputs:weights:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1196, @"Invalid Style Transfer Interpolation input node", v39, v40, v41, v42, v75);
      }
      uint64_t v18 = [v8 objectAtIndexedSubscript:i];
      [v77 setObject:v18 forKeyedSubscript:v15];

      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"weight#%lu", i);
      id v20 = NSNumber;
      [v9 objectAtIndexedSubscript:i];
      id v22 = v21 = v9;
      [v22 floatValue];
      v23 = objc_msgSend(v20, "numberWithFloat:");
      [v13 setObject:v23 forKeyedSubscript:v19];

      id v9 = v21;
    }
  }
  if (v10) {
    [v13 addEntriesFromDictionary:v10];
  }
  v24 = [NSNumber numberWithUnsignedInteger:v12];
  [v13 setObject:v24 forKeyedSubscript:@"count"];

  v78.receiver = v76;
  v78.super_class = (Class)NUStyleTransferInterpolationNode;
  v25 = [(NURenderNode *)&v78 initWithSettings:v13 inputs:v77];

  return v25;
}

- (NUStyleTransferInterpolationNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
  }
  id v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    uint64_t v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_27665);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F29060];
    uint64_t v18 = v16;
    uint64_t v19 = [v17 callStackSymbols];
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
  uint64_t v18 = v21;
  v25 = [v23 callStackSymbols];
  v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  __int16 v35 = 2114;
  id v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUStyleTransferInterpolationNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1184, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

@end