@interface SBCaptureHardwareButtonAppActivator
- (BOOL)_isInSwitcher;
- (BOOL)_isOverUnlockedApplication;
- (BOOL)_isVisionIntelligenceEnabled;
- (BOOL)isActivationInProgress;
- (SBCaptureHardwareButtonAppActivator)initWithSettingsSnapshot:(id)a3 windowScene:(id)a4 scanModeResource:(id)a5 activationManager:(id)a6 suppressionManager:(id)a7 setupManager:(id)a8 authenticationController:(id)a9 HUDController:(id)a10;
- (double)_timeSinceLastStationarySquelch;
- (double)_timeSinceLastViewUnobstructed;
- (double)deviceStationaryDetectionStationaryDebounceInterval;
- (id)__clickAgainCoachingText;
- (id)__consoleModeCoachingText;
- (id)_behaviorsPolicy;
- (id)_coachingStringForCoachIntent:(unint64_t)a3;
- (id)_createCaptureButtonDefaultsObserver;
- (id)_foregoundAppBundleID;
- (void)_abortVisionIntelligence;
- (void)_activateVisionIntelligenceWithCompletion:(id)a3;
- (void)_attemptCameraAppLaunchSequence;
- (void)_beginObservingConsoleMode;
- (void)_cancel;
- (void)_cancelCameraPrewarmForBundleIdentifier:(id)a3;
- (void)_cancelHintingDroplet;
- (void)_cancelLaunchAnimation;
- (void)_consoleModeDidChange;
- (void)_deferredLaunchTimeoutDidOccur;
- (void)_handleButtonUpInteraction:(id)a3;
- (void)_handleCaptureButtonInteraction:(id)a3;
- (void)_handleStationaryCallbackWithTimeSinceLastStationary:(double)a3 timeSinceLastNonStationary:(double)a4;
- (void)_initiateLaunchAnimationExpansion;
- (void)_initiateLaunchAnimationPrelude;
- (void)_invalidateDeferredLaunchTimer;
- (void)_invalidateExpansionAnimationYAndScaleComponentsLockoutTimer;
- (void)_invalidateLaunchGracePeriodTimer;
- (void)_invalidatePrewarmLockoutTimer;
- (void)_launchCaptureApp;
- (void)_launchGracePeriodTimeoutDidOccur;
- (void)_prepareConfirmedLaunchSequenceForButtonDown:(BOOL)a3;
- (void)_prewarmCameraForBundleIdentifier:(id)a3;
- (void)_prewarmLockoutTimeoutDidOccur;
- (void)_setupCaptureButtonBehaviors;
- (void)_showHintingDroplet;
- (void)_startDeferredLaunchTimerWithTimeout:(double)a3;
- (void)_startLaunchGracePeriodTimerWithTimeout:(double)a3;
- (void)_startPrewarmLockoutTimerWithTimeout:(double)a3;
- (void)_suppressionManagerDidUnsuppress:(id)a3;
- (void)_takeButtonDownPowerAssertion;
- (void)_updateCaptureButtonDefaults;
- (void)_updateStationarySquelchTimestampInContext:(id)a3 timeSinceLastStationarySquelch:(double)a4;
- (void)_updateStationaryState;
- (void)activateForGesture:(unint64_t)a3 atMachAbsoluteTime:(unint64_t)a4 pressDuration:(double)a5;
- (void)cancelActivationForGesture:(unint64_t)a3;
- (void)captureButtonSuppressionManager:(id)a3 event:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)prepareForGesture:(unint64_t)a3 forAppBundleID:(id)a4 atMachAbsoluteTime:(unint64_t)a5;
- (void)sessionDidFinalize:(id)a3;
@end

@implementation SBCaptureHardwareButtonAppActivator

- (SBCaptureHardwareButtonAppActivator)initWithSettingsSnapshot:(id)a3 windowScene:(id)a4 scanModeResource:(id)a5 activationManager:(id)a6 suppressionManager:(id)a7 setupManager:(id)a8 authenticationController:(id)a9 HUDController:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id obj = a5;
  id v18 = a5;
  id v48 = a6;
  id v19 = a6;
  id v49 = a7;
  id v20 = a7;
  id v52 = a8;
  id v51 = a9;
  id v21 = a10;
  v53.receiver = self;
  v53.super_class = (Class)SBCaptureHardwareButtonAppActivator;
  v22 = [(SBCaptureHardwareButtonAppActivator *)&v53 init];
  if (v22)
  {
    if (v16)
    {
      if (v18) {
        goto LABEL_4;
      }
    }
    else
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, v22, @"SBCaptureHardwareButtonAppActivator.m", 235, @"Invalid parameter not satisfying: %@", @"settings != nil" object file lineNumber description];

      if (v18)
      {
LABEL_4:
        if (v19) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, v22, @"SBCaptureHardwareButtonAppActivator.m", 236, @"Invalid parameter not satisfying: %@", @"scanModeResource != nil" object file lineNumber description];

    if (v19)
    {
LABEL_5:
      if (v20) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_11:
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, v22, @"SBCaptureHardwareButtonAppActivator.m", 237, @"Invalid parameter not satisfying: %@", @"activationManager != nil" object file lineNumber description];

    if (v20)
    {
LABEL_6:
      if (v17)
      {
LABEL_7:
        objc_storeStrong((id *)&v22->_windowScene, a4);
        objc_storeStrong((id *)&v22->_scanningModeAssertionProvider, obj);
        objc_storeStrong((id *)&v22->_activationManager, v48);
        objc_storeStrong((id *)&v22->_suppressionManager, v49);
        objc_storeStrong((id *)&v22->_setupManager, a8);
        objc_storeStrong((id *)&v22->_authenticationController, a9);
        v22->_valid = 1;
        v22->_preparedForCurrentActivation = 0;
        v22->_consoleModeNotifyToken = -1;
        [(SBCaptureHardwareButtonAppActivator *)v22 _beginObservingConsoleMode];
        v23 = [v17 layoutStateTransitionCoordinator];
        [v23 addObserver:v22];
        objc_storeStrong((id *)&v22->_settings, a3);
        v24 = [[SBCaptureButtonCoachingController alloc] initWithHUDController:v21];
        coachingController = v22->_coachingController;
        v22->_coachingController = v24;

        v26 = objc_alloc_init(SBDeviceStationaryMotionDetector);
        stationaryDeviceMotionDetector = v22->_stationaryDeviceMotionDetector;
        v22->_stationaryDeviceMotionDetector = v26;

        *(int64x2_t *)&v22->_timeSinceLastStationary = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        v22->_lastStationarySquelchTimestamp = 0.0;
        v28 = objc_alloc_init(SBDeviceMotionDetector);
        deviceMotionDetector = v22->_deviceMotionDetector;
        v22->_deviceMotionDetector = v28;

        +[SBDefaults localDefaults];
        v31 = id v30 = v21;
        uint64_t v32 = [v31 captureButtonDefaults];
        captureButtonDefaults = v22->_captureButtonDefaults;
        v22->_captureButtonDefaults = (SBCaptureButtonDefaults *)v32;

        id v21 = v30;
        uint64_t v34 = [(SBCaptureHardwareButtonAppActivator *)v22 _createCaptureButtonDefaultsObserver];
        captureButtonDefaultsObserver = v22->_captureButtonDefaultsObserver;
        v22->_captureButtonDefaultsObserver = (BSDefaultObserver *)v34;

        [(SBCaptureHardwareButtonAppActivator *)v22 _updateCaptureButtonDefaults];
        v22->_machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
        [v16 launchAfterButtonUpGracePeriod];
        v22->_gracePeriodForVOUnobstructionAfterRelease = v36;
        [v16 ignoreFaceDownAfterDuration];
        v22->_honorFaceDownDuration = v37;
        -[SBSystemActionControl addSystemActionValidator:]((uint64_t)v20, v22);
        v38 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
        batteryDeviceController = v22->_batteryDeviceController;
        v22->_batteryDeviceController = v38;

        [(SBCaptureHardwareButtonAppActivator *)v22 _setupCaptureButtonBehaviors];
        goto LABEL_8;
      }
LABEL_13:
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2, v22, @"SBCaptureHardwareButtonAppActivator.m", 239, @"Invalid parameter not satisfying: %@", @"windowScene != nil" object file lineNumber description];

      goto LABEL_7;
    }
LABEL_12:
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, v22, @"SBCaptureHardwareButtonAppActivator.m", 238, @"Invalid parameter not satisfying: %@", @"suppressionManager != nil" object file lineNumber description];

    if (v17) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_8:

  return v22;
}

- (void)dealloc
{
  if (self->_valid)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBCaptureHardwareButtonAppActivator.m", 282, @"Must invalidate %@ before deallocating.", self object file lineNumber description];
  }
  [(BSDefaultObserver *)self->_captureButtonDefaultsObserver invalidate];
  v5.receiver = self;
  v5.super_class = (Class)SBCaptureHardwareButtonAppActivator;
  [(SBCaptureHardwareButtonAppActivator *)&v5 dealloc];
}

- (BOOL)isActivationInProgress
{
  return self->_isWaitingForButtonUpToPerformLaunch
      || [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_prewarmLockoutTimer isScheduled]
      || [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_expansionAnimationYAndScaleComponentsLockoutTimer isScheduled]|| self->_waitingForActivationCompletion;
}

