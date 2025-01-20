@interface SBCaptureHardwareButton
+ (uint64_t)deviceSupportsCaptureButton;
+ (uint64_t)isCaptureFeatureEnabled;
+ (uint64_t)simulateCaptureButtonWithActionButton;
- (BOOL)_isVisionIntelligenceSupported;
- (BOOL)_physicalButtonTargetMatchesExpectedTargetScene;
- (BOOL)_sendCaptureIntentToEligibleForegroundScene;
- (BOOL)_shouldContinueAfterProcessingStateForClickDown;
- (BOOL)_waitingForCaptureAppActivation;
- (BOOL)handleSimulatedCaptureButtonEvent:(uint64_t)a1;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (double)_doubleClickInterval;
- (id)_sendCameraCaptureButtonDownToSceneOverride;
- (id)hardwareButtonIdentifier;
- (id)initWithActivationManager:(void *)a3 suppressionManager:(void *)a4 configurationCoordinator:(void *)a5 restrictionCoordinator:(void *)a6 mainWindowScene:(void *)a7 setupManager:(void *)a8 authenticationController:(void *)a9 HUDController:;
- (id)requestActiveScanningModeForReason:(id)a3;
- (id)requestActiveScanningModeUntilSceneAcquisition:(id)a3;
- (uint64_t)simulationButtonArbiter;
- (unint64_t)_clickGesture;
- (void)_attemptButtonActivationWithClickCountToActivate:(int64_t)a3 atTimestamp:(unint64_t)a4 forDownTimestamp:(unint64_t)a5;
- (void)_bufferPressForBundleIdentifier:(id)a3 timestamp:(unint64_t)a4;
- (void)_captureButtonGestureRecognizerAction:(id)a3;
- (void)_configureButtonProcessor;
- (void)_handleButtonDownAtTimestamp:(unint64_t)a3;
- (void)_handleButtonUpAtTimestamp:(unint64_t)a3 forDownTimestamp:(unint64_t)a4;
- (void)_handleLongPressAtTimestamp:(unint64_t)a3 forDownTimestamp:(unint64_t)a4;
- (void)_ignoreNextButtonUpForReason:(id)a3;
- (void)_invalidateBufferedPress;
- (void)_nextClickTimeoutDidFire;
- (void)_postBufferedPress;
- (void)_processZStackParticipantSettings:(id)a3;
- (void)_reevaluateButtonScanState;
- (void)_resetNextClickTimer;
- (void)_sendCaptureIntentToEligibleForegroundScene;
- (void)_stopIgnoringNextButtonUp;
- (void)cancelHardwareButtonPress;
- (void)captureButtonAppActivatorLaunchDidComplete:(BOOL)a3;
- (void)dealloc;
- (void)performActionsForButtonDown:(id)a3;
- (void)performActionsForButtonLongPress:(id)a3;
- (void)performActionsForButtonUp:(id)a3;
- (void)physicalButtonSceneOverridesDidChange:(id)a3;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)setSimulationButtonArbiter:(uint64_t)a1;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4;
- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4;
@end

@implementation SBCaptureHardwareButton

+ (uint64_t)deviceSupportsCaptureButton
{
  self;
  return MGGetBoolAnswer();
}

+ (uint64_t)isCaptureFeatureEnabled
{
  self;
  return CAMIsCameraButtonEnabled();
}

+ (uint64_t)simulateCaptureButtonWithActionButton
{
  self;
  v0 = +[SBDefaults localDefaults];
  v1 = [v0 captureButtonDefaults];
  uint64_t v2 = [v1 simulateCaptureButtonUsingActionButton];

  return v2;
}

