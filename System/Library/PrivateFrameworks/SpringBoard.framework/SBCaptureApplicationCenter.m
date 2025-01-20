@interface SBCaptureApplicationCenter
+ (id)captureApplicationSettings;
+ (id)sharedInstance;
- (BOOL)_bundleHasCameraEntitlement:(id)a3;
- (BOOL)_isTCCGrantedForKey:(__CFString *)a3 applicationBundleIdentifier:(id)a4;
- (BOOL)_shouldPromptLaunchTerminationAlertForTerminationInfo:(id)a3;
- (BOOL)isApplicationLaunchNeededForApplicationBundleIdentifier:(id)a3;
- (BOOL)launchCaptureApplication:(id)a3 source:(int64_t)a4;
- (BOOL)launchForExtensionToApplicationTransition:(id)a3 launchActions:(id)a4 completionHandler:(id)a5;
- (BOOL)shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:(id)a3;
- (LCSCaptureApplicationMonitor)captureApplicationMonitor;
- (OS_dispatch_queue)queue;
- (SBCaptureApplicationCenter)init;
- (id)_terminationInfoList;
- (id)captureApplicationForBundleIdentifier:(id)a3;
- (id)captureApplicationForExtensionIdentifier:(id)a3;
- (id)knownCaptureApplications;
- (id)predictedPrewarmBundleIdentifierForApplicationBundleIdentifier:(id)a3;
- (void)_storeTerminationInfoWithProcessName:(id)a3 reason:(id)a4;
- (void)_terminationInfoList;
- (void)addObserver:(id)a3;
- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4;
- (void)promptLaunchTerminationAlertIfNecessaryForProcess:(id)a3 afterDelay:(double)a4 reason:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)suspendCaptureApplication:(id)a3;
@end

@implementation SBCaptureApplicationCenter

- (id)captureApplicationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__39;
  v16 = __Block_byref_object_dispose__39;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SBCaptureApplicationCenter_captureApplicationForBundleIdentifier___block_invoke;
  block[3] = &unk_1E6AF6380;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBCaptureApplicationCenter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_14 != -1) {
    dispatch_once(&sharedInstance_onceToken_14, block);
  }
  v2 = (void *)sharedInstance___result_0;
  return v2;
}

uint64_t __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 extension];
  id v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) knownCaptureApplicationsByBundleIdentifier];
  v3 = [v2 allValues];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke_2;
  v7[3] = &unk_1E6AFF9A8;
  id v8 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __68__SBCaptureApplicationCenter_captureApplicationForBundleIdentifier___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 16) knownCaptureApplicationsByBundleIdentifier];
  uint64_t v2 = [v5 objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)captureApplicationForExtensionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__39;
  v16 = __Block_byref_object_dispose__39;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke;
  block[3] = &unk_1E6AF6380;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__SBCaptureApplicationCenter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)sharedInstance___result_0;
  sharedInstance___result_0 = (uint64_t)v1;
}

+ (id)captureApplicationSettings
{
  if (captureApplicationSettings_onceToken != -1) {
    dispatch_once(&captureApplicationSettings_onceToken, &__block_literal_global_121);
  }
  uint64_t v2 = (void *)captureApplicationSettings_settings;
  return v2;
}

void __56__SBCaptureApplicationCenter_captureApplicationSettings__block_invoke()
{
  uint64_t v0 = +[SBCaptureApplicationDomain rootSettings];
  id v1 = (void *)captureApplicationSettings_settings;
  captureApplicationSettings_settings = v0;
}

- (SBCaptureApplicationCenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBCaptureApplicationCenter;
  uint64_t v2 = [(SBCaptureApplicationCenter *)&v9 init];
  if (v2)
  {
    uint64_t v3 = (LCSCaptureApplicationMonitor *)objc_alloc_init(MEMORY[0x1E4F73080]);
    captureApplicationMonitor = v2->_captureApplicationMonitor;
    v2->_captureApplicationMonitor = v3;

    [(LCSCaptureApplicationMonitor *)v2->_captureApplicationMonitor addObserver:v2];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SpringBoardFramework.SBCaptureApplicationCenter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = (id)[(id)objc_opt_class() captureApplicationSettings];
  }
  return v2;
}

