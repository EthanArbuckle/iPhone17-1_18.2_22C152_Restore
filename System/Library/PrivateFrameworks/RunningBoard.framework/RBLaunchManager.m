@interface RBLaunchManager
- (BOOL)_checkLaunchForBackoff:(id)a3 error:(id *)a4;
- (RBLaunchManager)init;
- (RBLaunchManager)initWithJobManager:(id)a3 timeProvider:(id)a4 delegate:(id)a5;
- (id)_resolveNewProcessForInstance:(id)a3 requestIdentity:(id)a4 context:(id)a5 withError:(id *)a6;
- (id)executeLaunchRequest:(id)a3 existingProcess:(id)a4 requestIdentity:(id)a5 withError:(id *)a6;
- (void)_validateBundleIDForProcess:(id)a3 launchedWithContext:(id)a4;
@end

@implementation RBLaunchManager

- (void)_validateBundleIDForProcess:(id)a3 launchedWithContext:(id)a4
{
  id v5 = a3;
  v6 = [a4 bundleIdentifier];
  v7 = [v5 bundleProperties];

  v8 = [v7 bundleIdentifier];

  if (v6 && v8 && ([v8 isEqualToString:v6] & 1) == 0)
  {
    v9 = rbs_process_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchManager _validateBundleIDForProcess:launchedWithContext:]();
    }
  }
}

- (id)executeLaunchRequest:(id)a3 existingProcess:(id)a4 requestIdentity:(id)a5 withError:(id *)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [v12 isExtension];
  if (v11 && (v13 & 1) == 0)
  {
    v14 = rbs_process_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v48 = v12;
      __int16 v49 = 2114;
      id v50 = v11;
      _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_INFO, "%{public}@ is already running as %{public}@", buf, 0x16u);
    }

    if (a6)
    {
      uint64_t v15 = *MEMORY[0x263F646A8];
      v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v16 setObject:@"The process was already running." forKey:*MEMORY[0x263F08338]];
      v17 = [MEMORY[0x263F087E8] errorWithDomain:v15 code:2 userInfo:v16];

      *a6 = v17;
    }
    id v18 = v11;
    goto LABEL_38;
  }
  id v19 = v12;
  if (([v19 isEmbeddedApplication] & 1) != 0
    || ([v19 hasConsistentLaunchdJob] & 1) != 0
    || [v19 isExtension])
  {
  }
  else
  {
    char v37 = [v19 isDext];

    if ((v37 & 1) == 0)
    {
      v38 = rbs_process_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v19;
        _os_log_impl(&dword_226AB3000, v38, OS_LOG_TYPE_INFO, "%{public}@ could not be launched", buf, 0xCu);
      }

      if (a6)
      {
        uint64_t v39 = *MEMORY[0x263F646A8];
        v40 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
        objc_msgSend(v40, "setObject:forKey:", @"Launch prevented due to invalid parameters; only apps, extensions or daemons can be launched by RunningBoard",
          *MEMORY[0x263F08338]);
        v41 = [MEMORY[0x263F087E8] errorWithDomain:v39 code:1 userInfo:v40];

        id v18 = 0;
        *a6 = v41;
        goto LABEL_38;
      }
      goto LABEL_35;
    }
  }
  if (!v11 && ![(RBLaunchManager *)self _checkLaunchForBackoff:v19 error:a6])
  {
LABEL_35:
    id v18 = 0;
    goto LABEL_38;
  }
  v20 = [v10 _additionalEnvironment];
  v21 = RBSStringForKey();

  if (v21) {
    [v10 setHomeDirectory:v21];
  }
  v22 = [v10 _additionalEnvironment];
  v23 = RBSStringForKey();

  if (v23) {
    [v10 setTmpDirectory:v23];
  }
  jobManager = self->_jobManager;
  id v46 = 0;
  v25 = [(RBLaunchdJobManager *)jobManager createAndLaunchWithIdentity:v19 context:v10 error:&v46];
  id v26 = v46;
  v27 = v26;
  if (v25)
  {
    id v45 = v26;
    if (!v11) {
      goto LABEL_24;
    }
    [v11 identifier];
    id v43 = v10;
    v28 = v23;
    v30 = v29 = a6;
    [v25 identifier];
    v31 = v44 = v21;
    int v32 = [v30 isEqual:v31];

    v21 = v44;
    a6 = v29;
    v23 = v28;
    id v10 = v43;
    if (v32)
    {
      v33 = rbs_process_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = [v11 identifier];
        *(_DWORD *)buf = 138543618;
        id v48 = v19;
        __int16 v49 = 2114;
        id v50 = v34;
        _os_log_impl(&dword_226AB3000, v33, OS_LOG_TYPE_INFO, "returning existing extension %{public}@ already running as pid %{public}@", buf, 0x16u);

        v21 = v44;
      }

      id v35 = v11;
    }
    else
    {
LABEL_24:
      id v35 = [(RBLaunchManager *)self _resolveNewProcessForInstance:v25 requestIdentity:v19 context:v10 withError:a6];
    }
    id v18 = v35;
    v27 = v45;
  }
  else
  {
    v36 = rbs_general_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchManager executeLaunchRequest:existingProcess:requestIdentity:withError:]();
    }

    if (a6)
    {
      _errorWithRequestCodeAndInfoBuilder((void *)*MEMORY[0x263F646A8], 5, @"Launch failed.", v27, 0);
      id v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = 0;
    }
  }

