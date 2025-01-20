@interface PIInfillCompositeNode
+ (id)applyDeltaKernel;
+ (id)computeDeltaKernel;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (PIInfillCompositeNode)initWithInput:(id)a3 background:(id)a4 matte:(id)a5 settings:(id)a6;
- (PIInfillCompositeNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)backgroundNode;
- (id)inputNode;
- (id)matteNode;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
@end

@implementation PIInfillCompositeNode

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)PIInfillCompositeNode;
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
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v46 = NUAssertLogger_5469();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v66 = v47;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v48 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v50 = NUAssertLogger_5469();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v51)
      {
        v54 = dispatch_get_specific(*v48);
        v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        v57 = [v55 callStackSymbols];
        v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v54;
        __int16 v67 = 2114;
        v68 = v58;
        _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v51)
    {
      v52 = [MEMORY[0x1E4F29060] callStackSymbols];
      v53 = [v52 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v53;
      _os_log_error_impl(&dword_1A9680000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = [MEMORY[0x1E4F1E040] blendWithRedMaskFilter];
  v6 = [(PIInfillCompositeNode *)self inputNode];
  id v62 = 0;
  v7 = [v6 outputImage:&v62];
  id v8 = v62;

  if (v7)
  {
    [v5 setInputImage:v7];
    v9 = [(PIInfillCompositeNode *)self matteNode];
    id v61 = 0;
    v10 = [v9 outputImage:&v61];
    id v11 = v61;

    if (v10)
    {
      [v5 setMaskImage:v10];
      v12 = [(PIInfillCompositeNode *)self backgroundNode];
      id v60 = 0;
      v13 = [v12 outputImage:&v60];
      id v8 = v60;

      if (v13)
      {
        [v5 setBackgroundImage:v13];
        v14 = [(NURenderNode *)self settings];
        v15 = [v14 objectForKeyedSubscript:@"seamlessCompositing"];
        int v16 = [v15 BOOLValue];

        if (v16)
        {
          v17 = [(id)objc_opt_class() computeDeltaKernel];
          [v7 extent];
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          v64[0] = v7;
          v64[1] = v13;
          v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
          v59 = objc_msgSend(v17, "applyWithExtent:arguments:", v26, v19, v21, v23, v25);

          v27 = objc_alloc_init(PISegmentationInfillFilter);
          [(PISegmentationInfillFilter *)v27 setInfillAlgorithm:4];
          [(PISegmentationInfillFilter *)v27 setInputImage:v59];
          [(PISegmentationInfillFilter *)v27 setInputMatteImage:v10];
          v28 = [(PISegmentationInfillFilter *)v27 outputImage];
          v29 = [(id)objc_opt_class() applyDeltaKernel];
          [v7 extent];
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          double v37 = v36;
          v63[0] = v7;
          v63[1] = v28;
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
          v39 = objc_msgSend(v29, "applyWithExtent:arguments:", v38, v31, v33, v35, v37);

          [v5 setInputImage:v39];
        }
        v40 = [v5 outputImage];
      }
      else
      {
        v43 = (void *)MEMORY[0x1E4F7A438];
        v44 = [(PIInfillCompositeNode *)self backgroundNode];
        *a3 = [v43 errorWithCode:2 reason:@"Cannot evaluate background image" object:v44 underlyingError:v8];

        v13 = 0;
        v40 = 0;
      }
    }
    else
    {
      v42 = (void *)MEMORY[0x1E4F7A438];
      v13 = [(PIInfillCompositeNode *)self matteNode];
      [v42 errorWithCode:2 reason:@"Cannot evaluate input matte" object:v13 underlyingError:v11];
      v40 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v11;
    }
  }
  else
  {
    v41 = (void *)MEMORY[0x1E4F7A438];
    v10 = [(PIInfillCompositeNode *)self inputNode];
    [v41 errorWithCode:2 reason:@"Cannot evaluate input" object:v10 underlyingError:v8];
    v40 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v40;
}

- (id)matteNode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderNode *)self inputForKey:@"matte"];
  if (!v2)
  {
    v4 = NUAssertLogger_5469();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Missing matte node"];
      int v17 = 138543362;
      double v18 = v5;
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
        int v16 = [v15 componentsJoinedByString:@"\n"];
        int v17 = 138543618;
        double v18 = v12;
        __int16 v19 = 2114;
        double v20 = v16;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v11 = [v10 componentsJoinedByString:@"\n"];
      int v17 = 138543362;
      double v18 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v17, 0xCu);
    }
    _NUAssertFailHandler();
  }
  return v2;
}

- (id)backgroundNode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderNode *)self inputForKey:@"background"];
  if (!v2)
  {
    v4 = NUAssertLogger_5469();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Missing background node"];
      int v17 = 138543362;
      double v18 = v5;
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
        int v16 = [v15 componentsJoinedByString:@"\n"];
        int v17 = 138543618;
        double v18 = v12;
        __int16 v19 = 2114;
        double v20 = v16;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v11 = [v10 componentsJoinedByString:@"\n"];
      int v17 = 138543362;
      double v18 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v17, 0xCu);
    }
    _NUAssertFailHandler();
  }
  return v2;
}

