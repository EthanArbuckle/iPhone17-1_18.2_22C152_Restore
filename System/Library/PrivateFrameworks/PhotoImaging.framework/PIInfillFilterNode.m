@interface PIInfillFilterNode
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (PIInfillFilterNode)initWithInputImage:(id)a3 inputMatte:(id)a4 infillAlgorithm:(int64_t)a5;
- (PIInfillFilterNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)inputImage;
- (id)inputMatteImage;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)infillAlgorithm;
@end

@implementation PIInfillFilterNode

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PIInfillFilterNode;
  v6 = [(NURenderNode *)&v8 resolvedNodeWithCachedInputs:a3 settings:a4 pipelineState:a5 error:a6];
  return v6;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v17 = NUAssertLogger_5469();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v33 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v21 = NUAssertLogger_5469();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        __int16 v34 = 2114;
        v35 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = objc_alloc_init(PISegmentationInfillFilter);
  [(PISegmentationInfillFilter *)v5 setInfillAlgorithm:[(PIInfillFilterNode *)self infillAlgorithm]];
  v6 = [(PIInfillFilterNode *)self inputImage];
  id v31 = 0;
  v7 = [v6 outputImage:&v31];
  id v8 = v31;

  if (v7)
  {
    [(PISegmentationInfillFilter *)v5 setInputImage:v7];
    v9 = [(PIInfillFilterNode *)self inputMatteImage];
    id v30 = 0;
    v10 = [v9 outputImage:&v30];
    id v11 = v30;

    if (v10)
    {
      [(PISegmentationInfillFilter *)v5 setInputMatteImage:v10];
      v12 = [(PISegmentationInfillFilter *)v5 outputImage];
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F7A438];
      v15 = [(PIInfillFilterNode *)self inputMatteImage];
      *a3 = [v14 errorWithCode:2 reason:@"Cannot evaluate input matte" object:v15 underlyingError:v11];

      v12 = 0;
    }
    id v8 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F7A438];
    v10 = [(PIInfillFilterNode *)self inputImage];
    [v13 errorWithCode:2 reason:@"Cannot evaluate input" object:v10 underlyingError:v8];
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (int64_t)infillAlgorithm
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"infillAlgorithm"];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (id)inputMatteImage
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderNode *)self inputForKey:@"inputMatteImage"];
  if (!v2)
  {
    int64_t v4 = NUAssertLogger_5469();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Missing input matte image"];
      int v17 = 138543362;
      v18 = v5;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    v6 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v8 = NUAssertLogger_5469();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific(*v6);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        int v17 = 138543618;
        v18 = v12;
        __int16 v19 = 2114;
        v20 = v16;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v11 = [v10 componentsJoinedByString:@"\n"];
      int v17 = 138543362;
      v18 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v17, 0xCu);
    }
    _NUAssertFailHandler();
  }
  return v2;
}

- (id)inputImage
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderNode *)self inputForKey:@"inputImage"];
  if (!v2)
  {
    int64_t v4 = NUAssertLogger_5469();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Missing input image"];
      int v17 = 138543362;
      v18 = v5;
      _os_log_error_impl(&dword_1A9680000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    v6 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v8 = NUAssertLogger_5469();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific(*v6);
        v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        v15 = [v13 callStackSymbols];
        v16 = [v15 componentsJoinedByString:@"\n"];
        int v17 = 138543618;
        v18 = v12;
        __int16 v19 = 2114;
        v20 = v16;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v11 = [v10 componentsJoinedByString:@"\n"];
      int v17 = 138543362;
      v18 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v17, 0xCu);
    }
    _NUAssertFailHandler();
  }
  return v2;
}

- (PIInfillFilterNode)initWithInputImage:(id)a3 inputMatte:(id)a4 infillAlgorithm:(int64_t)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = NUAssertLogger_5469();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil");
      int v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_5469();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v29 = dispatch_get_specific(*v18);
        id v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        v18 = [v30 callStackSymbols];
        v32 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = (const void **)v29;
        __int16 v43 = 2114;
        v44 = v32;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      BOOL v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v18;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v26 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  v10 = v9;
  if (!v9)
  {
    v23 = NUAssertLogger_5469();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputMatte != nil");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v18 = (const void **)MEMORY[0x1E4F7A308];
    v25 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v20 = NUAssertLogger_5469();
    int v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        id v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v42 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v26)
    {
      v33 = dispatch_get_specific(*v18);
      __int16 v34 = (void *)MEMORY[0x1E4F29060];
      id v35 = v33;
      uint64_t v36 = [v34 callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v42 = (const void **)v33;
      __int16 v43 = 2114;
      v44 = v37;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  v39[0] = @"infillAlgorithm";
  id v11 = [NSNumber numberWithInteger:a5];
  v39[1] = @"__dominantInputSettingsKey";
  v40[0] = v11;
  v40[1] = @"inputImage";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v13 setObject:v8 forKeyedSubscript:@"inputImage"];
  [v13 setObject:v10 forKeyedSubscript:@"inputMatteImage"];
  v38.receiver = self;
  v38.super_class = (Class)PIInfillFilterNode;
  id v14 = [(NURenderNode *)&v38 initWithSettings:v12 inputs:v13];

  return v14;
}

- (PIInfillFilterNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSString;
      v12 = v10;
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      v15 = NSStringFromSelector(a2);
      v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      id v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = (void *)MEMORY[0x1E4F29060];
          v20 = v18;
          BOOL v21 = [v19 callStackSymbols];
          BOOL v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      v20 = v23;
      id v27 = [v25 callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v31 = specific;
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
  }
}

@end