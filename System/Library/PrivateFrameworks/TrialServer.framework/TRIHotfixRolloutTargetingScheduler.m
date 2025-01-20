@interface TRIHotfixRolloutTargetingScheduler
+ (id)_xpcActivityCriteriaWithRunDelay:(double)a3 allowAnyNetworkingAndBatteryUsage:(BOOL)a4;
- (TRIHotfixRolloutTargetingScheduler)initWithTaskQueue:(id)a3;
- (TRITaskQueuing)queue;
- (void)_scheduleTaskQueueActivityWithDelay:(double)a3 allowingAnyNetworkingAndBatteryUsage:(BOOL)a4;
- (void)scheduleHotfixForDeployment:(id)a3 allowingAnyNetworkingAndBatteryUsage:(BOOL)a4 runDelay:(double)a5;
@end

@implementation TRIHotfixRolloutTargetingScheduler

- (TRIHotfixRolloutTargetingScheduler)initWithTaskQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRIHotfixRolloutTargetingScheduler.m", 32, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRIHotfixRolloutTargetingScheduler;
  v7 = [(TRIHotfixRolloutTargetingScheduler *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v8;
}

- (void)scheduleHotfixForDeployment:(id)a3 allowingAnyNetworkingAndBatteryUsage:(BOOL)a4 runDelay:(double)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIHotfixRolloutTargetingScheduler.m", 42, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];
  }
  if (a5 >= 0.0)
  {
    objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initWithAllowsCellular:v6 discretionaryBehavior:0];
    v12 = +[TRITaskAttributionInternalInsecure taskAttributionFirstPartyWithNetworkOptions:v11];
    v13 = +[TRIRolloutTargetingTask taskWithRolloutDeployment:v9 includeDependencies:1 taskAttribution:v12 triggerEvent:1];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:a5];
    [v13 setStartTime:v14];

    v15 = [(TRIHotfixRolloutTargetingScheduler *)self queue];
    v16 = +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:0];
    [v15 addTask:v13 options:v16];

    [(TRIHotfixRolloutTargetingScheduler *)self _scheduleTaskQueueActivityWithDelay:v6 allowingAnyNetworkingAndBatteryUsage:a5];
  }
  else
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      double v19 = a5;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Received negative run delay %f for hotfix deployment of %{public}@", buf, 0x16u);
    }
  }
}

- (void)_scheduleTaskQueueActivityWithDelay:(double)a3 allowingAnyNetworkingAndBatteryUsage:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(id)objc_opt_class() _xpcActivityCriteriaWithRunDelay:0 allowAnyNetworkingAndBatteryUsage:a3];
  v8 = +[TRILaunchDaemonActivityDescriptor clientHotfixWifiDescriptor];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke;
  v17[3] = &unk_1E6BB81D8;
  id v9 = v7;
  id v18 = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_24;
  v16[3] = &unk_1E6BB8200;
  v16[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v8 checkInBlock:v17 asyncHandler:v16];

  if (v4)
  {
    v10 = [(id)objc_opt_class() _xpcActivityCriteriaWithRunDelay:1 allowAnyNetworkingAndBatteryUsage:a3];
    objc_super v11 = +[TRILaunchDaemonActivityDescriptor clientHotfixCellularAllowBatteryDescriptor];
    v13[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_26;
    v14[3] = &unk_1E6BB81D8;
    id v15 = v10;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_27;
    v13[3] = &unk_1E6BB8200;
    id v12 = v10;
    +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:v11 checkInBlock:v14 asyncHandler:v13];
  }
}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  BOOL v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Hotfix (wifi) checking in", v5, 2u);
  }

  xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));
}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(Scheduler) Hotfix running wifi activity", v6, 2u);
  }

  v5 = [*(id *)(a1 + 32) queue];
  [v5 resumeWithXPCActivityDescriptor:v3 executeWhenSuspended:0];
}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Hotfix (cellular) checking in", v5, 2u);
  }

  xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));
}

void __111__TRIHotfixRolloutTargetingScheduler__scheduleTaskQueueActivityWithDelay_allowingAnyNetworkingAndBatteryUsage___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(Scheduler) Hotfix running cellular activity", v6, 2u);
  }

  v5 = [*(id *)(a1 + 32) queue];
  [v5 resumeWithXPCActivityDescriptor:v3 executeWhenSuspended:0];
}

+ (id)_xpcActivityCriteriaWithRunDelay:(double)a3 allowAnyNetworkingAndBatteryUsage:(BOOL)a4
{
  int64_t v5 = (uint64_t)a3;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F14170], v5);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14138], a4);
  xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14330], !a4);
  return v6;
}

- (TRITaskQueuing)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end