@interface SBLockHardwareButtonActions
- (BOOL)_isSOSActive;
- (BOOL)_sendButtonDownToRegisteredApp;
- (BOOL)_sendButtonUpToRegisteredApp;
- (BOOL)_shouldWaitForDoublePress;
- (BOOL)_usesLockButtonForSecureIntent;
- (BOOL)_usesLockButtonForSiri;
- (BOOL)disallowsDoublePressForReason:(id *)a3;
- (BOOL)disallowsLongPressForReason:(id *)a3;
- (BOOL)disallowsSinglePressForReason:(id *)a3;
- (BOOL)disallowsTriplePressForReason:(id *)a3;
- (BOOL)isButtonDown;
- (BOOL)performButtonUpPreActions;
- (BOOL)reverseFadeOutIfNeeded;
- (BOOL)shouldBeginDoublePressGestureWhileObjectWithinProximity;
- (SBAccessibilityHardwareButtonInteraction)accessibilityButtonInteraction;
- (SBHardwareButtonInteraction)proximitySensorButtonInteraction;
- (SBLockHardwareButtonActions)initWithHomeButtonType:(int64_t)a3 proximitySensorManager:(id)a4;
- (SBSiriHardwareButtonInteraction)siriButtonInteraction;
- (SBSleepWakeHardwareButtonInteraction)sleepWakeButtonInteraction;
- (id)_foregroundAppRegisteredForLockButtonEvents;
- (id)hardwareButtonGestureParameters;
- (void)_performSOSDidTriggerActions;
- (void)_registeredLockButtonAppsDidChange:(id)a3;
- (void)_sendButtonEventToApp:(id)a3 down:(BOOL)a4;
- (void)_showPowerDownTransientOverlayOnForceReset;
- (void)performDoublePressActions;
- (void)performFinalButtonUpActions;
- (void)performForceResetSequenceBeganActions;
- (void)performInitialButtonDownActions;
- (void)performInitialButtonUpActions;
- (void)performKeyboardShortcut;
- (void)performLongPressActions;
- (void)performLongPressCancelledActions;
- (void)performSOSActionsWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5;
- (void)performSOSGestureBeganActions;
- (void)performSOSGestureEndedActions;
- (void)performSecondButtonDownActions;
- (void)performSinglePressAction;
- (void)performSinglePressDidFailActions;
- (void)performTerminalLockLongPressActions;
- (void)performTriplePressActions;
- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4;
- (void)setAccessibilityButtonInteraction:(id)a3;
- (void)setProximitySensorButtonInteraction:(id)a3;
- (void)setSiriButtonInteraction:(id)a3;
- (void)setSleepWakeButtonInteraction:(id)a3;
@end

@implementation SBLockHardwareButtonActions