- (void)prepareForGesture:(unint64_t)a3 forAppBundleID:(id)a4 atMachAbsoluteTime:(unint64_t)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!self->_valid)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"SBCaptureHardwareButtonAppActivator.m", 298, @"Invalid parameter not satisfying: %@", @"_valid == YES" object file lineNumber description];
  }
  if (self->_launchPendedDueToButtonDownWhileSuppressed)
  {
    double v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"SBCaptureHardwareButtonAppActivator.m" lineNumber:299 description:@"Received multiple button presses down without cancel or press up"];
  }
  self->_preparedForCurrentActivation = 1;
  v9 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v58 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Preparing launching %{public}@.", buf, 0xCu);
  }
  v56 = v8;

  self->_BOOL isWaitingForButtonUpToPerformLaunch = 0;
  self->_isLongPressActivation = 0;
  objc_storeStrong((id *)&self->_bundleIDForCurrentActivation, a4);
  [(SBCaptureHardwareButtonAppActivator *)self _invalidateDeferredLaunchTimer];
  [(SBCaptureButtonCoachingController *)self->_coachingController setExtraCoachingUIButtonOffset:6.0];
  [(SBCaptureHardwareButtonAppActivator *)self _updateStationaryState];
  v10 = [(SBCaptureButtonSuppressionManager *)self->_suppressionManager lowLatencyPose];
  v11 = [SBCaptureButtonContext alloc];
  BOOL isConsoleModeActive = self->_isConsoleModeActive;
  unint64_t consoleModeActiveStreakCount = self->_consoleModeActiveStreakCount;
  id v51 = v11;
  id v52 = +[SBBacklightController sharedInstance];
  uint64_t v48 = [v52 backlightState];
  [(SBCaptureHardwareButtonAppActivator *)self _timeSinceLastViewUnobstructed];
  double v13 = v12;
  id v49 = [(SBWindowScene *)self->_windowScene lockScreenManager];
  char v47 = [v49 isUILocked];
  double timeSinceLastStationary = self->_timeSinceLastStationary;
  double timeSinceLastNonStationary = self->_timeSinceLastNonStationary;
  BSAbsoluteMachTimeNow();
  double v17 = v16;
  double lastStationarySquelchTimestamp = self->_lastStationarySquelchTimestamp;
  [v10 timeSinceLastStationary];
  double v20 = v19;
  objc_super v53 = v10;
  [v10 timeSinceLastNonStationary];
  double v22 = v21;
  BOOL v43 = [(SBCaptureButtonSuppressionManager *)self->_suppressionManager isInCameraCapturePose];
  v45 = [(SBDeviceMotionDetector *)self->_deviceMotionDetector gravity];
  v44 = [(SBDeviceMotionDetector *)self->_deviceMotionDetector rotationRate];
  v42 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v41 = [v42 orientation];
  v23 = [(SBCaptureHardwareButtonAppActivator *)self _behaviorsPolicy];
  BOOL isWaitingForButtonUpToPerformLaunch = self->_isWaitingForButtonUpToPerformLaunch;
  BOOL launchPendedDueToButtonDownWhileSuppressed = self->_launchPendedDueToButtonDownWhileSuppressed;
  int64_t v26 = [(SBCaptureButtonSuppressionManager *)self->_suppressionManager suppressionState];
  BOOL v27 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_prewarmLockoutTimer isScheduled];
  v28 = [(SBCaptureHardwareButtonAppActivator *)self _foregoundAppBundleID];
  v29 = [(SBWindowScene *)self->_windowScene ambientPresentationController];
  char v30 = [v29 isPresented];
  BOOL v31 = [(BCBatteryDeviceController *)self->_batteryDeviceController sb_isConnectedToWirelessCharger];
  if (_AXSVoiceOverTouchEnabled()) {
    BOOL v32 = _AXSVoiceOverTouchScreenCurtainEnabled() != 0;
  }
  else {
    BOOL v32 = 0;
  }
  BYTE2(v40) = v32;
  BYTE1(v40) = v31;
  LOBYTE(v40) = v30;
  LOBYTE(v39) = v27;
  BYTE1(v37) = v43;
  LOBYTE(v37) = v47;
  BYTE1(v38) = launchPendedDueToButtonDownWhileSuppressed;
  LOBYTE(v38) = isWaitingForButtonUpToPerformLaunch;
  v33 = -[SBCaptureButtonContext initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:](v51, "initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:", 1, a3, a5, isConsoleModeActive, consoleModeActiveStreakCount, v48, v13, timeSinceLastStationary, timeSinceLastNonStationary, v17 - lastStationarySquelchTimestamp, v20, v22,
          0.0,
          v37,
          v45,
          v44,
          v41,
          v23,
          v38,
          v26,
          v39,
          v56,
          v28,
          v40);

  uint64_t v34 = +[SBCaptureButtonBehaviorResolver resolveInteractionForBehaviors:self->_behaviors inContext:v33];
  [(SBCaptureHardwareButtonAppActivator *)self _handleCaptureButtonInteraction:v34];
  [(SBDeviceMotionDetector *)self->_deviceMotionDetector startWithTimeout:2.0];
}

- (void)activateForGesture:(unint64_t)a3 atMachAbsoluteTime:(unint64_t)a4 pressDuration:(double)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!self->_valid)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"SBCaptureHardwareButtonAppActivator.m", 350, @"Invalid parameter not satisfying: %@", @"_valid == YES" object file lineNumber description];
  }
  v9 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v61 = a3;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Activating for gesture %lu.", buf, 0xCu);
  }

  if (self->_preparedForCurrentActivation)
  {
    unint64_t v57 = a4;
    self->_preparedForCurrentActivation = 0;
    unint64_t v59 = a3;
    self->_isLongPressActivation = a3 == 3;
    [(SBCaptureHardwareButtonAppActivator *)self _timeSinceLastStationarySquelch];
    double v11 = v10;
    if (self->_isConsoleModeActive) {
      ++self->_consoleModeActiveStreakCount;
    }
    double v12 = [(SBCaptureButtonSuppressionManager *)self->_suppressionManager lowLatencyPose];
    double v13 = [SBCaptureButtonContext alloc];
    BOOL isConsoleModeActive = self->_isConsoleModeActive;
    objc_super v53 = v13;
    unint64_t consoleModeActiveStreakCount = self->_consoleModeActiveStreakCount;
    v56 = +[SBBacklightController sharedInstance];
    uint64_t v52 = [v56 backlightState];
    [(SBCaptureHardwareButtonAppActivator *)self _timeSinceLastViewUnobstructed];
    double v15 = v14;
    v55 = [(SBWindowScene *)self->_windowScene lockScreenManager];
    char v48 = [v55 isUILocked];
    double timeSinceLastStationary = self->_timeSinceLastStationary;
    double timeSinceLastNonStationary = self->_timeSinceLastNonStationary;
    [v12 timeSinceLastStationary];
    double v19 = v18;
    id v58 = v12;
    [v12 timeSinceLastNonStationary];
    double v21 = v20;
    BOOL v46 = [(SBCaptureButtonSuppressionManager *)self->_suppressionManager isInCameraCapturePose];
    v50 = [(SBDeviceMotionDetector *)self->_deviceMotionDetector gravity];
    id v49 = [(SBDeviceMotionDetector *)self->_deviceMotionDetector rotationRate];
    char v47 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v44 = [v47 orientation];
    v45 = [(SBCaptureHardwareButtonAppActivator *)self _behaviorsPolicy];
    BOOL isWaitingForButtonUpToPerformLaunch = self->_isWaitingForButtonUpToPerformLaunch;
    BOOL launchPendedDueToButtonDownWhileSuppressed = self->_launchPendedDueToButtonDownWhileSuppressed;
    int64_t v24 = [(SBCaptureButtonSuppressionManager *)self->_suppressionManager suppressionState];
    BOOL v25 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_prewarmLockoutTimer isScheduled];
    bundleIDForCurrentActivation = self->_bundleIDForCurrentActivation;
    BOOL v27 = [(SBCaptureHardwareButtonAppActivator *)self _foregoundAppBundleID];
    v28 = [(SBWindowScene *)self->_windowScene ambientPresentationController];
    char v29 = [v28 isPresented];
    BOOL v30 = [(BCBatteryDeviceController *)self->_batteryDeviceController sb_isConnectedToWirelessCharger];
    if (_AXSVoiceOverTouchEnabled()) {
      BOOL v31 = _AXSVoiceOverTouchScreenCurtainEnabled() != 0;
    }
    else {
      BOOL v31 = 0;
    }
    BYTE2(v43) = v31;
    BYTE1(v43) = v30;
    LOBYTE(v43) = v29;
    LOBYTE(v42) = v25;
    BYTE1(v40) = v46;
    LOBYTE(v40) = v48;
    BYTE1(v41) = launchPendedDueToButtonDownWhileSuppressed;
    LOBYTE(v41) = isWaitingForButtonUpToPerformLaunch;
    v33 = -[SBCaptureButtonContext initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:](v53, "initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:", 2, v59, v57, isConsoleModeActive, consoleModeActiveStreakCount, v52, v15, timeSinceLastStationary, timeSinceLastNonStationary, v11, v19, v21,
            a5,
            v40,
            v50,
            v49,
            v44,
            v45,
            v41,
            v24,
            v42,
            bundleIDForCurrentActivation,
            v27,
            v43);

    uint64_t v34 = +[SBCaptureButtonBehaviorResolver resolveInteractionForBehaviors:self->_behaviors inContext:v33];
    [(SBCaptureHardwareButtonAppActivator *)self _handleCaptureButtonInteraction:v34];
    self->_BOOL launchPendedDueToButtonDownWhileSuppressed = 0;
    [(BSInvalidatable *)self->_buttonDownScanningRequest invalidate];
    buttonDownScanningRequest = self->_buttonDownScanningRequest;
    self->_buttonDownScanningRequest = 0;

    [(SBCaptureHardwareButtonAppActivator *)self _cancelHintingDroplet];
    [(SBCaptureHardwareButtonAppActivator *)self _updateStationarySquelchTimestampInContext:v33 timeSinceLastStationarySquelch:v11];
    if (v59 - 1 <= 1)
    {
      double v36 = SBLogCameraCaptureStudyLogs();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = [v34 JSONString];
        *(_DWORD *)buf = 138543362;
        unint64_t v61 = (unint64_t)v37;
        _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
      [(SBCaptureHardwareButtonAppActivator *)self _handleButtonUpInteraction:v34];
    }

    BOOL v32 = v58;
  }
  else
  {
    BOOL v32 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureHardwareButtonAppActivator activateForGesture:atMachAbsoluteTime:pressDuration:](v32);
    }
  }
}

