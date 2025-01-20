@interface SBHomeHardwareButtonActions
- (BOOL)_performButtonPreflightActions;
- (BOOL)_shouldIgnorePressesDueToProxOrIdle:(id *)a3;
- (BOOL)isButtonDown;
- (double)currentLongPressDuration;
- (id)hardwareButtonGestureParameters;
- (id)initWitHomeButtonType:(int64_t)a3;
- (void)_logMenuButtonHoldTime;
- (void)configureForwardingToLockButtonActions:(id)a3;
- (void)performAfterMenuButtonUpIsHandledUsingBlock:(id)a3;
- (void)performDoublePressDownActions;
- (void)performDoubleTapUpActions;
- (void)performFinalButtonUpActions;
- (void)performInitialButtonDownActions;
- (void)performLongPressActions;
- (void)performLongPressCancelledActions;
- (void)performSinglePressUpActions;
- (void)performSinglePressUpActionsWithSourceType:(unint64_t)a3;
- (void)performTriplePressUpActions;
- (void)performWhenMenuButtonIsUpUsingBlock:(id)a3;
- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4;
- (void)setButtonDown:(BOOL)a3;
- (void)setCurrentLongPressDuration:(double)a3;
@end

@implementation SBHomeHardwareButtonActions

- (id)initWitHomeButtonType:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SBHomeHardwareButtonActions;
  v4 = [(SBHomeHardwareButtonActions *)&v22 init];
  if (v4)
  {
    uint64_t v5 = +[SBHardwareButtonService sharedInstance];
    hardwareButtonService = v4->_hardwareButtonService;
    v4->_hardwareButtonService = (SBHardwareButtonService *)v5;

    uint64_t v7 = [(id)SBApp proximitySensorManager];
    proximitySensorManager = v4->_proximitySensorManager;
    v4->_proximitySensorManager = (SBProximitySensorManager *)v7;

    v4->_homeButtonType = a3;
    if (a3 != 2)
    {
      uint64_t v9 = +[SBSiriHardwareButtonInteraction hardwareButtonInteractionForHomeButton];
      siriButtonInteraction = v4->_siriButtonInteraction;
      v4->_siriButtonInteraction = (SBHardwareButtonInteraction *)v9;

      [(SBHardwareButtonInteraction *)v4->_siriButtonInteraction addHardwareButtonGestureParametersObserver:v4];
      uint64_t v11 = [(SBHardwareButtonInteraction *)v4->_siriButtonInteraction hardwareButtonGestureParameters];
      siriGestureParameters = v4->_siriGestureParameters;
      v4->_siriGestureParameters = (SBHardwareButtonGestureParameters *)v11;

      uint64_t v13 = +[SBAccessibilityHardwareButtonInteraction hardwareButtonInteractionForHomeButton];
      accessibilityButtonInteraction = v4->_accessibilityButtonInteraction;
      v4->_accessibilityButtonInteraction = (SBHardwareButtonInteraction *)v13;

      [(SBHardwareButtonInteraction *)v4->_accessibilityButtonInteraction addHardwareButtonGestureParametersObserver:v4];
      uint64_t v15 = [(SBHardwareButtonInteraction *)v4->_accessibilityButtonInteraction hardwareButtonGestureParameters];
      accessibilityGestureParameters = v4->_accessibilityGestureParameters;
      v4->_accessibilityGestureParameters = (SBHardwareButtonGestureParameters *)v15;
    }
    v17 = objc_alloc_init(SBHardwareButtonActionList);
    buttonUpActions = v4->_buttonUpActions;
    v4->_buttonUpActions = v17;

    v19 = objc_alloc_init(SBHardwareButtonActionList);
    buttonUpPostActions = v4->_buttonUpPostActions;
    v4->_buttonUpPostActions = v19;

    SBGuidedAccessPrepare();
  }
  return v4;
}

- (void)configureForwardingToLockButtonActions:(id)a3
{
  if (self->_homeButtonType == 2)
  {
    id v6 = [a3 siriButtonInteraction];
    v4 = +[SBSiriHardwareButtonEventsOnlyButtonInteraction hardwareButtonInteractionForHomeButtonForwardingToInteraction:v6];
    siriButtonInteraction = self->_siriButtonInteraction;
    self->_siriButtonInteraction = v4;
  }
}

- (void)setButtonDown:(BOOL)a3
{
  BOOL v3 = a3;
  self->_buttonDown = a3;
  -[SBHardwareButtonActionList setButtonDown:](self->_buttonUpActions, "setButtonDown:");
  buttonUpPostActions = self->_buttonUpPostActions;
  [(SBHardwareButtonActionList *)buttonUpPostActions setButtonDown:v3];
}

