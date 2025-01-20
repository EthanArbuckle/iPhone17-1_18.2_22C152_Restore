@interface SBLockScreenService
- (BOOL)isAlwaysOnPolicyActive;
- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4;
- (NSString)analyticsPolicyName;
- (SBFLockOutStatusProvider)lockOutController;
- (SBFUserAuthenticationController)userAuthController;
- (SBLockScreenService)initWithLockScreenManager:(id)a3 workspace:(id)a4 authenticationAssertionProvider:(id)a5 remoteTransientOverlaySessionManager:(id)a6;
- (SBPasscodeEntryTransientOverlayViewController)passcodeEntryTransientOverlayViewController;
- (id)analyticsPolicyValue;
- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText;
- (id)passcodeEntryTransientOverlayViewControllerStatusText;
- (void)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)launchEmergencyDialerWithCompletion:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)lockDeviceAnimated:(id)a3 withCompletion:(id)a4;
- (void)migrateIncomingNotificationsToHistory;
- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3;
- (void)requestPasscodeCheckUIForClient:(id)a3 options:(id)a4 description:(id)a5 withCompletion:(id)a6;
- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4;
- (void)requestPasscodeUnlockUIForClient:(id)a3 options:(id)a4 description:(id)a5 withCompletion:(id)a6;
- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4;
- (void)setLockOutController:(id)a3;
- (void)setPasscodeEntryTransientOverlayViewController:(id)a3;
- (void)setPreventPasscodeLock:(id)a3;
- (void)setPreventSpuriousScreenUndim:(id)a3;
- (void)setUserAuthController:(id)a3;
@end

@implementation SBLockScreenService

- (SBLockScreenService)initWithLockScreenManager:(id)a3 workspace:(id)a4 authenticationAssertionProvider:(id)a5 remoteTransientOverlaySessionManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SBLockScreenService;
  v15 = [(SBLockScreenService *)&v32 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lockScreenManager, a3);
    objc_storeStrong((id *)&v16->_mainWorkspace, a4);
    objc_storeStrong((id *)&v16->_authenticationAssertionProvider, a5);
    objc_storeStrong((id *)&v16->_remoteTransientOverlaySessionManager, a6);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.requestDeviceUnlock" additionalCredentials:3];
    requestDeviceUnlockAuthenticator = v16->_requestDeviceUnlockAuthenticator;
    v16->_requestDeviceUnlockAuthenticator = (FBServiceClientAuthenticator *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    connections = v16->_connections;
    v16->_connections = (NSMutableSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    connectionsPreventingPasscodeLock = v16->_connectionsPreventingPasscodeLock;
    v16->_connectionsPreventingPasscodeLock = (NSMutableSet *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
    connectionsPreventingSpuriousScreenUndim = v16->_connectionsPreventingSpuriousScreenUndim;
    v16->_connectionsPreventingSpuriousScreenUndim = (NSMutableSet *)v23;

    v25 = (void *)MEMORY[0x1E4F628A0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __128__SBLockScreenService_initWithLockScreenManager_workspace_authenticationAssertionProvider_remoteTransientOverlaySessionManager___block_invoke;
    v30[3] = &unk_1E6AF58F0;
    v26 = v16;
    v31 = v26;
    uint64_t v27 = [v25 listenerWithConfigurator:v30];
    id v28 = v26[6];
    v26[6] = (id)v27;

    [v26[6] activate];
  }

  return v16;
}

void __128__SBLockScreenService_initWithLockScreenManager_workspace_authenticationAssertionProvider_remoteTransientOverlaySessionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.frontboard"];
  [v3 setService:@"com.apple.springboard.lockscreen"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

- (void)requestPasscodeUnlockUIForClient:(id)a3 options:(id)a4 description:(id)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  BSDispatchQueueAssertMain();
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBLockScreenService.m", 103, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SBLockScreenService.m", 104, @"Invalid parameter not satisfying: %@", @"description" object file lineNumber description];

LABEL_3:
  requestDeviceUnlockAuthenticator = self->_requestDeviceUnlockAuthenticator;
  id v26 = 0;
  char v16 = [(FBServiceClientAuthenticator *)requestDeviceUnlockAuthenticator authenticateAuditToken:v11 error:&v26];
  id v17 = v26;
  if (v16)
  {
    v18 = objc_alloc_init(SBLockScreenUnlockRequest);
    [(SBLockScreenUnlockRequest *)v18 setSource:19];
    [(SBLockScreenUnlockRequest *)v18 setIntent:2];
    [(SBLockScreenUnlockRequest *)v18 setName:v13];
    [(SBLockScreenUnlockRequest *)v18 setWantsBiometricPresentation:1];
    if ([v12 _aboveOtherContexts]) {
      [(SBLockScreenUnlockRequest *)v18 setForceAlertAuthenticationUI:1];
    }
    if (-[SBRemoteTransientOverlaySessionManager hasSessionWithServiceProcessIdentifier:options:](self->_remoteTransientOverlaySessionManager, "hasSessionWithServiceProcessIdentifier:options:", [v11 pid], 0))
    {
      [(SBLockScreenUnlockRequest *)v18 setSource:9];
    }
    lockScreenManager = self->_lockScreenManager;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__SBLockScreenService_requestPasscodeUnlockUIForClient_options_description_withCompletion___block_invoke;
    v24[3] = &unk_1E6AF5A50;
    id v25 = v14;
    [(SBLockScreenManager *)lockScreenManager unlockWithRequest:v18 completion:v24];
  }
  else
  {
    v20 = SBLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenService requestPasscodeUnlockUIForClient:options:description:withCompletion:]();
    }

    if (v14)
    {
      if (v17)
      {
        (*((void (**)(id, id))v14 + 2))(v14, v17);
      }
      else
      {
        uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
        (*((void (**)(id, void *))v14 + 2))(v14, v21);
      }
    }
  }
}