- (void)cancelActivationForGesture:(unint64_t)a3
{
  if (!self->_valid)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBCaptureHardwareButtonAppActivator.m", 414, @"Invalid parameter not satisfying: %@", @"_valid == YES" object file lineNumber description];
  }
  if (a3 - 1 >= 2)
  {
    if (a3 == 3)
    {
      self->_isLongPressActivation = 0;
      v6 = SBLogCameraCaptureLaunch();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling vision intelligence.", v9, 2u);
      }

      [(SBCaptureHardwareButtonAppActivator *)self _cancelLaunchAnimation];
    }
  }
  else
  {
    objc_super v5 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling capture application launch.", buf, 2u);
    }

    [(SBCaptureHardwareButtonAppActivator *)self _cancel];
  }
}

- (void)sessionDidFinalize:(id)a3
{
  id v4 = a3;
  [v4 logInteractionIntentions];
  [v4 logToCoreAnalytics];

  session = self->_session;
  self->_session = 0;
}

- (void)_handleButtonUpInteraction:(id)a3
{
  id v10 = a3;
  session = self->_session;
  if (session && [(SBCaptureButtonSession *)session isActive])
  {
    [(SBCaptureButtonSession *)self->_session coalesceInteraction:v10];
  }
  else
  {
    objc_super v5 = [SBCaptureButtonSession alloc];
    v6 = [(SBWindowScene *)self->_windowScene appInteractionEventSource];
    v7 = [(SBWindowScene *)self->_windowScene displayLayoutPublisher];
    id v8 = [(SBCaptureButtonSession *)v5 initWithInteraction:v10 delegate:self appInteractionEventSource:v6 displayLayoutPublisher:v7];
    v9 = self->_session;
    self->_session = v8;
  }
}

- (void)_setupCaptureButtonBehaviors
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(SBCaptureButtonLaunchBehavior);
  id v4 = objc_alloc_init(SBCaptureButtonConsoleModeBehavior);
  objc_super v5 = objc_alloc_init(SBCaptureButtonWakeBehavior);
  v6 = objc_alloc_init(SBCaptureButtonViewObstructedBehavior);
  v7 = objc_alloc_init(SBCaptureButtonDeviceStationaryBehavior);
  v12[0] = v3;
  v12[1] = v4;
  v12[2] = v5;
  v12[3] = v6;
  v12[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  SBCaptureButtonSortedBehaviorsMake(v8, v9);
  id v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  behaviors = self->_behaviors;
  self->_behaviors = v10;
}

- (id)_behaviorsPolicy
{
  v3 = [SBCaptureButtonPolicy alloc];
  BOOL v4 = !self->_disableWakeWhenDim;
  BOOL v5 = !self->_disableDirectLaunchAfterUnsuppress;
  [(SBCaptureButtonSettings *)self->_settings directLaunchAfterUnsuppressGracePeriod];
  double v7 = v6;
  BOOL v8 = !self->_disableStationaryDetection;
  BOOL v9 = [(SBCaptureButtonSettings *)self->_settings enablesStationaryDetectionForUnlocked];
  [(SBCaptureButtonSettings *)self->_settings accidentalPreventionStationaryThreshold];
  double v11 = v10;
  [(SBCaptureButtonSettings *)self->_settings accidentalPreventionPickUpBuffer];
  double v13 = v12;
  [(SBCaptureHardwareButtonAppActivator *)self deviceStationaryDetectionStationaryDebounceInterval];
  double v15 = v14;
  BOOL v16 = !self->_disablePreLaunchCaptureButtonSuppression;
  __int16 v17 = *(_WORD *)&self->_allowLaunchIfUnobstructedWhileButtonDown;
  LOBYTE(v21) = [(SBCaptureHardwareButtonAppActivator *)self _isVisionIntelligenceEnabled];
  LOWORD(v20) = v17;
  double v18 = -[SBCaptureButtonPolicy initWithConsoleModeEnabled:wakeEnabled:directLaunchAfterUnsuppressEnabled:directLaunchAfterUnsuppressGracePeriod:deviceStationaryDetectionEnabled:deviceStationaryDetectionEnabledWhenUnlocked:deviceStationaryDetectionStationaryThreshold:deviceStationaryDetectionStationaryPickUpBuffer:deviceStationaryDetectionStationaryDebounceInterval:suppressionEnabled:launchIfUnobstructedWhileButtonDownEnabled:launchIfUnobstructedPromptlyAfterButtonUpEnabled:wakingBacklightStates:visionIntelligenceEnabled:](v3, "initWithConsoleModeEnabled:wakeEnabled:directLaunchAfterUnsuppressEnabled:directLaunchAfterUnsuppressGracePeriod:deviceStationaryDetectionEnabled:deviceStationaryDetectionEnabledWhenUnlocked:deviceStationaryDetectionStationaryThreshold:deviceStationaryDetectionStationaryPickUpBuffer:deviceStationaryDetectionStationaryDebounceInterval:suppressionEnabled:launchIfUnobstructedWhileButtonDownEnabled:launchIfUnobstructedPromptlyAfterButtonUpEnabled:wakingBacklightStates:visionIntelligenceEnabled:", 1, v4, v5, v8, v9, v16, v7, v11, v13, v15, v20, &unk_1F33481B0, v21);
  return v18;
}

- (double)deviceStationaryDetectionStationaryDebounceInterval
{
  double result = 6.0;
  if (!self->_isLongPressActivation) {
    return 4.0;
  }
  return result;
}

- (id)_foregoundAppBundleID
{
  v2 = [(SBWindowScene *)self->_windowScene displayLayoutPublisher];
  v3 = [v2 currentLayout];
  BOOL v4 = [v3 elements];
  BOOL v5 = [v4 lastObject];

  double v6 = [v5 bundleIdentifier];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 identifier];
  }
  BOOL v9 = v8;

  return v9;
}

