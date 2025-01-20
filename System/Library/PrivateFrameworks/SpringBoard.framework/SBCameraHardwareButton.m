@interface SBCameraHardwareButton
- (BOOL)_deferToForegroundApp;
- (BOOL)_deferToPhysicalOverrideScene;
- (BOOL)_isCoverSheetCameraVisible;
- (BOOL)_shouldDeferToCoverSheetCamera;
- (BOOL)_shouldDeferToNonSpringBoardProcess;
- (BOOL)disableDeferringToApplications;
- (BOOL)shouldUsePocketStateDetection;
- (SBCameraHardwareButton)initWithActivationManager:(id)a3;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (double)longPressCancellationTimeout;
- (id)hardwareButtonIdentifier;
- (uint64_t)activationManager;
- (uint64_t)allCameraShutterButtonPIDs;
- (uint64_t)applicationController;
- (uint64_t)backlightController;
- (uint64_t)backlightStudyLogger;
- (uint64_t)coverSheetPresentationManager;
- (uint64_t)defaults;
- (uint64_t)deferringTokensPerPID;
- (uint64_t)deliveryManager;
- (uint64_t)foregroundCameraShutterButtonPIDs;
- (uint64_t)foregroundPendingRemovalCameraShutterButtonPIDs;
- (uint64_t)lastCameraApplicationPID;
- (uint64_t)liftToWakeStudyLogger;
- (uint64_t)lockScreenManager;
- (uint64_t)longPressCancellationTimer;
- (uint64_t)longPressCondition;
- (uint64_t)mainDisplaySceneManager;
- (uint64_t)outOfPocketCondition;
- (uint64_t)physicalButtonOverrideScene;
- (uint64_t)pocketStateManager;
- (uint64_t)proximitySensorManager;
- (uint64_t)setLastCameraApplicationPID:(uint64_t)result;
- (uint64_t)setLongPressCancellationTimeout:(uint64_t)result;
- (uint64_t)setShouldUsePocketStateDetection:(uint64_t)result;
- (uint64_t)settings;
- (uint64_t)shouldLaunchCameraCondition;
- (uint64_t)studyLogger;
- (void)_deferCameraPressesToApplication:(id)a3;
- (void)_deferCameraPressesToCameraApplication;
- (void)_deferCameraPressesToPID:(int)a3;
- (void)_deferCameraPressesToSpringBoard;
- (void)_launchCameraIfReady;
- (void)_longPressDidCancel;
- (void)_notifyCoreAnalyticsCameraDidLaunchToLockScreen:(BOOL)a3 screenWasOff:(BOOL)a4;
- (void)_process:(id)a3 stateDidUpdate:(id)a4;
- (void)_reconfigureProcessMonitor;
- (void)_reconfigureProcessMonitorForPredicates:(id)a3;
- (void)_startWaitingForLongPressCancellation;
- (void)_stopWaitingForLongPressCancellation;
- (void)_updateCameraDeferringRule;
- (void)_updateSettingsForReason:(id)a3;
- (void)addProcessRequestingCameraButton:(int)a3 token:(id)a4;
- (void)cancelHardwareButtonPress;
- (void)dealloc;
- (void)handleButtonEvent:(__IOHIDEvent *)a3;
- (void)performActionsForButtonDown:(id)a3;
- (void)performActionsForButtonLongPress:(id)a3;
- (void)physicalButtonSceneOverridesDidChange:(id)a3;
- (void)removeProcessRequestingCameraButton:(int)a3;
- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4;
- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4;
- (void)setActivationManager:(uint64_t)a1;
- (void)setAllCameraShutterButtonPIDs:(uint64_t)a1;
- (void)setApplicationController:(uint64_t)a1;
- (void)setBacklightController:(uint64_t)a1;
- (void)setBacklightStudyLogger:(uint64_t)a1;
- (void)setButtonArbiter:(uint64_t)a1;
- (void)setCoverSheetPresentationManager:(uint64_t)a1;
- (void)setDefaults:(uint64_t)a1;
- (void)setDeferringRuleAssertion:(uint64_t)a1;
- (void)setDeferringTokensPerPID:(uint64_t)a1;
- (void)setDeliveryManager:(uint64_t)a1;
- (void)setDisableDeferringToApplications:(BOOL)a3;
- (void)setDispatchingRuleAssertion:(uint64_t)a1;
- (void)setForegroundCameraShutterButtonPIDs:(uint64_t)a1;
- (void)setForegroundPendingRemovalCameraShutterButtonPIDs:(uint64_t)a1;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)setLiftToWakeStudyLogger:(uint64_t)a1;
- (void)setLockScreenManager:(uint64_t)a1;
- (void)setLongPressCancellationTimer:(uint64_t)a1;
- (void)setLongPressCondition:(uint64_t)a1;
- (void)setMainDisplaySceneManager:(uint64_t)a1;
- (void)setOutOfPocketCondition:(uint64_t)a1;
- (void)setPhysicalButtonOverrideObserver:(uint64_t)a1;
- (void)setPhysicalButtonOverrideScene:(uint64_t)a1;
- (void)setPocketStateManager:(uint64_t)a1;
- (void)setProcessMonitor:(uint64_t)a1;
- (void)setProximitySensorManager:(uint64_t)a1;
- (void)setSettings:(uint64_t)a1;
- (void)setShouldLaunchCameraCondition:(uint64_t)a1;
- (void)setStudyLogger:(uint64_t)a1;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBCameraHardwareButton

- (void)setDispatchingRuleAssertion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setPhysicalButtonOverrideObserver:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setDeferringRuleAssertion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)foregroundCameraShutterButtonPIDs
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)allCameraShutterButtonPIDs
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void)setDisableDeferringToApplications:(BOOL)a3
{
  if (self->_disableDeferringToApplications != a3)
  {
    self->_disableDeferringToApplications = a3;
    [(SBCameraHardwareButton *)self _updateCameraDeferringRule];
  }
}

