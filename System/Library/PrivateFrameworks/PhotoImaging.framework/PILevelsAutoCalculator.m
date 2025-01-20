@interface PILevelsAutoCalculator
- (id)calculateSettingsForImageHistogram:(id)a3;
- (id)calculateSettingsForSingleChannelHistogram:(id)a3 suffix:(id)a4;
- (void)submit:(id)a3;
@end

@implementation PILevelsAutoCalculator

- (id)calculateSettingsForSingleChannelHistogram:(id)a3 suffix:(id)a4
{
  v30[10] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  [v6 percentile:0.001];
  double v8 = v7;
  [v6 percentile:0.999];
  double v10 = v9;

  double v11 = (v8 + v10) * 0.5;
  v28 = [@"blackSrc" stringByAppendingString:v5];
  v29[0] = v28;
  v27 = [NSNumber numberWithDouble:v8];
  v30[0] = v27;
  v26 = [@"blackDst" stringByAppendingString:v5];
  v29[1] = v26;
  v30[1] = &unk_1F000A6A8;
  v25 = [@"shadowSrc" stringByAppendingString:v5];
  v29[2] = v25;
  v24 = [NSNumber numberWithDouble:(v8 + v11) * 0.5];
  v30[2] = v24;
  v23 = [@"shadowDst" stringByAppendingString:v5];
  v29[3] = v23;
  v30[3] = &unk_1F000A6B8;
  v12 = [@"midSrc" stringByAppendingString:v5];
  v29[4] = v12;
  v13 = [NSNumber numberWithDouble:v11];
  v30[4] = v13;
  v14 = [@"midDst" stringByAppendingString:v5];
  v29[5] = v14;
  v30[5] = &unk_1F000A6C8;
  v15 = [@"hilightSrc" stringByAppendingString:v5];
  v29[6] = v15;
  v16 = [NSNumber numberWithDouble:(v10 + v11) * 0.5];
  v30[6] = v16;
  v17 = [@"hilightDst" stringByAppendingString:v5];
  v29[7] = v17;
  v30[7] = &unk_1F000A6D8;
  v18 = [@"whiteSrc" stringByAppendingString:v5];
  v29[8] = v18;
  v19 = [NSNumber numberWithDouble:v10];
  v30[8] = v19;
  v20 = [@"whiteDst" stringByAppendingString:v5];

  v29[9] = v20;
  v30[9] = &unk_1F000A6E8;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:10];

  return v21;
}

- (id)calculateSettingsForImageHistogram:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v5 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v6 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      double v7 = NSString;
      double v8 = v6;
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      double v11 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_20015);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_20015);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      v22 = [v20 callStackSymbols];
      v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      __int16 v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_20015);
  }
}

- (void)submit:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v14 = NUAssertLogger_20031();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    os_log_t v18 = NUAssertLogger_20031();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific(*v16);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        __int16 v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v22;
        __int16 v32 = 2114;
        v33 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A4B8]) initWithRequest:self];
  [v6 setName:@"PILevelsAutoCalculator-histogram"];
  double v7 = +[PIPipelineFilters stopAtTagIncludeGeometryFilter:@"pre-Levels"];
  v29[0] = v7;
  double v8 = +[PIPipelineFilters histogramOptimizationFilter];
  v29[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v6 setPipelineFilters:v9];

  [v6 setSampleMode:2];
  double v10 = [v6 histogramCalculationColorSpace];
  double v11 = [MEMORY[0x1E4F7A400] itur2100HLGColorSpace];
  LOBYTE(v9) = [v10 isEqual:v11];

  if ((v9 & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F7A400] displayP3ColorSpace];
    [v6 setHistogramCalculationColorSpace:v12];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __33__PILevelsAutoCalculator_submit___block_invoke;
  v27[3] = &unk_1E5D81798;
  v27[4] = self;
  id v28 = v5;
  id v13 = v5;
  [v6 submit:v27];
}

void __33__PILevelsAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v10 = 0;
  id v3 = [a2 result:&v10];
  id v4 = v10;
  id v5 = [v3 histogram];

  id v6 = objc_alloc(MEMORY[0x1E4F7A660]);
  double v7 = v6;
  if (v5)
  {
    double v8 = [*(id *)(a1 + 32) calculateSettingsForImageHistogram:v5];
    uint64_t v9 = (void *)[v7 initWithResult:v8];
  }
  else
  {
    uint64_t v9 = (void *)[v6 initWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end