- (void)_handleCaptureButtonInteraction:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 context];
  double v6 = [v4 response];

  unint64_t v7 = [v6 prewarmIntent];
  if (v7 < 2)
  {
    double v13 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Suppressing prewarm.", buf, 2u);
    }

    if ([v5 isPrewarmLockoutActive])
    {
      double v14 = SBLogCameraCaptureSuppression();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v5 machAbsoluteTimestamp];
        *(_DWORD *)buf = 134217984;
        unint64_t v44 = v15;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Button press at timestamp %lld ignored; confirmed launch prewarm already in progress.",
          buf,
          0xCu);
      }
    }
    [(SBCaptureHardwareButtonAppActivator *)self _showHintingDroplet];
  }
  else if (v7 == 3)
  {
    BOOL v16 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Prewarming vision intelligence.", buf, 2u);
    }

    [(SBCaptureHardwareButtonAppActivator *)self _initiateLaunchAnimationPrelude];
  }
  else if (v7 == 2)
  {
    id v8 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 captureAppBundleID];
      *(_DWORD *)buf = 138543362;
      unint64_t v44 = (unint64_t)v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Prewarming capture application. %{public}@", buf, 0xCu);
    }
    double v10 = SBLogCameraCaptureSuppression();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v5 machAbsoluteTimestamp];
      double v12 = NSStringFromSBCaptureButtonSuppressionState([v5 suppressionState]);
      *(_DWORD *)buf = 134218242;
      unint64_t v44 = v11;
      __int16 v45 = 2114;
      BOOL v46 = v12;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Button press at timestamp %lld NOT suppressed; VO=%{public}@; will launch on button up.",
        buf,
        0x16u);
    }
    [(SBCaptureHardwareButtonAppActivator *)self _prepareConfirmedLaunchSequenceForButtonDown:1];
    if ([v5 gesture] == 2) {
      [(SBCaptureHardwareButtonAppActivator *)self _abortVisionIntelligence];
    }
  }
  if ((unint64_t)([v6 coachIntent] - 1) <= 1)
  {
    __int16 v17 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = SBCameraCoachIntentDescription([v6 coachIntent]);
      *(_DWORD *)buf = 138543362;
      unint64_t v44 = (unint64_t)v18;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Showing coaching UI for %{public}@", buf, 0xCu);
    }
    if (self->_bundleIDForCurrentActivation)
    {
      coachingController = self->_coachingController;
      uint64_t v20 = -[SBCaptureHardwareButtonAppActivator _coachingStringForCoachIntent:](self, "_coachingStringForCoachIntent:", [v6 coachIntent]);
      [(SBCaptureButtonSettings *)self->_settings coachingUIDismissalInterval];
      -[SBCaptureButtonCoachingController showCoachingUIWithText:dismissInterval:](coachingController, "showCoachingUIWithText:dismissInterval:", v20);
    }
  }
  switch([v6 launchIntent])
  {
    case 1:
      uint64_t v21 = SBLogCameraCaptureLaunch();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        double v22 = [v5 captureAppBundleID];
        *(_DWORD *)buf = 138543362;
        unint64_t v44 = (unint64_t)v22;
        _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Aborting launching %{public}@", buf, 0xCu);
      }
      self->_BOOL isWaitingForButtonUpToPerformLaunch = 0;
      [(SBCaptureHardwareButtonAppActivator *)self _cancel];
      break;
    case 2:
      [(SBCaptureHardwareButtonAppActivator *)self _abortVisionIntelligence];
      char v23 = [v5 cameraPrewarmed];
      int64_t v24 = SBLogCameraCaptureLaunch();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v25)
        {
          int64_t v26 = [v5 captureAppBundleID];
          *(_DWORD *)buf = 138543362;
          unint64_t v44 = (unint64_t)v26;
          _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Launching capture app (%{public}@ (prewarmed).", buf, 0xCu);
        }
        goto LABEL_42;
      }
      if (v25)
      {
        v35 = [v5 captureAppBundleID];
        *(_DWORD *)buf = 138543362;
        unint64_t v44 = (unint64_t)v35;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Launching capture app (%{public}@) (not prewarmed).", buf, 0xCu);
      }
      [(SBCaptureHardwareButtonAppActivator *)self _prepareConfirmedLaunchSequenceForButtonDown:0];
      [(SBCaptureHardwareButtonAppActivator *)self _initiateLaunchAnimationExpansion];
      goto LABEL_46;
    case 3:
      BOOL allowLaunchIfUnobstructedPromptlyAfterButtonUp = self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp;
      v28 = SBLogCameraCaptureLaunch();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      if (allowLaunchIfUnobstructedPromptlyAfterButtonUp)
      {
        if (v29)
        {
          unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
          *(_DWORD *)buf = 134217984;
          unint64_t v44 = machAbsoluteButtonPressDownTimeForDeferredLaunches;
          _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Button press up corresponding to press down at timestamp %lld; further pending launch",
            buf,
            0xCu);
        }

        [(SBCaptureHardwareButtonAppActivator *)self _startDeferredLaunchTimerWithTimeout:self->_gracePeriodForVOUnobstructionAfterRelease];
      }
      else
      {
        if (v29)
        {
          unint64_t v39 = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
          *(_DWORD *)buf = 134217984;
          unint64_t v44 = v39;
          _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "Button press up corresponding to press down at timestamp %lld without VO change; abandoning pended request; "
            "prohibiting launch",
            buf,
            0xCu);
        }

        self->_unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
      }
      break;
    case 4:
      BOOL v31 = [v5 captureAppBundleID];

      if (v31)
      {
        BOOL v32 = SBLogCameraCaptureSuppression();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = [v5 machAbsoluteTimestamp];
          uint64_t v34 = NSStringFromSBCaptureButtonSuppressionState([v5 suppressionState]);
          *(_DWORD *)buf = 134218242;
          unint64_t v44 = v33;
          __int16 v45 = 2114;
          BOOL v46 = v34;
          _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "Button press at timestamp %lld pended (VO=%{public}@); pending launch",
            buf,
            0x16u);
        }
        self->_BOOL launchPendedDueToButtonDownWhileSuppressed = 1;
        self->_unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = [v5 machAbsoluteTimestamp];
      }
      else
      {
        uint64_t v40 = SBLogCameraCaptureLaunch();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "Ignoring request to launch capture app with nil bundleID", buf, 2u);
        }
      }
      break;
    case 5:
      int64_t v24 = SBLogCameraCaptureLaunch();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Launching vision intelligence.", buf, 2u);
      }
LABEL_42:

      [(SBCaptureHardwareButtonAppActivator *)self _initiateLaunchAnimationExpansion];
      self->_BOOL isWaitingForButtonUpToPerformLaunch = 0;
      [(SBCaptureHardwareButtonAppActivator *)self _attemptCameraAppLaunchSequence];
LABEL_46:
      [(SBCaptureButtonCoachingController *)self->_coachingController dismissCoachingUI];
      break;
    default:
      break;
  }
  if ([v6 wakeIntent] == 1)
  {
    double v36 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "Button press up; waking screen.", buf, 2u);
    }

    uint64_t v37 = +[SBLockScreenManager sharedInstance];
    v41[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    v41[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
    v42[0] = MEMORY[0x1E4F1CC38];
    v42[1] = MEMORY[0x1E4F1CC38];
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
    [v37 unlockUIFromSource:40 withOptions:v38];
  }
}

- (void)_suppressionManagerDidUnsuppress:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSAbsoluteMachTimeNow();
  self->_lastUnsuppressEventTimestamp = v5;
  unint64_t v6 = [v4 suppressionState];

  if (self->_allowLaunchIfUnobstructedWhileButtonDown && self->_launchPendedDueToButtonDownWhileSuppressed)
  {
    unint64_t v7 = SBLogCameraCaptureSuppression();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSStringFromSBCaptureButtonSuppressionState(v6);
      unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
      int v16 = 138543618;
      __int16 v17 = v8;
      __int16 v18 = 2048;
      double v19 = *(double *)&machAbsoluteButtonPressDownTimeForDeferredLaunches;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch while button down for press down at timestamp %lld; allowing launch",
        (uint8_t *)&v16,
        0x16u);
    }
    self->_BOOL launchPendedDueToButtonDownWhileSuppressed = 0;
    self->_unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
    [(SBCaptureHardwareButtonAppActivator *)self _prepareConfirmedLaunchSequenceForButtonDown:1];
  }
  else if (self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp)
  {
    deferredLaunchAfterButtonUpGracePeriodTimer = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
    if (deferredLaunchAfterButtonUpGracePeriodTimer)
    {
      if ([(BSAbsoluteMachTimer *)deferredLaunchAfterButtonUpGracePeriodTimer isScheduled])
      {
        uint64_t v11 = SBLogCameraCaptureSuppression();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          double v12 = NSStringFromSBCaptureButtonSuppressionState(v6);
          double gracePeriodForVOUnobstructionAfterRelease = self->_gracePeriodForVOUnobstructionAfterRelease;
          [(BSAbsoluteMachTimer *)self->_deferredLaunchAfterButtonUpGracePeriodTimer timeRemaining];
          unint64_t v14 = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
          int v16 = 138543874;
          __int16 v17 = v12;
          __int16 v18 = 2048;
          double v19 = gracePeriodForVOUnobstructionAfterRelease - v15;
          __int16 v20 = 2048;
          unint64_t v21 = v14;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch (%.3f sec) after button released for press down at timestamp %lld; allowing launch",
            (uint8_t *)&v16,
            0x20u);
        }
        self->_unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
        [(SBCaptureHardwareButtonAppActivator *)self _prepareConfirmedLaunchSequenceForButtonDown:0];
        [(SBCaptureHardwareButtonAppActivator *)self _invalidateDeferredLaunchTimer];
      }
    }
  }
}

- (void)captureButtonSuppressionManager:(id)a3 event:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 suppressionState] == 2)
  {
    [v5 secondsAfterFaceDownAtUnsuppressionTime];
    double v7 = v6;
    double honorFaceDownDuration = self->_honorFaceDownDuration;
    BOOL v9 = SBLogCameraCaptureSuppression();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 >= honorFaceDownDuration)
    {
      if (v10)
      {
        unint64_t v14 = NSStringFromSBCaptureButtonSuppressionState(2uLL);
        unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
        double v16 = self->_honorFaceDownDuration;
        int v17 = 138544130;
        __int16 v18 = v14;
        __int16 v19 = 2048;
        unint64_t v20 = machAbsoluteButtonPressDownTimeForDeferredLaunches;
        __int16 v21 = 2048;
        double v22 = v16;
        __int16 v23 = 2048;
        double v24 = v7;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch for button press down at timestamp %lld;  face down limit of %g exceeded (%g)",
          (uint8_t *)&v17,
          0x2Au);
      }
      [(SBCaptureHardwareButtonAppActivator *)self _suppressionManagerDidUnsuppress:v5];
    }
    else
    {
      if (v10)
      {
        uint64_t v11 = NSStringFromSBCaptureButtonSuppressionState(2uLL);
        unint64_t v12 = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
        double v13 = self->_honorFaceDownDuration;
        int v17 = 138544130;
        __int16 v18 = v11;
        __int16 v19 = 2048;
        unint64_t v20 = v12;
        __int16 v21 = 2048;
        double v22 = v13;
        __int16 v23 = 2048;
        double v24 = v7;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "VO->%{public}@, deferred launch for button press down at timestamp %lld;  device is face down within %g second"
          "s (%g); prohibiting launch",
          (uint8_t *)&v17,
          0x2Au);
      }
    }
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  objc_msgSend(a4, "toLayoutState", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_unlockedEnvironmentMode = [v5 unlockedEnvironmentMode];
}

