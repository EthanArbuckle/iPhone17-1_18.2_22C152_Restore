@interface SBScreenSleepCoordinator
- (BLSHBacklightSceneHostEnvironment)backlightSceneHostEnvironment;
- (BOOL)_shouldPresentAmbientOnSleepAndLock;
- (SBScreenSleepCoordinator)initWithScreenWakeAnimationController:(id)a3 lockScreenManager:(id)a4 backlightController:(id)a5 coverSheetPresentationManager:(id)a6 authenticationStatusProvider:(id)a7 authenticationAssertionProvider:(id)a8 alertItemsController:(id)a9 windowScene:(id)a10;
- (id)_ambientPresentationController;
- (int64_t)targetBacklightStateForSource:(int64_t)a3 isWake:(BOOL)a4;
- (void)_performLock;
- (void)_performLockAnimated:(BOOL)a3;
- (void)_setTransitionWindowVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)sleepAndLockUIFromSource:(int)a3 completion:(id)a4;
- (void)sleepAndLockUIFromSource:(int)a3 lockOptions:(id)a4 completion:(id)a5;
- (void)transitionToVisualState:(id)a3 fromVisualState:(id)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation SBScreenSleepCoordinator

- (SBScreenSleepCoordinator)initWithScreenWakeAnimationController:(id)a3 lockScreenManager:(id)a4 backlightController:(id)a5 coverSheetPresentationManager:(id)a6 authenticationStatusProvider:(id)a7 authenticationAssertionProvider:(id)a8 alertItemsController:(id)a9 windowScene:(id)a10
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)SBScreenSleepCoordinator;
  v18 = [(SBScreenSleepCoordinator *)&v32 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_screenWakeAnimationController, a3);
    objc_storeStrong((id *)&v19->_lockScreenManager, a4);
    objc_storeStrong((id *)&v19->_backlightController, a5);
    objc_storeStrong((id *)&v19->_coverSheetPresentationManager, a6);
    objc_storeStrong((id *)&v19->_authenticationStatusProvider, a7);
    objc_storeStrong((id *)&v19->_authenticationAssertionProvider, a8);
    objc_storeStrong((id *)&v19->_alertItemsController, a9);
    objc_storeStrong((id *)&v19->_windowScene, a10);
    [(SBScreenWakeAnimationController *)v19->_screenWakeAnimationController setDelegate:v19];
    uint64_t v20 = +[SBAlwaysOnDomain rootSettings];
    alwaysOnSettings = v19->_alwaysOnSettings;
    v19->_alwaysOnSettings = (SBAlwaysOnSettings *)v20;

    v22 = [[SBScreenSleepCoordinatorBacklightEnvironment alloc] initWithCoordinator:v19];
    backlightSceneHostEnvironment = v19->_backlightSceneHostEnvironment;
    v19->_backlightSceneHostEnvironment = (BLSHBacklightSceneHostEnvironment *)v22;
  }
  return v19;
}

- (void)sleepAndLockUIFromSource:(int)a3 completion:(id)a4
{
}

