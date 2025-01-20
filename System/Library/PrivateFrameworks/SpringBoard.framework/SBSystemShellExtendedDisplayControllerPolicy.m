@interface SBSystemShellExtendedDisplayControllerPolicy
- (BOOL)_areRuntimeAvailabilityRequirementsMet;
- (BOOL)_wantsControlOfDisplay;
- (NSString)description;
- (SBSystemShellExtendedDisplayControllerPolicy)initWithExternalDisplayDefaults:(id)a3 appSwitcherDefaults:(id)a4 externalDisplayService:(id)a5 mousePointerManager:(id)a6 runtimeAvailabilitySettings:(id)a7 sceneManager:(id)a8 windowSceneManager:(id)a9;
- (id)_fetchOrCreateSceneWithDisplayConfiguration:(id)a3 deactivationReasons:(unint64_t)a4 sceneManager:(id)a5;
- (id)assertionPreferencesForDisplay:(id)a3 displayConfiguration:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayPreferencesForDisplayController:(id)a3;
- (int64_t)_currentRuntimeMask;
- (unint64_t)displayAssertionDeactivationReasons:(id)a3;
- (unint64_t)displayAssertionPriorityLevel:(id)a3;
- (void)_hardwareAvailabilityChanged;
- (void)_windowManagementStyleDidChange:(id)a3;
- (void)connectToDisplayController:(id)a3 displayConfiguration:(id)a4;
- (void)dealloc;
- (void)displayController:(id)a3 didBeginTransaction:(id)a4 sceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7;
- (void)displayController:(id)a3 didGainControlOfDisplayWithSceneManager:(id)a4;
- (void)displayController:(id)a3 sceneManager:(id)a4 didLoseControlOfDisplayWithDeactivationReasons:(unint64_t)a5;
- (void)displayController:(id)a3 sceneManager:(id)a4 didReceiveNewDeactivationReasons:(unint64_t)a5;
- (void)displayController:(id)a3 updatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5 completion:(id)a6;
- (void)displayControllerDidDisconnect:(id)a3 sceneManager:(id)a4;
- (void)displayControllerWillDisconnect:(id)a3 sceneManager:(id)a4;
- (void)externalDisplayServiceDidUpdatePreferredDisplayArrangement:(id)a3;
- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4;
- (void)reevaluateMirroringEnablement;
@end

@implementation SBSystemShellExtendedDisplayControllerPolicy

- (SBSystemShellExtendedDisplayControllerPolicy)initWithExternalDisplayDefaults:(id)a3 appSwitcherDefaults:(id)a4 externalDisplayService:(id)a5 mousePointerManager:(id)a6 runtimeAvailabilitySettings:(id)a7 sceneManager:(id)a8 windowSceneManager:(id)a9
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  id v35 = a5;
  id v18 = a5;
  id v36 = a6;
  id v19 = a6;
  id v37 = a7;
  id v20 = a7;
  id v38 = a8;
  id v21 = a8;
  id v22 = a9;
  v39 = v16;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 138, @"Invalid parameter not satisfying: %@", @"externalDisplayDefaults" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 139, @"Invalid parameter not satisfying: %@", @"appSwitcherDefaults" object file lineNumber description];

  if (v18)
  {
LABEL_4:
    if (v19) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 140, @"Invalid parameter not satisfying: %@", @"externalDisplayService" object file lineNumber description];

  if (v19)
  {
LABEL_5:
    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 141, @"Invalid parameter not satisfying: %@", @"mousePointerManager" object file lineNumber description];

  if (v20)
  {
LABEL_6:
    if (v21) {
      goto LABEL_7;
    }
LABEL_16:
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 143, @"Invalid parameter not satisfying: %@", @"fbSceneManager" object file lineNumber description];

    if (v22) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_15:
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 142, @"Invalid parameter not satisfying: %@", @"runtimeAvailabilitySettings" object file lineNumber description];

  if (!v21) {
    goto LABEL_16;
  }
LABEL_7:
  if (v22) {
    goto LABEL_8;
  }
LABEL_17:
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 144, @"Invalid parameter not satisfying: %@", @"windowSceneManager" object file lineNumber description];

