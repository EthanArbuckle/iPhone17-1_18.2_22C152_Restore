@interface NURenderTagNode
+ (BOOL)validateName:(id)a3 error:(id *)a4;
- (NSString)name;
- (NURenderNode)input;
- (NURenderTagNode)initWithInput:(id)a3 name:(id)a4;
- (NURenderTagNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_descriptionWithOffset:(int64_t)a3 showInputs:(BOOL)a4 map:(id)a5;
- (id)_evaluateGeometrySpaceMap:(id *)a3;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)aliasDescription;
- (id)descriptionSubClassHook;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (void)setInput:(id)a3;
@end

@implementation NURenderTagNode

- (void).cxx_destruct
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (id)aliasDescription
{
  return self->_name;
}

- (id)descriptionSubClassHook
{
  return (id)[NSString stringWithFormat:@"tagName:'%@'", self->_name];
}

- (id)_descriptionWithOffset:(int64_t)a3 showInputs:(BOOL)a4 map:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = self;
  v11 = v10;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    id v12 = v11;
    v13 = [v12 name];
    [v9 addObject:v13];

    v14 = (NURenderTagNode *)v12;
    v11 = [(NURenderTagNode *)v14 input];

    v10 = v14;
  }
  v15 = (void *)MEMORY[0x1E4F28E78];
  v16 = [v9 componentsJoinedByString:@", "];
  v17 = [v15 stringWithFormat:@"TAGS: %@", v16];

  if (v5) {
    [(NURenderNode *)v10 _appendInputsWithOffset:a3 to:v17 map:v8];
  }

  return v17;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  v4 = [(NURenderTagNode *)self input];
  BOOL v5 = [v4 outputImageGeometry:a3];

  return v5;
}

- (id)_evaluateGeometrySpaceMap:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NURenderTagNode;
  v4 = [(NURenderNode *)&v6 _evaluateGeometrySpaceMap:a3];
  [v4 addTagNode:self];

  return v4;
}

- (id)_evaluateImage:(id *)a3
{
  v4 = [(NURenderTagNode *)self input];
  BOOL v5 = [v4 outputImage:a3];

  return v5;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v8 = *MEMORY[0x1E4F1E480];
  id v9 = a4;
  id v10 = a3;
  v11 = [(NURenderNode *)self inputForKey:v8];
  id v12 = [v11 nodeByReplayingAgainstCache:v10 pipelineState:v9 error:a5];

  return v12;
}

- (void)setInput:(id)a3
{
}

- (NURenderNode)input
{
  return (NURenderNode *)[(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
}

- (NURenderTagNode)initWithInput:(id)a3 name:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v15 = NUAssertLogger_18654();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v18 = NUAssertLogger_18654();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v32 = [v30 callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v29;
        __int16 v54 = 2114;
        v55 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagNode initWithInput:name:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagNode.m", 24, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"input != nil");
  }
  uint64_t v8 = v7;
  if (!v7)
  {
    v22 = NUAssertLogger_18654();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "name != nil");
      *(_DWORD *)buf = 138543362;
      v53 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v25 = NUAssertLogger_18654();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        v41 = [v39 callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v53 = v38;
        __int16 v54 = 2114;
        v55 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v53 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTagNode initWithInput:name:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagNode.m", 25, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"name != nil");
  }
  v50 = @"name";
  id v51 = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  uint64_t v48 = *MEMORY[0x1E4F1E480];
  id v49 = v6;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v47.receiver = self;
  v47.super_class = (Class)NURenderTagNode;
  v11 = [(NURenderNode *)&v47 initWithSettings:v9 inputs:v10];

  uint64_t v12 = [v8 copy];
  name = v11->_name;
  v11->_name = (NSString *)v12;

  return v11;
}

- (NURenderTagNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18676);
  }
  uint64_t v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSString;
    id v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v13 = NSStringFromSelector(a2);
    v14 = [v9 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v12, v13];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v14;
    _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_18676);
      }
      goto LABEL_8;
    }
    if (v15 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_18676);
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
    uint64_t v34 = v20;
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
  BOOL v26 = [v25 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v34 = specific;
  __int16 v35 = 2114;
  uint64_t v36 = v26;
  _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderTagNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagNode.m", 18, @"Initializer not available: -[%@ %@], use designated initializer instead.", v29, v30, v31, v32, v28);
}

+ (BOOL)validateName:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = NUAssertLogger_18654();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tagName != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v10;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v12 = NUAssertLogger_18654();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        BOOL v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v23;
        __int16 v43 = 2114;
        uint64_t v44 = v27;
        _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v15;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTagNode validateName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagNode.m", 45, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"tagName != nil");
  }
  if (!a4)
  {
    v16 = NUAssertLogger_18654();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v42 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v19 = NUAssertLogger_18654();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        __int16 v35 = [v33 callStackSymbols];
        uint64_t v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v32;
        __int16 v43 = 2114;
        uint64_t v44 = v36;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTagNode validateName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderTagNode.m", 46, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  if (([v5 isEqualToString:@"."] & 1) != 0
    || ([v6 isEqualToString:@".."] & 1) != 0
    || ([v6 containsString:@"/"] & 1) != 0
    || [v6 isEqualToString:&stru_1F0017700])
  {
    +[NUError mismatchError:@"invalid tag : cannot be empty, exactly '.' or '..' or contain '/' characters " object:v6];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

@end