- (void)performInitialButtonDownActions
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!SBGuidedAccessIsActive())
  {
    self->_dontUnlockOnButtonUp = 0;
    [(SBHomeHardwareButtonActions *)self setButtonDown:1];
    self->_menuButtonHoldStartTime = mach_absolute_time();
    self->_menuButtonHoldStartAbsoluteTime = CFAbsoluteTimeGetCurrent();
    id v6 = dispatch_get_global_queue(0, 0);
    dispatch_async(v6, &__block_literal_global_139);

    v4 = +[SBTelephonyManager sharedTelephonyManager];
    if ([v4 isInEmergencyCallbackMode]
      && [v4 activeCallExists])
    {
      uint64_t v5 = SBLogButtonsHome();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      v8 = "%{public}@ result: ECBM enabled and active call exists";
LABEL_18:
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

      goto LABEL_45;
    }
    uint64_t v9 = +[SBSetupManager sharedInstance];
    if ([v9 isInSetupMode])
    {
      int v10 = [v4 inCall];

      if (v10)
      {
        uint64_t v5 = SBLogButtonsHome();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
          goto LABEL_45;
        }
        uint64_t v7 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v40 = v7;
        v8 = "%{public}@ result: on a call in setup mode";
        goto LABEL_18;
      }
    }
    else
    {
    }
    if ([(SBProximitySensorManager *)self->_proximitySensorManager isObjectInProximity]) {
      [(SBProximitySensorManager *)self->_proximitySensorManager resetProximityCalibration];
    }
    uint64_t v11 = +[SBSystemGestureManager mainDisplayManager];
    int v12 = [v11 isAnyTouchGestureRunning];

    if (v12)
    {
      uint64_t v5 = SBLogButtonsHome();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      v8 = "%{public}@ result: system gesture running";
      goto LABEL_18;
    }
    uint64_t v13 = objc_opt_class();
    v14 = SBSafeCast(v13, self->_siriButtonInteraction);
    uint64_t v5 = v14;
    if (v14) {
      [v14 setInitialPressDownTime:self->_menuButtonHoldStartAbsoluteTime];
    }
    uint64_t v15 = +[SBLockScreenManager sharedInstance];
    v16 = +[SBBacklightController sharedInstance];
    self->_screenWasDimOnMenuDown = [v16 screenIsDim];
    id v36 = 0;
    BOOL v17 = [(SBHomeHardwareButtonActions *)self _shouldIgnorePressesDueToProxOrIdle:&v36];
    id v35 = v36;
    if (v17)
    {
      v18 = [(id)SBApp lockHardwareButton];
      int v19 = [v18 reverseFadeOutIfNeeded];

      v20 = SBLogButtonsHome();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v19)
      {
        objc_super v22 = v35;
        if (v21)
        {
          v23 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543618;
          v40 = v23;
          __int16 v41 = 2114;
          id v42 = v35;
          v24 = "%{public}@ result: reversed lock fadeout because %{public}@";
LABEL_34:
          _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
        }
      }
      else
      {
        objc_super v22 = v35;
        if (v21)
        {
          v23 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543618;
          v40 = v23;
          __int16 v41 = 2114;
          id v42 = v35;
          v24 = "%{public}@ result: ignored because %{public}@";
          goto LABEL_34;
        }
      }
LABEL_44:

      goto LABEL_45;
    }
    v20 = +[SBScreenWakeAnimationController sharedInstance];
    if ([v16 screenIsOn]
      && ([v20 isSleepAnimationInProgress] & 1) == 0)
    {
      [v15 isUILocked];
    }
    else
    {
      char v25 = [v20 isWakeAnimationInProgress];
      if ([v15 isUILocked] && (v25 & 1) == 0)
      {
        v34 = v16;
        v26 = SBLogButtonsHome();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v40 = v27;
          _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_INFO, "%{public}@ result: turning on the screen if necessary", buf, 0xCu);
        }
        v37[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
        v33 = [NSNumber numberWithBool:1];
        v38[0] = v33;
        v37[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
        v28 = [NSNumber numberWithBool:1];
        v38[1] = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
        [v15 unlockUIFromSource:15 withOptions:v29];

        self->_dontUnlockOnButtonUp = 1;
        v16 = v34;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(SBHardwareButtonInteraction *)self->_siriButtonInteraction consumeInitialPressDown])
    {
      v30 = SBLogButtonsHome();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v40 = v31;
        v32 = "%{public}@ result: siriButtonInteraction handled it";
LABEL_42:
        _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_INFO, v32, buf, 0xCu);
      }
    }
    else
    {
      v30 = SBLogButtonsHome();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v40 = v31;
        v32 = "%{public}@ result: ignored";
        goto LABEL_42;
      }
    }
    objc_super v22 = v35;

    goto LABEL_44;
  }
  v4 = SBLogButtonsHome();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v40 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "%{public}@ result: guided access", buf, 0xCu);
LABEL_45:
  }
}

uint64_t __62__SBHomeHardwareButtonActions_performInitialButtonDownActions__block_invoke()
{
  return +[SBMediaController sendResetPlaybackTimeoutCommand];
}

- (BOOL)_performButtonPreflightActions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4FA7A78] object:0];

  ADClientAddValueForScalarKey();
  uint64_t v5 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v5 emitEvent:0];

  [(SBHardwareButtonActionList *)self->_buttonUpActions performQueuedButtonUpActions];
  if (objc_opt_respondsToSelector()) {
    [(SBHardwareButtonInteraction *)self->_siriButtonInteraction observeFinalPressUp];
  }
  id v6 = +[SBTelephonyManager sharedTelephonyManager];
  if ([v6 isInEmergencyCallbackMode]
    && [v6 isEmergencyCallActive])
  {
    uint64_t v7 = SBLogButtonsHome();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(a2);
      int v16 = 138543362;
      BOOL v17 = v8;
      uint64_t v9 = "%{public}@ result: ECBM enabled and emergency call is active";
LABEL_15:
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, 0xCu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  int v10 = +[SBSetupManager sharedInstance];
  if (![v10 isInSetupMode])
  {

LABEL_12:
    int v12 = +[SBSystemGestureManager mainDisplayManager];
    int v13 = [v12 isAnyTouchGestureRunning];

    if (!v13)
    {
      BOOL v14 = 1;
      goto LABEL_18;
    }
    uint64_t v7 = SBLogButtonsHome();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(a2);
      int v16 = 138543362;
      BOOL v17 = v8;
      uint64_t v9 = "%{public}@ result: system gesture running";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  int v11 = [v6 inCall];

  if (!v11) {
    goto LABEL_12;
  }
  uint64_t v7 = SBLogButtonsHome();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = NSStringFromSelector(a2);
    int v16 = 138543362;
    BOOL v17 = v8;
    uint64_t v9 = "%{public}@ result: on a call in setup mode";
    goto LABEL_15;
  }
LABEL_16:

  BOOL v14 = 0;
LABEL_18:

  return v14;
}

