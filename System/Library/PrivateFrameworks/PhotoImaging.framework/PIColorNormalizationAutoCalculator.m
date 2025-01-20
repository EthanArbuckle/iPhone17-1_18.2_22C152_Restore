@interface PIColorNormalizationAutoCalculator
+ (BOOL)isAvailable;
+ (id)autoCalculatorWithImageData:(id)a3 orientation:(int64_t)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (PIColorNormalizationAutoCalculator)initWithComposition:(id)a3;
- (void)setTime:(id *)a3;
- (void)submit:(id)a3;
@end

@implementation PIColorNormalizationAutoCalculator

- (void)setTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->time.value = *(_OWORD *)&a3->var0;
  self->time.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (void)submit:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v11 = NUAssertLogger_2110();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v13 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v15 = NUAssertLogger_2110();
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
        v28 = v19;
        __int16 v29 = 2114;
        v30 = v23;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = (void (**)(void, void))v4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F45690]);
  [v6 setRevision:1];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A720]) initWithRequest:self];
    id v26 = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v7 setVisionRequests:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x400000];
    [v7 setScalePolicy:v9];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __45__PIColorNormalizationAutoCalculator_submit___block_invoke;
    v24[3] = &unk_1E5D81670;
    v25 = v5;
    [v7 submit:v24];
  }
  else
  {
    v7 = [MEMORY[0x1E4F7A438] unsupportedError:@"Feature Unavailable" object:0];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
    ((void (**)(void, void *))v5)[2](v5, v10);
  }
}

void __45__PIColorNormalizationAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v25 = 0;
  v3 = [a2 result:&v25];
  id v4 = v25;
  if (v3)
  {
    v5 = [v3 observations];
    id v6 = [v5 firstObject];

    if (v6)
    {
      uint64_t v20 = a1;
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v8 = [v6 adjustmentKeys];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            v14 = [v6 adjustmentValuesForKey:v13];
            [v7 setObject:v14 forKeyedSubscript:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v28 count:16];
        }
        while (v10);
      }

      id v15 = objc_alloc(MEMORY[0x1E4F7A660]);
      v26[0] = @"version";
      BOOL v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "requestRevision"));
      v27[0] = v16;
      v27[1] = v7;
      v26[1] = @"adjustments";
      v26[2] = @"score";
      v27[2] = &unk_1F000A168;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
      v18 = (void *)[v15 initWithResult:v17];

      a1 = v20;
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x1E4F7A660]);
      id v7 = [MEMORY[0x1E4F7A438] missingError:@"No color normalization available" object:0];
      v18 = (void *)[v19 initWithError:v7];
    }
  }
  else
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PIColorNormalizationAutoCalculator)initWithComposition:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PIColorNormalizationAutoCalculator;
  v3 = [(NURenderRequest *)&v9 initWithComposition:a3];
  id v4 = +[PIPipelineFilters stopAtTagIncludeOrientationFilter:@"/Master/Source"];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(NURenderRequest *)v3 setPipelineFilters:v5];

  [(NURenderRequest *)v3 setSampleMode:2];
  long long v7 = *MEMORY[0x1E4F1FA48];
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(PIColorNormalizationAutoCalculator *)v3 setTime:&v7];
  return v3;
}

+ (id)autoCalculatorWithImageData:(id)a3 orientation:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v15 = NUAssertLogger_2110();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v19 = NUAssertLogger_2110();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        long long v23 = dispatch_get_specific(*v17);
        long long v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        id v26 = [v24 callStackSymbols];
        v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v23;
        __int16 v30 = 2114;
        uint64_t v31 = v27;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      long long v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v6 = v5;
  long long v7 = [MEMORY[0x1E4F1E050] imageWithData:v5];
  if (v7)
  {
    uint64_t v8 = +[PIPhotoEditHelper imageSourceWithCIImage:v7 orientation:a4];
    id v9 = +[PIPhotoEditHelper newComposition];
    id v10 = +[PIPhotoEditHelper newCompositionControllerWithComposition:v9];

    [v10 setSource:v8 mediaType:1];
    uint64_t v11 = [PIColorNormalizationAutoCalculator alloc];
    v12 = [v10 composition];
    uint64_t v13 = [(PIColorNormalizationAutoCalculator *)v11 initWithComposition:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (BOOL)isAvailable
{
  return 1;
}

@end