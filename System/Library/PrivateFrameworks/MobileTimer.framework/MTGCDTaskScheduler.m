@interface MTGCDTaskScheduler
- (void)_scheduleTask:(id)a3 withCompletion:(id)a4;
- (void)scheduleTask:(id)a3;
- (void)scheduleTaskGroup:(id)a3;
@end

@implementation MTGCDTaskScheduler

- (void)_scheduleTask:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 delay];
  double v9 = v8;
  v10 = MTLogForCategory(0);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 <= 0.0)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ executing %{public}@ immediately", buf, 0x16u);
    }

    v16 = [v6 completableBlock];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke;
    v21[3] = &unk_1E5915B68;
    id v22 = v7;
    v17 = (void (*)(void *, void *))v16[2];
    id v12 = v7;
    v17(v16, v21);

    id v15 = v22;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}@", buf, 0x16u);
    }

    id v12 = (id)objc_opt_new();
    [v6 delay];
    double v14 = v13;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_13;
    v18[3] = &unk_1E59150D0;
    id v19 = v6;
    id v20 = v7;
    id v15 = v7;
    [v12 startTimer:v18 block:v14];
  }
}

uint64_t __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_13(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completableBlock];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_2;
  v3[3] = &unk_1E5915B68;
  id v4 = *(id *)(a1 + 40);
  ((void (**)(void, void *))v2)[2](v2, v3);
}

uint64_t __51__MTGCDTaskScheduler__scheduleTask_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scheduleTask:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MTLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    double v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}@", buf, 0x16u);
  }

  id v6 = MTLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    double v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opening transaction for %{public}@", buf, 0x16u);
  }

  id v7 = (void *)os_transaction_create();
  objc_initWeak((id *)buf, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__MTGCDTaskScheduler_scheduleTask___block_invoke;
  v9[3] = &unk_1E59171C8;
  objc_copyWeak(&v11, (id *)buf);
  v9[4] = self;
  id v8 = v7;
  id v10 = v8;
  [(MTGCDTaskScheduler *)self _scheduleTask:v4 withCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __35__MTGCDTaskScheduler_scheduleTask___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = MTLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543618;
    uint64_t v6 = v4;
    __int16 v7 = 2114;
    id v8 = WeakRetained;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ closing transaction for %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)scheduleTaskGroup:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 tasks];
  uint64_t v6 = [v5 count];

  __int16 v7 = MTLogForCategory(0);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v4;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}@", buf, 0x16u);
    }

    uint64_t v9 = (uint64_t)dispatch_group_create();
    id v10 = MTLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v4;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ opening transaction for %{public}@", buf, 0x16u);
    }

    v18 = (void *)os_transaction_create();
    id v19 = v4;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = [v4 tasks];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * v15);
          dispatch_group_enter((dispatch_group_t)v9);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke;
          v23[3] = &unk_1E59150A8;
          id v24 = (id)v9;
          [(MTGCDTaskScheduler *)self _scheduleTask:v16 withCompletion:v23];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke_2;
    block[3] = &unk_1E5915078;
    block[4] = self;
    id v4 = v19;
    id v21 = v19;
    id v22 = v18;
    id v17 = v18;
    dispatch_group_notify((dispatch_group_t)v9, MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v4;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ has no tasks", buf, 0x16u);
    }

    uint64_t v9 = [v4 completionBlock];
    (*(void (**)(void))(v9 + 16))();
  }
}

void __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke(uint64_t a1)
{
}

void __40__MTGCDTaskScheduler_scheduleTaskGroup___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ completed", (uint8_t *)&v9, 0x16u);
  }

  int v5 = [*(id *)(a1 + 40) completionBlock];
  v5[2]();

  uint64_t v6 = MTLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ closing transaction for %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

@end