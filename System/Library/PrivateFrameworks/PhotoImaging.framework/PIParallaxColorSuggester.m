@interface PIParallaxColorSuggester
- (NURuleSystem)system;
- (PIParallaxColorSuggester)init;
- (PIParallaxColorSuggester)initWithColorAnalysis:(id)a3;
- (id)suggestedColorForColor:(id)a3;
- (id)suggestedColorsForColors:(id)a3 fromColorPalette:(id)a4;
- (void)addRuleWithHueMin:(double)a3 hueMax:(double)a4 suggestion:(id)a5;
@end

@implementation PIParallaxColorSuggester

- (void).cxx_destruct
{
}

- (NURuleSystem)system
{
  return self->_system;
}

- (id)suggestedColorsForColors:(id)a3 fromColorPalette:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v23 = NUAssertLogger_4398();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colors != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v25 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v27 = NUAssertLogger_4398();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific(*v25);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        __int16 v43 = 2114;
        v44 = v35;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v30;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [(PIParallaxColorSuggester *)self suggestedColorForColor:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        v16 = [v8 suggestionForColor:v15];
        v17 = [v16 primaryColor];
        if (([v9 containsObject:v17] & 1) == 0) {
          [v9 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v12);
  }

  if ((PFExists() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F8CC78] warmColor];
    v19 = [v8 paletteColorForColor:v18];

    [v9 addObject:v19];
  }
  if ((PFExists() & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F8CC78] coolColor];
    v21 = [v8 paletteColorForColor:v20];

    [v9 addObject:v21];
  }

  return v9;
}

uint64_t __70__PIParallaxColorSuggester_suggestedColorsForColors_fromColorPalette___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCool];
}

uint64_t __70__PIParallaxColorSuggester_suggestedColorsForColors_fromColorPalette___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWarm];
}

- (void)addRuleWithHueMin:(double)a3 hueMax:(double)a4 suggestion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (a3 > a4)
  {
    uint64_t v12 = NUAssertLogger_4398();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "hueMin <= hueMax");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v16 = NUAssertLogger_4398();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        __int16 v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v9 = (void *)MEMORY[0x1E4F7A668];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke;
  v27[3] = &__block_descriptor_48_e22_B16__0__NURuleSystem_8l;
  *(double *)&v27[4] = a3;
  *(double *)&v27[5] = a4;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke_2;
  v25[3] = &unk_1E5D7F1B0;
  id v26 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 ruleWithBlockPredicate:v27 action:v25];
  [(NURuleSystem *)self->_system addRule:v11];
}

BOOL __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 state];
  v4 = [v3 objectForKeyedSubscript:@"inputColor"];

  [v4 hue];
  double v5 = *(double *)(a1 + 32);
  double v6 = *(double *)(a1 + 40);
  double v8 = fmod(v7 - v5, 360.0);
  if (v8 < 0.0) {
    double v8 = v8 + 360.0;
  }
  BOOL v9 = v8 < v6 - v5;

  return v9;
}

void __64__PIParallaxColorSuggester_addRuleWithHueMin_hueMax_suggestion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 state];
  id v8 = [v4 objectForKeyedSubscript:@"inputColor"];

  double v5 = [v3 constants];
  double v6 = [v5 objectForKeyedSubscript:@"colorAnalysis"];

  double v7 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v3 setStateObject:v7 forKey:@"outputColor"];
}

- (id)suggestedColorForColor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v11 = NUAssertLogger_4398();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "color != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v15 = NUAssertLogger_4398();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        id v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        __int16 v28 = 2114;
        v29 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v5 = v4;
  system = self->_system;
  v24[0] = @"inputColor";
  v24[1] = @"outputColor";
  v25[0] = v4;
  v25[1] = v4;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [(NURuleSystem *)system resetAndEvaluateWithInitialState:v7];

  id v8 = [(NURuleSystem *)self->_system state];
  BOOL v9 = [v8 objectForKeyedSubscript:@"outputColor"];

  return v9;
}

- (PIParallaxColorSuggester)initWithColorAnalysis:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v12 = NUAssertLogger_4398();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "analysis != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v16 = NUAssertLogger_4398();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific(*v14);
        id v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        v23 = [v21 callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v20;
        __int16 v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)PIParallaxColorSuggester;
  double v6 = [(PIParallaxColorSuggester *)&v25 init];
  double v7 = (NURuleSystem *)objc_alloc_init(MEMORY[0x1E4F7A670]);
  system = v6->_system;
  v6->_system = v7;

  BOOL v9 = v6->_system;
  id v26 = @"colorAnalysis";
  v27 = v5;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [(NURuleSystem *)v9 setConstants:v10];

  return v6;
}

- (PIParallaxColorSuggester)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    double v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      double v6 = NSString;
      double v7 = v5;
      id v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      id v10 = NSStringFromSelector(a2);
      uint64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      id v26 = v11;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_50);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          BOOL v16 = [v14 callStackSymbols];
          BOOL v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v26 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_50);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      id v22 = [v20 callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v26 = specific;
      __int16 v27 = 2114;
      __int16 v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_50);
  }
}

@end