- (SBLockHardwareButtonActions)initWithHomeButtonType:(int64_t)a3 proximitySensorManager:(id)a4
{
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)SBLockHardwareButtonActions;
  v8 = [(SBLockHardwareButtonActions *)&v36 init];
  if (v8)
  {
    uint64_t v9 = +[SBHardwareButtonService sharedInstance];
    hardwareButtonService = v8->_hardwareButtonService;
    v8->_hardwareButtonService = (SBHardwareButtonService *)v9;

    uint64_t v11 = +[SBWalletPreArmController sharedInstance];
    walletPreArmController = v8->_walletPreArmController;
    v8->_walletPreArmController = (SBWalletPreArmController *)v11;

    p_proximitySensorManager = &v8->_proximitySensorManager;
    objc_storeStrong((id *)&v8->_proximitySensorManager, a4);
    uint64_t v14 = [MEMORY[0x1E4F97B88] sharedInstance];
    sosManager = v8->_sosManager;
    v8->_sosManager = (SOSManager *)v14;

    v8->_homeButtonType = a3;
    v8->_sosTriggerMechanism = 0;
    if (v8->_homeButtonType == 2)
    {
      uint64_t v16 = +[SBSiriHardwareButtonInteraction hardwareButtonInteractionForLockButton];
      siriButtonInteraction = v8->_siriButtonInteraction;
      v8->_siriButtonInteraction = (SBSiriHardwareButtonInteraction *)v16;

      [(SBHardwareButtonGestureParametersProviderBase *)v8->_siriButtonInteraction addHardwareButtonGestureParametersObserver:v8];
      uint64_t v18 = [(SBSiriHardwareButtonInteraction *)v8->_siriButtonInteraction hardwareButtonGestureParameters];
      siriGestureParameters = v8->_siriGestureParameters;
      v8->_siriGestureParameters = (SBHardwareButtonGestureParameters *)v18;

      uint64_t v20 = +[SBAccessibilityHardwareButtonInteraction hardwareButtonInteractionForLockButton];
      accessibilityButtonInteraction = v8->_accessibilityButtonInteraction;
      v8->_accessibilityButtonInteraction = (SBAccessibilityHardwareButtonInteraction *)v20;

      [(SBHardwareButtonGestureParametersProviderBase *)v8->_accessibilityButtonInteraction addHardwareButtonGestureParametersObserver:v8];
      uint64_t v22 = [(SBAccessibilityHardwareButtonInteraction *)v8->_accessibilityButtonInteraction hardwareButtonGestureParameters];
      accessibilityGestureParameters = v8->_accessibilityGestureParameters;
      v8->_accessibilityGestureParameters = (SBHardwareButtonGestureParameters *)v22;

      v24 = [[SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction alloc] initWithProximitySensorManager:*p_proximitySensorManager];
      proximitySensorButtonInteraction = v8->_proximitySensorButtonInteraction;
      v8->_proximitySensorButtonInteraction = (SBHardwareButtonInteraction *)v24;

      [(SBHardwareButtonInteraction *)v8->_proximitySensorButtonInteraction addHardwareButtonGestureParametersObserver:v8];
      uint64_t v26 = [(SBHardwareButtonInteraction *)v8->_proximitySensorButtonInteraction hardwareButtonGestureParameters];
      proximitySensorGestureParameters = v8->_proximitySensorGestureParameters;
      v8->_proximitySensorGestureParameters = (SBHardwareButtonGestureParameters *)v26;

      v28 = [[SBDoubleClickSleepWakeHardwareButtonInteraction alloc] initWithProximitySensorManager:*p_proximitySensorManager];
    }
    else
    {
      v29 = [[SBRecalibrateProximitySensorHardwareButtonInteraction alloc] initWithProximitySensorManager:*p_proximitySensorManager];
      v30 = v8->_proximitySensorButtonInteraction;
      v8->_proximitySensorButtonInteraction = (SBHardwareButtonInteraction *)v29;

      [(SBHardwareButtonInteraction *)v8->_proximitySensorButtonInteraction addHardwareButtonGestureParametersObserver:v8];
      uint64_t v31 = [(SBHardwareButtonInteraction *)v8->_proximitySensorButtonInteraction hardwareButtonGestureParameters];
      v32 = v8->_proximitySensorGestureParameters;
      v8->_proximitySensorGestureParameters = (SBHardwareButtonGestureParameters *)v31;

      v28 = objc_alloc_init(SBSleepWakeHardwareButtonInteraction);
    }
    sleepWakeButtonInteraction = v8->_sleepWakeButtonInteraction;
    v8->_sleepWakeButtonInteraction = &v28->super;

    [(SBHardwareButtonGestureParametersProviderBase *)v8 addHardwareButtonGestureParametersObserver:v8->_sleepWakeButtonInteraction];
    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v8 selector:sel__registeredLockButtonAppsDidChange_ name:@"SBApplicationsRegisteredForLockButtonEventsChangedNotification" object:0];
  }
  return v8;
}

- (BOOL)reverseFadeOutIfNeeded
{
  return [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction reverseSleepIfNeededAndPossible];
}

- (void)performSOSGestureBeganActions
{
}

- (void)performSOSGestureEndedActions
{
}

- (void)performFinalButtonUpActions
{
  if (objc_opt_respondsToSelector()) {
    [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction observeFinalPressUp];
  }
  if (objc_opt_respondsToSelector())
  {
    sleepWakeButtonInteraction = self->_sleepWakeButtonInteraction;
    [(SBSleepWakeHardwareButtonInteraction *)sleepWakeButtonInteraction observeFinalPressUp];
  }
}

