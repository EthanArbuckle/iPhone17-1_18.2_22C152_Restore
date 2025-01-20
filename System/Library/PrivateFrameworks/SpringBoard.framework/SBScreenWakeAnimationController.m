@interface SBScreenWakeAnimationController
+ (double)_animationSpeedForBacklightChangeSource:(int64_t)a3 isWake:(BOOL)a4;
+ (double)backlightFadeDurationForSource:(int64_t)a3 isWake:(BOOL)a4;
+ (id)sharedInstance;
- (BOOL)interruptSleepAnimationIfNeeded;
- (BOOL)isSleepAnimationInProgress;
- (BOOL)isWakeAnimationInProgress;
- (BOOL)isWakeAnimationInProgressForSource:(int64_t)a3;
- (NSString)description;
- (SBScreenWakeAnimationController)init;
- (SBScreenWakeAnimationControllerDelegate)delegate;
- (id)_animationSettingsForBacklightChangeSource:(int64_t)a3 isWake:(BOOL)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_cleanupAnimationWhenInterruptingWaking:(BOOL)a3;
- (void)_cleanupAnimationWhenInterruptingWaking:(BOOL)a3 force:(BOOL)a4;
- (void)_handleAnimationCompletionIfNecessaryForWaking:(BOOL)a3;
- (void)_handleAnimationCompletionIfNecessaryForWaking:(BOOL)a3 force:(BOOL)a4;
- (void)_runCompletionHandlerForWake:(BOOL)a3 reason:(id)a4;
- (void)_setInteractionEventsIgnored:(BOOL)a3;
- (void)_setLastBacklightChangeSource:(int64_t)a3;
- (void)_startWakeAnimationsForWaking:(BOOL)a3 animationSettings:(id)a4;
- (void)_startWakeFromUnblankNotification;
- (void)_startWakeIfNecessary;
- (void)_updateWakeEffectsForWake:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)prepareToWakeForSource:(int64_t)a3 timeAlpha:(double)a4 statusBarAlpha:(double)a5 target:(id)a6 dateView:(id)a7 completion:(id)a8;
- (void)setDelegate:(id)a3;
- (void)setScreenWakeTemporarilyDisabled:(BOOL)a3 forReason:(id)a4;
- (void)sleepForSource:(int64_t)a3 completion:(id)a4;
- (void)sleepForSource:(int64_t)a3 target:(id)a4 completion:(id)a5;
@end

@implementation SBScreenWakeAnimationController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_27 != -1) {
    dispatch_once(&sharedInstance_onceToken_27, &__block_literal_global_196);
  }
  v2 = (void *)sharedInstance___sharedInstance_14;
  return v2;
}

uint64_t __49__SBScreenWakeAnimationController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBScreenWakeAnimationController);
  v1 = (void *)sharedInstance___sharedInstance_14;
  sharedInstance___sharedInstance_14 = (uint64_t)v0;

  return kdebug_trace();
}

+ (double)backlightFadeDurationForSource:(int64_t)a3 isWake:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [MEMORY[0x1E4FA6060] rootSettings];
  [(id)objc_opt_class() _animationSpeedForBacklightChangeSource:a3 isWake:v4];
  double v8 = v7;
  [v6 backlightFadeDuration];
  double v10 = v9 / v8;

  return v10;
}

+ (double)_animationSpeedForBacklightChangeSource:(int64_t)a3 isWake:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [MEMORY[0x1E4FA6060] rootSettings];
  double v7 = v6;
  if (a3 == 47)
  {
    [v6 speedMultiplierForMagicKeyboardExtended];
  }
  else
  {
    double v8 = 1.0;
    if (a3 != 20) {
      goto LABEL_6;
    }
    [v6 speedMultiplierForLiftToWake];
  }
  double v8 = v9;
LABEL_6:
  if (v4)
  {
    [v7 speedMultiplierForWake];
    double v8 = v8 * v10;
  }

  return v8;
}

