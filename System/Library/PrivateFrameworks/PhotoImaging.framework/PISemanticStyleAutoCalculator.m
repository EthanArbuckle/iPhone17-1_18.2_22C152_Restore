@interface PISemanticStyleAutoCalculator
+ (BOOL)canRenderStylesOnComposition:(id)a3;
+ (BOOL)isStylableFromImageProperties:(id)a3 error:(id *)a4;
- (id)_resultFromImageProperties:(id)a3 error:(id *)a4;
- (id)submitSynchronous:(id *)a3;
- (void)submit:(id)a3;
@end

@implementation PISemanticStyleAutoCalculator

- (id)submitSynchronous:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v11 = NUAssertLogger_1335();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v15 = NUAssertLogger_1335();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        __int16 v27 = 2114;
        v28 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  if (PISemanticStyleIsRenderSupported())
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithRequest:self];
    id v24 = 0;
    v6 = [v5 submitSynchronous:&v24];
    id v7 = v24;
    v8 = [v6 properties];

    if (v8)
    {
      v9 = [(PISemanticStyleAutoCalculator *)self _resultFromImageProperties:v8 error:a3];
    }
    else
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Properties request failed" object:0 underlyingError:v7];
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] unsupportedError:@"Styles not supported on current platform" object:0];
    v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_resultFromImageProperties:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = NUAssertLogger_1335();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "properties != nil");
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v21 = NUAssertLogger_1335();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v25;
        __int16 v32 = 2114;
        v33 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  if ([(id)objc_opt_class() isStylableFromImageProperties:v5 error:a4])
  {
    id v7 = [v6 metadata];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F155D0]];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = PISemanticStyleSettingsFromMakerNoteProperties(v9);
      v11 = [v10 objectForKeyedSubscript:@"version"];
      uint64_t v12 = [v11 integerValue];

      v13 = (void *)[objc_alloc(MEMORY[0x1E4F7A6D0]) initWithMajor:1 minor:0];
      uint64_t v14 = [v13 major];

      if (v12 <= v14)
      {
        id v15 = v10;
      }
      else
      {
        [MEMORY[0x1E4F7A438] unsupportedError:@"Unsupported style rendering version" object:v10];
        id v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [MEMORY[0x1E4F7A438] invalidError:@"Invalid MakerNote Style dictionary" object:v9];
      id v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)submit:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v9 = NUAssertLogger_1335();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v25 = v10;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v11 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v13 = NUAssertLogger_1335();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific(*v11);
        v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        id v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v25 = v17;
        __int16 v26 = 2114;
        id v27 = v21;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = (void (**)(void, void))v4;
  if (PISemanticStyleIsRenderSupported())
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithRequest:self];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __40__PISemanticStyleAutoCalculator_submit___block_invoke;
    v22[3] = &unk_1E5D81798;
    v22[4] = self;
    v23 = v5;
    [v6 submit:v22];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F7A438] unsupportedError:@"Styles not supported on current platform" object:0];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
    ((void (**)(void, void *))v5)[2](v5, v8);
  }
}

void __40__PISemanticStyleAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v14 = 0;
  v3 = [a2 result:&v14];
  id v4 = v14;
  id v5 = [v3 properties];

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    id v13 = 0;
    id v7 = [v6 _resultFromImageProperties:v5 error:&v13];
    id v8 = v13;

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = objc_alloc(MEMORY[0x1E4F7A660]);
    if (v7) {
      uint64_t v11 = [v10 initWithResult:v7];
    }
    else {
      uint64_t v11 = [v10 initWithError:v8];
    }
    uint64_t v12 = (void *)v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v11);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Properties request failed" object:0 underlyingError:v4];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v8 = v4;
  }
}

+ (BOOL)canRenderStylesOnComposition:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    BOOL v16 = NUAssertLogger_1335();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      v17 = (PISemanticStyleAutoCalculator *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = (PISemanticStyleAutoCalculator *)dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v5 = NUAssertLogger_1335();
    BOOL v18 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        specific = (PISemanticStyleAutoCalculator *)dispatch_get_specific(*v8);
        id v19 = (void *)MEMORY[0x1E4F29060];
        v3 = specific;
        id v8 = [v19 callStackSymbols];
        v20 = [v8 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v23 = specific;
        __int16 v24 = 2114;
        v25 = v20;
        _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      id v8 = [(PISemanticStyleAutoCalculator *)specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v23 = (PISemanticStyleAutoCalculator *)v8;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_20:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_48);
LABEL_5:
    uint64_t v11 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v11;
      id v13 = [v8 description];
      *(_DWORD *)buf = 138543362;
      v23 = v13;
      _os_log_impl(&dword_1A9680000, v12, OS_LOG_TYPE_INFO, "PISemanticStyleAutoCalculator - not supported: %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v5 = v4;
  specific = [(NURenderRequest *)[PISemanticStyleAutoCalculator alloc] initWithComposition:v4];
  id v21 = 0;
  v3 = [(PISemanticStyleAutoCalculator *)specific submitSynchronous:&v21];
  id v7 = (const void **)v21;
  id v8 = v7;
  if (v3) {
    goto LABEL_11;
  }
  uint64_t v9 = [v7 code];
  uint64_t v10 = *MEMORY[0x1E4F7A750];
  if (v9 == 9)
  {
    if (v10 == -1) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
  if (v10 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_48);
  }
  id v14 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v23 = (PISemanticStyleAutoCalculator *)v8;
    _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "PISemanticStyleAutoCalculator - error: %{public}@", buf, 0xCu);
  }
LABEL_11:

  return v3 != 0;
}

+ (BOOL)isStylableFromImageProperties:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([MEMORY[0x1E4F7A4A0] shouldEnableStylesForProRaw]
    && ([v5 rawProperties], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v5 semanticStyleProperties];
    if (v8)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A6D0]) initWithMajor:0 minor:14];
      uint64_t v10 = [v8 version];
      char v7 = [v10 isCompatibleWithVersion:v9];

      if ((v7 & 1) == 0)
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F7A438];
        uint64_t v12 = [v8 version];
        *a4 = [v11 unsupportedError:@"Unsupported style metadata version" object:v12];
      }
    }
    else
    {
      [MEMORY[0x1E4F7A438] unsupportedError:@"Asset is not stylable" object:0];
      char v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v7;
}

@end