- (void)invalidate
{
  if (self->_valid)
  {
    [(BSDefaultObserver *)self->_captureButtonDefaultsObserver invalidate];
    captureButtonDefaultsObserver = self->_captureButtonDefaultsObserver;
    self->_captureButtonDefaultsObserver = 0;

    scanningModeAssertionProvider = self->_scanningModeAssertionProvider;
    self->_scanningModeAssertionProvider = 0;

    [(SBCaptureHardwareButtonAppActivator *)self _cancel];
    -[SBCaptureButtonSuppressionManager removeObserver:]((uint64_t)self->_suppressionManager, (uint64_t)self);
    id v6 = [(SBWindowScene *)self->_windowScene layoutStateTransitionCoordinator];
    [v6 removeObserver:self];
    self->_valid = 0;
    int consoleModeNotifyToken = self->_consoleModeNotifyToken;
    if ((consoleModeNotifyToken & 0x80000000) == 0)
    {
      notify_cancel(consoleModeNotifyToken);
      self->_int consoleModeNotifyToken = -1;
    }
  }
}

- (void)_invalidatePrewarmLockoutTimer
{
  [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_prewarmLockoutTimer invalidate];
  prewarmLockoutTimer = self->_prewarmLockoutTimer;
  self->_prewarmLockoutTimer = 0;
}

- (void)_startPrewarmLockoutTimerWithTimeout:(double)a3
{
  if (a3 > 0.0)
  {
    [(SBCaptureHardwareButtonAppActivator *)self _invalidatePrewarmLockoutTimer];
    id v5 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Starting Prewarm Lockout Timer.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = [SBCaptureHardwareButtonScanningPowerLinkedTimer alloc];
    scanningModeAssertionProvider = self->_scanningModeAssertionProvider;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__SBCaptureHardwareButtonAppActivator__startPrewarmLockoutTimerWithTimeout___block_invoke;
    v10[3] = &unk_1E6B073E0;
    objc_copyWeak(&v11, buf);
    id v8 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)v6 initWithIdentifier:@"appActivator.prewarmLockoutTimer" timeout:0 existingRequest:scanningModeAssertionProvider scanModeResource:v10 handler:a3];
    prewarmLockoutTimer = self->_prewarmLockoutTimer;
    self->_prewarmLockoutTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

void __76__SBCaptureHardwareButtonAppActivator__startPrewarmLockoutTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _prewarmLockoutTimeoutDidOccur];
}

- (void)_prewarmLockoutTimeoutDidOccur
{
  if (!self->_valid)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"SBCaptureHardwareButtonAppActivator.m", 710, @"Invalid parameter not satisfying: %@", @"_valid == YES" object file lineNumber description];
  }
  v3 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Prewarm Lockout Timer expired.", buf, 2u);
  }

  [(SBCaptureHardwareButtonAppActivator *)self _attemptCameraAppLaunchSequence];
  [(SBCaptureHardwareButtonAppActivator *)self _invalidatePrewarmLockoutTimer];
}

- (void)_invalidateExpansionAnimationYAndScaleComponentsLockoutTimer
{
  [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_expansionAnimationYAndScaleComponentsLockoutTimer invalidate];
  expansionAnimationYAndScaleComponentsLockoutTimer = self->_expansionAnimationYAndScaleComponentsLockoutTimer;
  self->_expansionAnimationYAndScaleComponentsLockoutTimer = 0;
}

- (void)_attemptCameraAppLaunchSequence
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL isWaitingForButtonUpToPerformLaunch = self->_isWaitingForButtonUpToPerformLaunch;
  BOOL v4 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_prewarmLockoutTimer isScheduled];
  BOOL v5 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_expansionAnimationYAndScaleComponentsLockoutTimer isScheduled];
  id v6 = SBLogCameraCaptureLaunch();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (isWaitingForButtonUpToPerformLaunch || v4 || v5)
  {
    if (v7)
    {
      v9[0] = 67109632;
      v9[1] = isWaitingForButtonUpToPerformLaunch;
      __int16 v10 = 1024;
      BOOL v11 = v4;
      __int16 v12 = 1024;
      BOOL v13 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Not performing camera app launch sequence because waitingForButtonUp:%{BOOL}u waitingForPrewarm:%{BOOL}u waitingForYAndScaleComponents:%{BOOL}u", (uint8_t *)v9, 0x14u);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Performing camera app launch sequence.", (uint8_t *)v9, 2u);
    }

    id v8 = +[SBCaptureApplicationCenter captureApplicationSettings];
    [v8 launchMonitorDurationInSeconds];
    [(SBCaptureHardwareButtonAppActivator *)self _startLaunchGracePeriodTimerWithTimeout:"_startLaunchGracePeriodTimerWithTimeout:"];

    [(SBCaptureHardwareButtonAppActivator *)self _launchCaptureApp];
  }
}

- (void)_invalidateLaunchGracePeriodTimer
{
  [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_launchGracePeriodActiveTimer invalidate];
  launchGracePeriodActiveTimer = self->_launchGracePeriodActiveTimer;
  self->_launchGracePeriodActiveTimer = 0;
}

- (void)_startLaunchGracePeriodTimerWithTimeout:(double)a3
{
  if (a3 > 0.0)
  {
    [(SBCaptureHardwareButtonAppActivator *)self _invalidateLaunchGracePeriodTimer];
    BOOL v5 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Starting Sensor Active Grace Period Timer.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = [(SBCaptureButtonScanningModeResource *)self->_scanningModeAssertionProvider requestActiveScanningModeUntilSceneAcquisition:@"appActivator.launchGracePeriodTimer"];
    BOOL v7 = [SBCaptureHardwareButtonScanningPowerLinkedTimer alloc];
    scanningModeAssertionProvider = self->_scanningModeAssertionProvider;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__SBCaptureHardwareButtonAppActivator__startLaunchGracePeriodTimerWithTimeout___block_invoke;
    v11[3] = &unk_1E6B073E0;
    objc_copyWeak(&v12, buf);
    BOOL v9 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)v7 initWithIdentifier:@"appActivator.launchGracePeriodTimer" timeout:v6 existingRequest:scanningModeAssertionProvider scanModeResource:v11 handler:a3];
    launchGracePeriodActiveTimer = self->_launchGracePeriodActiveTimer;
    self->_launchGracePeriodActiveTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

void __79__SBCaptureHardwareButtonAppActivator__startLaunchGracePeriodTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _launchGracePeriodTimeoutDidOccur];
}

- (void)_launchGracePeriodTimeoutDidOccur
{
  v3 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Launch Sensor Active Grace Period Timer expired.", v5, 2u);
  }

  [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)self->_launchGracePeriodActiveTimer invalidate];
  launchGracePeriodActiveTimer = self->_launchGracePeriodActiveTimer;
  self->_launchGracePeriodActiveTimer = 0;
}

- (void)_invalidateDeferredLaunchTimer
{
  self->_unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = 0;
  [(BSAbsoluteMachTimer *)self->_deferredLaunchAfterButtonUpGracePeriodTimer invalidate];
  deferredLaunchAfterButtonUpGracePeriodTimer = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
  self->_deferredLaunchAfterButtonUpGracePeriodTimer = 0;
}

- (void)_startDeferredLaunchTimerWithTimeout:(double)a3
{
  if (a3 > 0.0)
  {
    if (self->_deferredLaunchAfterButtonUpGracePeriodTimer)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBCaptureHardwareButtonAppActivator.m" lineNumber:778 description:@"Can't start second deferred launch timer"];
    }
    BOOL v5 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Starting Deferred Launch Grace Period Timer.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"appActivator.deferredLaunchAfterButtonUpGracePeriodTimer"];
    deferredLaunchAfterButtonUpGracePeriodTimer = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
    self->_deferredLaunchAfterButtonUpGracePeriodTimer = v6;

    id v8 = self->_deferredLaunchAfterButtonUpGracePeriodTimer;
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__SBCaptureHardwareButtonAppActivator__startDeferredLaunchTimerWithTimeout___block_invoke;
    v13[3] = &unk_1E6AF5838;
    objc_copyWeak(&v14, buf);
    [(BSAbsoluteMachTimer *)v8 scheduleWithFireInterval:v9 leewayInterval:v13 queue:a3 handler:0.0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
}

void __76__SBCaptureHardwareButtonAppActivator__startDeferredLaunchTimerWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deferredLaunchTimeoutDidOccur];
}

- (void)_deferredLaunchTimeoutDidOccur
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_deferredLaunchAfterButtonUpGracePeriodTimer)
  {
    v3 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t machAbsoluteButtonPressDownTimeForDeferredLaunches = self->_machAbsoluteButtonPressDownTimeForDeferredLaunches;
      int v5 = 134217984;
      unint64_t v6 = machAbsoluteButtonPressDownTimeForDeferredLaunches;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Deferred Launch Grace Period Timer expired for press at timestamp %lld without VO change; abandoning pended requ"
        "est; prohibiting launch",
        (uint8_t *)&v5,
        0xCu);
    }

    [(SBCaptureHardwareButtonAppActivator *)self _invalidateDeferredLaunchTimer];
  }
}

