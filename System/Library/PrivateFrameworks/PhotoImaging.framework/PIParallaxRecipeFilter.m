@interface PIParallaxRecipeFilter
- (NSDictionary)parameters;
- (NSDictionary)resolvedParameters;
- (PIParallaxRecipeFilter)initWithRecipe:(id)a3;
- (PIParallaxStyleRecipe)recipe;
- (id)_evaluateImageWithFilterDefinitions:(id)a3 inputImage:(id)a4;
- (id)outputBackgroundImage;
- (id)outputForegroundImage;
- (id)outputMatteImage;
- (void)setParameters:(id)a3;
- (void)setRecipe:(id)a3;
@end

@implementation PIParallaxRecipeFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setRecipe:(id)a3
{
}

- (PIParallaxStyleRecipe)recipe
{
  return self->_recipe;
}

- (id)_evaluateImageWithFilterDefinitions:(id)a3 inputImage:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v30 = NUAssertLogger_11535();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "definitions != nil");
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v34 = NUAssertLogger_11535();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v48 = dispatch_get_specific(*v32);
        v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        v32 = [v49 callStackSymbols];
        v51 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v69 = (const void **)v48;
        __int16 v70 = 2114;
        id v71 = v51;
        _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v32 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v69 = v32;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v40 = _NUAssertFailHandler();
    goto LABEL_38;
  }
  v8 = v7;
  if (!v7)
  {
    v37 = NUAssertLogger_11535();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil");
      v38 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v38;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    v39 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v34 = NUAssertLogger_11535();
    int v40 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v40)
      {
        v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        v32 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v69 = v32;
        _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_40:

      int v45 = _NUAssertFailHandler();
      goto LABEL_41;
    }
LABEL_38:
    if (v40)
    {
      v52 = dispatch_get_specific(*v32);
      v53 = (void *)MEMORY[0x1E4F29060];
      id v54 = v52;
      v32 = [v53 callStackSymbols];
      v55 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v69 = (const void **)v52;
      __int16 v70 = 2114;
      id v71 = v55;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_40;
  }
  v9 = objc_alloc_init(PIParallaxStyleEvaluationContext);
  v10 = [(PIParallaxRecipeFilter *)self resolvedParameters];
  [(PIParallaxStyleEvaluationContext *)v9 setParameters:v10];

  v11 = [(PIParallaxFilter *)self inputGuideImage];
  [(PIParallaxStyleEvaluationContext *)v9 setGuideImage:v11];

  [(PIParallaxStyleEvaluationContext *)v9 setInputImage:v8];
  v61 = v8;
  v12 = [v8 imageByClampingToExtent];
  [(PIParallaxStyleEvaluationContext *)v9 setOutputImage:v12];

  v13 = [(PIParallaxFilter *)self inputMatteImage];
  [(PIParallaxStyleEvaluationContext *)v9 setMatteImage:v13];

  v14 = [(PIParallaxFilter *)self inputBackgroundImage];
  [(PIParallaxStyleEvaluationContext *)v9 setBackgroundImage:v14];

  [(PIParallaxFilter *)self visibleFrame];
  -[PIParallaxStyleEvaluationContext setVisibleRect:](v9, "setVisibleRect:");
  [(PIParallaxFilter *)self renderScale];
  -[PIParallaxStyleEvaluationContext setRenderScale:](v9, "setRenderScale:");
  v15 = [(PIParallaxFilter *)self localLightData];
  [(PIParallaxStyleEvaluationContext *)v9 setLocalLightData:v15];

  v16 = [(PIParallaxFilter *)self cache];
  [(PIParallaxStyleEvaluationContext *)v9 setCache:v16];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    v20 = (dispatch_once_t *)MEMORY[0x1E4F7A750];
    uint64_t v21 = *(void *)v64;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v64 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v63 + 1) + 8 * v22);
        id v62 = 0;
        v24 = [v23 evaluateWithContext:v9 error:&v62];
        id v25 = v62;
        if (v24)
        {
          [(PIParallaxStyleEvaluationContext *)v9 setOutputImage:v24];
        }
        else
        {
          if (*v20 != -1) {
            dispatch_once(v20, &__block_literal_global_11550);
          }
          v26 = *MEMORY[0x1E4F7A758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v69 = (const void **)v23;
            __int16 v70 = 2112;
            id v71 = v25;
            _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Error evaluating filter definition: %@, error: %@", buf, 0x16u);
          }
        }

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v19);
  }

  v27 = [(PIParallaxStyleEvaluationContext *)v9 outputImage];
  [v61 extent];
  v28 = objc_msgSend(v27, "imageByCroppingToRect:");

  if (!v28)
  {
    v42 = NUAssertLogger_11535();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = [NSString stringWithFormat:@"Failed to produce an image"];
      *(_DWORD *)buf = 138543362;
      v69 = v43;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    v44 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v34 = NUAssertLogger_11535();
    int v45 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (!v44)
    {
      if (v45)
      {
        v46 = [MEMORY[0x1E4F29060] callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v69 = v47;
        _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_43;
    }
LABEL_41:
    if (v45)
    {
      v56 = dispatch_get_specific(*v32);
      v57 = (void *)MEMORY[0x1E4F29060];
      id v58 = v56;
      v59 = [v57 callStackSymbols];
      v60 = [v59 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v69 = (const void **)v56;
      __int16 v70 = 2114;
      id v71 = v60;
      _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_43:

    _NUAssertFailHandler();
  }

  return v28;
}

- (NSDictionary)resolvedParameters
{
  v3 = [(PIParallaxRecipeFilter *)self recipe];
  v4 = [v3 parameters];
  v5 = (void *)[v4 mutableCopy];

  id v6 = [(PIParallaxRecipeFilter *)self parameters];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__PIParallaxRecipeFilter_resolvedParameters__block_invoke;
  v9[3] = &unk_1E5D7FC80;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return (NSDictionary *)v7;
}

void __44__PIParallaxRecipeFilter_resolvedParameters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 type];
    int v10 = [v9 isEqualToString:@"color"];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v6;
        v12 = [PIParallaxStyleColorParameter alloc];
        v13 = NSNumber;
        [v11 red];
        v14 = objc_msgSend(v13, "numberWithDouble:");
        v15 = NSNumber;
        [v11 green];
        v16 = objc_msgSend(v15, "numberWithDouble:");
        id v17 = NSNumber;
        [v11 blue];
        uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
        uint64_t v19 = [(PIParallaxStyleColorParameter *)v12 initWithRed:v14 green:v16 blue:v18 alpha:&unk_1F000A4D8];

        [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:v5];
        goto LABEL_19;
      }
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_11550);
      }
      v24 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        int v26 = 138543618;
        id v27 = v5;
        __int16 v28 = 2114;
        id v29 = v6;
        id v25 = "Parameter %{public}@ is not a valid color value: %{public}@";
