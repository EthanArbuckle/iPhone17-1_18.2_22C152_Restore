@interface SBDashBoardApplicationLauncher
- (BOOL)_backgroundLaunchWithBundleIdentifier:(id)a3 isCaptureApplicationLaunch:(BOOL)a4;
- (BOOL)_canHandleTransitionRequest:(id)a3 outActivatingSceneEntity:(id *)a4;
- (BOOL)_canPresentApplicationSceneEntity:(id)a3 fromSource:(id)a4 toDestination:(id)a5;
- (BOOL)_isCoverSheetHostingEntity:(id)a3;
- (BOOL)_presentApplicationSceneEntity:(id)a3 source:(int64_t)a4 fromRequest:(id)a5 withResult:(id)a6;
- (BOOL)handleEvent:(id)a3;
- (BOOL)handleTransitionRequest:(id)a3;
- (BOOL)launchCaptureApplication:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSCoverSheetViewController)coverSheetViewController;
- (NSString)coverSheetIdentifier;
- (SBDashBoardApplicationLauncher)init;
- (SBDashBoardCaptureLaunchPolicy)captureLaunchPolicy;
- (SBSecureAppManager)secureAppManager;
- (id)_captureExtensionBundleIdentifierForContainingApplication:(id)a3;
- (id)_createCaptureExtensionHostingFluidSwitcherViewControllerForEntity:(id)a3 isEphemeralSwitcher:(BOOL)a4;
- (id)captureApplicationForSceneEntity:(id)a3;
- (id)currentActivePrewarmReasons;
- (id)dashBoardCaptureExtensionHostingFluidSwitcherViewController:(id)a3 bestIconViewForApplicationBundleIdentifier:(id)a4;
- (id)prewarmConfigurationForIdentifier:(id)a3;
- (int64_t)participantState;
- (void)_activateAppSceneBelowDashBoard:(id)a3 hostableEntity:(id)a4 secureAppType:(unint64_t)a5 withActions:(id)a6 interactive:(BOOL)a7 completion:(id)a8;
- (void)_activateAppWithURL:(id)a3;
- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 actions:(id)a5 completion:(id)a6;
- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 asOverlay:(BOOL)a5 viaSwitcherModal:(BOOL)a6 request:(id)a7 actions:(id)a8 completion:(id)a9;
- (void)_attemptToUnlockToApplication:(id)a3 actions:(id)a4 completion:(id)a5;
- (void)_attemptToUnlockToCameraCompletion:(id)a3;
- (void)_coolCameraIfNecessaryForBundleIdentifier:(id)a3 prewarmReason:(id)a4;
- (void)_prewarmCameraForBundleIdentifier:(id)a3 prewarmReason:(id)a4;
- (void)_prewarmWithConfiguration:(id)a3 prewarmReason:(id)a4;
- (void)_reallyActivateAppSceneWithEntity:(id)a3 interactive:(BOOL)a4 withCompletion:(id)a5;
- (void)_stopTrackingPrewarmReason:(id)a3;
- (void)dealloc;
- (void)launchQuickNote;
- (void)notePrewarmRequestEndedForIdentifier:(id)a3;
- (void)notePrewarmRequestEndedForIdentifier:(id)a3 prewarmReason:(id)a4;
- (void)notePrewarmRequestWasUsefulForIdentifier:(id)a3;
- (void)prewarmCameraForIdentifier:(id)a3;
- (void)prewarmCameraForIdentifier:(id)a3 prewarmReason:(id)a4;
- (void)setCaptureLaunchPolicy:(id)a3;
- (void)setCoverSheetViewController:(id)a3;
- (void)setSecureAppManager:(id)a3;
@end

@implementation SBDashBoardApplicationLauncher

- (SBDashBoardApplicationLauncher)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardApplicationLauncher;
  v2 = [(SBDashBoardApplicationLauncher *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4F740]);
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    uint64_t v6 = [v3 initWithName:v5 onQueue:MEMORY[0x1E4F14428]];
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (BSEventQueue *)v6;
  }
  return v2;
}

- (void)dealloc
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalEventHandler:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardApplicationLauncher;
  [(SBDashBoardApplicationLauncher *)&v3 dealloc];
}

- (void)setCoverSheetViewController:(id)a3
{
  v5 = (CSCoverSheetViewController *)a3;
  if (self->_coverSheetViewController != v5)
  {
    uint64_t v6 = v5;
    [(CSCoverSheetViewController *)v5 registerExternalEventHandler:self];
    [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalEventHandler:self];
    objc_storeStrong((id *)&self->_coverSheetViewController, a3);
    v5 = v6;
  }
}