LABEL_8:
  v40.receiver = self;
  v40.super_class = (Class)SBSystemShellExtendedDisplayControllerPolicy;
  v23 = [(SBSystemShellExtendedDisplayControllerPolicy *)&v40 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_externalDisplayDefaults, a3);
    objc_storeStrong((id *)&v24->_appSwitcherDefaults, obj);
    objc_storeStrong((id *)&v24->_externalDisplayService, v35);
    objc_storeStrong((id *)&v24->_mousePointerManager, v36);
    objc_storeStrong((id *)&v24->_runtimeAvailabilitySettings, v37);
    objc_storeStrong((id *)&v24->_fbSceneManager, v38);
    objc_storeStrong((id *)&v24->_windowSceneManager, a9);
    [(SBExternalDisplayService *)v24->_externalDisplayService addObserver:v24];
    [(PTSettings *)v24->_runtimeAvailabilitySettings addKeyObserver:v24];
  }

  return v24;
}

- (void)dealloc
{
  [(BSContinuousMachTimer *)self->_timerForAttachedDevicesToAffectDisplayAssertion invalidate];
  [(SBExternalDisplayService *)self->_externalDisplayService removeObserver:self];
  [(PTSettings *)self->_runtimeAvailabilitySettings removeKeyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExtendedDisplayControllerPolicy;
  [(SBSystemShellExtendedDisplayControllerPolicy *)&v3 dealloc];
}

- (unint64_t)displayAssertionPriorityLevel:(id)a3
{
  return 2;
}

- (unint64_t)displayAssertionDeactivationReasons:(id)a3
{
  return 0;
}

- (void)connectToDisplayController:(id)a3 displayConfiguration:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    v50 = [NSString stringWithUTF8String:"-[SBSystemShellExtendedDisplayControllerPolicy connectToDisplayController:displayConfiguration:]"];
    [v49 handleFailureInFunction:v50 file:@"SBSystemShellExtendedDisplayControllerPolicy.m" lineNumber:181 description:@"this call must be made on the main thread"];
  }
  objc_storeWeak((id *)&self->_displayController, v7);
  v9 = [v8 identity];
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v9;

  v11 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
  displayDisconnectSignal = self->_displayDisconnectSignal;
  self->_displayDisconnectSignal = v11;

  if ([(FBSDisplayIdentity *)self->_displayIdentity connectionType] != 2
    && [(FBSDisplayIdentity *)self->_displayIdentity connectionType] != 1)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayControllerPolicy.m", 186, @"can only handle .Wired displays or .Wireless displays (unsupported, but we'll run)" object file lineNumber description];
  }
  if ([(FBSDisplayIdentity *)self->_displayIdentity connectionType] == 2)
  {
    v13 = SBLogDisplayControlling();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v46 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      *(_DWORD *)buf = 138543362;
      v63 = v46;
      _os_log_error_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_ERROR, "%{public}@ created with an unsupported display. features are not guaranteed and support is not provided", buf, 0xCu);
    }
  }
  v14 = [(SBExternalDisplayDefaults *)self->_externalDisplayDefaults displayModeSettingsForDisplay:v8];
  displayModeSettings = self->_displayModeSettings;
  self->_displayModeSettings = v14;

  externalDisplayDefaults = self->_externalDisplayDefaults;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke;
  v57[3] = &unk_1E6AF6FC0;
  v57[4] = self;
  id v17 = v8;
  id v58 = v17;
  SEL v59 = a2;
  id v18 = [(SBExternalDisplayDefaults *)externalDisplayDefaults observeDisplayModeSettingsOnQueue:MEMORY[0x1E4F14428] withBlock:v57];
  displayModeSettingsToken = self->_displayModeSettingsToken;
  self->_displayModeSettingsToken = v18;

  [(SBExternalDisplayDefaults *)self->_externalDisplayDefaults contentsScale];
  self->_double contentScale = v20;
  char v21 = BSFloatEqualToFloat();
  id v22 = SBLogDisplayControlling();
  v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      double contentScale = self->_contentScale;
      *(_DWORD *)buf = 138543618;
      v63 = v24;
      __int16 v64 = 2048;
      double v65 = contentScale;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ scale looks OK: %.2f", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v47 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    double v48 = self->_contentScale;
    *(_DWORD *)buf = 138543618;
    v63 = v47;
    __int16 v64 = 2048;
    double v65 = v48;
    _os_log_error_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_ERROR, "%{public}@ returning an unsupported scale. features are not guaranteed and support is not provided: %.2f", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E4FA5E58], "withDisplay:useNativeSize:", v17, -[SBExternalDisplayDefaults chamois](self->_externalDisplayDefaults, "chamois"));
  v26 = (SBDisplayScaleMapping *)objc_claimAutoreleasedReturnValue();
  displayScaleMapping = self->_displayScaleMapping;
  self->_displayScaleMapping = v26;

  BOOL v28 = [(SBSystemShellExtendedDisplayControllerPolicy *)self _areRuntimeAvailabilityRequirementsMet];
  [(SBSystemShellExtendedDisplayControllerPolicy *)self reevaluateMirroringEnablement];
  self->_didConnectToRequiredDevicesDuringTimerWindow = v28;
  v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v29 addObserver:self selector:sel__windowManagementStyleDidChange_ name:@"SBSwitcherControllerWindowManagementStyleDidChangeNotification" object:0];
  id v30 = objc_alloc(MEMORY[0x1E4F4F6F0]);
  v31 = NSString;
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  v34 = [v31 stringWithFormat:@"%@-%@", v33, self->_displayIdentity];
  id v35 = (BSContinuousMachTimer *)[v30 initWithIdentifier:v34];
  timerForAttachedDevicesToAffectDisplayAssertion = self->_timerForAttachedDevicesToAffectDisplayAssertion;
  self->_timerForAttachedDevicesToAffectDisplayAssertion = v35;

  id v37 = self->_timerForAttachedDevicesToAffectDisplayAssertion;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_69;
  v54[3] = &unk_1E6B085E0;
  v54[4] = self;
  SEL v56 = a2;
  id v38 = v29;
  id v55 = v38;
  [(BSContinuousMachTimer *)v37 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v54 queue:14.0 handler:0.5];

  objc_initWeak((id *)buf, self);
  v39 = self->_externalDisplayDefaults;
  objc_super v40 = [NSString stringWithUTF8String:"mirroringEnabled"];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_73;
  v52[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v53, (id *)buf);
  v41 = [(SBExternalDisplayDefaults *)v39 observeDefault:v40 onQueue:MEMORY[0x1E4F14428] withBlock:v52];
  externalDisplayDefaultsToken = self->_externalDisplayDefaultsToken;
  self->_externalDisplayDefaultsToken = v41;

  [(SBMousePointerManager *)self->_mousePointerManager addObserver:self];
  [v38 addObserver:self selector:sel__keyboardAvailabilityChanged_ name:@"SBHardwareKeyboardAvailabilityChangedNotification" object:0];
  v60[0] = @"kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey";
  v43 = [NSNumber numberWithBool:v28];
  v61[0] = v43;
  v61[1] = MEMORY[0x1E4F1CC38];
  v60[1] = @"kSBSystemShellExtendedDisplayControllerFiredDuringDeviceConnectionWindowKey";
  v60[2] = @"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey";
  v44 = [(FBSDisplayIdentity *)self->_displayIdentity rootIdentity];
  v61[2] = v44;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
  [v38 postNotificationName:@"SBSystemShellExtendedDisplayControllerPolicyConnectNotification" object:self userInfo:v45];

  objc_destroyWeak(&v53);
  objc_destroyWeak((id *)buf);
}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) displayModeSettingsForDisplay:*(void *)(a1 + 40)];
  if (!v2)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"SBSystemShellExtendedDisplayControllerPolicy.m", 196, @"got nil SBSDisplayModeSettings for display: %@", *(void *)(a1 + 40) object file lineNumber description];
  }
  if (([*(id *)(*(void *)(a1 + 32) + 96) isEqual:v2] & 1) == 0)
  {
    objc_super v3 = SBLogDisplayControlling();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect SBSDisplayModeSettings change in defaults", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v2);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained requestUpdate:3];
  }
}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_69(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 168) hasBeenSignalled] & 1) == 0)
  {
    v2 = SBLogDisplayControlling();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v3 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 32));
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ device timer fired -- newly connecting devices will no longer drive display assertion", buf, 0xCu);
    }
    uint64_t v6 = a1 + 32;
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v6 + 8);
    id v7 = objc_msgSend(*(id *)(v4 + 16), "rootIdentity", @"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey");
    v10 = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"SBSystemShellExtendedDisplayControllerPolicyDeviceConnectionWindowExpiredNotification" object:v4 userInfo:v8];
  }
}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_73(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained[3] isMirroringEnabled];
    id v4 = objc_loadWeakRetained(v2 + 1);
    [v4 requestUpdate:7];

    v5 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_2;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    char v7 = v3;
    dispatch_async(v5, block);
  }
}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F50150]);
  char v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  id v4 = (void *)[v2 initWithStarting:v3];

  v5 = BiomeLibrary();
  uint64_t v6 = [v5 SpringBoard];
  char v7 = [v6 ExternalDisplay];
  id v8 = [v7 MirroringMode];

  uint64_t v9 = [v8 source];
  [v9 sendEvent:v4];
  v10 = SBLogBiome();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(unsigned __int8 *)(a1 + 32);
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Donate mirroring mode enabled: %{BOOL}u", (uint8_t *)v12, 8u);
  }
}