- (void)sleepAndLockUIFromSource:(int)a3 lockOptions:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(SBScreenSleepCoordinator *)self _shouldPresentAmbientOnSleepAndLock];
  if (v10)
  {
    v11 = [(SBScreenSleepCoordinator *)self _ambientPresentationController];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke;
    v27[3] = &unk_1E6AF5A50;
    v23 = &v28;
    id v28 = v9;
    int v12 = [v11 presentIfAllowedAndLockWithCompletion:v27];

    if (v12)
    {
      v13 = SBLogBacklight();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = NSStringFromLockSource();
        *(_DWORD *)buf = 138412290;
        id v30 = v14;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: presented ambient for source %@", buf, 0xCu);
      }
LABEL_9:

      goto LABEL_10;
    }
  }
  uint64_t v15 = SBUIConvertLockSourceToBacklightChangeSource();
  v16 = SBLogBacklight();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = NSStringFromLockSource();
    *(_DWORD *)buf = 138412290;
    id v30 = v17;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: beginning sleep for source %@", buf, 0xCu);
  }
  self->_didLock = 0;
  self->_lastLockSource = a3;
  v18 = (NSDictionary *)[v8 copy];
  lastLockOptions = self->_lastLockOptions;
  self->_lastLockOptions = v18;

  screenWakeAnimationController = self->_screenWakeAnimationController;
  v21 = [(SBLockScreenManager *)self->_lockScreenManager lockScreenEnvironment];
  v22 = [v21 screenWakeAnimationTarget];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke_3;
  v24[3] = &unk_1E6B0B280;
  v24[4] = self;
  int v26 = a3;
  id v25 = v9;
  [(SBScreenWakeAnimationController *)screenWakeAnimationController sleepForSource:v15 target:v22 completion:v24];

  if (v10) {
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __76__SBScreenSleepCoordinator_sleepAndLockUIFromSource_lockOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = SBLogBacklight();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: sleep completed", (uint8_t *)v10, 2u);
  }

  v3 = [*(id *)(*(void *)(a1 + 32) + 16) lockScreenEnvironment];
  v4 = [v3 backlightController];
  [v4 screenSleepCompletedForSource:*(unsigned int *)(a1 + 48)];

  int v5 = [*(id *)(*(void *)(a1 + 32) + 24) screenIsOn];
  int v6 = [*(id *)(*(void *)(a1 + 32) + 8) isWakeAnimationInProgress];
  v7 = SBLogBacklight();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 & 1) != 0 || (v6)
  {
    if (v8)
    {
      v10[0] = 67109376;
      v10[1] = v5;
      __int16 v11 = 1024;
      int v12 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: skipping UI lock (screen on = %{BOOL}u wakeInProgress = %{BOOL}u)", (uint8_t *)v10, 0xEu);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: beginning UI lock", (uint8_t *)v10, 2u);
    }

    [*(id *)(a1 + 32) _performLock];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)targetBacklightStateForSource:(int64_t)a3 isWake:(BOOL)a4
{
  if (a4) {
    return 1;
  }
  if (a3 == 39) {
    return 4;
  }
  if (a3 != 3) {
    return 3;
  }
  int64_t v6 = [(SBAlwaysOnSettings *)self->_alwaysOnSettings sideButtonBehavior];
  if (v6 == 1)
  {
    if ([(SBBacklightController *)self->_backlightController backlightState] == 3) {
      return 4;
    }
    else {
      return 3;
    }
  }
  else if (v6)
  {
    return 4;
  }
  else
  {
    return 3;
  }
}

- (void)_performLock
{
}

- (void)_performLockAnimated:(BOOL)a3
{
  if (!self->_didLock)
  {
    BOOL v3 = a3;
    id v8 = (id)[(NSDictionary *)self->_lastLockOptions mutableCopy];
    int v5 = [v8 objectForKey:@"SBUILockOptionsAnimateLockScreenActivationKey"];

    if (!v5)
    {
      int64_t v6 = [NSNumber numberWithBool:v3];
      [v8 setObject:v6 forKeyedSubscript:@"SBUILockOptionsAnimateLockScreenActivationKey"];
    }
    [(SBLockScreenManager *)self->_lockScreenManager lockUIFromSource:self->_lastLockSource withOptions:v8];
    [(SBLockScreenManager *)self->_lockScreenManager setPasscodeVisible:0 animated:1];
    self->_didLock = 1;
    lastLockOptions = self->_lastLockOptions;
    self->_lastLockOptions = 0;
  }
}

- (void)_setTransitionWindowVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (v6 && !self->_transitionWindow)
  {
    id v9 = [SBScreenSleepTransitionWindow alloc];
    BOOL v10 = [MEMORY[0x1E4F42D90] mainScreen];
    __int16 v11 = [(_UIRootWindow *)v9 initWithScreen:v10];

    [(SBScreenSleepTransitionWindow *)v11 setWindowLevel:*MEMORY[0x1E4F43958] + 801.0];
    int v12 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBScreenSleepTransitionWindow *)v11 setBackgroundColor:v12];

    [(SBScreenSleepTransitionWindow *)v11 setAlpha:0.0];
    [(_UIRootWindow *)v11 setHidden:0];
    transitionWindow = self->_transitionWindow;
    self->_transitionWindow = v11;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke;
  v21[3] = &unk_1E6AF5D38;
  BOOL v22 = v6;
  v21[4] = self;
  uint64_t v14 = MEMORY[0x1D948C7A0](v21);
  uint64_t v15 = (void *)v14;
  if (v5)
  {
    v16 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke_2;
    v18[3] = &unk_1E6AFBA88;
    if (v6) {
      uint64_t v17 = 65540;
    }
    else {
      uint64_t v17 = 131076;
    }
    BOOL v20 = v6;
    v18[4] = self;
    id v19 = v8;
    [v16 animateWithDuration:v17 delay:v15 options:v18 animations:0.185 completion:0.0];
  }
  else
  {
    (*(void (**)(uint64_t))(v14 + 16))(v14);
    if (v8) {
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }
  }
}

