@interface PIDepthEffectApertureAutoCalculator
- (void)submit:(id)a3;
@end

@implementation PIDepthEffectApertureAutoCalculator

- (void)submit:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v13 = NUAssertLogger_25708();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v17 = NUAssertLogger_25708();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific(*v15);
        v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        __int16 v31 = 2114;
        v32 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F7A520]);
  v7 = [(NURenderRequest *)self composition];
  v8 = (void *)[v6 initWithComposition:v7];

  v9 = [(NURenderRequest *)self responseQueue];
  [v8 setResponseQueue:v9];

  [v8 setName:@"PIDepthEffectApertureAutoCalculator-getValuesAtCapture-imageProperties"];
  v10 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"pre-Adjustments"];
  v28 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  [v8 setPipelineFilters:v11];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__PIDepthEffectApertureAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5D81670;
  id v27 = v5;
  id v12 = v5;
  [v8 submit:v26];
}

void __46__PIDepthEffectApertureAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  v3 = [a2 result:&v17];
  id v4 = v17;
  if (v3)
  {
    v5 = [v3 properties];
    id v16 = 0;
    id v6 = +[PIValuesAtCapture valuesAtCaptureFromImageProperties:v5 error:&v16];
    id v7 = v16;

    if (v6)
    {
      BOOL v18 = @"aperture";
      v8 = NSNumber;
      [v6 aperture];
      v9 = objc_msgSend(v8, "numberWithFloat:");
      v19[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v10];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = objc_alloc(MEMORY[0x1E4F7A660]);
      v10 = (void *)[v15 initWithResult:MEMORY[0x1E4F1CC08]];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v10);
    }

    id v4 = v7;
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v5);
  }
}

@end