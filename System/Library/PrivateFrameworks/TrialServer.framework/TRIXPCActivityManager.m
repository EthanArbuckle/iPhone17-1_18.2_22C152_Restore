@interface TRIXPCActivityManager
- (TRIServerContext)context;
- (TRITaskQueue)taskQueue;
- (TRIXPCActivityManager)initWithDispatchQueue:(id)a3;
- (void)_registerCellularActivityWithDelay:(double)a3;
- (void)_registerClientTriggeredActivities;
- (void)_registerFetchExperimentsActivity;
- (void)_registerHotfixTargetingActivity;
- (void)_registerMaintenanceWorkActivity;
- (void)_registerPlaceholderTaskQueueActivity;
- (void)_registerPostUpgradeActivity;
- (void)_registerPostUpgradeActivityRequireInexpensiveNetworking;
- (void)_registerRetryFailuresActivity;
- (void)_scheduleFetchTaskWithActivityDescriptor:(id)a3 label:(id)a4;
- (void)_scheduleMaintenanceTaskWithActivityDescriptor:(id)a3 label:(id)a4;
- (void)_setDelaySeconds:(int64_t)a3 forXPCActivity:(id)a4 withLabel:(id)a5 replacementCriteria:(id)a6;
- (void)_setJitterForXPCActivity:(id)a3 withLabel:(id)a4 replacementCriteria:(id)a5;
- (void)postponeCellularActivity;
- (void)registerActivities;
- (void)registerSetupAssistantFetchActivity;
- (void)setContext:(id)a3;
- (void)setTaskQueue:(id)a3;
@end

@implementation TRIXPCActivityManager

- (TRIXPCActivityManager)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIXPCActivityManager;
  v6 = [(TRIXPCActivityManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }

  return v7;
}

- (void)registerActivities
{
  [(TRIXPCActivityManager *)self _registerRetryFailuresActivity];
  [(TRIXPCActivityManager *)self _registerFetchExperimentsActivity];
  [(TRIXPCActivityManager *)self _registerCellularActivityWithDelay:0.0];
  [(TRIXPCActivityManager *)self _registerPostUpgradeActivity];
  [(TRIXPCActivityManager *)self registerSetupAssistantFetchActivity];
  [(TRIXPCActivityManager *)self _registerPostUpgradeActivityRequireInexpensiveNetworking];
  [(TRIXPCActivityManager *)self _registerPlaceholderTaskQueueActivity];
  [(TRIXPCActivityManager *)self _registerClientTriggeredActivities];
  [(TRIXPCActivityManager *)self _registerHotfixTargetingActivity];
  [(TRIXPCActivityManager *)self _registerMaintenanceWorkActivity];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/System/Library/LaunchDaemons/com.apple.triald.plist"];
  if (v3
    && (v4 = v3,
        [v3 objectForKey:@"LaunchEvents"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5)
    && ([v5 objectForKey:@"com.apple.xpc.activity"],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v8 = [v6 allKeys];
    objc_super v9 = [v7 setWithArray:v8];

    +[TRIXPCActivitySupport assertRegistrationOfLaunchdPlistActivities:v9];
  }
  else
  {
    v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "failed to call assertRegistrationOfLaunchdPlistActivities", v10, 2u);
    }
  }
}

- (void)postponeCellularActivity
{
}

- (void)_registerRetryFailuresActivity
{
  v3 = +[TRILaunchDaemonActivityDescriptor retryFailuresDescriptor];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke;
  v4[3] = &unk_1E6BB8200;
  v4[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:0 asyncHandler:v4];
}

void __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke_2;
  block[3] = &unk_1E6BB9DC0;
  block[4] = v4;
  v10 = &v11;
  id v6 = v3;
  id v9 = v6;
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v12 + 24))
  {
    v7 = [v6 completion];
    v7[2](v7, 1);
  }
  _Block_object_dispose(&v11, 8);
}

void __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke_2(void *a1)
{
  if (*(void *)(a1[4] + 24))
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v1 = a1[5];
    v2 = *(void **)(a1[4] + 24);
    [v2 resumeWithXPCActivityDescriptor:v1 executeWhenSuspended:0];
  }
  else
  {
    id v3 = TRILogCategory_Server();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_error_impl(&dword_1DA291000, v3, OS_LOG_TYPE_ERROR, "Can't carry out retry-failures activity, task queue not initialized.", v4, 2u);
    }
  }
}

