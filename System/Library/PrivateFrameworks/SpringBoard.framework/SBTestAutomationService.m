@interface SBTestAutomationService
- (BOOL)_authenticateClient:(id)a3;
- (SBTestAutomationService)init;
- (id)_iconGridSizeClassFromClientArgument:(int64_t)a3;
- (id)systemServiceServer:(id)a3 getAnimationFrameRecordingsForClient:(id)a4;
- (id)systemServiceServer:(id)a3 getSystemApertureModelStateDumpForClient:(id)a4;
- (id)systemServiceServer:(id)a3 getSystemApertureStateDumpForClient:(id)a4;
- (id)systemServiceServer:(id)a3 getWidgetControllerStateDump:(id)a4;
- (void)systemServiceServer:(id)a3 addWidgetsToEachPageForClient:(id)a4;
- (void)systemServiceServer:(id)a3 clearAllUserNotificationsForClient:(id)a4;
- (void)systemServiceServer:(id)a3 client:(id)a4 addWidgetStackWithIdentifiers:(id)a5 toPage:(int64_t)a6 withSizing:(int64_t)a7;
- (void)systemServiceServer:(id)a3 client:(id)a4 addWidgetWithIdentifier:(id)a5 toPage:(int64_t)a6 withSizing:(int64_t)a7;
- (void)systemServiceServer:(id)a3 client:(id)a4 countScenesForBundleIdentifier:(id)a5 withCompletion:(id)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 getChamoisPrefersDockHiddenWithCompletion:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 getChamoisPrefersStripHiddenWithCompletion:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 getDeviceSupportsSystemAperture:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 getIsChamoisWindowingUIEnabledWithCompletion:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 loadStashedSwitcherModelFromPath:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 port:(id)a5 acquireAssertionForReachabilityEnabled:(BOOL)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 port:(id)a5 acquireHUDHiddenAssertionForIdentifier:(id)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 resetToHomeScreenAnimated:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setAccessoryType:(int64_t)a5 attached:(BOOL)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 setAlertsEnabled:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setAmbientMountState:(int64_t)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setAmbientPresentationState:(int64_t)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setApplicationBundleIdentifier:(id)a5 blockedForScreenTime:(BOOL)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisPrefersDockHidden:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisPrefersStripHidden:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisWindowingUIEnabled:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setHiddenFeaturesEnabled:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setIdleTimerEnabled:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setMallocStackLoggingEnabled:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setOrientationLockEnabled:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setReachabilityActive:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setSpringBoardAnimationFrameRecordingForUpdateTypes:(unint64_t)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setSystemApertureUnderAutomationTesting:(BOOL)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 setTestRunnerRecoveryApplicationBundleIdentifier:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 stashSwitcherModelToPath:(id)a5;
- (void)systemServiceServer:(id)a3 enterLostModeForClient:(id)a4;
- (void)systemServiceServer:(id)a3 exitLostModeForClient:(id)a4;
- (void)systemServiceServer:(id)a3 setUserPresenceDetectedSinceWakeForClient:(id)a4;
- (void)systemServiceServer:(id)a3 suspendAllDisplaysForClient:(id)a4;
@end

@implementation SBTestAutomationService

- (SBTestAutomationService)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBTestAutomationService;
  v2 = [(SBTestAutomationService *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.testautomation"];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
    inFlightAnimationTransactions = v2->_inFlightAnimationTransactions;
    v2->_inFlightAnimationTransactions = (NSHashTable *)v5;

    reachabilityEnabledAssertions = v2->_reachabilityEnabledAssertions;
    v2->_reachabilityEnabledAssertions = 0;

    idleTimerAssertion = v2->_idleTimerAssertion;
    v2->_idleTimerAssertion = 0;

    v9 = +[SBSystemServiceServer sharedInstance];
    [v9 setTestAutomationDelegate:v2];
  }
  return v2;
}

- (void)systemServiceServer:(id)a3 suspendAllDisplaysForClient:(id)a4
{
  id v5 = a4;
  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to suspend all displays", v8, 2u);
  }

  BOOL v7 = [(SBTestAutomationService *)self _authenticateClient:v5];
  if (v7) {
    BSDispatchMain();
  }
}

- (void)systemServiceServer:(id)a3 clearAllUserNotificationsForClient:(id)a4
{
  id v5 = a4;
  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to clear all user notifications", v8, 2u);
  }

  BOOL v7 = [(SBTestAutomationService *)self _authenticateClient:v5];
  if (v7) {
    BSDispatchMain();
  }
}

