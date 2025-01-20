@interface ICBackgroundTaskScheduler
+ (ICBackgroundTaskScheduler)sharedScheduler;
- (ICBackgroundTaskScheduler)init;
- (void)registerTask:(id)a3;
- (void)scheduleTask:(Class)a3 completion:(id)a4;
@end

@implementation ICBackgroundTaskScheduler

- (void)registerTask:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() makeTaskRequest];
  v5 = [v4 identifier];
  v6 = [MEMORY[0x1E4F18B50] sharedScheduler];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __42__ICBackgroundTaskScheduler_registerTask___block_invoke;
  v15 = &unk_1E64A7778;
  id v7 = v5;
  id v16 = v7;
  id v8 = v3;
  id v17 = v8;
  uint64_t v9 = [v6 registerForTaskWithIdentifier:v7 usingQueue:0 launchHandler:&v12];

  v10 = os_log_create("com.apple.notes", "BackgroundTask");
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICBackgroundTaskScheduler registerTask:]();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[ICBackgroundTaskScheduler registerTask:]();
  }

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "didRegister:", v9, v12, v13, v14, v15, v16);
  }
}

- (void)registerTask:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Registered {id: %@}", v2, v3, v4, v5, v6);
}

+ (ICBackgroundTaskScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1) {
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)sharedScheduler_sharedScheduler;
  return (ICBackgroundTaskScheduler *)v2;
}

void __44__ICBackgroundTaskScheduler_sharedScheduler__block_invoke()
{
  v0 = objc_alloc_init(ICBackgroundTaskScheduler);
  uint64_t v1 = (void *)sharedScheduler_sharedScheduler;
  sharedScheduler_sharedScheduler = (uint64_t)v0;
}

- (ICBackgroundTaskScheduler)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICBackgroundTaskScheduler;
  return [(ICBackgroundTaskScheduler *)&v3 init];
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2;
  v10[3] = &unk_1E64A5650;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  objc_copyWeak(&v13, &location);
  id v4 = objc_loadWeakRetained(&location);
  [v4 setExpirationHandler:v10];

  uint64_t v5 = os_log_create("com.apple.notes", "BackgroundTask");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __42__ICBackgroundTaskScheduler_registerTask___block_invoke_cold_1();
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ICBackgroundTaskScheduler_registerTask___block_invoke_11;
  v7[3] = &unk_1E64A7750;
  uint8_t v6 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  objc_copyWeak(&v9, &location);
  [v6 runTaskWithCompletion:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "BackgroundTask");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 40) handleTaskExpiration];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setTaskCompletedWithSuccess:1];
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "BackgroundTask");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__ICBackgroundTaskScheduler_registerTask___block_invoke_11_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = WeakRetained;
    uint64_t v8 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__ICBackgroundTaskScheduler_registerTask___block_invoke_11_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = WeakRetained;
    uint64_t v8 = 1;
  }
  [WeakRetained setTaskCompletedWithSuccess:v8];
}

- (void)scheduleTask:(Class)a3 completion:(id)a4
{
  id v5 = a4;
  uint8_t v6 = [(objc_class *)a3 makeTaskRequest];
  id v7 = [MEMORY[0x1E4F18B50] sharedScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke;
  v10[3] = &unk_1E64A77C8;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 getPendingTaskRequestsWithCompletionHandler:v10];
}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke(uint64_t a1, void *a2)
{
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_2;
  v18[3] = &unk_1E64A77A0;
  id v4 = (id *)(a1 + 32);
  id v19 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(a2, "ic_objectPassingTest:", v18);
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F18B50] sharedScheduler];
    id v9 = *v4;
    id v17 = 0;
    int v10 = [v8 submitTaskRequest:v9 error:&v17];
    id v11 = v17;

    id v12 = os_log_create("com.apple.notes", "BackgroundTask");
    id v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_1(v4);
      }

      uint64_t v14 = *(void *)(a1 + 40);
      if (!v14) {
        goto LABEL_16;
      }
      v15 = *(void (**)(void))(v14 + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_2(v4, (uint64_t)v11, v13);
      }

      uint64_t v16 = *(void *)(a1 + 40);
      if (!v16) {
        goto LABEL_16;
      }
      v15 = *(void (**)(void))(v16 + 16);
    }
    v15();
LABEL_16:

    goto LABEL_17;
  }
  uint8_t v6 = os_log_create("com.apple.notes", "BackgroundTask");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_3(v4);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, 1, 0);
  }
LABEL_17:
}

uint64_t __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)registerTask:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Failed registering {id: %@}", v1, 0xCu);
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Running {id: %@}", v2, v3, v4, v5, v6);
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Expiring {id: %@}", v2, v3, v4, v5, v6);
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Finished {id: %@}", v2, v3, v4, v5, v6);
}

void __42__ICBackgroundTaskScheduler_registerTask___block_invoke_11_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_ERROR, "Failed running {id: %@, error: %@}", v2, 0x16u);
}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_1(id *a1)
{
  os_log_t v1 = [*a1 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Scheduled {id: %@}", v4, v5, v6, v7, v8);
}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 identifier];
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Failed scheduling {id: %@, error: %@}", v6, 0x16u);
}

void __53__ICBackgroundTaskScheduler_scheduleTask_completion___block_invoke_cold_3(id *a1)
{
  os_log_t v1 = [*a1 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Already scheduled {id: %@}", v4, v5, v6, v7, v8);
}

@end