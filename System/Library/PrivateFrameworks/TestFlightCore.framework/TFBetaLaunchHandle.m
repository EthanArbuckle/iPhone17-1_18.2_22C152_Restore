@interface TFBetaLaunchHandle
- (BOOL)_remoteAlertShouldActivateForLaunchInfo:(id)a3;
- (BSProcessHandle)processHandle;
- (NSString)logKey;
- (TFBetaLaunchHandle)initWithProcessHandle:(id)a3;
- (TFBetaLaunchHandleActivationDelegate)activationDelegate;
- (void)_activateRemoteAlertWithLaunchInfo:(id)a3;
- (void)_updatedLaunchInfoForActivation:(id)a3;
- (void)activateIfNeeded;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setActivationDelegate:(id)a3;
@end

@implementation TFBetaLaunchHandle

- (TFBetaLaunchHandle)initWithProcessHandle:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFBetaLaunchHandle;
  v6 = [(TFBetaLaunchHandle *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processHandle, a3);
    uint64_t v8 = AMSGenerateLogCorrelationKey();
    logKey = v7->_logKey;
    v7->_logKey = (NSString *)v8;
  }
  return v7;
}

- (void)activateIfNeeded
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(TFBetaLaunchHandle *)self logKey];
    uint64_t v8 = [(TFBetaLaunchHandle *)self processHandle];
    v9 = [v8 bundleIdentifier];
    int v18 = 138543874;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: activateIfNeeded bundleId = %@", (uint8_t *)&v18, 0x20u);
  }
  v10 = [(TFBetaLaunchHandle *)self processHandle];
  objc_super v11 = [v10 bundleIdentifier];

  if (v11)
  {
    v12 = [MEMORY[0x263F25528] sharedInstance];
    v13 = [v12 getLaunchInfoForBundleID:v11];

    if ([(TFBetaLaunchHandle *)self _remoteAlertShouldActivateForLaunchInfo:v13])
    {
      [(TFBetaLaunchHandle *)self _activateRemoteAlertWithLaunchInfo:v13];
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    v13 = 0;
  }
  v15 = [(TFBetaLaunchHandle *)self activationDelegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = [(TFBetaLaunchHandle *)self activationDelegate];
    [v17 betaLaunchHandle:self activateIfNeededEndedWithResult:v14];
  }
}

