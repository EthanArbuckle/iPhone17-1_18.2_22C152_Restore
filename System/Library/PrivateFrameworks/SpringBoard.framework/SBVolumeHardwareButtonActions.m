@interface SBVolumeHardwareButtonActions
- (BOOL)_handleVolumeButtonDownForIncrease:(BOOL)a3 modifiers:(int64_t)a4;
- (BOOL)_handleVolumeButtonUpForIncrease:(BOOL)a3;
- (BOOL)_handleVolumeDecreaseUp;
- (BOOL)_handleVolumeIncreaseUp;
- (BOOL)_sendVolumeButtonToSBUIControllerForIncrease:(BOOL)a3 down:(BOOL)a4;
- (id)_sendVolumeButtonDownToLegacyRegisteredClientsForIncrease:(BOOL)a3;
- (id)_sendVolumeButtonDownToOverridingSceneForIncrease:(BOOL)a3;
- (id)_sendVolumeButtonDownToSBUIControllerForIncrease:(BOOL)a3;
- (id)_sendVolumeButtonDownToSoundControllerForIncrease:(BOOL)a3;
- (id)_sendVolumeButtonDownToSpringBoardInternalUIForIncrease:(BOOL)a3;
- (void)_launchVolumeSettings;
- (void)_sendBanditsVolumeDecreased;
- (void)_sendBanditsVolumeIncreased;
- (void)addVolumePressBandit:(id)a3;
- (void)cancelVolumePress;
- (void)removeVolumePressBandit:(id)a3;
- (void)volumeDecreasePressDownWithModifiers:(int64_t)a3;
- (void)volumeDecreasePressUp;
- (void)volumeIncreasePressDownWithModifiers:(int64_t)a3;
- (void)volumeIncreasePressUp;
@end

@implementation SBVolumeHardwareButtonActions

- (void)volumeIncreasePressDownWithModifiers:(int64_t)a3
{
  self->_volumeIncreaseIsDown = 1;
  [(SBVolumeHardwareButtonActions *)self _handleVolumeButtonDownForIncrease:1 modifiers:a3];
}

- (void)volumeIncreasePressUp
{
  if (self->_volumeIncreaseIsDown)
  {
    self->_volumeIncreaseIsDown = 0;
    [(SBVolumeHardwareButtonActions *)self _handleVolumeButtonUpForIncrease:1];
  }
}

- (void)volumeDecreasePressDownWithModifiers:(int64_t)a3
{
  self->_volumeDecreaseIsDown = 1;
  [(SBVolumeHardwareButtonActions *)self _handleVolumeButtonDownForIncrease:0 modifiers:a3];
}

- (void)volumeDecreasePressUp
{
  if (self->_volumeDecreaseIsDown)
  {
    self->_volumeDecreaseIsDown = 0;
    [(SBVolumeHardwareButtonActions *)self _handleVolumeButtonUpForIncrease:0];
  }
}

- (void)cancelVolumePress
{
  v3 = SBLogButtonsVolume();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "canceling volume button presses", v4, 2u);
  }

  [(SBVolumeHardwareButtonActions *)self volumeIncreasePressUp];
  [(SBVolumeHardwareButtonActions *)self volumeDecreasePressUp];
}

- (void)addVolumePressBandit:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogButtonsVolume();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 138543362;
    *(void *)&v10[4] = objc_opt_class();
    id v6 = *(id *)&v10[4];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "bandit added: %{public}@", v10, 0xCu);
  }
  volumePressBandits = self->_volumePressBandits;
  if (!volumePressBandits)
  {
    v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v9 = self->_volumePressBandits;
    self->_volumePressBandits = v8;

    volumePressBandits = self->_volumePressBandits;
  }
  -[NSHashTable addObject:](volumePressBandits, "addObject:", v4, *(_OWORD *)v10);
}

- (void)removeVolumePressBandit:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogButtonsVolume();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "bandit removed: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [(NSHashTable *)self->_volumePressBandits removeObject:v4];
}