- (BOOL)handleTransitionRequest:(id)a3
{
  id v4 = a3;
  id v21 = 0;
  BOOL v5 = [(SBDashBoardApplicationLauncher *)self _canHandleTransitionRequest:v4 outActivatingSceneEntity:&v21];
  id v6 = v21;
  v7 = v6;
  if (v5)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke;
    v19[3] = &unk_1E6AF57C0;
    id v8 = v6;
    id v20 = v8;
    [v4 modifyApplicationContext:v19];
    [v4 finalize];
    id v9 = v8;
    v10 = [v9 application];
    if (+[SBSecureAppPolicy shouldAlwaysShowSecureSceneForApp:v10])
    {
      v11 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainSecureDisplay:v10];
      v12 = (void *)[v9 copyActivationSettings];
      [(SBWorkspaceEntity *)v11 applyActivationSettings:v12];
    }
    else
    {
      v11 = (SBDeviceApplicationSceneEntity *)v9;
    }
    v14 = SBLogDashBoard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(SBDashBoardApplicationLauncher *)v11 handleTransitionRequest:v14];
    }

    uint64_t v15 = [v4 source];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke_7;
    v17[3] = &unk_1E6AFCE30;
    id v18 = v4;
    BOOL v13 = [(SBDashBoardApplicationLauncher *)self _presentApplicationSceneEntity:v11 source:v15 fromRequest:v18 withResult:v17];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setFlag:1 forActivationSetting:40];
  [v4 setEntity:*(void *)(a1 + 32) forLayoutRole:1];
  id v5 = +[SBWorkspaceEntity entity];
  [v4 setEntity:v5 forLayoutRole:2];
}

void __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [*(id *)(a1 + 32) applicationContext];
  if ([v5 needsToSendActivationResult])
  {
    id v6 = FBSOpenApplicationErrorCreate();
    objc_msgSend(v5, "sendActivationResultError:", v6, v9);
  }
  uint64_t v7 = [*(id *)(a1 + 32) completionBlock];
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, a2 == 0);
  }
}

- (void)launchQuickNote
{
  objc_super v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"mobilenotes-quicknote://quicknote?launchedByPencil=1"];
  id v4 = SBWorkspaceApplicationForURLWithError(v3, 0, 0);
  id v5 = [v4 info];
  id v6 = [v5 applicationIdentity];

  uint64_t v7 = [(CSCoverSheetViewController *)self->_coverSheetViewController activeBehavior];
  LODWORD(v5) = [v7 areRestrictedCapabilities:0x2000];

  if (v5)
  {
    id v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v9 = "QuickNote launch restricted";
      v10 = (uint8_t *)&v14;
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    v11 = [(id)SBApp privacyPreflightController];
    int v12 = [v11 requiresPreflightForApplication:v6];

    if (!v12)
    {
      [(SBDashBoardApplicationLauncher *)self _activateAppWithURL:v3];
      goto LABEL_10;
    }
    id v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v9 = "QuickNote launch restricted due to privacy";
      v10 = (uint8_t *)&v13;
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (BOOL)launchCaptureApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[SBCaptureApplicationCenter sharedInstance];
  char v5 = [v4 launchCaptureApplication:v3 source:32];

  return v5;
}

- (void)prewarmCameraForIdentifier:(id)a3
{
}

- (void)prewarmCameraForIdentifier:(id)a3 prewarmReason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBDashBoardApplicationLauncher *)self prewarmConfigurationForIdentifier:v6];
  [(SBDashBoardApplicationLauncher *)self _prewarmWithConfiguration:v8 prewarmReason:v7];
  if (!self->_currentPrewarmIdentifiersToReasons)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentPrewarmIdentifiersToReasons = self->_currentPrewarmIdentifiersToReasons;
    self->_currentPrewarmIdentifiersToReasons = v9;
  }
  v11 = [v6 applicationBundleIdentifier];
  int v12 = [(NSMutableDictionary *)self->_currentPrewarmIdentifiersToReasons objectForKeyedSubscript:v11];

  if (v12)
  {
    __int16 v13 = SBLogDashBoard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "Identifier: %@ had existing reason: %@", buf, 0x16u);
    }
  }
  [(NSMutableDictionary *)self->_currentPrewarmIdentifiersToReasons setObject:v7 forKeyedSubscript:v11];
  __int16 v14 = [(NSMutableDictionary *)self->_prewarmIdentifiersToCancelTimers objectForKeyedSubscript:v11];
  [v14 invalidate];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CB00];
  id v18 = @"PrewarmIdentifier";
  v19 = v11;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v17 = [v15 scheduledTimerWithTimeInterval:self target:sel__stopTrackingPrewarmReason_ selector:v16 userInfo:0 repeats:3.0];

  [(NSMutableDictionary *)self->_prewarmIdentifiersToCancelTimers setObject:v17 forKeyedSubscript:v11];
}

- (void)_stopTrackingPrewarmReason:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:@"PrewarmIdentifier"];

  char v5 = [(NSMutableDictionary *)self->_prewarmIdentifiersToCancelTimers objectForKeyedSubscript:v6];
  [v5 invalidate];

  [(NSMutableDictionary *)self->_prewarmIdentifiersToCancelTimers setObject:0 forKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_currentPrewarmIdentifiersToReasons setObject:0 forKeyedSubscript:v6];
}

- (id)prewarmConfigurationForIdentifier:(id)a3
{
  captureLaunchPolicy = self->_captureLaunchPolicy;
  id v4 = a3;
  char v5 = +[SBCaptureApplicationCenter sharedInstance];
  id v6 = [(SBDashBoardCaptureLaunchPolicy *)captureLaunchPolicy prewarmingConfigurationForIdentifier:v4 captureApplicationProvider:v5];

  return v6;
}

- (void)notePrewarmRequestWasUsefulForIdentifier:(id)a3
{
  self->_cameraPrewarmSucceeded = 1;
}

- (void)notePrewarmRequestEndedForIdentifier:(id)a3
{
}