- (void)_setDelaySeconds:(int64_t)a3 forXPCActivity:(id)a4 withLabel:(id)a5 replacementCriteria:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__TRIXPCActivityManager__setDelaySeconds_forXPCActivity_withLabel_replacementCriteria___block_invoke;
  v17[3] = &unk_1E6BB9DE8;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int64_t v21 = a3;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(dispatchQueue, v17);
}

void __87__TRIXPCActivityManager__setDelaySeconds_forXPCActivity_withLabel_replacementCriteria___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 32));
  if (!v2)
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v17 = 138543362;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: criteria not found, using replacement and updating delay.", (uint8_t *)&v17, 0xCu);
    }

    id v11 = *(id *)(a1 + 48);
    id v3 = v11;
    id v12 = (const char *)*MEMORY[0x1E4F14170];
    int64_t v10 = *(void *)(a1 + 56);
    goto LABEL_12;
  }
  id v3 = v2;
  uint64_t v4 = (const char *)*MEMORY[0x1E4F14170];
  int64_t int64 = xpc_dictionary_get_int64(v2, (const char *)*MEMORY[0x1E4F14170]);
  if (int64 - *(void *)(a1 + 56) >= 0) {
    unint64_t v6 = int64 - *(void *)(a1 + 56);
  }
  else {
    unint64_t v6 = *(void *)(a1 + 56) - int64;
  }
  v7 = TRILogCategory_Server();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 > 0x3B)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v17 = 138543362;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: delay is different, criteria will be updated.", (uint8_t *)&v17, 0xCu);
    }

    int64_t v10 = *(void *)(a1 + 56);
    id v11 = v3;
    id v12 = v4;
LABEL_12:
    xpc_dictionary_set_int64(v11, v12, v10);
    xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 32), v3);
    goto LABEL_16;
  }
  if (v8)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 56);
    int v17 = 138543874;
    uint64_t v18 = v15;
    __int16 v19 = 2048;
    int64_t v20 = int64;
    __int16 v21 = 2048;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: existing delay is too close to requested delay (%lli ~ %lli), not updating the delay this time", (uint8_t *)&v17, 0x20u);
  }

LABEL_16:
}

- (void)_setJitterForXPCActivity:(id)a3 withLabel:(id)a4 replacementCriteria:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TRIXPCActivityManager__setJitterForXPCActivity_withLabel_replacementCriteria___block_invoke;
  block[3] = &unk_1E6BB8D68;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(dispatchQueue, block);
}

void __80__TRIXPCActivityManager__setJitterForXPCActivity_withLabel_replacementCriteria___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 32));
  if (!v2)
  {
    id v3 = *(id *)(a1 + 40);
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v14 = 138543362;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: criteria not found, using replacement and updating jitter.", (uint8_t *)&v14, 0xCu);
    }

    id v11 = (const char *)*MEMORY[0x1E4F142F0];
    id v12 = v3;
    goto LABEL_12;
  }
  id v3 = v2;
  uint64_t v4 = (const char *)*MEMORY[0x1E4F142F0];
  int64_t int64 = xpc_dictionary_get_int64(v2, (const char *)*MEMORY[0x1E4F142F0]);
  unint64_t v6 = TRILogCategory_Server();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (int64 != 3600)
  {
    if (v7)
    {
      uint64_t v13 = *(void *)(a1 + 48);
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: jitter is unset, criteria will be updated.", (uint8_t *)&v14, 0xCu);
    }

    id v12 = v3;
    id v11 = v4;
LABEL_12:
    xpc_dictionary_set_int64(v12, v11, 3600);
    xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 32), v3);
    goto LABEL_13;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    int v14 = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: jitter is already set, criteria unchanged.", (uint8_t *)&v14, 0xCu);
  }

LABEL_13:
}

