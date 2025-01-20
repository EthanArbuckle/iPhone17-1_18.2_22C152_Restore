@interface NURenderPipelineFunction
+ (id)functionWithEvaluationBlock:(id)a3;
+ (id)grainInputSeedFromFrameTime;
+ (id)redEyeSpotsWithCorrectionInfo:(id)a3;
+ (id)scaleMultiplyOfScalar:(double)a3;
+ (id)scaledVector:(id)a3;
+ (id)sharpnessWithIntensity:(double)a3;
- (BOOL)isEqual:(id)a3;
- (id)evaluate:(id)a3 error:(id *)a4;
- (unint64_t)hash;
@end

@implementation NURenderPipelineFunction

- (BOOL)isEqual:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
  }
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v5 = NSString;
    v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NURenderPipelineFunction isEqual:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 511, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (unint64_t)hash
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    v11 = v9;
    v12 = [v10 callStackSymbols];
    v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  v11 = v14;
  v18 = [v16 callStackSymbols];
  id v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NURenderPipelineFunction hash]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 505, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
  }
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = NSString;
    v7 = v5;
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    uint64_t v10 = [v6 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v9];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v10;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v11 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v11 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
      }
      goto LABEL_8;
    }
    if (v11 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_374);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v12 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v13 = (void *)MEMORY[0x1E4F29060];
    v14 = v12;
    v15 = [v13 callStackSymbols];
    v16 = [v15 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v16;
    _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v17 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v19 = (void *)MEMORY[0x1E4F29060];
  id v20 = specific;
  v14 = v17;
  uint64_t v21 = [v19 callStackSymbols];
  uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v30 = specific;
  __int16 v31 = 2114;
  uint64_t v32 = v22;
  _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v23 = (objc_class *)objc_opt_class();
  uint64_t v24 = NSStringFromClass(v23);
  _NUAssertFailHandler((uint64_t)"-[NURenderPipelineFunction evaluate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 499, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v25, v26, v27, v28, v24);
}

+ (id)grainInputSeedFromFrameTime
{
  return +[NURenderPipelineFunction functionWithEvaluationBlock:&__block_literal_global_332];
}

id __55__NURenderPipelineFunction_grainInputSeedFromFrameTime__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    [v2 time];
    if ((v9 & 0x100000000) != 0)
    {
      [v3 time];
      Float64 Seconds = CMTimeGetSeconds(&time);
      id v4 = objc_msgSend(NSNumber, "numberWithDouble:", (double)modf(Seconds / 10.0, __y));
    }
    else
    {
      id v4 = &unk_1F0049C68;
    }
  }
  else
  {
    __y[1] = 0.0;
    uint64_t v9 = 0;
    id v4 = &unk_1F0049C68;
    uint64_t v10 = 0;
  }

  return v4;
}

+ (id)redEyeSpotsWithCorrectionInfo:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NURenderPipelineFunction_redEyeSpotsWithCorrectionInfo___block_invoke;
  v7[3] = &unk_1E5D93DD8;
  id v8 = v3;
  id v4 = v3;
  v5 = +[NURenderPipelineFunction functionWithEvaluationBlock:v7];

  return v5;
}