- (void)_sendBanditsVolumeIncreased
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[(NSHashTable *)self->_volumePressBandits copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = SBLogButtonsVolume();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v17 = v10;
          id v11 = v10;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "sending volume increase to bandit: %{public}@", buf, 0xCu);
        }
        [v8 handleVolumeIncrease];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_sendBanditsVolumeDecreased
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[(NSHashTable *)self->_volumePressBandits copy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = SBLogButtonsVolume();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v17 = v10;
          id v11 = v10;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "sending volume decrease to bandit: %{public}@", buf, 0xCu);
        }
        [v8 handleVolumeDecrease];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (BOOL)_sendVolumeButtonToSBUIControllerForIncrease:(BOOL)a3 down:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = +[SBUIController sharedInstance];
  int v7 = v6;
  if (v5) {
    uint64_t v8 = 102;
  }
  else {
    uint64_t v8 = 103;
  }
  [v6 handleVolumeButtonWithType:v8 down:v4];

  return 1;
}

- (BOOL)_handleVolumeIncreaseUp
{
  volumeIncreaseUpEventBlock = (void (**)(id, SEL))self->_volumeIncreaseUpEventBlock;
  if (volumeIncreaseUpEventBlock)
  {
    volumeIncreaseUpEventBlock[2](self->_volumeIncreaseUpEventBlock, a2);
    id v4 = self->_volumeIncreaseUpEventBlock;
    self->_volumeIncreaseUpEventBlock = 0;
  }
  return volumeIncreaseUpEventBlock != 0;
}

- (BOOL)_handleVolumeDecreaseUp
{
  volumeDecreaseUpEventBlock = (void (**)(id, SEL))self->_volumeDecreaseUpEventBlock;
  if (volumeDecreaseUpEventBlock)
  {
    volumeDecreaseUpEventBlock[2](self->_volumeDecreaseUpEventBlock, a2);
    id v4 = self->_volumeDecreaseUpEventBlock;
    self->_volumeDecreaseUpEventBlock = 0;
  }
  return volumeDecreaseUpEventBlock != 0;
}

- (BOOL)_handleVolumeButtonUpForIncrease:(BOOL)a3
{
  if (a3)
  {
    if ([(SBVolumeHardwareButtonActions *)self _handleVolumeIncreaseUp]) {
      return 1;
    }
  }
  else if ([(SBVolumeHardwareButtonActions *)self _handleVolumeDecreaseUp])
  {
    return 1;
  }
  BOOL v5 = SBLogButtonsVolume();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SBVolumeHardwareButtonActions _handleVolumeButtonUpForIncrease:](a3, v5);
  }

  return 0;
}

- (id)_sendVolumeButtonDownToSpringBoardInternalUIForIncrease:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(id)SBApp windowSceneManager];
  BOOL v5 = [v4 activeDisplayWindowScene];

  uint64_t v6 = +[SBWorkspace mainWorkspace];
  int v7 = [v6 transientOverlayPresentationManager];
  uint64_t v8 = [v7 transientOverlayPresenterForWindowScene:v5];

  uint64_t v9 = [(id)SBApp systemApertureControllerForMainDisplay];
  v10 = v9;
  if (v3)
  {
    if (([v9 handleVolumeUpButtonPress] & 1) == 0)
    {
LABEL_3:
      char v11 = 0;
      long long v12 = 0;
      goto LABEL_6;
    }
  }
  else if (![v9 handleVolumeDownButtonPress])
  {
    goto LABEL_3;
  }
  long long v12 = @"SystemApertureController";
  char v11 = 1;