- (void)_scheduleFetchTaskWithActivityDescriptor:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke;
  uint64_t v15 = &unk_1E6BB9E10;
  uint64_t v16 = self;
  id v9 = v7;
  id v17 = v9;
  __int16 v19 = &v20;
  id v10 = v6;
  id v18 = v10;
  dispatch_sync(dispatchQueue, &v12);
  if (!*((unsigned char *)v21 + 24))
  {
    objc_msgSend(v10, "completion", v12, v13, v14, v15, v16, v17);
    id v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v11[2](v11, 1);
  }
  _Block_object_dispose(&v20, 8);
}

void __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1[4] + 24))
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    xpc_object_t v2 = *(void **)(a1[4] + 24);
    id v3 = (void *)a1[6];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke_312;
    v8[3] = &unk_1E6BB82A8;
    uint64_t v4 = v3;
    uint64_t v5 = a1[4];
    id v9 = v4;
    uint64_t v10 = v5;
    [v2 resumeWithXPCActivityDescriptor:v4 executeWhenSuspended:v8];
    id v6 = v9;
  }
  else
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v7;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Can't carry out %{public}@ activity, task queue not initialized.", buf, 0xCu);
    }
  }
}

void __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke_312(uint64_t a1)
{
  id v10 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
  BOOL v2 = !+[TRITaskCapabilityUtilities requiredCapabilities:areSupportedByAllowedCapabilities:](TRITaskCapabilityUtilities, "requiredCapabilities:areSupportedByAllowedCapabilities:", 1, [*(id *)(a1 + 32) capabilities])&& +[TRITaskCapabilityUtilities requiredCapabilities:areSupportedByAllowedCapabilities:](TRITaskCapabilityUtilities, "requiredCapabilities:areSupportedByAllowedCapabilities:", 2, objc_msgSend(*(id *)(a1 + 32), "capabilities"));
  id v3 = objc_alloc(MEMORY[0x1E4FB00D8]);
  uint64_t v4 = [*(id *)(a1 + 32) activity];
  uint64_t v5 = (void *)[v3 initWithAllowsCellular:v2 discretionaryBehavior:2 activity:v4];

  id v6 = *(void **)(*(void *)(a1 + 40) + 24);
  uint64_t v7 = +[TRIScheduleFetchExperimentNotificationsTask taskWithRollbacksOnly:0 downloadOptions:v5];
  [v6 addTask:v7 options:v10];

  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 24);
  id v9 = +[TRIRetargetAllTask task];
  [v8 addTask:v9 options:v10];
}

- (void)_scheduleMaintenanceTaskWithActivityDescriptor:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  int v14 = __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke;
  uint64_t v15 = &unk_1E6BB9E10;
  uint64_t v16 = self;
  id v9 = v7;
  id v17 = v9;
  __int16 v19 = &v20;
  id v10 = v6;
  id v18 = v10;
  dispatch_sync(dispatchQueue, &v12);
  if (!*((unsigned char *)v21 + 24))
  {
    objc_msgSend(v10, "completion", v12, v13, v14, v15, v16, v17);
    id v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v11[2](v11, 1);
  }
  _Block_object_dispose(&v20, 8);
}

void __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1[4] + 24))
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    uint64_t v2 = a1[4];
    id v3 = *(void **)(v2 + 24);
    uint64_t v4 = a1[6];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke_318;
    v7[3] = &unk_1E6BB82F8;
    v7[4] = v2;
    [v3 resumeWithXPCActivityDescriptor:v4 executeWhenSuspended:v7];
  }
  else
  {
    uint64_t v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v6;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Can't carry out %{public}@ activity, task queue not initialized.", buf, 0xCu);
    }
  }
}

void __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke_318(uint64_t a1)
{
  id v6 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = +[TRIRetargetAllTask task];
  [v2 addTask:v3 options:v6];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = +[TRIMaintenanceTask task];
  [v4 addTask:v5 options:v6];
}

- (void)_registerCellularActivityWithDelay:(double)a3
{
  uint64_t v5 = +[TRILaunchDaemonActivityDescriptor cellularDescriptor];
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke;
  v7[3] = &unk_1E6BB9E38;
  v7[4] = self;
  *(double *)&void v7[5] = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke_2;
  v6[3] = &unk_1E6BB8200;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v5 checkInBlock:v7 asyncHandler:v6];
}