void __91__SBLockScreenService_requestPasscodeUnlockUIForClient_options_description_withCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (a2)
    {
      id v3 = *(void (**)(uint64_t, void))(v2 + 16);
      uint64_t v4 = *(void *)(a1 + 32);
      v3(v4, 0);
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:16 userInfo:0];
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
    }
  }
}

- (void)requestPasscodeCheckUIForClient:(id)a3 options:(id)a4 description:(id)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void))a6;
  BSDispatchQueueAssertMain();
  if (v11)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SBLockScreenService.m", 140, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"SBLockScreenService.m", 141, @"Invalid parameter not satisfying: %@", @"description" object file lineNumber description];

LABEL_3:
  requestDeviceUnlockAuthenticator = self->_requestDeviceUnlockAuthenticator;
  id v40 = 0;
  char v15 = [(FBServiceClientAuthenticator *)requestDeviceUnlockAuthenticator authenticateAuditToken:v11 error:&v40];
  id v16 = v40;
  if (v15)
  {
    id v17 = [(id)SBApp authenticationController];
    char v18 = [v17 hasPasscodeSet];

    if (v18)
    {
      uint64_t v19 = [v12 title];

      if (v19)
      {
        v20 = [v12 title];
        passcodeTitle = self->_passcodeTitle;
        self->_passcodeTitle = v20;
      }
      v22 = [v12 subtitle];

      if (v22)
      {
        uint64_t v23 = [v12 subtitle];
        passcodeSubtitle = self->_passcodeSubtitle;
        self->_passcodeSubtitle = v23;
      }
      id v25 = (void *)MEMORY[0x1D948C7A0](v13);
      id passcodeCheckCompletion = self->_passcodeCheckCompletion;
      self->_id passcodeCheckCompletion = v25;

      uint64_t v27 = [(SBLockScreenService *)self userAuthController];

      if (!v27)
      {
        id v28 = [(id)SBApp authenticationController];
        userAuthController = self->_userAuthController;
        self->_userAuthController = v28;

        v30 = [(id)SBApp lockOutController];
        lockOutController = self->_lockOutController;
        self->_lockOutController = v30;
      }
      objc_super v32 = [SBPasscodeEntryTransientOverlayViewController alloc];
      v33 = [(id)SBApp authenticationController];
      v34 = [(SBPasscodeEntryTransientOverlayViewController *)v32 initWithAuthenticationController:v33];

      [(SBLockScreenService *)self setPasscodeEntryTransientOverlayViewController:v34];
      [(SBPasscodeEntryTransientOverlayViewController *)self->_passcodeEntryTransientOverlayViewController setDelegate:self];
      v35 = +[SBWorkspace mainWorkspace];
      [v35 presentTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:1 completion:0];
    }
    else
    {
      v13[2](v13, 0);
    }
  }
  else
  {
    v36 = SBLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenService requestPasscodeUnlockUIForClient:options:description:withCompletion:]();
    }

    if (v13)
    {
      if (v16)
      {
        ((void (**)(id, id))v13)[2](v13, v16);
      }
      else
      {
        v37 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
        ((void (**)(id, void *))v13)[2](v13, v37);
      }
    }
  }
}