- (void)performInitialButtonDownActions
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  v5 = SBSafeCast(v4, self->_siriButtonInteraction);
  if (v5) {
    [v5 setInitialPressDownTime:CFAbsoluteTimeGetCurrent()];
  }
  self->_isButtonDown = 1;
  v6 = dispatch_get_global_queue(0, 0);
  dispatch_async(v6, &__block_literal_global_17);

  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(SBHardwareButtonInteraction *)self->_proximitySensorButtonInteraction consumeInitialPressDown])
  {
    v10 = [(id)SBApp windowSceneManager];
    id v7 = [v10 activeDisplayWindowScene];

    uint64_t v11 = +[SBWorkspace mainWorkspace];
    v12 = [v11 transientOverlayPresentationManager];
    v8 = [v12 transientOverlayPresenterForWindowScene:v7];

    id v9 = [(id)SBApp systemApertureControllerForMainDisplay];
    if ([v9 handleLockButtonPress])
    {
      [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction setInhibitNextSinglePressUp:1];
      v13 = SBLogButtonsLock();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_44:

        goto LABEL_45;
      }
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v49 = v14;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because the system aperture controller is handling it", buf, 0xCu);
LABEL_43:

      goto LABEL_44;
    }
    aSelector = a2;
    v47 = v5;
    v13 = [(id)SBApp bannerManager];
    v15 = [v13 bannerWindowInWindowScene:v7];
    [v15 windowLevel];
    if (-[NSObject hasPresentationAboveWindowLevel:](v8, "hasPresentationAboveWindowLevel:"))
    {
    }
    else
    {
      int v16 = [v13 handleLockButtonPress];

      if (v16)
      {
        [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction setInhibitNextSinglePressUp:1];
        uint64_t v14 = SBLogButtonsLock();
        v5 = v47;
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_43;
        }
        v17 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138543362;
        v49 = v17;
        uint64_t v18 = "%{public}@ result: ignoring lock down because a banner manager is handling it";
LABEL_18:
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);

        goto LABEL_43;
      }
    }
    if ([v8 handleLockButtonPress])
    {
      [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction setInhibitNextSinglePressUp:1];
      uint64_t v14 = SBLogButtonsLock();
      v5 = v47;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      v17 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138543362;
      v49 = v17;
      uint64_t v18 = "%{public}@ result: ignoring lock down because a transient overlay is handling it";
      goto LABEL_18;
    }
    uint64_t v14 = [(id)SBApp lockOutController];
    if ([v14 isProximityReaderBlocked])
    {
      id v44 = v9;
      v19 = [(id)SBApp systemUIScenesCoordinator];
      uint64_t v20 = [v19 proximityReaderUISceneController];
      if ([v20 handleLockButtonPress])
      {
        v21 = v19;
        [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction setInhibitNextSinglePressUp:1];
        uint64_t v22 = SBLogButtonsLock();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138543362;
          v49 = v23;
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because a proximity reader is handling it", buf, 0xCu);
        }
        v5 = v47;
        v24 = v21;
        id v9 = v44;
        goto LABEL_42;
      }

      id v9 = v44;
    }
    v42 = v8;
    v45 = v14;
    v25 = +[SBLockScreenManager sharedInstance];
    uint64_t v26 = [v25 lockScreenEnvironment];
    v27 = [v26 buttonEventsHandler];

    v43 = v27;
    if ([v27 handleLockButtonPress])
    {
      v28 = SBLogButtonsLock();
      v24 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138543618;
        v49 = v29;
        __int16 v50 = 2114;
        id v51 = v27;
        _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because a lockscreen is handling it: %{public}@", buf, 0x16u);
      }
      v5 = v47;
      uint64_t v14 = v45;
      v8 = v42;
      goto LABEL_42;
    }
    v30 = +[SBLockScreenManager sharedInstance];
    int v31 = [v30 isSupressingLockButton];

    if (v31)
    {
      v32 = SBLogButtonsLock();
      v8 = v42;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138543362;
        v49 = v33;
        _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because lock button is supressed", buf, 0xCu);
      }
      [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction setInhibitNextSinglePressUp:1];
      v5 = v47;
      v24 = v43;
      uint64_t v14 = v45;
      goto LABEL_42;
    }

    v34 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    int v35 = [v34 handleLockButtonPress];

    v8 = v42;
    if (v35)
    {
      [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction setInhibitNextSinglePressUp:1];
      v24 = SBLogButtonsLock();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v36 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138543362;
        v49 = v36;
        _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because main switcher is handling it", buf, 0xCu);
      }
      v5 = v47;
    }
    else
    {
      uint64_t v14 = v45;
      if ([(SBLockHardwareButtonActions *)self _sendButtonDownToRegisteredApp])
      {
        v24 = SBLogButtonsLock();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v37 = NSStringFromSelector(aSelector);
          v38 = [(id)SBApp appsRegisteredForLockButtonEvents];
          v39 = [v38 firstObject];
          *(_DWORD *)buf = 138543618;
          v49 = v37;
          __int16 v50 = 2114;
          id v51 = v39;
          _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ result: registered app handled initial button down: %{public}@", buf, 0x16u);

          uint64_t v14 = v45;
        }
        v5 = v47;
        goto LABEL_42;
      }
      v5 = v47;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction consumeInitialPressDown])
      {
        v24 = SBLogButtonsLock();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        v40 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138543362;
        v49 = v40;
        v41 = "%{public}@ result: Siri handled it";
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ![(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction consumeInitialPressDown])
        {
          goto LABEL_43;
        }
        v24 = SBLogButtonsLock();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        v40 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138543362;
        v49 = v40;
        v41 = "%{public}@ result: Sleep/wake interaction handled it";
      }
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
    }
    uint64_t v14 = v45;