- (void)_process:(id)a3 stateDidUpdate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v8 = SBLogButtonsCamera();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 state];
    v10 = [v9 endowmentNamespaces];
    int v25 = 138543874;
    id v26 = v6;
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "process %{public}@ update:%{public}@ endowments:%{public}@", (uint8_t *)&v25, 0x20u);
  }
  int v11 = [v6 pid];
  v12 = [v7 state];
  v13 = [v7 previousState];
  int v14 = [v12 taskState];
  v15 = (void *)MEMORY[0x1E4F62718];
  if (v14 == 4)
  {
    v16 = [v12 endowmentNamespaces];
    int v17 = [v16 containsObject:*v15];
  }
  else
  {
    int v17 = 0;
  }
  if ([v13 taskState] == 4)
  {
    v18 = [v13 endowmentNamespaces];
    int v19 = [v18 containsObject:*v15];
  }
  else
  {
    int v19 = 0;
  }
  if (v19 != v17)
  {
    v20 = SBLogButtonsCamera();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v21)
      {
        int v25 = 138543362;
        id v26 = v6;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "process is running / visible:%{public}@", (uint8_t *)&v25, 0xCu);
      }

      foregroundCameraShutterButtonPIDs = self->_foregroundCameraShutterButtonPIDs;
      if (!foregroundCameraShutterButtonPIDs)
      {
        v23 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
        v24 = self->_foregroundCameraShutterButtonPIDs;
        self->_foregroundCameraShutterButtonPIDs = v23;

        foregroundCameraShutterButtonPIDs = self->_foregroundCameraShutterButtonPIDs;
      }
      [(NSMutableIndexSet *)foregroundCameraShutterButtonPIDs addIndex:v11];
      if ([(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs count] == 1) {
        [(SBSceneManager *)self->_mainDisplaySceneManager addObserver:self];
      }
    }
    else
    {
      if (v21)
      {
        int v25 = 138543362;
        id v26 = v6;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "process is not running / not visible:%{public}@", (uint8_t *)&v25, 0xCu);
      }

      [(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs removeIndex:v11];
      [(NSMutableIndexSet *)self->_foregroundPendingRemovalCameraShutterButtonPIDs removeIndex:v11];
      if (![(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs count]) {
        [(SBSceneManager *)self->_mainDisplaySceneManager removeObserver:self];
      }
    }
    [(SBCameraHardwareButton *)self _updateCameraDeferringRule];
  }
}

- (void)_updateCameraDeferringRule
{
  if (![(SBCameraHardwareButton *)self _shouldDeferToNonSpringBoardProcess]
    || ![(SBCameraHardwareButton *)self _deferToPhysicalOverrideScene]
    && ![(SBCameraHardwareButton *)self _deferToForegroundApp])
  {
    [(SBCameraHardwareButton *)self _deferCameraPressesToSpringBoard];
  }
}

- (BOOL)_shouldDeferToNonSpringBoardProcess
{
  BOOL disableDeferringToApplications = self->_disableDeferringToApplications;
  if (self->_disableDeferringToApplications)
  {
    v3 = SBLogButtonsCamera();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_shouldDeferToNonSpringBoardProcess shouldSendToSpringBoard:YES", v5, 2u);
    }
  }
  return !disableDeferringToApplications;
}

- (BOOL)_deferToPhysicalOverrideScene
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = SBLogButtonsCamera();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    physicalButtonOverrideScene = self->_physicalButtonOverrideScene;
    int v12 = 138543362;
    v13 = physicalButtonOverrideScene;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_deferToPhysicalOverrideScene scene:%{public}@", (uint8_t *)&v12, 0xCu);
  }

  int v5 = [(FBScene *)self->_physicalButtonOverrideScene isActive];
  if (v5)
  {
    id v6 = [(FBScene *)self->_physicalButtonOverrideScene clientHandle];
    id v7 = [v6 processHandle];
    uint64_t v8 = [v7 pid];

    v9 = SBLogButtonsCamera();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BSProcessDescriptionForPID();
      v10 = (FBScene *)objc_claimAutoreleasedReturnValue();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "_deferToPhysicalOverrideScene process:%{public}@", (uint8_t *)&v12, 0xCu);
    }
    if ((int)v8 < 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      [(SBCameraHardwareButton *)self _deferCameraPressesToPID:v8];
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)_deferCameraPressesToPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int lastCameraApplicationPID = self->_lastCameraApplicationPID;
  id v6 = SBLogButtonsCamera();
  id v7 = v6;
  if (lastCameraApplicationPID == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBCameraHardwareButton _deferCameraPressesToPID:](v3, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = BSProcessDescriptionForPID();
      int v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "_deferCameraPressesToPID: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    [(BSInvalidatable *)self->_deferringRuleAssertion invalidate];
    deferringRuleAssertion = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = 0;

    id v7 = [MEMORY[0x1E4F4F358] new];
    v10 = [MEMORY[0x1E4F4F280] environmentWithIdentifier:@"cameraButton"];
    [v7 setEnvironment:v10];
    int v11 = (void *)[MEMORY[0x1E4F4F368] new];
    [v11 setPid:v3];
    int v12 = [(BSMutableIntegerMap *)self->_deferringTokensPerPID objectForKey:(int)v3];
    if (v12) {
      [v11 setToken:v12];
    }
    v13 = [(BKSHIDEventDeliveryManager *)self->_deliveryManager deferEventsMatchingPredicate:v7 toTarget:v11 withReason:@"CameraIsAlive"];
    uint64_t v14 = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = v13;

    self->_int lastCameraApplicationPID = v3;
  }
}