- (id)initWithActivationManager:(void *)a3 suppressionManager:(void *)a4 configurationCoordinator:(void *)a5 restrictionCoordinator:(void *)a6 mainWindowScene:(void *)a7 setupManager:(void *)a8 authenticationController:(void *)a9 HUDController:
{
  id v17 = a2;
  id v52 = a3;
  id v54 = a4;
  id v51 = a5;
  id v55 = a6;
  id v50 = a7;
  id v49 = a8;
  id v53 = a9;
  if (!a1) {
    goto LABEL_11;
  }
  id v48 = v17;
  if (!v17)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:sel_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController_, a1, @"SBCaptureHardwareButton.m", 132, @"Invalid parameter not satisfying: %@", @"activationManager != nil" object file lineNumber description];
  }
  if (!v54)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:sel_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController_, a1, @"SBCaptureHardwareButton.m", 133, @"Invalid parameter not satisfying: %@", @"configurationCoordinator != nil" object file lineNumber description];
  }
  if (!v55)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:sel_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController_, a1, @"SBCaptureHardwareButton.m", 134, @"Invalid parameter not satisfying: %@", @"windowScene != nil" object file lineNumber description];
  }
  v61.receiver = a1;
  v61.super_class = (Class)SBCaptureHardwareButton;
  a1 = (id *)objc_msgSendSuper2(&v61, sel_init);
  if (!a1)
  {
    id v17 = v48;
LABEL_11:
    v40 = v51;
    v39 = v52;
    v38 = v49;
    v41 = v50;
    v23 = v53;
    goto LABEL_12;
  }
  v45 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v18 = [v45 physicalButtonSceneOverrideManager];
  objc_storeStrong(a1 + 9, v18);
  v44 = v18;
  uint64_t v19 = -[SBPhysicalButtonSceneOverrideManager addObserver:forReason:]((id *)v18, (uint64_t)a1, @"capture button");
  id v20 = a1[10];
  a1[10] = (id)v19;

  objc_storeStrong(a1 + 11, a2);
  objc_storeStrong(a1 + 12, a3);
  objc_storeStrong(a1 + 13, a4);
  objc_storeStrong(a1 + 8, a6);
  objc_storeStrong(a1 + 11, a2);
  objc_storeStrong(a1 + 15, a5);
  objc_storeStrong(a1 + 20, a7);
  objc_storeStrong(a1 + 21, a8);
  objc_storeStrong(a1 + 22, a9);
  [a1 _configureButtonProcessor];
  uint64_t v21 = +[SBCaptureButtonDomain rootSettings];
  id v22 = a1[17];
  a1[17] = (id)v21;

  v23 = v53;
  v24 = [[SBCaptureHardwareButtonAppActivator alloc] initWithSettingsSnapshot:a1[17] windowScene:a1[8] scanModeResource:a1 activationManager:a1[11] suppressionManager:a1[12] setupManager:a1[20] authenticationController:a1[21] HUDController:v53];
  id v25 = a1[14];
  a1[14] = v24;

  v26 = [v55 zStackResolver];
  v27 = [v26 addObserver:a1 ofParticipantWithIdentifier:30];
  [a1 _processZStackParticipantSettings:v27];
  v28 = [v55 systemGestureManager];
  [v28 addGestureRecognizer:a1[16] withType:136];
  [a1[17] addKeyObserver:a1];
  v29 = +[SBDefaults localDefaults];
  v30 = [v29 captureButtonDefaults];

  a1[27] = (id)[v30 captureButtonClickCount];
  objc_initWeak(&location, a1);
  v31 = [NSString stringWithUTF8String:"captureButtonClickCount"];
  uint64_t v32 = MEMORY[0x1E4F14428];
  id v33 = MEMORY[0x1E4F14428];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __188__SBCaptureHardwareButton_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController___block_invoke;
  v56[3] = &unk_1E6AFB8D8;
  objc_copyWeak(&v59, &location);
  a1 = a1;
  v57 = a1;
  id v34 = v30;
  id v58 = v34;
  id v35 = (id)[v34 observeDefault:v31 onQueue:v32 withBlock:v56];

  [a1 _resetNextClickTimer];
  uint64_t v36 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.camera"];
  id v37 = a1[32];
  a1[32] = (id)v36;

  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);

  id v17 = v48;
  v38 = v49;
  v40 = v51;
  v39 = v52;
  v41 = v50;
LABEL_12:

  return a1;
}

void __188__SBCaptureHardwareButton_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    *((void *)a1[4] + 27) = [a1[5] captureButtonClickCount];
    [WeakRetained _resetNextClickTimer];
    objc_msgSend(*((id *)a1[4] + 14), "cancelActivationForGesture:", objc_msgSend(a1[4], "_clickGesture"));
  }
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_physicalButtonOverrideObserver invalidate];
  physicalButtonOverrideObserver = self->_physicalButtonOverrideObserver;
  self->_physicalButtonOverrideObserver = 0;

  [(SBCaptureHardwareButtonAppActivator *)self->_appActivator invalidate];
  appActivator = self->_appActivator;
  self->_appActivator = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBCaptureHardwareButton;
  [(SBCaptureHardwareButton *)&v5 dealloc];
}

- (id)requestActiveScanningModeForReason:(id)a3
{
  id v4 = a3;
  buttonScanningActiveAssertion = self->_buttonScanningActiveAssertion;
  if (!buttonScanningActiveAssertion)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __62__SBCaptureHardwareButton_requestActiveScanningModeForReason___block_invoke;
    v16 = &unk_1E6AF92D8;
    objc_copyWeak(&v17, &location);
    v7 = [v6 assertionWithIdentifier:@"buttonScanningActiveAssertion" stateDidChangeHandler:&v13];
    v8 = self->_buttonScanningActiveAssertion;
    self->_buttonScanningActiveAssertion = v7;

    v9 = self->_buttonScanningActiveAssertion;
    v10 = SBLogCameraCaptureButtonScanMode();
    -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    buttonScanningActiveAssertion = self->_buttonScanningActiveAssertion;
  }
  v11 = [(BSCompoundAssertion *)buttonScanningActiveAssertion acquireForReason:v4];

  return v11;
}

void __62__SBCaptureHardwareButton_requestActiveScanningModeForReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reevaluateButtonScanState];
}

- (id)requestActiveScanningModeUntilSceneAcquisition:(id)a3
{
  id v5 = a3;
  launchGracePeriodButtonPowerAssertion = self->_launchGracePeriodButtonPowerAssertion;
  if (!self->_clientRequestedButtonPowerAssertion)
  {
    v8 = launchGracePeriodButtonPowerAssertion;
    v9 = [(SBCaptureHardwareButton *)self requestActiveScanningModeForReason:v5];
    v10 = self->_launchGracePeriodButtonPowerAssertion;
    self->_launchGracePeriodButtonPowerAssertion = v9;

    [(BSInvalidatable *)v8 invalidate];
    v7 = self->_launchGracePeriodButtonPowerAssertion;
    goto LABEL_5;
  }
  if (!launchGracePeriodButtonPowerAssertion)
  {
    v7 = 0;
LABEL_5:
    v11 = v7;

    return v11;
  }
  uint64_t v13 = [NSString stringWithFormat:@"can have either client assertion or launch period assertion, not both"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBCaptureHardwareButton *)a2 requestActiveScanningModeUntilSceneAcquisition:(uint64_t)v13];
  }
  [v13 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)captureButtonAppActivatorLaunchDidComplete:(BOOL)a3
{
  if (self->_bufferedPressAbsoluteTimestamp)
  {
    BOOL v3 = a3;
    id v5 = SBLogButtonsCapture();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Buffer: posting; successful launch", buf, 2u);
      }

      [(SBCaptureHardwareButton *)self _postBufferedPress];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Buffer: dropping; unsuccesful launch", v7, 2u);
      }

      [(SBCaptureHardwareButton *)self _invalidateBufferedPress];
    }
  }
}