LABEL_38:
  return v18;
}

- (id)_resolveNewProcessForInstance:(id)a3 requestIdentity:(id)a4 context:(id)a5 withError:(id *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [v10 identifier];
  v14 = +[RBLaunchdProperties propertiesForPid:](RBLaunchdProperties, "propertiesForPid:", [v13 pid]);

  if (!v14)
  {
    uint64_t v15 = rbs_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:]();
    }
  }
  if ([v14 hasBackoff])
  {
    launchTracker = self->_launchTracker;
    v17 = [v10 identity];
    [(RBLaunchTracker *)launchTracker trackLaunchOfIdentity:v17];
  }
  if ([v11 osServiceType] == 3 && v14 && (objc_msgSend(v14, "isAngel") & 1) == 0)
  {
    id v26 = rbs_general_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:]();
    }

    [(RBLaunchdJobManager *)self->_jobManager removeJobWithInstance:v10 error:0];
    if (a6)
    {
      uint64_t v27 = *MEMORY[0x263F646A8];
      v28 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v28 setObject:@"Unsupported Angel launch request." forKey:*MEMORY[0x263F08338]];
      v29 = [MEMORY[0x263F087E8] errorWithDomain:v27 code:5 userInfo:v28];

      id v19 = 0;
      *a6 = v29;
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v19 = objc_msgSend(WeakRetained, "_lifecycleQueue_addProcessWithInstance:properties:", v10, v14);

    if (v19)
    {
      [(RBLaunchManager *)self _validateBundleIDForProcess:v19 launchedWithContext:v12];
      id v20 = v19;
    }
    else
    {
      v21 = rbs_general_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543362;
        id v31 = v10;
        _os_log_impl(&dword_226AB3000, v21, OS_LOG_TYPE_DEFAULT, "Failed to create process object for %{public}@", (uint8_t *)&v30, 0xCu);
      }

      [(RBLaunchdJobManager *)self->_jobManager removeJobWithInstance:v10 error:0];
      if (a6)
      {
        uint64_t v22 = *MEMORY[0x263F646A8];
        v23 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
        [v23 setObject:@"Launched process exited during launch." forKey:*MEMORY[0x263F08338]];
        v24 = [MEMORY[0x263F087E8] errorWithDomain:v22 code:5 userInfo:v23];

        *a6 = v24;
      }
    }
  }
  return v19;
}

- (BOOL)_checkLaunchForBackoff:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(RBLaunchTracker *)self->_launchTracker nextAllowedLaunchOfIdentity:v6];
  double v8 = v7;
  if (v7 != 0.0)
  {
    v9 = rbs_general_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchManager _checkLaunchForBackoff:error:]((uint64_t)v6, v9, v8);
    }

    if (a4)
    {
      uint64_t v10 = *MEMORY[0x263F646A8];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke;
      v14[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
      *(double *)&v14[4] = v8;
      id v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
      [v11 setObject:@"Launch Request throttled." forKey:*MEMORY[0x263F08338]];
      __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke((uint64_t)v14, v11);
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:v10 code:6 userInfo:v11];

      *a4 = v12;
    }
  }

  return v8 == 0.0;
}

- (RBLaunchManager)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBLaunchManager.m" lineNumber:114 description:@"-init is not allowed on RBProcessManager"];

  return 0;
}

- (RBLaunchManager)initWithJobManager:(id)a3 timeProvider:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RBLaunchManager;
  id v12 = [(RBLaunchManager *)&v18 init];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_jobManager, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = [[RBLaunchTracker alloc] initWithTimeProvider:v10];
    launchTracker = v13->_launchTracker;
    v13->_launchTracker = v14;

    v16 = v13;
  }

  return v13;
}

void __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithDouble:v3];
  [v4 setObject:v5 forKey:*MEMORY[0x263F646C0]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTracker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_jobManager, 0);
}

- (void)_validateBundleIDForProcess:launchedWithContext:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_226AB3000, v1, OS_LOG_TYPE_FAULT, "RunningBoard launch requested for identifier %{public}@ launched process with different identifier %{public}@", v2, 0x16u);
}

- (void)_checkLaunchForBackoff:(double)a3 error:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_226AB3000, a2, OS_LOG_TYPE_ERROR, "Launch throttled for %{public}@ until %lf", (uint8_t *)&v3, 0x16u);
}

- (void)_resolveNewProcessForInstance:requestIdentity:context:withError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_226AB3000, v0, OS_LOG_TYPE_FAULT, "Angel launch attempted for non-angel %{public}@", v1, 0xCu);
}

- (void)_resolveNewProcessForInstance:requestIdentity:context:withError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226AB3000, v0, OS_LOG_TYPE_ERROR, "New process launch resulted in nil properties for %{public}@", v1, 0xCu);
}

- (void)executeLaunchRequest:existingProcess:requestIdentity:withError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_226AB3000, v0, OS_LOG_TYPE_ERROR, "Launch failed with %{public}@", v1, 0xCu);
}

@end