- (void)displayControllerWillDisconnect:(id)a3 sceneManager:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [(BSAtomicSignal *)self->_displayDisconnectSignal signal];
  [(BSDefaultObserver *)self->_displayModeSettingsToken invalidate];
  displayModeSettingsToken = self->_displayModeSettingsToken;
  self->_displayModeSettingsToken = 0;

  [(BSDefaultObserver *)self->_externalDisplayDefaultsToken invalidate];
  externalDisplayDefaultsToken = self->_externalDisplayDefaultsToken;
  self->_externalDisplayDefaultsToken = 0;

  [(SBMousePointerManager *)self->_mousePointerManager removeObserver:self];
  char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];
  v10 = @"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey";
  id v8 = [(FBSDisplayIdentity *)self->_displayIdentity rootIdentity];
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v7 postNotificationName:@"SBSystemShellExtendedDisplayControllerPolicyDisconnectNotification" object:self userInfo:v9];
}

- (void)displayControllerDidDisconnect:(id)a3 sceneManager:(id)a4
{
}

- (void)displayController:(id)a3 didGainControlOfDisplayWithSceneManager:(id)a4
{
  v5 = objc_msgSend(a4, "allScenes", a3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__SBSystemShellExtendedDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke;
  v6[3] = &unk_1E6AF87C0;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];

  self->_previouslyReceivedDeactivationReasons = 0;
}