- (void)physicalButtonSceneOverridesDidChange:(id)a3
{
  id obj = [a3 cameraBehaviorScene];
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_physicalButtonOverrideScene, obj);
    [(SBCameraHardwareButton *)self _updateCameraDeferringRule];
  }
}

- (BOOL)_deferToForegroundApp
{
  uint64_t v3 = [(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs count];
  if (v3)
  {
    if ([(SBCameraHardwareButton *)self _shouldDeferToCoverSheetCamera]) {
      [(SBCameraHardwareButton *)self _deferCameraPressesToCameraApplication];
    }
    else {
      [(SBCameraHardwareButton *)self _deferCameraPressesToPID:[(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs firstIndex]];
    }
  }
  return v3 != 0;
}

- (BOOL)_shouldDeferToCoverSheetCamera
{
  uint64_t v3 = [(SBApplicationController *)self->_applicationController cameraApplication];
  v4 = [v3 bundleIdentifier];
  BOOL v5 = v4 != 0;
  if (v4)
  {
    if (![(SBCameraHardwareButton *)self _isCoverSheetCameraVisible])
    {
      BOOL v5 = 0;
      goto LABEL_10;
    }
    id v6 = SBLogButtonsCamera();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v7 = "_shouldDeferToCoverSheetCamera YES: cover sheet visible && camera view is visible";
      uint64_t v8 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    id v6 = SBLogButtonsCamera();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "_shouldDeferToCoverSheetCamera NO: camera app missing from device";
      uint64_t v8 = buf;
      goto LABEL_7;
    }
  }

LABEL_10:
  return v5;
}

- (BOOL)_isCoverSheetCameraVisible
{
  if ([(SBCoverSheetPresentationManager *)self->_coverSheetPresentationManager isVisible])
  {
    uint64_t v3 = [(SBCoverSheetPresentationManager *)self->_coverSheetPresentationManager coverSheetHostedAppSceneHandle];
    v4 = [v3 application];

    BOOL v5 = [(SBApplicationController *)self->_applicationController cameraApplication];
    id v6 = v5;
    if (v4)
    {
      char v7 = [v4 isEqual:v5];

      if (v7) {
        return 1;
      }
    }
    else
    {
    }
  }
  return 0;
}

uint64_t __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _process:*(void *)(a1 + 40) stateDidUpdate:*(void *)(a1 + 48)];
}

void __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  BSDispatchMain();
}

- (SBCameraHardwareButton)initWithActivationManager:(id)a3
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v61 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activationManager != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBCameraHardwareButton *)a2 initWithActivationManager:(uint64_t)v61];
    }
    [v61 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D87C0C68);
  }
  id v7 = v6;
  v68.receiver = self;
  v68.super_class = (Class)SBCameraHardwareButton;
  id v8 = [(SBCameraHardwareButton *)&v68 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_activationManager, a3);
    uint64_t v10 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    deliveryManager = v9->_deliveryManager;
    v9->_deliveryManager = (BKSHIDEventDeliveryManager *)v10;

    uint64_t v12 = +[SBApplicationController sharedInstance];
    applicationController = v9->_applicationController;
    v9->_applicationController = (SBApplicationController *)v12;

    uint64_t v14 = +[SBLockScreenManager sharedInstance];
    lockScreenManager = v9->_lockScreenManager;
    v9->_lockScreenManager = (SBLockScreenManager *)v14;

    uint64_t v16 = +[SBCoverSheetPresentationManager sharedInstance];
    coverSheetPresentationManager = v9->_coverSheetPresentationManager;
    v9->_coverSheetPresentationManager = (SBCoverSheetPresentationManager *)v16;

    uint64_t v18 = +[SBBacklightController sharedInstance];
    backlightController = v9->_backlightController;
    v9->_backlightController = (SBBacklightController *)v18;

    uint64_t v20 = [(id)SBApp proximitySensorManager];
    proximitySensorManager = v9->_proximitySensorManager;
    v9->_proximitySensorManager = (SBProximitySensorManager *)v20;

    v22 = (CMPocketStateManager *)objc_alloc_init(MEMORY[0x1E4F22268]);
    pocketStateManager = v9->_pocketStateManager;
    v9->_pocketStateManager = v22;

    v24 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    v65 = v7;
    mainDisplaySceneManager = v9->_mainDisplaySceneManager;
    v9->_mainDisplaySceneManager = v24;
    v64 = v24;

    id v26 = [(SBSceneManager *)v64 physicalButtonSceneOverrideManager];
    uint64_t v27 = -[SBPhysicalButtonSceneOverrideManager addObserver:forReason:](v26, (uint64_t)v9, @"camera hardware button");
    physicalButtonOverrideObserver = v9->_physicalButtonOverrideObserver;
    v9->_physicalButtonOverrideObserver = (BSInvalidatable *)v27;

    __int16 v29 = objc_alloc_init(SBCameraHardwareButtonStudyLogger);
    studyLogger = v9->_studyLogger;
    v9->_studyLogger = v29;

    uint64_t v31 = [[SBBacklightStudyLogger alloc] initWithController:v9->_backlightController];
    backlightStudyLogger = v9->_backlightStudyLogger;
    v9->_backlightStudyLogger = v31;

    v33 = [SBLiftToWakeStudyLogger alloc];
    v34 = +[SBLiftToWakeController sharedController];
    uint64_t v35 = [(SBLiftToWakeStudyLogger *)v33 initWithController:v34];
    liftToWakeStudyLogger = v9->_liftToWakeStudyLogger;
    v9->_liftToWakeStudyLogger = (SBLiftToWakeStudyLogger *)v35;

    v63 = [MEMORY[0x1E4F4F308] build:&__block_literal_global_32];
    v37 = (void *)[MEMORY[0x1E4F4F370] new];
    v38 = [MEMORY[0x1E4F1CAD0] setWithObject:v63];
    [v37 setSenderDescriptors:v38];

    v62 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:144 usage:33];
    v39 = [MEMORY[0x1E4F1CAD0] setWithObject:v62];
    [v37 setDescriptors:v39];

    v40 = [MEMORY[0x1E4F4F280] environmentWithIdentifier:@"cameraButton"];
    v41 = [MEMORY[0x1E4F4F2C8] targetForDeferringEnvironment:v40];
    v42 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v37 toTarget:v41];
    v43 = v9->_deliveryManager;
    v70[0] = v42;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
    uint64_t v45 = [(BKSHIDEventDeliveryManager *)v43 dispatchDiscreteEventsForReason:@"SBCameraHardwareButton" withRules:v44];
    dispatchingRuleAssertion = v9->_dispatchingRuleAssertion;
    v9->_dispatchingRuleAssertion = (BSInvalidatable *)v45;

    v47 = objc_alloc_init(SBHIDButtonStateArbiter);
    buttonArbiter = v9->_buttonArbiter;
    v9->_buttonArbiter = v47;

    [(SBHIDButtonStateArbiter *)v9->_buttonArbiter setDelegate:v9];
    uint64_t v49 = +[SBCameraHardwareButtonDomain rootSettings];
    settings = v9->_settings;
    v9->_settings = (SBCameraHardwareButtonSettings *)v49;

    [(PTSettings *)v9->_settings addKeyObserver:v9];
    v51 = +[SBDefaults localDefaults];
    uint64_t v52 = [v51 cameraHardwareButtonDefaults];
    defaults = v9->_defaults;
    v9->_defaults = (SBCameraHardwareButtonDefaults *)v52;

    v54 = v9->_defaults;
    v55 = [NSString stringWithUTF8String:"shutterButtonLongPressTimeout"];
    v69[0] = v55;
    v56 = [NSString stringWithUTF8String:"shutterButtonShouldUsePocketDetection"];
    v69[1] = v56;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __52__SBCameraHardwareButton_initWithActivationManager___block_invoke_2;
    v66[3] = &unk_1E6AF4AC0;
    v58 = v9;
    v67 = v58;
    id v59 = (id)[(SBCameraHardwareButtonDefaults *)v54 observeDefaults:v57 onQueue:MEMORY[0x1E4F14428] withBlock:v66];

    id v7 = v65;
    [(SBCameraHardwareButton *)v58 _updateSettingsForReason:@"launch time"];
    [(SBCameraHardwareButton *)v58 _reconfigureProcessMonitor];
  }
  return v9;
}