LABEL_6:
  long long v13 = [(id)SBApp bannerManager];
  long long v14 = v13;
  if (v11) {
    goto LABEL_29;
  }
  long long v15 = [v13 bannerWindowInWindowScene:v5];
  [v15 windowLevel];
  char v16 = objc_msgSend(v8, "hasPresentationAboveWindowLevel:");

  if ((v16 & 1) == 0)
  {
    if (v3)
    {
      if (([v14 handleVolumeUpButtonPress] & 1) == 0)
      {
        if (([v8 canHandleButtonEvents] & 1) == 0) {
          goto LABEL_21;
        }
        goto LABEL_14;
      }
    }
    else if (([v14 handleVolumeDownButtonPress] & 1) == 0)
    {
      if (([v8 canHandleButtonEvents] & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    long long v12 = @"BannerManager";
LABEL_29:
    v21 = [@"SpringBoard Internal UI: " stringByAppendingString:v12];
    goto LABEL_30;
  }
  if (([v8 canHandleButtonEvents] & 1) == 0) {
    goto LABEL_21;
  }
  if (!v3)
  {
LABEL_19:
    if ([v8 handleVolumeDownButtonPress]) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
LABEL_14:
  if ([v8 handleVolumeUpButtonPress])
  {
LABEL_20:
    long long v12 = @"TransientOverlayPresenter";
    goto LABEL_29;
  }
LABEL_21:
  v17 = +[SBLockScreenManager sharedInstance];
  v18 = [v17 lockScreenEnvironment];
  uint64_t v19 = [v18 buttonEventsHandler];

  if (v3)
  {
    if ([v19 handleVolumeUpButtonPress])
    {
LABEL_23:
      long long v12 = @"LockScreenEnvironment";
LABEL_28:

      goto LABEL_29;
    }
  }
  else if ([v19 handleVolumeDownButtonPress])
  {
    goto LABEL_23;
  }

  v20 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  uint64_t v19 = v20;
  if (v3)
  {
    if ([v20 handleVolumeUpButtonPress])
    {
LABEL_27:
      long long v12 = @"Switcher";
      goto LABEL_28;
    }
  }
  else if ([v20 handleVolumeDownButtonPress])
  {
    goto LABEL_27;
  }

  v21 = 0;
LABEL_30:

  return v21;
}

- (id)_sendVolumeButtonDownToLegacyRegisteredClientsForIncrease:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(id)SBApp appsRegisteredForVolumeEvents];
  uint64_t v6 = [v5 firstObject];

  if (v6 && SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v6))
  {
    int v7 = [v6 bundleIdentifier];
    uint64_t v8 = [@"Legacy Registered Client: " stringByAppendingString:v7];

    uint64_t v9 = [v6 bundleIdentifier];
    v10 = [v6 processState];
    int v11 = [v10 pid];
    if (v3) {
      uint64_t v12 = 102;
    }
    else {
      uint64_t v12 = 103;
    }
    SBSendFakeButtonPressEventToApplication(v9, v11, v12, 1);

    long long v13 = SBLogButtonsVolume();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v14)
      {
        long long v15 = [v6 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v27 = v15;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "sent volume increase down to %{public}@", buf, 0xCu);
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke;
      v24[3] = &unk_1E6AF4AC0;
      char v16 = &v25;
      id v25 = v6;
      v17 = (void *)[v24 copy];
      id volumeIncreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
      self->_id volumeIncreaseUpEventBlock = v17;
    }
    else
    {
      if (v14)
      {
        uint64_t v19 = [v6 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v27 = v19;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "sent volume decrease down to %{public}@", buf, 0xCu);
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke_35;
      v22[3] = &unk_1E6AF4AC0;
      char v16 = &v23;
      id v23 = v6;
      v20 = (void *)[v22 copy];
      id volumeIncreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
      self->_volumeDecreaseUpEventBlock = v20;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) bundleIdentifier];
  BOOL v3 = SBLogButtonsVolume();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "sending volume increase up to previous down receipient: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) processState];
  SBSendFakeButtonPressEventToApplication(v2, [v4 pid], 102, 0);
}

void __91__SBVolumeHardwareButtonActions__sendVolumeButtonDownToLegacyRegisteredClientsForIncrease___block_invoke_35(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) bundleIdentifier];
  BOOL v3 = SBLogButtonsVolume();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "sending volume decrease up to previous down receipient: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) processState];
  SBSendFakeButtonPressEventToApplication(v2, [v4 pid], 103, 0);
}

- (id)_sendVolumeButtonDownToSoundControllerForIncrease:(BOOL)a3
{
  BOOL v3 = +[SBSoundController sharedInstance];
  int v4 = [v3 handleVolumeButtonDownEvent];

  if (v4) {
    return @"SBSoundController";
  }
  else {
    return 0;
  }
}

