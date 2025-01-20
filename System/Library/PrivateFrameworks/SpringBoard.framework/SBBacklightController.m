@interface SBBacklightController
+ (SBBacklightController)sharedInstance;
+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3;
+ (id)sharedInstanceIfExists;
- (BOOL)isDigitizerDisabled;
- (BOOL)isPendingScreenUnblankAfterCACommit;
- (BOOL)isTapToWakeEnabled;
- (BOOL)screenIsDim;
- (BOOL)screenIsOn;
- (BOOL)shouldTurnOnScreenForBacklightSource:(int64_t)a3;
- (BOOL)tapToWakeRequiresHitTestSuppression;
- (BSInvalidatable)currentDisplayStateAssertion;
- (BSInvalidatable)currentHIDUISensorModeAssertion;
- (SBBacklightController)initWithContextProvider:(id)a3;
- (SBDisplayLinkController)mainDisplayLinkController;
- (double)defaultLockScreenDimInterval;
- (double)defaultLockScreenDimIntervalWhenNotificationsPresent;
- (float)_factorToPublishForBacklightState:(int64_t)a3;
- (int64_t)backlightState;
- (int64_t)lastBacklightChangeSource;
- (void)_noteDigitizerDisabled:(BOOL)a3 tapToWakeEnabled:(BOOL)a4 disabledDigitizerMode:(int64_t)a5;
- (void)_notifyObserversDidAnimateToFactor:(float)a3 source:(int64_t)a4;
- (void)_notifyObserversDidTransitionToBacklightState:(int64_t)a3 source:(int64_t)a4;
- (void)_notifyObserversWillAnimateToFactor:(float)a3 source:(int64_t)a4;
- (void)_notifyObserversWillTransitionToBacklightState:(int64_t)a3 source:(int64_t)a4;
- (void)_performBacklightChangeRequest:(id)a3 completion:(id)a4;
- (void)_performDeferredBacklightRampWorkWithInfo:(id)a3;
- (void)_startFadeOutAnimationFromLockSource:(int)a3;
- (void)_undimFromSource:(int64_t)a3;
- (void)_updateHIDUISensorModeForBacklightState:(int64_t)a3 source:(int64_t)a4;
- (void)_userInterfaceStyleChanged;
- (void)addObserver:(id)a3;
- (void)allowIdleSleep;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5;
- (void)completeStartup;
- (void)preventIdleSleep;
- (void)preventIdleSleepForNumberOfSeconds:(float)a3;
- (void)registerInformer:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4;
- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setCurrentDisplayStateAssertion:(id)a3;
- (void)setCurrentHIDUISensorModeAssertion:(id)a3;
- (void)turnOnScreenFullyWithBacklightSource:(int64_t)a3;
- (void)unregisterInformer:(id)a3;
@end

@implementation SBBacklightController

+ (SBBacklightController)sharedInstance
{
  return (SBBacklightController *)[a1 _sharedInstanceCreateIfNeeded:1];
}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedInstanceCreateIfNeeded__onceToken_0 != -1) {
    dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken_0, &__block_literal_global_396);
  }
  v3 = (void *)_sharedInstanceCreateIfNeeded__controller;
  return v3;
}

- (BOOL)screenIsOn
{
  v2 = [(SBBacklightControllerContextProviding *)self->_contextProvider blsBacklight];
  uint64_t v3 = [v2 backlightState];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)screenIsDim
{
  v2 = [(SBBacklightControllerContextProviding *)self->_contextProvider blsBacklight];
  BOOL v3 = [v2 backlightState] != 2;

  return v3;
}

uint64_t __55__SBBacklightController__sharedInstanceCreateIfNeeded___block_invoke()
{
  kdebug_trace();
  v0 = [SBBacklightController alloc];
  v1 = objc_opt_new();
  uint64_t v2 = [(SBBacklightController *)v0 initWithContextProvider:v1];
  BOOL v3 = (void *)_sharedInstanceCreateIfNeeded__controller;
  _sharedInstanceCreateIfNeeded__controller = v2;

  return kdebug_trace();
}

+ (id)sharedInstanceIfExists
{
  return (id)[a1 _sharedInstanceCreateIfNeeded:0];
}