void __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = +[TRIXPCActivityCriteria cellularCriteria];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = +[TRILaunchDaemonActivityDescriptor cellularDescriptor];
  id v6 = [v5 name];
  [v4 _setJitterForXPCActivity:v8 withLabel:v6 replacementCriteria:v3];

  double v7 = *(double *)(a1 + 40);
  if (v7 > 0.0) {
    [*(id *)(a1 + 32) _setDelaySeconds:(uint64_t)v7 forXPCActivity:v8 withLabel:@"cellular" replacementCriteria:v3];
  }
}

uint64_t __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleFetchTaskWithActivityDescriptor:a2 label:@"cellular"];
}

- (void)_registerFetchExperimentsActivity
{
  id v3 = +[TRILaunchDaemonActivityDescriptor inexpensiveNetworkingDescriptor];
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke;
  v5[3] = &unk_1E6BB81D8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke_2;
  v4[3] = &unk_1E6BB8200;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:v5 asyncHandler:v4];
}

void __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[TRIXPCActivityCriteria fetchExperimentsCriteria];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = +[TRILaunchDaemonActivityDescriptor inexpensiveNetworkingDescriptor];
  id v6 = [v5 name];
  [v4 _setJitterForXPCActivity:v3 withLabel:v6 replacementCriteria:v7];
}

uint64_t __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleFetchTaskWithActivityDescriptor:a2 label:@"fetch-experiments"];
}

- (void)_registerMaintenanceWorkActivity
{
  id v3 = +[TRILaunchDaemonActivityDescriptor maintenanceWorkDescriptor];
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke;
  v5[3] = &unk_1E6BB81D8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke_2;
  v4[3] = &unk_1E6BB8200;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:v5 asyncHandler:v4];
}

void __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[TRIXPCActivityCriteria maintenanceCriteria];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = +[TRILaunchDaemonActivityDescriptor maintenanceWorkDescriptor];
  id v6 = [v5 name];
  [v4 _setJitterForXPCActivity:v3 withLabel:v6 replacementCriteria:v7];
}

uint64_t __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleMaintenanceTaskWithActivityDescriptor:a2 label:@"maintenance"];
}

- (void)_registerPostUpgradeActivity
{
  id v3 = +[TRILaunchDaemonActivityDescriptor postUpgradeDescriptor];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke;
  v4[3] = &unk_1E6BB8200;
  v4[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:0 asyncHandler:v4];
}

void __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_2;
  block[3] = &unk_1E6BB9DC0;
  void block[4] = v4;
  uint64_t v10 = &v11;
  id v6 = v3;
  id v9 = v6;
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v12 + 24))
  {
    id v7 = [v6 completion];
    v7[2](v7, 1);
  }
  _Block_object_dispose(&v11, 8);
}

void __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_2(void *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  if (*(void *)(v1 + 16))
  {
    BOOL v3 = *(void *)(v1 + 24) == 0;
    uint64_t v4 = TRILogCategory_Server();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade actions, task queue not initialized.", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "post-upgrade actions triggered", buf, 2u);
      }

      *(void *)buf = 0;
      v36 = buf;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__14;
      v39 = __Block_byref_object_dispose__14;
      id v40 = 0;
      id v6 = [*(id *)(a1[4] + 16) keyValueStore];
      id v7 = (id *)(v36 + 40);
      id obj = (id)*((void *)v36 + 5);
      BOOL v8 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:v6 key:@"post-upgrade-activity-in-progress" value:&unk_1F347B618 error:&obj];
      objc_storeStrong(v7, obj);

      if (v8)
      {
        int out_token = 0;
        uint64_t v9 = a1[4];
        uint64_t v10 = *(NSObject **)(v9 + 8);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_334;
        handler[3] = &unk_1E6BB9E60;
        handler[4] = v9;
        handler[5] = buf;
        uint32_t v11 = notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v10, handler);
        if (v11)
        {
          uint64_t v12 = TRILogCategory_Server();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v41 = 134217984;
            v42 = (__CFString *)v11;
            _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", v41, 0xCu);
          }
        }
        else
        {
          uint64_t v15 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
          uint64_t v16 = *(void **)(a1[4] + 24);
          id v17 = +[TRIPostUpgradeCleanupTask task];
          [v16 addTask:v17 options:v15];

          id v18 = *(void **)(a1[4] + 24);
          __int16 v19 = objc_opt_new();
          [v18 addTask:v19 options:v15];

          uint64_t v20 = *(void **)(a1[4] + 24);
          __int16 v21 = +[TRIRetargetAllTask task];
          [v20 addTask:v21 options:v15];

          uint64_t v22 = [MEMORY[0x1E4FB00D8] inexpensiveOptions];
          char v23 = +[TRIScheduleFetchExperimentNotificationsTask taskWithRollbacksOnly:1 downloadOptions:v22];

          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
          uint64_t v24 = a1[4];
          uint64_t v25 = a1[5];
          v26 = *(void **)(v24 + 24);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_340;
          v29[3] = &unk_1E6BB8D68;
          v29[4] = v24;
          id v27 = v23;
          id v30 = v27;
          uint64_t v12 = v15;
          v31 = v12;
          [v26 resumeWithXPCActivityDescriptor:v25 executeWhenSuspended:v29];
        }
      }
      else
      {
        char v14 = TRILogCategory_Server();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = *((void *)v36 + 5);
          *(_DWORD *)v41 = 138412546;
          v42 = @"post-upgrade-activity-in-progress";
          __int16 v43 = 2114;
          uint64_t v44 = v28;
          _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", v41, 0x16u);
        }
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade actions, server context not available.", buf, 2u);
    }
  }
}