void __106__SBSystemShellExtendedDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = [v7 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    v5 = [v7 uiSettings];
    uint64_t v6 = (void *)[v5 mutableCopy];

    if (*(id *)(*(void *)(a1 + 32) + 120) == v7) {
      [v6 setForeground:1];
    }
    objc_msgSend(v6, "setDeactivationReasons:", objc_msgSend(v6, "deactivationReasons") & ~*(void *)(*(void *)(a1 + 32) + 128));
    [v7 updateSettings:v6 withTransitionContext:0];
  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didLoseControlOfDisplayWithDeactivationReasons:(unint64_t)a5
{
  id v7 = objc_msgSend(a4, "allScenes", a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __126__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke;
  v8[3] = &unk_1E6B08608;
  v8[4] = self;
  v8[5] = a5;
  [v7 enumerateObjectsUsingBlock:v8];

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __126__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = [v7 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    v5 = [v7 uiSettings];
    uint64_t v6 = (void *)[v5 mutableCopy];

    if (*(id *)(*(void *)(a1 + 32) + 120) == v7) {
      [v6 setForeground:0];
    }
    objc_msgSend(v6, "setDeactivationReasons:", *(void *)(a1 + 40) | objc_msgSend(v6, "deactivationReasons"));
    [v7 updateSettings:v6 withTransitionContext:0];
  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didReceiveNewDeactivationReasons:(unint64_t)a5
{
  id v7 = objc_msgSend(a4, "allScenes", a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke;
  v8[3] = &unk_1E6B08608;
  v8[4] = self;
  v8[5] = a5;
  [v7 enumerateObjectsUsingBlock:v8];

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __112__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = [v7 settings];
  int v4 = [v3 isUISubclass];

  if (v4)
  {
    v5 = [v7 uiSettings];
    uint64_t v6 = (void *)[v5 mutableCopy];

    objc_msgSend(v6, "setDeactivationReasons:", *(void *)(a1 + 40) | objc_msgSend(v6, "deactivationReasons") & ~*(void *)(*(void *)(a1 + 32) + 128));
    [v7 updateSettings:v6 withTransitionContext:0];
  }
}

- (void)displayController:(id)a3 didBeginTransaction:(id)a4 sceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([(SBSystemShellExtendedDisplayControllerPolicy *)self _wantsControlOfDisplay])
  {
    v15 = [(SBSystemShellExtendedDisplayControllerPolicy *)self _fetchOrCreateSceneWithDisplayConfiguration:v14 deactivationReasons:a7 sceneManager:v13];
    id v16 = SBLogDisplayControlling();
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        __int16 v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved springboard scene %{public}@", buf, 0x16u);
      }
      if ([v12 isAuditHistoryEnabled])
      {
        id v19 = [v15 identifier];
        [v12 _addAuditHistoryItem:@"retrieved springboard scene %@", v19];
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SBSystemShellExtendedDisplayControllerPolicy displayController:didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:]((void **)&self->super.isa, (uint64_t)a2, v17);
      }

      if ([v12 isAuditHistoryEnabled]) {
        [v12 _addAuditHistoryItem:@"failed to retrieve springboard scene"];
      }
    }
    currentScene = self->_currentScene;
    self->_currentScene = (FBScene *)v15;
  }
  else
  {
    [(FBScene *)self->_currentScene invalidate];
    double v20 = [v13 allScenes];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __140__SBSystemShellExtendedDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke;
    v22[3] = &unk_1E6AF87C0;
    v22[4] = self;
    [v20 enumerateObjectsUsingBlock:v22];

    currentScene = self->_currentScene;
    self->_currentScene = 0;
  }
}

uint64_t __140__SBSystemShellExtendedDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(*(void *)(result + 32) + 120) != a2) {
    return [a2 invalidate];
  }
  return result;
}