id __58__NURenderPipelineFunction_redEyeSpotsWithCorrectionInfo___block_invoke(uint64_t a1, void *a2)
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v38 = [MEMORY[0x1E4F1CA48] array];
  v36 = v3;
  uint64_t v4 = [v3 scale];
  double v6 = NUScaleToDouble(v4, v5);
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v7 = 0;
    id v8 = @"pointX";
    uint64_t v9 = @"pointY";
    uint64_t v10 = @"radius";
    uint64_t v11 = @"sensitivity";
    uint64_t v37 = a1;
    do
    {
      v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7];
      v13 = [v12 objectForKeyedSubscript:v8];
      [v13 doubleValue];
      double v15 = v14;
      v16 = [v12 objectForKeyedSubscript:v9];
      [v16 doubleValue];
      double v18 = v17;

      id v19 = [v12 objectForKeyedSubscript:v10];
      [v19 doubleValue];
      double v21 = v20;

      uint64_t v22 = [v12 objectForKeyedSubscript:v11];
      [v22 doubleValue];
      double v24 = v23;

      double v25 = fmin(v6 * (v21 + 10.0), 400.0);
      if (v25 >= 3.0)
      {
        v40[0] = @"inputCenter";
        v39[0] = v6 * v15;
        v39[1] = v6 * v18;
        uint64_t v26 = [MEMORY[0x1E4F29238] valueWithBytes:v39 objCType:"{CGPoint=dd}"];
        v41[0] = v26;
        v40[1] = @"inputRadius";
        uint64_t v27 = [NSNumber numberWithDouble:v25];
        v41[1] = v27;
        v40[2] = @"inputSensitivity";
        [NSNumber numberWithDouble:v24];
        uint64_t v28 = v11;
        v29 = v10;
        v31 = uint64_t v30 = v8;
        v41[2] = v31;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
        v33 = uint64_t v32 = v9;
        [v38 addObject:v33];

        uint64_t v9 = v32;
        id v8 = v30;
        uint64_t v10 = v29;
        uint64_t v11 = v28;
        a1 = v37;
      }
      ++v7;
    }
    while (v7 < [*(id *)(a1 + 32) count]);
  }
  v34 = (void *)[v38 copy];

  return v34;
}

+ (id)sharpnessWithIntensity:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__NURenderPipelineFunction_sharpnessWithIntensity___block_invoke;
  v5[3] = &__block_descriptor_40_e31__16__0__NURenderPipelineState_8l;
  *(double *)&v5[4] = a3;
  id v3 = +[NURenderPipelineFunction functionWithEvaluationBlock:v5];

  return v3;
}

uint64_t __51__NURenderPipelineFunction_sharpnessWithIntensity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 scale];
  double v5 = NUScaleToDouble(v3, v4) * -2.0 * *(double *)(a1 + 32) + 1.0;
  if (v5 >= 0.0) {
    double v6 = log10(v5 * 9.0 + 1.0);
  }
  else {
    double v6 = -log10(v5 * -9.0 + 1.0);
  }
  double v7 = 1.0 - v6;
  id v8 = NSNumber;

  return [v8 numberWithDouble:v7];
}

+ (id)scaledVector:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__NURenderPipelineFunction_scaledVector___block_invoke;
  v7[3] = &unk_1E5D93DD8;
  id v8 = v3;
  id v4 = v3;
  double v5 = +[NURenderPipelineFunction functionWithEvaluationBlock:v7];

  return v5;
}

id __41__NURenderPipelineFunction_scaledVector___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 scale];
  double v6 = NUScaleToDouble(v4, v5);
  unint64_t v7 = [*(id *)(a1 + 32) count];
  if (v7 >= 0x20) {
    uint64_t v8 = 32;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = (void *)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v10 = objc_msgSend(v9, "subarrayWithRange:", 0, v8);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    double v15 = (double *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "doubleValue", (void)v20);
        *v15++ = v6 * v17;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }

  double v18 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithValues:count:", v24, objc_msgSend(v11, "count"));

  return v18;
}

+ (id)scaleMultiplyOfScalar:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__NURenderPipelineFunction_scaleMultiplyOfScalar___block_invoke;
  v5[3] = &__block_descriptor_40_e31__16__0__NURenderPipelineState_8l;
  *(double *)&v5[4] = a3;
  id v3 = +[NURenderPipelineFunction functionWithEvaluationBlock:v5];

  return v3;
}

uint64_t __50__NURenderPipelineFunction_scaleMultiplyOfScalar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  uint64_t v4 = [a2 scale];
  double v6 = NUScaleToDouble(v4, v5) * *(double *)(a1 + 32);

  return [v3 numberWithDouble:v6];
}

+ (id)functionWithEvaluationBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[_NURenderPipelineBlockVariable alloc] initWithEvaluationBlock:v3];

  return v4;
}

@end