- (id)_sendVolumeButtonDownToSBUIControllerForIncrease:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = SBLogButtonsVolume();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "decrease";
    if (v3) {
      uint64_t v6 = "increase";
    }
    *(_DWORD *)buf = 136446210;
    v17 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBUIController will process %{public}s down event", buf, 0xCu);
  }

  [(SBVolumeHardwareButtonActions *)self _sendVolumeButtonToSBUIControllerForIncrease:v3 down:1];
  objc_initWeak((id *)buf, self);
  if (v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke;
    v14[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v15, (id *)buf);
    uint64_t v7 = (void *)[v14 copy];
    id volumeIncreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
    self->_id volumeIncreaseUpEventBlock = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke_43;
    v12[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v13, (id *)buf);
    uint64_t v9 = (void *)[v12 copy];
    id volumeDecreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
    self->_id volumeDecreaseUpEventBlock = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  return @"SBUIController";
}

void __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke(uint64_t a1)
{
  v2 = SBLogButtonsVolume();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBUIController will process increase up event", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendVolumeButtonToSBUIControllerForIncrease:1 down:0];
}

void __82__SBVolumeHardwareButtonActions__sendVolumeButtonDownToSBUIControllerForIncrease___block_invoke_43(uint64_t a1)
{
  v2 = SBLogButtonsVolume();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "SBUIController will process decrease up event", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendVolumeButtonToSBUIControllerForIncrease:0 down:0];
}

- (void)_launchVolumeSettings
{
  v2 = SBLogButtonsVolume();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "launching volume prefs", v4, 2u);
  }

  BOOL v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Sounds"];
  SBWorkspaceActivateApplicationFromURL(v3, 0, 0);
}

- (id)_sendVolumeButtonDownToOverridingSceneForIncrease:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  uint64_t v6 = [v5 physicalButtonSceneOverrideManager];
  char v26 = 0;
  uint64_t v7 = -[SBPhysicalButtonSceneOverrideManager sendVolumeButtonDownForIncrease:shouldAlsoChangeVolume:](v6, v3, &v26);
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 identifier];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke;
    v24[3] = &unk_1E6AF4AC0;
    id v25 = v8;
    v10 = (void *)[v24 copy];
    if (v26)
    {
      [(SBVolumeHardwareButtonActions *)self _sendVolumeButtonToSBUIControllerForIncrease:v3 down:1];
      uint64_t v11 = [v9 stringByAppendingString:@" + SBUIController"];

      objc_initWeak(&location, self);
      uint64_t v12 = (void *)[v10 copy];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke_2;
      v19[3] = &unk_1E6B0C4D8;
      id v13 = v12;
      id v20 = v13;
      objc_copyWeak(&v21, &location);
      BOOL v22 = v3;
      uint64_t v14 = [v19 copy];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      v10 = (void *)v14;
      uint64_t v9 = (void *)v11;
    }
  }
  else
  {
    v10 = 0;
    uint64_t v9 = 0;
  }
  id v15 = (objc_class *)MEMORY[0x1D948C7A0](v10);
  uint64_t v16 = 32;
  if (v3) {
    uint64_t v16 = 24;
  }
  v17 = *(Class *)((char *)&self->super.isa + v16);
  *(Class *)((char *)&self->super.isa + v16) = v15;

  return v9;
}

uint64_t __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeWithResult:0];
}

void __83__SBVolumeHardwareButtonActions__sendVolumeButtonDownToOverridingSceneForIncrease___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sendVolumeButtonToSBUIControllerForIncrease:*(unsigned __int8 *)(a1 + 48) down:0];
}