- (void)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = +[SBWorkspace mainWorkspace];
  [v6 dismissTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:v4 completion:0];

  passcodeEntryTransientOverlayViewController = self->_passcodeEntryTransientOverlayViewController;
  self->_passcodeEntryTransientOverlayViewController = 0;
}

- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__SBLockScreenService_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke;
  v10[3] = &unk_1E6AF5350;
  v10[4] = self;
  id v5 = a4;
  v6 = (void *)MEMORY[0x1D948C7A0](v10);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4FA5EA0]) initForPasscode:v5 source:0 handler:v6];

  v8 = [(SBLockScreenService *)self userAuthController];
  [v8 processAuthenticationRequest:v7];

  return 1;
}

void __88__SBLockScreenService_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke(uint64_t a1, int a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"no";
    if (a2) {
      id v5 = @"yes";
    }
    int v18 = 138412290;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBLockScreenService auth attempt succeeded: %@", (uint8_t *)&v18, 0xCu);
  }

  if ((a2 & 1) != 0 || [*(id *)(*(void *)(a1 + 32) + 144) isBlocked])
  {
    [*(id *)(a1 + 32) _setPasscodeVisible:0 animated:1];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 120);
    if (a2)
    {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    else
    {
      v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:16 userInfo:0];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 120);
    *(void *)(v8 + 120) = 0;

    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 104);
    *(void *)(v10 + 104) = 0;

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 112);
    *(void *)(v12 + 112) = 0;

    uint64_t v14 = *(void *)(a1 + 32);
    char v15 = *(void **)(v14 + 144);
    *(void *)(v14 + 144) = 0;

    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(v16 + 136);
    *(void *)(v16 + 136) = 0;
  }
}

- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  id v4 = +[SBWorkspace mainWorkspace];
  [v4 dismissTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:1 completion:0];
}

- (id)passcodeEntryTransientOverlayViewControllerStatusText
{
  return self->_passcodeTitle;
}

- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText
{
  return self->_passcodeSubtitle;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke;
  id v11 = &unk_1E6AFD478;
  uint64_t v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v7 configureConnection:&v8];
  -[NSMutableSet addObject:](self->_connections, "addObject:", v7, v8, v9, v10, v11, v12);
  [v7 activate];
}

void __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FA6B40];
  id v4 = a2;
  id v5 = [v3 interface];
  [v4 setInterface:v5];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  id v6 = [MEMORY[0x1E4F628B0] userInitiated];
  [v4 setServiceQuality:v6];

  [v4 setTargetQueue:MEMORY[0x1E4F14428]];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E6AFD8D0;
  id v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v4 setInvalidationHandler:v8];
}

void __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "SBLockScreenService: invalidated remotely", (uint8_t *)&v19, 2u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 64) containsObject:v3])
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 40);
      id v7 = [v6 remoteProcess];
      int v19 = 134218242;
      uint64_t v20 = v6;
      __int16 v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client went away and therefore stopped requesting preventPasscodeLock : %{public}@", (uint8_t *)&v19, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 64) removeObject:v3];
    if (![*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      uint64_t v8 = SBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventPasscodeLock - invalidating global assertion", (uint8_t *)&v19, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 72);
      *(void *)(v9 + 72) = 0;
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 80) containsObject:v3])
  {
    id v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void **)(a1 + 40);
      id v13 = [v12 remoteProcess];
      int v19 = 134218242;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client went away and therefore stopped requesting preventSpuriousScreenUndim : %{public}@", (uint8_t *)&v19, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 80) removeObject:v3];
    if (![*(id *)(*(void *)(a1 + 32) + 80) count])
    {
      uint64_t v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventSpuriousScreenUndim - invalidating global assertion", (uint8_t *)&v19, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 88) invalidate];
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(v15 + 88);
      *(void *)(v15 + 88) = 0;

      [*(id *)(*(void *)(a1 + 32) + 96) invalidate];
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = *(void **)(v17 + 96);
      *(void *)(v17 + 96) = 0;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v3];
}