- (void)notePrewarmRequestEndedForIdentifier:(id)a3 prewarmReason:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBDashBoardApplicationLauncher *)self prewarmConfigurationForIdentifier:v6];
  id v9 = [v8 prewarmingBundleIdentifier];
  if (v9)
  {
    v10 = [v6 applicationBundleIdentifier];
    [(NSMutableDictionary *)self->_currentPrewarmIdentifiersToReasons setObject:0 forKeyedSubscript:v10];
    v11 = [(NSMutableDictionary *)self->_prewarmIdentifiersToCancelTimers objectForKeyedSubscript:v10];
    [v11 invalidate];

    [(NSMutableDictionary *)self->_prewarmIdentifiersToCancelTimers setObject:0 forKeyedSubscript:v10];
    int v12 = SBLogDashBoard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      __int16 v14 = v9;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Cooling camera for bundle identifier: %@", (uint8_t *)&v13, 0xCu);
    }

    [(SBDashBoardApplicationLauncher *)self _coolCameraIfNecessaryForBundleIdentifier:v9 prewarmReason:v7];
  }
  *(_WORD *)&self->_cameraIsPrewarming = 0;
}

- (id)currentActivePrewarmReasons
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_currentPrewarmIdentifiersToReasons allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSMutableDictionary *)self->_currentPrewarmIdentifiersToReasons objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];

  return v10;
}

- (void)_prewarmWithConfiguration:(id)a3 prewarmReason:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 prewarmCameraHardware];
  uint64_t v9 = [v6 prewarmForCaptureLaunch];
  int v10 = [v6 backgroundLaunch];
  v11 = [v6 applicationBundleIdentifier];
  long long v12 = SBLogDashBoard();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109890;
    *(_DWORD *)id v18 = v8;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v10;
    __int16 v19 = 1024;
    int v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Prewarming camera hardware: %{BOOL}u, prewarming background launch target: %{BOOL}u, prewarming for capture launch: %{BOOL}u, application bundle identifier: %@", (uint8_t *)&v17, 0x1Eu);
  }

  long long v13 = [v6 prewarmingBundleIdentifier];
  if (v13)
  {
    if (v8)
    {
      long long v14 = SBLogDashBoard();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        *(void *)id v18 = v13;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Prewarming camera for bundle identifier: %@", (uint8_t *)&v17, 0xCu);
      }

      [(SBDashBoardApplicationLauncher *)self _prewarmCameraForBundleIdentifier:v13 prewarmReason:v7];
    }
    if (v10)
    {
      long long v15 = SBLogDashBoard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        *(void *)id v18 = v13;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Background camera launch initiated for bundle identifier: %@", (uint8_t *)&v17, 0xCu);
      }

      [(SBDashBoardApplicationLauncher *)self _backgroundLaunchWithBundleIdentifier:v13 isCaptureApplicationLaunch:v9];
      *(_WORD *)&self->_cameraIsPrewarming = 1;
    }
  }
  else
  {
    v16 = SBLogDashBoard();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SBDashBoardApplicationLauncher _prewarmWithConfiguration:prewarmReason:]((uint64_t)v11, v16);
    }
  }
}

- (id)_captureExtensionBundleIdentifierForContainingApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[SBCaptureApplicationCenter sharedInstance];
  uint64_t v5 = [v4 captureApplicationForBundleIdentifier:v3];

  if (v5)
  {
    id v6 = [v5 extension];
    id v7 = [v6 bundleIdentifier];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (self->_secureAppAction) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 25)
  {
    [(SBInProcessSecureAppAction *)self->_secureAppAction invalidate];
    secureAppAction = self->_secureAppAction;
    self->_secureAppAction = 0;

    char v6 = [v4 isConsumable];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (id)dashBoardCaptureExtensionHostingFluidSwitcherViewController:(id)a3 bestIconViewForApplicationBundleIdentifier:(id)a4
{
  return (id)[(CSCoverSheetViewController *)self->_coverSheetViewController bestIconViewForApplicationBundleIdentifier:a4];
}

- (id)captureApplicationForSceneEntity:(id)a3
{
  id v3 = a3;
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]()) {
    int v4 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  }
  else {
    int v4 = 0;
  }
  if ((LCSFeatureEnabled() & 1) != 0 || (uint64_t v5 = 0, v4))
  {
    char v6 = [v3 application];
    id v7 = +[SBCaptureApplicationCenter sharedInstance];
    int v8 = [v6 bundleIdentifier];
    uint64_t v5 = [v7 captureApplicationForBundleIdentifier:v8];
  }
  return v5;
}