- (BOOL)_shouldIgnorePressesDueToProxOrIdle:(id *)a3
{
  *a3 = 0;
  if (!self->_screenWasDimOnMenuDown)
  {
    uint64_t v5 = +[SBBacklightController sharedInstance];
    int v6 = [v5 screenIsDim];

    if (!v6) {
      return 0;
    }
  }
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  if (![(SBProximitySensorManager *)self->_proximitySensorManager isObjectInProximity])
  {
    v8 = +[SBLockScreenManager sharedInstance];
    char v9 = [v8 isUILocked];

    if ((v9 & 1) == 0)
    {
      uint64_t v7 = @"screen was/is dim and unlocked";
      goto LABEL_9;
    }
    return 0;
  }
  uint64_t v7 = @"screen was/is dim and object within proximity";
LABEL_9:
  *a3 = v7;
  return 1;
}

- (void)performSinglePressUpActions
{
}

- (void)performSinglePressUpActionsWithSourceType:(unint64_t)a3
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  if (![(SBHomeHardwareButtonActions *)self _performButtonPreflightActions])
  {
    int v11 = SBLogButtonsHome();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v128 = v12;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "%{public}@ result: failed preflight checks", buf, 0xCu);
    }
    goto LABEL_113;
  }
  if (SBGuidedAccessIsActive())
  {
    BOOL v6 = [(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonSinglePressUpWithPriority:300];
    uint64_t v7 = SBLogButtonsHome();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        char v9 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v128 = v9;
        int v10 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_13:
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
      }
    }
    else if (v8)
    {
      char v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v128 = v9;
      int v10 = "%{public}@ result: guided access";
      goto LABEL_13;
    }

    _AXSHandleHomeButtonPressSwallowedForGuidedAccess();
    return;
  }
  int v13 = +[SBLockScreenManager sharedInstance];
  [v13 noteMenuButtonSinglePress];

  v116 = +[SBReachabilityManager sharedInstance];
  int v115 = [v116 reachabilityModeActive];
  id v123 = 0;
  BOOL v14 = [(SBHomeHardwareButtonActions *)self _shouldIgnorePressesDueToProxOrIdle:&v123];
  id v15 = v123;
  if (v14)
  {
    int v16 = SBLogButtonsHome();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      BOOL v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      v128 = v17;
      __int16 v129 = 2114;
      id v130 = v15;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "%{public}@ result: ignored because %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v18 = +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController];
    uint64_t v19 = [v18 unlockedEnvironmentMode];

    if (v19 != 3) {
      goto LABEL_18;
    }
    int v16 = +[SBWallpaperController sharedInstance];
    [v16 preheatWallpaperForVariant:1];
  }

LABEL_18:
  id v117 = v15;
  v20 = [(id)SBApp systemApertureControllerForMainDisplay];
  v114 = v20;
  if (v14)
  {
    char v21 = 1;
  }
  else
  {
    if ([v20 handleHomeButtonPress])
    {
      objc_super v22 = SBLogButtonsHome();
      char v21 = 1;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v128 = v23;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "%{public}@ result: system aperture controller wants home button", buf, 0xCu);
      }
    }
    else
    {
      objc_super v22 = [(id)SBApp lockOutController];
      if ([v22 isProximityReaderBlocked])
      {
        v24 = [(id)SBApp systemUIScenesCoordinator];
        char v25 = [v24 proximityReaderUISceneController];
        int v26 = [v25 handleHomeButtonPress];
        char v21 = v26;
        if (v26)
        {
          v27 = SBLogButtonsHome();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543362;
            v128 = v28;
            _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_INFO, "%{public}@ result: Proximity reader handled it", buf, 0xCu);
          }
        }
      }
      else
      {
        char v21 = 0;
      }
    }
  }
  v29 = [(id)SBApp windowSceneManager];
  v30 = [v29 activeDisplayWindowScene];

  v31 = +[SBWorkspace mainWorkspace];
  v32 = [v31 transientOverlayPresentationManager];
  v33 = [v32 transientOverlayPresenterForWindowScene:v30];

  v34 = [(id)SBApp bannerManager];
  id v35 = v34;
  if (v21) {
    goto LABEL_41;
  }
  id v36 = [v34 bannerWindowInWindowScene:v30];
  [v36 windowLevel];
  if (objc_msgSend(v33, "hasPresentationAboveWindowLevel:"))
  {
  }
  else
  {
    int v37 = [v35 handleHomeButtonPress];

    if (v37)
    {
      v38 = SBLogButtonsHome();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v128 = v39;
        _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_INFO, "%{public}@ result: banner manager wants home button", buf, 0xCu);
      }
      goto LABEL_40;
    }
  }
  v40 = +[SBCommandTabController sharedInstance];
  int v41 = [v40 isVisible];

  if (v41)
  {
    id v42 = +[SBCommandTabController sharedInstance];
    [v42 dismiss];

    v38 = SBLogButtonsHome();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v128 = v43;
      _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_INFO, "%{public}@ result: dismissing command-tab UI", buf, 0xCu);
    }