void __82__SBTestAutomationService_systemServiceServer_clearAllUserNotificationsForClient___block_invoke()
{
  v0 = +[SBLockScreenManager sharedInstance];
  v1 = [v0 lockScreenEnvironment];
  v2 = [v1 rootViewController];

  uint64_t v3 = objc_opt_class();
  id v8 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v8;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [v5 mainPageContentViewController];
    BOOL v7 = [v6 combinedListViewController];
    [v7 _testingClearAllNotificationRequests];
  }
}

- (void)systemServiceServer:(id)a3 setUserPresenceDetectedSinceWakeForClient:(id)a4
{
  id v5 = a4;
  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to inject user presence detected", v8, 2u);
  }

  BOOL v7 = [(SBTestAutomationService *)self _authenticateClient:v5];
  if (v7) {
    BSDispatchMain();
  }
}

uint64_t __89__SBTestAutomationService_systemServiceServer_setUserPresenceDetectedSinceWakeForClient___block_invoke()
{
  return [MEMORY[0x1E4F5E488] synthesizeUserPresenceForReason:@"Test Automation"];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAlertsEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"disable";
    if (v5) {
      v9 = @"enable";
    }
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ pending alerts", buf, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v10) {
    BSDispatchMain();
  }
}

void __71__SBTestAutomationService_systemServiceServer_client_setAlertsEnabled___block_invoke(uint64_t a1)
{
  v2 = +[SBAlertItemsController sharedInstance];
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v3 = SBLogAlertItems();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Removing all pending alert items and super-modal items from the SBAlertItemsController", v5, 2u);
    }

    [v2 _clearAllQueuedAlertItems];
  }
  [v2 setForceAlertsToPend:*(unsigned char *)(a1 + 32) == 0 forReason:@"SBTestAutomationService client request"];
  if (!*(unsigned char *)(a1 + 32))
  {
    v4 = [v2 visibleAlertItem];
    if (v4) {
      [v2 deactivateAlertItem:v4];
    }
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setHiddenFeaturesEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"disable";
    if (v5) {
      v9 = @"enable";
    }
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ hidden features", (uint8_t *)&v11, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v10) {
    BSDispatchMain();
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setIdleTimerEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"disable";
    if (v5) {
      v9 = @"enable";
    }
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ the idle timer", buf, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v10)
  {
    idleTimerAssertion = self->_idleTimerAssertion;
    if (v5 && idleTimerAssertion)
    {
      [(BSInvalidatable *)idleTimerAssertion invalidate];
      v12 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = 0;
    }
    else
    {
      [(BSInvalidatable *)idleTimerAssertion invalidate];
      uint64_t v13 = [MEMORY[0x1E4F6F2E8] sharedInstance];
      id v17 = 0;
      v14 = (BSInvalidatable *)[v13 newAssertionToDisableIdleTimerForReason:@"SBTestAutomationService client request" error:&v17];
      v12 = (BSInvalidatable *)v17;
      v15 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = v14;

      if (!self->_idleTimerAssertion)
      {
        v16 = SBLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[SBTestAutomationService systemServiceServer:client:setIdleTimerEnabled:]();
        }
      }
    }
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setOrientationLockEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"unlock";
    if (v5) {
      v9 = @"lock";
    }
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ the interface orientation", buf, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v10) {
    BSDispatchMain();
  }
}

void __80__SBTestAutomationService_systemServiceServer_client_setOrientationLockEnabled___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 32);
  v2 = +[SBOrientationLockManager sharedInstance];
  id v3 = v2;
  if (v1) {
    [v2 lock];
  }
  else {
    [v2 unlock];
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setMallocStackLoggingEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"disable";
    if (v5) {
      v9 = @"enable";
    }
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ Malloc Stack Logging", (uint8_t *)&v11, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v10) {
    msl_turn_on_stack_logging();
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setReachabilityActive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"deactivate";
    if (v5) {
      v9 = @"activate";
    }
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ reachability", buf, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v10) {
    BSDispatchMain();
  }
}