- (void)launchEmergencyDialerWithCompletion:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [v5 remoteProcess];

  id v7 = [MEMORY[0x1E4F624B8] sharedSystemClientAuthenticator];
  uint64_t v8 = [v6 auditToken];
  id v21 = 0;
  int v9 = [v7 authenticateAuditToken:v8 error:&v21];
  id v10 = v21;

  if (v9)
  {
    lockScreenManager = self->_lockScreenManager;
    v22[0] = @"SBUILockOptionsUseScreenOffModeKey";
    uint64_t v12 = [NSNumber numberWithBool:0];
    v23[0] = v12;
    v22[1] = @"SBUILockOptionsLockAutomaticallyKey";
    id v13 = [NSNumber numberWithBool:1];
    v23[1] = v13;
    v22[2] = @"SBUILockOptionsForceLockKey";
    uint64_t v14 = [NSNumber numberWithBool:1];
    v23[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    [(SBLockScreenManager *)lockScreenManager lockUIFromSource:9 withOptions:v15];

    dispatch_time_t v16 = dispatch_walltime(0, 250000000);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__SBLockScreenService_launchEmergencyDialerWithCompletion___block_invoke;
    v19[3] = &unk_1E6AF6828;
    v19[4] = self;
    id v20 = v4;
    dispatch_after(v16, MEMORY[0x1E4F14428], v19);
  }
  else
  {
    uint64_t v17 = SBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenService launchEmergencyDialerWithCompletion:]();
    }

    if (v4)
    {
      if (v10)
      {
        (*((void (**)(id, id))v4 + 2))(v4, v10);
      }
      else
      {
        int v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
        (*((void (**)(id, void *))v4 + 2))(v4, v18);
      }
    }
  }
}

uint64_t __59__SBLockScreenService_launchEmergencyDialerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) lockScreenEnvironment];
  id v3 = [v2 callController];
  [v3 launchEmergencyDialer];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F62880];
  id v8 = a3;
  int v9 = [v7 currentContext];
  id v10 = [v9 remoteProcess];
  id v11 = [v10 auditToken];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__SBLockScreenService_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke;
  v13[3] = &unk_1E6AF5DA8;
  id v14 = v6;
  id v12 = v6;
  [(SBLockScreenService *)self requestPasscodeUnlockUIForClient:v11 options:v8 description:@"SBSRequestPasscodeUnlockUI" withCompletion:v13];
}

uint64_t __73__SBLockScreenService_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F62880];
  id v8 = a3;
  int v9 = [v7 currentContext];
  id v10 = [v9 remoteProcess];
  id v11 = [v10 auditToken];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__SBLockScreenService_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke;
  v13[3] = &unk_1E6AF5DA8;
  id v14 = v6;
  id v12 = v6;
  [(SBLockScreenService *)self requestPasscodeCheckUIForClient:v11 options:v8 description:@"SBSRequestPasscodeCheckUI" withCompletion:v13];
}