LABEL_40:

LABEL_41:
    char v44 = 1;
    goto LABEL_42;
  }
  char v44 = 0;
LABEL_42:
  v45 = +[SBControlCenterController sharedInstanceIfExists];
  v46 = v45;
  if ((v44 & 1) == 0)
  {
    v47 = [v45 _controlCenterWindow];
    [v47 windowLevel];
    if (objc_msgSend(v33, "hasPresentationAboveWindowLevel:"))
    {

LABEL_50:
      v113 = v35;
      v51 = [v30 assistantController];
      v53 = [v51 window];
      [v53 windowLevel];
      if ((objc_msgSend(v33, "hasPresentationAboveWindowLevel:") & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
      {
      }
      else
      {
        int v54 = [(SBHardwareButtonInteraction *)self->_siriButtonInteraction consumeSinglePressUp];

        if (v54)
        {
          v55 = SBLogButtonsHome();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v56 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543362;
            v128 = v56;
            _os_log_impl(&dword_1D85BA000, v55, OS_LOG_TYPE_INFO, "%{public}@ result: assistant handled it", buf, 0xCu);
          }
          v52 = v117;
          id v35 = v113;
          goto LABEL_110;
        }
      }
      v109 = v51;
      v57 = +[SBLockScreenManager sharedInstance];
      v58 = +[SBLockScreenManager sharedInstance];
      v59 = [v58 lockScreenEnvironment];
      v112 = [v59 buttonEventsHandler];

      v111 = v57;
      v110 = v46;
      if ([v57 handlesHomeButtonSinglePresses])
      {
        if (self->_dontUnlockOnButtonUp)
        {
          v60 = SBLogButtonsHome();
          v52 = v117;
          id v35 = v113;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            v61 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138543362;
            v128 = v61;
            v62 = "%{public}@ result: ignored because we don't unlock on button up";
LABEL_107:
            _os_log_impl(&dword_1D85BA000, v60, OS_LOG_TYPE_INFO, v62, buf, 0xCu);

            goto LABEL_108;
          }
          goto LABEL_108;
        }
        v52 = v117;
        id v35 = v113;
        if ([(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonSinglePressUpWithPriority:100])
        {
          v85 = SBLogButtonsHome();
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_INFO)) {
            goto LABEL_104;
          }
          v86 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v128 = v86;
          v87 = "%{public}@ result: button consumer app handled it";
          v88 = v85;
          uint32_t v89 = 12;
        }
        else
        {
          v96 = +[SBWorkspace mainWorkspace];
          v85 = [v96 transientOverlayPresentationManager];

          if ([v85 handleHomeButtonPress])
          {
            v97 = SBLogButtonsHome();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
            {
              v98 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138543362;
              v128 = v98;
              _os_log_impl(&dword_1D85BA000, v97, OS_LOG_TYPE_INFO, "%{public}@ result: Transient overlay presentation manager handled it", buf, 0xCu);
            }
            id v35 = v113;
            goto LABEL_104;
          }

          if (![v112 handleHomeButtonPress])
          {
            v99 = +[SBAlertItemsController sharedInstance];
            char v100 = [v99 hasLockScreenModalAlert];

            if ((v100 & 1) == 0)
            {
              v101 = SBLogButtonsHome();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
              {
                v102 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138543362;
                v128 = v102;
                _os_log_impl(&dword_1D85BA000, v101, OS_LOG_TYPE_INFO, "%{public}@ result: attempting unlock with home button source", buf, 0xCu);
              }
              v60 = +[SBBacklightController sharedInstance];
              v103 = +[SBScreenWakeAnimationController sharedInstance];
              int v104 = [v60 screenIsOn];
              if (v104 && ![v103 isSleepAnimationInProgress]) {
                uint64_t v105 = 0;
              }
              else {
                uint64_t v105 = [v103 isWakeAnimationInProgress] ^ 1;
              }
              v125[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
              v106 = [NSNumber numberWithBool:v104 ^ 1u];
              v126[0] = v106;
              v125[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
              v107 = [NSNumber numberWithBool:v105];
              v126[1] = v107;
              v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:2];
              [v57 unlockUIFromSource:15 withOptions:v108];

              v52 = v117;
              id v35 = v113;
              goto LABEL_108;
            }
LABEL_105:
            v60 = SBLogButtonsHome();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              v61 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138543362;
              v128 = v61;
              v62 = "%{public}@ result: ignored because there's a lock screen modal alert";
              goto LABEL_107;
            }
LABEL_108:

            self->_dontUnlockOnButtonUp = 0;
            goto LABEL_109;
          }
          v85 = SBLogButtonsHome();
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
LABEL_104:

            goto LABEL_105;
          }
          v86 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543618;
          v128 = v86;
          __int16 v129 = 2114;
          id v130 = v112;
          v87 = "%{public}@ result: CoverSheet (%{public}@) handled it";
          v88 = v85;
          uint32_t v89 = 22;
        }
        _os_log_impl(&dword_1D85BA000, v88, OS_LOG_TYPE_INFO, v87, buf, v89);

        goto LABEL_104;
      }
      v63 = +[SBAssistantController sharedInstance];
      char v64 = [v63 contentObscuresEmbeddedDisplayScreen];

      if ((v64 & 1) == 0)
      {
        v65 = +[SBAssistantController sharedInstance];
        [v65 dismissAssistantViewInEverySceneIfNecessary];
      }
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      v66 = [(id)SBApp windowSceneManager];
      v67 = [v66 connectedWindowScenes];

      uint64_t v68 = [v67 countByEnumeratingWithState:&v119 objects:v124 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v70 = *(void *)v120;
LABEL_66:
        uint64_t v71 = 0;
        while (1)
        {
          if (*(void *)v120 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = *(void **)(*((void *)&v119 + 1) + 8 * v71);
          if ([v72 isMainDisplayWindowScene]) {
            break;
          }
          if (v69 == ++v71)
          {
            uint64_t v69 = [v67 countByEnumeratingWithState:&v119 objects:v124 count:16];
            if (v69) {
              goto LABEL_66;
            }
            goto LABEL_79;
          }
        }
        v73 = [v72 modalLibraryController];
        v74 = [v72 layoutStateProvider];
        v75 = [v74 layoutState];
        uint64_t v76 = [v75 unlockedEnvironmentMode];

        if ((v76 & 0xFFFFFFFFFFFFFFFELL) != 2 || ![v73 isPresentingLibraryInForeground])
        {

          goto LABEL_79;
        }
        v77 = [v73 libraryViewController];
        [v77 popPresentationState];

        v78 = SBLogButtonsHome();
        v52 = v117;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          v79 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v128 = v79;
          _os_log_impl(&dword_1D85BA000, v78, OS_LOG_TYPE_INFO, "%{public}@ result: Library view controller handled it", buf, 0xCu);
        }
        goto LABEL_94;
      }