- (BOOL)_canHandleTransitionRequest:(id)a3 outActivatingSceneEntity:(id *)a4
{
  id v5 = a3;
  char v6 = [v5 displayIdentity];
  int v7 = [v6 isMainDisplay];

  if (v7
    && ((unint64_t v8 = [v5 source], v8 <= 0x3D) && ((1 << v8) & 0x20008001004C2134) != 0
     || v8 == 70
     || v8 == 67))
  {
    uint64_t v9 = [v5 applicationContext];
    if (([v9 isBackground] & 1) != 0
      || ([v9 entities],
          int v10 = objc_claimAutoreleasedReturnValue(),
          unint64_t v11 = [v10 count],
          v10,
          v11 > 1))
    {
      BOOL v12 = 0;
    }
    else
    {
      long long v13 = [v9 resolvedActivatingWorkspaceEntity];
      long long v14 = [v13 applicationSceneEntity];

      if ([v14 BOOLForActivationSetting:37])
      {
        BOOL v12 = 0;
      }
      else
      {
        long long v15 = [v14 application];
        int CanActivateWhilePasscodeLocked = SBWorkspaceApplicationCanActivateWhilePasscodeLocked(v15);

        int v17 = [v14 BOOLForActivationSetting:36];
        BOOL v12 = 0;
        if (v14 && CanActivateWhilePasscodeLocked | v17)
        {
          if (a4) {
            *a4 = v14;
          }
          BOOL v12 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_canPresentApplicationSceneEntity:(id)a3 fromSource:(id)a4 toDestination:(id)a5
{
  if (!a5) {
    return 1;
  }
  id v5 = objc_msgSend(a5, "placement", a3, a4);
  if (([v5 isEqual:SBDashBoardCapturePlacementCameraPage] & 1) != 0
    || ([v5 isEqual:SBDashBoardCapturePlacementCameraOverlay] & 1) != 0
    || ([v5 isEqual:SBDashBoardCapturePlacementCaptureButtonCameraPage] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 isEqual:SBDashBoardCapturePlacementSecureApp];
  }

  return v6;
}

- (BOOL)_isCoverSheetHostingEntity:(id)a3
{
  id v4 = a3;
  if ([(CSCoverSheetViewController *)self->_coverSheetViewController isHostingAnApp])
  {
    id v5 = [(CSCoverSheetViewController *)self->_coverSheetViewController hostedAppSceneHandles];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__SBDashBoardApplicationLauncher__isCoverSheetHostingEntity___block_invoke;
    v8[3] = &unk_1E6AF5D80;
    id v9 = v4;
    char v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v8);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __61__SBDashBoardApplicationLauncher__isCoverSheetHostingEntity___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sceneHandle];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)_presentApplicationSceneEntity:(id)a3 source:(int64_t)a4 fromRequest:(id)a5 withResult:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [v10 actions];
  long long v14 = (void *)[v13 copy];

  [v10 removeActions:v14];
  v30 = SBDashBoardCaptureLaunchSourceFromWorkspaceTransitionSource(a4);
  long long v15 = [(SBDashBoardCaptureLaunchPolicy *)self->_captureLaunchPolicy resolveCameraDestinationLaunchOf:v10 fromSource:v30];
  BOOL v29 = [(SBDashBoardApplicationLauncher *)self _canPresentApplicationSceneEntity:v10 fromSource:v30 toDestination:v15];
  eventQueue = self->_eventQueue;
  v16 = (void *)MEMORY[0x1E4F4F748];
  int v17 = NSString;
  id v18 = [v10 sceneHandle];
  __int16 v19 = [v18 sceneIdentifier];
  int v20 = [v17 stringWithFormat:@"CaptureLaunch-%@", v19];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke;
  v31[3] = &unk_1E6AFCEA0;
  v31[4] = self;
  id v32 = v15;
  id v33 = v10;
  id v34 = v11;
  id v35 = v14;
  id v36 = v12;
  id v28 = v14;
  id v21 = v11;
  id v22 = v10;
  id v23 = v15;
  id v24 = v12;
  v25 = [v16 eventWithName:v20 handler:v31];
  [(BSEventQueue *)eventQueue executeOrInsertEvent:v25 atPosition:1];

  [(CSCoverSheetViewController *)self->_coverSheetViewController dismissOverlaysAnimated:1];
  return v29;
}

void __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [*((id *)a1[4] + 1) acquireLockForReason:@"app launch"];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke_2;
  v33[3] = &unk_1E6AFCE58;
  id v3 = v2;
  id v34 = v3;
  id v35 = a1[9];
  id v4 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v33);
  id v5 = a1[5];
  if (v5)
  {
    id v32 = [v5 placement];
    char v6 = [a1[5] entity];
    int v7 = [a1[6] application];
    unint64_t v8 = [*((id *)a1[4] + 6) activeBehavior];
    int v9 = [v8 areRestrictedCapabilities:4];

    id v10 = +[SBCaptureApplicationCenter sharedInstance];
    id v11 = [v7 bundleIdentifier];
    char v12 = [v10 isApplicationLaunchNeededForApplicationBundleIdentifier:v11];

    if ((v12 & 1) != 0 || v9)
    {
      int v17 = [a1[7] applicationContext];
      id v18 = [v17 preludeAnimationTokenWrapper];
      __int16 v19 = [v18 consumeToken];

      [v19 cancel];
      int v20 = +[SBCaptureApplicationCenter sharedInstance];
      id v21 = [v7 bundleIdentifier];
      id v22 = [v20 captureApplicationForBundleIdentifier:v21];

      id v23 = [v22 launchActions];
      if ([a1[8] count])
      {
        if (objc_msgSend(a1[8], "bs_containsObjectPassingTest:", &__block_literal_global_95))
        {
          uint64_t v24 = objc_msgSend(v23, "bs_filter:", &__block_literal_global_37_2);

          id v23 = (void *)v24;
        }
        uint64_t v25 = [v23 setByAddingObjectsFromSet:a1[8]];

        id v23 = (void *)v25;
      }
      [a1[4] _attemptToUnlockToApplication:v7 actions:v23 completion:v4];

      long long v14 = v32;
      goto LABEL_21;
    }
    if ([a1[4] _isCoverSheetHostingEntity:a1[6]])
    {
      long long v13 = SBLogDashBoard();
      long long v14 = v32;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v6;
        __int16 v38 = 2114;
        v39 = v32;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Not launching hostable entity %@ in placement %{public}@ because it's already hosted", buf, 0x16u);
      }

      v4[2](v4, 0, 0);
    }
    else
    {
      long long v14 = v32;
      if ([v32 isEqual:SBDashBoardCapturePlacementCameraPage])
      {
        id v26 = a1[4];
        id v27 = a1[7];
        id v28 = a1[8];
        v31 = v4;
        BOOL v29 = v6;
        uint64_t v30 = 0;
      }
      else
      {
        if (![v32 isEqual:SBDashBoardCapturePlacementCameraOverlay])
        {
          if ([v32 isEqual:SBDashBoardCapturePlacementCaptureButtonCameraPage])
          {
            [a1[4] _activateCameraEntity:v6 animated:1 asOverlay:0 viaSwitcherModal:1 request:a1[7] actions:a1[8] completion:v4];
          }
          else if ([v32 isEqual:SBDashBoardCapturePlacementSecureApp])
          {
            [a1[4] _activateAppSceneBelowDashBoard:a1[6] hostableEntity:v6 secureAppType:4 withActions:a1[8] interactive:0 completion:v4];
          }
          goto LABEL_21;
        }
        id v26 = a1[4];
        id v27 = a1[7];
        id v28 = a1[8];
        v31 = v4;
        BOOL v29 = v6;
        uint64_t v30 = 1;
      }
      [v26 _activateCameraEntity:v29 animated:1 asOverlay:v30 viaSwitcherModal:0 request:v27 actions:v28 completion:v31];
    }
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v15 = secureAppTypeForSBApplicationSceneEntity(a1[6]);
  id v16 = a1[6];
  if (v15 == 4)
  {
    [v16 translateActivationSettingsToActions];
    [a1[4] _activateCameraEntity:0 animated:1 actions:a1[8] completion:v4];
  }
  else
  {
    [v16 addActions:a1[8]];
    [a1[4] _reallyActivateAppSceneWithEntity:a1[6] interactive:0 withCompletion:v4];
  }
LABEL_22:
}

void __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) relinquish];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

