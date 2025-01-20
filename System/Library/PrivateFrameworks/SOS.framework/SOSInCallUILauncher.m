@interface SOSInCallUILauncher
+ (SOSInCallUILauncher)sharedInCallUILauncher;
+ (id)SOSRemoteAlertActivationReasonForSOSInCallUILaunchReason:(int64_t)a3;
- (SOSProcessObserver)processObserver;
- (void)launchInCallUIForReason:(int64_t)a3 withRequestURL:(id)a4 completion:(id)a5;
- (void)processObserver:(id)a3 bundleIdentifier:(id)a4 didUpdateApplicationRunning:(BOOL)a5;
- (void)setProcessObserver:(id)a3;
@end

@implementation SOSInCallUILauncher

+ (SOSInCallUILauncher)sharedInCallUILauncher
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SOSInCallUILauncher_sharedInCallUILauncher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInCallUILauncher_onceToken != -1) {
    dispatch_once(&sharedInCallUILauncher_onceToken, block);
  }
  v2 = (void *)sharedInCallUILauncher_sInCallUILauncher;

  return (SOSInCallUILauncher *)v2;
}

uint64_t __45__SOSInCallUILauncher_sharedInCallUILauncher__block_invoke(uint64_t a1)
{
  sharedInCallUILauncher_sInCallUILauncher = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (void)launchInCallUIForReason:(int64_t)a3 withRequestURL:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = sos_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v36 = a3;
    _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "launched for reason: %ld", buf, 0xCu);
  }

  v11 = [(id)objc_opt_class() SOSRemoteAlertActivationReasonForSOSInCallUILaunchReason:a3];
  switch(a3)
  {
    case 1:
    case 2:
    case 4:
      v12 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v12 setScheme:@"telSOS"];
      v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"reason" value:v11];
      v34 = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      [v12 setQueryItems:v14];

      v15 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      v16 = [v12 URL];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke;
      v30 = &unk_1E6064A28;
      id v31 = v9;
      [v15 openURL:v16 configuration:0 completionHandler:&v27];

      v17 = [(SOSInCallUILauncher *)self processObserver];

      if (!v17)
      {
        v18 = [[SOSProcessObserver alloc] initWithBundleIdentifier:@"com.apple.InCallService"];
        [(SOSInCallUILauncher *)self setProcessObserver:v18];
      }
      v19 = [(SOSInCallUILauncher *)self processObserver];
      [v19 setDelegate:self];

      goto LABEL_14;
    case 3:
      id v20 = objc_alloc(MEMORY[0x1E4FA6BB0]);
      v21 = TUInCallRemoteAlertViewControllerClassName();
      v12 = [v20 initWithServiceName:@"com.apple.InCallService" viewControllerClassName:v21];

      v22 = [MEMORY[0x1E4FA6BC8] lookupHandlesForDefinition:v12 creatingIfNone:1];
      v23 = [v22 firstObject];

      [v23 addObserver:self];
      id v24 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
      [v24 setReason:v11];
      if (v8)
      {
        v25 = [v8 absoluteString];
        if ([v25 length])
        {
          v32 = @"SOSRemoteAlertActivationContextUserInfoRequestURLString";
          v33 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          [v24 setUserInfo:v26];
        }
      }
      [v23 activateWithContext:v24];

      goto LABEL_14;
    case 5:
      v12 = sos_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SOSInCallUILauncher launchInCallUIForReason:withRequestURL:completion:](v12);
      }
LABEL_14:

      break;
    default:
      break;
  }
}

void __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke_2;
  v6[3] = &unk_1E6064470;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __73__SOSInCallUILauncher_launchInCallUIForReason_withRequestURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "Launched SOS URL with error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

+ (id)SOSRemoteAlertActivationReasonForSOSInCallUILaunchReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"SOSRemoteAlertAcivationReasonNone";
  }
  else {
    return off_1E6064F08[a3 - 1];
  }
}

- (void)processObserver:(id)a3 bundleIdentifier:(id)a4 didUpdateApplicationRunning:(BOOL)a5
{
  if (!a5)
  {
    uint64_t v6 = [(SOSInCallUILauncher *)self processObserver];
    [v6 setDelegate:0];

    uint64_t v7 = MEMORY[0x1E4F14428];
    dispatch_async(v7, &__block_literal_global_9);
  }
}

void __84__SOSInCallUILauncher_processObserver_bundleIdentifier_didUpdateApplicationRunning___block_invoke()
{
  v0 = sos_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_DEFAULT, "InCallService process has stopped running, setting current sos initiation state to idle", v2, 2u);
  }

  v1 = +[SOSManager sharedInstance];
  [v1 setCurrentSOSInitiationState:0];
}

- (SOSProcessObserver)processObserver
{
  return self->_processObserver;
}

- (void)setProcessObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)launchInCallUIForReason:(os_log_t)log withRequestURL:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "Unexpected attempt to launch in-call UI with SOSInCallUILaunchReasonSOSAlertRestingScreen", v1, 2u);
}

@end