- (void)_initiateLaunchAnimationPrelude
{
  if (!self->_activeLaunchAnimationPreludeToken && _os_feature_enabled_impl())
  {
    id v5 = [(SBWindowScene *)self->_windowScene hardwareButtonBezelEffectsCoordinator];
    v3 = [v5 animateLaunchZoomUpPreludeFromButton:9];
    activeLaunchAnimationPreludeToken = self->_activeLaunchAnimationPreludeToken;
    self->_activeLaunchAnimationPreludeToken = v3;
  }
}

- (void)_initiateLaunchAnimationExpansion
{
  if (self->_activeLaunchAnimationPreludeToken && !SBReduceMotion())
  {
    if ([(SBCaptureHardwareButtonAppActivator *)self _isOverUnlockedApplication]) {
      BOOL isLongPressActivation = self->_isLongPressActivation;
    }
    else {
      BOOL isLongPressActivation = 1;
    }
    [(SBHardwareButtonLaunchPreludeAnimationToken *)self->_activeLaunchAnimationPreludeToken expandHintingDropletByAddingComponents:1 shockwave:isLongPressActivation];
    [(SBCaptureButtonSettings *)self->_settings zoomUpYAndScaleDelay];
    double v5 = v4;
    UIAnimationDragCoefficient();
    float v7 = v6;
    [(SBCaptureHardwareButtonAppActivator *)self _invalidateExpansionAnimationYAndScaleComponentsLockoutTimer];
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_activeLaunchAnimationPreludeToken);
    id v8 = [SBCaptureHardwareButtonScanningPowerLinkedTimer alloc];
    scanningModeAssertionProvider = self->_scanningModeAssertionProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__SBCaptureHardwareButtonAppActivator__initiateLaunchAnimationExpansion__block_invoke;
    v12[3] = &unk_1E6B07408;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    BOOL v15 = isLongPressActivation;
    id v10 = [(SBCaptureHardwareButtonScanningPowerLinkedTimer *)v8 initWithIdentifier:@"appActivator.expansionAnimationYAndScaleComponentsLockoutTimer" timeout:0 existingRequest:scanningModeAssertionProvider scanModeResource:v12 handler:v5 * v7];
    expansionAnimationYAndScaleComponentsLockoutTimer = self->_expansionAnimationYAndScaleComponentsLockoutTimer;
    self->_expansionAnimationYAndScaleComponentsLockoutTimer = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __72__SBCaptureHardwareButtonAppActivator__initiateLaunchAnimationExpansion__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && v2 == (id)WeakRetained[9])
  {
    [v2 expandHintingDropletByAddingComponents:6 shockwave:*(unsigned __int8 *)(a1 + 48)];
    [MEMORY[0x1E4F39CF8] flush];
    [WeakRetained _attemptCameraAppLaunchSequence];
    [WeakRetained _invalidateExpansionAnimationYAndScaleComponentsLockoutTimer];
  }
}

- (void)_cancelLaunchAnimation
{
  activeLaunchAnimationPreludeToken = self->_activeLaunchAnimationPreludeToken;
  if (activeLaunchAnimationPreludeToken)
  {
    [(SBHardwareButtonLaunchPreludeAnimationToken *)activeLaunchAnimationPreludeToken cancel];
    double v4 = self->_activeLaunchAnimationPreludeToken;
    self->_activeLaunchAnimationPreludeToken = 0;
  }
}

- (void)_prepareConfirmedLaunchSequenceForButtonDown:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBSetupManager *)self->_setupManager isInSetupMode];
  bundleIDForCurrentActivation = self->_bundleIDForCurrentActivation;
  if (v5 || !bundleIDForCurrentActivation)
  {
    self->_bundleIDForCurrentActivation = 0;

    [(SBCaptureHardwareButtonAppActivator *)self _showHintingDroplet];
  }
  else
  {
    if (v3)
    {
      self->_BOOL isWaitingForButtonUpToPerformLaunch = 1;
      [(SBCaptureHardwareButtonAppActivator *)self _takeButtonDownPowerAssertion];
    }
    else
    {
      self->_BOOL isWaitingForButtonUpToPerformLaunch = 0;
    }
    if ([(SBFUserAuthenticationController *)self->_authenticationController hasAuthenticatedAtLeastOnceSinceBoot])
    {
      [(SBCaptureHardwareButtonAppActivator *)self _initiateLaunchAnimationPrelude];
      if (![(SBCaptureHardwareButtonAppActivator *)self _isInSwitcher])
      {
        if (self->_isConsoleModeActive)
        {
          BOOL v7 = [(SBCaptureHardwareButtonAppActivator *)self _isOverUnlockedApplication];
          id v8 = SBLogCameraCaptureLaunch();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            BOOL isConsoleModeActive = self->_isConsoleModeActive;
            int v10 = 138543874;
            BOOL v11 = self;
            __int16 v12 = 1024;
            BOOL v13 = isConsoleModeActive;
            __int16 v14 = 1024;
            BOOL v15 = v7;
            _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) skipping lockout timer and camera prewarm because isConsoleModeActive:%{BOOL}u isOverUnlockedApplication:%{BOOL}u", (uint8_t *)&v10, 0x18u);
          }
        }
        else
        {
          [(SBCaptureHardwareButtonAppActivator *)self _prewarmCameraForBundleIdentifier:self->_bundleIDForCurrentActivation];
          [(SBCaptureHardwareButtonAppActivator *)self _startPrewarmLockoutTimerWithTimeout:0.125];
        }
      }
    }
    else
    {
      [(SBCaptureHardwareButtonAppActivator *)self _showHintingDroplet];
    }
    [(SBCaptureHardwareButtonAppActivator *)self _attemptCameraAppLaunchSequence];
  }
}

- (void)_cancel
{
  BOOL v3 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Canceling Camera Capture Button Activation.", v7, 2u);
  }

  [(SBCaptureHardwareButtonAppActivator *)self _invalidateDeferredLaunchTimer];
  if (self->_prewarmedBundleIdentifier)
  {
    -[SBCaptureHardwareButtonAppActivator _cancelCameraPrewarmForBundleIdentifier:](self, "_cancelCameraPrewarmForBundleIdentifier:");
    prewarmedBundleIdentifier = self->_prewarmedBundleIdentifier;
    self->_prewarmedBundleIdentifier = 0;

    bundleIDForCurrentActivation = self->_bundleIDForCurrentActivation;
    self->_bundleIDForCurrentActivation = 0;
  }
  [(SBCaptureHardwareButtonAppActivator *)self _invalidatePrewarmLockoutTimer];
  [(SBCaptureHardwareButtonAppActivator *)self _invalidateExpansionAnimationYAndScaleComponentsLockoutTimer];
  [(SBCaptureHardwareButtonAppActivator *)self _invalidateLaunchGracePeriodTimer];
  [(SBCaptureHardwareButtonAppActivator *)self _cancelLaunchAnimation];
  [(SBCaptureHardwareButtonAppActivator *)self _cancelHintingDroplet];
  [(BSInvalidatable *)self->_buttonDownScanningRequest invalidate];
  buttonDownScanningRequest = self->_buttonDownScanningRequest;
  self->_buttonDownScanningRequest = 0;

  self->_BOOL launchPendedDueToButtonDownWhileSuppressed = 0;
  self->_BOOL isWaitingForButtonUpToPerformLaunch = 0;
}

- (void)_launchCaptureApp
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v3))
  {
    bundleIDForCurrentActivation = self->_bundleIDForCurrentActivation;
    *(_DWORD *)buf = 138543362;
    v24[0] = bundleIDForCurrentActivation;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CAPTURE_LAUNCH_APP_AND_LAYOUT", "%{public,name=App}@", buf, 0xCu);
  }

  kdebug_trace();
  [(id)*MEMORY[0x1E4F43630] _performBlockAfterCATransactionCommits:&__block_literal_global_251];
  BOOL v5 = +[SBLockScreenManager sharedInstance];
  if ([v5 isUILocked]) {
    int v6 = 1;
  }
  else {
    int v6 = [v5 isLockScreenActive];
  }
  BOOL v7 = +[SBBacklightController sharedInstance];
  int v8 = [v7 screenIsDim];

  if ((v6 & v8) == 1)
  {
    uint64_t v25 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    v26[0] = MEMORY[0x1E4F1CC38];
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    [v5 unlockUIFromSource:40 withOptions:v9];
  }
  int v10 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v24[0]) = v6;
    WORD2(v24[0]) = 1024;
    *(_DWORD *)((char *)v24 + 6) = v8;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Camera Capture App Activation Requested. Was UI-locked: %{BOOL}u, Was Dimmed: %{BOOL}u", buf, 0xEu);
  }

  self->_waitingForActivationCompletion = 1;
  objc_initWeak((id *)buf, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_191;
  v21[3] = &unk_1E6AF80B8;
  objc_copyWeak(&v22, (id *)buf);
  BOOL v11 = (void *)MEMORY[0x1D948C7A0](v21);
  __int16 v12 = v11;
  if (self->_isLongPressActivation)
  {
    [(SBCaptureHardwareButtonAppActivator *)self _activateVisionIntelligenceWithCompletion:v11];
  }
  else
  {
    activationManager = self->_activationManager;
    __int16 v14 = self->_bundleIDForCurrentActivation;
    activeLaunchAnimationPreludeToken = self->_activeLaunchAnimationPreludeToken;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_193;
    v19[3] = &unk_1E6AFA3D8;
    id v20 = v11;
    -[SBCameraActivationManager activateCaptureApplicationWithBundleID:URL:fromSource:withPreludeAnimationToken:completion:]((uint64_t)activationManager, v14, 0, 0x46uLL, activeLaunchAnimationPreludeToken, v19);
  }
  uint64_t v16 = self->_activeLaunchAnimationPreludeToken;
  self->_activeLaunchAnimationPreludeToken = 0;

  int v17 = self->_bundleIDForCurrentActivation;
  self->_bundleIDForCurrentActivation = 0;

  prewarmedBundleIdentifier = self->_prewarmedBundleIdentifier;
  self->_prewarmedBundleIdentifier = 0;

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

uint64_t __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke()
{
  v0 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)id v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CAPTURE_LAUNCH_APP_AND_LAYOUT", (const char *)&unk_1D8FE2CAB, v2, 2u);
  }

  return kdebug_trace();
}