uint64_t __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)_reallyActivateAppSceneWithEntity:(id)a3 interactive:(BOOL)a4 withCompletion:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  uint64_t v8 = secureAppTypeForSBApplicationSceneEntity(v11);
  if (v8 == 4
    && ([(CSCoverSheetViewController *)self->_coverSheetViewController activeBehavior],
        int v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 areRestrictedCapabilities:4],
        v9,
        v10))
  {
    [(SBDashBoardApplicationLauncher *)self _attemptToUnlockToCameraCompletion:v7];
  }
  else
  {
    [(SBDashBoardApplicationLauncher *)self _activateAppSceneBelowDashBoard:v11 hostableEntity:0 secureAppType:v8 withActions:0 interactive:0 completion:v7];
  }
}

- (void)_activateAppSceneBelowDashBoard:(id)a3 hostableEntity:(id)a4 secureAppType:(unint64_t)a5 withActions:(id)a6 interactive:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  int v17 = +[SBCoverSheetPresentationManager sharedInstance];
  if (v14)
  {
    id v18 = +[SBSecureAppManager sharedInstance];
    char v19 = [v18 hasSecureAppOfType:a5];

    if ((v19 & 1) == 0)
    {
      secureAppAction = self->_secureAppAction;
      if (secureAppAction)
      {
        [(SBInProcessSecureAppAction *)secureAppAction invalidate];
        id v21 = self->_secureAppAction;
        self->_secureAppAction = 0;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_secureAppManager);
      id v23 = [WeakRetained secureAppAction];

      if (v23) {
        [v23 invalidate];
      }
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __130__SBDashBoardApplicationLauncher__activateAppSceneBelowDashBoard_hostableEntity_secureAppType_withActions_interactive_completion___block_invoke;
      v36[3] = &unk_1E6AFCEC8;
      v36[4] = self;
      v36[5] = a2;
      uint64_t v24 = MEMORY[0x1D948C7A0](v36);
      uint64_t v25 = [SBInProcessSecureAppAction alloc];
      if (v15) {
        id v26 = -[SBInProcessSecureAppAction initWithType:hostableEntity:handler:](v25, "initWithType:hostableEntity:handler:", a5, v15, v24, v24, v23);
      }
      else {
        id v26 = -[SBInProcessSecureAppAction initWithType:applicationSceneEntity:handler:](v25, "initWithType:applicationSceneEntity:handler:", a5, v14, v24, v24, v23);
      }
      id v27 = self->_secureAppAction;
      self->_secureAppAction = v26;

      id v28 = [v17 secureAppViewController];

      BOOL v29 = +[SBActionHandler sharedInstance];
      uint64_t v30 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_secureAppAction];
      v31 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
      [v29 handleActions:v30 origin:v31 withResult:0];

      if (!a7 && v28) {
        [v17 updateBecauseSecureAppChanged];
      }
    }
  }
  if (!a7) {
    [v17 setCoverSheetPresented:0 animated:1 withCompletion:0];
  }
  coverSheetViewController = self->_coverSheetViewController;
  id v33 = [MEMORY[0x1E4F5E380] actionWithType:4];
  [(CSCoverSheetViewController *)coverSheetViewController handleAction:v33 fromSender:self];

  if (v16) {
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }
}