uint64_t __52__SBCameraHardwareButton_initWithActivationManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAuthenticated:1];
}

uint64_t __52__SBCameraHardwareButton_initWithActivationManager___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSettingsForReason:@"user defaults changed"];
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_dispatchingRuleAssertion invalidate];
  [(BSInvalidatable *)self->_deferringRuleAssertion invalidate];
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  [(BSAbsoluteMachTimer *)self->_longPressCancellationTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBCameraHardwareButton;
  [(SBCameraHardwareButton *)&v3 dealloc];
}

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v6 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 144 && v6 == 33)
  {
    [(SBCameraHardwareButtonStudyLogger *)self->_studyLogger logButtonEvent:a3];
    buttonArbiter = self->_buttonArbiter;
    [(SBHIDButtonStateArbiter *)buttonArbiter processEvent:a3];
  }
}

- (void)addProcessRequestingCameraButton:(int)a3 token:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SBLogButtonsCamera();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a3;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "add pid %d", (uint8_t *)v13, 8u);
  }

  allCameraShutterButtonPIDs = self->_allCameraShutterButtonPIDs;
  if (!allCameraShutterButtonPIDs)
  {
    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v10 = self->_allCameraShutterButtonPIDs;
    self->_allCameraShutterButtonPIDs = v9;

    int v11 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    deferringTokensPerPID = self->_deferringTokensPerPID;
    self->_deferringTokensPerPID = v11;

    allCameraShutterButtonPIDs = self->_allCameraShutterButtonPIDs;
  }
  [(NSMutableIndexSet *)allCameraShutterButtonPIDs addIndex:a3];
  if (v6) {
    [(BSMutableIntegerMap *)self->_deferringTokensPerPID setObject:v6 forKey:a3];
  }
  [(SBCameraHardwareButton *)self _reconfigureProcessMonitor];
}

- (void)removeProcessRequestingCameraButton:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogButtonsCamera();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "remove pid %d", (uint8_t *)v6, 8u);
  }

  [(NSMutableIndexSet *)self->_allCameraShutterButtonPIDs removeIndex:a3];
  [(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs removeIndex:a3];
  [(NSMutableIndexSet *)self->_foregroundPendingRemovalCameraShutterButtonPIDs removeIndex:a3];
  [(BSMutableIntegerMap *)self->_deferringTokensPerPID removeObjectForKey:a3];
  [(SBCameraHardwareButton *)self _reconfigureProcessMonitor];
  [(SBCameraHardwareButton *)self _updateCameraDeferringRule];
}