- (SBScreenWakeAnimationController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBScreenWakeAnimationController;
  v2 = [(SBScreenWakeAnimationController *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    temporaryDisabledReasons = v2->_temporaryDisabledReasons;
    v2->_temporaryDisabledReasons = v3;

    v5 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
    objc_storeWeak((id *)&v2->_statusBarManager, v5);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBScreenWakeAnimationController;
  [(SBScreenWakeAnimationController *)&v4 dealloc];
}

- (BOOL)isWakeAnimationInProgress
{
  return self->_preparingToAnimateWake || self->_animatingForWake;
}

- (BOOL)isWakeAnimationInProgressForSource:(int64_t)a3
{
  BOOL v5 = [(SBScreenWakeAnimationController *)self isWakeAnimationInProgress];
  if (v5) {
    LOBYTE(v5) = self->_lastBacklightChangeSource == a3;
  }
  return v5;
}

- (BOOL)isSleepAnimationInProgress
{
  return self->_animatingForSleep;
}

- (id)_animationSettingsForBacklightChangeSource:(int64_t)a3 isWake:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [MEMORY[0x1E4FA6060] rootSettings];
  [(id)objc_opt_class() _animationSpeedForBacklightChangeSource:a3 isWake:v4];
  double v8 = v7;
  double v9 = [v6 contentWakeSettings];
  [v9 setSpeed:v8];

  double v10 = [v6 awakeWallpaperFilterSettings];
  [v10 setSpeed:v8];

  v11 = [v6 sleepWallpaperFilterSettings];
  [v11 setSpeed:v8];

  return v6;
}

- (BOOL)interruptSleepAnimationIfNeeded
{
  BOOL v3 = [(SBScreenWakeAnimationController *)self isSleepAnimationInProgress];
  if (v3) {
    [(SBScreenWakeAnimationController *)self _cleanupAnimationWhenInterruptingWaking:0];
  }
  return v3;
}

- (void)_setInteractionEventsIgnored:(BOOL)a3
{
  if (self->_ignoringInteractionEvents != a3)
  {
    self->_ignoringInteractionEvents = a3;
    if (a3) {
      [(id)SBApp beginIgnoringInteractionEventsForReason:@"lift-to-wake"];
    }
    else {
      [(id)SBApp endIgnoringInteractionEventsForReason:@"lift-to-wake"];
    }
  }
}

- (void)prepareToWakeForSource:(int64_t)a3 timeAlpha:(double)a4 statusBarAlpha:(double)a5 target:(id)a6 dateView:(id)a7 completion:(id)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a8;
  v17 = SBLogScreenWake();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = SBSBacklightChangeSourceDescription(a3);
    *(_DWORD *)buf = 138543874;
    v44 = v18;
    __int16 v45 = 2048;
    double v46 = a4;
    __int16 v47 = 2048;
    double v48 = a5;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "prepareToWakeForSource: %{public}@ timeAlpha: %.2f statusBarAlpha: %.2f", buf, 0x20u);
  }
  objc_storeStrong((id *)&self->_target, a6);
  self->_preparingToAnimateWake = 1;
  BOOL v19 = [(SBScreenWakeAnimationController *)self interruptSleepAnimationIfNeeded];
  [(SBScreenWakeAnimationController *)self _runCompletionHandlerForWake:1 reason:@"prepareToWake cleanup previous handler"];
  v20 = (void *)MEMORY[0x1E4F4F6B8];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke;
  v40[3] = &unk_1E6B04658;
  v40[4] = self;
  id v21 = v16;
  id v41 = v21;
  SEL v42 = a2;
  v22 = [v20 sentinelWithQueue:MEMORY[0x1E4F14428] signalHandler:v40];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  v37 = __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke_2;
  v38 = &unk_1E6AF4AC0;
  id v23 = v22;
  id v39 = v23;
  v24 = (void *)[&v35 copy];
  id wakeCompletionBlock = self->_wakeCompletionBlock;
  self->_id wakeCompletionBlock = v24;

  -[SBScreenWakeAnimationController _setLastBacklightChangeSource:](self, "_setLastBacklightChangeSource:", a3, v35, v36, v37, v38);
  self->_finalTimeAlpha = a4;
  self->_finalStatusBarAlpha = a5;
  if (!v19)
  {
    [(SBScreenWakeAnimationController *)self _setRelevantLockScreenViewsHidden:1];
    v26 = SBLogStatusBarish();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[SBScreenWakeAnimationController prepareToWakeForSource:timeAlpha:statusBarAlpha:target:dateView:completion:](v26);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarManager);
    v28 = [WeakRetained assertionManager];

    v29 = (SBWindowSceneStatusBarSettingsAssertion *)[v28 newSettingsAssertionWithStatusBarHidden:1 atLevel:8 reason:@"screenFadeAnimationController"];
    statusBarAssertion = self->_statusBarAssertion;
    self->_statusBarAssertion = v29;

    [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarAssertion acquire];
  }
  v31 = +[SBBacklightController sharedInstance];
  v32 = v31;
  if (!v19) {
    -[SBScreenWakeAnimationController _updateWakeEffectsForWake:animated:completion:](self, "_updateWakeEffectsForWake:animated:completion:", [v31 backlightState] == 3, 0, 0);
  }
  *(_WORD *)&self->_animatingForWake = 0;
  [(SBScreenWakeAnimationController *)self _setInteractionEventsIgnored:a3 == 20];
  if ([v32 screenIsOn])
  {
    [(SBScreenWakeAnimationController *)self _startWakeIfNecessary];
  }
  else
  {
    v33 = SBLogScreenWake();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, "now waiting for screen unblank", buf, 2u);
    }

    self->_waitingForScreenUnblank = 1;
    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:self selector:sel__startWakeFromUnblankNotification name:@"SBBacklightPreFadeBacklightActivationCompleteNotification" object:0];
  }
}