LABEL_42:

    goto LABEL_43;
  }
  id v7 = SBLogButtonsLock();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    v49 = v8;
    __int16 v50 = 2114;
    id v51 = (id)objc_opt_class();
    id v9 = v51;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because %{public}@ handled it", buf, 0x16u);
LABEL_45:
  }
}

uint64_t __62__SBLockHardwareButtonActions_performInitialButtonDownActions__block_invoke()
{
  return +[SBMediaController sendResetPlaybackTimeoutCommand];
}

- (void)performInitialButtonUpActions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction consumeInitialPressUp];
    uint64_t v4 = SBLogButtonsLock();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = NSStringFromSelector(a2);
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: Sleep/wake interaction handled it", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)performSecondButtonDownActions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction consumeSecondPressDown];
    uint64_t v4 = SBLogButtonsLock();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = NSStringFromSelector(a2);
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: Sleep/wake interaction handled it", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)performLongPressActions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_lastLockButtonEventRecipient)
  {
    v3 = SBLogButtonsLock();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: ignored because there's a lock button recipient waiting for an up event";
LABEL_13:
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v18, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ([(SBHardwareButtonService *)self->_hardwareButtonService consumeLockButtonLongPressWithPriority:0])
  {
    v3 = SBLogButtonsLock();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: button consumer app handled it";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  id v7 = +[SBSyncController sharedInstance];
  int v8 = [v7 isRestoring];

  if (v8)
  {
    v3 = SBLogButtonsLock();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: ignored because we're restoring";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v9 = +[SBSyncController sharedInstance];
  int v10 = [v9 isResetting];

  if (v10)
  {
    v3 = SBLogButtonsLock();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v4;
      v5 = "%{public}@ result: ignored because we're resetting";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (self->_homeButtonType != 2)
  {
    v3 = [(id)SBApp homeHardwareButton];
    int v13 = [v3 isButtonDown];
    uint64_t v14 = SBLogButtonsLock();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        int v16 = NSStringFromSelector(a2);
        int v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignored because home button is down", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      if (v15)
      {
        v17 = NSStringFromSelector(a2);
        int v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ result: showing power down transient overlay", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v14 = +[SBWorkspace mainWorkspace];
      [v14 presentPowerDownTransientOverlay];
    }

    goto LABEL_14;
  }
  uint64_t v11 = SBLogButtonsLock();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    int v18 = 138543362;
    v19 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ result: sending to Siri", (uint8_t *)&v18, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction consumeLongPress];
  }
}

- (void)_showPowerDownTransientOverlayOnForceReset
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL isButtonDown = self->_isButtonDown;
  uint64_t v4 = SBLogButtonsLock();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isButtonDown)
  {
    if (v5)
    {
      int v6 = NSStringFromSelector(a2);
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: showing power down transient overlay now", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v4 = +[SBWorkspace mainWorkspace];
    [v4 presentPowerDownTransientOverlay];
  }
  else if (v5)
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: button isn't down anymore, not showing power down transient overlay", (uint8_t *)&v8, 0xCu);
  }
}

- (void)performForceResetSequenceBeganActions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SBLogButtonsLock();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = NSStringFromSelector(a2);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: showing power down transient overlay soon", (uint8_t *)&v6, 0xCu);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showPowerDownTransientOverlayOnForceReset object:0];
  [(SBLockHardwareButtonActions *)self performSelector:sel__showPowerDownTransientOverlayOnForceReset withObject:0 afterDelay:0.35];
}

- (void)performSinglePressDidFailActions
{
  if (objc_opt_respondsToSelector())
  {
    sleepWakeButtonInteraction = self->_sleepWakeButtonInteraction;
    [(SBSleepWakeHardwareButtonInteraction *)sleepWakeButtonInteraction observeSinglePressDidFail];
  }
}

- (BOOL)performButtonUpPreActions
{
  self->_BOOL isButtonDown = 0;
  [(SBLockHardwareButtonActions *)self _sendButtonUpToRegisteredApp];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showPowerDownTransientOverlayOnForceReset object:0];
  return 1;
}

- (void)performSinglePressAction
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction observeFinalPressUp];
  }
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4FA7A70] object:0];

  if ([(SBLockHardwareButtonActions *)self _sendButtonUpToRegisteredApp])
  {
    BOOL v5 = SBLogButtonsLock();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)v17 = 138543362;
      *(void *)&v17[4] = v6;
      id v7 = "%{public}@ result: registered app handled it";
