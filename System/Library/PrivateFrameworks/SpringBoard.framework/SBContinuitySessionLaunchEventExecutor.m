@interface SBContinuitySessionLaunchEventExecutor
- (void)_executeDebugLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5;
- (void)_executeNotificationLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5;
- (void)_executeWidgetLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5;
- (void)executeLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5;
@end

@implementation SBContinuitySessionLaunchEventExecutor

- (void)executeLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v10 = (void (**)(void))a5;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBContinuitySessionLaunchEventExecutor.m", 32, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v11 = [v9 type];
  int v12 = [v11 isEqualToString:@"notification"];

  if (v12)
  {
    [(SBContinuitySessionLaunchEventExecutor *)self _executeNotificationLaunchEvent:v9 animatedly:v6 completion:v10];
  }
  else
  {
    v13 = [v9 type];
    int v14 = [v13 isEqualToString:@"widget"];

    if (v14)
    {
      [(SBContinuitySessionLaunchEventExecutor *)self _executeWidgetLaunchEvent:v9 animatedly:v6 completion:v10];
    }
    else
    {
      v15 = [v9 type];
      int v16 = [v15 isEqualToString:@"debug"];

      if (v16)
      {
        [(SBContinuitySessionLaunchEventExecutor *)self _executeDebugLaunchEvent:v9 animatedly:v6 completion:v10];
      }
      else
      {
        v17 = SBLogContinuitySession();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SBContinuitySessionLaunchEventExecutor executeLaunchEvent:animatedly:completion:]((uint64_t)v9, v17);
        }

        v10[2](v10);
      }
    }
  }
}

- (void)_executeNotificationLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  v8 = SBLogContinuitySession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Building foreground action for launch event %{public}@", buf, 0xCu);
  }

  id v9 = [v6 payload];
  int v12 = v6;
  id v10 = v7;
  id v11 = v6;
  UNSBuildForegroundAction();
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = SBLogContinuitySession();
  id v11 = v10;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v12;
      __int16 v28 = 2114;
      id v29 = v7;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Finished building foreground action for launch event %{public}@ - bundleIdentifier: %{public}@ - calling openApplication:", buf, 0x16u);
    }

    id v13 = v8;
    id v14 = v13;
    if (!*(unsigned char *)(a1 + 48))
    {
      uint64_t v15 = [v13 dictionary];
      int v16 = (void *)[v15 mutableCopy];
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v19 = v18;

      [v19 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FA7128]];
      uint64_t v20 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v19];

      id v14 = (void *)v20;
    }
    v21 = [MEMORY[0x1E4F629E0] continuityDisplayService];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_19;
    v22[3] = &unk_1E6B02EE0;
    id v23 = *(id *)(a1 + 32);
    id v24 = v7;
    id v25 = *(id *)(a1 + 40);
    [v21 openApplication:v24 withOptions:v14 completion:v22];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_cold_1(a1, (uint64_t)v9, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_19(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v5 = v4;
  BSDispatchMain();
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = SBLogContinuitySession();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v5;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Foreground application launch succeed for launch event %{public}@ bundleIdentifier %{public}@", buf, 0x16u);
  }

  id v7 = [*(id *)(a1 + 40) payload];
  UNSDidCompleteDeliveryOfForegroundAction();

  id v8 = +[SBWorkspace mainWorkspace];
  id v9 = [v8 currentTransaction];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  id v14 = [v13 toApplicationSceneEntities];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_22;
  v18[3] = &unk_1E6AF5C80;
  id v19 = *(id *)(a1 + 48);
  int v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v18);

  if (v15 && [v13 isRunning])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_24;
    v16[3] = &unk_1E6B02EB8;
    id v17 = *(id *)(a1 + 56);
    [v13 registerBlockObserver:v16];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [a2 sceneHandle];
  id v4 = [v3 application];
  uint64_t v5 = [v4 bundleIdentifier];
  uint64_t v6 = [v2 isEqualToString:v5];

  return v6;
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_24(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_3;
  v3[3] = &unk_1E6B02E90;
  id v4 = *(id *)(a1 + 32);
  [a2 addTransactionDidCompleteBlock:v3];
}