void __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) _setInteractionEventsIgnored:0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  BOOL v4 = +[SBPlatformController sharedInstance];
  int v5 = [v4 isInternalInstall];

  if (v5 && [v7 isFailed])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"SBScreenWakeAnimationController.m" lineNumber:188 description:@"Wake animation completion block failed to fire organically"];
  }
}

uint64_t __110__SBScreenWakeAnimationController_prepareToWakeForSource_timeAlpha_statusBarAlpha_target_dateView_completion___block_invoke_2(uint64_t a1)
{
  v2 = SBLogScreenWake();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, " inside _wakeCompletionBlock", v5, 2u);
  }

  uint64_t v3 = [MEMORY[0x1E4FA60D0] sharedInstance];
  [v3 wakeDidEnd];

  return [*(id *)(a1 + 32) signal];
}

- (void)_updateWakeEffectsForWake:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v11 = a5;
  double v8 = +[SBWallpaperController sharedInstance];
  int v9 = [v8 posterHandlesWakeAnimation];

  target = self->_target;
  if (v9) {
    [(SBFScreenWakeAnimationTarget *)target removeAllWakeEffects];
  }
  else {
    [(SBFScreenWakeAnimationTarget *)target updateWakeEffectsForWake:v6 animated:v5 completion:v11];
  }
}

- (void)_startWakeFromUnblankNotification
{
  uint64_t v3 = SBLogScreenWake();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_startWakeFromUnblankNotification", v4, 2u);
  }

  [(SBScreenWakeAnimationController *)self _startWakeIfNecessary];
}

- (void)_startWakeIfNecessary
{
  if (self->_waitingForScreenUnblank)
  {
    uint64_t v3 = SBLogScreenWake();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "no longer waiting for screen unblank", v6, 2u);
    }

    self->_waitingForScreenUnblank = 0;
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:@"SBBacklightPreFadeBacklightActivationCompleteNotification" object:0];
  }
  if (self->_preparingToAnimateWake)
  {
    *(_WORD *)&self->_preparingToAnimateWake = 256;
    BOOL v5 = [(SBScreenWakeAnimationController *)self _animationSettingsForBacklightChangeSource:self->_lastBacklightChangeSource isWake:1];
    [(SBScreenWakeAnimationController *)self _startWakeAnimationsForWaking:1 animationSettings:v5];
  }
  else
  {
    [(SBScreenWakeAnimationController *)self _runCompletionHandlerForWake:1 reason:@"_startWakeIfNecessary not preparing to animate wake"];
  }
}

- (void)_cleanupAnimationWhenInterruptingWaking:(BOOL)a3
{
}

- (void)_cleanupAnimationWhenInterruptingWaking:(BOOL)a3 force:(BOOL)a4
{
  *(_WORD *)&self->_animatingWallpaper = 0;
  self->_animatingBacklight = 0;
  [(SBScreenWakeAnimationController *)self _handleAnimationCompletionIfNecessaryForWaking:a3 force:a4];
}

- (void)_setLastBacklightChangeSource:(int64_t)a3
{
  if (self->_lastBacklightChangeSource != a3) {
    self->_lastBacklightChangeSource = a3;
  }
}