void __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_334(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "task queue completed in asynch handler of post-upgrade. Updating KV store to indicate the activity is no longer in progress", buf, 2u);
  }

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) keyValueStore];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:v5 key:@"post-upgrade-activity-in-progress" value:&unk_1F347B630 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    notify_cancel(a2);
  }
  else
  {
    BOOL v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = @"post-upgrade-activity-in-progress";
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }
  }
}

uint64_t __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_340(void *a1)
{
  return [*(id *)(a1[4] + 24) addTask:a1[5] options:a1[6]];
}

- (void)_registerPostUpgradeActivityRequireInexpensiveNetworking
{
  BOOL v3 = +[TRILaunchDaemonActivityDescriptor postUpgradeDescriptorRequireInexpensiveNetworking];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke;
  v4[3] = &unk_1E6BB8200;
  v4[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:0 asyncHandler:v4];
}

void __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_2;
  block[3] = &unk_1E6BB9E88;
  void block[4] = v4;
  id v6 = v3;
  id v9 = v6;
  uint64_t v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v12 + 24))
  {
    BOOL v7 = [v6 completion];
    v7[2](v7, 1);
  }
  _Block_object_dispose(&v11, 8);
}

void __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_2(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  if (*(void *)(v1 + 16))
  {
    BOOL v3 = *(void *)(v1 + 24) == 0;
    uint64_t v4 = TRILogCategory_Server();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade require inexpensive networking actions, task queue not initialized.", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "post-upgrade-require-inexpensive-networking actions triggered", buf, 2u);
      }

      *(void *)buf = 0;
      uint64_t v24 = buf;
      uint64_t v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__14;
      id v27 = __Block_byref_object_dispose__14;
      id v28 = 0;
      id v6 = [*(id *)(a1[4] + 16) keyValueStore];
      BOOL v7 = (id *)(v24 + 40);
      id obj = (id)*((void *)v24 + 5);
      BOOL v8 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:v6 key:@"post-upgrade-require-inexpensive-networking-activity-in-progress" value:&unk_1F347B618 error:&obj];
      objc_storeStrong(v7, obj);

      if (v8)
      {
        int out_token = 0;
        uint64_t v9 = a1[4];
        uint64_t v10 = *(NSObject **)(v9 + 8);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_341;
        v20[3] = &unk_1E6BB9E60;
        v20[4] = v9;
        v20[5] = buf;
        uint32_t v11 = notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v10, v20);
        if (v11)
        {
          uint64_t v12 = TRILogCategory_Server();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v29 = 134217984;
            id v30 = (__CFString *)v11;
            _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", v29, 0xCu);
          }
        }
        else
        {
          uint64_t v12 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
          uint64_t v15 = [TRITaskAttributionInternalInsecure alloc];
          uint64_t v16 = [MEMORY[0x1E4FB00D8] inexpensiveOptions];
          id v17 = [(TRITaskAttributionInternalInsecure *)v15 initWithTeamIdentifier:0 triCloudKitContainer:1 applicationBundleIdentifier:@"com.apple.triald" networkOptions:v16];

          id v18 = +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:0 taskAttribution:v17];
          [*(id *)(a1[4] + 24) addTask:v18 options:v12];
          [*(id *)(a1[4] + 24) resumeWithXPCActivityDescriptor:a1[5] executeWhenSuspended:0];
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
        }
      }
      else
      {
        char v14 = TRILogCategory_Server();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *((void *)v24 + 5);
          *(_DWORD *)v29 = 138412546;
          id v30 = @"post-upgrade-require-inexpensive-networking-activity-in-progress";
          __int16 v31 = 2114;
          uint64_t v32 = v19;
          _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", v29, 0x16u);
        }
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade require inexpensive networking actions, server context not available.", buf, 2u);
    }
  }
}

