@interface PIPhotoEffect3DNode
- (BOOL)requiresVideoComposition;
- (PIPhotoEffect3DNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5;
- (PIPhotoEffect3DNode)initWithSettings:(id)a3 inputs:(id)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
@end

@implementation PIPhotoEffect3DNode

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    v27 = NUAssertLogger_15192();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v42 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v29 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v31 = NUAssertLogger_15192();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v35 = dispatch_get_specific(*v29);
        v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        v38 = [v36 callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v35;
        __int16 v43 = 2114;
        v44 = v39;
        _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v34;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v10 = v9;
  uint64_t v11 = [v9 auxiliaryImageType];
  v12 = [(PIPortraitNode *)self input];
  v13 = [v12 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:a5];

  if (v11 == 1)
  {
    if (v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v14 setObject:v13 forKeyedSubscript:@"inputImage"];
      v15 = [(PIPortraitNode *)self blurMap];
      uint64_t v40 = 0;
      v16 = [v15 nodeByReplayingAgainstCache:v8 pipelineState:v10 error:&v40];

      if (v16) {
        [v14 setObject:v16 forKeyedSubscript:@"inputBlurMap"];
      }
      v17 = [MEMORY[0x1E4F1CA60] dictionary];
      v18 = [(NURenderNode *)self settings];
      v19 = [v18 objectForKeyedSubscript:@"kind"];
      [v17 setObject:v19 forKeyedSubscript:@"inputKind"];

      v20 = [(NURenderNode *)self settings];
      v21 = [v20 objectForKeyedSubscript:@"intensity"];
      [v17 setObject:v21 forKeyedSubscript:@"inputIntensity"];

      v22 = [(NURenderNode *)self settings];
      v23 = [v22 objectForKeyedSubscript:@"isHDR"];
      [v17 setObject:v23 forKeyedSubscript:@"inputIsHDR"];

      v24 = (void *)[objc_alloc(MEMORY[0x1E4F7A460]) initWithFilterName:@"PIPhotoEffect3DFilter" settings:v17 inputs:v14];
      uint64_t v25 = [v24 resolvedNodeWithCachedInputs:v14 cache:v8 pipelineState:v10 error:a5];
    }
    else
    {
      uint64_t v25 = 0;
    }

    v13 = (void *)v25;
  }

  return v13;
}

- (PIPhotoEffect3DNode)initWithInput:(id)a3 blurMap:(id)a4 settings:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v19 = NUAssertLogger_15192();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v23 = NUAssertLogger_15192();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        __int16 v39 = 2114;
        uint64_t v40 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v11 = v10;
  if (v9)
  {
    v35[0] = @"inputImage";
    v35[1] = @"inputBlurMap";
    v36[0] = v8;
    v36[1] = v9;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = (id *)v36;
    id v14 = (__CFString **)v35;
    uint64_t v15 = 2;
  }
  else
  {
    v33 = @"inputImage";
    id v34 = v8;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = &v34;
    id v14 = &v33;
    uint64_t v15 = 1;
  }
  v16 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
  v32.receiver = self;
  v32.super_class = (Class)PIPhotoEffect3DNode;
  v17 = [(NURenderNode *)&v32 initWithSettings:v11 inputs:v16];

  return v17;
}

- (PIPhotoEffect3DNode)initWithSettings:(id)a3 inputs:(id)a4
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
    id v10 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = NSString;
      v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(a2);
      v16 = [v11 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v14, v15];
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v17 = *v8;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v17 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
        }
LABEL_7:
        os_log_t v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)MEMORY[0x1E4F29060];
          v20 = v18;
          v21 = [v19 callStackSymbols];
          v22 = [v21 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v31 = v22;
          _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v17 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
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
      uint64_t v25 = (void *)MEMORY[0x1E4F29060];
      id v26 = specific;
      v20 = v23;
      v27 = [v25 callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v31 = specific;
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    id v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_15332);
  }
}

@end