- (void)_startWakeAnimationsForWaking:(BOOL)a3 animationSettings:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SBLogScreenWake();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v33 = v4;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "_startWakeAnimationsForWaking: %{BOOL}d", buf, 8u);
  }

  int v8 = self->_animationToken + 1;
  self->_animationToken = v8;
  int v9 = +[SBBacklightController sharedInstance];
  if (v4) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 3;
  }
  id v11 = [(SBScreenWakeAnimationController *)self delegate];
  v12 = v11;
  if (v11) {
    uint64_t v10 = [v11 targetBacklightStateForSource:self->_lastBacklightChangeSource isWake:v4];
  }
  int64_t lastBacklightChangeSource = self->_lastBacklightChangeSource;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke;
  v28[3] = &unk_1E6AF5770;
  BOOL v31 = v4;
  id v14 = v9;
  id v29 = v14;
  v30 = self;
  [v14 setBacklightState:v10 source:lastBacklightChangeSource animated:1 completion:v28];
  if (!v4)
  {
    if ([v14 backlightState] != 3)
    {
      uint64_t v16 = 0;
      *(_WORD *)&self->_animatingContent = 256;
      goto LABEL_15;
    }
    self->_finalTimeAlpha = 1.0;
  }
  self->_animatingBacklight = 0;
  id v15 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_HANDLE_WAKE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  uint64_t v16 = 1;
  self->_animatingContent = 1;
  v17 = (void *)MEMORY[0x1E4F4F898];
  v18 = [v6 contentWakeSettings];
  BOOL v19 = [v18 BSAnimationSettings];
  v20 = [v17 factoryWithSettings:v19];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_45;
  v27[3] = &unk_1E6AF4AC0;
  v27[4] = self;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_2;
  v24[3] = &unk_1E6B04680;
  int v25 = v8;
  v24[4] = self;
  char v26 = 1;
  [MEMORY[0x1E4F4F898] animateWithFactory:v20 options:6 actions:v27 completion:v24];

LABEL_15:
  self->_animatingWallpaper = 1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_52;
  v21[3] = &unk_1E6B04680;
  int v22 = v8;
  v21[4] = self;
  char v23 = v16;
  [(SBScreenWakeAnimationController *)self _updateWakeEffectsForWake:v16 animated:1 completion:v21];
}

uint64_t __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 32) screenIsOn];
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(v1 + 40) + 82) = 0;
      v2 = *(void **)(v1 + 40);
      return [v2 _cleanupAnimationWhenInterruptingWaking:0 force:1];
    }
  }
  return result;
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_45(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  [*(id *)(a1 + 32) _setRelevantLockScreenViewsHidden:0];
  v2 = +[SBLockScreenManager sharedInstance];
  int v3 = [v2 isLockScreenDisabledForAssertion];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)v1 + 104));
    BOOL v5 = [WeakRetained statusBar];

    id v6 = SBLogStatusBarish();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_45_cold_1(v5, v6);
    }

    id v7 = *(void **)(*(void *)v1 + 96);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_47;
    v13[3] = &unk_1E6AF5810;
    id v14 = v5;
    id v8 = v5;
    [v7 modifySettingsWithBlock:v13];
  }
  else
  {
    int v9 = SBLogStatusBarish();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_45_cold_2(v1, v9);
    }

    uint64_t v10 = *(void *)v1;
    id v11 = *(void **)(*(void *)v1 + 96);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_50;
    v12[3] = &unk_1E6AF5810;
    v12[4] = v10;
    [v11 modifySettingsWithBlock:v12];
  }
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_47(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 alpha];
  objc_msgSend(v2, "numberWithDouble:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setAlpha:v5];
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_50(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  double v3 = *(double *)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  id v5 = [v2 numberWithDouble:v3];
  [v4 setAlpha:v5];
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_2(uint64_t a1)
{
  v2 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_HANDLE_WAKE", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  kdebug_trace();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(v3 + 56))
  {
    *(unsigned char *)(v3 + 81) = 0;
    [*(id *)(a1 + 32) _setInteractionEventsIgnored:0];
    [*(id *)(a1 + 32) _handleAnimationCompletionIfNecessaryForWaking:*(unsigned __int8 *)(a1 + 44)];
    [*(id *)(*(void *)(a1 + 32) + 96) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = 0;
  }
}

uint64_t __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_52(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(result + 40) == *(_DWORD *)(v1 + 56))
  {
    *(unsigned char *)(v1 + 80) = 0;
    return [*(id *)(result + 32) _handleAnimationCompletionIfNecessaryForWaking:*(unsigned __int8 *)(result + 44)];
  }
  return result;
}

- (void)setScreenWakeTemporarilyDisabled:(BOOL)a3 forReason:(id)a4
{
  temporaryDisabledReasons = self->_temporaryDisabledReasons;
  if (a3) {
    [(NSMutableSet *)temporaryDisabledReasons addObject:a4];
  }
  else {
    [(NSMutableSet *)temporaryDisabledReasons removeObject:a4];
  }
}

- (void)sleepForSource:(int64_t)a3 target:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_target, a4);
  if ([(NSMutableSet *)self->_temporaryDisabledReasons count])
  {
    id v11 = SBLogBacklight();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      temporaryDisabledReasons = self->_temporaryDisabledReasons;
      int v13 = 138543362;
      id v14 = temporaryDisabledReasons;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Should not turn the screen off due to outstanding reasons: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    [(SBScreenWakeAnimationController *)self sleepForSource:a3 completion:v10];
  }
}