void __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_341(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "task queue completed in asynch handler of post-upgrade-require-inexpensive-networking. Updating KV store to indicate the activity is no longer in progress", buf, 2u);
  }

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) keyValueStore];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  BOOL v7 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:v5 key:@"post-upgrade-require-inexpensive-networking-activity-in-progress" value:&unk_1F347B630 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    notify_cancel(a2);
  }
  else
  {
    BOOL v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = @"post-upgrade-require-inexpensive-networking-activity-in-progress";
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }
  }
}

- (void)registerSetupAssistantFetchActivity
{
  BOOL v3 = +[TRILaunchDaemonActivityDescriptor setupAssistantFetchDescriptor];
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke;
  v5[3] = &unk_1E6BB81D8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_348;
  v4[3] = &unk_1E6BB8200;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:v5 asyncHandler:v4];
}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch activity check-in", buf, 2u);
  }

  xpc_object_t v5 = xpc_activity_copy_criteria(v3);
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) keyValueStore];
  id v29 = 0;
  BOOL v7 = +[TRISetupAssistantFetchUtils getValueInKeyValueStore:v6 key:@"setup-assistant-fetch-activity-deadline-date" error:&v29];
  id v8 = v29;

  if (!v7)
  {
    if (v8)
    {
      uint32_t v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v31 = @"setup-assistant-fetch-activity-deadline-date";
        __int16 v32 = 2114;
        int64_t v33 = (int64_t)v8;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Error reading data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
      }
    }
    uint64_t v9 = TRILogCategory_Server();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "setupAssistantFetchActivityRegistrationKey not set, unregistering setup-assistant-fetch";
    goto LABEL_13;
  }
  if ([v7 isEqualToNumber:&unk_1F347B648])
  {
    uint64_t v9 = TRILogCategory_Server();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      xpc_activity_unregister("com.apple.triald.setup-assistant-fetch");
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Unregistering setup-assistant-fetch activity in check-in because the activity already registered. Not proceeding further";
LABEL_13:
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    goto LABEL_14;
  }
  uint64_t v12 = (const char **)MEMORY[0x1E4F141A8];
  if (v5 && xpc_dictionary_get_count(v5))
  {
    __int16 v13 = v12;
  }
  else
  {
    uint64_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "criteria is nil or has zero count when trying to register setup-assistant-fetch activity to run", buf, 2u);
    }

    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F14320], 1);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F14330], 1);
    xpc_dictionary_set_string(v15, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E4F14170], 0);
    __int16 v13 = v12;
    xpc_dictionary_set_int64(v15, *v12, 21600);
    xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E4F14260], 700000000);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F14368], 1);
    xpc_object_t v5 = v15;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v7 doubleValue];
  id v17 = (__CFString *)objc_msgSend(v16, "initWithTimeIntervalSince1970:");
  id v18 = [MEMORY[0x1E4F1C9C8] now];
  [(__CFString *)v17 timeIntervalSinceDate:v18];
  int64_t v20 = (uint64_t)v19;
  __int16 v21 = TRILogCategory_Server();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v31 = v17;
    __int16 v32 = 2048;
    int64_t v33 = v20;
    _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "The deadline to run setup-assistant-fetch activity is: %@. Setting grace period to: %lld", buf, 0x16u);
  }

  xpc_dictionary_set_int64(v5, *v13, v20);
  uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 16);
  id v28 = 0;
  BOOL v23 = +[TRISetupAssistantFetchUtils stopSetupAssistantFetchWithServerContext:v22 namespaceNames:0 error:&v28];
  uint64_t v24 = (__CFString *)v28;
  uint64_t v25 = v24;
  if (v23)
  {
    v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEFAULT, "Unregistering setup-assistant-fetch activity to run", buf, 2u);
    }

    xpc_activity_unregister("com.apple.triald.setup-assistant-fetch");
  }
  else if (v24)
  {
    id v27 = TRILogCategory_Server();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v25;
      _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Error checking if the setup-assistant-fetch activity is needed to run in registerSetupAssistantFetchActivity: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    xpc_activity_set_criteria(v3, v5);
  }