LABEL_21:
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, v7, v17, 0xCu);
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if ([(SBLockHardwareButtonActions *)self _isSOSActive] && self->_sosTriggerMechanism == 3)
  {
    [(SOSManager *)self->_sosManager dismissSOSWithCompletion:&__block_literal_global_80];
    BOOL v5 = SBLogButtonsLock();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)v17 = 138543362;
      *(void *)&v17[4] = v6;
      id v7 = "%{public}@ result: SOS dismiss handled it";
      goto LABEL_21;
    }
LABEL_23:

    char v9 = 1;
    goto LABEL_24;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(SBHardwareButtonInteraction *)self->_proximitySensorButtonInteraction consumeSinglePressUp])
  {
    BOOL v5 = SBLogButtonsLock();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)v17 = 138543618;
      *(void *)&v17[4] = v6;
      *(_WORD *)&v17[12] = 2114;
      *(void *)&v17[14] = objc_opt_class();
      id v8 = *(id *)&v17[14];
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ result: %{public}@ handled it", v17, 0x16u);

LABEL_22:
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if ([(SBHardwareButtonService *)self->_hardwareButtonService consumeLockButtonSinglePressUpWithPriority:0])
  {
    BOOL v5 = SBLogButtonsLock();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)v17 = 138543362;
      *(void *)&v17[4] = v6;
      id v7 = "%{public}@ result: button consumer app handled it";
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction consumeSinglePressUp])
  {
    BOOL v5 = SBLogButtonsLock();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = NSStringFromSelector(a2);
      *(_DWORD *)v17 = 138543362;
      *(void *)&v17[4] = v6;
      id v7 = "%{public}@ result: Siri handled it";
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  char v9 = 0;
LABEL_24:
  if ([(SBLockHardwareButtonActions *)self _isSOSActive])
  {
    uint64_t v10 = SBLogButtonsLock();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      *(_DWORD *)v17 = 138543362;
      *(void *)&v17[4] = v11;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignored because _isSOSActive", v17, 0xCu);
    }
    char v9 = 1;
  }
  v12 = +[SBMainWorkspace sharedInstance];
  int v13 = [v12 isPowerDownTransientOverlayTopmost];

  if (v13)
  {
    uint64_t v14 = SBLogButtonsLock();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_32:

      return;
    }
    BOOL v15 = NSStringFromSelector(a2);
    *(_DWORD *)v17 = 138543362;
    *(void *)&v17[4] = v15;
    int v16 = "%{public}@ result: ignored because power down alert is topmost";
LABEL_31:
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, v16, v17, 0xCu);

    goto LABEL_32;
  }
  if ((v9 & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction consumeSinglePressUp])
  {
    uint64_t v14 = SBLogButtonsLock();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    BOOL v15 = NSStringFromSelector(a2);
    *(_DWORD *)v17 = 138543362;
    *(void *)&v17[4] = v15;
    int v16 = "%{public}@ result: Sleep/wake interaction handled it";
    goto LABEL_31;
  }
}

- (void)performDoublePressActions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction observeFinalPressUp];
  }
  uint64_t v4 = +[SBWorkspace mainWorkspace];
  BOOL v5 = [v4 transientOverlayPresentationManager];

  if (+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported")|| ![v5 handleLockButtonPress])
  {
    char v8 = 0;
  }
  else
  {
    int v6 = SBLogButtonsLock();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ result: transient overlay is handling it as a separate single press", (uint8_t *)&v18, 0xCu);
    }
    char v8 = 1;
  }
  if ([(SBLockHardwareButtonActions *)self _isSOSActive])
  {
    char v9 = SBLogButtonsLock();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignored because SOS is active", (uint8_t *)&v18, 0xCu);
    }
    char v8 = 1;
  }
  uint64_t v11 = +[SBMainWorkspace sharedInstance];
  int v12 = [v11 isPowerDownTransientOverlayTopmost];

  if (v12)
  {
    int v13 = SBLogButtonsLock();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v14;
      BOOL v15 = "%{public}@ result: ignored because power down alert is topmost";
LABEL_27:
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, 0xCu);

      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if ((v8 & 1) == 0)
  {
    [MEMORY[0x1E4F30B50] notifyEvent:0];
    if ([(SBHardwareButtonService *)self->_hardwareButtonService consumeLockButtonDoublePressUpWithPriority:0])
    {
      int v13 = SBLogButtonsLock();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = NSStringFromSelector(a2);
        int v18 = 138543362;
        v19 = v14;
        BOOL v15 = "%{public}@ result: button consumer app handled it";
        goto LABEL_27;
      }
LABEL_28:

      goto LABEL_29;
    }
    if (![(SBWalletPreArmController *)self->_walletPreArmController isPreArmTriggeredByLockButtonDoublePress]|| ![(SBWalletPreArmController *)self->_walletPreArmController isPreArmAllowed])
    {
      int v13 = SBLogButtonsLock();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = NSStringFromSelector(a2);
        int v18 = 138543362;
        v19 = v14;
        BOOL v15 = "%{public}@ result: ignored";
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    int v16 = SBLogButtonsLock();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = NSStringFromSelector(a2);
      int v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ result: presenting wallet pre-arm", (uint8_t *)&v18, 0xCu);
    }
    [(SBWalletPreArmController *)self->_walletPreArmController presentPreArmInterfaceForWalletConsumer];
  }