- (SBBacklightController)initWithContextProvider:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBBacklightController;
  v6 = [(SBBacklightController *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextProvider, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    informers = v7->_informers;
    v7->_informers = (NSHashTable *)v8;

    v10 = [(SBBacklightControllerContextProviding *)v7->_contextProvider blsBacklight];
    [v10 addObserver:v7];
    v11 = [SBDisplayLinkController alloc];
    v12 = [MEMORY[0x1E4F39B60] mainDisplay];
    uint64_t v13 = [(SBDisplayLinkController *)v11 initWithCADisplay:v12 backlight:v10];
    mainDisplayLinkController = v7->_mainDisplayLinkController;
    v7->_mainDisplayLinkController = (SBDisplayLinkController *)v13;

    v7->_lastReportedWillTransitionState = 0;
    v15 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E4F5B290]);
    brightnessSystemClient = v7->_brightnessSystemClient;
    v7->_brightnessSystemClient = v15;

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v7 selector:sel__userInterfaceStyleChanged name:*MEMORY[0x1E4F43ED0] object:0];

    [(SBBacklightController *)v7 _userInterfaceStyleChanged];
    v18 = +[SBDefaults localDefaults];
    uint64_t v19 = [v18 alwaysOnDefaults];
    alwaysOnDefaults = v7->_alwaysOnDefaults;
    v7->_alwaysOnDefaults = (SBAlwaysOnDefaults *)v19;
  }
  return v7;
}

- (void)completeStartup
{
  BOOL v3 = [(SBBacklightControllerContextProviding *)self->_contextProvider HIDUISensorModeController];
  id v4 = [v3 addStartupHIDLockAssertion];

  [(SBBacklightController *)self setCurrentHIDUISensorModeAssertion:v4];
  [(SBBacklightController *)self _updateHIDUISensorModeForBacklightState:[(SBBacklightController *)self backlightState] source:15];
}

- (void)_undimFromSource:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBBacklightController *)self screenIsOn];
  BOOL v6 = v5;
  v7 = 0;
  if (a3 != 13 && !v5)
  {
    v7 = _SBLazyMutableSetAddString(0, @"only prox can use _undimFromSource when the screen is off");
  }
  if ([(SBBacklightController *)self isPendingScreenUnblankAfterCACommit])
  {
    uint64_t v8 = _SBLazyMutableSetAddString(v7, @"we're pending a screen unblank");

    v7 = (void *)v8;
  }
  v9 = [(SBBacklightControllerContextProviding *)self->_contextProvider proximitySensorManager];
  int v10 = [v9 isObjectInProximity];

  BOOL v11 = a3 == 8 && v6;
  if (!v11 && v10)
  {
    uint64_t v12 = _SBLazyMutableSetAddString(v7, @"an object is in proximity");

    v7 = (void *)v12;
  }
  if (![(SBBacklightController *)self screenIsOn])
  {
    uint64_t v13 = [(SBBacklightControllerContextProviding *)self->_contextProvider lockScreenManager];
    int v14 = [v13 isWaitingToLockUI];

    if (v14)
    {
      uint64_t v15 = _SBLazyMutableSetAddString(v7, @"we're in the middle of locking the UI");

      v7 = (void *)v15;
    }
  }
  v16 = [(SBBacklightControllerContextProviding *)self->_contextProvider screenWakeAnimationController];
  int v17 = [v16 isSleepAnimationInProgress];

  if (v17)
  {
    uint64_t v18 = _SBLazyMutableSetAddString(v7, @"we're in the middle of sleep animation");

    v7 = (void *)v18;
  }
  uint64_t v19 = [v7 count];
  v20 = SBLogBacklight();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      objc_super v22 = SBSBacklightChangeSourceDescription(a3);
      v23 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v7];
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      __int16 v33 = 2114;
      v34 = v23;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "_undimFromSource:(%{public}@): ignoring request because %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v21)
    {
      v24 = SBSBacklightChangeSourceDescription(a3);
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "_undimFromSource:(%{public}@): setting backlight factor to 1.0", buf, 0xCu);
    }
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v26 = *MEMORY[0x1E4FA7A00];
    v27 = objc_msgSend(NSNumber, "numberWithInteger:", a3, *MEMORY[0x1E4FA7A08]);
    v30 = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [v25 postNotificationName:v26 object:v28];

    [(SBBacklightController *)self setBacklightState:1 source:a3];
  }
}