- (void)displayController:(id)a3 updatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  char v14 = [(FBSDisplayConfiguration *)self->_lastPresentationUpdateDisplayConfiguration isEqual:v12];
  if ((v14 & 1) == 0) {
    objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, a5);
  }
  v15 = [MEMORY[0x1E4F1CA80] set];
  id v16 = [v11 boundPointerUIScenes];
  if (v16) {
    [v15 unionSet:v16];
  }
  if (self->_currentScene) {
    objc_msgSend(v15, "addObject:");
  }
  uint64_t v17 = [v15 count];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  if (v17) {
    char v18 = v14;
  }
  else {
    char v18 = 1;
  }
  if (v18)
  {
    v13[2](v13);
  }
  else
  {
    uint64_t v19 = v17;
    double v20 = SBLogDisplayControlling();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ running update as display changed and we have scenes to update", buf, 0xCu);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke;
    v23[3] = &unk_1E6B08658;
    id v24 = v12;
    __int16 v25 = self;
    SEL v28 = a2;
    uint64_t v29 = v19;
    uint64_t v27 = v30;
    v26 = v13;
    [v15 enumerateObjectsUsingBlock:v23];
  }
  _Block_object_dispose(v30, 8);
}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 settings];
  v5 = (void *)[v4 mutableCopy];

  [v5 setDisplayConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v5, "setFrame:");
  uint64_t v6 = SBLogDisplayControlling();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_cold_1(a1, v3, v6);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_86;
  v11[3] = &unk_1E6B08630;
  v11[4] = *(void *)(a1 + 40);
  id v12 = v3;
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = v7;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v10;
  long long v13 = v10;
  id v9 = v3;
  [v9 updateSettings:v5 withTransitionContext:0 completion:v11];
}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_86(void *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 7);
  ++*(void *)(*(void *)(a1[7] + 8) + 24);
  id v3 = SBLogDisplayControlling();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_86_cold_1((uint64_t)a1, v2, v3);
  }

  if (*(void *)(*(void *)(a1[7] + 8) + 24) == a1[9]) {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (id)displayPreferencesForDisplayController:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F629A0]);
  [(SBSDisplayModeSettings *)self->_displayModeSettings overscanCompensation];
  [v4 setOverscanCompensation:FBSDisplayOverscanCompensationForDisplayValue()];
  if ([(SBExternalDisplayDefaults *)self->_externalDisplayDefaults chamois])
  {
    [(SBDisplayScaleMapping *)self->_displayScaleMapping referenceSize];
    objc_msgSend(v4, "setNativePixelSize:");
  }
  [(SBDisplayScaleMapping *)self->_displayScaleMapping logicalScaleForDisplayScale:[(SBSDisplayModeSettings *)self->_displayModeSettings scale]];
  uint64_t v6 = -[SBSceneHostingDisplayPreferences initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:]([SBSceneHostingDisplayPreferences alloc], "initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:", v4, 0, v5, v5, self->_contentScale);

  return v6;
}

- (id)assertionPreferencesForDisplay:(id)a3 displayConfiguration:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(SBDisplayAssertionPreferences);
  [(SBDisplayAssertionPreferences *)v6 setWantsControlOfDisplay:[(SBSystemShellExtendedDisplayControllerPolicy *)self _wantsControlOfDisplay]];
  uint64_t v7 = [(SBExternalDisplayService *)self->_externalDisplayService preferredArrangementOfExternalDisplay:self->_displayIdentity];
  [(SBDisplayAssertionPreferences *)v6 setDisplayArrangement:v7];

  id v8 = +[SBDisplayPowerLogEntry forDisplay:v5 mode:3 zoom:SBDisplayPowerLogZoomLevelFromScale([(SBSDisplayModeSettings *)self->_displayModeSettings scale])];

  [(SBDisplayAssertionPreferences *)v6 setPowerLogEntry:v8];
  displayIdentity = self->_displayIdentity;
  uint64_t v10 = objc_opt_class();
  id v11 = _SBPreventIdleSleepReason(displayIdentity, v10);
  [(SBDisplayAssertionPreferences *)v6 setDisableSystemIdleSleepReason:v11];

  [(SBDisplayAssertionPreferences *)v6 setCloneMirroringMode:2];
  return v6;
}