uint64_t __72__SBLockScreenService_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPreventPasscodeLock:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F62880];
  id v5 = a3;
  id v6 = [v4 currentContext];
  int v7 = [v5 BOOLValue];

  if (v7)
  {
    id v8 = [v6 remoteProcess];
    if ([v8 hasEntitlement:@"com.apple.springboard.preventDeviceLock"])
    {
      if (([(NSMutableSet *)self->_connectionsPreventingPasscodeLock containsObject:v6] & 1) == 0)
      {
        int v9 = SBLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 134218242;
          v24 = v6;
          __int16 v25 = 2114;
          id v26 = v8;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client started requesting preventPasscodeLock : %{public}@", (uint8_t *)&v23, 0x16u);
        }

        [(NSMutableSet *)self->_connectionsPreventingPasscodeLock addObject:v6];
        if (!self->_preventPasscodeLockAssertion)
        {
          id v10 = SBLogCommon();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: a client has started requesting preventPasscodeLock - creating global assertion", (uint8_t *)&v23, 2u);
          }

          id v11 = [(SBFAuthenticationAssertionProviding *)self->_authenticationAssertionProvider createKeybagUnlockAssertionWithReason:@"LockScreenService"];
          preventPasscodeLockAssertion = self->_preventPasscodeLockAssertion;
          self->_preventPasscodeLockAssertion = v11;

          [(SBFAuthenticationAssertion *)self->_preventPasscodeLockAssertion activate];
        }
      }
    }
    else
    {
      dispatch_time_t v16 = SBLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SBLockScreenService setPreventPasscodeLock:]((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if ([(NSMutableSet *)self->_connectionsPreventingPasscodeLock containsObject:v6])
  {
    [(NSMutableSet *)self->_connectionsPreventingPasscodeLock removeObject:v6];
    id v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v6 remoteProcess];
      int v23 = 134218242;
      v24 = v6;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client stopped requesting preventPasscodeLock : %{public}@", (uint8_t *)&v23, 0x16u);
    }
    if (![(NSMutableSet *)self->_connectionsPreventingPasscodeLock count])
    {
      uint64_t v15 = SBLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventPasscodeLock - invalidating global assertion", (uint8_t *)&v23, 2u);
      }

      [(SBFAuthenticationAssertion *)self->_preventPasscodeLockAssertion invalidate];
      id v8 = self->_preventPasscodeLockAssertion;
      self->_preventPasscodeLockAssertion = 0;
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)setPreventSpuriousScreenUndim:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F62880];
  id v5 = a3;
  id v6 = [v4 currentContext];
  int v7 = [v5 BOOLValue];

  if (v7)
  {
    id v8 = [v6 remoteProcess];
    if ([v8 hasEntitlement:@"com.apple.springboard.preventSpuriousScreenUndim"])
    {
      if ([(NSMutableSet *)self->_connectionsPreventingSpuriousScreenUndim containsObject:v6]) {
        goto LABEL_20;
      }
      int v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v31 = v6;
        __int16 v32 = 2114;
        v33 = v8;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client started requesting preventSpuriousScreenUndim : %{public}@", buf, 0x16u);
      }

      [(NSMutableSet *)self->_connectionsPreventingSpuriousScreenUndim addObject:v6];
      if (self->_preventSpuriousScreenUndimAssertion) {
        goto LABEL_20;
      }
      id v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: a client has started requesting preventSpuriousScreenUndim - creating global assertion", buf, 2u);
      }

      id v11 = [[SBSpuriousScreenUndimmingAssertion alloc] initWithIdentifier:@"SBLockScreenService"];
      preventSpuriousScreenUndimAssertion = self->_preventSpuriousScreenUndimAssertion;
      self->_preventSpuriousScreenUndimAssertion = v11;

      id v13 = (void *)MEMORY[0x1E4F4F4C0];
      id v14 = [MEMORY[0x1E4F4A450] allowAmbientIdleTimer];
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F4F508], "disableAlwaysOn", v14);
      v29[1] = v15;
      dispatch_time_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      uint64_t v17 = [v13 acquireWithExplanation:@"SBLockScreenService-PreventSpuriousScreenUndimming" observer:0 attributes:v16];
      preventSpuriousScreenUndimDisableAlwaysOnAssertion = self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion;
      self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion = v17;
    }
    else
    {
      id v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SBLockScreenService setPreventSpuriousScreenUndim:]((uint64_t)v8, v14, v23, v24, v25, v26, v27, v28);
      }
    }