- (BOOL)handleSimulatedCaptureButtonEvent:(uint64_t)a1
{
  if (a1)
  {
    self;
    if (CAMIsCameraButtonEnabled()) {
      [*(id *)(a1 + 272) processEvent:a2];
    }
  }
  return a1 != 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([&unk_1F33483A8 containsObject:a4])
  {
    [(SBCaptureHardwareButtonAppActivator *)self->_appActivator invalidate];
    id v5 = [[SBCaptureHardwareButtonAppActivator alloc] initWithSettingsSnapshot:self->_settings windowScene:self->_mainWindowScene scanModeResource:self activationManager:self->_activationManager suppressionManager:self->_suppressionManager setupManager:self->_setupManager authenticationController:self->_authenticationController HUDController:self->_hudController];
    appActivator = self->_appActivator;
    self->_appActivator = v5;

    [(SBCaptureHardwareButton *)self _resetNextClickTimer];
  }
}

- (void)_configureButtonProcessor
{
  if (+[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]()
    && !self->_simulationButtonArbiter)
  {
    BOOL v3 = objc_alloc_init(SBHIDButtonStateArbiter);
    simulationButtonArbiter = self->_simulationButtonArbiter;
    self->_simulationButtonArbiter = v3;

    [(SBHIDButtonStateArbiter *)self->_simulationButtonArbiter setDelegate:self];
  }
  if (!self->_captureButtonRecognizer)
  {
    id v5 = [[SBCaptureHardwareButtonFullPressRecognizer alloc] initWithTarget:self action:sel__captureButtonGestureRecognizerAction_];
    captureButtonRecognizer = self->_captureButtonRecognizer;
    self->_captureButtonRecognizer = v5;
  }
}

- (void)_processZStackParticipantSettings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 captureButtonFullFidelityEventRequestingScenes];
  if ((BSEqualArrays() & 1) == 0)
  {
    BOOL v6 = (NSArray *)[v5 copy];
    buttonEventRequestingScenes = self->_buttonEventRequestingScenes;
    self->_buttonEventRequestingScenes = v6;

    v8 = SBLogButtonsCapture();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [MEMORY[0x1E4F4F720] descriptionForRootObject:self->_buttonEventRequestingScenes];
      int v26 = 138543362;
      v27 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "captureButtonFullFidelityEventRequestingScenes %{public}@", (uint8_t *)&v26, 0xCu);
    }
    NSUInteger v10 = [(NSArray *)self->_buttonEventRequestingScenes count];
    clientRequestedButtonPowerAssertion = self->_clientRequestedButtonPowerAssertion;
    if (v10)
    {
      if (!clientRequestedButtonPowerAssertion)
      {
        v12 = [(SBCaptureHardwareButton *)self requestActiveScanningModeForReason:@"externalSceneRequest"];
        uint64_t v13 = self->_clientRequestedButtonPowerAssertion;
        self->_clientRequestedButtonPowerAssertion = v12;

        [(BSInvalidatable *)self->_launchGracePeriodButtonPowerAssertion invalidate];
        launchGracePeriodButtonPowerAssertion = self->_launchGracePeriodButtonPowerAssertion;
        self->_launchGracePeriodButtonPowerAssertion = 0;
      }
    }
    else if (clientRequestedButtonPowerAssertion)
    {
      [(BSInvalidatable *)clientRequestedButtonPowerAssertion invalidate];
      v15 = self->_clientRequestedButtonPowerAssertion;
      self->_clientRequestedButtonPowerAssertion = 0;

      [(SBCaptureHardwareButton *)self _invalidateBufferedPress];
    }
  }
  v16 = [v4 foregroundCaptureSceneTargets];
  if ((BSEqualArrays() & 1) == 0)
  {
    id v17 = (NSArray *)[v16 copy];
    foregroundCaptureSceneTargets = self->_foregroundCaptureSceneTargets;
    self->_foregroundCaptureSceneTargets = v17;

    uint64_t v19 = SBLogButtonsCapture();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [MEMORY[0x1E4F4F720] descriptionForRootObject:self->_foregroundCaptureSceneTargets];
      int v26 = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "foregroundCaptureSceneTargets %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }
  uint64_t v21 = [v4 physicalButtonSceneTargets];
  if ((BSEqualArrays() & 1) == 0)
  {
    id v22 = (NSArray *)[v21 copy];
    physicalButtonSceneTargets = self->_physicalButtonSceneTargets;
    self->_physicalButtonSceneTargets = v22;

    v24 = SBLogButtonsCapture();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [MEMORY[0x1E4F4F720] descriptionForRootObject:self->_physicalButtonSceneTargets];
      int v26 = 138543362;
      v27 = v25;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "physicalButtonSceneTargets %{public}@", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (BOOL)_physicalButtonTargetMatchesExpectedTargetScene
{
  uint64_t v2 = self;
  BOOL v3 = [(NSArray *)self->_physicalButtonSceneTargets lastObject];
  id v4 = [v3 scene];
  id v5 = [v4 clientProcess];
  BOOL v6 = [v5 bundleIdentifier];
  LOBYTE(v2) = [v6 isEqual:v2->_captureAppBundleIdentifierForBufferedPress];

  return (char)v2;
}

- (BOOL)_waitingForCaptureAppActivation
{
  BOOL v3 = [(SBCaptureHardwareButtonAppActivator *)self->_appActivator isActivationInProgress];
  if (v3) {
    LOBYTE(v3) = ![(SBCaptureHardwareButton *)self _physicalButtonTargetMatchesExpectedTargetScene];
  }
  return v3;
}

- (void)_invalidateBufferedPress
{
  if (self->_bufferedPressAbsoluteTimestamp)
  {
    captureAppBundleIdentifierForBufferedPress = self->_captureAppBundleIdentifierForBufferedPress;
    self->_bufferedPressAbsoluteTimestamp = 0;
    self->_captureAppBundleIdentifierForBufferedPress = 0;
  }
}

- (void)_bufferPressForBundleIdentifier:(id)a3 timestamp:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = SBLogButtonsCapture();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    unint64_t v11 = a4;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Buffering press(down time: %llu)", (uint8_t *)&v10, 0xCu);
  }

  v8 = (NSString *)[v6 copy];
  captureAppBundleIdentifierForBufferedPress = self->_captureAppBundleIdentifierForBufferedPress;
  self->_captureAppBundleIdentifierForBufferedPress = v8;

  self->_bufferedPressAbsoluteTimestamp = a4;
}