uint64_t __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_executeWidgetLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void (**)(void))a5;
  id v11 = SBLogContinuitySession();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = v9;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Building foreground action for launch event %{public}@", buf, 0xCu);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F58F50]);
  id v13 = [v9 payload];
  id v14 = (void *)[v12 initWithData:v13];

  if (v14)
  {
    BOOL v38 = v6;
    int v15 = +[SBContinuitySessionManager sharedInstance];
    int v16 = [v15 currentSession];
    id v17 = [v16 mainWindowScene];

    if (!v17)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2 object:self file:@"SBContinuitySessionLaunchEventExecutor.m" lineNumber:110 description:@"could not get continuityScene"];
    }
    id v18 = +[SBApplicationController sharedInstance];
    id v19 = [v14 extensionIdentity];
    uint64_t v20 = [v19 containerBundleIdentifier];
    v37 = v18;
    uint64_t v21 = [v18 applicationWithBundleIdentifier:v20];

    __int16 v22 = +[SBMainWorkspace sharedInstance];
    uint64_t v23 = [SBDeviceApplicationSceneEntity alloc];
    uint64_t v24 = [v17 sceneManager];
    id v25 = [v17 _sbDisplayConfiguration];
    v26 = [v25 identity];
    uint64_t v27 = [(SBDeviceApplicationSceneEntity *)v23 initWithApplication:v21 sceneHandleProvider:v24 displayIdentity:v26];

    __int16 v28 = [v14 action];
    if (v28)
    {
      id v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v28];
      [(SBApplicationSceneEntity *)v27 addActions:v29];
    }
    if (v38) {
      uint64_t v30 = 0;
    }
    else {
      uint64_t v30 = 4;
    }
    v31 = [v17 _sbDisplayConfiguration];
    v32 = [v22 createRequestForApplicationActivation:v27 withDisplayConfiguration:v31 options:v30];

    if (v32)
    {
      v33 = [MEMORY[0x1E4F4F7F8] processHandle];
      [v32 setOriginatingProcess:v33];

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke;
      v39[3] = &unk_1E6AFA2A0;
      id v40 = v9;
      id v41 = v14;
      v42 = v10;
      id v34 = (id)[v32 addCompletionHandler:v39];
      [v22 executeTransitionRequest:v32];
    }
    else if (v10)
    {
      v10[2](v10);
    }
  }
  else
  {
    v35 = SBLogContinuitySession();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[SBContinuitySessionLaunchEventExecutor _executeWidgetLaunchEvent:animatedly:completion:]((uint64_t)v9, v35);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

uint64_t __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogContinuitySession();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) extensionIdentity];
      id v8 = [v7 containerBundleIdentifier];
      id v9 = [*(id *)(a1 + 40) action];
      int v11 = 138543874;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2114;
      int v16 = v9;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Foreground widget launch succeed for launch event %{public}@ bundleIdentifier %{public}@ bsAction %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke_cold_1(a1, v5);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_executeDebugLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = SBLogContinuitySession();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Executing debug launch event %{public}@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F629E0] continuityDisplayService];
  if (a4)
  {
    int v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v19 = *MEMORY[0x1E4FA7128];
    uint64_t v20 = MEMORY[0x1E4F1CC38];
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  }
  uint64_t v12 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v11];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke;
  v15[3] = &unk_1E6B02EE0;
  id v16 = v7;
  uint64_t v17 = @"com.apple.tips";
  id v18 = v8;
  id v13 = v8;
  id v14 = v7;
  [v10 openApplication:@"com.apple.tips" withOptions:v12 completion:v15];
}

void __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  v3 = SBLogContinuitySession();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Debug application launch succeed for launch event %{public}@ bundleIdentifier %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)executeLaunchEvent:(uint64_t)a1 animatedly:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Don't know how to handle launch event %{public}@", (uint8_t *)&v2, 0xCu);
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to build foreground action for launch event: %{public}@ - error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_16(&dword_1D85BA000, v0, v1, "Foreground application launch failed for launch event: %{public}@ bundleIdentifier %{public}@: %{public}@");
}

- (void)_executeWidgetLaunchEvent:(uint64_t)a1 animatedly:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to build foreground action for launch event: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) extensionIdentity];
  __int16 v6 = [v5 containerBundleIdentifier];
  uint64_t v7 = [*(id *)(a1 + 40) action];
  int v8 = 138543874;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  id v13 = v7;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Foreground widget launch failed for launch event %{public}@ bundleIdentifier %{public}@ bsAction %{public}@", (uint8_t *)&v8, 0x20u);
}

void __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_16(&dword_1D85BA000, v0, v1, "Debug application launch failed for launch event: %{public}@ bundleIdentifier %{public}@: %{public}@");
}

@end