- (void)_performDeferredBacklightRampWorkWithInfo:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SBBacklightPreFadeBacklightActivationCompleteNotification" object:0];

  BOOL v5 = [v3 objectForKey:@"sendWillTurnOnNotification"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *MEMORY[0x1E4FA7A30];
    uint64_t v11 = *MEMORY[0x1E4FA7A08];
    v9 = [v3 objectForKey:@"backlightChangeSource"];
    v12[0] = v9;
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v7 postNotificationName:v8 object:0 userInfo:v10];
  }
}

- (void)turnOnScreenFullyWithBacklightSource:(int64_t)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBBacklightControllerContextProviding *)self->_contextProvider lockScreenManager];
  if (([v5 isUILocked] & 1) == 0 && !objc_msgSend(v5, "isLockScreenActive"))
  {
LABEL_8:
    [(SBBacklightController *)self setBacklightState:1 source:a3];
    goto LABEL_9;
  }
  BOOL v6 = [(SBBacklightController *)self screenIsOn];
  v7 = [(SBBacklightControllerContextProviding *)self->_contextProvider screenWakeAnimationController];
  int v8 = [v7 isWakeAnimationInProgress];

  if (!v8)
  {
    if (!v6)
    {
      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v14 = *MEMORY[0x1E4FA7A30];
      uint64_t v17 = *MEMORY[0x1E4FA7A08];
      uint64_t v15 = [NSNumber numberWithInteger:a3];
      uint64_t v18 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v13 postNotificationName:v14 object:0 userInfo:v16];
    }
    goto LABEL_8;
  }
  if (![(SBBacklightController *)self screenIsOn])
  {
    v9 = [(SBBacklightControllerContextProviding *)self->_contextProvider wakeLogger];
    [v9 wakeDidBegin:SBWakeLoggerSourceFromBacklightChangeSource()];

    [(SBBacklightController *)self setBacklightState:1 source:a3 animated:1 completion:0];
    v19[0] = @"sendWillTurnOnNotification";
    int v10 = [NSNumber numberWithBool:!v6];
    v19[1] = @"backlightChangeSource";
    v20[0] = v10;
    uint64_t v11 = [NSNumber numberWithInteger:a3];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [(SBBacklightController *)self _performDeferredBacklightRampWorkWithInfo:v12];
  }
LABEL_9:
}

- (BOOL)shouldTurnOnScreenForBacklightSource:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 <= 0x2F && ((1 << a3) & 0x80E7E01122FCLL) != 0
    || !+[SBSpuriousScreenUndimmingAssertion isAnyActive])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v5 = self->_informers;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v10, "shouldTurnOnScreenForBacklightSource:", a3, (void)v14) & 1) == 0)
          {
            uint64_t v12 = SBLogBacklight();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v19 = v10;
              _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Should not turn the screen on due to informer: %{public}@", buf, 0xCu);
            }

            goto LABEL_15;
          }
        }
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
  }
  else
  {
    SBLogBacklight();
    BOOL v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, &v5->super, OS_LOG_TYPE_DEFAULT, "Should not turn the screen on due to outstanding spurious screen undimming assertions", buf, 2u);
    }