- (id)inputNode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderNode *)self inputForKey:@"input"];
  if (!v2)
  {
    v4 = NUAssertLogger_5469();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Missing input node"];
      int v17 = 138543362;
      double v18 = v5;
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
        int v16 = [v15 componentsJoinedByString:@"\n"];
        int v17 = 138543618;
        double v18 = v12;
        __int16 v19 = 2114;
        double v20 = v16;
        _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (v9)
    {
      v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v11 = [v10 componentsJoinedByString:@"\n"];
      int v17 = 138543362;
      double v18 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v17, 0xCu);
    }
    _NUAssertFailHandler();
  }
  return v2;
}

- (PIInfillCompositeNode)initWithInput:(id)a3 background:(id)a4 matte:(id)a5 settings:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    __int16 v19 = NUAssertLogger_5469();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      double v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v61 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v23 = NUAssertLogger_5469();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v42 = dispatch_get_specific(*v21);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        uint64_t v21 = [v43 callStackSymbols];
        v45 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v61 = (const void **)v42;
        __int16 v62 = 2114;
        v63 = v45;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      double v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v61 = v21;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v29 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  if (!v11)
  {
    v26 = NUAssertLogger_5469();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "background != nil");
      v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v61 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = (const void **)MEMORY[0x1E4F7A308];
    v28 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v23 = NUAssertLogger_5469();
    int v29 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v29)
      {
        double v30 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v21 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v61 = v21;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_31:

      int v34 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v29)
    {
      v46 = dispatch_get_specific(*v21);
      v47 = (void *)MEMORY[0x1E4F29060];
      id v48 = v46;
      uint64_t v21 = [v47 callStackSymbols];
      v49 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v61 = (const void **)v46;
      __int16 v62 = 2114;
      v63 = v49;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  if (!v12)
  {
    double v31 = NUAssertLogger_5469();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "matte != nil");
      double v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v61 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = (const void **)MEMORY[0x1E4F7A308];
    double v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v23 = NUAssertLogger_5469();
    int v34 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        double v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v21 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v61 = v21;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_34:

      int v39 = _NUAssertFailHandler();
      goto LABEL_35;
    }
LABEL_32:
    if (v34)
    {
      v50 = dispatch_get_specific(*v21);
      BOOL v51 = (void *)MEMORY[0x1E4F29060];
      id v52 = v50;
      uint64_t v21 = [v51 callStackSymbols];
      v53 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v61 = (const void **)v50;
      __int16 v62 = 2114;
      v63 = v53;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_34;
  }
  id v14 = v13;
  if (!v13)
  {
    double v36 = NUAssertLogger_5469();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      double v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v61 = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v21 = (const void **)MEMORY[0x1E4F7A308];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v23 = NUAssertLogger_5469();
    int v39 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        v40 = [MEMORY[0x1E4F29060] callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v61 = v41;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_37;
    }
LABEL_35:
    if (v39)
    {
      v54 = dispatch_get_specific(*v21);
      v55 = (void *)MEMORY[0x1E4F29060];
      id v56 = v54;
      v57 = [v55 callStackSymbols];
      v58 = [v57 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v61 = (const void **)v54;
      __int16 v62 = 2114;
      v63 = v58;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_37:

    _NUAssertFailHandler();
  }
  v15 = (void *)[v13 mutableCopy];
  [v15 setObject:@"background" forKeyedSubscript:@"__dominantInputSettingsKey"];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:v10 forKeyedSubscript:@"input"];
  [v16 setObject:v11 forKeyedSubscript:@"background"];
  [v16 setObject:v12 forKeyedSubscript:@"matte"];
  v59.receiver = self;
  v59.super_class = (Class)PIInfillCompositeNode;
  int v17 = [(NURenderNode *)&v59 initWithSettings:v15 inputs:v16];

  return v17;
}

- (PIInfillCompositeNode)initWithSettings:(id)a3 inputs:(id)a4
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
    BOOL v9 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSString;
      id v12 = v10;
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      v15 = NSStringFromSelector(a2);
      id v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      double v31 = v16;
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
          double v20 = v18;
          uint64_t v21 = [v19 callStackSymbols];
          double v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          double v31 = v22;
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
      double v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      double v20 = v23;
      v27 = [v25 callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      double v31 = specific;
      __int16 v32 = 2114;
      double v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    int v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_198_5505);
  }
}

+ (id)applyDeltaKernel
{
  if (applyDeltaKernel_once != -1) {
    dispatch_once(&applyDeltaKernel_once, &__block_literal_global_135);
  }
  v2 = (void *)applyDeltaKernel_s_applyDeltaKernel;
  return v2;
}

uint64_t __41__PIInfillCompositeNode_applyDeltaKernel__block_invoke()
{
  applyDeltaKernel_s_applyDeltaKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 applyDelta(__sample a, __sample d) \n{ \n  float4 b = (a + d) - 0.5\n  return float4(b.rgb, 1.0); \n}\n"];;
  return MEMORY[0x1F41817F8]();
}

+ (id)computeDeltaKernel
{
  if (computeDeltaKernel_once != -1) {
    dispatch_once(&computeDeltaKernel_once, &__block_literal_global_5660);
  }
  v2 = (void *)computeDeltaKernel_s_computeDeltaKernel;
  return v2;
}

uint64_t __43__PIInfillCompositeNode_computeDeltaKernel__block_invoke()
{
  computeDeltaKernel_s_computeDeltaKernel = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 computeDelta(__sample a, __sample b) \n{ \n  float4 delta = (b - a) + 0.5\n  return float4(delta.rgb, 1.0); \n}\n"];;
  return MEMORY[0x1F41817F8]();
}

@end