LABEL_33:
}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_348(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_2;
  block[3] = &unk_1E6BB9E88;
  void block[4] = v4;
  id v6 = v3;
  id v9 = v6;
  uint64_t v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v12 + 24))
  {
    BOOL v7 = [v6 completion];
    v7[2](v7, 1);
  }
  _Block_object_dispose(&v11, 8);
}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_2(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  if (!*(void *)(v1 + 16))
  {
    xpc_object_t v5 = TRILogCategory_Server();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Can't trigger setup-assistant-fetch actions, server context not available.";
LABEL_12:
    _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = TRILogCategory_Server();
  xpc_object_t v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Can't trigger setup-assistant-fetch actions, task queue not initialized.";
    goto LABEL_12;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch actions triggered", buf, 2u);
  }

  id v6 = +[TRISetupAssistantFetchUtils registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:*(void *)(a1[4] + 16)];
  int out_token = 0;
  uint64_t v7 = a1[4];
  id v8 = *(NSObject **)(v7 + 8);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_349;
  handler[3] = &unk_1E6BB9EB0;
  handler[4] = v7;
  xpc_object_t v5 = v6;
  id v16 = v5;
  uint32_t v9 = notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v8, handler);
  if (v9)
  {
    uint32_t v10 = v9;
    uint64_t v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v10;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
    uint64_t v13 = *(void **)(a1[4] + 24);
    char v14 = +[TRISetupAssistantFetchTask task];
    [v13 addTask:v14 options:v11];

    [*(id *)(a1[4] + 24) resumeWithXPCActivityDescriptor:a1[5] executeWhenSuspended:0];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }

LABEL_15:
}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_349(uint64_t a1, int a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "task queue completed in asynch handler of setup-assistant-fetch", buf, 2u);
  }

  xpc_object_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) keyValueStore];
  id v30 = 0;
  id v6 = +[TRISetupAssistantFetchUtils getValueInKeyValueStore:v5 key:@"setup-assistant-fetch-activity-deadline-date" error:&v30];
  id v7 = v30;

  if (v6 && ([v6 isEqualToNumber:&unk_1F347B648] & 1) == 0)
  {
    id v22 = v7;
    BOOL v23 = v6;
    int v24 = a2;
    id v8 = [*(id *)(a1 + 40) builtTelemetry];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          char v14 = [*(id *)(*(void *)(a1 + 32) + 16) client];
          xpc_object_t v15 = [v14 logger];
          id v16 = [*(id *)(*(void *)(a1 + 32) + 16) client];
          id v17 = [v16 trackingId];
          [v15 logWithTrackingId:v17 metrics:0 dimensions:0 trialSystemTelemetry:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v10);
    }

    a2 = v24;
    id v6 = v23;
    id v7 = v22;
  }
  id v18 = [*(id *)(*(void *)(a1 + 32) + 16) keyValueStore];
  id v25 = v7;
  BOOL v19 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:v18 key:@"setup-assistant-fetch-activity-deadline-date" value:&unk_1F347B648 error:&v25];
  id v20 = v25;

  if (v19)
  {
    notify_cancel(a2);
  }
  else
  {
    __int16 v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v32 = @"setup-assistant-fetch-activity-deadline-date";
      __int16 v33 = 2114;
      id v34 = v20;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }
  }
}