- (void)sleepForSource:(int64_t)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(SBScreenWakeAnimationController *)self isWakeAnimationInProgress];
  id v8 = SBLogScreenWake();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = SBSBacklightChangeSourceDescription(a3);
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    __int16 v19 = 1024;
    BOOL v20 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "sleepForSource:%{public}@ reversingWake:%{BOOL}u", buf, 0x12u);
  }
  if (v7)
  {
    self->_waitingForScreenUnblank = 0;
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 removeObserver:self name:@"SBBacklightPreFadeBacklightActivationCompleteNotification" object:0];

    [(SBScreenWakeAnimationController *)self _cleanupAnimationWhenInterruptingWaking:1];
  }
  [(SBScreenWakeAnimationController *)self _runCompletionHandlerForWake:0 reason:@"sleepForSource cleanup previous handler"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SBScreenWakeAnimationController_sleepForSource_completion___block_invoke;
  v15[3] = &unk_1E6AF5300;
  id v16 = v6;
  id v11 = v6;
  v12 = (void *)[v15 copy];
  id sleepCompletionBlock = self->_sleepCompletionBlock;
  self->_id sleepCompletionBlock = v12;

  self->_finalTimeAlpha = 0.0;
  *(_WORD *)&self->_preparingToAnimateWake = 0;
  self->_animatingForSleep = 1;
  [(SBScreenWakeAnimationController *)self _setLastBacklightChangeSource:a3];
  id v14 = [(SBScreenWakeAnimationController *)self _animationSettingsForBacklightChangeSource:self->_lastBacklightChangeSource isWake:0];
  [(SBScreenWakeAnimationController *)self _startWakeAnimationsForWaking:0 animationSettings:v14];
}

uint64_t __61__SBScreenWakeAnimationController_sleepForSource_completion___block_invoke(uint64_t a1)
{
  v2 = SBLogScreenWake();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, " inside _sleepCompletionBlock", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleAnimationCompletionIfNecessaryForWaking:(BOOL)a3
{
}

- (void)_handleAnimationCompletionIfNecessaryForWaking:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_animatingBacklight || self->_animatingWallpaper || self->_animatingContent) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = !self->_waitingForScreenUnblank || a4;
  }
  BOOL v7 = !self->_preparingToAnimateWake
    && !self->_animatingForWake
    && !self->_animatingForSleep
    && !self->_waitingForScreenUnblank;
  *(_WORD *)&self->_animatingForWake = 0;
  if (v6)
  {
    id v8 = SBLogScreenWake();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109376;
      BOOL v15 = v4;
      __int16 v16 = 1024;
      LODWORD(v17) = v7;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "_handleAnimationCompletionIfNecessaryForWaking:%{BOOL}u invoking callback (cleanupTarget:%{BOOL}u)", (uint8_t *)&v14, 0xEu);
    }

    [(SBScreenWakeAnimationController *)self _runCompletionHandlerForWake:v4 reason:@"animation complete"];
    [(SBScreenWakeAnimationController *)self _setRelevantLockScreenViewsHidden:0];
    if (!v7) {
      return;
    }
LABEL_25:
    target = self->_target;
    self->_target = 0;

    return;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = v9;
  if (self->_animatingBacklight) {
    [v9 addObject:@"animatingBacklight"];
  }
  if (self->_animatingWallpaper) {
    [v10 addObject:@"animatingWallpaper"];
  }
  if (self->_animatingContent) {
    [v10 addObject:@"animatingContent"];
  }
  if (self->_waitingForScreenUnblank) {
    [v10 addObject:@"waitingForScreenUnblank"];
  }
  id v11 = SBLogScreenWake();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v10 componentsJoinedByString:@","];
    int v14 = 67109634;
    BOOL v15 = v4;
    __int16 v16 = 2114;
    v17 = v12;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "_handleAnimationCompletionIfNecessaryForWaking:%{BOOL}u skipping callback because:(%{public}@) (cleanupTarget:%{BOOL}u)", (uint8_t *)&v14, 0x18u);
  }
  if (v7) {
    goto LABEL_25;
  }
}