void __76__SBTestAutomationService_systemServiceServer_client_setReachabilityActive___block_invoke(uint64_t a1)
{
  v2 = +[SBReachabilityManager sharedInstance];
  id v3 = v2;
  if (*(unsigned char *)(a1 + 32))
  {
    if (([v2 reachabilityModeActive] & 1) == 0)
    {
      if ([v3 canActivateReachability])
      {
        [v3 toggleReachability];
      }
      else
      {
        v4 = SBLogCommon();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v5 = 0;
          _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Unable to activate reachability because the manager rejected the request. Perhaps reachability isn't enabled, the device isn't in portrait, or reachability is temporarily disabled.", v5, 2u);
        }
      }
    }
  }
  else
  {
    [v2 deactivateReachability];
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 port:(id)a5 acquireAssertionForReachabilityEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 processHandle];
  v12 = [v11 bundleIdentifier];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = [v9 processHandle];
    v16 = [v15 name];
    id v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [v9 description];
    }
    id v14 = v18;
  }
  v19 = SBLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = @"disable";
    if (v6) {
      uint64_t v20 = @"enable";
    }
    *(_DWORD *)buf = 138412546;
    id v24 = v14;
    __int16 v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received request from client %@ to acquire an assertion to %@ reachability", buf, 0x16u);
  }

  if ([(SBTestAutomationService *)self _authenticateClient:v9])
  {
    id v21 = v14;
    id v22 = v10;
    BSDispatchMain();
  }
}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke(uint64_t a1)
{
  v2 = [NSString stringWithFormat:@"SBTestAutomationService request from client %@", *(void *)(a1 + 32)];
  int v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = +[SBReachabilityManager sharedInstance];
  BOOL v5 = v4;
  if (v3) {
    [v4 setReachabilityTemporarilyEnabled:1 forReason:v2];
  }
  else {
    [v4 setReachabilityTemporarilyDisabled:1 forReason:v2];
  }

  objc_initWeak(&location, *(id *)(a1 + 40));
  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v7 = *(void *)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_2;
  v21[3] = &unk_1E6AFCBB8;
  char v24 = *(unsigned char *)(a1 + 56);
  id v8 = v2;
  id v22 = v8;
  objc_copyWeak(&v23, &location);
  id v9 = (void *)[v6 initWithIdentifier:v7 forReason:v8 invalidationBlock:v21];
  id v10 = *(void **)(*(void *)(a1 + 40) + 24);
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v11;

    id v10 = *(void **)(*(void *)(a1 + 40) + 24);
  }
  [v10 addObject:v9];
  id v14 = (void *)MEMORY[0x1E4F4F7E0];
  uint64_t v15 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_3;
  v17[3] = &unk_1E6AF5770;
  id v18 = *(id *)(a1 + 32);
  char v20 = *(unsigned char *)(a1 + 56);
  id v16 = v9;
  id v19 = v16;
  [v14 monitorSendRight:v15 withHandler:v17];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  int v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = +[SBReachabilityManager sharedInstance];
  BOOL v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v3) {
    [v4 setReachabilityTemporarilyEnabled:0 forReason:v6];
  }
  else {
    [v4 setReachabilityTemporarilyDisabled:0 forReason:v6];
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[3] removeObject:v9];
  }
}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  BSDispatchMain();
}

uint64_t __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = @"enabling";
    if (!*(unsigned char *)(a1 + 48)) {
      v4 = @"disabling";
    }
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] client %@ invalidated; relinquishing reachability %@ assertion.",
      (uint8_t *)&v6,
      0x16u);
  }

  return [*(id *)(a1 + 40) invalidate];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAmbientPresentationState:(int64_t)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    int v6 = SBLogCommon();
    uint64_t v7 = v6;
    if ((unint64_t)a5 > 2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SBTestAutomationService systemServiceServer:client:setAmbientPresentationState:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = AMStringForAmbientPresentationState();
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Setting ambient state to '%@'.", buf, 0xCu);
      }
      BSDispatchMain();
    }
  }
}

void __82__SBTestAutomationService_systemServiceServer_client_setAmbientPresentationState___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp windowSceneManager];
  uint64_t v3 = [v2 activeDisplayWindowScene];
  id v4 = [v3 ambientPresentationController];

  objc_msgSend(v4, "test_updateAmbientPresentationState:withReason:", *(void *)(a1 + 32), @"SBTestAutomationService");
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAmbientMountState:(int64_t)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    if ((unint64_t)a5 > 3 || a5 == 2)
    {
      __int16 v8 = SBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBTestAutomationService systemServiceServer:client:setAmbientMountState:]();
      }
    }
    else
    {
      int v6 = SBLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = AMStringForAmbientMountState();
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Setting ambient mount state to '%@'.", buf, 0xCu);
      }
      BSDispatchMain();
    }
  }
}

void __75__SBTestAutomationService_systemServiceServer_client_setAmbientMountState___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp windowSceneManager];
  uint64_t v3 = [v2 activeDisplayWindowScene];
  id v4 = [v3 ambientPresentationController];

  objc_msgSend(v4, "test_updateAmbientMountState:withReason:", *(void *)(a1 + 32), @"SBTestAutomationService");
}

