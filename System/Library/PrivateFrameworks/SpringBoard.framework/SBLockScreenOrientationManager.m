@interface SBLockScreenOrientationManager
- (SBLockScreenOrientationManager)init;
- (void)_lockStateChanged:(id)a3;
- (void)_updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:(int64_t)a3;
- (void)assistantDidAppear:(id)a3 windowScene:(id)a4;
- (void)updateInterfaceOrientationWithRequestedOrientation:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation SBLockScreenOrientationManager

- (SBLockScreenOrientationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBLockScreenOrientationManager;
  v2 = [(SBLockScreenOrientationManager *)&v8 init];
  if (v2)
  {
    v3 = +[SBAssistantController sharedInstance];
    [v3 addObserver:v2];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
        goto LABEL_8;
      }
    }
    else
    {
      v5 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6)
      {
LABEL_8:

        return v2;
      }
    }
    [v4 addObserver:v2 selector:sel__lockStateChanged_ name:@"SBAggregateLockStateDidChangeNotification" object:0];
    goto LABEL_8;
  }
  return v2;
}

- (void)assistantDidAppear:(id)a3 windowScene:(id)a4
{
  id v10 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0)
  {
    v5 = +[SBLockScreenManager sharedInstance];
    uint64_t v6 = [v5 lockScreenEnvironment];
    v7 = [v6 rootViewController];

    if (objc_msgSend(v7, "bs_isAppearingOrAppeared"))
    {
      objc_super v8 = [v10 window];
      uint64_t v9 = [v8 interfaceOrientation];

      [(SBLockScreenOrientationManager *)self updateInterfaceOrientationWithRequestedOrientation:v9 animated:1];
    }
  }
}

- (void)updateInterfaceOrientationWithRequestedOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet")) {
    return;
  }
  id v19 = +[SBCoverSheetPresentationManager sharedInstance];
  v7 = +[SBLockScreenManager sharedInstance];
  objc_super v8 = [v7 coverSheetViewController];

  uint64_t v9 = +[SBOrientationLockManager sharedInstance];
  [v19 setActiveInterfaceOrientationLocked:0];
  if ([v9 isUserLocked]) {
    a3 = [v9 userLockOrientation];
  }
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (__sb__runningInSpringBoard())
    {
      if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
        goto LABEL_8;
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v11 = [v10 userInterfaceIdiom];

      if (!v11)
      {
LABEL_8:
        a3 = 1;
        [(SBLockScreenOrientationManager *)self _updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:1];
        goto LABEL_11;
      }
    }
    a3 = [(id)SBApp interfaceOrientationForCurrentDeviceOrientation:0];
  }
LABEL_11:
  [(id)SBApp pushTransientActiveInterfaceOrientation:a3 forReason:@"SBLockScreenTransientActiveInterfaceOrientationForUndimReason"];
  [(id)SBApp updateNativeOrientationWithOrientation:a3 updateMirroredDisplays:1 animated:v4 logMessage:@"LockScreen updated interface orientation"];
  [(id)SBApp popTransientActiveInterfaceOrientationForReason:@"SBLockScreenTransientActiveInterfaceOrientationForUndimReason"];
  v12 = +[SBUIController sharedInstance];
  [v12 nudgeIconInterfaceOrientation:a3 duration:0.0];

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v13 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (v14 == 1)
  {
LABEL_15:
    [(id)SBApp setStatusBarOrientation:a3 forEmbeddedDisplayAnimated:0];
    v15 = +[SBUIController sharedInstance];
    v16 = [v15 window];
    v17 = [v16 rootViewController];
    [v17 setInterfaceOrientation:a3];
  }
LABEL_16:
  uint64_t v18 = [(id)SBApp activeInterfaceOrientation];
  [v19 updateInterfaceOrientationToMatchOrientation:v18];
  [v8 setEffectiveInterfaceOrientationOverride:v18];
  [v19 setActiveInterfaceOrientationLocked:1];
}

- (void)_lockStateChanged:(id)a3
{
  id v4 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0)
  {
    v5 = [v4 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"SBAggregateLockStateKey"];
    char v7 = [v6 unsignedIntegerValue];

    BOOL v8 = v7 & 1;
    if (self->_wasUILocked != v8)
    {
      if (v8)
      {
        uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:480.0];
        updateForAmbiguousOrientationsAfterDate = self->_updateForAmbiguousOrientationsAfterDate;
        self->_updateForAmbiguousOrientationsAfterDate = v11;

        id v10 = BKLogOrientationDevice();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[SBLockScreenOrientationManager _lockStateChanged:]((uint64_t *)&self->_updateForAmbiguousOrientationsAfterDate, v10);
        }
      }
      else
      {
        uint64_t v9 = self->_updateForAmbiguousOrientationsAfterDate;
        self->_updateForAmbiguousOrientationsAfterDate = 0;

        id v10 = BKLogOrientationDevice();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[SBLockScreenOrientationManager _lockStateChanged:](v10);
        }
      }

      self->_wasUILocked = v8;
    }
  }
}

- (void)_updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:(int64_t)a3
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
        return;
      }
    }
    else
    {
      v5 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6) {
        return;
      }
    }
    uint64_t v7 = [(id)SBApp deviceOrientationForDeferredUpdateIfAny];
    if (!v7)
    {
      BOOL v8 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v7 = [v8 orientation];
    }
    if ((unint64_t)(v7 - 1) < 4)
    {
      uint64_t v9 = BKLogOrientationDevice();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[SBLockScreenOrientationManager _updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:](v7, v9);
      }
LABEL_18:

      return;
    }
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    int v11 = [v10 isAfterDate:self->_updateForAmbiguousOrientationsAfterDate];

    if (!v11)
    {
      uint64_t v9 = BKLogOrientationDevice();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Not updating SpringBoard's device orientation for unlock in an ambiguous orientation as we locked too recently", v13, 2u);
      }
      goto LABEL_18;
    }
    v12 = (void *)SBApp;
    [v12 _setDeviceOrientation:a3 animated:0 logMessage:@"Forcibly updating SpringBoard's device orientation for unlock in an ambiguous orientation"];
  }
}

- (void).cxx_destruct
{
}

- (void)_lockStateChanged:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "We are no longer UI locked. Clearing the grace period for unlocks in ambiguous orientations.", v1, 2u);
}

- (void)_lockStateChanged:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "We are now UI locked. Will update device orientation for unlocks in ambiguous orientations after %@", (uint8_t *)&v3, 0xCu);
}

- (void)_updateDeviceOrientationIfNeededForPhoneUnlockToOrientation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = BSDeviceOrientationDescription();
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Not updating SpringBoard's device orientation for unlock because our orientation isn't ambiguous, it's: %@", (uint8_t *)&v4, 0xCu);
}

@end