- (BOOL)_remoteAlertShouldActivateForLaunchInfo:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFBetaLaunchHandle *)self logKey];
    int v25 = 138543874;
    v26 = v7;
    __int16 v27 = 2112;
    v28 = v9;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo launchInfo=%@", (uint8_t *)&v25, 0x20u);
  }
  if (!v4)
  {
    objc_super v11 = +[TFLogConfiguration defaultConfiguration];
    v12 = [v11 generatedLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = objc_opt_class();
      id v15 = v18;
      char v16 = [(TFBetaLaunchHandle *)self logKey];
      int v25 = 138543618;
      v26 = v18;
      __int16 v27 = 2112;
      v28 = v16;
      v17 = "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Not activating - Unconfigured launch info";
      goto LABEL_12;
    }
LABEL_13:
    BOOL v20 = 0;
    goto LABEL_14;
  }
  if (([v4 isLaunchScreenEnabled] & 1) == 0)
  {
    objc_super v11 = +[TFLogConfiguration defaultConfiguration];
    v12 = [v11 generatedLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      id v15 = v19;
      char v16 = [(TFBetaLaunchHandle *)self logKey];
      int v25 = 138543618;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = v16;
      v17 = "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Not activating - Launch screen disabled";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v10 = [v4 lastWelcomeScreenViewDate];

  objc_super v11 = +[TFLogConfiguration defaultConfiguration];
  v12 = [v11 generatedLogger];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      char v16 = [(TFBetaLaunchHandle *)self logKey];
      int v25 = 138543618;
      v26 = v14;
      __int16 v27 = 2112;
      v28 = v16;
      v17 = "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Not activating - Launch screen seen";
LABEL_12:
      _os_log_impl(&dword_223064000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, 0x16u);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v13)
  {
    __int16 v22 = objc_opt_class();
    id v23 = v22;
    uint64_t v24 = [(TFBetaLaunchHandle *)self logKey];
    int v25 = 138543618;
    v26 = v22;
    __int16 v27 = 2112;
    v28 = v24;
    _os_log_impl(&dword_223064000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _remoteAlertShouldActivateForLaunchInfo: Activating", (uint8_t *)&v25, 0x16u);
  }
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (void)_activateRemoteAlertWithLaunchInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFBetaLaunchHandle *)self logKey];
    int v22 = 138543874;
    id v23 = v7;
    __int16 v24 = 2112;
    int v25 = v9;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _activateRemoteAlertWithLaunchInfo launchInfo = %@", (uint8_t *)&v22, 0x20u);
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServiceTFBetaLaunchHostViewController"];
  id v11 = objc_alloc_init(MEMORY[0x263F79408]);
  v12 = [TFBetaLaunchHandleConfiguration alloc];
  BOOL v13 = [(TFBetaLaunchHandle *)self processHandle];
  uint64_t v14 = [v13 bundleIdentifier];
  id v15 = [(TFBetaLaunchHandleConfiguration *)v12 initWithBundleIdentifier:v14 preloadingLaunchInfo:v4];

  char v16 = [(TFBetaLaunchHandleConfiguration *)v15 encodedAsUserInfo];
  [v11 setUserInfo:v16];

  v17 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v10 configurationContext:v11];
  [v17 addObserver:self];
  id v18 = objc_alloc_init(MEMORY[0x263F793F8]);
  id v19 = objc_alloc(MEMORY[0x263F79438]);
  BOOL v20 = [(TFBetaLaunchHandle *)self processHandle];
  v21 = (void *)[v19 initWithTargetProcess:v20];
  [v18 setPresentationTarget:v21];

  [v17 activateWithContext:v18];
  [(TFBetaLaunchHandle *)self _updatedLaunchInfoForActivation:v4];
}

- (void)_updatedLaunchInfoForActivation:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFBetaLaunchHandle *)self logKey];
    *(_DWORD *)buf = 138543874;
    char v16 = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: _updatedLaunchInfoForActivation launchInfo = %@", buf, 0x20u);
  }
  v10 = [MEMORY[0x263EFF910] date];
  [v4 setLastWelcomeScreenViewDate:v10];

  id v11 = [MEMORY[0x263F25528] sharedInstance];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__TFBetaLaunchHandle__updatedLaunchInfoForActivation___block_invoke;
  v13[3] = &unk_26468E6D0;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v11 setLaunchInfo:v12 withCompletionHandler:v13];
}

void __54__TFBetaLaunchHandle__updatedLaunchInfoForActivation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = +[TFLogConfiguration defaultConfiguration];
    id v5 = [v4 generatedLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_opt_class();
      v7 = *(void **)(a1 + 40);
      id v8 = v6;
      v9 = [v7 version];
      v10 = [v9 bundleID];
      id v11 = [v3 localizedDescription];
      int v12 = 138543874;
      BOOL v13 = v6;
      __int16 v14 = 2114;
      id v15 = v10;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to update launch info after activation. error = %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFBetaLaunchHandle *)self logKey];
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    BOOL v13 = v9;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandleDidDeactivate", (uint8_t *)&v10, 0x16u);
  }
  [v4 removeObserver:self];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TFLogConfiguration defaultConfiguration];
  v9 = [v8 generatedLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = objc_opt_class();
    id v11 = v10;
    __int16 v12 = [(TFBetaLaunchHandle *)self logKey];
    BOOL v13 = [v6 localizedDescription];
    int v14 = 138543874;
    id v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v13;
    _os_log_impl(&dword_223064000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandle:didInvalidateWithError error=%@", (uint8_t *)&v14, 0x20u);
  }
  [v7 removeObserver:self];
}

- (TFBetaLaunchHandleActivationDelegate)activationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationDelegate);

  return (TFBetaLaunchHandleActivationDelegate *)WeakRetained;
}

- (void)setActivationDelegate:(id)a3
{
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);

  objc_destroyWeak((id *)&self->_activationDelegate);
}

@end