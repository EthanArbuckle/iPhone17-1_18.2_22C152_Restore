@interface PIRedEyeAutoCalculator
- (BOOL)force;
- (id)_options;
- (void)_configureRequest:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)submit:(id)a3;
@end

@implementation PIRedEyeAutoCalculator

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)submit:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v15 = NUAssertLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v19 = NUAssertLogger();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        __int16 v34 = 2114;
        v35 = v25;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  BOOL v5 = [(PIRedEyeAutoCalculator *)self force];
  v6 = [(PIRedEyeAutoCalculator *)self _options];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F7A5F0]) initWithRequest:self options:v6];
  v8 = [(NURenderRequest *)self internalComposition];
  v9 = [v8 objectForKeyedSubscript:@"raw"];

  if (v9)
  {
    v10 = +[PIPipelineFilters sourceFilterNoOrientation];
    v31 = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v7 setPipelineFilters:v11];
  }
  else
  {
    v10 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/ShowOriginalSource"];
    v30 = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    [v7 setPipelineFilters:v11];
  }

  [(PIRedEyeAutoCalculator *)self _configureRequest:v7];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithRequest:self];
  [v12 setName:@"PIRedEyeAutoCalculator-getLensInfo"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __33__PIRedEyeAutoCalculator_submit___block_invoke;
  v26[3] = &unk_1E5D812B8;
  id v13 = v7;
  id v27 = v13;
  BOOL v29 = v5;
  id v14 = v4;
  id v28 = v14;
  [v12 submit:v26];
}

void __33__PIRedEyeAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v23 = 0;
  v3 = [a2 result:&v23];
  id v4 = v23;
  if (!v3) {
    goto LABEL_10;
  }
  id v20 = v4;
  BOOL v5 = [v3 properties];
  v6 = [v5 metadata];

  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2F888]];
  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2F890]];
  v10 = [v9 lowercaseString];

  if (![v8 isEqualToString:@"Apple"]) {
    goto LABEL_5;
  }
  if ([v10 containsString:@"front"]) {
    int v11 = [v10 containsString:@"camera"];
  }
  else {
LABEL_5:
  }
    int v11 = 0;
  int v12 = flashFired(v7);
  id v13 = [*(id *)(a1 + 32) options];
  id v14 = (void *)[v13 mutableCopy];

  [v14 setObject:v6 forKeyedSubscript:@"properties"];
  [*(id *)(a1 + 32) setOptions:v14];

  int v15 = *(unsigned char *)(a1 + 48) ? 1 : v12 & (v11 ^ 1);
  id v4 = v20;
  if (v15 != 1)
  {
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = objc_alloc(MEMORY[0x1E4F7A660]);
    v17 = (void *)[v19 initWithResult:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);
  }
  else
  {
LABEL_10:
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __33__PIRedEyeAutoCalculator_submit___block_invoke_2;
    v21[3] = &unk_1E5D81670;
    v16 = *(void **)(a1 + 32);
    id v22 = *(id *)(a1 + 40);
    [v16 submit:v21];
    v17 = v22;
  }
}

void __33__PIRedEyeAutoCalculator_submit___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = 0;
  v3 = [a2 result:&v10];
  id v4 = v10;
  BOOL v5 = [v3 data];

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:@"inputCorrectionInfo"];
    if ([v6 count])
    {
      id v7 = objc_alloc(MEMORY[0x1E4F7A660]);
      v8 = v5;
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F7A660]);
      v8 = (void *)MEMORY[0x1E4F1CC08];
    }
    v9 = (void *)[v7 initWithResult:v8];
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_configureRequest:(id)a3
{
  id v4 = a3;
  [v4 setSampleMode:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x100000];
  [v4 setScalePolicy:v3];
}

- (id)_options
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NURenderRequest *)self composition];
  v3 = [v2 objectForKeyedSubscript:@"orientation"];
  id v4 = [v3 objectForKeyedSubscript:@"value"];
  BOOL v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 integerValue];
  }
  else {
    uint64_t v6 = 1;
  }
  id v10 = @"orientation";
  id v7 = [NSNumber numberWithInteger:v6];
  v11[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

@end