- (void)_postBufferedPress
{
}

- (void)_reevaluateButtonScanState
{
  int v3 = [(BSCompoundAssertion *)self->_buttonScanningActiveAssertion isActive];
  underlyingButtonPowerAssertion = self->_underlyingButtonPowerAssertion;
  if (v3)
  {
    if (underlyingButtonPowerAssertion) {
      return;
    }
    BKSHIDTouchSensitiveButtonRequestScanMode();
    id v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_underlyingButtonPowerAssertion;
    self->_underlyingButtonPowerAssertion = v5;

    v7 = SBLogCameraCaptureButtonScanMode();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v12 = 0;
    v8 = "Setting Capture Button scan state to Active";
    v9 = (uint8_t *)&v12;
    goto LABEL_8;
  }
  if (!underlyingButtonPowerAssertion) {
    return;
  }
  [(BSInvalidatable *)underlyingButtonPowerAssertion invalidate];
  int v10 = self->_underlyingButtonPowerAssertion;
  self->_underlyingButtonPowerAssertion = 0;

  v7 = SBLogCameraCaptureButtonScanMode();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = 0;
    v8 = "Setting Capture Button scan state to Idle";
    v9 = (uint8_t *)&v11;
LABEL_8:
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
  }
LABEL_9:
}

- (id)_sendCameraCaptureButtonDownToSceneOverride
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[SBPhysicalButtonSceneOverrideManager sendCameraCaptureButtonDown]((id *)&self->_physicalButtonOverrideManager->super.isa);
  if (v2)
  {
    int v3 = SBLogButtonsCapture();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 identifier];
      int v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_sendCameraCaptureButtonDownToSceneOverride to: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

- (BOOL)_sendCaptureIntentToEligibleForegroundScene
{
  int v3 = [(NSArray *)self->_foregroundCaptureSceneTargets lastObject];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 scene];
    if ([v5 isActive])
    {
      int v6 = [v4 captureApplication];
      v7 = [(SBCaptureButtonAppConfigurationCoordinator *)self->_configurationCoordinator associatedAppBundleIdentifier];
      uint64_t v8 = [v6 bundleIdentifier];
      int v9 = [v7 isEqualToString:v8];
      int v10 = SBLogButtonsCapture();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v11) {
          [(SBCaptureHardwareButton *)(uint64_t)v5 _sendCaptureIntentToEligibleForegroundScene];
        }

        int v10 = [v6 launchActions];
        [v5 sendActions:v10];
      }
      else if (v11)
      {
        [(SBCaptureHardwareButton *)(uint64_t)v8 _sendCaptureIntentToEligibleForegroundScene];
      }
    }
    else
    {
      int v6 = SBLogButtonsCapture();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(SBCaptureHardwareButton *)(uint64_t)v5 _sendCaptureIntentToEligibleForegroundScene];
      }
      LOBYTE(v9) = 0;
    }

LABEL_19:
    goto LABEL_20;
  }
  v18 = [(SBWindowScene *)self->_mainWindowScene assistantController];
  uint64_t v19 = [v18 presentationContext];
  uint64_t v20 = [v19 modality];

  if (v20 == 3)
  {
    id v5 = SBLogButtonsCapture();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "_sendCaptureIntentToEligibleForegroundScene consuming on behalf of siri", v28, 2u);
    }
    LOBYTE(v9) = 1;
    goto LABEL_19;
  }
  LOBYTE(v9) = 0;
LABEL_20:

  return v9;
}

- (void)_resetNextClickTimer
{
  [(BSAbsoluteMachTimer *)self->_nextClickDownTimer invalidate];
  nextClickDownTimer = self->_nextClickDownTimer;
  self->_nextClickDownTimer = 0;

  int64_t clickCountToActivateApp = self->_clickCountToActivateApp;
  self->_remainingClicksDownToActivateApp = clickCountToActivateApp;
  self->_remainingClicksUpToActivateApp = clickCountToActivateApp;
}