LABEL_79:

      v80 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      int v81 = [v80 handleHomeButtonPress];

      if (v81)
      {
        v82 = SBLogButtonsHome();
        v52 = v117;
        id v35 = v113;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          v83 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v128 = v83;
          v84 = "%{public}@ result: SBMainSwitcherCoordinator handled it";
LABEL_85:
          _os_log_impl(&dword_1D85BA000, v82, OS_LOG_TYPE_INFO, v84, buf, 0xCu);
        }
      }
      else
      {
        v52 = v117;
        id v35 = v113;
        if (![(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonSinglePressUpWithPriority:0])
        {
          v90 = +[SBUIController sharedInstance];
          char v91 = [v90 handleHomeButtonSinglePressUpForWindowScene:v30 withSourceType:a3];

          if ((v91 & 1) == 0)
          {
            v92 = SBLogButtonsHome();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
            {
              v93 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138543362;
              v128 = v93;
              _os_log_impl(&dword_1D85BA000, v92, OS_LOG_TYPE_INFO, "%{public}@ result: SBUIController is busy - queued the home button event for later processing", buf, 0xCu);
            }
            v118[0] = MEMORY[0x1E4F143A8];
            v118[1] = 3221225472;
            v118[2] = __73__SBHomeHardwareButtonActions_performSinglePressUpActionsWithSourceType___block_invoke;
            v118[3] = &unk_1E6AF4A70;
            v118[4] = self;
            v118[5] = a3;
            v94 = [MEMORY[0x1E4F624D8] eventWithName:@"HandleMenuButton" handler:v118];
            v95 = [MEMORY[0x1E4F624E0] sharedInstance];
            [v95 cancelEventsWithName:@"HandleMenuButton"];
            [v95 executeOrAppendEvent:v94];

LABEL_94:
            id v35 = v113;
          }
LABEL_109:

          v51 = v109;
          v46 = v110;
          goto LABEL_110;
        }
        v82 = SBLogButtonsHome();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          v83 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v128 = v83;
          v84 = "%{public}@ result: button consumer app handled it";
          goto LABEL_85;
        }
      }

      goto LABEL_109;
    }
    int v48 = [v46 handleMenuButtonTap];

    if (!v48) {
      goto LABEL_50;
    }
    v49 = SBLogButtonsHome();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v128 = v50;
      _os_log_impl(&dword_1D85BA000, v49, OS_LOG_TYPE_INFO, "%{public}@ result: control center handled it", buf, 0xCu);
    }
  }
  v51 = [v30 assistantController];
  v52 = v117;
LABEL_110:
  int v11 = v116;
  if (v115)
  {
    ADClientAddValueForScalarKey();
    [v116 deactivateReachability];
  }

LABEL_113:
}

uint64_t __73__SBHomeHardwareButtonActions_performSinglePressUpActionsWithSourceType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSinglePressUpActionsWithSourceType:*(void *)(a1 + 40)];
}