void __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_191(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v4 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Camera Capture App Activation Completed. success: %{BOOL}u", (uint8_t *)v8, 8u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 254) = 0;
    [WeakRetained[8] captureButtonAppActivatorLaunchDidComplete:a2];
    if (a2)
    {
      id v7 = v6[29];
      if ([v7 enableCameraPose]
        && (unint64_t)[v7 cameraLaunchCounter] <= 0x13)
      {
        objc_msgSend(v7, "setCameraLaunchCounter:", objc_msgSend(v7, "cameraLaunchCounter") + 1);
      }
    }
  }
}

uint64_t __56__SBCaptureHardwareButtonAppActivator__launchCaptureApp__block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_activateVisionIntelligenceWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_activeLaunchAnimationPreludeToken;
  id v6 = objc_alloc_init(MEMORY[0x1E4F9F990]);
  if (!self->_prewarmedBundleIdentifier)
  {
    id v7 = 0;
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v7 = @"com.apple.Tamale";
    goto LABEL_7;
  }
  id v7 = [v6 prewarmBundleIdentifier];
  if (v7) {
LABEL_7:
  }
    [(SBCaptureHardwareButtonAppActivator *)self _prewarmCameraForBundleIdentifier:v7];
LABEL_8:
  objc_initWeak(&location, self);
  int v8 = (void *)MEMORY[0x1E4F4F670];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__SBCaptureHardwareButtonAppActivator__activateVisionIntelligenceWithCompletion___block_invoke;
  v20[3] = &unk_1E6B07430;
  objc_copyWeak(&v24, &location);
  uint64_t v9 = v5;
  __int16 v21 = v9;
  id v10 = v4;
  id v23 = v10;
  BOOL v11 = v7;
  id v22 = v11;
  __int16 v12 = [v8 responderWithHandler:v20];
  uint64_t v13 = MEMORY[0x1E4F14428];
  id v14 = MEMORY[0x1E4F14428];
  [v12 setQueue:v13];

  BOOL v15 = [[SBAssistantVisionIntelligenceActivationRequestAction alloc] initWithInfo:0 responder:v12];
  id v16 = objc_alloc_init(MEMORY[0x1E4F9F988]);
  int v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
  [v16 setLaunchActions:v17];

  __int16 v18 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = 0;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Activating siri to handle the launch animation", (uint8_t *)&v19, 2u);
  }

  [v6 activateWithContext:v16];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __81__SBCaptureHardwareButtonAppActivator__activateVisionIntelligenceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];
  if (v4)
  {

LABEL_9:
    uint64_t v9 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __81__SBCaptureHardwareButtonAppActivator__activateVisionIntelligenceWithCompletion___block_invoke_cold_1(v3, v9);
    }

    [*(id *)(a1 + 32) cancel];
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    BOOL v5 = WeakRetained;
    if (WeakRetained && *(void *)(a1 + 40)) {
      objc_msgSend(WeakRetained, "_cancelCameraPrewarmForBundleIdentifier:");
    }
    int v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_15;
  }
  if (![v3 isAssistantVisionIntelligenceActivationRequestResponse]) {
    goto LABEL_9;
  }
  BOOL v5 = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    id v6 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Requesting the assistant controller to commandeer the droplet launch animation", v11, 2u);
    }

    id v7 = [v5[1] assistantController];
    [v7 commandeerCaptureDropletPreludeForVisionInvocation:*(void *)(a1 + 32)];
  }
  int v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_15:
  v8();
}

- (void)_takeButtonDownPowerAssertion
{
  if (!self->_buttonDownScanningRequest)
  {
    id v3 = [(SBCaptureButtonScanningModeResource *)self->_scanningModeAssertionProvider requestActiveScanningModeForReason:@"appActivator.buttonDown"];
    buttonDownScanningRequest = self->_buttonDownScanningRequest;
    self->_buttonDownScanningRequest = v3;
  }
}

- (void)_prewarmCameraForBundleIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[SBCaptureApplicationCenter sharedInstance];
  id v6 = [v5 predictedPrewarmBundleIdentifierForApplicationBundleIdentifier:v4];

  id v7 = (NSString *)[v6 copy];
  prewarmedBundleIdentifier = self->_prewarmedBundleIdentifier;
  self->_prewarmedBundleIdentifier = v7;

  if (self->_prewarmedBundleIdentifier)
  {
    uint64_t v9 = SBLogCameraCaptureLaunch();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_prewarmedBundleIdentifier;
      *(_DWORD *)buf = 138543618;
      __int16 v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
    }

    BOOL v11 = [NSNumber numberWithLongLong:mach_absolute_time()];
    __int16 v12 = [NSNumber numberWithLongLong:mach_continuous_time()];
    uint64_t v13 = *MEMORY[0x1E4F158E0];
    uint64_t v14 = *MEMORY[0x1E4F15928];
    v16[0] = *MEMORY[0x1E4F15918];
    v16[1] = v14;
    v17[0] = v13;
    v17[1] = v11;
    v16[2] = *MEMORY[0x1E4F15938];
    v17[2] = v12;
    BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    AVCapturePrewarmWithOptions();
  }
}

- (void)_cancelCameraPrewarmForBundleIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) cancelling prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
  }

  uint64_t v7 = *MEMORY[0x1E4F15918];
  uint64_t v8 = *MEMORY[0x1E4F158D8];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  MEMORY[0x1D9487C80](v4, v6);
}

- (void)_updateStationaryState
{
  *(int64x2_t *)&self->_double timeSinceLastStationary = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  if (!self->_disableStationaryDetection)
  {
    id v3 = [(SBWindowScene *)self->_windowScene lockScreenManager];
    if ([v3 isUILocked])
    {
    }
    else
    {
      BOOL v4 = [(SBCaptureButtonSettings *)self->_settings enablesStationaryDetectionForUnlocked];

      if (!v4) {
        return;
      }
    }
    objc_initWeak(&location, self);
    stationaryDeviceMotionDetector = self->_stationaryDeviceMotionDetector;
    [(SBCaptureButtonSettings *)self->_settings accidentalPreventionStationaryThreshold];
    double v7 = v6;
    [(SBCaptureButtonSettings *)self->_settings accidentalPreventionPickUpBuffer];
    double v9 = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__SBCaptureHardwareButtonAppActivator__updateStationaryState__block_invoke;
    v10[3] = &unk_1E6B07458;
    objc_copyWeak(&v11, &location);
    [(SBDeviceStationaryMotionDetector *)stationaryDeviceMotionDetector queryWithStationaryThresholdTime:v10 pickUpBufferTime:v7 callbackOnMainQueue:v9];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __61__SBCaptureHardwareButtonAppActivator__updateStationaryState__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleStationaryCallbackWithTimeSinceLastStationary:a2 timeSinceLastNonStationary:a3];
}

- (void)_handleStationaryCallbackWithTimeSinceLastStationary:(double)a3 timeSinceLastNonStationary:(double)a4
{
  self->_double timeSinceLastStationary = a3;
  self->_double timeSinceLastNonStationary = a4;
}

- (void)_beginObservingConsoleMode
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "failed to begin observing console mode. status: %{public}d", (uint8_t *)v2, 8u);
}

uint64_t __65__SBCaptureHardwareButtonAppActivator__beginObservingConsoleMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _consoleModeDidChange];
}

- (void)_consoleModeDidChange
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "failed to read console mode. status: %{public}d", (uint8_t *)v2, 8u);
}