void __130__SBDashBoardApplicationLauncher__activateAppSceneBelowDashBoard_hostableEntity_secureAppType_withActions_interactive_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = [a2 error];
  id v3 = [v9 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4FA7180]])
  {
    uint64_t v4 = [v9 code];

    if (v4 != 1) {
      goto LABEL_5;
    }
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = a1 + 32;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v7 + 8);
    uint64_t v8 = [v9 localizedDescription];
    [v3 handleFailureInMethod:v6, v5, @"SBDashBoardApplicationLauncher.m", 561, @"SBDashBoardViewController failed to acquire an assertion: %@", v8 object file lineNumber description];
  }
LABEL_5:
}

- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 actions:(id)a5 completion:(id)a6
{
}

- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 asOverlay:(BOOL)a5 viaSwitcherModal:(BOOL)a6 request:(id)a7 actions:(id)a8 completion:(id)a9
{
  BOOL v12 = a5;
  BOOL v38 = a4;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = +[SBCoverSheetPresentationManager sharedInstance];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke;
  v43[3] = &unk_1E6AFCF90;
  id v19 = v17;
  id v48 = v19;
  v43[4] = self;
  id v20 = v14;
  id v44 = v20;
  BOOL v49 = a6;
  id v21 = v15;
  id v45 = v21;
  id v22 = v18;
  id v46 = v22;
  BOOL v50 = v12;
  id v23 = v16;
  id v47 = v23;
  uint64_t v24 = (void (**)(void, void))MEMORY[0x1D948C7A0](v43);
  if ([v22 isCoverSheetHostingAnApp])
  {
    uint64_t v25 = +[SBApplicationController sharedInstance];
    id v26 = [v25 cameraApplication];

    if ([v22 isInSecureApp]) {
      goto LABEL_4;
    }
    id v27 = [v22 coverSheetHostedAppSceneHandle];
    [v27 application];
    v37 = self;
    id v28 = v23;
    id v29 = v19;
    id v30 = v21;
    id v31 = v20;
    v33 = id v32 = v26;
    int v34 = [v33 isEqual:v32];

    id v26 = v32;
    id v20 = v31;
    id v21 = v30;
    id v19 = v29;
    id v23 = v28;

    if (v34)
    {
LABEL_4:
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_4;
      v41[3] = &unk_1E6AF5300;
      v42 = v24;
      [v22 setCoverSheetPresented:1 animated:v38 withCompletion:v41];
      id v35 = v42;
    }
    else
    {
      if (![(CSCoverSheetViewController *)v37->_coverSheetViewController isHostingAnApp])
      {
        (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
        goto LABEL_6;
      }
      coverSheetViewController = v37->_coverSheetViewController;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_5;
      v39[3] = &unk_1E6AF5300;
      uint64_t v40 = v24;
      [(CSCoverSheetViewController *)coverSheetViewController dismissHostedAppsAnimated:1 completion:v39];
      id v35 = v40;
    }

LABEL_6:
    goto LABEL_12;
  }
  if (!v12 || (_os_feature_enabled_impl() & 1) == 0)
  {
    if ([v22 isAnyGestureActivelyRecognized]) {
      [v22 setCoverSheetPresented:1 animated:v38 withCompletion:0];
    }
  }
  ((void (**)(void, BOOL))v24)[2](v24, v38);
LABEL_12:
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2;
  v34[3] = &unk_1E6AFCEF0;
  id v4 = *(id *)(a1 + 72);
  v34[4] = *(void *)(a1 + 32);
  id v35 = v4;
  uint64_t v5 = (void *)MEMORY[0x1D948C7A0](v34);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3;
  v32[3] = &unk_1E6AF5A50;
  id v6 = v5;
  id v33 = v6;
  uint64_t v7 = (void (**)(void, void))MEMORY[0x1D948C7A0](v32);
  if (*(void *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 32), "_createCaptureExtensionHostingFluidSwitcherViewControllerForEntity:isEphemeralSwitcher:");
      uint64_t v8 = (SBDashBoardCameraContainerViewController *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        id v9 = SBLogDashBoard();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Activating main page to prepare for switcher modal presentation", buf, 2u);
        }

        [*(id *)(*(void *)(a1 + 32) + 48) activateMainPageWithCompletion:&__block_literal_global_57_0];
        int v10 = SBLogDashBoard();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [(CSCoverSheetViewControllerBase *)v8 succinctDescription];
          *(_DWORD *)buf = 138412290;
          v37 = v11;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Presenting switcher modal %@", buf, 0xCu);
        }
        BOOL v12 = *(void **)(*(void *)(a1 + 32) + 48);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_58;
        v23[3] = &unk_1E6AFCF68;
        uint64_t v24 = v8;
        id v13 = *(id *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 32);
        id v25 = v13;
        uint64_t v26 = v14;
        id v27 = *(id *)(a1 + 48);
        char v31 = a2;
        id v28 = *(id *)(a1 + 56);
        id v29 = v7;
        id v30 = v6;
        [v12 presentModalViewController:v24 animated:0 completion:v23];

        id v15 = v24;
        goto LABEL_9;
      }
      goto LABEL_15;
    }
    if (*(unsigned char *)(a1 + 81))
    {
      if (!_os_feature_enabled_impl())
      {
        uint64_t v8 = objc_alloc_init(SBDashBoardCameraContainerViewController);
        id v17 = [(SBDashBoardCameraContainerViewController *)v8 hostedEntityViewController];
        [v17 setActionsToDeliverToHostableEntity:*(void *)(a1 + 64)];

        [(SBDashBoardCameraContainerViewController *)v8 setHostedEntity:*(void *)(a1 + 40)];
        [*(id *)(*(void *)(a1 + 32) + 48) activateOverlayWithViewController:v8 animated:a2 completion:v7];
        goto LABEL_18;
      }
      uint64_t v8 = [*(id *)(a1 + 32) _createCaptureExtensionHostingFluidSwitcherViewControllerForEntity:*(void *)(a1 + 40) isEphemeralSwitcher:*(unsigned __int8 *)(a1 + 80)];
      [(SBDashBoardCameraContainerViewController *)v8 setDismissGestureEnabled:1];
      if (v8)
      {
        id v16 = *(void **)(*(void *)(a1 + 32) + 48);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2_66;
        v18[3] = &unk_1E6AF69D0;
        id v19 = v8;
        id v20 = *(id *)(a1 + 48);
        char v22 = a2;
        id v21 = v7;
        [v16 presentModalViewController:v19 animated:0 completion:v18];

        id v15 = v19;
LABEL_9:

LABEL_18:
        goto LABEL_19;
      }
LABEL_15:
      v7[2](v7, 0);
      goto LABEL_18;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "activateCameraWithHostableEntity:animated:sendingActions:completion:");
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 48) activateCameraViewAnimated:a2 sendingActions:*(void *)(a1 + 64) completion:v7];
  }