LABEL_15:
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_updateHIDUISensorModeForBacklightState:(int64_t)a3 source:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = SBLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3) {
      v9 = @"unknown";
    }
    else {
      v9 = off_1E6B0DBD0[a3 - 1];
    }
    int v36 = 138543362;
    v37 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "_updateHIDUISensorModeForBacklightState: %{public}@", (uint8_t *)&v36, 0xCu);
  }

  int v10 = [(SBBacklightControllerContextProviding *)self->_contextProvider HIDUISensorModeController];
  BOOL v11 = [v10 sensorModeTransactionForBacklightChangeSource:a4];
  uint64_t v12 = self->_currentHIDUISensorModeAssertion;
  uint64_t v13 = self->_currentDisplayStateAssertion;
  currentDisplayStateAssertion = self->_currentDisplayStateAssertion;
  self->_currentDisplayStateAssertion = 0;

  if ((unint64_t)(a3 - 1) <= 1)
  {
    currentHIDUISensorModeAssertion = self->_currentHIDUISensorModeAssertion;
    self->_currentHIDUISensorModeAssertion = 0;

    long long v16 = [v10 assertDisplayState:2 source:a4 reason:@"backlight-on"];
    long long v17 = self->_currentDisplayStateAssertion;
    self->_currentDisplayStateAssertion = v16;

    uint64_t v18 = 0;
    BOOL v19 = 0;
LABEL_27:
    [(SBBacklightController *)self _noteDigitizerDisabled:self->_currentHIDUISensorModeAssertion != 0 tapToWakeEnabled:v19 disabledDigitizerMode:v18];
    [(BSInvalidatable *)v13 invalidate];
    [(BSInvalidatable *)v12 invalidate];
    [v11 invalidate];

    return;
  }
  v20 = [(SBBacklightControllerContextProviding *)self->_contextProvider idleTimerDefaults];
  int v21 = [v20 supportTapToWake];

  if (a4 == 13) {
    int v22 = 0;
  }
  else {
    int v22 = v21;
  }
  if (a3 == 3)
  {
    int v23 = [(SBAlwaysOnDefaults *)self->_alwaysOnDefaults enableTapToInteract];
    uint64_t v24 = 2;
    if (v23) {
      uint64_t v24 = 3;
    }
    if (v22) {
      uint64_t v18 = v24;
    }
    else {
      uint64_t v18 = 4;
    }
    [v10 suspendProximityDetection:a4 != 13 disableDigitizer:v18 source:a4 reason:@"backlight-inactive"];
    v25 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = self->_currentHIDUISensorModeAssertion;
    self->_currentHIDUISensorModeAssertion = v25;

    v27 = v10;
    uint64_t v28 = 3;
    int64_t v29 = a4;
    v30 = @"backlight-inactive";
    goto LABEL_25;
  }
  if (a3 == 4)
  {
    if (v22) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 4;
    }
    [v10 suspendProximityDetection:a4 != 13 disableDigitizer:v18 source:a4 reason:@"backlight-off"];
    v31 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v32 = self->_currentHIDUISensorModeAssertion;
    self->_currentHIDUISensorModeAssertion = v31;

    v27 = v10;
    uint64_t v28 = 1;
    int64_t v29 = a4;
    v30 = @"backlight-off";
LABEL_25:
    __int16 v33 = [v27 assertDisplayState:v28 source:v29 reason:v30];
    v34 = self->_currentDisplayStateAssertion;
    self->_currentDisplayStateAssertion = v33;

    goto LABEL_26;
  }
  if (a3)
  {
    uint64_t v18 = 0;
LABEL_26:
    BOOL v19 = (unint64_t)(v18 - 1) < 3;
    goto LABEL_27;
  }
  uint64_t v35 = [NSString stringWithFormat:@"this should be unreachable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBBacklightController _updateHIDUISensorModeForBacklightState:source:](a2, (uint64_t)self, (uint64_t)v35);
  }
  [v35 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (int64_t)backlightState
{
  uint64_t v2 = [(SBBacklightControllerContextProviding *)self->_contextProvider blsBacklight];
  unint64_t v3 = [v2 backlightState];
  if (v3 > 3) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = qword_1D8FD3500[v3];
  }

  return v4;
}

- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4
{
}

- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  BOOL v11 = (void (**)(void))a6;
  self->_lastBacklightChangeSource = a4;
  int64_t v12 = [(SBBacklightController *)self backlightState];
  if (v12 == a3)
  {
    if ((unint64_t)(a3 - 1) <= 1) {
      [(SBBacklightController *)self _updateHIDUISensorModeForBacklightState:a3 source:a4];
    }
    if (v11) {
      v11[2](v11);
    }
  }
  else
  {
    int64_t v13 = v12;
    [(SBBacklightController *)self _factorToPublishForBacklightState:v12];
    int v15 = v14;
    [(SBBacklightController *)self _factorToPublishForBacklightState:a3];
    float v17 = v16;
    self->_backlightState = a3;
    uint64_t v18 = [MEMORY[0x1E4F62438] sharedInstance];
    BOOL v19 = SBSDisplayLayoutBacklightTransitionReasonForBacklightChangeSource();
    v48 = [v18 transitionAssertionWithReason:v19];

    v49 = v18;
    [v18 setBacklightLevel:(uint64_t)(float)(v17 * 100.0)];
    v20 = SBLogBacklight();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 3) {
        int v21 = @"unknown";
      }
      else {
        int v21 = off_1E6B0DBD0[a3 - 1];
      }
      int v22 = SBSBacklightChangeSourceDescription(a4);
      *(_DWORD *)buf = 138544130;
      v60 = v21;
      __int16 v61 = 1024;
      BOOL v62 = v6;
      __int16 v63 = 2048;
      int64_t v64 = a4;
      __int16 v65 = 2114;
      v66 = v22;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Animating backlight to state %{public}@ animated:%{BOOL}u source:%ld (%{public}@)", buf, 0x26u);
    }
    *(float *)&double v23 = v17;
    [(SBBacklightController *)self _notifyObserversWillAnimateToFactor:a4 source:v23];
    [(SBBacklightController *)self _notifyObserversWillTransitionToBacklightState:a3 source:a4];
    int64_t v24 = 0;
    switch(a3)
    {
      case 0:
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2 object:self file:@"SBBacklightController.m" lineNumber:464 description:@"State transitions to SBBacklightStateUnknown are not allowed"];

        int64_t v24 = 1;
        goto LABEL_14;
      case 1:
      case 2:
        int64_t v24 = a3;
        goto LABEL_14;
      case 4:
        v41 = NSString;
        v42 = SBSBacklightChangeSourceDescription(a4);
        uint64_t v26 = [v41 stringWithFormat:@"Disable AOT for backlight state Off from source %@", v42];

        v43 = (void *)MEMORY[0x1E4F4F4C0];
        v44 = [MEMORY[0x1E4F4F508] disableAlwaysOn];
        v58 = v44;
        v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        v46 = [v43 acquireWithExplanation:v26 observer:0 attributes:v45];

        [(BLSAssertion *)self->_disableAODAssertion invalidate];
        disableAODAssertion = self->_disableAODAssertion;
        self->_disableAODAssertion = v46;

        int64_t v24 = 0;
        goto LABEL_15;
      default:
LABEL_14:
        [(BLSAssertion *)self->_disableAODAssertion invalidate];
        uint64_t v26 = self->_disableAODAssertion;
        self->_disableAODAssertion = 0;
LABEL_15:

        id v27 = objc_alloc(MEMORY[0x1E4F4F4D8]);
        uint64_t v28 = SBSBacklightChangeSourceDescription(a4);
        uint64_t v29 = mach_continuous_time();
        v30 = (void *)[v27 initWithRequestedActivityState:v24 explanation:v28 timestamp:v29 sourceEvent:BLSBacklightChangeSourceEventForSBSBacklightChangeSource(a4) sourceEventMetadata:0];

        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __70__SBBacklightController_setBacklightState_source_animated_completion___block_invoke;
        v51[3] = &unk_1E6B0DBB0;
        v51[4] = self;
        int64_t v53 = a4;
        int64_t v54 = v13;
        float v55 = v17;
        v50 = v11;
        v52 = v11;
        [(SBBacklightController *)self _performBacklightChangeRequest:v30 completion:v51];
        v31 = [MEMORY[0x1E4FA7C68] sharedInstance];
        [v31 setLastBacklightChangeSource:self->_lastBacklightChangeSource];

        v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v33 = *MEMORY[0x1E4FA7A18];
        v56[0] = *MEMORY[0x1E4FA7A08];
        v34 = [NSNumber numberWithInteger:a4];
        v57[0] = v34;
        v56[1] = *MEMORY[0x1E4FA7A28];
        LODWORD(v35) = v15;
        int v36 = [NSNumber numberWithFloat:v35];
        v57[1] = v36;
        v56[2] = *MEMORY[0x1E4FA7A20];
        *(float *)&double v37 = v17;
        uint64_t v38 = [NSNumber numberWithFloat:v37];
        v57[2] = v38;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
        [v32 postNotificationName:v33 object:0 userInfo:v39];

        if (a4 != 13)
        {
          if ((unint64_t)(a3 - 1) >= 2)
          {
            BKSDisplayBrightnessRestoreSystemBrightness();
            LODWORD(v40) = 1.0;
            [(SBBacklightController *)self preventIdleSleepForNumberOfSeconds:v40];
          }
          else
          {
            [(SBBacklightController *)self preventIdleSleep];
          }
        }
        [v48 invalidate];

        BOOL v11 = v50;
        break;
    }
  }
}