- (void)systemServiceServer:(id)a3 client:(id)a4 resetToHomeScreenAnimated:(BOOL)a5
{
  id v7 = a4;
  __int16 v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to reset to home screen", buf, 2u);
  }

  BOOL v9 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke;
    v12[3] = &__block_descriptor_33_e5_v8__0l;
    BOOL v13 = a5;
    uint64_t v11 = (void *)MEMORY[0x1D948C7A0](v12);
    id v10 = v11;
    BSDispatchMain();
  }
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v2 setSource:24];
  [(SBLockScreenUnlockRequest *)v2 setIntent:1];
  -[SBLockScreenUnlockRequest setName:](v2, "setName:", @"-[SBTestAutomationService systemServiceServer:client:resetToHomeScreenAnimated:]");
  uint64_t v3 = +[SBLockScreenManager sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2;
  v4[3] = &__block_descriptor_33_e8_v12__0B8l;
  char v5 = *(unsigned char *)(a1 + 32);
  [v3 unlockWithRequest:v2 completion:v4];
}

uint64_t __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_3;
  v2[3] = &__block_descriptor_33_e8_v12__0B8l;
  char v3 = *(unsigned char *)(a1 + 32);
  return SBWorkspaceForceToSpringBoard(v2);
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    SBWorkspaceSuspendActiveDisplay();
    char v3 = +[SBIconController sharedInstance];
    id v4 = [v3 iconManager];
    char v5 = [v4 rootFolderController];
    uint64_t v6 = [v5 firstIconPageIndex];

    uint64_t v7 = *(unsigned __int8 *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_4;
    v9[3] = &unk_1E6AFCBE0;
    char v12 = v7;
    id v10 = v4;
    uint64_t v11 = v6;
    id v8 = v4;
    [v3 dismissHomeScreenOverlaysAnimated:v7 completion:v9];
  }
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_5;
  v6[3] = &unk_1E6AFB0E8;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  char v9 = *(unsigned char *)(a1 + 48);
  [v4 dismissSpotlightAnimated:v3 completionHandler:v6];
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rootFolderController];
  [v2 setCurrentPageIndex:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48) completion:&__block_literal_global_76];
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_6()
{
  v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Successfully reset SpringBoard to the home screen!", v1, 2u);
  }
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_79(uint64_t a1)
{
  id v2 = [[SBDismissOverlaysAnimationController alloc] initWithTransitionContextProvider:0 options:-1];
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2_81;
  id v7 = &unk_1E6AFCC28;
  id v3 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  objc_copyWeak(&v10, &location);
  [(SBDismissOverlaysAnimationController *)v2 setCompletionBlock:&v4];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "addObject:", v2, v4, v5, v6, v7, v8);
  [(SBDismissOverlaysAnimationController *)v2 begin];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2_81(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 removeObject:WeakRetained];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAccessoryType:(int64_t)a5 attached:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v10 = @"attach";
    }
    else {
      id v10 = @"detach";
    }
    uint64_t v11 = NSStringFromSBSAccessoryType();
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ accessory with type '%@'", buf, 0x16u);
  }
  BOOL v12 = [(SBTestAutomationService *)self _authenticateClient:v8];

  if (v12)
  {
    if (CSMagSafeAccessoryTypeForSBSAccessoryType())
    {
      BSDispatchMain();
    }
    else
    {
      BOOL v13 = SBLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SBTestAutomationService systemServiceServer:client:setAccessoryType:attached:]();
      }
    }
  }
}

void __80__SBTestAutomationService_systemServiceServer_client_setAccessoryType_attached___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = +[SBUIController sharedInstance];
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  uint64_t v5 = [v3 objectForKey:v4];

  if (*(unsigned char *)(a1 + 56))
  {
    if (!v5)
    {
      if (*(void *)(a1 + 40) == 3) {
        [MEMORY[0x1E4F428B8] systemBrownColor];
      }
      else {
      BOOL v6 = [MEMORY[0x1E4F428B8] systemPinkColor];
      }
      BOOL v12 = (void *)MEMORY[0x1E4F5E410];
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = [MEMORY[0x1E4F428B8] systemTealColor];
      uint64_t v15 = [v12 accessoryWithType:v13 primaryColor:v6 secondoryColor:v14];

      __int16 v16 = [MEMORY[0x1E4F29128] UUID];
      id v17 = [v16 UUIDString];
      [v15 setEndpointUUID:v17];

      uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 40);
      if (!v18)
      {
        uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v20 = *(void *)(a1 + 32);
        id v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 40);
      }
      id v22 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
      [v18 setObject:v15 forKey:v22];

      [v2 _accessoryEndpointAttached:v15];
      goto LABEL_16;
    }
    BOOL v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSBSAccessoryType();
      int v23 = 138412290;
      char v24 = v7;
      id v8 = "[SBTestAutomationService] Will not attach accessory type '%@' as it is already attached.";