- (void)performLongPressActions
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!SBGuidedAccessIsActive())
  {
    uint64_t v5 = [(id)SBApp lockOutController];
    char v9 = +[SBLockScreenManager sharedInstance];
    int v10 = [(id)SBApp windowSceneManager];
    int v11 = [v10 activeDisplayWindowScene];

    int v12 = +[SBWorkspace mainWorkspace];
    int v13 = [v12 transientOverlayPresentationManager];
    v38 = [v13 transientOverlayPresenterForWindowScene:v11];

    BOOL v14 = [(id)SBApp bannerManager];
    id v15 = [(id)SBApp systemApertureControllerForMainDisplay];
    int v37 = v9;
    int v16 = [v9 isUILocked];
    BOOL v17 = +[SBWorkspace mainWorkspace];
    if ([v17 isPowerDownTransientOverlayTopmost])
    {
      char v18 = [v5 isLockedOut];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = SBLogButtonsHome();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v40 = v20;
          _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "%{public}@ result: dismissing powerdown", buf, 0xCu);
        }
        char v21 = +[SBWorkspace mainWorkspace];
        [v21 dismissPowerDownTransientOverlayWithCompletion:&__block_literal_global_100];

        goto LABEL_40;
      }
    }
    else
    {
    }
    if ([v15 handleHomeButtonLongPress])
    {
      objc_super v22 = SBLogButtonsHome();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        v40 = v23;
        v24 = "%{public}@ result: system aperture controller handled it";
LABEL_38:
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

        goto LABEL_39;
      }
      goto LABEL_39;
    }
    char v25 = [v14 bannerWindowInWindowScene:v11];
    [v25 windowLevel];
    if (objc_msgSend(v38, "hasPresentationAboveWindowLevel:"))
    {
    }
    else
    {
      int v26 = [v14 handleHomeButtonLongPress];

      if (v26)
      {
        objc_super v22 = SBLogButtonsHome();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v40 = v23;
          v24 = "%{public}@ result: banner manager handled it";
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
    }
    if (!v16
      || ([v37 lockScreenEnvironment],
          v27 = objc_claimAutoreleasedReturnValue(),
          [v27 buttonEventsHandler],
          v28 = objc_claimAutoreleasedReturnValue(),
          char v29 = [v28 handleHomeButtonLongPress],
          v28,
          v27,
          (v29 & 1) == 0))
    {
      v30 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      int v31 = [v30 handleHomeButtonLongPress];

      if (v31)
      {
        v32 = SBLogButtonsHome();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v40 = v33;
          v34 = "%{public}@ result: main switcher handled it";
LABEL_34:
          _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_INFO, v34, buf, 0xCu);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      if ([(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonLongPressWithPriority:0])
      {
        v32 = SBLogButtonsHome();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v40 = v33;
          v34 = "%{public}@ result: external consumer (at normal priority)";
          goto LABEL_34;
        }
LABEL_35:

        id v35 = +[SBCommandTabController sharedInstance];
        [v35 dismiss];

        ADClientAddValueForScalarKey();
        id v36 = [MEMORY[0x1E4FA5E78] sharedInstance];
        [v36 emitEvent:2];

        [(SBHomeHardwareButtonActions *)self _logMenuButtonHoldTime];
LABEL_40:

        goto LABEL_41;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(SBHardwareButtonInteraction *)self->_siriButtonInteraction consumeLongPress])
      {
        v32 = SBLogButtonsHome();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          v40 = v33;
          v34 = "%{public}@ result: siriButtonInteraction handled it";
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
    objc_super v22 = SBLogButtonsHome();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      v24 = "%{public}@ result: ignored because nothing handled it";
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  BOOL v4 = [(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonLongPressWithPriority:300];
  uint64_t v5 = SBLogButtonsHome();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      BOOL v8 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_12:
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
    }
  }
  else if (v6)
  {
    uint64_t v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    BOOL v8 = "%{public}@ result: guided access";
    goto LABEL_12;
  }
LABEL_41:
}

void __54__SBHomeHardwareButtonActions_performLongPressActions__block_invoke()
{
}

- (void)performDoublePressDownActions
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(SBHomeHardwareButtonActions *)self _performButtonPreflightActions])
  {
    if (SBGuidedAccessIsActive())
    {
      BOOL v4 = [(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonDoublePressDownWithPriority:300];
      uint64_t v5 = SBLogButtonsHome();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v6)
        {
          uint64_t v7 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          char v44 = v7;
          BOOL v8 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_13:
          _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
        }
      }
      else if (v6)
      {
        uint64_t v7 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        char v44 = v7;
        BOOL v8 = "%{public}@ result: guided access";
        goto LABEL_13;
      }

      _AXSHandleHomeButtonPressSwallowedForGuidedAccess();
      return;
    }
    int v11 = +[SBLockScreenManager sharedInstance];
    [v11 noteMenuButtonDoublePress];

    id v42 = 0;
    BOOL v12 = [(SBHomeHardwareButtonActions *)self _shouldIgnorePressesDueToProxOrIdle:&v42];
    char v9 = v42;
    if (v12)
    {
      int v10 = SBLogButtonsHome();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        char v44 = v13;
        __int16 v45 = 2114;
        v46 = v9;
        BOOL v14 = "%{public}@ result: ignored because %{public}@";
        id v15 = v10;
        uint32_t v16 = 22;
LABEL_22:
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
      }
LABEL_51:

      goto LABEL_52;
    }
    BOOL v17 = [(id)SBApp lockOutController];
    int v18 = [v17 isBlocked];

    if (v18)
    {
      int v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_51;
      }
      int v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      char v44 = v13;
      BOOL v14 = "%{public}@ result: blocked";
LABEL_21:
      id v15 = v10;
      uint32_t v16 = 12;
      goto LABEL_22;
    }
    uint64_t v19 = +[SBSetupManager sharedInstance];
    int v20 = [v19 isInSetupMode];

    if (v20)
    {
      int v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_51;
      }
      int v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      char v44 = v13;
      BOOL v14 = "%{public}@ result: in setup mode";
      goto LABEL_21;
    }
    int v10 = +[SBUIController sharedInstance];
    uint64_t v41 = +[SBLockScreenManager sharedInstance];
    char v21 = [(id)SBApp windowSceneManager];
    objc_super v22 = [v21 activeDisplayWindowScene];

    v23 = +[SBWorkspace mainWorkspace];
    v24 = [v23 transientOverlayPresentationManager];
    char v25 = [v24 transientOverlayPresenterForWindowScene:v22];

    int v26 = [(id)SBApp bannerManager];
    v27 = [(id)SBApp systemApertureControllerForMainDisplay];
    if ([v27 handleHomeButtonDoublePress])
    {
      v28 = SBLogButtonsHome();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        char v29 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        char v44 = v29;
        _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_INFO, "%{public}@ result: system aperture controller handled it", buf, 0xCu);
      }
      goto LABEL_48;
    }
    v30 = [v26 bannerWindowInWindowScene:v22];
    [v30 windowLevel];
    if (objc_msgSend(v25, "hasPresentationAboveWindowLevel:"))
    {
    }
    else
    {
      int v31 = [v26 handleHomeButtonDoublePress];

      if (v31)
      {
        v28 = SBLogButtonsHome();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v32 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          char v44 = v32;
          v33 = "%{public}@ result: banner manager handled it";
LABEL_47:
          _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_INFO, v33, buf, 0xCu);
        }
