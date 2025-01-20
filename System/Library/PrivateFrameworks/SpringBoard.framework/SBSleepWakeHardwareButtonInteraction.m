@interface SBSleepWakeHardwareButtonInteraction
- (BOOL)consumeInitialPressDown;
- (BOOL)consumeSinglePressUp;
- (BOOL)fadeOutInProgressFromLockButtonWhileUnlocked;
- (BOOL)inhibitNextSinglePressUp;
- (BOOL)isSOSGestureActive;
- (BOOL)reverseSleepIfNeededAndPossible;
- (BOOL)undidFadeOutFromLockButton;
- (BSInvalidatable)deferOrientationUpdatesAssertion;
- (SBBacklightController)backlightController;
- (SBHIDUISensorModeController)sensorModeController;
- (SBLockScreenManager)lockScreenManager;
- (SBScreenWakeAnimationController)screenWakeAnimationController;
- (SBSleepWakeHardwareButtonInteraction)init;
- (SBSoundController)soundController;
- (SpringBoard)SBApp;
- (double)multiplePressTimeInterval;
- (void)_performSleep;
- (void)_performWake;
- (void)_playLockSound;
- (void)performSleepForReason:(id)a3;
- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4;
- (void)setBacklightController:(id)a3;
- (void)setDeferOrientationUpdatesAssertion:(id)a3;
- (void)setFadeOutInProgressFromLockButtonWhileUnlocked:(BOOL)a3;
- (void)setInhibitNextSinglePressUp:(BOOL)a3;
- (void)setLockScreenManager:(id)a3;
- (void)setMultiplePressTimeInterval:(double)a3;
- (void)setSBApp:(id)a3;
- (void)setSOSGestureActive:(BOOL)a3;
- (void)setScreenWakeAnimationController:(id)a3;
- (void)setSensorModeController:(id)a3;
- (void)setSoundController:(id)a3;
- (void)setUndidFadeOutFromLockButton:(BOOL)a3;
@end

@implementation SBSleepWakeHardwareButtonInteraction

- (SBSleepWakeHardwareButtonInteraction)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBSleepWakeHardwareButtonInteraction;
  v2 = [(SBSleepWakeHardwareButtonInteraction *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[SBBacklightController sharedInstance];
    backlightController = v2->_backlightController;
    v2->_backlightController = (SBBacklightController *)v3;

    uint64_t v5 = +[SBLockScreenManager sharedInstance];
    lockScreenManager = v2->_lockScreenManager;
    v2->_lockScreenManager = (SBLockScreenManager *)v5;

    uint64_t v7 = +[SBScreenWakeAnimationController sharedInstance];
    screenWakeAnimationController = v2->_screenWakeAnimationController;
    v2->_screenWakeAnimationController = (SBScreenWakeAnimationController *)v7;

    uint64_t v9 = +[SBSoundController sharedInstance];
    soundController = v2->_soundController;
    v2->_soundController = (SBSoundController *)v9;

    uint64_t v11 = [(id)SBApp HIDUISensorController];
    sensorModeController = v2->_sensorModeController;
    v2->_sensorModeController = (SBHIDUISensorModeController *)v11;

    objc_storeStrong((id *)&v2->_SBApp, (id)SBApp);
  }
  return v2;
}

- (BOOL)reverseSleepIfNeededAndPossible
{
  v12[2] = *MEMORY[0x1E4F143B8];
  BOOL fadeOutInProgressFromLockButtonWhileUnlocked = self->_fadeOutInProgressFromLockButtonWhileUnlocked;
  if (self->_fadeOutInProgressFromLockButtonWhileUnlocked)
  {
    self->_undidFadeOutFromLockButton = 1;
    v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "reverse sleep", v10, 2u);
    }

    [(SBLockScreenManager *)self->_lockScreenManager lockUIFromSource:1 withOptions:0];
    lockScreenManager = self->_lockScreenManager;
    v11[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    v6 = [NSNumber numberWithBool:1];
    v12[0] = v6;
    v11[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
    uint64_t v7 = [NSNumber numberWithBool:1];
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(SBLockScreenManager *)lockScreenManager unlockUIFromSource:1 withOptions:v8];

    self->_undidFadeOutFromLockButton = 0;
  }
  return fadeOutInProgressFromLockButtonWhileUnlocked;
}

- (void)performSleepForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL inhibitNextSinglePressUp = self->_inhibitNextSinglePressUp;
  v6 = SBLogButtonsInteraction();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (inhibitNextSinglePressUp)
  {
    if (v7)
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "ignoring sleep attempt (%{public}@) because a wake from button press is in progress", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "sleeping (%{public}@)", (uint8_t *)&v8, 0xCu);
    }

    [(SBSleepWakeHardwareButtonInteraction *)self _performSleep];
  }
}