- (id)knownCaptureApplications
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__39;
  id v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBCaptureApplicationCenter_knownCaptureApplications__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__SBCaptureApplicationCenter_knownCaptureApplications__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) knownCaptureApplicationsByBundleIdentifier];
  uint64_t v2 = [v6 allValues];
  uint64_t v3 = objc_msgSend(v2, "bs_set");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)launchCaptureApplication:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SBCaptureApplicationCenter *)self captureApplicationForBundleIdentifier:v6];

  if (v7)
  {
    uint64_t v8 = +[SBWorkspace mainWorkspace];
    objc_super v9 = +[SBApplicationController sharedInstance];
    id v10 = [v9 applicationWithBundleIdentifier:v6];

    id v11 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v10];
    uint64_t v12 = [v8 createRequestForApplicationActivation:v11 options:0];
    [v12 setEventLabel:@"CaptureApplicationLaunch"];
    v13 = [MEMORY[0x1E4F4F7F8] processHandle];
    [v12 setOriginatingProcess:v13];

    [v12 setSource:a4];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __62__SBCaptureApplicationCenter_launchCaptureApplication_source___block_invoke;
    v19 = &unk_1E6AF5638;
    v20 = self;
    id v21 = v6;
    [v12 modifyApplicationContext:&v16];
    char v14 = objc_msgSend(v8, "executeTransitionRequest:", v12, v16, v17, v18, v19, v20);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

void __62__SBCaptureApplicationCenter_launchCaptureApplication_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 applicationSceneEntities];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SBCaptureApplicationCenter_launchCaptureApplication_source___block_invoke_2;
  v5[3] = &unk_1E6AFF9D0;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(v3, "bs_each:", v5);
}

void __62__SBCaptureApplicationCenter_launchCaptureApplication_source___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setFlag:1 forActivationSetting:35];
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]()) {
    int v3 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  }
  else {
    int v3 = 0;
  }
  if ((LCSFeatureEnabled() & 1) != 0 || v3)
  {
    [v4 setFlag:1 forActivationSetting:36];
    if (([*(id *)(a1 + 32) shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:*(void *)(a1 + 40)] & 1) == 0)objc_msgSend(v4, "setFlag:forActivationSetting:", 1, 38); {
  }
    }
}

- (id)predictedPrewarmBundleIdentifierForApplicationBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  id v6 = v4;
  if ([v6 isEqualToString:@"com.apple.camera"]) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v8 = v6;
  if (!v7)
  {
    objc_super v9 = [(SBCaptureApplicationCenter *)self captureApplicationForBundleIdentifier:v6];
    uint64_t v8 = v6;
    if (v9)
    {
      id v10 = +[SBLockScreenManager sharedInstanceIfExists];
      int v11 = [v10 wouldAttemptToHandleATransitionRequest];

      uint64_t v8 = v6;
      if (v11)
      {
        uint64_t v12 = [v9 extension];
        uint64_t v8 = [v12 bundleIdentifier];
      }
    }
  }
  v13 = SBLogCaptureApplication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Possible prewarm bundle identifier %@", (uint8_t *)&v15, 0xCu);
  }

  return v8;
}

- (BOOL)launchForExtensionToApplicationTransition:(id)a3 launchActions:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = +[SBApplicationController sharedInstance];
    int v11 = [v10 applicationWithBundleIdentifier:v7];

    uint64_t v12 = +[SBWorkspace mainWorkspace];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke;
    v16[3] = &unk_1E6AF5F80;
    id v17 = v11;
    id v18 = v8;
    id v19 = v7;
    id v20 = v9;
    id v13 = v11;
    char v14 = [v12 requestTransitionWithBuilder:v16];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

void __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabel:@"CaptureApplicationExtensionToApplicationLaunch"];
  [v3 setSource:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6AFF2B0;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  [v3 modifyApplicationContext:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_3;
  v5[3] = &unk_1E6AF5A50;
  id v6 = a1[7];
  id v4 = (id)[v3 addCompletionHandler:v5];
}

void __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v5 = a2;
  id v3 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:a1[4]];
  [(SBApplicationSceneEntity *)v3 addActions:a1[5]];
  [(SBWorkspaceEntity *)v3 setFlag:1 forActivationSetting:60];
  id v4 = [NSString stringWithFormat:@"CaptureExtensionToAppTransition for %@", a1[6]];
  [(SBWorkspaceEntity *)v3 setObject:v4 forActivationSetting:61];

  if (LCSFeatureEnabled()) {
    [(SBWorkspaceEntity *)v3 setFlag:1 forActivationSetting:37];
  }
  [v5 setEntity:v3 forLayoutRole:1];
}

