@interface NUSourceOrientationNode
+ (int64_t)originalOrientationToApplyToSource:(id)a3 skipOrientation:(BOOL)a4 error:(id *)a5;
- (BOOL)skipOrientation;
- (NUSourceOrientationNode)initWithInput:(id)a3 source:(id)a4 settings:(id)a5 orientation:(int64_t)a6;
- (NUSourceOrientationNode)initWithOrientation:(int64_t)a3 input:(id)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
@end

@implementation NUSourceOrientationNode

- (BOOL)skipOrientation
{
  return self->_skipOrientation;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v25 = NUAssertLogger_7355();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v59 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_7355();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        v35 = [v33 callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v59 = v32;
        __int16 v60 = 2114;
        v61 = v36;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v59 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceOrientationNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 1075, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != nil");
  }
  v10 = v9;
  v11 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  v12 = [v11 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];
  if (v12)
  {
    BOOL v13 = [(NUOrientationNode *)self shouldCacheNodeForPipelineState:v10];
    id v14 = v12;
    id v15 = v14;
    if (v13)
    {
      v16 = [v14 inputs];
      uint64_t v17 = [v16 count];

      v18 = v15;
      if (v17)
      {
        v19 = v15;
        do
        {
          v18 = [v19 uniqueInputNode];

          v20 = [v18 inputs];
          uint64_t v21 = [v20 count];

          v19 = v18;
        }
        while (v21);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v41 = NUAssertLogger_7355();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = [NSString stringWithFormat:@"Expected a source node"];
          *(_DWORD *)buf = 138543362;
          v59 = v42;
          _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = NUAssertLogger_7355();
        BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
        if (v43)
        {
          if (v45)
          {
            v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v49 = (void *)MEMORY[0x1E4F29060];
            id v50 = v48;
            v51 = [v49 callStackSymbols];
            v52 = [v51 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v59 = v48;
            __int16 v60 = 2114;
            v61 = v52;
            _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v45)
        {
          v46 = [MEMORY[0x1E4F29060] callStackSymbols];
          v47 = [v46 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v59 = v47;
          _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler((uint64_t)"-[NUSourceOrientationNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 1096, @"Expected a source node", v53, v54, v55, v56, v57);
      }
      int64_t v22 = +[NUSourceOrientationNode originalOrientationToApplyToSource:v18 skipOrientation:self->_skipOrientation error:a5];
      if (v22)
      {
        if (v22 == 1)
        {
          id v15 = v15;
        }
        else
        {
          v23 = [[NUOrientationNode alloc] initWithOrientation:v22 input:v15];
          -[NURenderNode setEvaluatedForMode:](v23, "setEvaluatedForMode:", [v10 evaluationMode]);
          id v15 = +[NURenderNode nodeFromCache:v23 cache:v8];
        }
      }
      else
      {
        id v15 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (NUSourceOrientationNode)initWithInput:(id)a3 source:(id)a4 settings:(id)a5 orientation:(int64_t)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v18 = NUAssertLogger_7355();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v68 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v21 = NUAssertLogger_7355();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v39;
        __int16 v69 = 2114;
        v70 = v43;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceOrientationNode initWithInput:source:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 1024, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"input != nil");
  }
  if (!v11)
  {
    v25 = NUAssertLogger_7355();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "source != nil");
      *(_DWORD *)buf = 138543362;
      v68 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v28 = NUAssertLogger_7355();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v48;
        __int16 v69 = 2114;
        v70 = v52;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceOrientationNode initWithInput:source:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 1025, @"Invalid parameter not satisfying: %s", v53, v54, v55, v56, (uint64_t)"source != nil");
  }
  if ((unint64_t)(a6 - 1) >= 8)
  {
    v32 = NUAssertLogger_7355();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUOrientationIsValid(orientation)");
      *(_DWORD *)buf = 138543362;
      v68 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_7355();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        uint64_t v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E4F29060];
        id v59 = v57;
        __int16 v60 = [v58 callStackSymbols];
        v61 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v68 = v57;
        __int16 v69 = 2114;
        v70 = v61;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      uint64_t v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v68 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUSourceOrientationNode initWithInput:source:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 1026, @"Invalid parameter not satisfying: %s", v62, v63, v64, v65, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  BOOL v13 = v12;
  id v14 = [v12 objectForKeyedSubscript:@"skipOrientation"];
  char v15 = [v14 BOOLValue];

  v66.receiver = self;
  v66.super_class = (Class)NUSourceOrientationNode;
  v16 = [(NUOrientationNode *)&v66 initWithOrientation:a6 input:v10];
  v16->_skipOrientation = v15;

  return v16;
}

- (NUSourceOrientationNode)initWithOrientation:(int64_t)a3 input:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
  }
  v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v7 = NSString;
    id v8 = v6;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(a2);
    id v12 = [v7 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v10, v11];
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
      }
      goto LABEL_8;
    }
    if (v13 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_317);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    char v15 = (void *)MEMORY[0x1E4F29060];
    v16 = v14;
    uint64_t v17 = [v15 callStackSymbols];
    v18 = [v17 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v21 = (void *)MEMORY[0x1E4F29060];
  id v22 = specific;
  v16 = v19;
  v23 = [v21 callStackSymbols];
  v24 = [v23 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v32 = specific;
  __int16 v33 = 2114;
  id v34 = v24;
  _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUSourceOrientationNode initWithOrientation:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 1019, @"Initializer not available: -[%@ %@], use designated initializer instead.", v27, v28, v29, v30, v26);
}

+ (int64_t)originalOrientationToApplyToSource:(id)a3 skipOrientation:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a5)
  {
    v19 = NUAssertLogger_7355();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v36 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v22 = NUAssertLogger_7355();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v36 = v26;
        __int16 v37 = 2114;
        uint64_t v38 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v36 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUSourceOrientationNode originalOrientationToApplyToSource:skipOrientation:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 1040, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != nil");
  }
  id v8 = v7;
  if (v6) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [v7 sourceOrientation];
  }
  id v10 = [v8 originalNode];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 outputImageGeometry:a5];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = [v12 orientation];
      char v15 = [v8 sourceDerivation];
      uint64_t v9 = objc_msgSend(v15, "orientationFromOriginal:derivativeOrientation:", v14, objc_msgSend(v8, "sourceOrientation"));

      if (v6)
      {
        uint64_t v16 = 6;
        if (v14 != 8) {
          uint64_t v16 = v14;
        }
        if (v14 == 6) {
          uint64_t v17 = 8;
        }
        else {
          uint64_t v17 = v16;
        }
        uint64_t v9 = NUOrientationConcat(v9, v17);
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

@end