LABEL_29:
}

- (void)performTriplePressActions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction observeFinalPressUp];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(SBAccessibilityHardwareButtonInteraction *)self->_accessibilityButtonInteraction consumeTriplePressUp])
  {
    uint64_t v4 = SBLogButtonsLock();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = NSStringFromSelector(a2);
      int v7 = 138543362;
      char v8 = v5;
      int v6 = "%{public}@ result: accessibility handled it";
LABEL_9:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = SBLogButtonsLock();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = NSStringFromSelector(a2);
      int v7 = 138543362;
      char v8 = v5;
      int v6 = "%{public}@ result: ignored";
      goto LABEL_9;
    }
  }
}

- (void)performSOSActionsWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  self->_sosTriggerMechanism = a4;
  uint64_t v10 = +[SBAlertItemsController sharedInstance];
  int v11 = [v10 hasVisibleSuperModalAlert];

  if (v11)
  {
    int v12 = SBLogButtonsLock();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBLockHardwareButtonActions performSOSActionsWithUUID:triggerMechanism:completion:](v12);
    }

    if (v9) {
      v9[2](v9, 0);
    }
  }
  else
  {
    int v13 = dispatch_get_global_queue(21, 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke;
    v14[3] = &unk_1E6AF74C0;
    v14[4] = self;
    id v15 = v8;
    int64_t v17 = a4;
    int v16 = v9;
    dispatch_async(v13, v14);
  }
}

void __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F97B88];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke_2;
  v5[3] = &unk_1E6AF7498;
  objc_copyWeak(&v7, &location);
  id v6 = *(id *)(a1 + 48);
  [v2 triggerSOSWithUUID:v3 triggerMechanism:v4 completion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    BSDispatchMain();
  }
}

uint64_t __85__SBLockHardwareButtonActions_performSOSActionsWithUUID_triggerMechanism_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSOSDidTriggerActions];
}

- (void)performLongPressCancelledActions
{
  uint64_t v3 = SBLogButtonsLock();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Performing long press cancelled actions", v4, 2u);
  }

  if (objc_opt_respondsToSelector()) {
    [(SBSiriHardwareButtonInteraction *)self->_siriButtonInteraction observeLongPressCanceled];
  }
}

- (void)performTerminalLockLongPressActions
{
}

- (void)performKeyboardShortcut
{
  [(SBSleepWakeHardwareButtonInteraction *)self->_sleepWakeButtonInteraction setInhibitNextSinglePressUp:0];
  [(SBLockHardwareButtonActions *)self performSinglePressAction];
}

- (BOOL)_shouldWaitForDoublePress
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBWalletPreArmController *)self->_walletPreArmController isPreArmTriggeredByLockButtonDoublePress];
  if (v3)
  {
    BOOL v4 = [(SBWalletPreArmController *)self->_walletPreArmController isPreArmAvailable];
    BOOL v5 = [(SBWalletPreArmController *)self->_walletPreArmController isPreArmExternallySuppressed];
  }
  else
  {
    BOOL v4 = 0;
    BOOL v5 = 0;
  }
  uint64_t v6 = [(SBHardwareButtonGestureParameters *)self->_accessibilityGestureParameters maximumPressCount];
  BOOL v7 = [(SBHardwareButtonService *)self->_hardwareButtonService hasConsumersForLockButtonDoublePressUp];
  BOOL v8 = v7;
  int v9 = v4 || v5;
  if (v6 > 2) {
    int v9 = 1;
  }
  int v10 = v9 | v7;
  int v11 = SBLogButtonsLock();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67110400;
    v13[1] = v10;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    __int16 v18 = 1024;
    BOOL v19 = v5;
    __int16 v20 = 1024;
    BOOL v21 = v6 > 2;
    __int16 v22 = 1024;
    BOOL v23 = v8;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Lock button single press should wait for double-press timeout: %{BOOL}u  (preArmDevice: %{BOOL}u preArmAvailable: %{BOOL}u preArmSuppressed: %{BOOL}u axTripleClickEnabled: %{BOOL}u buttonConsumer: %{BOOL}u)", (uint8_t *)v13, 0x26u);
  }

  return v10;
}

