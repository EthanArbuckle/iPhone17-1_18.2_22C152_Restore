@interface HDSPAppPredictionClient
- (HDSPAppPredictionClient)initWithSleepFocusModeBridge:(id)a3;
- (HKSPSleepFocusModeBridge)sleepFocusModeBridge;
- (void)createSuggestedHomeScreenPageWithCompletion:(id)a3;
@end

@implementation HDSPAppPredictionClient

- (HDSPAppPredictionClient)initWithSleepFocusModeBridge:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPAppPredictionClient;
  v6 = [(HDSPAppPredictionClient *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sleepFocusModeBridge, a3);
    v8 = v7;
  }

  return v7;
}

- (void)createSuggestedHomeScreenPageWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = (id)objc_opt_class();
    id v6 = v14;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating suggested home screen page", buf, 0xCu);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F250F0]);
  [v7 setPageType:4];
  id v8 = objc_alloc_init(MEMORY[0x263F250F8]);
  id v9 = objc_alloc_init(MEMORY[0x263F250E8]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__HDSPAppPredictionClient_createSuggestedHomeScreenPageWithCompletion___block_invoke;
  v11[3] = &unk_2645DAE30;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 suggestedPagesWithFilter:v7 layoutOptions:v8 completionHandler:v11];
}

void __71__HDSPAppPredictionClient_createSuggestedHomeScreenPageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (![v5 count])
    {
      id v7 = HKSPLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v34 = (id)objc_opt_class();
        id v12 = v34;
        _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] no suggested pages found", buf, 0xCu);
      }
      goto LABEL_4;
    }
    id v8 = *(void **)(*(void *)(a1 + 32) + 8);
    id v31 = 0;
    id v9 = [v8 sleepFocusConfiguration:&v31];
    id v10 = v31;
    if (v10)
    {
      v11 = HKSPLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v34 = v29;
        __int16 v35 = 2114;
        uint64_t v36 = (uint64_t)v10;
        id v30 = v29;
        _os_log_error_impl(&dword_221A52000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get sleep focus mode: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v11 = HKSPLogForCategory();
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v13)
        {
          id v14 = objc_opt_class();
          id v15 = v14;
          uint64_t v16 = [v5 count];
          *(_DWORD *)buf = 138543618;
          id v34 = v14;
          __int16 v35 = 2048;
          uint64_t v36 = v16;
          _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] found %ld pages, creating home screen request", buf, 0x16u);
        }
        id v17 = objc_alloc(MEMORY[0x263F79380]);
        v18 = [v9 uuid];
        v19 = [v18 UUIDString];
        v20 = (void *)[v17 initWithFocusModeIdentifier:v19];

        v21 = [v5 firstObject];
        v32 = v21;
        v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
        [v20 setProactivePages:v22];

        [v20 setAppendExistingPages:1];
        [MEMORY[0x263F79388] addSuggestedHomeScreenPageWithRequest:v20];
        v23 = HKSPLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v34 = v24;
          id v25 = v24;
          _os_log_impl(&dword_221A52000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] submitted home screen request", buf, 0xCu);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        goto LABEL_19;
      }
      if (v13)
      {
        v27 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v34 = v27;
        id v28 = v27;
        _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] no sleep focus mode found", buf, 0xCu);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v34 = (id)objc_opt_class();
    __int16 v35 = 2114;
    uint64_t v36 = (uint64_t)v6;
    id v26 = v34;
    _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get suggested pages: %{public}@", buf, 0x16u);
  }
LABEL_4:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_20:
}

- (HKSPSleepFocusModeBridge)sleepFocusModeBridge
{
  return self->_sleepFocusModeBridge;
}

- (void).cxx_destruct
{
}

@end