LABEL_11:
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, 0xCu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v5)
  {
    BOOL v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSBSAccessoryType();
      int v23 = 138412290;
      char v24 = v7;
      id v8 = "[SBTestAutomationService] Will not detach accessory type '%@' as it is not currently attached.";
      goto LABEL_11;
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v11 = [NSNumber numberWithInteger:v9];
  [v10 removeObjectForKey:v11];

  [v2 _accessoryEndpointDetached:v5];
LABEL_17:
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setApplicationBundleIdentifier:(id)a5 blockedForScreenTime:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = @"unblock";
    if (v6) {
      BOOL v12 = @"block";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ application with bundle identifier '%@' for Screen Time", buf, 0x16u);
  }

  BOOL v13 = [(SBTestAutomationService *)self _authenticateClient:v10];
  if (v13)
  {
    id v14 = v9;
    BSDispatchMain();
  }
}

void __106__SBTestAutomationService_systemServiceServer_client_setApplicationBundleIdentifier_blockedForScreenTime___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  +[SBScreenTimeTestRecipe _setApplicationBundleIdentifiers:v2 blockedForScreenTimeExpiration:*(unsigned __int8 *)(a1 + 40)];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 port:(id)a5 acquireHUDHiddenAssertionForIdentifier:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = [v9 processHandle];
  BOOL v13 = [v12 bundleIdentifier];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    __int16 v16 = [v9 processHandle];
    __int16 v17 = [v16 name];
    id v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [v9 description];
    }
    id v15 = v19;
  }
  uint64_t v20 = SBLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received request from client %@ to acquire an assertion to hide HUDs with identifier %@", buf, 0x16u);
  }

  if ([(SBTestAutomationService *)self _authenticateClient:v9])
  {
    id v21 = v15;
    id v22 = v11;
    id v23 = v10;
    BSDispatchMain();
  }
}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithFormat:@"SBTestAutomationService request from client %@", *(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4FA7058]])
  {
    id v3 = [(id)SBApp volumeControl];
    uint64_t v4 = [v3 acquireVolumeHUDHiddenAssertionForReason:v2];
  }
  else
  {
    if (![*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4FA7050]]) {
      goto LABEL_7;
    }
    id v3 = [(id)SBApp brightnessControl];
    uint64_t v4 = [v3 acquireBrightnessHUDHiddenAssertionForReason:v2];
  }
  uint64_t v5 = (void *)v4;

  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F4F7E0];
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke_102;
    v10[3] = &unk_1E6AF4E00;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = v5;
    id v8 = v5;
    [v6 monitorSendRight:v7 withHandler:v10];

    goto LABEL_9;
  }
LABEL_7:
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] No assertion to obtain for HUD with identifier %@", buf, 0xCu);
  }
LABEL_9:
}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke_102(id *a1)
{
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  BSDispatchMain();
}

uint64_t __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] client %@ invalidated; relinquishing an assertion to hide HUDs with identifier %@",
      (uint8_t *)&v6,
      0x16u);
  }

  return [*(id *)(a1 + 48) invalidate];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setTestRunnerRecoveryApplicationBundleIdentifier:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set the test application recovery identifier to %@", buf, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v8];
  if (v10)
  {
    id v11 = v7;
    BSDispatchMain();
  }
}

void __103__SBTestAutomationService_systemServiceServer_client_setTestRunnerRecoveryApplicationBundleIdentifier___block_invoke(uint64_t a1)
{
  id v3 = +[SBDefaults localDefaults];
  id v2 = [v3 testingDefaults];
  [v2 setTestRunnerRecoveryApplicationBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 countScenesForBundleIdentifier:(id)a5 withCompletion:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set the test application recovery identifier to %@", buf, 0xCu);
  }

  BOOL v13 = [(SBTestAutomationService *)self _authenticateClient:v11];
  if (v13)
  {
    id v14 = v9;
    id v15 = v10;
    BSDispatchMain();
  }
}

void __100__SBTestAutomationService_systemServiceServer_client_countScenesForBundleIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F62490] sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__SBTestAutomationService_systemServiceServer_client_countScenesForBundleIdentifier_withCompletion___block_invoke_2;
  v4[3] = &unk_1E6AFCC50;
  id v5 = *(id *)(a1 + 32);
  id v3 = [v2 scenesPassingTest:v4];
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v3 count]);
}