- (BOOL)disallowsSinglePressForReason:(id *)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  proximitySensorButtonInteraction = self->_proximitySensorButtonInteraction;
  return [(SBHardwareButtonInteraction *)proximitySensorButtonInteraction disallowsSinglePressForReason:a3];
}

- (BOOL)disallowsDoublePressForReason:(id *)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(SBHardwareButtonInteraction *)self->_proximitySensorButtonInteraction disallowsDoublePressForReason:a3] & 1) == 0)
  {
    BOOL v5 = +[SBWorkspace mainWorkspace];
    uint64_t v6 = [v5 inCallPresentationManager];
    char v7 = [v6 disallowsLockHardwareButtonDoublePress];

    if (v7)
    {
      BOOL v8 = @"InCall handling all device lock button presses";
    }
    else
    {
      if ([(SBLockHardwareButtonActions *)self _shouldWaitForDoublePress]) {
        return 0;
      }
      BOOL v8 = @"nothing active wants it";
    }
    *a3 = v8;
  }
  return 1;
}

- (BOOL)disallowsTriplePressForReason:(id *)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(SBHardwareButtonInteraction *)self->_proximitySensorButtonInteraction disallowsTriplePressForReason:a3] & 1) != 0)
  {
    return 1;
  }
  if ([(SBHardwareButtonGestureParameters *)self->_accessibilityGestureParameters maximumPressCount] <= 2)
  {
    *a3 = @"nothing active wants it";
    return 1;
  }
  return 0;
}

- (BOOL)disallowsLongPressForReason:(id *)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  proximitySensorButtonInteraction = self->_proximitySensorButtonInteraction;
  return [(SBHardwareButtonInteraction *)proximitySensorButtonInteraction disallowsLongPressForReason:a3];
}

- (BOOL)shouldBeginDoublePressGestureWhileObjectWithinProximity
{
  if (self->_homeButtonType == 2) {
    return 1;
  }
  else {
    return MGGetBoolAnswer() ^ 1;
  }
}

- (id)hardwareButtonGestureParameters
{
  BOOL v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  if ([(SBLockHardwareButtonActions *)self _usesLockButtonForSecureIntent])
  {
    [(SBHardwareButtonGestureParameters *)self->_accessibilityGestureParameters multiplePressTimeInterval];
    double v5 = v4;
    uint64_t v6 = [(SBLockHardwareButtonActions *)self _foregroundAppRegisteredForLockButtonEvents];
    if (v6)
    {
      int64_t v7 = 1;
    }
    else
    {
      int64_t v7 = [(SBHardwareButtonGestureParameters *)self->_accessibilityGestureParameters maximumPressCount];
      int64_t v8 = [(SBHardwareButtonGestureParameters *)self->_proximitySensorGestureParameters maximumPressCount];
      if (v8) {
        int64_t v7 = v8;
      }
    }
  }
  else
  {
    int64_t v7 = 1;
    double v5 = 0.3;
  }
  double v9 = 2.5;
  if ([(SBLockHardwareButtonActions *)self _usesLockButtonForSiri])
  {
    [(SBHardwareButtonGestureParameters *)self->_siriGestureParameters longPressTimeInterval];
    if (v10 <= 0.0) {
      double v9 = 0.4;
    }
    else {
      double v9 = v10;
    }
  }
  [(SBMutableHardwareButtonGestureParameters *)v3 setMaximumPressCount:v7];
  [(SBMutableHardwareButtonGestureParameters *)v3 setMultiplePressTimeInterval:v5];
  [(SBMutableHardwareButtonGestureParameters *)v3 setLongPressTimeInterval:v9];
  return v3;
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  uint64_t v6 = (SBAccessibilityHardwareButtonInteraction *)a3;
  id v7 = a4;
  if (self->_accessibilityButtonInteraction == v6)
  {
    int64_t v8 = SBLogButtonsHome();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "reconfiguring due to AX prefs change", buf, 2u);
    }

    objc_storeStrong((id *)&self->_accessibilityGestureParameters, a4);
  }
  if ((SBAccessibilityHardwareButtonInteraction *)self->_siriButtonInteraction == v6)
  {
    double v9 = SBLogButtonsHome();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "reconfiguring due to Siri prefs change", v13, 2u);
    }

    objc_storeStrong((id *)&self->_siriGestureParameters, a4);
  }
  if ((SBAccessibilityHardwareButtonInteraction *)self->_proximitySensorButtonInteraction == v6)
  {
    double v10 = SBLogButtonsHome();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "reconfiguring due to proximitySensor change", v12, 2u);
    }

    objc_storeStrong((id *)&self->_proximitySensorGestureParameters, a4);
  }
  int v11 = [(SBLockHardwareButtonActions *)self hardwareButtonGestureParameters];
  [(SBHardwareButtonGestureParametersProviderBase *)self publishUpdatedParameters:v11];
}