- (BOOL)consumeInitialPressDown
{
  self->_BOOL inhibitNextSinglePressUp = 0;
  BOOL v3 = [(SBBacklightController *)self->_backlightController screenIsDim];
  id v4 = +[SBAlwaysOnDomain rootSettings];
  if ([v4 sideButtonBehavior] == 1)
  {
    int64_t v5 = [(SBBacklightController *)self->_backlightController backlightState];

    if (v5 == 3 || !v3) {
      return 0;
    }
  }
  else
  {

    if (!v3) {
      return 0;
    }
  }
  [(SBSleepWakeHardwareButtonInteraction *)self _performWake];
  return 1;
}

- (BOOL)consumeSinglePressUp
{
  BOOL inhibitNextSinglePressUp = self->_inhibitNextSinglePressUp;
  id v4 = SBLogButtonsInteraction();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (inhibitNextSinglePressUp)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "wake/sleep consumeSinglePressUp: ignored due to _inhibitNextSinglePressUp (we may be waking the device instead)", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "wake/sleep _performSleep", v7, 2u);
    }

    [(SBSleepWakeHardwareButtonInteraction *)self _performSleep];
  }
  return 1;
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  objc_msgSend(a4, "multiplePressTimeInterval", a3);
  -[SBSleepWakeHardwareButtonInteraction setMultiplePressTimeInterval:](self, "setMultiplePressTimeInterval:");
}

- (void)_performWake
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(SpringBoard *)self->_SBApp shouldNeverLock])
  {
    BOOL v3 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "performWake: ignoring because -[SBApp shouldNeverLock]", buf, 2u);
    }

    [(SBBacklightController *)self->_backlightController screenIsDim];
    return;
  }
  if (![(SBBacklightController *)self->_backlightController screenIsDim])
  {
    id v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v5 = "performWake: ignoring because the screen is not dimmed";
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  if ([(SpringBoard *)self->_SBApp caseIsEnabledAndLatched])
  {
    id v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v5 = "performWake: ignoring because case is on and closed";
LABEL_11:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (![(SBSleepWakeHardwareButtonInteraction *)self reverseSleepIfNeededAndPossible])
  {
    [(SBBacklightController *)self->_backlightController setBacklightState:3 source:3];
    BOOL v7 = self->_lockScreenManager;
    if ([(SBLockScreenManager *)v7 isUILocked])
    {
      int v8 = SBLogButtonsInteraction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = 1;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "performWake: Unlocking from lock button source with fade-in animation: %d", buf, 8u);
      }

      id v9 = objc_msgSend(NSNumber, "numberWithBool:", 1, @"SBUIUnlockOptionsTurnOnScreenFirstKey");
      v15[0] = v9;
      v14[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
      uint64_t v10 = [NSNumber numberWithBool:1];
      v15[1] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      [(SBLockScreenManager *)v7 unlockUIFromSource:1 withOptions:v11];
    }
    else
    {
      BOOL v12 = [(SBSleepWakeHardwareButtonInteraction *)self isSOSGestureActive];
      id v9 = SBLogButtonsInteraction();
      BOOL v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (!v12)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "performWake: locking UI from lock button source.", buf, 2u);
        }

        [(SBLockScreenManager *)self->_lockScreenManager lockUIFromSource:1 withOptions:0];
        goto LABEL_29;
      }
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "performWake: aborting locking UI because the SOS gesture is active", buf, 2u);
      }
    }

LABEL_29:
    self->_BOOL inhibitNextSinglePressUp = 1;

    return;
  }
  v6 = SBLogButtonsInteraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "performWake: ended fade-out to lock early, and told the screen to fade-in back in right away.", buf, 2u);
  }

  self->_BOOL inhibitNextSinglePressUp = 1;
}