LABEL_20:
    goto LABEL_21;
  }
  if ([(NSMutableSet *)self->_connectionsPreventingSpuriousScreenUndim containsObject:v6])
  {
    [(NSMutableSet *)self->_connectionsPreventingSpuriousScreenUndim removeObject:v6];
    uint64_t v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v6 remoteProcess];
      *(_DWORD *)buf = 134218242;
      v31 = v6;
      __int16 v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client stopped requesting preventSpuriousScreenUndim : %{public}@", buf, 0x16u);
    }
    if (![(NSMutableSet *)self->_connectionsPreventingSpuriousScreenUndim count])
    {
      uint64_t v21 = SBLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventSpuriousScreenUndim - invalidating global assertion", buf, 2u);
      }

      [(SBSpuriousScreenUndimmingAssertion *)self->_preventSpuriousScreenUndimAssertion invalidate];
      uint64_t v22 = self->_preventSpuriousScreenUndimAssertion;
      self->_preventSpuriousScreenUndimAssertion = 0;

      [(BLSAssertion *)self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion invalidate];
      id v8 = self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion;
      self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion = 0;
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)lockDeviceAnimated:(id)a3 withCompletion:(id)a4
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F62880] currentContext];
  int v9 = [v8 remoteProcess];

  if ([v9 hasEntitlement:@"com.apple.springboard.lockDevice"])
  {
    lockScreenManager = self->_lockScreenManager;
    v17[0] = @"SBUILockOptionsUseScreenOffModeKey";
    v17[1] = @"SBUILockOptionsLockAutomaticallyKey";
    v18[0] = MEMORY[0x1E4F1CC28];
    v18[1] = MEMORY[0x1E4F1CC38];
    v18[2] = MEMORY[0x1E4F1CC38];
    v17[2] = @"SBUILockOptionsForceLockKey";
    v17[3] = @"SBUILockOptionsAnimateLockScreenActivationKey";
    id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
    v18[3] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SBLockScreenService_lockDeviceAnimated_withCompletion___block_invoke;
    v15[3] = &unk_1E6AF5A50;
    id v16 = v7;
    [(SBLockScreenManager *)lockScreenManager lockUIFromSource:21 withOptions:v12 completion:v15];

    id v13 = 0;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F623B0] code:13 userInfo:0];
    id v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenService lockDeviceAnimated:withCompletion:]();
    }

    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v13);
    }
  }
}

uint64_t __57__SBLockScreenService_lockDeviceAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)migrateIncomingNotificationsToHistory
{
}

- (BOOL)isAlwaysOnPolicyActive
{
  return 1;
}

- (NSString)analyticsPolicyName
{
  return (NSString *)@"preventSpuriousScreenUndimming";
}

- (id)analyticsPolicyValue
{
  return (id)[NSNumber numberWithInt:self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion != 0];
}

- (SBPasscodeEntryTransientOverlayViewController)passcodeEntryTransientOverlayViewController
{
  return self->_passcodeEntryTransientOverlayViewController;
}

- (void)setPasscodeEntryTransientOverlayViewController:(id)a3
{
}

- (SBFUserAuthenticationController)userAuthController
{
  return self->_userAuthController;
}

- (void)setUserAuthController:(id)a3
{
}

- (SBFLockOutStatusProvider)lockOutController
{
  return self->_lockOutController;
}

- (void)setLockOutController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_userAuthController, 0);
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, 0);
  objc_storeStrong(&self->_passcodeCheckCompletion, 0);
  objc_storeStrong((id *)&self->_passcodeSubtitle, 0);
  objc_storeStrong((id *)&self->_passcodeTitle, 0);
  objc_storeStrong((id *)&self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion, 0);
  objc_storeStrong((id *)&self->_preventSpuriousScreenUndimAssertion, 0);
  objc_storeStrong((id *)&self->_connectionsPreventingSpuriousScreenUndim, 0);
  objc_storeStrong((id *)&self->_preventPasscodeLockAssertion, 0);
  objc_storeStrong((id *)&self->_connectionsPreventingPasscodeLock, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_requestDeviceUnlockAuthenticator, 0);
  objc_storeStrong((id *)&self->_remoteTransientOverlaySessionManager, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

- (void)requestPasscodeUnlockUIForClient:options:description:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "SBLockScreenService: Insufficient authorization to request unlock for client: %{public}@ -> %@");
}

- (void)launchEmergencyDialerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "SBLockScreenService: Insufficient authorization to show emergency dialer for client: %{public}@ -> %@");
}

- (void)setPreventPasscodeLock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPreventSpuriousScreenUndim:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockDeviceAnimated:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1D85BA000, v0, v1, "SBLockScreenService: Insufficient authorization to lock device for client: %{public}@ -> %@");
}

@end