- (void)_nextClickTimeoutDidFire
{
  int v3 = SBLogButtonsCapture();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[button down] Timed out waiting for second click", v4, 2u);
  }

  [(SBCaptureHardwareButton *)self _resetNextClickTimer];
  [(SBCaptureHardwareButton *)self _ignoreNextButtonUpForReason:@"nextClickTimeout"];
}

- (double)_doubleClickInterval
{
  uint64_t v2 = [(NSUserDefaults *)self->_cameraDefaults objectForKey:@"systemOverlay.doubleClickMaxIntervalMilliseconds"];
  int v3 = [v2 intValue];

  double result = (double)v3 / 1000.0;
  if (result == 0.0) {
    return 0.4;
  }
  return result;
}

- (BOOL)_shouldContinueAfterProcessingStateForClickDown
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(BSAbsoluteMachTimer *)self->_nextClickDownTimer invalidate];
  nextClickDownTimer = self->_nextClickDownTimer;
  self->_nextClickDownTimer = 0;

  int64_t remainingClicksDownToActivateApp = self->_remainingClicksDownToActivateApp;
  int64_t v5 = remainingClicksDownToActivateApp - 1;
  self->_int64_t remainingClicksDownToActivateApp = remainingClicksDownToActivateApp - 1;
  if (remainingClicksDownToActivateApp == 1)
  {
    uint64_t v13 = SBLogButtonsCapture();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[button down] Got required clicks to activate app", buf, 2u);
    }
  }
  else
  {
    [(SBCaptureHardwareButton *)self _doubleClickInterval];
    double v7 = v6;
    uint64_t v8 = SBLogButtonsCapture();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = self->_remainingClicksDownToActivateApp;
      *(_DWORD *)buf = 134218240;
      double v17 = v7;
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[button down] Waiting for next click (for %gs) (%d clicks remaining)", buf, 0x12u);
    }

    int v10 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"Capture button next click"];
    BOOL v11 = self->_nextClickDownTimer;
    self->_nextClickDownTimer = v10;

    uint64_t v12 = self->_nextClickDownTimer;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__SBCaptureHardwareButton__shouldContinueAfterProcessingStateForClickDown__block_invoke;
    v15[3] = &unk_1E6AF7810;
    v15[4] = self;
    [(BSAbsoluteMachTimer *)v12 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v15 queue:v7 handler:0.01];
  }
  return v5 == 0;
}

uint64_t __74__SBCaptureHardwareButton__shouldContinueAfterProcessingStateForClickDown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _nextClickTimeoutDidFire];
}

- (void)_stopIgnoringNextButtonUp
{
}

- (void)_ignoreNextButtonUpForReason:(id)a3
{
  id v4 = a3;
  if (self->_buttonActiveAssertion)
  {
    ignoreButtonUpReasons = self->_ignoreButtonUpReasons;
    id v8 = v4;
    if (!ignoreButtonUpReasons)
    {
      double v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      double v7 = self->_ignoreButtonUpReasons;
      self->_ignoreButtonUpReasons = v6;

      ignoreButtonUpReasons = self->_ignoreButtonUpReasons;
    }
    [(NSMutableSet *)ignoreButtonUpReasons addObject:v8];
    id v4 = v8;
  }
}

- (void)_handleLongPressAtTimestamp:(unint64_t)a3 forDownTimestamp:(unint64_t)a4
{
  double v7 = SBLogButtonsCapture();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[long press] recognized", v9, 2u);
  }

  [(SBCaptureHardwareButton *)self _ignoreNextButtonUpForReason:@"long press"];
  [(BSAbsoluteMachTimer *)self->_longPressTimer invalidate];
  longPressTimer = self->_longPressTimer;
  self->_longPressTimer = 0;

  [(SBCaptureHardwareButton *)self _attemptButtonActivationWithClickCountToActivate:0 atTimestamp:a3 forDownTimestamp:a4];
  [(SBCaptureHardwareButton *)self _resetNextClickTimer];
}