- (void)_performSleep
{
  BOOL v3 = self->_lockScreenManager;
  if ([(SpringBoard *)self->_SBApp shouldNeverLock])
  {
    id v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      BOOL v5 = "performSleep: ignored due to [SBApp shouldNeverLock]";
LABEL_10:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ([(SpringBoard *)self->_SBApp caseIsEnabledAndLatched])
  {
    id v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      BOOL v5 = "performSleep: ignored due to [SBApp caseIsEnabledAndLatched]";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if ([(SBSleepWakeHardwareButtonInteraction *)self isSOSGestureActive])
  {
    id v4 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      BOOL v5 = "performSleep: ignored due to isSOSGestureActive";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  BOOL v6 = !+[SBInCallPresentationManager isSpecializedAPISupported]&& [(SBLockScreenManager *)v3 shouldLockUIAfterEndingCall];
  [(SBSleepWakeHardwareButtonInteraction *)self _playLockSound];
  BOOL v7 = [(id)SBApp bannerManager];
  [v7 dismissAllBannersInAllWindowScenesAnimated:1 reason:@"performSleep"];

  int v8 = +[SBWorkspace mainWorkspace];
  id v9 = [v8 inCallPresentationManager];
  if ([v9 supportsHandlingDeviceLock])
  {

LABEL_19:
    uint64_t v11 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "performSleep: in call supports handling device lock, passing to lock screen manager", (uint8_t *)buf, 2u);
    }

    [(SBLockScreenManager *)v3 lockUIFromSource:1 withOptions:0];
    goto LABEL_12;
  }
  char v10 = v6 & ~+[SBInCallPresentationManager isSpecializedAPISupported];

  if (v10) {
    goto LABEL_19;
  }
  BOOL v12 = [(SBScreenWakeAnimationController *)self->_screenWakeAnimationController isWakeAnimationInProgressForSource:20];
  BOOL v13 = SBLogButtonsInteraction();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "performSleep: swallowing lock button press because we are in the process of fading in for LTW", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v14)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "performSleep: locking the device with lock button source and animating fade-out", (uint8_t *)buf, 2u);
    }

    BOOL v13 = objc_msgSend(NSString, "stringWithFormat:", @"SBLockForScreenFadeOut-%i", ++_performSleep_lockReasonCount);
    v15 = [(SpringBoard *)self->_SBApp authenticationController];
    self->_BOOL fadeOutInProgressFromLockButtonWhileUnlocked = [v15 isAuthenticated];

    v16 = [(SpringBoard *)self->_SBApp deviceOrientationUpdateDeferralAssertionWithReason:v13];
    [(SBSleepWakeHardwareButtonInteraction *)self setDeferOrientationUpdatesAssertion:v16];

    int v17 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "performSleep: start sleep", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    uint64_t v18 = [(id)SBApp screenSleepCoordinator];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__SBSleepWakeHardwareButtonInteraction__performSleep__block_invoke;
    v19[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v20, buf);
    [v18 sleepAndLockUIFromSource:1 completion:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }

LABEL_12:
}

void __53__SBSleepWakeHardwareButtonInteraction__performSleep__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFadeOutInProgressFromLockButtonWhileUnlocked:0];
  [WeakRetained setDeferOrientationUpdatesAssertion:0];
}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
  BOOL v5 = (BSInvalidatable *)a3;
  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  p_deferOrientationUpdatesAssertion = &self->_deferOrientationUpdatesAssertion;
  BOOL v6 = deferOrientationUpdatesAssertion;
  if (deferOrientationUpdatesAssertion != v5)
  {
    id v9 = v5;
    if (v6) {
      [(BSInvalidatable *)v6 invalidate];
    }
    objc_storeStrong((id *)p_deferOrientationUpdatesAssertion, a3);
    BOOL v5 = v9;
  }
}

- (void)_playLockSound
{
  BOOL v2 = [(SBLockScreenManager *)self->_lockScreenManager playLockSoundIfPermitted];
  BOOL v3 = SBLogButtonsInteraction();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      BOOL v5 = "_playLockSound is playing the lock sound";
      BOOL v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v7 = 0;
    BOOL v5 = "_playLockSound couldn't play the lock sound";
    BOOL v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }
}

- (BOOL)inhibitNextSinglePressUp
{
  return self->_inhibitNextSinglePressUp;
}

- (void)setInhibitNextSinglePressUp:(BOOL)a3
{
  self->_BOOL inhibitNextSinglePressUp = a3;
}

- (BOOL)isSOSGestureActive
{
  return self->_SOSGestureActive;
}

- (void)setSOSGestureActive:(BOOL)a3
{
  self->_SOSGestureActive = a3;
}

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (void)setBacklightController:(id)a3
{
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
}

- (SBScreenWakeAnimationController)screenWakeAnimationController
{
  return self->_screenWakeAnimationController;
}

- (void)setScreenWakeAnimationController:(id)a3
{
}

- (SBSoundController)soundController
{
  return self->_soundController;
}

- (void)setSoundController:(id)a3
{
}

- (SBHIDUISensorModeController)sensorModeController
{
  return self->_sensorModeController;
}

- (void)setSensorModeController:(id)a3
{
}

- (SpringBoard)SBApp
{
  return self->_SBApp;
}

- (void)setSBApp:(id)a3
{
}

- (double)multiplePressTimeInterval
{
  return self->_multiplePressTimeInterval;
}

- (void)setMultiplePressTimeInterval:(double)a3
{
  self->_multiplePressTimeInterval = a3;
}

- (BOOL)fadeOutInProgressFromLockButtonWhileUnlocked
{
  return self->_fadeOutInProgressFromLockButtonWhileUnlocked;
}

- (void)setFadeOutInProgressFromLockButtonWhileUnlocked:(BOOL)a3
{
  self->_BOOL fadeOutInProgressFromLockButtonWhileUnlocked = a3;
}

- (BOOL)undidFadeOutFromLockButton
{
  return self->_undidFadeOutFromLockButton;
}

- (void)setUndidFadeOutFromLockButton:(BOOL)a3
{
  self->_undidFadeOutFromLockButton = a3;
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_SBApp, 0);
  objc_storeStrong((id *)&self->_sensorModeController, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_storeStrong((id *)&self->_screenWakeAnimationController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

@end