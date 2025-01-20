@interface RTLaunchServices
+ (BOOL)canOpenApplication:(id)a3;
+ (void)createProcessAssertionForPid:(int)a3 timeout:(double)a4 queue:(id)a5 timeoutHandler:(id)a6;
+ (void)launchClientWithBundleIdentifier:(id)a3 restorationIdentifier:(id)a4 eventAgentManager:(id)a5 handler:(id)a6;
@end

@implementation RTLaunchServices

+ (void)launchClientWithBundleIdentifier:(id)a3 restorationIdentifier:(id)a4 eventAgentManager:(id)a5 handler:(id)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(void, void))v13;
  if (v10)
  {
    if (v11)
    {
      v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v10;
        __int16 v47 = 2112;
        id v48 = v11;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "launch client with bundle identifier, %@, restoration identifier, %@", buf, 0x16u);
      }

      int v16 = [a1 canOpenApplication:v10];
      v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v16)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          id v46 = v10;
          __int16 v47 = 2112;
          id v48 = v11;
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "launch application for client with bundleIdentifier, %@, restorationIdentifier, %@", buf, 0x16u);
        }

        uint64_t v19 = *MEMORY[0x1E4F625F8];
        v44[0] = MEMORY[0x1E4F1CC38];
        uint64_t v20 = *MEMORY[0x1E4F625F0];
        v43[0] = v19;
        v43[1] = v20;
        uint64_t v41 = *MEMORY[0x1E4F62508];
        uint64_t v42 = MEMORY[0x1E4F1CC08];
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        v43[2] = @"RTLaunchServicesRestorationIdentifier";
        v44[1] = v21;
        v44[2] = v11;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

        v23 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v22];
        v24 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke;
        v37[3] = &unk_1E6B9A678;
        id v38 = v10;
        id v39 = v11;
        v40 = v14;
        [v24 openApplication:v38 withOptions:v23 completion:v37];
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          id v46 = v10;
          __int16 v47 = 2112;
          id v48 = v11;
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "launched daemon for client with bundle id, %@, restorationIdentifier, %@", buf, 0x16u);
        }

        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke_20;
        v33[3] = &unk_1E6B9A6A0;
        id v34 = v10;
        id v35 = v11;
        v36 = v14;
        [v12 launchDaemonWithRestorationIdentifier:v35 withReply:v33];

        v22 = v34;
      }
      goto LABEL_17;
    }
    if (v13)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F5CFE8];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50 = @"Launching an application requires a restoration identifier.";
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v28 = v31;
      uint64_t v29 = v32;
      uint64_t v30 = 1;
      goto LABEL_13;
    }
  }
  else if (v13)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"Launching an application requires an bundle identifier.";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v28 = v25;
    uint64_t v29 = v26;
    uint64_t v30 = 0;
LABEL_13:
    v22 = [v28 errorWithDomain:v29 code:v30 userInfo:v27];

    ((void (**)(void, void *))v14)[2](v14, v22);
LABEL_17:
  }
}

void __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    v8 = @"NO";
    if (!v4) {
      v8 = @"YES";
    }
    int v10 = 138412802;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "launched application for client with bundle id, %@, restorationIdentifier, %@, success, %@", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
  }
}

void __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke_20(void *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "launched daemon for client with bundle id, %@, restorationIdentifier, %@, success, %@", buf, 0x20u);
  }

  uint64_t v8 = a1[6];
  if (v8)
  {
    if (a2)
    {
      uint64_t v9 = 0;
    }
    else
    {
      int v10 = [NSString stringWithFormat:@"Failed to launch daemon for client with bundle identifier, %@, restoration identifier, %@", a1[4], a1[5], *MEMORY[0x1E4F28568]];
      uint64_t v13 = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];

      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:2 userInfo:v11];

      uint64_t v8 = a1[6];
    }
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

+ (BOOL)canOpenApplication:(id)a3
{
  uint64_t v8 = 0;
  v3 = (void *)MEMORY[0x1E4F629E0];
  id v4 = a3;
  uint64_t v5 = [v3 serviceWithDefaultShellEndpoint];
  char v6 = [v5 canOpenApplication:v4 reason:&v8];

  return v6;
}

+ (void)createProcessAssertionForPid:(int)a3 timeout:(double)a4 queue:(id)a5 timeoutHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  int v10 = (void (**)(void))a6;
  if (a4 >= 0.0)
  {
    if (v9)
    {
      uint64_t v12 = v9;
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
    }
    *(void *)buf = 0;
    v23 = buf;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__122;
    uint64_t v26 = __Block_byref_object_dispose__122;
    id v14 = objc_alloc(MEMORY[0x1E4F96318]);
    uint64_t v15 = [MEMORY[0x1E4F96478] targetWithPid:v8];
    __int16 v16 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
    v28[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v27 = (id)[v14 initWithExplanation:@"com.apple.routined" target:v15 attributes:v17];

    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__RTLaunchServices_createProcessAssertionForPid_timeout_queue_timeoutHandler___block_invoke;
    v19[3] = &unk_1E6B97FE0;
    v21 = buf;
    uint64_t v20 = v10;
    dispatch_after(v18, v12, v19);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "requested assertion timeout was less than 0, returning", buf, 2u);
    }

    if (v10) {
      v10[2](v10);
    }
  }
}

uint64_t __78__RTLaunchServices_createProcessAssertionForPid_timeout_queue_timeoutHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    [v2 invalidate];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

@end