LABEL_19:
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2(uint64_t a1, int a2, int a3)
{
  if (a3)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (a2) {
      return [*(id *)(a1 + 32) _attemptToUnlockToCameraCompletion:*(void *)(a1 + 40)];
    }
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v3();
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_55()
{
  v0 = SBLogDashBoard();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEFAULT, "Completed main page activation for switcher modal presentation", v1, 2u);
  }
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_58(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) succinctDescription];
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Switcher modal %@ presented. Activating entity %@", buf, 0x16u);
  }
  uint64_t v5 = *(void **)(*(void *)(a1 + 48) + 48);
  id v6 = [MEMORY[0x1E4F5E380] actionWithType:4];
  [v5 handleAction:v6 fromSender:*(void *)(a1 + 48)];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_59;
  v10[3] = &unk_1E6AFCF40;
  uint64_t v9 = *(void *)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 80);
  [v7 activateDisplayItemFromRequest:v9 animated:v8 completion:v10];
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_59(uint64_t a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = [*(id *)(*(void *)(a1 + 32) + 48) isInScreenOffMode];
  int v5 = [*(id *)(a1 + 40) isPresented];
  int v6 = objc_msgSend(*(id *)(a1 + 48), "bs_isAppearingOrAppeared");
  uint64_t v7 = SBLogDashBoard();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v4 != 0 || a2 == 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "No longer in a good state to complete transition to camera page", buf, 2u);
    }

    id v12 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v13 = *(void *)(a1 + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_63;
    v19[3] = &unk_1E6AF5300;
    id v20 = *(id *)(a1 + 72);
    [v12 dismissModalViewController:v13 animated:0 completion:v19];
    id v14 = v20;
  }
  else
  {
    if (v8)
    {
      uint64_t v15 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Completed activation of entity %@. Dismissing any remaining modals.", buf, 0xCu);
    }

    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 48);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_60;
    v21[3] = &unk_1E6AF4DD8;
    v21[4] = v16;
    uint64_t v18 = *(void *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 48);
    id v24 = *(id *)(a1 + 64);
    [v17 _dismissAllModalViewControllersExcept:v18 animated:0 completion:v21];

    id v14 = v22;
  }
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_60(uint64_t a1)
{
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed remaining modals. Transitioning to camera page.", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_61;
  v7[3] = &unk_1E6AFA2A0;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 56);
  [v4 activateCameraWithHostableEntity:v3 animated:0 sendingActions:0 completion:v7];
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_61(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) succinctDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Completed transition to camera page. Tearing down modal %@", buf, 0xCu);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_62;
  v8[3] = &unk_1E6AFCF18;
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  char v11 = a2;
  [v7 dismissModalViewController:v9 animated:0 completion:v8];
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_62(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogDashBoard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) succinctDescription];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Completed teardown of modal %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2_66(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3_67;
  v4[3] = &unk_1E6AF5A50;
  id v5 = *(id *)(a1 + 48);
  [v1 activateDisplayItemFromRequest:v2 animated:v3 completion:v4];
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createCaptureExtensionHostingFluidSwitcherViewControllerForEntity:(id)a3 isEphemeralSwitcher:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController alloc] initWithCaptureExtensionEntity:v6 isEphemeralSwitcher:v4];

  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)v7 setDelegate:self];
  [(SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *)v7 setSwitcherBackdropController:self->_coverSheetViewController];
  return v7;
}

- (void)_attemptToUnlockToCameraCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[SBApplicationController sharedInstance];
  id v6 = [v5 cameraApplication];

  [(SBDashBoardApplicationLauncher *)self _attemptToUnlockToApplication:v6 actions:0 completion:v4];
}

- (void)_attemptToUnlockToApplication:(id)a3 actions:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  char v11 = v10;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__SBDashBoardApplicationLauncher__attemptToUnlockToApplication_actions_completion___block_invoke;
  v18[3] = &unk_1E6AFA2A0;
  id v19 = v7;
  id v20 = v10;
  id v21 = v9;
  id v12 = v9;
  id v13 = v11;
  id v14 = v7;
  uint64_t v15 = (void *)MEMORY[0x1D948C7A0](v18);
  uint64_t v16 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v16 setName:@"Unlock For App Launch From DashBoard"];
  [(SBLockScreenUnlockRequest *)v16 setSource:24];
  [(SBLockScreenUnlockRequest *)v16 setIntent:3];
  [(SBLockScreenUnlockRequest *)v16 setDestinationApplication:v14];
  id v17 = +[SBLockScreenManager sharedInstance];
  [v17 unlockWithRequest:v16 completion:v15];
}