- (BOOL)_wantsControlOfDisplay
{
  return [(SBExternalDisplayDefaults *)self->_externalDisplayDefaults isMirroringEnabled] ^ 1;
}

- (void)externalDisplayServiceDidUpdatePreferredDisplayArrangement:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"-[SBSystemShellExtendedDisplayControllerPolicy externalDisplayServiceDidUpdatePreferredDisplayArrangement:]"];
    [v4 handleFailureInFunction:v5 file:@"SBSystemShellExtendedDisplayControllerPolicy.m" lineNumber:460 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayController);
  [WeakRetained requestUpdate:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSystemShellExtendedDisplayControllerPolicy *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBSystemShellExtendedDisplayControllerPolicy *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
  v15[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v16 = v6;
  uint64_t v17 = self;
  [v6 appendBodySectionWithName:@"Display Scale Mapping" multilinePrefix:v4 block:v15];
  if (self->_currentScene)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v13[3] = &unk_1E6AF5290;
    v13[4] = self;
    id v7 = v6;
    id v14 = v7;
    [v7 appendBodySectionWithName:@"FBScene" multilinePrefix:v4 block:v13];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v10[3] = &unk_1E6AF5290;
    id v11 = v7;
    id v12 = self;
    [v11 appendBodySectionWithName:@"Dev Overrides" multilinePrefix:@"\t" block:v10];
  }
  id v8 = v6;

  return v8;
}

id __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 104) withName:0];
}

void __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 120) uiSettings];
  uint64_t v2 = *(void **)(a1 + 40);
  [v8 frame];
  id v3 = (id)objc_msgSend(v2, "appendRect:withName:", @"frame");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(v8, "isForeground"), @"isForeground");
  id v5 = *(void **)(a1 + 40);
  [v8 deactivationReasons];
  id v6 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  id v7 = (id)[v5 appendObject:v6 withName:@"deactivationReasons"];
}

id __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "connectionType") == 1, @"isWiredDisplay");
  id v3 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 24) contentsScale];
  return (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", @"contentsScale", 2);
}

- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__SBSystemShellExtendedDisplayControllerPolicy_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke;
  v4[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __108__SBSystemShellExtendedDisplayControllerPolicy_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hardwareAvailabilityChanged];
}

- (BOOL)_areRuntimeAvailabilityRequirementsMet
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBSystemShellExtendedDisplayControllerPolicy *)self _currentRuntimeMask];
  uint64_t v4 = [(SBExternalDisplayRuntimeAvailabilitySettings *)self->_runtimeAvailabilitySettings extendedDisplayRequirements];
  id v5 = SBLogDisplayControlling();
  if (os_signpost_enabled(v5))
  {
    id v6 = SBManagedDisplayModeRequirementMaskDescription(v4);
    id v7 = SBManagedDisplayModeRequirementMaskDescription(v3);
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    *(void *)char v18 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_EXTENDED_DISPLAY_RESOLVER_EVALUATE", "required: %{public}@; current: %{public}@",
      (uint8_t *)&v15,
      0x16u);
  }
  uint64_t v8 = v4 & v3;

  id v9 = SBLogDisplayControlling();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    id v11 = SBManagedDisplayModeRequirementMaskDescription(v4);
    id v12 = SBManagedDisplayModeRequirementMaskDescription(v3);
    int v15 = 138544130;
    id v16 = v10;
    __int16 v17 = 1024;
    *(_DWORD *)char v18 = v8 == v4;
    *(_WORD *)&v18[4] = 2114;
    *(void *)&v18[6] = v11;
    __int16 v19 = 2114;
    double v20 = v12;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ returning %{BOOL}u; requiredMask: %{public}@; currentMask: %{public}@",
      (uint8_t *)&v15,
      0x26u);
  }
  BOOL v13 = v8 == v4;

  self->_requiredHardwareAvailable = v13;
  return v13;
}

- (int64_t)_currentRuntimeMask
{
  return SBBitmaskUnionIf();
}

uint64_t __67__SBSystemShellExtendedDisplayControllerPolicy__currentRuntimeMask__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) isHardwarePointingDeviceAttached];
}