- (void)_updateSettingsForReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F94118] sharedInstance];
  int v6 = [v5 prototypeSettingsEnabled];

  if (v6)
  {
    [(SBCameraHardwareButtonSettings *)self->_settings shutterButtonLongPressTimeout];
    double v8 = v7;
    [(SBCameraHardwareButtonSettings *)self->_settings shutterButtonLongPressCancellationTimeout];
    double v10 = v9;
    int v11 = [(SBCameraHardwareButtonSettings *)self->_settings shutterButtonShouldUsePocketDetection];
    uint64_t v12 = SBLogButtonsCamera();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v18 = 138543362;
      *(void *)&v18[4] = v4;
      v13 = "update settings (because %{public}@) from prototype settings";
LABEL_6:
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, v13, v18, 0xCu);
    }
  }
  else
  {
    [(SBCameraHardwareButtonDefaults *)self->_defaults shutterButtonLongPressTimeout];
    double v8 = v14;
    [(SBCameraHardwareButtonDefaults *)self->_defaults shutterButtonLongPressCancellationTimeout];
    double v10 = v15;
    int v11 = [(SBCameraHardwareButtonDefaults *)self->_defaults shutterButtonShouldUsePocketDetection];
    uint64_t v12 = SBLogButtonsCamera();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v18 = 138543362;
      *(void *)&v18[4] = v4;
      v13 = "update settings (because %{public}@) from defaults";
      goto LABEL_6;
    }
  }

  if (self->_shouldUsePocketStateDetection != v11
    || ([(SBHIDButtonStateArbiter *)self->_buttonArbiter longPressTimeout], v16 != v8)
    || self->_longPressCancellationTimeout != v10)
  {
    self->_shouldUsePocketStateDetection = v11;
    -[SBHIDButtonStateArbiter setLongPressTimeout:](self->_buttonArbiter, "setLongPressTimeout:", fmin(fmax(v8, 0.0), 10.0), *(_OWORD *)v18);
    self->_longPressCancellationTimeout = fmin(fmax(v10, 0.0), 10.0);
    uint64_t v17 = SBLogButtonsCamera();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v18 = 134218496;
      *(double *)&v18[4] = v8;
      *(_WORD *)&v18[12] = 2048;
      *(double *)&v18[14] = v10;
      __int16 v19 = 1024;
      int v20 = v11;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "settings update longPressTimeout:%g cancelAfter:%g pocketDetectEnabled:%{BOOL}u", v18, 0x1Cu);
    }
  }
}

- (void)_reconfigureProcessMonitor
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  allCameraShutterButtonPIDs = self->_allCameraShutterButtonPIDs;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__SBCameraHardwareButton__reconfigureProcessMonitor__block_invoke;
  v11[3] = &unk_1E6AF86F8;
  id v5 = v3;
  id v12 = v5;
  [(NSMutableIndexSet *)allCameraShutterButtonPIDs enumerateIndexesUsingBlock:v11];
  int v6 = [(SBApplicationController *)self->_applicationController cameraApplication];
  double v7 = v6;
  if (v6)
  {
    double v8 = (void *)MEMORY[0x1E4F96430];
    double v9 = [v6 bundleIdentifier];
    double v10 = [v8 predicateMatchingBundleIdentifier:v9];

    [v5 addObject:v10];
  }
  [(SBCameraHardwareButton *)self _reconfigureProcessMonitorForPredicates:v5];
}

void __52__SBCameraHardwareButton__reconfigureProcessMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x1E4F96430];
  id v4 = [NSNumber numberWithInt:a2];
  id v5 = [v3 predicateMatchingIdentifier:v4];

  [*(id *)(a1 + 32) addObject:v5];
}

- (void)_reconfigureProcessMonitorForPredicates:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    processMonitor = self->_processMonitor;
    if (processMonitor)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_4;
      v11[3] = &unk_1E6AF9058;
      id v12 = v5;
      [(RBSProcessMonitor *)processMonitor updateConfiguration:v11];
      double v7 = v12;
    }
    else
    {
      double v8 = (void *)MEMORY[0x1E4F96418];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      _DWORD v13[2] = __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke;
      v13[3] = &unk_1E6AF9030;
      v13[4] = self;
      double v14 = v5;
      double v9 = [v8 monitorWithConfiguration:v13];
      double v10 = self->_processMonitor;
      self->_processMonitor = v9;

      double v7 = v14;
    }
  }
  else
  {
    [(RBSProcessMonitor *)self->_processMonitor invalidate];
    double v7 = self->_processMonitor;
    self->_processMonitor = 0;
  }
}

void __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F96448];
  id v4 = a2;
  id v5 = [v3 descriptor];
  v8[0] = *MEMORY[0x1E4F62718];
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 setEndowmentNamespaces:v6];

  [v4 setStateDescriptor:v5];
  [v4 setServiceClass:33];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_2;
  v7[3] = &unk_1E6AF9008;
  v7[4] = *(void *)(a1 + 32);
  [v4 setUpdateHandler:v7];
  [v4 setPredicates:*(void *)(a1 + 40)];
}

uint64_t __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setPredicates:*(void *)(a1 + 32)];
}

- (void)_deferCameraPressesToSpringBoard
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "_deferCameraPressesToSpringBoard (but this is not a change)", v1, 2u);
}

- (void)_deferCameraPressesToApplication:(id)a3
{
  if (a3)
  {
    id v4 = [a3 processState];
    if ([v4 isRunning])
    {
      -[SBCameraHardwareButton _deferCameraPressesToPID:](self, "_deferCameraPressesToPID:", [v4 pid]);
    }
    else
    {
      id v5 = SBLogButtonsCamera();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "_deferCameraPressesToApplication: camera app is not running, back to SpringBoard for now", v7, 2u);
      }

      [(BSInvalidatable *)self->_deferringRuleAssertion invalidate];
      deferringRuleAssertion = self->_deferringRuleAssertion;
      self->_deferringRuleAssertion = 0;

      self->_int lastCameraApplicationPID = -1;
    }
  }
}

- (void)_deferCameraPressesToCameraApplication
{
  id v3 = [(SBApplicationController *)self->_applicationController cameraApplication];
  [(SBCameraHardwareButton *)self _deferCameraPressesToApplication:v3];
}