uint64_t __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)suspendCaptureApplication:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[SBApplicationController sharedInstance];
    id v8 = [v4 applicationWithBundleIdentifier:v3];

    id v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v8];
    id v6 = [(SBApplicationSceneEntity *)v5 sceneHandle];
    id v7 = v6;
    if (v6) {
      SBWorkspaceSuspendApplicationScene(v6);
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        id v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (v5) {
    [(NSHashTable *)self->_observers removeObject:v5];
  }
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (BOOL)_bundleHasCameraEntitlement:(id)a3
{
  id v3 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:a3 allowPlaceholder:1 error:0];
  id v4 = [v3 entitlements];
  id v5 = self;
  id v6 = [v4 objectForKey:@"com.apple.private.tcc.allow" ofClass:v5];

  LOBYTE(v5) = [v6 containsObject:*MEMORY[0x1E4FA9A38]];
  return (char)v5;
}

- (BOOL)isApplicationLaunchNeededForApplicationBundleIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)SBApp privacyPreflightController];
  id v6 = +[SBApplicationController sharedInstance];
  id v7 = [v6 applicationWithBundleIdentifier:v4];

  id v8 = [v7 info];
  id v9 = [v8 applicationIdentity];
  int v10 = [v5 requiresPreflightForApplication:v9];

  if (v10)
  {
    int v11 = SBLogCaptureApplication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Preflight is required for this capture application, application launch is required for %@", (uint8_t *)&v17, 0xCu);
    }

    char v12 = 1;
  }
  else if ([(SBCaptureApplicationCenter *)self _bundleHasCameraEntitlement:v4])
  {
    id v13 = SBLogCaptureApplication();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Application is entitled to have camera access %@", (uint8_t *)&v17, 0xCu);
    }

    char v12 = 0;
  }
  else
  {
    BOOL v14 = [(SBCaptureApplicationCenter *)self _isTCCGrantedForKey:*MEMORY[0x1E4FA9A38] applicationBundleIdentifier:v4];
    int v15 = SBLogCaptureApplication();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v4;
      __int16 v19 = 1024;
      BOOL v20 = v14;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "TCC state for application %@: %{BOOL}u", (uint8_t *)&v17, 0x12u);
    }

    char v12 = !v14;
  }

  return v12;
}

- (BOOL)shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)SBApp privacyPreflightController];
  id v6 = +[SBApplicationController sharedInstance];
  id v7 = [v6 applicationWithBundleIdentifier:v4];

  id v8 = [v7 info];
  id v9 = [v8 applicationIdentity];
  int v10 = [v5 requiresPreflightForApplication:v9];

  if (v10)
  {
    int v11 = SBLogCaptureApplication();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:
      BOOL v16 = 0;
      goto LABEL_20;
    }
    int v21 = 138412290;
    id v22 = v4;
    char v12 = "Preflight is required for this capture application %@, we will not install launch monitoring";
LABEL_18:
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, 0xCu);
    goto LABEL_19;
  }
  if ([(SBCaptureApplicationCenter *)self _bundleHasCameraEntitlement:v4])
  {
    int v11 = SBLogCaptureApplication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v4;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Application is entitled to have camera access %@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    int v11 = [(SBCaptureApplicationCenter *)self captureApplicationForBundleIdentifier:v4];
    id v13 = [v11 attributes];
    uint64_t v14 = [v13 cameraTCCStatus];

    if (v14 != 4)
    {
      int v17 = [v11 attributes];
      uint64_t v18 = [v17 cameraTCCStatus];

      if (!v18)
      {
        __int16 v19 = SBLogCaptureApplication();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SBCaptureApplicationCenter shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:]();
        }
      }
      int v11 = SBLogCaptureApplication();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v21 = 138412290;
      id v22 = v4;
      char v12 = "Camera cannot be used yet for this capture application %@, we will not install launch monitoring";
      goto LABEL_18;
    }
    int v15 = SBLogCaptureApplication();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v4;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Camera TCC is allowed for this capture application %@", (uint8_t *)&v21, 0xCu);
    }
  }
  BOOL v16 = 1;
LABEL_20:

  return v16;
}

