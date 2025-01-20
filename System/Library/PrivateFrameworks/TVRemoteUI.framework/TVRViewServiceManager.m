@interface TVRViewServiceManager
+ (id)sharedInstance;
- (BOOL)canLaunchAsAnApp;
- (NSString)lastActiveEndpointIdentifier;
- (SBSRemoteAlertHandle)alertHandle;
- (TVRViewServiceConfigContext)viewServiceContext;
- (id)_actionForSetting:(unint64_t)a3 animationBlock:(id)a4;
- (id)_settingNameForValue:(unint64_t)a3;
- (void)_fetchActiveEndpointUID;
- (void)_launchViewServiceSuspended;
- (void)_prewarmWithLaunchViewService:(BOOL)a3 fetchActiveEndpoint:(BOOL)a4;
- (void)dismiss;
- (void)presentWithContext:(id)a3;
- (void)prewarm;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setAlertHandle:(id)a3;
- (void)setLastActiveEndpointIdentifier:(id)a3;
- (void)setViewServiceContext:(id)a3;
@end

@implementation TVRViewServiceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __39__TVRViewServiceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TVRViewServiceManager);
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BOOL)canLaunchAsAnApp
{
  return GestaltGetDeviceClass() != 3;
}

- (void)presentWithContext:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRUIViewServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 description];
    *(_DWORD *)buf = 136315394;
    v46 = "-[TVRViewServiceManager presentWithContext:]";
    __int16 v47 = 2114;
    v48 = v6;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s: context=%{public}@", buf, 0x16u);
  }
  os_signpost_id_t v7 = [@"com.apple.TVRemoteUI.Instrumentation" hash];
  v8 = _TVRUISignpostLog();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_227326000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TVRemoteUIAlertLaunch", "PresentWithContext", buf, 2u);
  }

  if ([(TVRViewServiceManager *)self canLaunchAsAnApp])
  {
    v10 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v10, OS_LOG_TYPE_DEFAULT, "Launching TVRemote App", buf, 2u);
    }

    v11 = [NSURL URLWithString:@"tvremote://"];
    uint64_t v12 = *MEMORY[0x263F3F608];
    v43[0] = *MEMORY[0x263F3F5E8];
    v43[1] = v12;
    v44[0] = MEMORY[0x263EFFA88];
    v44[1] = MEMORY[0x263EFFA88];
    uint64_t v13 = *MEMORY[0x263F3F5E0];
    v44[2] = v11;
    uint64_t v14 = *MEMORY[0x263F3F5C8];
    v43[2] = v13;
    v43[3] = v14;
    v15 = [v4 userInfo];
    v44[3] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];

    id v17 = objc_alloc_init(MEMORY[0x263F018D8]);
    [v17 setFrontBoardOptions:v16];
    v18 = [MEMORY[0x263F01880] defaultWorkspace];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __44__TVRViewServiceManager_presentWithContext___block_invoke;
    v42[3] = &unk_264801290;
    v42[4] = self;
    [v18 openApplicationWithBundleIdentifier:@"com.apple.TVRemoteUIService" usingConfiguration:v17 completionHandler:v42];

    v19 = _TVRUISignpostLog();
    v20 = v19;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_227326000, v20, OS_SIGNPOST_INTERVAL_END, v7, "TVRemoteUIAlertLaunch", "AnimationEnded", buf, 2u);
    }
  }
  else
  {
    if (GestaltGetDeviceClass() == 1)
    {
      v21 = _TVRUIViewServiceLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[TVRViewServiceManager presentWithContext:](v21);
      }
    }
    v11 = (void *)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.TVRemoteUIService" viewControllerClassName:@"TVRemoteAlertViewController"];
    id v16 = objc_alloc_init(MEMORY[0x263F79408]);
    v22 = [(TVRViewServiceManager *)self lastActiveEndpointIdentifier];

    if (v22)
    {
      v23 = [(TVRViewServiceManager *)self lastActiveEndpointIdentifier];
      [v4 setLastActiveEndpointIdentifier:v23];
    }
    v24 = [v4 userInfo];
    [v16 setUserInfo:v24];

    v25 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v16 userInfo];
      *(_DWORD *)buf = 138543362;
      v46 = v26;
      _os_log_impl(&dword_227326000, v25, OS_LOG_TYPE_DEFAULT, "View service manager set userInfo %{public}@", buf, 0xCu);
    }
    id v17 = (id)[MEMORY[0x263F79428] newHandleWithDefinition:v11 configurationContext:v16];
    [v17 registerObserver:self];
    id v27 = objc_alloc_init(MEMORY[0x263F793F8]);
    if ([v4 launchContext] == 9 || objc_msgSend(v4, "launchContext") == 7)
    {
      [v27 setActivatingForSiri:1];
      v28 = _TVRUIViewControllerLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [v4 launchContext];
        *(_DWORD *)buf = 134217984;
        v46 = (const char *)v29;
        _os_log_impl(&dword_227326000, v28, OS_LOG_TYPE_DEFAULT, "Setting activatingForSiri flag to YES. Launch Context %ld", buf, 0xCu);
      }
    }
    id v30 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v31 = [v4 presentationAnimations];

    if (v31)
    {
      v32 = _TVRUIViewServiceLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v32, OS_LOG_TYPE_DEFAULT, "View service manager client set presentation animations", buf, 2u);
      }

      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __44__TVRViewServiceManager_presentWithContext___block_invoke_33;
      v39[3] = &unk_264800E68;
      id v40 = v4;
      os_signpost_id_t v41 = v7;
      v33 = [(TVRViewServiceManager *)self _actionForSetting:1 animationBlock:v39];
      if (v33) {
        [v30 addObject:v33];
      }
    }
    v34 = [v4 dismissalAnimations];

    if (v34)
    {
      v35 = _TVRUIViewServiceLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v35, OS_LOG_TYPE_DEFAULT, "View service manager client set dismissal animations", buf, 2u);
      }

      v36 = [v4 dismissalAnimations];
      v37 = [(TVRViewServiceManager *)self _actionForSetting:2 animationBlock:v36];

      if (v37) {
        [v30 addObject:v37];
      }
    }
    if ([v30 count])
    {
      v38 = [MEMORY[0x263EFFA08] setWithSet:v30];
      [v27 setActions:v38];
    }
    [v17 activateWithContext:v27];
    [(TVRViewServiceManager *)self setAlertHandle:v17];
  }
}