uint64_t __100__SBTestAutomationService_systemServiceServer_client_countScenesForBundleIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 clientProcess];
  uint64_t v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 stashSwitcherModelToPath:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to stash switcher model state to %@", buf, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v8];
  if (v10)
  {
    id v11 = v7;
    BSDispatchMain();
  }
}

void __79__SBTestAutomationService_systemServiceServer_client_stashSwitcherModelToPath___block_invoke(uint64_t a1)
{
  id v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v3 = [v2 _recentAppLayoutsController];

  if ([*(id *)(a1 + 32) length]) {
    [v3 _stashModelToPath:*(void *)(a1 + 32)];
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 loadStashedSwitcherModelFromPath:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to load switcher model state from %@", buf, 0xCu);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v8];
  if (v10)
  {
    id v11 = v7;
    BSDispatchMain();
  }
}

void __87__SBTestAutomationService_systemServiceServer_client_loadStashedSwitcherModelFromPath___block_invoke(uint64_t a1)
{
  id v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v3 = [v2 _recentAppLayoutsController];

  if ([*(id *)(a1 + 32) length]) {
    [v3 _loadStashedModelAtPath:*(void *)(a1 + 32)];
  }
}

- (void)systemServiceServer:(id)a3 addWidgetsToEachPageForClient:(id)a4
{
  id v5 = a4;
  int v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to add a static set of widgets to the home screen.", v8, 2u);
  }

  BOOL v7 = [(SBTestAutomationService *)self _authenticateClient:v5];
  if (v7) {
    BSDispatchMain();
  }
}

void __77__SBTestAutomationService_systemServiceServer_addWidgetsToEachPageForClient___block_invoke()
{
  id v2 = +[SBIconController sharedInstance];
  v0 = [v2 iconManager];
  id v1 = (id)[v0 addWidgetsToEachPage];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 addWidgetWithIdentifier:(id)a5 toPage:(int64_t)a6 withSizing:(int64_t)a7
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v10;
    __int16 v17 = 2048;
    int64_t v18 = a6;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to add widget with extension identifier '%@' to the Home Screen page '%lu'.", buf, 0x16u);
  }

  BOOL v13 = [(SBTestAutomationService *)self _authenticateClient:v11];
  if (v13)
  {
    id v14 = v10;
    BSDispatchMain();
  }
}

void __96__SBTestAutomationService_systemServiceServer_client_addWidgetWithIdentifier_toPage_withSizing___block_invoke(uint64_t a1)
{
  id v5 = +[SBIconController sharedInstance];
  id v2 = [v5 iconManager];
  id v3 = [*(id *)(a1 + 32) _iconGridSizeClassFromClientArgument:*(void *)(a1 + 48)];
  if (*(uint64_t *)(a1 + 56) >= 0) {
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v4 = *MEMORY[0x1E4FA6740];
  }
  [v2 addWidgetWithIdentifier:*(void *)(a1 + 40) toPage:v4 withSizeClass:v3];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 addWidgetStackWithIdentifiers:(id)a5 toPage:(int64_t)a6 withSizing:(int64_t)a7
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v10;
    __int16 v17 = 2048;
    int64_t v18 = a6;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to add widget stack with extension identifiers '%@' to the Home Screen page '%lu'.", buf, 0x16u);
  }

  BOOL v13 = [(SBTestAutomationService *)self _authenticateClient:v11];
  if (v13)
  {
    id v14 = v10;
    BSDispatchMain();
  }
}

void __102__SBTestAutomationService_systemServiceServer_client_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke(uint64_t a1)
{
  id v2 = +[SBIconController sharedInstance];
  id v5 = [v2 iconManager];

  id v3 = [*(id *)(a1 + 32) _iconGridSizeClassFromClientArgument:*(void *)(a1 + 48)];
  if (*(uint64_t *)(a1 + 56) >= 0) {
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v4 = *MEMORY[0x1E4FA6740];
  }
  [v5 addWidgetStackWithIdentifiers:*(void *)(a1 + 40) toPage:v4 withSizeClass:v3];
}

- (void)systemServiceServer:(id)a3 enterLostModeForClient:(id)a4
{
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    BSDispatchMain();
  }
}

void __70__SBTestAutomationService_systemServiceServer_enterLostModeForClient___block_invoke()
{
  id v0 = +[SBLockScreenManager sharedInstance];
  [v0 activateLostModeForRemoteLock:0];
}

- (void)systemServiceServer:(id)a3 exitLostModeForClient:(id)a4
{
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    BSDispatchMain();
  }
}