- (void)_registerHotfixTargetingActivity
{
  uint64_t v3 = +[TRILaunchDaemonActivityDescriptor clientHotfixCellularAllowBatteryDescriptor];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke;
  v6[3] = &unk_1E6BB8200;
  v6[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:0 asyncHandler:v6];

  uint64_t v4 = +[TRILaunchDaemonActivityDescriptor clientHotfixWifiDescriptor];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_351;
  v5[3] = &unk_1E6BB8200;
  v5[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v4 checkInBlock:0 asyncHandler:v5];
}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2;
  block[3] = &unk_1E6BB9E88;
  void block[4] = v4;
  id v6 = v3;
  id v9 = v6;
  uint64_t v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v12 + 24))
  {
    id v7 = [v6 completion];
    v7[2](v7, 1);
  }
  _Block_object_dispose(&v11, 8);
}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 24);
  id v3 = TRILogCategory_Server();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)xpc_object_t v5 = 0;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(Activity Manager) Hotfix running cellular activity", v5, 2u);
    }

    [*(id *)(a1[4] + 24) resumeWithXPCActivityDescriptor:a1[5] executeWhenSuspended:0];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Can't carry out hotfix targeting activity, task queue not initialized.", buf, 2u);
    }
  }
}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_351(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2_352;
  block[3] = &unk_1E6BB9E88;
  void block[4] = v4;
  id v6 = v3;
  id v9 = v6;
  uint64_t v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((unsigned char *)v12 + 24))
  {
    id v7 = [v6 completion];
    v7[2](v7, 1);
  }
  _Block_object_dispose(&v11, 8);
}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2_352(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 24);
  id v3 = TRILogCategory_Server();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)xpc_object_t v5 = 0;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(Activity Manager) Hotfix running wifi activity", v5, 2u);
    }

    [*(id *)(a1[4] + 24) resumeWithXPCActivityDescriptor:a1[5] executeWhenSuspended:0];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Can't carry out hotfix targeting activity, task queue not initialized.", buf, 2u);
    }
  }
}

- (void)_registerPlaceholderTaskQueueActivity
{
  id v2 = +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor];
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v2 checkInBlock:0 asyncHandler:&__block_literal_global_8];
}

void __62__TRIXPCActivityManager__registerPlaceholderTaskQueueActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 completion];
  v2[2](v2, 1);
}

- (void)_registerClientTriggeredActivities
{
  id v3 = +[TRILaunchDaemonActivityDescriptor clientTriggeredCellularDescriptor];
  v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke;
  v8[3] = &unk_1E6BB81D8;
  void v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_2;
  v7[3] = &unk_1E6BB8200;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v3 checkInBlock:v8 asyncHandler:v7];

  uint64_t v4 = +[TRILaunchDaemonActivityDescriptor clientTriggeredWifiDescriptor];
  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_4;
  v6[3] = &unk_1E6BB81D8;
  v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_5;
  v5[3] = &unk_1E6BB8200;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v4 checkInBlock:v6 asyncHandler:v5];
}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[TRIXPCActivityCriteria clientTriggeredCellularCriteria];
  uint64_t v4 = *(void **)(a1 + 32);
  xpc_object_t v5 = +[TRILaunchDaemonActivityDescriptor clientTriggeredCellularDescriptor];
  id v6 = [v5 name];
  [v4 _setJitterForXPCActivity:v3 withLabel:v6 replacementCriteria:v7];
}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_3;
  v7[3] = &unk_1E6BB82A8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) resumeWithXPCActivityDescriptor:*(void *)(a1 + 40) executeWhenSuspended:0];
}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[TRIXPCActivityCriteria clientTriggeredWifiCriteria];
  uint64_t v4 = *(void **)(a1 + 32);
  xpc_object_t v5 = +[TRILaunchDaemonActivityDescriptor clientTriggeredWifiDescriptor];
  id v6 = [v5 name];
  [v4 _setJitterForXPCActivity:v3 withLabel:v6 replacementCriteria:v7];
}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_6;
  v7[3] = &unk_1E6BB82A8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) resumeWithXPCActivityDescriptor:*(void *)(a1 + 40) executeWhenSuspended:0];
}

- (TRIServerContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (TRITaskQueue)taskQueue
{
  return self->_taskQueue;
}

- (void)setTaskQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end