void __83__SBDashBoardApplicationLauncher__attemptToUnlockToApplication_actions_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__SBDashBoardApplicationLauncher__attemptToUnlockToApplication_actions_completion___block_invoke_2;
    v6[3] = &unk_1E6AF5DA8;
    id v7 = *(id *)(a1 + 48);
    SBWorkspaceActivateApplicationWithActionsAndResult(v2, v3, v6);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
}

void __83__SBDashBoardApplicationLauncher__attemptToUnlockToApplication_actions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v9 = v3;
    if (v3)
    {
      id v5 = [v3 domain];
      int v6 = [v5 isEqualToString:*MEMORY[0x1E4F625D0]];

      uint64_t v7 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v8 = [v9 code];
      }
      else {
        uint64_t v8 = 1;
      }
      (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, 0);
    }
    id v3 = v9;
  }
}

- (void)_activateAppWithURL:(id)a3
{
}

uint64_t __54__SBDashBoardApplicationLauncher__activateAppWithURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSource:13];
}

- (void)_prewarmCameraForBundleIdentifier:(id)a3 prewarmReason:(id)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 numberWithLongLong:mach_absolute_time()];
  uint64_t v9 = [NSNumber numberWithLongLong:mach_continuous_time()];
  id v10 = (void *)v9;
  char v11 = (void *)*MEMORY[0x1E4F158F8];
  if (v6) {
    char v11 = v6;
  }
  uint64_t v12 = *MEMORY[0x1E4F15928];
  v16[0] = *MEMORY[0x1E4F15918];
  v16[1] = v12;
  v17[0] = v11;
  v17[1] = v8;
  v16[2] = *MEMORY[0x1E4F15938];
  v17[2] = v9;
  id v13 = (void *)MEMORY[0x1E4F1C9E8];
  id v14 = v11;
  uint64_t v15 = [v13 dictionaryWithObjects:v17 forKeys:v16 count:3];

  AVCapturePrewarmWithOptions();
}

- (void)_coolCameraIfNecessaryForBundleIdentifier:(id)a3 prewarmReason:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_cameraIsPrewarming && !self->_cameraPrewarmSucceeded)
  {
    uint64_t v8 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v8 emitEvent:45];

    uint64_t v9 = (void *)*MEMORY[0x1E4F158F8];
    if (v7) {
      uint64_t v9 = v7;
    }
    uint64_t v13 = *MEMORY[0x1E4F15918];
    v14[0] = v9;
    id v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = v9;
    uint64_t v12 = [v10 dictionaryWithObjects:v14 forKeys:&v13 count:1];

    MEMORY[0x1D9487C80](v6, v12);
  }
}

- (BOOL)_backgroundLaunchWithBundleIdentifier:(id)a3 isCaptureApplicationLaunch:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[SBApplicationController sharedInstance];
    id v7 = [v6 applicationWithBundleIdentifier:v5];

    uint64_t v8 = +[SBWorkspace mainWorkspace];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke;
    v12[3] = &unk_1E6AFCFE0;
    id v13 = v7;
    BOOL v15 = a4;
    id v14 = v5;
    id v9 = v7;
    char v10 = [v8 requestTransitionWithBuilder:v12];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

void __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke_2;
  v4[3] = &unk_1E6AFCFB8;
  id v5 = *(id *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 modifyApplicationContext:v4];
}

void __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 48))
  {
    [(SBWorkspaceEntity *)v6 setFlag:1 forActivationSetting:36];
    uint64_t v4 = +[SBCaptureApplicationCenter sharedInstance];
    char v5 = [v4 shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:*(void *)(a1 + 40)];

    if ((v5 & 1) == 0) {
      [(SBWorkspaceEntity *)v6 setFlag:1 forActivationSetting:38];
    }
  }
  [v3 setBackground:1];
  [v3 setEntity:v6 forLayoutRole:1];
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return self->_coverSheetViewController;
}

- (SBSecureAppManager)secureAppManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureAppManager);
  return (SBSecureAppManager *)WeakRetained;
}

- (void)setSecureAppManager:(id)a3
{
}

- (SBDashBoardCaptureLaunchPolicy)captureLaunchPolicy
{
  return self->_captureLaunchPolicy;
}

- (void)setCaptureLaunchPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureLaunchPolicy, 0);
  objc_destroyWeak((id *)&self->_secureAppManager);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
  objc_storeStrong((id *)&self->_prewarmIdentifiersToCancelTimers, 0);
  objc_storeStrong((id *)&self->_currentPrewarmIdentifiersToReasons, 0);
  objc_storeStrong((id *)&self->_secureAppAction, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (void)handleTransitionRequest:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 uniqueIdentifier];
  id v6 = SBMainWorkspaceTransitionSourceDescription([a2 source]);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  char v10 = v6;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Handling transition request for application scene %@ from %@...", (uint8_t *)&v7, 0x16u);
}

- (void)_prewarmWithConfiguration:(uint64_t)a1 prewarmReason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to prewarm: No prewarming bundle identifier found for application: %@", (uint8_t *)&v2, 0xCu);
}

@end