void __69__SBTestAutomationService_systemServiceServer_exitLostModeForClient___block_invoke()
{
  id v0 = +[SBLockScreenManager sharedInstance];
  [v0 exitLostModeIfNecessaryFromRemoteRequest:1];
}

- (void)systemServiceServer:(id)a3 client:(id)a4 getIsChamoisWindowingUIEnabledWithCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to get Chamois windowing enabled state", buf, 2u);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v8];
  if (v10)
  {
    id v11 = v7;
    BSDispatchMain();
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __99__SBTestAutomationService_systemServiceServer_client_getIsChamoisWindowingUIEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)SBApp windowSceneManager];
  id v3 = [v2 embeddedDisplayWindowScene];

  uint64_t v4 = [v3 switcherController];
  int v5 = [v4 isChamoisWindowingUIEnabled];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Returned Chamois windowing enabled state %d", (uint8_t *)v7, 8u);
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisWindowingUIEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = v5;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set Chamois windowing enabled state to %d", buf, 8u);
  }

  BOOL v9 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v9) {
    BSDispatchMain();
  }
}

void __83__SBTestAutomationService_systemServiceServer_client_setChamoisWindowingUIEnabled___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)SBApp windowSceneManager];
  id v3 = [v2 embeddedDisplayWindowScene];

  uint64_t v4 = [v3 switcherController];
  [v4 setChamoisMultitaskingEnabled:*(unsigned __int8 *)(a1 + 32)];
  BOOL v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(a1 + 32);
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Set Chamois windowing enabled state to %d", (uint8_t *)v7, 8u);
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 getChamoisPrefersDockHiddenWithCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  BOOL v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to get Chamois' preferred Hide Dock state", buf, 2u);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v8];
  if (v10)
  {
    id v11 = v7;
    BSDispatchMain();
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __96__SBTestAutomationService_systemServiceServer_client_getChamoisPrefersDockHiddenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[SBDefaults localDefaults];
  id v3 = [v2 appSwitcherDefaults];

  int v4 = [v3 chamoisHideDock];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  BOOL v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Returned Chamois' preferred Hide Dock state %d", (uint8_t *)v6, 8u);
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisPrefersDockHidden:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = v5;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set Chamois' preferred Hide Dock state to %d", buf, 8u);
  }

  BOOL v9 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v9) {
    BSDispatchMain();
  }
}

void __82__SBTestAutomationService_systemServiceServer_client_setChamoisPrefersDockHidden___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[SBDefaults localDefaults];
  id v3 = [v2 appSwitcherDefaults];

  [v3 setChamoisHideDock:*(unsigned __int8 *)(a1 + 32)];
  int v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Set Chamois' preferred Hide Dock state to %d", (uint8_t *)v6, 8u);
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 getChamoisPrefersStripHiddenWithCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  BOOL v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to get Chamois' preferred Hide Strips state", buf, 2u);
  }

  BOOL v10 = [(SBTestAutomationService *)self _authenticateClient:v8];
  if (v10)
  {
    id v11 = v7;
    BSDispatchMain();
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __97__SBTestAutomationService_systemServiceServer_client_getChamoisPrefersStripHiddenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[SBDefaults localDefaults];
  id v3 = [v2 appSwitcherDefaults];

  int v4 = [v3 chamoisHideStrips];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Returned Chamois' preferred Hide Strips state %d", (uint8_t *)v6, 8u);
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisPrefersStripHidden:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = v5;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set Chamois' preferred Hide Strips state to %d", buf, 8u);
  }

  BOOL v9 = [(SBTestAutomationService *)self _authenticateClient:v7];
  if (v9) {
    BSDispatchMain();
  }
}

void __83__SBTestAutomationService_systemServiceServer_client_setChamoisPrefersStripHidden___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[SBDefaults localDefaults];
  id v3 = [v2 appSwitcherDefaults];

  [v3 setChamoisHideStrips:*(unsigned __int8 *)(a1 + 32)];
  int v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Set Chamois' preferred Hide Strips state to %d", (uint8_t *)v6, 8u);
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 getDeviceSupportsSystemAperture:(id)a5
{
  id v7 = a5;
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    id v8 = v7;
    BSDispatchMain();
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __86__SBTestAutomationService_systemServiceServer_client_getDeviceSupportsSystemAperture___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = 1;
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2796 && v3 != 2868) {
      goto LABEL_7;
    }
  }
  else if (v3 != 2556 && v3 != 2622)
  {
LABEL_7:
    uint64_t v2 = 0;
  }
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v4(v1, v2);
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setSpringBoardAnimationFrameRecordingForUpdateTypes:(unint64_t)a5
{
  char v5 = a5;
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    id v6 = [(id)SBApp systemApertureControllerForMainDisplay];
    [v6 setSystemApertureAnimationFrameRecording:v5 & 1];
  }
}