- (void)_launchCameraIfReady
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = SBLogButtonsCamera();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(_SBCameraLaunchCondition *)self->_shouldLaunchCameraCondition isMet];
    BOOL v5 = [(_SBCameraLaunchCondition *)self->_longPressCondition isMet];
    BOOL v6 = [(_SBCameraLaunchCondition *)self->_outOfPocketCondition isMet];
    *(_DWORD *)buf = 67109632;
    BOOL v20 = v4;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    __int16 v23 = 1024;
    BOOL v24 = v6;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_launchCameraIfReady (launch:%{BOOL}u long press:%{BOOL}u outOfPocket:%{BOOL}u)", buf, 0x14u);
  }

  if ([(_SBCameraLaunchCondition *)self->_shouldLaunchCameraCondition isMet])
  {
    if (![(_SBCameraLaunchCondition *)self->_longPressCondition isMet]) {
      goto LABEL_9;
    }
    BOOL v7 = [(SBLockScreenManager *)self->_lockScreenManager isUILocked];
    BOOL v8 = [(SBBacklightController *)self->_backlightController screenIsDim];
    double v9 = SBLogButtonsCamera();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v20 = v7;
      __int16 v21 = 1024;
      BOOL v22 = v8;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "_launchCameraIfReady: launching screen-locked:%{BOOL}u dim:%{BOOL}u", buf, 0xEu);
    }

    if (v7 && v8)
    {
      lockScreenManager = self->_lockScreenManager;
      uint64_t v17 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
      uint64_t v18 = MEMORY[0x1E4F1CC38];
      char v11 = 1;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [(SBLockScreenManager *)lockScreenManager unlockUIFromSource:27 withOptions:v12];
    }
    else
    {
LABEL_9:
      char v11 = 0;
    }
    activationManager = self->_activationManager;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__SBCameraHardwareButton__launchCameraIfReady__block_invoke;
    v15[3] = &unk_1E6AF9080;
    v15[4] = self;
    char v16 = v11;
    double v14 = activationManager;
    -[SBCameraActivationManager activateCaptureApplicationWithBundleID:URL:fromSource:withPreludeAnimationToken:completion:]((uint64_t)v14, 0, 0, 0x20uLL, 0, v15);
  }
}

- (uint64_t)activationManager
{
  if (result) {
    return *(void *)(result + 168);
  }
  return result;
}

uint64_t __46__SBCameraHardwareButton__launchCameraIfReady__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _notifyCoreAnalyticsCameraDidLaunchToLockScreen:a2 screenWasOff:*(unsigned __int8 *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  return [v3 _updateCameraDeferringRule];
}

- (void)_notifyCoreAnalyticsCameraDidLaunchToLockScreen:(BOOL)a3 screenWasOff:(BOOL)a4
{
}

id __87__SBCameraHardwareButton__notifyCoreAnalyticsCameraDidLaunchToLockScreen_screenWasOff___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"lockScreen";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v6[1] = @"screenOff";
  v7[0] = v2;
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)_startWaitingForLongPressCancellation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_longPressCancellationTimeout > 0.0
    && [(SBCoverSheetPresentationManager *)self->_coverSheetPresentationManager isVisible])
  {
    id v3 = SBLogButtonsCamera();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double longPressCancellationTimeout = self->_longPressCancellationTimeout;
      *(_DWORD *)buf = 134217984;
      double v13 = longPressCancellationTimeout;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_startWaitingForLongPressCancellation: coversheet visible, starting timer for %g seconds", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    BOOL v5 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBCameraHardwareButton.longPressCancellationTimer"];
    longPressCancellationTimer = self->_longPressCancellationTimer;
    self->_longPressCancellationTimer = v5;

    BOOL v7 = self->_longPressCancellationTimer;
    double v8 = self->_longPressCancellationTimeout;
    id v9 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__SBCameraHardwareButton__startWaitingForLongPressCancellation__block_invoke;
    v10[3] = &unk_1E6AF5838;
    objc_copyWeak(&v11, (id *)buf);
    [(BSAbsoluteMachTimer *)v7 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v10 queue:v8 handler:0.0];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __63__SBCameraHardwareButton__startWaitingForLongPressCancellation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _longPressDidCancel];
}

- (void)_longPressDidCancel
{
  [(SBCameraHardwareButton *)self _stopWaitingForLongPressCancellation];
  id v3 = +[_SBCameraLaunchCondition conditionWithValue:0];
  shouldLaunchCameraCondition = self->_shouldLaunchCameraCondition;
  self->_shouldLaunchCameraCondition = v3;

  if ([(SBCameraHardwareButton *)self _isCoverSheetCameraVisible])
  {
    BOOL v5 = SBLogButtonsCamera();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "_longPressDidCancel: returning to main coversheet page", v7, 2u);
    }

    BOOL v6 = [(SBLockScreenManager *)self->_lockScreenManager coverSheetViewController];
    [v6 activateMainPageWithCompletion:&__block_literal_global_112];
  }
}

- (void)_stopWaitingForLongPressCancellation
{
  [(BSAbsoluteMachTimer *)self->_longPressCancellationTimer invalidate];
  longPressCancellationTimer = self->_longPressCancellationTimer;
  self->_longPressCancellationTimer = 0;
}

