@interface PICurvesAutoCalculator
+ (id)_defaultCurveArray;
+ (id)autoValuesForBlackPoint:(double)a3 whitePoint:(double)a4;
+ (id)dictionariesFromPoints:(id)a3;
- (id)computeCurvesForImageHistogram:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PICurvesAutoCalculator

+ (id)autoValuesForBlackPoint:(double)a3 whitePoint:(double)a4
{
  v6 = [a1 _defaultCurveArray];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v7 objectAtIndex:1];
  v9 = [PICurveControlPoint alloc];
  [v8 y];
  v11 = -[PICurveControlPoint initWithX:y:editable:](v9, "initWithX:y:editable:", [v8 isEditable], a3, v10);

  [v7 replaceObjectAtIndex:1 withObject:v11];
  v12 = [v7 objectAtIndex:2];

  v13 = [PICurveControlPoint alloc];
  [v12 y];
  v15 = -[PICurveControlPoint initWithX:y:editable:](v13, "initWithX:y:editable:", [v12 isEditable], a4, v14);

  [v7 replaceObjectAtIndex:2 withObject:v15];
  v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];

  return v16;
}

+ (id)_defaultCurveArray
{
  if (_defaultCurveArray_onceToken != -1) {
    dispatch_once(&_defaultCurveArray_onceToken, &__block_literal_global_27419);
  }
  v2 = (void *)_defaultCurveArray_defaultCurveArray;
  return v2;
}

void __44__PICurvesAutoCalculator__defaultCurveArray__block_invoke()
{
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  v0 = [[PICurveControlPoint alloc] initWithX:0 y:0.0 editable:0.0];
  [v6 addObject:v0];

  v1 = [[PICurveControlPoint alloc] initWithX:0 y:0.0 editable:0.0];
  [v6 addObject:v1];

  v2 = [[PICurveControlPoint alloc] initWithX:0 y:1.0 editable:1.0];
  [v6 addObject:v2];

  v3 = [[PICurveControlPoint alloc] initWithX:0 y:2.0 editable:2.0];
  [v6 addObject:v3];

  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
  v5 = (void *)_defaultCurveArray_defaultCurveArray;
  _defaultCurveArray_defaultCurveArray = v4;
}

+ (id)dictionariesFromPoints:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v22[0] = @"x";
        double v10 = NSNumber;
        [v9 x];
        v11 = objc_msgSend(v10, "numberWithDouble:");
        v23[0] = v11;
        v22[1] = @"y";
        v12 = NSNumber;
        [v9 y];
        v13 = objc_msgSend(v12, "numberWithDouble:");
        v23[1] = v13;
        v22[2] = @"editable";
        double v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isEditable"));
        v23[2] = v14;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

        [v4 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)computeCurvesForImageHistogram:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v6 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSString;
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      v11 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_112);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          double v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          uint64_t v25 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_112);
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
      long long v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      v22 = [v20 callStackSymbols];
      uint64_t v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = specific;
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
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_112);
  }
}

- (void)submit:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v17 = NUAssertLogger_27461();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      os_log_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v21 = NUAssertLogger_27461();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        uint64_t v25 = dispatch_get_specific(*v19);
        __int16 v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        __int16 v36 = 2114;
        v37 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v35 = v24;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v5 = v4;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A4B8]) initWithRequest:self];
  id v7 = objc_alloc_init(MEMORY[0x1E4F7A4B0]);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F7A310] + 16);
  v32[0] = *MEMORY[0x1E4F7A310];
  v32[1] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F7A310] + 48);
  v32[2] = *(_OWORD *)(MEMORY[0x1E4F7A310] + 32);
  v32[3] = v9;
  [v7 setColorMatrix:v32];
  [v6 setParameters:v7];
  double v10 = +[PIPipelineFilters stopAtTagIncludeGeometryFilter:@"pre-Curves"];
  v33[0] = v10;
  v11 = +[PIPipelineFilters histogramOptimizationFilter];
  v33[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [v6 setPipelineFilters:v12];

  [v6 setSampleMode:2];
  os_log_t v13 = [v6 histogramCalculationColorSpace];
  double v14 = [MEMORY[0x1E4F7A400] itur2100HLGColorSpace];
  LOBYTE(v12) = [v13 isEqual:v14];

  if ((v12 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F7A400] displayP3ColorSpace];
    [v6 setHistogramCalculationColorSpace:v15];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __33__PICurvesAutoCalculator_submit___block_invoke;
  v30[3] = &unk_1E5D81798;
  v30[4] = self;
  id v31 = v5;
  id v16 = v5;
  [v6 submit:v30];
}

void __33__PICurvesAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v8 = 0;
  id v3 = [a2 result:&v8];
  id v4 = v8;
  uint64_t v5 = [v3 histogram];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) computeCurvesForImageHistogram:v5];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v6];
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end