- (void)_runCompletionHandlerForWake:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4)
  {
    if (self->_wakeCompletionBlock)
    {
      if (self->_insideWakeCompletionBlock)
      {
        int v13 = [MEMORY[0x1E4F28B00] currentHandler];
        int v14 = [NSString stringWithUTF8String:"-[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:]"];
        [v13 handleFailureInFunction:v14 file:@"SBScreenWakeAnimationController.m" lineNumber:465 description:@"really shouldn't invoke the wake block from inside the wake block"];
      }
      BOOL v7 = SBLogScreenWake();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = v6;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, " invoking _wakeCompletionBlock reason:%{public}@", (uint8_t *)&v17, 0xCu);
      }

      self->_insideWakeCompletionBlock = 1;
      (*((void (**)(void))self->_wakeCompletionBlock + 2))();
      self->_insideWakeCompletionBlock = 0;
      id wakeCompletionBlock = self->_wakeCompletionBlock;
      self->_id wakeCompletionBlock = 0;

      statusBarAssertion = self->_statusBarAssertion;
      p_statusBarAssertion = (void **)&self->_statusBarAssertion;
      [(SBWindowSceneStatusBarSettingsAssertion *)statusBarAssertion invalidate];
LABEL_14:
      v12 = *p_statusBarAssertion;
      *p_statusBarAssertion = 0;
    }
  }
  else if (self->_sleepCompletionBlock)
  {
    if (self->_insideSleepCompletionBlock)
    {
      BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v16 = [NSString stringWithUTF8String:"-[SBScreenWakeAnimationController _runCompletionHandlerForWake:reason:]"];
      [v15 handleFailureInFunction:v16 file:@"SBScreenWakeAnimationController.m" lineNumber:477 description:@"really shouldn't invoke the sleep block from inside the sleep block"];
    }
    id v11 = SBLogScreenWake();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v6;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, " invoking _sleepCompletionBlock reason:%{public}@", (uint8_t *)&v17, 0xCu);
    }

    self->_insideSleepCompletionBlock = 1;
    (*((void (**)(void))self->_sleepCompletionBlock + 2))();
    self->_insideSleepCompletionBlock = 0;
    p_statusBarAssertion = &self->_sleepCompletionBlock;
    goto LABEL_14;
  }
}

- (NSString)description
{
  return (NSString *)[(SBScreenWakeAnimationController *)self descriptionWithMultilinePrefix:@"[ScreenWake]"];
}

- (id)succinctDescription
{
  v2 = [(SBScreenWakeAnimationController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBScreenWakeAnimationController *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBScreenWakeAnimationController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBScreenWakeAnimationController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __73__SBScreenWakeAnimationController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 48) withName:@"isPreparingToAnimateWake"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 49) withName:@"isAnimatingForWake"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 50) withName:@"isAnimatingForSleep"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 51) withName:@"insideWakeCompletionBlock"];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 52) withName:@"insideSleepCompletionBlock"];
  id v7 = (id)[*(id *)(a1 + 32) appendInt:*(unsigned int *)(*(void *)(a1 + 40) + 56) withName:@"animationToken"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 80) withName:@"isAnimatingWallpaper"];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 82) withName:@"isAnimatingBacklight"];
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 81) withName:@"isAnimatingContent"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"wakeEffectTarget"];
}

- (SBScreenWakeAnimationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBScreenWakeAnimationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_temporaryDisabledReasons, 0);
  objc_destroyWeak((id *)&self->_statusBarManager);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong(&self->_sleepCompletionBlock, 0);
  objc_storeStrong(&self->_wakeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)prepareToWakeForSource:(os_log_t)log timeAlpha:statusBarAlpha:target:dateView:completion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  id v2 = "-[SBScreenWakeAnimationController prepareToWakeForSource:timeAlpha:statusBarAlpha:target:dateView:completion:]";
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "%s: setting status bar alpha: 0", (uint8_t *)&v1, 0xCu);
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_45_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 alpha];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[SBScreenWakeAnimationController] _startFadeAnimationsForFadeIn: setting status bar alpha: %f", (uint8_t *)&v4, 0xCu);
}

void __83__SBScreenWakeAnimationController__startWakeAnimationsForWaking_animationSettings___block_invoke_45_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 32);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[SBScreenWakeAnimationController] _startFadeAnimationsForFadeIn: setting status bar alpha: %f", (uint8_t *)&v3, 0xCu);
}

@end