- (void)_handleButtonDownAtTimestamp:(unint64_t)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [(SBCaptureHardwareButton *)self _invalidateBufferedPress];
  if (self->_buttonActiveAssertion)
  {
    double v6 = SBLogButtonsCapture();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureHardwareButton _handleButtonDownAtTimestamp:](v6);
    }
    goto LABEL_25;
  }
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  id v8 = [(SBCaptureHardwareButton *)self hardwareButtonIdentifier];
  int64_t v9 = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator assertButtonIsActive:v8];
  buttonActiveAssertion = self->_buttonActiveAssertion;
  self->_buttonActiveAssertion = v9;

  [(SBCaptureHardwareButton *)self _stopIgnoringNextButtonUp];
  BOOL v11 = self->_hardwareButtonCoordinator;
  uint64_t v12 = [(SBCaptureHardwareButton *)self hardwareButtonIdentifier];
  LOBYTE(v11) = [(SBHardwareButtonCoordinator *)v11 buttonShouldStart:v12];

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = SBLogButtonsCapture();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[button down] Inhibit Actions preventing further processing", buf, 2u);
    }

    [(SBCaptureHardwareButton *)self _ignoreNextButtonUpForReason:@"buttonCoordinator"];
  }
  restrictionCoordinator = self->_restrictionCoordinator;
  id v43 = 0;
  BOOL v15 = [(SBCaptureButtonRestrictionCoordinator *)restrictionCoordinator isCaptureButtonActionInhibited:&v43];
  double v6 = v43;
  if (v15)
  {
    uint64_t v16 = SBLogButtonsCapture();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v45 = (unint64_t)v6;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[button down] Ignoring button press to inhibit assertion(s): %{public}@.", buf, 0xCu);
    }

    [(SBCaptureHardwareButton *)self _ignoreNextButtonUpForReason:v6];
  }
  if ([(NSMutableSet *)self->_ignoreButtonUpReasons count])
  {
    [(SBCaptureHardwareButton *)self _resetNextClickTimer];
LABEL_25:

    return;
  }
  if ([(SBCaptureHardwareButton *)self _waitingForCaptureAppActivation])
  {
    double v17 = [(SBCaptureButtonAppConfigurationCoordinator *)self->_configurationCoordinator associatedAppBundleIdentifier];
    [(SBCaptureHardwareButton *)self _bufferPressForBundleIdentifier:v17 timestamp:a3];

    goto LABEL_25;
  }
  __int16 v18 = [(SBCaptureHardwareButton *)self _sendCameraCaptureButtonDownToSceneOverride];
  overrideButtonUpHandler = self->_overrideButtonUpHandler;
  self->_overrideButtonUpHandler = v18;

  if (self->_overrideButtonUpHandler)
  {
    uint64_t v20 = SBLogButtonsCapture();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v45 = a3;
      uint64_t v21 = "Invoking scene override Button Down Action (down time: %llu)";
LABEL_22:
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if ([(SBCaptureHardwareButton *)self _sendCaptureIntentToEligibleForegroundScene])
  {
    uint64_t v20 = SBLogButtonsCapture();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v45 = a3;
      uint64_t v21 = "Sending capture intent to foreground scene (down time: %llu)";
      goto LABEL_22;
    }
LABEL_23:

LABEL_24:
    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 postNotificationName:@"SBCaptureHardwareButtonPressNotification" object:0];

    goto LABEL_25;
  }
  BOOL v23 = [(SBCaptureHardwareButton *)self _shouldContinueAfterProcessingStateForClickDown];
  int64_t clickCountToActivateApp = self->_clickCountToActivateApp;
  int64_t remainingClicksUpToActivateApp = self->_remainingClicksUpToActivateApp;
  BOOL v26 = [(SBCaptureHardwareButton *)self _isVisionIntelligenceSupported];
  BOOL v27 = v26;
  if (v23)
  {
    appActivator = self->_appActivator;
    unint64_t v29 = [(SBCaptureHardwareButton *)self _clickGesture];
    v30 = [(SBCaptureButtonAppConfigurationCoordinator *)self->_configurationCoordinator associatedAppBundleIdentifier];
    [(SBCaptureHardwareButtonAppActivator *)appActivator prepareForGesture:v29 forAppBundleID:v30 atMachAbsoluteTime:a3];

LABEL_31:
    if (clickCountToActivateApp == remainingClicksUpToActivateApp && v27)
    {
      uint64_t v32 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"Capture button long press"];
      longPressTimer = self->_longPressTimer;
      self->_longPressTimer = v32;

      [(SBCaptureButtonSettings *)self->_settings longPressVisionIntelligenceDelay];
      double v35 = v34;
      UIAnimationDragCoefficient();
      uint64_t v36 = self->_longPressTimer;
      v42[1] = 3221225472;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[2] = __56__SBCaptureHardwareButton__handleButtonDownAtTimestamp___block_invoke;
      v42[3] = &unk_1E6B09C00;
      v42[4] = self;
      v42[5] = a3;
      [(BSAbsoluteMachTimer *)v36 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v42 queue:v35 * v37 handler:0.01];
    }
    goto LABEL_24;
  }
  if (clickCountToActivateApp != remainingClicksUpToActivateApp) {
    goto LABEL_24;
  }
  if (v26)
  {
    [(SBCaptureHardwareButtonAppActivator *)self->_appActivator prepareForGesture:3 forAppBundleID:@"com.apple.siri" atMachAbsoluteTime:a3];
    goto LABEL_31;
  }
  if (!self->_hintDropletAssertion)
  {
    v38 = [(SBWindowScene *)self->_mainWindowScene hardwareButtonBezelEffectsCoordinator];
    v39 = [v38 activateHintDropletForButton:9];
    hintDropletAssertion = self->_hintDropletAssertion;
    self->_hintDropletAssertion = v39;

    goto LABEL_24;
  }
  v41 = [NSString stringWithFormat:@"shouldn't already have a hint droplet assertion"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBCaptureHardwareButton *)a2 _handleButtonDownAtTimestamp:(uint64_t)v41];
  }
  [v41 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __56__SBCaptureHardwareButton__handleButtonDownAtTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 _handleLongPressAtTimestamp:v3 forDownTimestamp:v4];
}