- (BOOL)_isTCCGrantedForKey:(__CFString *)a3 applicationBundleIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)TCCAccessCopyInformation();
    id v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      id v8 = (void *)MEMORY[0x1E4FA99D8];
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          int v11 = objc_msgSend(v10, "objectForKeyedSubscript:", *v8, (void)v14);

          if (v11)
          {
            char v12 = CFBundleGetIdentifier((CFBundleRef)v11);
            if ([v12 isEqualToString:v4])
            {
              id v6 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FA99E8]];

              if (v6) {
                LOBYTE(v6) = CFBooleanGetValue((CFBooleanRef)v6) != 0;
              }

              goto LABEL_17;
            }
          }
        }
        id v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 captureApplicationCenter:self didUpdateKnownApplications:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)promptLaunchTerminationAlertIfNecessaryForProcess:(id)a3 afterDelay:(double)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [[SBCaptureApplicationTerminationInfo alloc] initWithProcessName:v8 terminationReason:v9];
  if ([(SBCaptureApplicationCenter *)self _shouldPromptLaunchTerminationAlertForTerminationInfo:v10])
  {
    objc_initWeak(&location, self);
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__SBCaptureApplicationCenter_promptLaunchTerminationAlertIfNecessaryForProcess_afterDelay_reason___block_invoke;
    block[3] = &unk_1E6AFF9F8;
    objc_copyWeak(&v17, &location);
    id v14 = v8;
    id v15 = v9;
    long long v16 = v10;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v12 = SBLogCaptureApplication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureApplicationCenter promptLaunchTerminationAlertIfNecessaryForProcess:afterDelay:reason:]();
    }
  }
}

void __98__SBCaptureApplicationCenter_promptLaunchTerminationAlertIfNecessaryForProcess_afterDelay_reason___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = SBLogCaptureApplication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Presenting launch termination alert for process: %{public}@, termination reason: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [[SBCaptureApplicationTerminationAlertItem alloc] initWithTerminationInfo:*(void *)(a1 + 48)];
  uint64_t v7 = +[SBAlertItemsController sharedInstance];
  [v7 activateAlertItem:v6];

  [WeakRetained _storeTerminationInfoWithProcessName:*(void *)(a1 + 32) reason:*(void *)(a1 + 40)];
}

- (id)_terminationInfoList
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 objectForKey:@"SBCaptureApplicationTerminationInfoList"];

  if (!v6)
  {
LABEL_6:
    uint64_t v7 = objc_opt_new();
    goto LABEL_10;
  }
  id v13 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v4 fromData:v6 error:&v13];
  id v8 = v13;
  uint64_t v9 = SBLogCaptureApplication();
  __int16 v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureApplicationCenter _terminationInfoList]();
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Successfully unarchived terminationInfoList", buf, 2u);
  }

LABEL_10:
  return v7;
}

- (void)_storeTerminationInfoWithProcessName:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[SBCaptureApplicationTerminationInfo alloc] initWithProcessName:v7 terminationReason:v6];

  uint64_t v9 = [(SBCaptureApplicationCenter *)self _terminationInfoList];
  __int16 v10 = (void *)[v9 mutableCopy];

  [v10 addObject:v8];
  uint64_t v11 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v12 = (void *)[v10 copy];
  id v19 = 0;
  id v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v19];
  id v14 = v19;

  if (v13)
  {
    id v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v15 setObject:v13 forKey:@"SBCaptureApplicationTerminationInfoList"];
  }
  long long v16 = SBLogCaptureApplication();
  id v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureApplicationCenter _storeTerminationInfoWithProcessName:reason:]();
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Successfully archived terminationInfoList", v18, 2u);
  }
}

- (BOOL)_shouldPromptLaunchTerminationAlertForTerminationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SBPlatformController sharedInstance];
  char v6 = [(id)v5 isInternalInstall];

  id v7 = [(SBCaptureApplicationCenter *)self _terminationInfoList];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__SBCaptureApplicationCenter__shouldPromptLaunchTerminationAlertForTerminationInfo___block_invoke;
  v10[3] = &unk_1E6AFFA20;
  id v11 = v4;
  id v8 = v4;
  LOBYTE(v5) = objc_msgSend(v7, "bs_containsObjectPassingTest:", v10);

  return v6 & (v5 ^ 1);
}

uint64_t __84__SBCaptureApplicationCenter__shouldPromptLaunchTerminationAlertForTerminationInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (LCSCaptureApplicationMonitor)captureApplicationMonitor
{
  return self->_captureApplicationMonitor;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_captureApplicationMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Camera TCC is undetermined for this capture application %@, which is unexpected!", v2, v3, v4, v5, v6);
}

- (void)promptLaunchTerminationAlertIfNecessaryForProcess:afterDelay:reason:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_ERROR, "Launch termination alert is ignored for process: %{public}@, termination reason: %{public}@", v2, 0x16u);
}

- (void)_terminationInfoList
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error unarchiving terminationInfoList: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_storeTerminationInfoWithProcessName:reason:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error archiving terminationInfoList: %{public}@", v2, v3, v4, v5, v6);
}

@end