- (id)systemServiceServer:(id)a3 getAnimationFrameRecordingsForClient:(id)a4
{
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    int v4 = [(id)SBApp systemApertureControllerForMainDisplay];
    char v5 = [v4 animationFrameRecordings];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (id)systemServiceServer:(id)a3 getSystemApertureStateDumpForClient:(id)a4
{
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    int v4 = [(id)SBApp systemApertureControllerForMainDisplay];
    char v5 = [v4 stateDump];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (id)systemServiceServer:(id)a3 getSystemApertureModelStateDumpForClient:(id)a4
{
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    int v4 = [(id)SBApp systemApertureControllerForMainDisplay];
    char v5 = [v4 systemApertureModelStateDump];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setSystemApertureUnderAutomationTesting:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    id v6 = [(id)SBApp systemApertureControllerForMainDisplay];
    [v6 setSystemApertureUnderAutomationTesting:v5];
  }
}

- (id)systemServiceServer:(id)a3 getWidgetControllerStateDump:(id)a4
{
  if ([(SBTestAutomationService *)self _authenticateClient:a4])
  {
    int v4 = objc_opt_new();
    BOOL v5 = [MEMORY[0x1E4F58F58] viewControllers];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SBTestAutomationService_systemServiceServer_getWidgetControllerStateDump___block_invoke;
    block[3] = &unk_1E6AF4E00;
    id v17 = v5;
    id v7 = v4;
    int64_t v18 = v7;
    id v8 = v6;
    uint64_t v19 = v8;
    BOOL v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v10);
    uint64_t v11 = [v7 count];
    uint64_t v12 = v19;
    if (v11)
    {
      BOOL v13 = v7;
      id v7 = v8;
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
      BOOL v13 = v9;
      BOOL v9 = v8;
    }
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

intptr_t __76__SBTestAutomationService_systemServiceServer_getWidgetControllerStateDump___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v17 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v2 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int64_t v18 = *(void **)(a1 + 40);
        uint64_t v3 = NSString;
        int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "presentationMode"));
        BOOL v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "visibility"));
        dispatch_semaphore_t v6 = [v3 stringWithFormat:@"%@,%@", v4, v5];
        id v7 = NSString;
        id v8 = [v2 widget];
        BOOL v9 = [v8 extensionBundleIdentifier];
        dispatch_time_t v10 = [v2 widget];
        uint64_t v11 = [v10 kind];
        uint64_t v12 = [v7 stringWithFormat:@"%@,%@", v9, v11];
        [v18 setValue:v6 forKey:v12];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v17);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_authenticateClient:(id)a3
{
  id v4 = a3;
  char v5 = [(FBServiceClientAuthenticator *)self->_clientAuthenticator authenticateClient:v4];
  if ((v5 & 1) == 0)
  {
    dispatch_semaphore_t v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBTestAutomationService _authenticateClient:](v4, v6);
    }
  }
  return v5;
}

- (id)_iconGridSizeClassFromClientArgument:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    uint64_t v3 = (id *)MEMORY[0x1E4FA6520];
  }
  else {
    uint64_t v3 = (id *)qword_1E6AFCC70[a3 - 1];
  }
  id v4 = *v3;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesByType, 0);
  objc_storeStrong((id *)&self->_inFlightAnimationTransactions, 0);
  objc_storeStrong((id *)&self->_reachabilityEnabledAssertions, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

- (void)systemServiceServer:client:setIdleTimerEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[SBTestAutomationService] Failed to acquire a new idle timer assertion due to error: %@", v2, v3, v4, v5, v6);
}

- (void)systemServiceServer:client:setAmbientPresentationState:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[SBTestAutomationService] Invalid ambient presentation state detected [%lu].", v2, v3, v4, v5, v6);
}

- (void)systemServiceServer:client:setAmbientMountState:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[SBTestAutomationService] Invalid ambient mount state detected [%lu].", v2, v3, v4, v5, v6);
}

- (void)systemServiceServer:client:setAccessoryType:attached:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "[SBTestAutomationService] Cannot handle unidentified accessory type with raw value: %ld", v2, v3, v4, v5, v6);
}

- (void)_authenticateClient:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[SBTestAutomationService] Rejecting request because client '%@' does not have the required entitlement.", v4, 0xCu);
}

@end