uint64_t __70__SBBacklightController_setBacklightState_source_animated_completion___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a2 - 1) >= 2)
  {
    if (([*(id *)(a1 + 32) screenIsOn] & 1) == 0)
    {
      BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v6 = *MEMORY[0x1E4FA7A10];
      uint64_t v11 = *MEMORY[0x1E4FA7A08];
      uint64_t v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      v12[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      [v5 postNotificationName:v6 object:0 userInfo:v8];

      [MEMORY[0x1E4F42FF0] _beginSuspendingMotionEffectsForReason:@"SBSuspendMotionEffectsBecauseDisplayIsOff"];
    }
  }
  else if ((unint64_t)(*(void *)(a1 + 56) - 1) >= 2)
  {
    [MEMORY[0x1E4F42FF0] _recenterMotionEffects];
    [MEMORY[0x1E4F42FF0] _endSuspendingMotionEffectsForReason:@"SBSuspendMotionEffectsBecauseDisplayIsOff"];
  }
  LODWORD(a3) = *(_DWORD *)(a1 + 64);
  [*(id *)(a1 + 32) _notifyObserversDidAnimateToFactor:*(void *)(a1 + 48) source:a3];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
  return [*(id *)(a1 + 32) _notifyObserversDidTransitionToBacklightState:a2 source:*(void *)(a1 + 48)];
}

- (void)_performBacklightChangeRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_backlightCompletion)
  {
    uint64_t v8 = SBLogBacklight();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v15 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Calling backlight change completion due to new request", v15, 2u);
    }

    uint64_t v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](self->_backlightCompletion);
    id backlightCompletion = self->_backlightCompletion;
    self->_id backlightCompletion = 0;

    v9[2](v9, self->_backlightState);
  }
  uint64_t v11 = (void *)[v7 copy];
  id v12 = self->_backlightCompletion;
  self->_id backlightCompletion = v11;

  int64_t v13 = [(SBBacklightControllerContextProviding *)self->_contextProvider blsBacklight];
  id v14 = (id)[v13 performChangeRequest:v6];
}

- (void)_startFadeOutAnimationFromLockSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(SBBacklightControllerContextProviding *)self->_contextProvider screenSleepCoordinator];
  [v4 sleepAndLockUIFromSource:v3 completion:0];
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:"))
  {
    observers = self->_observers;
    if (!observers)
    {
      BOOL v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v6 = self->_observers;
      self->_observers = v5;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v7];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:")) {
    [(NSHashTable *)self->_observers removeObject:v4];
  }
}

- (float)_factorToPublishForBacklightState:(int64_t)a3
{
  float result = -1.0;
  if ((unint64_t)(a3 - 1) <= 3) {
    return flt_1D8FD3520[a3 - 1];
  }
  return result;
}

- (void)_notifyObserversWillAnimateToFactor:(float)a3 source:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          *(float *)&double v13 = a3;
          [v12 backlightController:self willAnimateBacklightToFactor:a4 source:v13];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversDidAnimateToFactor:(float)a3 source:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          *(float *)&double v13 = a3;
          [v12 backlightController:self didAnimateBacklightToFactor:a4 source:v13];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversWillTransitionToBacklightState:(int64_t)a3 source:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_lastReportedWillTransitionState = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 backlightController:self willTransitionToBacklightState:a3 source:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_notifyObserversDidTransitionToBacklightState:(int64_t)a3 source:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_lastReportedWillTransitionState != a3) {
    [(SBBacklightController *)self _notifyObserversWillTransitionToBacklightState:a3 source:a4];
  }
  self->_lastReportedWillTransitionState = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 backlightController:self didTransitionToBacklightState:a3 source:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_noteDigitizerDisabled:(BOOL)a3 tapToWakeEnabled:(BOOL)a4 disabledDigitizerMode:(int64_t)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_digitizerDisabled = a3;
  self->_tapToWakeEnabled = a4;
  self->_tapToWakeRequiresHitTestSuppression = a5 == 2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 backlightController:self didUpdateDigitizerDisabled:v6 tapToWakeEnabled:v5];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)registerInformer:(id)a3
{
}

- (void)unregisterInformer:(id)a3
{
}

- (void)allowIdleSleep
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_allowIdleSleep object:0];
  SBWorkspaceSetPreventIdleSleepForReason(0, @"backlight");
}

- (void)preventIdleSleep
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_allowIdleSleep object:0];
  SBWorkspaceSetPreventIdleSleepForReason(1, @"backlight");
}