- (BOOL)_isVisionIntelligenceSupported
{
  uint64_t v2 = [(SBWindowScene *)self->_mainWindowScene assistantController];
  if ([v2 isSystemAssistantExperienceEnabled] && _os_feature_enabled_impl()) {
    int v3 = MEMORY[0x1D9487C00]() ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (unint64_t)_clickGesture
{
  if (self->_clickCountToActivateApp == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_handleButtonUpAtTimestamp:(unint64_t)a3 forDownTimestamp:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(BSInvalidatable *)self->_buttonActiveAssertion invalidate];
  buttonActiveAssertion = self->_buttonActiveAssertion;
  self->_buttonActiveAssertion = 0;

  [(BSAbsoluteMachTimer *)self->_longPressTimer invalidate];
  longPressTimer = self->_longPressTimer;
  self->_longPressTimer = 0;

  [(BSInvalidatable *)self->_hintDropletAssertion invalidate];
  hintDropletAssertion = self->_hintDropletAssertion;
  self->_hintDropletAssertion = 0;

  if (self->_clickCountToActivateApp >= 2 && self->_remainingClicksUpToActivateApp >= 2) {
    [(SBCaptureHardwareButtonAppActivator *)self->_appActivator cancelActivationForGesture:3];
  }
  if ([(NSMutableSet *)self->_ignoreButtonUpReasons count])
  {
    int v10 = SBLogButtonsCapture();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [MEMORY[0x1E4F4F720] descriptionForRootObject:self->_ignoreButtonUpReasons];
      int v19 = 138412290;
      unint64_t v20 = (unint64_t)v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[button up] Ignoring button up because %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else if (self->_bufferedPressAbsoluteTimestamp)
  {
    uint64_t v12 = SBLogButtonsCapture();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[button up] bailing because buffered press.", (uint8_t *)&v19, 2u);
    }
  }
  else if (self->_overrideButtonUpHandler)
  {
    uint64_t v13 = SBLogButtonsCapture();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218240;
      unint64_t v20 = a4;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Invoking scene override Button Up Action (down time: %llu, up time: %llu)", (uint8_t *)&v19, 0x16u);
    }

    [(SBPhysicalButtonCompletionHandling *)self->_overrideButtonUpHandler completeWithResult:0];
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    self->_overrideButtonUpHandler = 0;
  }
  else
  {
    int64_t remainingClicksUpToActivateApp = self->_remainingClicksUpToActivateApp;
    self->_int64_t remainingClicksUpToActivateApp = remainingClicksUpToActivateApp - 1;
    uint64_t v16 = SBLogButtonsCapture();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (remainingClicksUpToActivateApp < 2)
    {
      if (v17)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[button up] Got required clicks to activate app", (uint8_t *)&v19, 2u);
      }

      [(SBCaptureHardwareButton *)self _resetNextClickTimer];
      [(SBCaptureHardwareButton *)self _attemptButtonActivationWithClickCountToActivate:self->_clickCountToActivateApp atTimestamp:a3 forDownTimestamp:a4];
    }
    else
    {
      if (v17)
      {
        int64_t v18 = self->_remainingClicksUpToActivateApp;
        int v19 = 67109120;
        LODWORD(v20) = v18;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[button up] Waiting for next click (%d remaining)", (uint8_t *)&v19, 8u);
      }
    }
  }
}

- (void)_attemptButtonActivationWithClickCountToActivate:(int64_t)a3 atTimestamp:(unint64_t)a4 forDownTimestamp:(unint64_t)a5
{
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  int64_t v9 = [(SBCaptureHardwareButton *)self hardwareButtonIdentifier];
  LODWORD(hardwareButtonCoordinator) = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator buttonShouldStart:v9];

  if (hardwareButtonCoordinator)
  {
    BSTimeDifferenceFromMachTimeToMachTime();
    if ((unint64_t)a3 > 2) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_1D8FD2C58[a3];
    }
    appActivator = self->_appActivator;
    -[SBCaptureHardwareButtonAppActivator activateForGesture:atMachAbsoluteTime:pressDuration:](appActivator, "activateForGesture:atMachAbsoluteTime:pressDuration:", v10, a4);
  }
  else
  {
    BOOL v11 = self->_appActivator;
    unint64_t v12 = [(SBCaptureHardwareButton *)self _clickGesture];
    [(SBCaptureHardwareButtonAppActivator *)v11 cancelActivationForGesture:v12];
  }
}

- (void)_captureButtonGestureRecognizerAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  switch(v5)
  {
    case 4:
      uint64_t v8 = [v4 pressDownTimestamp];
      int64_t v9 = SBLogButtonsCapture();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        uint64_t v14 = v8;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Capture Button Press Cancel (down time: %llu)", (uint8_t *)&v13, 0xCu);
      }

      [(SBCaptureHardwareButton *)self cancelHardwareButtonPress];
      break;
    case 3:
      uint64_t v10 = [v4 pressUpTimestamp];
      uint64_t v11 = [v4 pressDownTimestamp];
      unint64_t v12 = SBLogButtonsCapture();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134218240;
        uint64_t v14 = v11;
        __int16 v15 = 2048;
        uint64_t v16 = v10;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Capture Button Up (down time: %llu, up time: %llu)", (uint8_t *)&v13, 0x16u);
      }

      [(SBCaptureHardwareButton *)self _handleButtonUpAtTimestamp:v10 forDownTimestamp:v11];
      break;
    case 1:
      uint64_t v6 = [v4 pressDownTimestamp];
      double v7 = SBLogButtonsCapture();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Capture Button Down (down time: %llu)", (uint8_t *)&v13, 0xCu);
      }

      [(SBCaptureHardwareButton *)self _handleButtonDownAtTimestamp:v6];
      break;
  }
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
}