- (id)_createCaptureButtonDefaultsObserver
{
  v18[7] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  captureButtonDefaults = self->_captureButtonDefaults;
  BOOL v4 = [NSString stringWithUTF8String:"disableStationaryDetection"];
  v18[0] = v4;
  BOOL v5 = [NSString stringWithUTF8String:"disableWakeWhenDim"];
  v18[1] = v5;
  double v6 = [NSString stringWithUTF8String:"disableDirectLaunchAfterUnsuppress"];
  v18[2] = v6;
  double v7 = [NSString stringWithUTF8String:"allowLaunchIfUnobstructionOccursWhileButtonDown"];
  v18[3] = v7;
  double v8 = [NSString stringWithUTF8String:"allowLaunchIfUnobstructionOccursPromptlyAfterButtonUp"];
  v18[4] = v8;
  double v9 = [NSString stringWithUTF8String:"enableCameraPose"];
  v18[5] = v9;
  id v10 = [NSString stringWithUTF8String:"disablePreLaunchCaptureButtonSuppression"];
  v18[6] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:7];
  id v12 = MEMORY[0x1E4F14428];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__SBCaptureHardwareButtonAppActivator__createCaptureButtonDefaultsObserver__block_invoke;
  v15[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v16, &location);
  uint64_t v13 = [(SBCaptureButtonDefaults *)captureButtonDefaults observeDefaults:v11 onQueue:MEMORY[0x1E4F14428] withBlock:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v13;
}

void __75__SBCaptureHardwareButtonAppActivator__createCaptureButtonDefaultsObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCaptureButtonDefaults];
}

- (void)_updateCaptureButtonDefaults
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self->_BOOL disableStationaryDetection = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults disableStationaryDetection];
  BOOL v4 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL disableStationaryDetection = self->_disableStationaryDetection;
    int v20 = 67109120;
    BOOL v21 = disableStationaryDetection;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "_disableStationaryDetection is %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  self->_BOOL disableWakeWhenDim = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults disableWakeWhenDim];
  double v6 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL disableWakeWhenDim = self->_disableWakeWhenDim;
    int v20 = 67109120;
    BOOL v21 = disableWakeWhenDim;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "_disableWakeWhenDim is %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  self->_BOOL disableDirectLaunchAfterUnsuppress = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults disableDirectLaunchAfterUnsuppress];
  double v8 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL disableDirectLaunchAfterUnsuppress = self->_disableDirectLaunchAfterUnsuppress;
    int v20 = 67109120;
    BOOL v21 = disableDirectLaunchAfterUnsuppress;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "_disableDirectLaunchAfterUnsuppress is %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  self->_BOOL allowLaunchIfUnobstructedWhileButtonDown = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults allowLaunchIfUnobstructionOccursWhileButtonDown];
  id v10 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL allowLaunchIfUnobstructedWhileButtonDown = self->_allowLaunchIfUnobstructedWhileButtonDown;
    int v20 = 67109120;
    BOOL v21 = allowLaunchIfUnobstructedWhileButtonDown;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "_allowLaunchIfUnobstructedWhileButtonDown is %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  BOOL v12 = ([(SBCaptureButtonDefaults *)self->_captureButtonDefaults allowLaunchIfUnobstructionOccursPromptlyAfterButtonUp] & 1) != 0|| self->_allowLaunchIfUnobstructedWhileButtonDown;
  self->_BOOL allowLaunchIfUnobstructedPromptlyAfterButtonUp = v12;
  uint64_t v13 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL allowLaunchIfUnobstructedPromptlyAfterButtonUp = self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp;
    int v20 = 67109120;
    BOOL v21 = allowLaunchIfUnobstructedPromptlyAfterButtonUp;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "_allowLaunchIfUnobstructedPromptlyAfterButtonUp is %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  if (!self->_allowLaunchIfUnobstructedWhileButtonDown && self->_allowLaunchIfUnobstructedPromptlyAfterButtonUp)
  {
    __int16 v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBCaptureHardwareButtonAppActivator.m" lineNumber:1112 description:@"Can't allow launch after button up if we don't allow launch during button down"];
  }
  self->_BOOL enableCameraPose = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults enableCameraPose];
  BOOL v15 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL enableCameraPose = self->_enableCameraPose;
    int v20 = 67109120;
    BOOL v21 = enableCameraPose;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "_enableCameraPose is %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  self->_BOOL disablePreLaunchCaptureButtonSuppression = [(SBCaptureButtonDefaults *)self->_captureButtonDefaults disablePreLaunchCaptureButtonSuppression];
  int v17 = SBLogCameraCaptureLaunch();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    BOOL disablePreLaunchCaptureButtonSuppression = self->_disablePreLaunchCaptureButtonSuppression;
    int v20 = 67109120;
    BOOL v21 = disablePreLaunchCaptureButtonSuppression;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "disablePreLaunchCaptureButtonSuppression is %{BOOL}u", (uint8_t *)&v20, 8u);
  }
}

- (id)_coachingStringForCoachIntent:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = [(SBCaptureHardwareButtonAppActivator *)self __clickAgainCoachingText];
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    uint64_t v3 = [(SBCaptureHardwareButtonAppActivator *)self __consoleModeCoachingText];
LABEL_5:
    BOOL v4 = (void *)v3;
    goto LABEL_8;
  }
  BOOL v4 = [(SBCaptureHardwareButtonAppActivator *)self __clickAgainCoachingText];
  BOOL v5 = SBLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6) {
    NSLog(&cfstr_ActivatorIsAsk.isa);
  }
LABEL_8:
  return v4;
}

- (id)__consoleModeCoachingText
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"CAPTURE_HARDWARE_BUTTON_COACHING_CONSOLE_MODE" value:&stru_1F3084718 table:@"SpringBoard_Fall_2024_iOS"];

  return v3;
}

- (id)__clickAgainCoachingText
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"CAPTURE_HARDWARE_BUTTON_COACHING_CLICK_AGAIN" value:&stru_1F3084718 table:@"SpringBoard_Fall_2024_iOS"];

  return v3;
}

- (void)_abortVisionIntelligence
{
  [(SBHardwareButtonLaunchPreludeAnimationToken *)self->_activeLaunchAnimationPreludeToken updateShockwaveLightType:2];
  if ([(SBCaptureHardwareButtonAppActivator *)self _isInSwitcher])
  {
    [(SBCaptureHardwareButtonAppActivator *)self _cancelLaunchAnimation];
  }
}

- (BOOL)_isInSwitcher
{
  return self->_unlockedEnvironmentMode == 2;
}

- (BOOL)_isOverUnlockedApplication
{
  if (self->_unlockedEnvironmentMode == 3)
  {
    id v2 = +[SBLockScreenManager sharedInstance];
    int v3 = [v2 isLockScreenActive] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (double)_timeSinceLastViewUnobstructed
{
  BSAbsoluteMachTimeNow();
  return v3 - self->_lastUnsuppressEventTimestamp;
}

- (double)_timeSinceLastStationarySquelch
{
  BSAbsoluteMachTimeNow();
  return v3 - self->_lastStationarySquelchTimestamp;
}

- (void)_updateStationarySquelchTimestampInContext:(id)a3 timeSinceLastStationarySquelch:(double)a4
{
  id v9 = a3;
  [(SBCaptureHardwareButtonAppActivator *)self deviceStationaryDetectionStationaryDebounceInterval];
  double v7 = v6;
  if (([v9 suppressionState] == 2 || !objc_msgSend(v9, "suppressionState"))
    && [v9 stationaryState] == 1
    && v7 <= a4)
  {
    BSAbsoluteMachTimeNow();
    self->_double lastStationarySquelchTimestamp = v8;
  }
}

- (void)_showHintingDroplet
{
  if (!self->_hintDropletAssertion)
  {
    id v5 = [(SBWindowScene *)self->_windowScene hardwareButtonBezelEffectsCoordinator];
    double v3 = [v5 activateHintDropletForButton:9];
    hintDropletAssertion = self->_hintDropletAssertion;
    self->_hintDropletAssertion = v3;
  }
}

- (void)_cancelHintingDroplet
{
  hintDropletAssertion = self->_hintDropletAssertion;
  if (hintDropletAssertion)
  {
    [(BSInvalidatable *)hintDropletAssertion invalidate];
    BOOL v4 = self->_hintDropletAssertion;
    self->_hintDropletAssertion = 0;
  }
}

- (BOOL)_isVisionIntelligenceEnabled
{
  id v2 = [(SBWindowScene *)self->_windowScene assistantController];
  if ([v2 isSystemAssistantExperienceEnabled]) {
    char v3 = _os_feature_enabled_impl();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_captureButtonDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_captureButtonDefaults, 0);
  objc_storeStrong((id *)&self->_coachingController, 0);
  objc_storeStrong((id *)&self->_deviceMotionDetector, 0);
  objc_storeStrong((id *)&self->_stationaryDeviceMotionDetector, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_hintDropletAssertion, 0);
  objc_storeStrong((id *)&self->_deferredLaunchAfterButtonUpGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_launchGracePeriodActiveTimer, 0);
  objc_storeStrong((id *)&self->_expansionAnimationYAndScaleComponentsLockoutTimer, 0);
  objc_storeStrong((id *)&self->_prewarmLockoutTimer, 0);
  objc_storeStrong((id *)&self->_buttonDownScanningRequest, 0);
  objc_storeStrong((id *)&self->_activeLaunchAnimationPreludeToken, 0);
  objc_storeStrong((id *)&self->_scanningModeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_prewarmedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIDForCurrentActivation, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_activationManager, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

- (void)activateForGesture:(os_log_t)log atMachAbsoluteTime:pressDuration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

void __81__SBCaptureHardwareButtonAppActivator__activateVisionIntelligenceWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = [a1 error];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to launch siri for camera capture: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end