- (BOOL)_handleVolumeButtonDownForIncrease:(BOOL)a3 modifiers:(int64_t)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a4 == 0x80000)
  {
    [(SBVolumeHardwareButtonActions *)self _launchVolumeSettings];
    if (v4)
    {
      id volumeIncreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
      self->_id volumeIncreaseUpEventBlock = &__block_literal_global_370;
    }
    else
    {
      id volumeIncreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
      self->_id volumeDecreaseUpEventBlock = &__block_literal_global_53_1;
    }

    uint64_t v7 = @"Volume Settings";
  }
  else
  {
    if (![(NSHashTable *)self->_volumePressBandits count]) {
      goto LABEL_11;
    }
    if (v4) {
      [(SBVolumeHardwareButtonActions *)self _sendBanditsVolumeIncreased];
    }
    else {
      [(SBVolumeHardwareButtonActions *)self _sendBanditsVolumeDecreased];
    }
    uint64_t v8 = [(NSHashTable *)self->_volumePressBandits allObjects];
    uint64_t v9 = objc_msgSend(v8, "bs_map:", &__block_literal_global_59_0);
    v10 = [v9 componentsJoinedByString:@", "];

    uint64_t v7 = [@"bandit(s): " stringByAppendingString:v10];

    if (!v7)
    {
LABEL_11:
      uint64_t v11 = +[SBPrototypeController sharedInstance];
      uint64_t v12 = v11;
      if (v4) {
        char v13 = [v11 handleVolumeIncreaseEvent];
      }
      else {
        char v13 = [v11 handleVolumeDecreaseEvent];
      }
      char v14 = v13;

      if (v14)
      {
        uint64_t v7 = @"SBPrototypeController";
      }
      else
      {
        id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v15 postNotificationName:*MEMORY[0x1E4FA7AE8] object:0];

        uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v16 postNotificationName:*MEMORY[0x1E4FA7AE0] object:0];

        uint64_t v7 = [(SBVolumeHardwareButtonActions *)self _sendVolumeButtonDownToSpringBoardInternalUIForIncrease:v4];
        if (!v7)
        {
          v17 = +[SBHardwareButtonService sharedInstance];
          uint64_t v18 = v17;
          if (v4)
          {
            uint64_t v28 = 0;
            char v19 = [v17 consumeVolumeIncreaseButtonSinglePressDownWithPriority:0 continuation:&v28];
            id v20 = (void *)MEMORY[0x1D948C7A0](v28);

            id v21 = (void *)MEMORY[0x1D948C7A0](v20);
            id volumeDecreaseUpEventBlock = self->_volumeIncreaseUpEventBlock;
            self->_id volumeIncreaseUpEventBlock = v21;
          }
          else
          {
            uint64_t v27 = 0;
            char v19 = [v17 consumeVolumeDecreaseButtonSinglePressDownWithPriority:0 continuation:&v27];
            id v20 = (void *)MEMORY[0x1D948C7A0](v27);

            id v23 = (void *)MEMORY[0x1D948C7A0](v20);
            id volumeDecreaseUpEventBlock = self->_volumeDecreaseUpEventBlock;
            self->_id volumeDecreaseUpEventBlock = v23;
          }

          if (v19)
          {
            uint64_t v7 = @"SBHardwareButtonService";
          }
          else
          {
            uint64_t v7 = [(SBVolumeHardwareButtonActions *)self _sendVolumeButtonDownToSoundControllerForIncrease:v4];
            if (!v7)
            {
              uint64_t v7 = [(SBVolumeHardwareButtonActions *)self _sendVolumeButtonDownToOverridingSceneForIncrease:v4];
              if (!v7)
              {
                uint64_t v7 = [(SBVolumeHardwareButtonActions *)self _sendVolumeButtonDownToLegacyRegisteredClientsForIncrease:v4];
                if (!v7)
                {
                  uint64_t v7 = [(SBVolumeHardwareButtonActions *)self _sendVolumeButtonDownToSBUIControllerForIncrease:v4];
                }
              }
            }
          }
        }
      }
    }
  }
  v24 = SBLogButtonsVolume();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = @"decrease";
    if (v4) {
      id v25 = @"increase";
    }
    *(_DWORD *)buf = 138543618;
    v30 = v25;
    __int16 v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Hardware Volume %{public}@ press handled by %{public}@", buf, 0x16u);
  }

  return v7 != 0;
}

uint64_t __78__SBVolumeHardwareButtonActions__handleVolumeButtonDownForIncrease_modifiers___block_invoke_3()
{
  v0 = objc_opt_class();
  return [v0 description];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_volumeDecreaseUpEventBlock, 0);
  objc_storeStrong(&self->_volumeIncreaseUpEventBlock, 0);
  objc_storeStrong((id *)&self->_volumePressBandits, 0);
}

- (void)_handleVolumeButtonUpForIncrease:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = "decrease";
  if (a1) {
    v2 = "increase";
  }
  int v3 = 136446210;
  BOOL v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "ignoring %{public}s up event", (uint8_t *)&v3, 0xCu);
}

@end