uint64_t __67__SBSystemShellExtendedDisplayControllerPolicy__currentRuntimeMask__block_invoke_2()
{
  [(id)SBApp updateHardwareKeyboardAttached];
  v0 = (void *)SBApp;
  return [v0 isHardwareKeyboardAttached];
}

- (void)_hardwareAvailabilityChanged
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBSystemShellExtendedDisplayControllerPolicy *)self _areRuntimeAvailabilityRequirementsMet];
  uint64_t v4 = [(BSContinuousMachTimer *)self->_timerForAttachedDevicesToAffectDisplayAssertion isScheduled];
  if (v4)
  {
    if (!self->_didConnectToRequiredDevicesDuringTimerWindow && v3)
    {
      id v11 = SBLogDisplayControlling();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        *(_DWORD *)buf = 138543618;
        char v18 = v13;
        __int16 v19 = 1024;
        BOOL v20 = v3;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ saw required devices connect while timer was scheduled. isAvailable: %{BOOL}u", buf, 0x12u);
      }
      self->_didConnectToRequiredDevicesDuringTimerWindow = v3;
      [(SBSystemShellExtendedDisplayControllerPolicy *)self reevaluateMirroringEnablement];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_displayController);
      [WeakRetained requestUpdate:7];
    }
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey");
  v16[0] = v7;
  v15[1] = @"kSBSystemShellExtendedDisplayControllerFiredDuringDeviceConnectionWindowKey";
  uint64_t v8 = [NSNumber numberWithBool:v4];
  v16[1] = v8;
  v15[2] = @"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey";
  id v9 = [(FBSDisplayIdentity *)self->_displayIdentity rootIdentity];
  v16[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v6 postNotificationName:@"SBSystemShellExtendedDisplayControllerHardwareAvailabilityNotification" object:self userInfo:v10];
}

- (void)_windowManagementStyleDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 object];

  SBSafeCast(v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v8 windowScene];
  LODWORD(v4) = [v7 isMainDisplayWindowScene];

  if (v4) {
    [(SBSystemShellExtendedDisplayControllerPolicy *)self reevaluateMirroringEnablement];
  }
}

- (void)reevaluateMirroringEnablement
{
  if ([(SBAppSwitcherDefaults *)self->_appSwitcherDefaults shouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates])
  {
    windowSceneManager = self->_windowSceneManager;
    id v4 = [MEMORY[0x1E4F62420] mainIdentity];
    id v8 = [(SBWindowSceneManager *)windowSceneManager windowSceneForDisplayIdentity:v4];

    uint64_t v5 = [v8 switcherController];
    uint64_t v6 = [v5 windowManagementStyle];

    if (v6) {
      BOOL v7 = !self->_requiredHardwareAvailable;
    }
    else {
      BOOL v7 = 1;
    }
    [(SBExternalDisplayDefaults *)self->_externalDisplayDefaults setMirroringEnabled:v7];
  }
}

- (id)_fetchOrCreateSceneWithDisplayConfiguration:(id)a3 deactivationReasons:(unint64_t)a4 sceneManager:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F62A60];
  id v11 = NSString;
  id v12 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v13 = [v12 bundleIdentifier];
  id v14 = [v8 identity];
  int v15 = [v11 stringWithFormat:@"%@:%@", v13, v14];
  id v16 = [v10 identityForIdentifier:v15];

  fbSceneManager = self->_fbSceneManager;
  char v18 = [v16 identifier];
  __int16 v19 = [(FBSceneManager *)fbSceneManager sceneWithIdentifier:v18];

  if (v19)
  {
    BOOL v20 = [v19 uiSettings];
    uint64_t v21 = (void *)[v20 mutableCopy];

    [v21 setDisplayConfiguration:v8];
    [v8 bounds];
    objc_msgSend(v21, "setFrame:");
    [v21 setForeground:a4 == 0];
    objc_msgSend(v21, "setDeactivationReasons:", objc_msgSend(v21, "deactivationReasons") | a4);
    [v19 updateSettings:v21 withTransitionContext:0];
    id v22 = SBLogDisplayControlling();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      id v24 = [v19 identifier];
      *(_DWORD *)buf = 138543618;
      v45 = v23;
      __int16 v46 = 2114;
      v47 = v24;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "%{public}@ reset %{public}@ for presentation", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F629B0] definition];
    [v21 setIdentity:v16];
    __int16 v25 = [FBSSceneClientIdentity localIdentity];
    [v21 setClientIdentity:v25];

    v26 = +[FBSSceneSpecification specification];
    [v21 setSpecification:v26];

    uint64_t v27 = (void *)MEMORY[0x1E4F629B8];
    SEL v28 = [v21 specification];
    id v22 = [v27 parametersForSpecification:v28];

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __125__SBSystemShellExtendedDisplayControllerPolicy__fetchOrCreateSceneWithDisplayConfiguration_deactivationReasons_sceneManager___block_invoke;
    v40[3] = &unk_1E6B08680;
    id v41 = v8;
    unint64_t v43 = a4;
    id v39 = v9;
    id v42 = v9;
    [v22 updateSettingsWithBlock:v40];
    [v22 updateClientSettingsWithBlock:&__block_literal_global_139];
    uint64_t v29 = self->_fbSceneManager;
    id v30 = [v21 identity];
    v31 = [v30 identifier];
    v32 = [MEMORY[0x1E4F62430] sharedInstance];
    __int16 v19 = [(FBSceneManager *)v29 createSceneWithIdentifier:v31 parameters:v22 clientProvider:v32 transitionContext:0];

    uint64_t v33 = SBLogDisplayControlling();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      id v35 = [v19 identifier];
      *(_DWORD *)buf = 138543618;
      v45 = v34;
      __int16 v46 = 2114;
      v47 = v35;
      _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_INFO, "%{public}@ initialized %{public}@ for presentation", buf, 0x16u);
    }
    id v36 = [v19 systemShellHostingEnvironment];
    id v37 = SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
    [v36 setSystemShellHostingSpaceIdentifier:v37];

    id v9 = v39;
  }

  return v19;
}