- (void)performActionsForButtonDown:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  BOOL v6 = [(SBCameraHardwareButton *)self hardwareButtonIdentifier];
  LOBYTE(hardwareButtonCoordinator) = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator buttonShouldStart:v6];

  if (hardwareButtonCoordinator)
  {
    [(SBCameraHardwareButton *)self _startWaitingForLongPressCancellation];
    BOOL v7 = +[_SBCameraLaunchCondition conditionWithValue:0];
    longPressCondition = self->_longPressCondition;
    self->_longPressCondition = v7;

    id v9 = +[_SBCameraLaunchCondition conditionWithValue:0];
    outOfPocketCondition = self->_outOfPocketCondition;
    self->_outOfPocketCondition = v9;

    if ([(SBBacklightController *)self->_backlightController screenIsDim]
      && [(SBProximitySensorManager *)self->_proximitySensorManager isObjectInProximity])
    {
      id v11 = SBLogButtonsCamera();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: object in proximity, bailing", buf, 2u);
      }

      id v12 = +[_SBCameraLaunchCondition conditionWithValue:0];
      shouldLaunchCameraCondition = self->_shouldLaunchCameraCondition;
      self->_shouldLaunchCameraCondition = v12;

      [v4 reset];
    }
    else
    {
      [(SBHIDButtonStateArbiter *)self->_buttonArbiter longPressTimeout];
      uint64_t v16 = v15;
      BOOL v17 = [(SBLockScreenManager *)self->_lockScreenManager isUILocked];
      BOOL v18 = [(SBBacklightController *)self->_backlightController screenIsDim];
      if (v17
        && v18
        && [(SBCameraHardwareButtonSettings *)self->_settings shutterButtonShouldUsePocketDetection])
      {
        __int16 v19 = SBLogButtonsCamera();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: checking pocket state", buf, 2u);
        }

        BOOL v20 = self->_outOfPocketCondition;
        v32[0] = self->_longPressCondition;
        v32[1] = v20;
        __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
        BOOL v22 = +[_SBCameraLaunchCondition conditionWithConditions:v21];
        __int16 v23 = self->_shouldLaunchCameraCondition;
        self->_shouldLaunchCameraCondition = v22;

        pocketStateManager = self->_pocketStateManager;
        [(SBBacklightController *)self->_backlightController defaultLockScreenDimIntervalWhenNotificationsPresent];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __54__SBCameraHardwareButton_performActionsForButtonDown___block_invoke;
        v29[3] = &unk_1E6AF90C8;
        v29[4] = self;
        -[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:](pocketStateManager, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", MEMORY[0x1E4F14428], v29);
      }
      else
      {
        uint64_t v25 = +[_SBCameraLaunchCondition conditionWithValue:1];
        id v26 = self->_shouldLaunchCameraCondition;
        self->_shouldLaunchCameraCondition = v25;

        uint64_t v27 = SBLogButtonsCamera();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v31 = v16;
          _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: waiting for long press (timeout:%g)", buf, 0xCu);
        }
      }
      if ([(SBHIDButtonStateArbiter *)self->_buttonArbiter isLongPressDisabled])
      {
        id v28 = SBLogButtonsCamera();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: long press timeout is zero", buf, 2u);
        }

        [(_SBCameraLaunchCondition *)self->_longPressCondition setMet:1];
        [(SBCameraHardwareButton *)self _launchCameraIfReady];
      }
    }
  }
  else
  {
    uint64_t v14 = SBLogButtonsCamera();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: button coordinator says NO, bailing", buf, 2u);
    }
  }
}

void __54__SBCameraHardwareButton_performActionsForButtonDown___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 240) logPocketState:a2];
  id v4 = SBLogButtonsCamera();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (v5)
    {
      int v6 = 67109120;
      int v7 = a2;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: not out-of-pocket (%d); ignoring press",
        (uint8_t *)&v6,
        8u);
    }
  }
  else
  {
    if (v5)
    {
      int v6 = 67109120;
      int v7 = a2;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: out-of-pocket (%d)", (uint8_t *)&v6, 8u);
    }

    [*(id *)(*(void *)(a1 + 32) + 120) setMet:1];
    [*(id *)(a1 + 32) _launchCameraIfReady];
  }
}

- (void)performActionsForButtonLongPress:(id)a3
{
  [(_SBCameraLaunchCondition *)self->_longPressCondition setMet:1];
  [(SBCameraHardwareButton *)self _launchCameraIfReady];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3) {
    [(SBCameraHardwareButton *)self _updateSettingsForReason:@"prototype settings changed", a4];
  }
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend(a4, "application", a3);
  int v6 = [v5 processState];
  unsigned int v7 = [v6 pid];

  if ((int)v7 >= 1
    && [(NSMutableIndexSet *)self->_foregroundPendingRemovalCameraShutterButtonPIDs containsIndex:v7])
  {
    uint64_t v8 = SBLogButtonsCamera();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "pid restored:%d", (uint8_t *)v9, 8u);
    }

    [(NSMutableIndexSet *)self->_foregroundPendingRemovalCameraShutterButtonPIDs removeIndex:v7];
    [(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs addIndex:v7];
    [(SBCameraHardwareButton *)self _updateCameraDeferringRule];
  }
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  uint64_t v8 = [v7 application];
  id v9 = [v8 processState];
  unsigned int v10 = [v9 pid];

  if ((int)v10 >= 1
    && [(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs containsIndex:v10])
  {
    id v24 = v6;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = [v6 externalForegroundApplicationSceneHandles];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) application];
          BOOL v17 = [v16 processState];
          int v18 = [v17 pid];

          if (v18 == v10)
          {

            __int16 v23 = SBLogButtonsCamera();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              unsigned int v30 = v10;
              _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "foreground scenes still exist for PID %d", buf, 8u);
            }

            goto LABEL_19;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    __int16 v19 = SBLogButtonsCamera();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v30 = v10;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "removing PID %d", buf, 8u);
    }

    foregroundPendingRemovalCameraShutterButtonPIDs = self->_foregroundPendingRemovalCameraShutterButtonPIDs;
    if (!foregroundPendingRemovalCameraShutterButtonPIDs)
    {
      __int16 v21 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
      BOOL v22 = self->_foregroundPendingRemovalCameraShutterButtonPIDs;
      self->_foregroundPendingRemovalCameraShutterButtonPIDs = v21;

      foregroundPendingRemovalCameraShutterButtonPIDs = self->_foregroundPendingRemovalCameraShutterButtonPIDs;
    }
    [(NSMutableIndexSet *)foregroundPendingRemovalCameraShutterButtonPIDs addIndex:v10];
    [(NSMutableIndexSet *)self->_foregroundCameraShutterButtonPIDs removeIndex:v10];