LABEL_21:
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v26, 0x16u);
      }
    }
    else
    {
      uint64_t v21 = [v8 type];
      int v22 = [v21 isEqualToString:@"number"];

      if (v22)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v23 = [[PIParallaxStyleNumberParameter alloc] initWithNumber:v6];
          [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:v5];

          goto LABEL_19;
        }
        if (*MEMORY[0x1E4F7A750] != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_11550);
        }
        v24 = *MEMORY[0x1E4F7A758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
        {
          int v26 = 138543618;
          id v27 = v5;
          __int16 v28 = 2114;
          id v29 = v6;
          id v25 = "Parameter %{public}@ is not a valid number value: %{public}@";
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_11550);
    }
    v20 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138543362;
      id v27 = v5;
      _os_log_debug_impl(&dword_1A9680000, v20, OS_LOG_TYPE_DEBUG, "Unsupported filter parameter: %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }
LABEL_19:
}

- (id)outputMatteImage
{
  v3 = [(PIParallaxFilter *)self inputMatteImage];

  if (v3)
  {
    v4 = [(PIParallaxRecipeFilter *)self recipe];
    id v5 = [v4 matteFilters];
    id v6 = [(PIParallaxFilter *)self inputMatteImage];
    id v7 = [(PIParallaxRecipeFilter *)self _evaluateImageWithFilterDefinitions:v5 inputImage:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)outputForegroundImage
{
  v3 = [(PIParallaxFilter *)self inputForegroundImage];

  if (v3)
  {
    v4 = [(PIParallaxRecipeFilter *)self recipe];
    id v5 = [v4 foregroundFilters];
    id v6 = [(PIParallaxFilter *)self inputForegroundImage];
    id v7 = [(PIParallaxRecipeFilter *)self _evaluateImageWithFilterDefinitions:v5 inputImage:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)outputBackgroundImage
{
  v3 = [(PIParallaxFilter *)self inputBackgroundImage];

  if (v3)
  {
    v4 = [(PIParallaxRecipeFilter *)self recipe];
    id v5 = [v4 backgroundFilters];
    id v6 = [(PIParallaxFilter *)self inputBackgroundImage];
    id v7 = [(PIParallaxRecipeFilter *)self _evaluateImageWithFilterDefinitions:v5 inputImage:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (PIParallaxRecipeFilter)initWithRecipe:(id)a3
{
  v4 = (PIParallaxStyleRecipe *)a3;
  v10.receiver = self;
  v10.super_class = (Class)PIParallaxRecipeFilter;
  id v5 = [(PIParallaxRecipeFilter *)&v10 init];
  recipe = v5->_recipe;
  v5->_recipe = v4;
  id v7 = v4;

  parameters = v5->_parameters;
  v5->_parameters = (NSDictionary *)MEMORY[0x1E4F1CC08];

  return v5;
}

@end