LABEL_48:

LABEL_49:
        ADClientAddValueForScalarKey();
        v38 = [MEMORY[0x1E4FA5E78] sharedInstance];
        [v38 emitEvent:1];

LABEL_50:
        goto LABEL_51;
      }
    }
    if ([v25 handleHomeButtonDoublePress])
    {
      v28 = SBLogButtonsHome();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        char v44 = v32;
        v33 = "%{public}@ result: transient overlay presentation manager handled it";
        goto LABEL_47;
      }
      goto LABEL_48;
    }
    if ([v41 isUILocked])
    {
      if ([(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonDoublePressDownWithPriority:100])
      {
        v28 = SBLogButtonsHome();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
          goto LABEL_48;
        }
LABEL_46:
        v32 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        char v44 = v32;
        v33 = "%{public}@ result: button consumer app handled it";
        goto LABEL_47;
      }
      id v36 = [v41 lockScreenEnvironment];
      int v37 = [v36 buttonEventsHandler];
      int v40 = [v37 handleHomeButtonDoublePress];

      if (v40)
      {
        v28 = SBLogButtonsHome();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v32 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          char v44 = v32;
          v33 = "%{public}@ result: lock-screen view controller handled it";
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
    else
    {
      v34 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      int v35 = [v34 handleHomeButtonDoublePress];

      if (v35)
      {
        v28 = SBLogButtonsHome();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v32 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543362;
          char v44 = v32;
          v33 = "%{public}@ result: main switcher handled it";
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if ([(SBHardwareButtonService *)self->_hardwareButtonService consumeHomeButtonDoublePressDownWithPriority:0])
      {
        v28 = SBLogButtonsHome();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
          goto LABEL_48;
        }
        goto LABEL_46;
      }
      if ([v10 handleHomeButtonDoublePressDown]) {
        goto LABEL_49;
      }
    }
    v39 = SBLogButtonsHome();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_INFO, "Nothing handled the double press, so pretending it was a single press...", buf, 2u);
    }

    [(SBHomeHardwareButtonActions *)self performSinglePressUpActions];
    goto LABEL_50;
  }
  char v9 = SBLogButtonsHome();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    char v44 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "%{public}@ result: failed preflight checks", buf, 0xCu);
    goto LABEL_51;
  }
LABEL_52:
}

- (void)performTriplePressUpActions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SBHomeHardwareButtonActions *)self _performButtonPreflightActions])
  {
    id v13 = 0;
    BOOL v4 = [(SBHomeHardwareButtonActions *)self _shouldIgnorePressesDueToProxOrIdle:&v13];
    uint64_t v5 = v13;
    if (v4)
    {
      BOOL v6 = SBLogButtonsHome();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        id v15 = v7;
        __int16 v16 = 2114;
        BOOL v17 = v5;
        BOOL v8 = "%{public}@ result: ignored because %{public}@";
        char v9 = v6;
        uint32_t v10 = 22;
LABEL_21:
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
      }
LABEL_22:

      goto LABEL_23;
    }
    int IsActive = SBGuidedAccessIsActive();
    hardwareButtonService = self->_hardwareButtonService;
    if (IsActive)
    {
      if ([(SBHardwareButtonService *)hardwareButtonService consumeHomeButtonTriplePressUpWithPriority:300])
      {
        BOOL v6 = SBLogButtonsHome();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        uint64_t v7 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543362;
        id v15 = v7;
        BOOL v8 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_20:
        char v9 = v6;
        uint32_t v10 = 12;
        goto LABEL_21;
      }
    }
    else if ([(SBHardwareButtonService *)hardwareButtonService consumeHomeButtonTriplePressUpWithPriority:0])
    {
      BOOL v6 = SBLogButtonsHome();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      BOOL v8 = "%{public}@ result: external consumer";
      goto LABEL_20;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(SBHardwareButtonInteraction *)self->_accessibilityButtonInteraction consumeTriplePressUp])
    {
      BOOL v6 = SBLogButtonsHome();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      BOOL v8 = "%{public}@ result: accessibility handled it";
    }
    else
    {
      BOOL v6 = SBLogButtonsHome();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      uint64_t v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      BOOL v8 = "%{public}@ result: ignored";
    }
    goto LABEL_20;
  }
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "%{public}@ result: failed preflight checks", buf, 0xCu);
    goto LABEL_22;
  }
LABEL_23:
}