- (void)physicalButtonSceneOverridesDidChange:(id)a3
{
  id v4 = a3;
  if (self->_bufferedPressAbsoluteTimestamp)
  {
    BOOL v5 = [(SBCaptureHardwareButton *)self _physicalButtonTargetMatchesExpectedTargetScene];
    uint64_t v6 = SBLogButtonsCapture();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Buffer: Posting early!", buf, 2u);
      }

      [(SBCaptureHardwareButton *)self _postBufferedPress];
    }
    else
    {
      if (v7)
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Buffer: Not posting yet", v8, 2u);
      }
    }
  }
}

- (void)performActionsForButtonLongPress:(id)a3
{
  int v3 = SBLogButtonsCapture();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Simulated Capture Button Long Press (should be disabled?)", v4, 2u);
  }
}

- (void)performActionsForButtonDown:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogButtonsCapture();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v4 downTime];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Simulated Capture Button Down (down time: %llu)", (uint8_t *)&v6, 0xCu);
  }

  -[SBCaptureHardwareButton _handleButtonDownAtTimestamp:](self, "_handleButtonDownAtTimestamp:", [v4 downTime]);
}

- (void)performActionsForButtonUp:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  int v6 = SBLogButtonsCapture();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    uint64_t v8 = [v4 downTime];
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Simulated Capture Button Up (down time: %llu, up time: %llu)", (uint8_t *)&v7, 0x16u);
  }

  -[SBCaptureHardwareButton _handleButtonUpAtTimestamp:forDownTimestamp:](self, "_handleButtonUpAtTimestamp:forDownTimestamp:", v5, [v4 downTime]);
}

- (void)cancelHardwareButtonPress
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  buttonActiveAssertion = self->_buttonActiveAssertion;
  if (buttonActiveAssertion)
  {
    [(BSInvalidatable *)buttonActiveAssertion invalidate];
    id v4 = self->_buttonActiveAssertion;
    self->_buttonActiveAssertion = 0;
  }
  else
  {
    [(SBCaptureHardwareButton *)self _ignoreNextButtonUpForReason:@"coordinatorCancel"];
  }
  [(BSAbsoluteMachTimer *)self->_longPressTimer invalidate];
  longPressTimer = self->_longPressTimer;
  self->_longPressTimer = 0;

  [(BSInvalidatable *)self->_hintDropletAssertion invalidate];
  hintDropletAssertion = self->_hintDropletAssertion;
  self->_hintDropletAssertion = 0;

  [(SBCaptureHardwareButton *)self _resetNextClickTimer];
  if (self->_overrideButtonUpHandler)
  {
    unint64_t v7 = [(SBCaptureHardwareButtonFullPressRecognizer *)self->_captureButtonRecognizer pressUpTimestamp];
    unint64_t v8 = [(SBCaptureHardwareButtonFullPressRecognizer *)self->_captureButtonRecognizer pressDownTimestamp];
    __int16 v9 = SBLogButtonsCapture();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      unint64_t v14 = v8;
      __int16 v15 = 2048;
      unint64_t v16 = v7;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Invoking scene override Button Up Action due to press cancellation (down time: %llu, up time: %llu)", (uint8_t *)&v13, 0x16u);
    }

    [(SBPhysicalButtonCompletionHandling *)self->_overrideButtonUpHandler completeWithResult:1];
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    self->_overrideButtonUpHandler = 0;
  }
  else
  {
    appActivator = self->_appActivator;
    unint64_t v12 = [(SBCaptureHardwareButton *)self _clickGesture];
    [(SBCaptureHardwareButtonAppActivator *)appActivator cancelActivationForGesture:v12];
  }
}

- (id)hardwareButtonIdentifier
{
  return @"Capture";
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (uint64_t)simulationButtonArbiter
{
  if (result) {
    return *(void *)(result + 272);
  }
  return result;
}

- (void)setSimulationButtonArbiter:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 272), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulationButtonArbiter, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_cameraDefaults, 0);
  objc_storeStrong((id *)&self->_ignoreButtonUpReasons, 0);
  objc_storeStrong((id *)&self->_hintDropletAssertion, 0);
  objc_storeStrong((id *)&self->_nextClickDownTimer, 0);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
  objc_storeStrong((id *)&self->_captureAppBundleIdentifierForBufferedPress, 0);
  objc_storeStrong((id *)&self->_hudController, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_overrideButtonUpHandler, 0);
  objc_storeStrong((id *)&self->_buttonActiveAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_captureButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_restrictionCoordinator, 0);
  objc_storeStrong((id *)&self->_appActivator, 0);
  objc_storeStrong((id *)&self->_configurationCoordinator, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_activationManager, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideObserver, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideManager, 0);
  objc_storeStrong((id *)&self->_mainWindowScene, 0);
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_buttonEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_launchGracePeriodButtonPowerAssertion, 0);
  objc_storeStrong((id *)&self->_clientRequestedButtonPowerAssertion, 0);
  objc_storeStrong((id *)&self->_underlyingButtonPowerAssertion, 0);
  objc_storeStrong((id *)&self->_buttonScanningActiveAssertion, 0);
}

- (void)requestActiveScanningModeUntilSceneAcquisition:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  __int16 v9 = @"SBCaptureHardwareButton.m";
  __int16 v10 = 1024;
  int v11 = 211;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_sendCaptureIntentToEligibleForegroundScene
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)_handleButtonDownAtTimestamp:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  __int16 v9 = @"SBCaptureHardwareButton.m";
  __int16 v10 = 1024;
  int v11 = 562;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_handleButtonDownAtTimestamp:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[button down] Button already down, ignoring subsequent button down", v1, 2u);
}

@end