- (void)_performSOSDidTriggerActions
{
  if ([(SBLockHardwareButtonActions *)self isButtonDown])
  {
    sleepWakeButtonInteraction = self->_sleepWakeButtonInteraction;
    [(SBSleepWakeHardwareButtonInteraction *)sleepWakeButtonInteraction setInhibitNextSinglePressUp:1];
  }
}

- (BOOL)_isSOSActive
{
  return [(SOSManager *)self->_sosManager currentSOSInitiationState] == 1;
}

- (void)_registeredLockButtonAppsDidChange:(id)a3
{
  id v4 = [(SBLockHardwareButtonActions *)self hardwareButtonGestureParameters];
  [(SBHardwareButtonGestureParametersProviderBase *)self publishUpdatedParameters:v4];
}

- (id)_foregroundAppRegisteredForLockButtonEvents
{
  v2 = [(id)SBApp appsRegisteredForLockButtonEvents];
  BOOL v3 = [v2 firstObject];

  if (v3 && SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v3)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_sendButtonUpToRegisteredApp
{
  lastLockButtonEventRecipient = self->_lastLockButtonEventRecipient;
  if (lastLockButtonEventRecipient)
  {
    [(SBLockHardwareButtonActions *)self _sendButtonEventToApp:self->_lastLockButtonEventRecipient down:0];
    id v4 = self->_lastLockButtonEventRecipient;
    self->_lastLockButtonEventRecipient = 0;
  }
  return lastLockButtonEventRecipient != 0;
}

- (BOOL)_sendButtonDownToRegisteredApp
{
  BOOL v3 = [(SBLockHardwareButtonActions *)self _foregroundAppRegisteredForLockButtonEvents];
  if (v3)
  {
    objc_storeStrong((id *)&self->_lastLockButtonEventRecipient, v3);
    [(SBLockHardwareButtonActions *)self _sendButtonEventToApp:self->_lastLockButtonEventRecipient down:1];
  }

  return v3 != 0;
}

- (void)_sendButtonEventToApp:(id)a3 down:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 bundleIdentifier];
  int64_t v8 = [v6 processState];

  int v9 = [v8 pid];
  double v10 = SBLogButtonsLock();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = NSStringFromSelector(a2);
    int v12 = 138543618;
    int v13 = v11;
    __int16 v14 = 2114;
    BOOL v15 = v7;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ result: sending to %{public}@", (uint8_t *)&v12, 0x16u);
  }
  SBSendFakeButtonPressEventToApplication(v7, v9, 104, v4);
}

- (BOOL)_usesLockButtonForSecureIntent
{
  return MGGetBoolAnswer();
}

- (BOOL)_usesLockButtonForSiri
{
  return self->_homeButtonType == 2;
}

- (BOOL)isButtonDown
{
  return self->_isButtonDown;
}

- (SBSiriHardwareButtonInteraction)siriButtonInteraction
{
  return self->_siriButtonInteraction;
}

- (void)setSiriButtonInteraction:(id)a3
{
}

- (SBAccessibilityHardwareButtonInteraction)accessibilityButtonInteraction
{
  return self->_accessibilityButtonInteraction;
}

- (void)setAccessibilityButtonInteraction:(id)a3
{
}

- (SBSleepWakeHardwareButtonInteraction)sleepWakeButtonInteraction
{
  return self->_sleepWakeButtonInteraction;
}

- (void)setSleepWakeButtonInteraction:(id)a3
{
}

- (SBHardwareButtonInteraction)proximitySensorButtonInteraction
{
  return self->_proximitySensorButtonInteraction;
}

- (void)setProximitySensorButtonInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySensorButtonInteraction, 0);
  objc_storeStrong((id *)&self->_sleepWakeButtonInteraction, 0);
  objc_storeStrong((id *)&self->_accessibilityButtonInteraction, 0);
  objc_storeStrong((id *)&self->_siriButtonInteraction, 0);
  objc_storeStrong((id *)&self->_proximitySensorGestureParameters, 0);
  objc_storeStrong((id *)&self->_siriGestureParameters, 0);
  objc_storeStrong((id *)&self->_accessibilityGestureParameters, 0);
  objc_storeStrong((id *)&self->_sosManager, 0);
  objc_storeStrong((id *)&self->_walletPreArmController, 0);
  objc_storeStrong((id *)&self->_hardwareButtonService, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_lastLockButtonEventRecipient, 0);
}

- (void)performSOSActionsWithUUID:(os_log_t)log triggerMechanism:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SOS activation request rejected because there is a super modal alert visible.", v1, 2u);
}

@end