uint64_t __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 104) setAlpha:v1];
}

uint64_t __76__SBScreenSleepCoordinator__setTransitionWindowVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 104) setHidden:1];
    uint64_t v2 = *(void *)(a1 + 32);
    BOOL v3 = *(void **)(v2 + 104);
    *(void *)(v2 + 104) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (id)_ambientPresentationController
{
  return [(SBWindowScene *)self->_windowScene ambientPresentationController];
}

- (BOOL)_shouldPresentAmbientOnSleepAndLock
{
  BOOL v3 = [(SBScreenSleepCoordinator *)self _ambientPresentationController];
  if ([v3 isPresentationRequested])
  {
    v4 = [(SBScreenSleepCoordinator *)self _ambientPresentationController];
    int v5 = [v4 isPresented] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)transitionToVisualState:(id)a3 fromVisualState:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = (void (**)(void))a6;
  int v12 = (void *)(self->_transitionGeneration + 1);
  self->_transitionGeneration = (unint64_t)v12;
  uint64_t v13 = SBLogBacklight();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v57 = v10;
    __int16 v58 = 2112;
    id v59 = v9;
    __int16 v60 = 2048;
    v61 = v12;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: request to transition from %@ to %@ (generation %lu)", buf, 0x20u);
  }

  uint64_t v14 = [v9 adjustedLuminance];
  uint64_t v15 = [v9 activeAppearance];
  BOOL v16 = [v9 activeAppearance] == 1 && objc_msgSend(v9, "adjustedLuminance") == 2;
  uint64_t v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  if (v15)
  {
    [(SBScreenSleepCoordinator *)self _setTransitionWindowVisible:0 animated:1 completion:0];
    [(SBAlertItemsController *)self->_alertItemsController setForceAlertsToPend:0 forReason:v18];
  }
  if (!v14)
  {
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  if (v16)
  {
    if (v11) {
LABEL_11:
    }
      v11[2](v11);
  }
  else if (!v15)
  {
    BOOL v38 = [(SBLockScreenManager *)self->_lockScreenManager hasWakeToContentForInactiveDisplay];
    uint64_t v37 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
    char v39 = [(SBFAuthenticationStatusProvider *)self->_authenticationStatusProvider hasPasscodeSet];
    id v19 = [(SBFAuthenticationAssertionProviding *)self->_authenticationAssertionProvider createSecureDisplayDeferralAssertionWithReason:v18];
    [(SBLockScreenManager *)self->_lockScreenManager noteBacklightWillTransitionToInactive];
    [(SBAlertItemsController *)self->_alertItemsController setForceAlertsToPend:1 forReason:v18];
    BOOL v20 = [(SBLockScreenManager *)self->_lockScreenManager lockScreenEnvironment];
    v21 = [v20 lockController];
    [v21 prepareForUILock];

    objc_initWeak((id *)buf, self);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke;
    v49[3] = &unk_1E6B0B2A8;
    id v34 = v19;
    id v50 = v34;
    objc_copyWeak(v54, (id *)buf);
    v51 = self;
    v54[1] = v12;
    char v55 = v39;
    id v22 = v18;
    id v52 = v22;
    v53 = v11;
    v23 = (void *)MEMORY[0x1D948C7A0](v49);
    v24 = (void *)MEMORY[0x1E4F4F6B8];
    uint64_t v25 = MEMORY[0x1E4F14428];
    id v26 = MEMORY[0x1E4F14428];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13;
    v47[3] = &unk_1E6B0B2D0;
    id v36 = v23;
    id v48 = v36;
    id v27 = [v24 sentinelWithQueue:v25 signalHandler:v47];
    if ((unint64_t)(v37 - 3) < 2) {
      char v28 = 1;
    }
    else {
      char v28 = v38 & v39;
    }

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_15;
    v45[3] = &unk_1E6AF4AC0;
    id v29 = v27;
    id v46 = v29;
    id v30 = (void (**)(void))MEMORY[0x1D948C7A0](v45);
    if (v28)
    {
      if ([(SBLockScreenManager *)self->_lockScreenManager isUILocked] && v38)
      {
        uint64_t v31 = [(SBCoverSheetPresentationManager *)self->_coverSheetPresentationManager acquirePreserveSecureAppAssertionForReason:@"Inactive transition"];
        v30[2](v30);
        [v31 invalidate];
      }
      else
      {
        objc_super v32 = [(SBLockScreenManager *)self->_lockScreenManager acquireLockScreenPresentationPendingAssertionWithReason:v22];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_3;
        v40[3] = &unk_1E6B0B2F8;
        objc_copyWeak(&v43, (id *)buf);
        v42 = v30;
        id v33 = v32;
        id v41 = v33;
        [(SBScreenSleepCoordinator *)self _setTransitionWindowVisible:1 animated:1 completion:v40];

        objc_destroyWeak(&v43);
      }
    }
    else
    {
      -[SBCoverSheetPresentationManager setCoverSheetPresented:animated:withCompletion:](self->_coverSheetPresentationManager, "setCoverSheetPresented:animated:withCompletion:", 1, 1, v30, v34);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2_16;
      v44[3] = &unk_1E6AF4AC0;
      v44[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v44];
    }

    objc_destroyWeak(v54);
    objc_destroyWeak((id *)buf);
  }
LABEL_24:
}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke(uint64_t a1)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2;
  v13[3] = &unk_1E6AF4AC0;
  id v14 = *(id *)(a1 + 32);
  objc_msgSend(v2, "bs_performAfterSynchronizedCommit:", v13);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 88);
    uint64_t v5 = *(void *)(a1 + 72);
    BOOL v6 = SBLogBacklight();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4 == v5)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 134217984;
        uint64_t v16 = v8;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: Performing lock UI for inactive transition generation %lu", buf, 0xCu);
      }

      [WeakRetained _performLockAnimated:0];
      if (!*(unsigned char *)(a1 + 80)) {
        goto LABEL_10;
      }
      id v9 = WeakRetained[2];
      v19[0] = @"SBUIUnlockOptionsOnlyWakeToActionsKey";
      v19[1] = @"SBUIUnlockOptionsNoBacklightChangesKey";
      v20[0] = MEMORY[0x1E4F1CC38];
      v20[1] = MEMORY[0x1E4F1CC38];
      BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      [v9 unlockUIFromSource:32 withOptions:v6];
    }
    else if (v7)
    {
      uint64_t v10 = *(void *)(a1 + 72);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 88);
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "ScreenSleepCoordinator: Skipping lock UI for inactive transition generation %lu as we are now on generation %lu", buf, 0x16u);
    }