- (void)preventIdleSleepForNumberOfSeconds:(float)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBBacklightControllerContextProviding *)self->_contextProvider blsBacklight];
  unint64_t v6 = [v5 backlightState];

  if (v6 <= 1)
  {
    [(SBBacklightController *)self preventIdleSleep];
    v8[0] = *MEMORY[0x1E4F1C4B0];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(SBBacklightController *)self performSelector:sel_allowIdleSleep withObject:0 afterDelay:v7 inModes:a3];
  }
}

- (double)defaultLockScreenDimInterval
{
  return 6.0;
}

- (double)defaultLockScreenDimIntervalWhenNotificationsPresent
{
  return 10.0;
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = SBLogBacklight();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromBLSBacklightState();
    BOOL v9 = self->_backlightCompletion != 0;
    int v15 = 138412546;
    long long v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v9;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Backlight did complete update to state %@ with pending completion: %{BOOL}u", (uint8_t *)&v15, 0x12u);
  }
  if (self->_backlightCompletion)
  {
    uint64_t v10 = SBLogBacklight();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Calling backlight change completion due to state update", (uint8_t *)&v15, 2u);
    }

    uint64_t v11 = (void (**)(void, void))MEMORY[0x1D948C7A0](self->_backlightCompletion);
    id backlightCompletion = self->_backlightCompletion;
    self->_id backlightCompletion = 0;

    uint64_t v13 = 0;
    if ((unint64_t)a4 <= 3) {
      uint64_t v13 = qword_1D8FD3500[a4];
    }
    v11[2](v11, v13);
  }
  long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"SBBlankScreenStateChangeNotification" object:0];
}

- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = SBLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = NSStringFromBLSBacklightState();
    int v15 = 138412290;
    long long v16 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "backlight host will transition to state %@", (uint8_t *)&v15, 0xCu);
  }
  if ((unint64_t)a4 > 3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_1D8FD3500[a4];
  }
  uint64_t v11 = BLSBacklightChangeSourceEventForSBSBacklightChangeSource(self->_lastBacklightChangeSource);
  uint64_t v12 = [v7 changeRequest];

  uint64_t v13 = [v12 sourceEvent];
  if (v11 == v13) {
    int64_t lastBacklightChangeSource = self->_lastBacklightChangeSource;
  }
  else {
    int64_t lastBacklightChangeSource = 0;
  }
  [(SBBacklightController *)self _updateHIDUISensorModeForBacklightState:v10 source:lastBacklightChangeSource];
}

- (void)_userInterfaceStyleChanged
{
  uint64_t v3 = [MEMORY[0x1E4F42FE0] sharedInstance];
  uint64_t v4 = [v3 currentStyle];

  brightnessSystemClient = self->_brightnessSystemClient;
  id v6 = [NSNumber numberWithInteger:v4];
  [(BrightnessSystemClient *)brightnessSystemClient setProperty:v6 forKey:@"CBUIUserStyle"];
}

- (BOOL)isPendingScreenUnblankAfterCACommit
{
  return self->_isPendingScreenUnblankAfterCACommit;
}

- (BOOL)isDigitizerDisabled
{
  return self->_digitizerDisabled;
}

- (BOOL)isTapToWakeEnabled
{
  return self->_tapToWakeEnabled;
}

- (SBDisplayLinkController)mainDisplayLinkController
{
  return self->_mainDisplayLinkController;
}

- (int64_t)lastBacklightChangeSource
{
  return self->_lastBacklightChangeSource;
}

- (BOOL)tapToWakeRequiresHitTestSuppression
{
  return self->_tapToWakeRequiresHitTestSuppression;
}

- (BSInvalidatable)currentHIDUISensorModeAssertion
{
  return self->_currentHIDUISensorModeAssertion;
}

- (void)setCurrentHIDUISensorModeAssertion:(id)a3
{
}

- (BSInvalidatable)currentDisplayStateAssertion
{
  return self->_currentDisplayStateAssertion;
}

- (void)setCurrentDisplayStateAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDisplayStateAssertion, 0);
  objc_storeStrong((id *)&self->_currentHIDUISensorModeAssertion, 0);
  objc_storeStrong((id *)&self->_mainDisplayLinkController, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_disableAODAssertion, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong(&self->_backlightCompletion, 0);
  objc_storeStrong((id *)&self->_informers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_contextProvider, 0);
}

- (void)_updateHIDUISensorModeForBacklightState:(uint64_t)a3 source:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  BOOL v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  int v15 = @"SBBacklightController.m";
  __int16 v16 = 1024;
  int v17 = 365;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end