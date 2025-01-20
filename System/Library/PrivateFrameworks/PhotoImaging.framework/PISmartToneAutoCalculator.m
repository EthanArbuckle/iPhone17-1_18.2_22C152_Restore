@interface PISmartToneAutoCalculator
- (id)submitSynchronous:(id *)a3;
- (void)submit:(id)a3;
@end

@implementation PISmartToneAutoCalculator

- (void)submit:(id)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F7A408];
  id v37 = v4;
  v6 = [(NURenderRequest *)self composition];
  int v7 = [v5 isHDRComposition:v6];

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v8 = (os_log_t *)MEMORY[0x1E4F7A758];
  v9 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    v10 = "No";
    if (v7) {
      v10 = "Yes";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v10;
    _os_log_impl(&dword_1A9680000, v9, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator submit isHDRComposition: %s", buf, 0xCu);
  }
  if (!v37)
  {
    v26 = NUAssertLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v30 = NUAssertLogger();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v36;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v11 = dispatch_queue_create("PISmartToneAutoCalculator", 0);
  v12 = [(NURenderRequest *)self responseQueue];
  dispatch_set_target_queue(v11, v12);

  if (v7)
  {
    v13 = +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:@"CISmartTone"];
  }
  else
  {
    v13 = @"CISmartTone";
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F7A4D8]) initWithRequest:self dataExtractor:v13 options:0];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x40000];
  [v14 setScalePolicy:v15];

  [v14 setSampleMode:1];
  v16 = +[PIPipelineFilters stopAtTagIncludeGeometryFilter:@"pre-Adjustments"];
  v53[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  [v14 setPipelineFilters:v17];

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v14;
    _os_log_impl(&dword_1A9680000, v18, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator smartTone request submitting: %{public}@", buf, 0xCu);
  }
  [MEMORY[0x1E4F7A648] begin];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__24787;
  v51 = __Block_byref_object_dispose__24788;
  id v52 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __36__PISmartToneAutoCalculator_submit___block_invoke;
  v45[3] = &unk_1E5D81268;
  v45[4] = buf;
  [v14 submit:v45];

  if (v7)
  {
    v19 = +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:@"CILocalLight"];
  }
  else
  {
    v19 = @"CILocalLight";
  }
  [v14 setDataExtractor:v19];
  v20 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"pre-Adjustments"];
  v48 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  [v14 setPipelineFilters:v21];

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__24787;
  v43[4] = __Block_byref_object_dispose__24788;
  id v44 = 0;
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v22 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v46 = 138543362;
    v47 = v14;
    _os_log_impl(&dword_1A9680000, v22, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight request submitting: %{public}@", v46, 0xCu);
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __36__PISmartToneAutoCalculator_submit___block_invoke_29;
  v42[3] = &unk_1E5D81268;
  v42[4] = v43;
  [v14 submit:v42];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v23 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v46 = 0;
    _os_log_impl(&dword_1A9680000, v23, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator going to commit and wait", v46, 2u);
  }
  v24 = (void *)MEMORY[0x1E4F7A648];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __36__PISmartToneAutoCalculator_submit___block_invoke_30;
  v38[3] = &unk_1E5D81290;
  v40 = buf;
  v41 = v43;
  id v25 = v37;
  id v39 = v25;
  [v24 commitAndNotifyOnQueue:v11 withBlock:v38];

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(buf, 8);
}

void __36__PISmartToneAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v5 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A9680000, v5, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator global result: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void __36__PISmartToneAutoCalculator_submit___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v5 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A9680000, v5, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight result: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void __36__PISmartToneAutoCalculator_submit___block_invoke_30(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v3 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v4 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9680000, v4, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator committed", buf, 2u);
  }
  v5 = *(void **)(*(void *)(a1[5] + 8) + 40);
  id v21 = 0;
  uint64_t v6 = [v5 result:&v21];
  id v7 = v21;
  uint64_t v8 = [v6 data];

  uint64_t v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v20 = v7;
  v10 = [v9 result:&v20];
  id v11 = v20;

  v12 = [v10 data];

  if (v8) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (v11)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v11];
      (*(void (**)(void))(a1[4] + 16))();
      if (*v2 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
      }
      v15 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v11;
        _os_log_impl(&dword_1A9680000, v15, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator error: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (*v2 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
      }
      v19 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9680000, v19, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator coalesced", buf, 2u);
      }
    }
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v16 addEntriesFromDictionary:v8];
    [v16 addEntriesFromDictionary:v12];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v16];
    (*(void (**)(void))(a1[4] + 16))();
    if (*v2 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
    }
    v18 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9680000, v18, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator completed", buf, 2u);
    }
  }
}

- (id)submitSynchronous:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F7A408];
  uint64_t v6 = [(NURenderRequest *)self composition];
  int v7 = [v5 isHDRComposition:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F7A758];
  v10 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "No";
    if (v7) {
      id v11 = "Yes";
    }
    *(_DWORD *)buf = 136315138;
    v34 = v11;
    _os_log_impl(&dword_1A9680000, v10, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator submitSynchronous isHDRComposition: %s", buf, 0xCu);
  }
  v12 = dispatch_queue_create("PISmartToneAutoCalculator", 0);
  BOOL v13 = [(NURenderRequest *)self responseQueue];
  dispatch_set_target_queue(v12, v13);

  if (v7)
  {
    v14 = +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:@"CISmartTone"];
  }
  else
  {
    v14 = @"CISmartTone";
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F7A4D8]) initWithRequest:self dataExtractor:v14 options:0];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x40000];
  [v15 setScalePolicy:v16];

  [v15 setSampleMode:1];
  v17 = +[PIPipelineFilters stopAtTagIncludeGeometryFilter:@"pre-Adjustments"];
  v32 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v15 setPipelineFilters:v18];

  if (*v8 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v19 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = (const char *)v15;
    _os_log_impl(&dword_1A9680000, v19, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator smartTone request submitting: %{public}@", buf, 0xCu);
  }
  id v20 = [v15 submitGenericSynchronous:a3];
  id v21 = [v20 data];

  if (*v8 != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
  }
  v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v21;
    _os_log_impl(&dword_1A9680000, v22, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator smartTone result: %{public}@", buf, 0xCu);
  }
  if (v21)
  {

    if (v7)
    {
      v14 = +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:@"CILocalLight"];
    }
    else
    {
      v14 = @"CILocalLight";
    }
    [v15 setDataExtractor:v14];
    uint64_t v24 = [MEMORY[0x1E4F7A618] stopAtTagFilter:@"pre-Adjustments"];
    BOOL v31 = v24;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v15 setPipelineFilters:v25];

    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
    }
    v26 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = (const char *)v15;
      _os_log_impl(&dword_1A9680000, v26, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight request submitting: %{public}@", buf, 0xCu);
    }
    v27 = [v15 submitGenericSynchronous:a3];
    v28 = [v27 data];

    if (*v8 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24763);
    }
    v29 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v28;
      _os_log_impl(&dword_1A9680000, v29, OS_LOG_TYPE_DEFAULT, "PISmartToneAutoCalculator localLight result: %{public}@", buf, 0xCu);
    }
    if (v28)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v23 addEntriesFromDictionary:v21];
      [v23 addEntriesFromDictionary:v28];
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

@end