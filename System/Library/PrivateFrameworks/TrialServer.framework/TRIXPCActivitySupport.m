@interface TRIXPCActivitySupport
+ (BOOL)unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor:(id)a3;
+ (id)_registeredActivities;
+ (id)nameForActivityState:(int64_t)a3;
+ (void)assertRegistrationOfLaunchdPlistActivities:(id)a3;
+ (void)registerActivityWithLaunchDaemonDescriptor:(id)a3 checkInBlock:(id)a4 asyncHandler:(id)a5;
@end

@implementation TRIXPCActivitySupport

+ (id)nameForActivityState:(int64_t)a3
{
  if ((unint64_t)a3 >= 6) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"XPC_ACTIVITY_STATE_%ld", a3);
  }
  else {
    v3 = off_1E6BBDEB8[a3];
  }
  return v3;
}

+ (id)_registeredActivities
{
  if (qword_1EA8D8250 != -1) {
    dispatch_once(&qword_1EA8D8250, &__block_literal_global_104);
  }
  v2 = (void *)_MergedGlobals_45;
  return v2;
}

void __46__TRIXPCActivitySupport__registeredActivities__block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  v4 = (void *)_MergedGlobals_45;
  _MergedGlobals_45 = v3;
}

+ (void)registerActivityWithLaunchDaemonDescriptor:(id)a3 checkInBlock:(id)a4 asyncHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 name];
  v13 = +[TRIXPCActivitySupport _registeredActivities];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke;
  v31[3] = &unk_1E6BBDDF8;
  id v14 = v12;
  id v32 = v14;
  id v15 = v11;
  id v33 = v15;
  [v13 runWithLockAcquired:v31];
  v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v14;
    _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "register xpc activity handler for %{public}@", buf, 0xCu);
  }

  id v17 = v14;
  v18 = (const char *)[v17 UTF8String];
  if (!v18)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"TRIXPCActivitySupport.m", 159, @"Invalid parameter not satisfying: %@", @"utf8Name" object file lineNumber description];
  }
  v19 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke_111;
  handler[3] = &unk_1E6BBDE20;
  id v26 = v17;
  id v27 = v9;
  id v29 = v15;
  id v30 = a1;
  id v28 = v10;
  id v20 = v15;
  id v21 = v9;
  id v22 = v10;
  id v23 = v17;
  xpc_activity_register(v18, v19, handler);
}

void __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = (id)MEMORY[0x1E016EA80](v3);
  [v4 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
}

void __94__TRIXPCActivitySupport_registerActivityWithLaunchDaemonDescriptor_checkInBlock_asyncHandler___block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    int v9 = [MEMORY[0x1E4F93B10] isClassCLocked];
    id v10 = TRILogCategory_Server();
    id v11 = (TRIRunningXPCActivityDescriptor *)v10;
    if (!v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v23 = 138543362;
        uint64_t v24 = v17;
        _os_log_impl(&dword_1DA291000, &v11->super, OS_LOG_TYPE_DEFAULT, "Run activity for %{public}@", (uint8_t *)&v23, 0xCu);
      }

      id v11 = -[TRIRunningXPCActivityDescriptor initWithActivity:capabilities:name:]([TRIRunningXPCActivityDescriptor alloc], "initWithActivity:capabilities:name:", v3, [*(id *)(a1 + 40) supportedTaskCapabilities], *(void *)(a1 + 32));
      xpc_activity_state_t v18 = xpc_activity_get_state(v3);
      if (!xpc_activity_set_state(v3, 4))
      {
        v19 = TRILogCategory_Server();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          id v21 = [*(id *)(a1 + 64) nameForActivityState:v18];
          id v22 = [*(id *)(a1 + 64) nameForActivityState:4];
          int v23 = 138543874;
          uint64_t v24 = v20;
          __int16 v25 = 2114;
          xpc_activity_state_t v26 = (xpc_activity_state_t)v21;
          __int16 v27 = 2114;
          id v28 = v22;
          _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "XPC activity %{public}@ start: unable to transition state %{public}@ --> %{public}@", (uint8_t *)&v23, 0x20u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_20;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v23 = 138543362;
      uint64_t v24 = v12;
      v13 = "Attempted to run activity %{public}@ before first unlock, doing nothing";
      p_super = &v11->super;
      uint32_t v15 = 12;
LABEL_12:
      _os_log_error_impl(&dword_1DA291000, p_super, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v23, v15);
    }