void __44__TVRViewServiceManager_presentWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__TVRViewServiceManager_presentWithContext___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
}

void __44__TVRViewServiceManager_presentWithContext___block_invoke_33(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationAnimations];
  v2[2]();

  v3 = _TVRUISignpostLog();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_227326000, v4, OS_SIGNPOST_INTERVAL_END, v5, "TVRemoteUIAlertLaunch", "AnimationEnded", v6, 2u);
  }
}

- (void)dismiss
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _TVRUIViewServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[TVRViewServiceManager dismiss]";
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(TVRViewServiceManager *)self alertHandle];

  if (v4)
  {
    os_signpost_id_t v5 = [(TVRViewServiceManager *)self alertHandle];
    [v5 unregisterObserver:self];

    v6 = [(TVRViewServiceManager *)self alertHandle];
    [v6 invalidate];

    [(TVRViewServiceManager *)self setAlertHandle:0];
  }
}

- (void)prewarm
{
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_signpost_id_t v5 = _TVRUIViewServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[TVRViewServiceManager remoteAlertHandleDidDeactivate:]";
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(TVRViewServiceManager *)self alertHandle];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    v8 = [(TVRViewServiceManager *)self alertHandle];
    [v8 unregisterObserver:self];

    [(TVRViewServiceManager *)self setAlertHandle:0];
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  v6 = _TVRUIViewServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[TVRViewServiceManager remoteAlertHandle:didInvalidateWithError:]((uint64_t)v5, v6);
  }

  [(TVRViewServiceManager *)self setAlertHandle:0];
}

- (id)_actionForSetting:(unint64_t)a3 animationBlock:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v6 setObject:&unk_26DB65E00 forSetting:a3];
  int v7 = (void *)MEMORY[0x263F29BB8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__TVRViewServiceManager__actionForSetting_animationBlock___block_invoke;
  v12[3] = &unk_2648012B8;
  id v13 = v5;
  id v8 = v5;
  int v9 = [v7 responderWithHandler:v12];
  v10 = (void *)[objc_alloc(MEMORY[0x263F29BB0]) initWithInfo:v6 responder:v9];

  return v10;
}

uint64_t __58__TVRViewServiceManager__actionForSetting_animationBlock___block_invoke(uint64_t a1)
{
  v2 = _TVRUIViewServiceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "View service manager executing client animations", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_settingNameForValue:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v4 = @"Presentation";
  }
  else if (a3 == 2)
  {
    id v4 = @"Dismissal";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%ld)", a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_prewarmWithLaunchViewService:(BOOL)a3 fetchActiveEndpoint:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = _TVRUIPrewarmLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "TVRViewServiceManager", v8, 2u);
  }

  if (v5 && ![(TVRViewServiceManager *)self canLaunchAsAnApp]) {
    [(TVRViewServiceManager *)self _launchViewServiceSuspended];
  }
  if (v4) {
    [(TVRViewServiceManager *)self _fetchActiveEndpointUID];
  }
}

- (void)_fetchActiveEndpointUID
{
  uint64_t v3 = _TVRUIPrewarmLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Fetching active endpoint", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  BOOL v4 = (void *)MEMORY[0x263F7C9A0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__TVRViewServiceManager__fetchActiveEndpointUID__block_invoke;
  v7[3] = &unk_2648012E0;
  objc_copyWeak(&v8, buf);
  [v4 fetchActiveEndpointUIDWithCompletion:v7];
  BOOL v5 = _TVRUIPrewarmLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Cache last active endpoint", v6, 2u);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __48__TVRViewServiceManager__fetchActiveEndpointUID__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 3, a2);
    int v7 = _TVRUIPrewarmLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Last active endpoint %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_launchViewServiceSuspended
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_227326000, log, OS_LOG_TYPE_FAULT, "Launching TVRemote app in susupended mode unsupported", v1, 2u);
}

void __52__TVRViewServiceManager__launchViewServiceSuspended__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = _TVRUIPrewarmLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__TVRViewServiceManager__launchViewServiceSuspended__block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (TVRViewServiceConfigContext)viewServiceContext
{
  return self->_viewServiceContext;
}

- (void)setViewServiceContext:(id)a3
{
}

- (SBSRemoteAlertHandle)alertHandle
{
  return self->_alertHandle;
}

- (void)setAlertHandle:(id)a3
{
}

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_viewServiceContext, 0);
}

- (void)presentWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_227326000, log, OS_LOG_TYPE_FAULT, "Unsupported! - Launching as a view service", v1, 2u);
}

void __44__TVRViewServiceManager_presentWithContext___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_227326000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Error opening TV Remote: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)remoteAlertHandle:(uint64_t)a1 didInvalidateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[TVRViewServiceManager remoteAlertHandle:didInvalidateWithError:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "%s error=%{public}@", (uint8_t *)&v2, 0x16u);
}

void __52__TVRViewServiceManager__launchViewServiceSuspended__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "View service error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end