- (void)performFinalButtonUpActions
{
  if ([(SBHomeHardwareButtonActions *)self isButtonDown])
  {
    BOOL v3 = SBLogButtonsHome();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Performing up actions", v4, 2u);
    }

    [(SBHomeHardwareButtonActions *)self setButtonDown:0];
    self->_screenWasDimOnMenuDown = 0;
    [(SBHomeHardwareButtonActions *)self _logMenuButtonHoldTime];
    [(SBHardwareButtonActionList *)self->_buttonUpActions performQueuedButtonUpActions];
    [(SBHardwareButtonActionList *)self->_buttonUpPostActions performQueuedButtonUpActions];
    if (objc_opt_respondsToSelector()) {
      [(SBHardwareButtonInteraction *)self->_siriButtonInteraction observeFinalPressUp];
    }
  }
}

- (void)performLongPressCancelledActions
{
  BOOL v3 = SBLogButtonsHome();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Performing long press cancelled actions", v4, 2u);
  }

  if (objc_opt_respondsToSelector()) {
    [(SBHardwareButtonInteraction *)self->_siriButtonInteraction observeLongPressCanceled];
  }
}

- (void)performDoubleTapUpActions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogButtonsHome();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v1SBWorkspaceTerminateAllApps(5, 0, @"power down shortcut", 0) = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Performing double tap up actions", (uint8_t *)&v10, 2u);
  }

  if (+[SBReachabilityManager reachabilitySupported]
    && (+[SBReachabilityManager sharedInstance],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 reachabilityEnabled],
        v4,
        v5))
  {
    BOOL v6 = +[SBReachabilityManager sharedInstance];
    [v6 toggleReachability];

    uint64_t v7 = SBLogButtonsHome();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = NSStringFromSelector(a2);
      int v10 = 138543362;
      int v11 = v8;
      char v9 = "%{public}@ result: reachability handled it";
LABEL_9:
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = SBLogButtonsHome();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = NSStringFromSelector(a2);
      int v10 = 138543362;
      int v11 = v8;
      char v9 = "%{public}@ result: double-tap ignored because reachability is disabled";
      goto LABEL_9;
    }
  }
}

- (void)performWhenMenuButtonIsUpUsingBlock:(id)a3
{
  if (a3) {
    -[SBHardwareButtonActionList scheduleButtonUpActionBlock:](self->_buttonUpActions, "scheduleButtonUpActionBlock:");
  }
}

- (void)performAfterMenuButtonUpIsHandledUsingBlock:(id)a3
{
  if (a3) {
    -[SBHardwareButtonActionList scheduleButtonUpActionBlock:](self->_buttonUpPostActions, "scheduleButtonUpActionBlock:");
  }
}

- (void)_logMenuButtonHoldTime
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_menuButtonHoldStartTime)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double menuButtonHoldStartAbsoluteTime = self->_menuButtonHoldStartAbsoluteTime;
    int v5 = SBLogButtonsHome();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      double v7 = Current - menuButtonHoldStartAbsoluteTime;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "First down to last up processed in %gs", (uint8_t *)&v6, 0xCu);
    }

    ADPushTimeIntervalForDistributionKeySinceStartTime();
  }
  self->_menuButtonHoldStartTime = 0;
}

- (id)hardwareButtonGestureParameters
{
  BOOL v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  BOOL v4 = v3;
  if (self->_homeButtonType == 2)
  {
    [(SBMutableHardwareButtonGestureParameters *)v3 setMaximumPressCount:2];
    [(SBMutableHardwareButtonGestureParameters *)v4 setMultiplePressTimeInterval:0.3];
    double v5 = 0.4;
  }
  else
  {
    [(SBMutableHardwareButtonGestureParameters *)v3 setMaximumPressCount:[(SBHardwareButtonGestureParameters *)self->_accessibilityGestureParameters maximumPressCount]];
    [(SBHardwareButtonGestureParameters *)self->_accessibilityGestureParameters multiplePressTimeInterval];
    -[SBMutableHardwareButtonGestureParameters setMultiplePressTimeInterval:](v4, "setMultiplePressTimeInterval:");
    [(SBHardwareButtonGestureParameters *)self->_siriGestureParameters longPressTimeInterval];
  }
  [(SBMutableHardwareButtonGestureParameters *)v4 setLongPressTimeInterval:v5];
  return v4;
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  int v6 = (SBHardwareButtonInteraction *)a3;
  id v7 = a4;
  if (self->_accessibilityButtonInteraction == v6)
  {
    uint64_t v8 = SBLogButtonsHome();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "reconfiguring due to AX prefs change", buf, 2u);
    }

    objc_storeStrong((id *)&self->_accessibilityGestureParameters, a4);
  }
  if (self->_siriButtonInteraction == v6)
  {
    char v9 = SBLogButtonsHome();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "reconfiguring due to Siri prefs change", v11, 2u);
    }

    objc_storeStrong((id *)&self->_siriGestureParameters, a4);
  }
  int v10 = [(SBHomeHardwareButtonActions *)self hardwareButtonGestureParameters];
  [(SBHardwareButtonGestureParametersProviderBase *)self publishUpdatedParameters:v10];
}

- (BOOL)isButtonDown
{
  return self->_buttonDown;
}

- (double)currentLongPressDuration
{
  return self->_currentLongPressDuration;
}

- (void)setCurrentLongPressDuration:(double)a3
{
  self->_currentLongPressDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriGestureParameters, 0);
  objc_storeStrong((id *)&self->_accessibilityGestureParameters, 0);
  objc_storeStrong((id *)&self->_siriButtonInteraction, 0);
  objc_storeStrong((id *)&self->_accessibilityButtonInteraction, 0);
  objc_storeStrong((id *)&self->_hardwareButtonService, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_buttonUpPostActions, 0);
  objc_storeStrong((id *)&self->_buttonUpActions, 0);
}

@end