LABEL_20:

    goto LABEL_21;
  }
  xpc_activity_state_t v5 = state;
  if (state)
  {
    TRILogCategory_Server();
    id v11 = (TRIRunningXPCActivityDescriptor *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v23 = 138543618;
      uint64_t v24 = v16;
      __int16 v25 = 2048;
      xpc_activity_state_t v26 = v5;
      v13 = "%{public}@ - unexpected xpc activity state: %ld";
      p_super = &v11->super;
      uint32_t v15 = 22;
      goto LABEL_12;
    }
    goto LABEL_20;
  }
  v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v23 = 138543362;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Checking in for %{public}@", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, _xpc_activity_s *))(v8 + 16))(v8, v3);
  }
LABEL_21:
}

+ (void)assertRegistrationOfLaunchdPlistActivities:(id)a3
{
  id v5 = a3;
  v6 = +[TRIXPCActivitySupport _registeredActivities];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__TRIXPCActivitySupport_assertRegistrationOfLaunchdPlistActivities___block_invoke;
  v8[3] = &unk_1E6BBDE48;
  id v9 = v5;
  SEL v10 = a2;
  id v11 = a1;
  id v7 = v5;
  [v6 runWithLockAcquired:v8];
}

void __68__TRIXPCActivitySupport_assertRegistrationOfLaunchdPlistActivities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [v3 allKeys];
  v6 = (void *)[v4 initWithArray:v5];

  if (([*(id *)(a1 + 32) isSubsetOfSet:v6] & 1) == 0)
  {
    id v15 = v3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (([v6 containsObject:v12] & 1) == 0)
          {
            v13 = TRILogCategory_Server();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v21 = v12;
              _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "descriptor %{public}@ is not registered", buf, 0xCu);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v9);
    }

    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"TRIXPCActivitySupport.m" lineNumber:218 description:@"failed assertRegistrationOfLaunchdPlistActivities"];

    id v3 = v15;
  }
}

+ (BOOL)unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[TRIXPCActivitySupport _registeredActivities];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  xpc_activity_state_t v26 = __Block_byref_object_copy__49;
  __int16 v27 = __Block_byref_object_dispose__49;
  id v28 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke;
  v20[3] = &unk_1E6BBDE70;
  id v22 = &v23;
  id v7 = v5;
  id v21 = v7;
  [v6 runWithLockAcquired:v20];
  uint64_t v8 = v24[5];
  if (v8)
  {
    uint64_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v9, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E4F14170], 0);
    xpc_dictionary_set_int64(v9, (const char *)*MEMORY[0x1E4F141A8], 0);
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 name];
      *(_DWORD *)buf = 138543362;
      id v30 = v11;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Registering TOTALLY SKETCHY IMMEDIATE ACTIVITY FOR TESTING: %{public}@", buf, 0xCu);
    }
    id v12 = [v7 name];
    v13 = (const char *)[v12 UTF8String];

    if (!v13)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, a1, @"TRIXPCActivitySupport.m", 242, @"Expression was unexpectedly nil/false: %@", @"descriptor.name.UTF8String" object file lineNumber description];
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke_125;
    handler[3] = &unk_1E6BBDE98;
    id v18 = v7;
    long long v19 = &v23;
    xpc_activity_register(v13, v9, handler);
  }
  else
  {
    uint64_t v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v7 name];
      *(_DWORD *)buf = 138543362;
      id v30 = v15;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Unable to immediately schedule %{public}@: activity not yet registered", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v23, 8);
  return v8 != 0;
}

void __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 name];
  uint64_t v5 = [v4 objectForKeyedSubscript:v8];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __86__TRIXPCActivitySupport_unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor___block_invoke_125(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) name];
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Running TOTALLY SKETCHY IMMEDIATE ACTIVITY FOR TESTING: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v6 = [*(id *)(a1 + 32) supportedTaskCapabilities] | 0x1B;
    id v7 = [TRIRunningXPCActivityDescriptor alloc];
    id v8 = [*(id *)(a1 + 32) name];
    uint64_t v9 = [(TRIRunningXPCActivityDescriptor *)v7 initWithActivity:v3 capabilities:v6 name:v8];

    xpc_activity_set_state(v3, 4);
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  }
}

@end