LABEL_19:
    id v6 = v24;
    [(SBCameraHardwareButton *)self _updateCameraDeferringRule];
  }
}

- (void)cancelHardwareButtonPress
{
}

- (id)hardwareButtonIdentifier
{
  return @"Camera";
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (BOOL)disableDeferringToApplications
{
  return self->_disableDeferringToApplications;
}

- (uint64_t)lastCameraApplicationPID
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

- (uint64_t)setLastCameraApplicationPID:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 12) = a2;
  }
  return result;
}

- (void)setAllCameraShutterButtonPIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setForegroundCameraShutterButtonPIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (uint64_t)foregroundPendingRemovalCameraShutterButtonPIDs
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (void)setForegroundPendingRemovalCameraShutterButtonPIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (uint64_t)deferringTokensPerPID
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void)setDeferringTokensPerPID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setButtonArbiter:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)setProcessMonitor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (uint64_t)pocketStateManager
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (void)setPocketStateManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (uint64_t)shouldLaunchCameraCondition
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (void)setShouldLaunchCameraCondition:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (uint64_t)longPressCondition
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (void)setLongPressCondition:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (uint64_t)outOfPocketCondition
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

- (void)setOutOfPocketCondition:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (uint64_t)longPressCancellationTimer
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (void)setLongPressCancellationTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (uint64_t)physicalButtonOverrideScene
{
  if (result) {
    return *(void *)(result + 136);
  }
  return result;
}

- (void)setPhysicalButtonOverrideScene:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (double)longPressCancellationTimeout
{
  if (a1) {
    return *(double *)(a1 + 144);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setLongPressCancellationTimeout:(uint64_t)result
{
  if (result) {
    *(double *)(result + 144) = a2;
  }
  return result;
}

- (BOOL)shouldUsePocketStateDetection
{
  if (result) {
    return *(unsigned char *)(result + 9) != 0;
  }
  return result;
}

- (uint64_t)setShouldUsePocketStateDetection:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 9) = a2;
  }
  return result;
}

- (uint64_t)deliveryManager
{
  if (result) {
    return *(void *)(result + 152);
  }
  return result;
}

- (void)setDeliveryManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (uint64_t)applicationController
{
  if (result) {
    return *(void *)(result + 160);
  }
  return result;
}

- (void)setApplicationController:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 160), a2);
  }
}

- (void)setActivationManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 168), a2);
  }
}

- (uint64_t)lockScreenManager
{
  if (result) {
    return *(void *)(result + 176);
  }
  return result;
}

- (void)setLockScreenManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 176), a2);
  }
}

- (uint64_t)coverSheetPresentationManager
{
  if (result) {
    return *(void *)(result + 184);
  }
  return result;
}

- (void)setCoverSheetPresentationManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 184), a2);
  }
}

- (uint64_t)backlightController
{
  if (result) {
    return *(void *)(result + 192);
  }
  return result;
}

- (void)setBacklightController:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

- (uint64_t)proximitySensorManager
{
  if (result) {
    return *(void *)(result + 200);
  }
  return result;
}

- (void)setProximitySensorManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 200), a2);
  }
}

- (uint64_t)mainDisplaySceneManager
{
  if (result) {
    return *(void *)(result + 208);
  }
  return result;
}

- (void)setMainDisplaySceneManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 208), a2);
  }
}

- (uint64_t)settings
{
  if (result) {
    return *(void *)(result + 216);
  }
  return result;
}

- (void)setSettings:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 216), a2);
  }
}

- (uint64_t)defaults
{
  if (result) {
    return *(void *)(result + 224);
  }
  return result;
}

- (void)setDefaults:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 224), a2);
  }
}

- (uint64_t)backlightStudyLogger
{
  if (result) {
    return *(void *)(result + 232);
  }
  return result;
}

- (void)setBacklightStudyLogger:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

- (uint64_t)studyLogger
{
  if (result) {
    return *(void *)(result + 240);
  }
  return result;
}

- (void)setStudyLogger:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (uint64_t)liftToWakeStudyLogger
{
  if (result) {
    return *(void *)(result + 248);
  }
  return result;
}

- (void)setLiftToWakeStudyLogger:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 248), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftToWakeStudyLogger, 0);
  objc_storeStrong((id *)&self->_studyLogger, 0);
  objc_storeStrong((id *)&self->_backlightStudyLogger, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_mainDisplaySceneManager, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_activationManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideScene, 0);
  objc_storeStrong((id *)&self->_longPressCancellationTimer, 0);
  objc_storeStrong((id *)&self->_outOfPocketCondition, 0);
  objc_storeStrong((id *)&self->_longPressCondition, 0);
  objc_storeStrong((id *)&self->_shouldLaunchCameraCondition, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_deferringTokensPerPID, 0);
  objc_storeStrong((id *)&self->_foregroundPendingRemovalCameraShutterButtonPIDs, 0);
  objc_storeStrong((id *)&self->_foregroundCameraShutterButtonPIDs, 0);
  objc_storeStrong((id *)&self->_allCameraShutterButtonPIDs, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideObserver, 0);
  objc_storeStrong((id *)&self->_deferringRuleAssertion, 0);
  objc_storeStrong((id *)&self->_dispatchingRuleAssertion, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
}

- (void)initWithActivationManager:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"SBCameraHardwareButton.m";
  __int16 v16 = 1024;
  int v17 = 155;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_deferCameraPressesToPID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "_deferCameraPressesToPID: PID:%d (but this is not a change)", (uint8_t *)v2, 8u);
}

@end