void __125__SBSystemShellExtendedDisplayControllerPolicy__fetchOrCreateSceneWithDisplayConfiguration_deactivationReasons_sceneManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetOfEventDeferringEnvironments:0];
  [v3 setInterfaceOrientationMode:2];
  id v4 = (void *)SBApp;
  uint64_t v5 = [*(id *)(a1 + 32) identity];
  uint64_t v6 = [v4 userInterfaceStyleProviderForDisplay:v5];
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "currentStyle"));

  objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
  BOOL v7 = [v3 ignoreOcclusionReasons];
  [v7 addObject:@"SystemApp"];

  [v3 setInterfaceOrientation:1];
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v3, "setFrame:");
  [v3 setLevel:0.0];
  [v3 setForeground:*(void *)(a1 + 48) == 0];
  [v3 setDeactivationReasons:*(void *)(a1 + 48)];
  id v8 = [v3 transientLocalSettings];
  [v8 setObject:*(void *)(a1 + 40) forSetting:4444];

  [v3 setEnhancedWindowingEnabled:1];
}

void __125__SBSystemShellExtendedDisplayControllerPolicy__fetchOrCreateSceneWithDisplayConfiguration_deactivationReasons_sceneManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStatusBarStyle:0];
  [v2 setInterfaceOrientation:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDisconnectSignal, 0);
  objc_storeStrong((id *)&self->_timerForAttachedDevicesToAffectDisplayAssertion, 0);
  objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
  objc_storeStrong((id *)&self->_displayScaleMapping, 0);
  objc_storeStrong((id *)&self->_displayModeSettings, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_mousePointerManager, 0);
  objc_storeStrong((id *)&self->_runtimeAvailabilitySettings, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
  objc_storeStrong((id *)&self->_displayModeSettingsToken, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaultsToken, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaults, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_destroyWeak((id *)&self->_displayController);
}

- (void)displayController:(NSObject *)a3 didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:.cold.1(void **a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _SBDisplayControllerLoggingProem(a1[2], a1);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve springboard scene", (uint8_t *)&v5, 0xCu);
}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 40) + 16), *(void **)(a1 + 40));
  uint64_t v7 = [a2 identity];
  uint64_t v8 = *(void *)(a1 + 72);
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  id v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ updating displayConfig+frame for %{public}@; pendingUpdateCount: %lu",
    (uint8_t *)&v9,
    0x20u);
}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_86_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _SBDisplayControllerLoggingProem(*(void **)(*(void *)(a1 + 32) + 16), *(void **)(a1 + 32));
  uint64_t v7 = [*(id *)(a1 + 40) identity];
  uint64_t v8 = *(void *)(*(void *)(*(void *)a2 + 8) + 24);
  uint64_t v9 = *(void *)(a1 + 72);
  int v10 = 138544130;
  __int16 v11 = v6;
  __int16 v12 = 2114;
  __int16 v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = v8;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ completed update for %{public}@; completedUpdateCount: %lu; pendingUpdateCount: %lu",
    (uint8_t *)&v10,
    0x2Au);
}

@end