LABEL_10:
    [WeakRetained[7] setForceAlertsToPend:0 forReason:*(void *)(a1 + 48)];
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13(uint64_t a1, void *a2)
{
  if ([a2 isFailed])
  {
    BOOL v3 = SBLogBacklight();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13_cold_1(v3);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_2_16(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) lockScreenEnvironment];
  double v1 = [v2 backlightController];
  [v1 setInScreenOffMode:1 preservingCoverSheetPresentationState:1];
}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  dispatch_time_t v3 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_4;
  block[3] = &unk_1E6AF4AC0;
  block[4] = WeakRetained;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTransitionWindowVisible:0 animated:1 completion:0];
}

- (BLSHBacklightSceneHostEnvironment)backlightSceneHostEnvironment
{
  return self->_backlightSceneHostEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightSceneHostEnvironment, 0);
  objc_storeStrong((id *)&self->_transitionWindow, 0);
  objc_storeStrong((id *)&self->_alwaysOnSettings, 0);
  objc_storeStrong((id *)&self->_lastLockOptions, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_screenWakeAnimationController, 0);
}

void __88__SBScreenSleepCoordinator_transitionToVisualState_fromVisualState_animated_completion___block_invoke_13_cold_1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "screen sleep coordinator lock-and-wake-to block dropped", v1, 2u);
}

@end