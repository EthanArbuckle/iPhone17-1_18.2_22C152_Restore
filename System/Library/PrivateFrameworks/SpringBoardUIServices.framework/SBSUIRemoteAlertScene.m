@interface SBSUIRemoteAlertScene
- (NSString)configurationIdentifier;
- (SBSRemoteAlertActivationContext)activationContext;
- (SBSRemoteAlertConfigurationContext)configurationContext;
- (void)_readySceneForConnection;
- (void)deactivate;
- (void)invalidate;
- (void)setAllowsAlertStacking:(BOOL)a3;
- (void)setAllowsMenuButtonDismissal:(BOOL)a3;
- (void)setBackgroundActivitiesToSuppress:(id)a3 animationSettings:(id)a4;
- (void)setContentOpaque:(BOOL)a3;
- (void)setContentOverlaysStatusBar:(BOOL)a3 animationSettings:(id)a4;
- (void)setDesiredAutoLockDuration:(double)a3;
- (void)setDesiredHardwareButtonEvents:(unint64_t)a3;
- (void)setDesiredIdleTimerSettings:(id)a3;
- (void)setDisablesAlertItems:(BOOL)a3;
- (void)setDisablesBanners:(BOOL)a3;
- (void)setDisablesControlCenter:(BOOL)a3;
- (void)setDisablesSiri:(BOOL)a3;
- (void)setDismissalAnimationStyle:(int64_t)a3;
- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setInputHardwareEventsDisabled:(BOOL)a3;
- (void)setInteractiveScreenshotGestureDisabled:(BOOL)a3;
- (void)setOrientationChangedEventsDisabled:(BOOL)a3;
- (void)setReachabilityDisabled:(BOOL)a3;
- (void)setSceneDeactivationReason:(id)a3;
- (void)setSwipeDismissalStyle:(int64_t)a3;
- (void)setWallpaperStyle:(int64_t)a3 animationSettings:(id)a4;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3;
@end

@implementation SBSUIRemoteAlertScene

- (void)_readySceneForConnection
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7607000, log, OS_LOG_TYPE_ERROR, "Remote alert scene doesn't have its scene extension?!", v1, 2u);
}

void __49__SBSUIRemoteAlertScene__readySceneForConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setInitialRemoteAlertActivationContext:0];
  [v2 setInitialRemoteAlertConfigurationContext:0];
}

- (NSString)configurationIdentifier
{
  id v2 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v3 = [v2 settings];
  v4 = [v3 configurationIdentifier];

  return (NSString *)v4;
}

- (SBSRemoteAlertConfigurationContext)configurationContext
{
  id v2 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v3 = objc_msgSend(v2, "SBSUI_remoteAlertComponent");
  v4 = [v3 configurationContext];

  return (SBSRemoteAlertConfigurationContext *)v4;
}

- (SBSRemoteAlertActivationContext)activationContext
{
  id v2 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v3 = objc_msgSend(v2, "SBSUI_remoteAlertComponent");
  v4 = [v3 activationContext];

  return (SBSRemoteAlertActivationContext *)v4;
}

- (void)deactivate
{
  id v2 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  [v2 updateClientSettings:&__block_literal_global_3_1];
}

uint64_t __35__SBSUIRemoteAlertScene_deactivate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setWantsDeactivation:1];
}

- (void)invalidate
{
  id v2 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  [v2 updateClientSettings:&__block_literal_global_5];
}

uint64_t __35__SBSUIRemoteAlertScene_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setWantsInvalidation:1];
}

- (void)setDisablesBanners:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SBSUIRemoteAlertScene_setDisablesBanners___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __44__SBSUIRemoteAlertScene_setDisablesBanners___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisablesBanners:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDisablesAlertItems:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SBSUIRemoteAlertScene_setDisablesAlertItems___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __47__SBSUIRemoteAlertScene_setDisablesAlertItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisablesAlertItems:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDisablesControlCenter:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBSUIRemoteAlertScene_setDisablesControlCenter___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __50__SBSUIRemoteAlertScene_setDisablesControlCenter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisablesControlCenter:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDisablesSiri:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SBSUIRemoteAlertScene_setDisablesSiri___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __41__SBSUIRemoteAlertScene_setDisablesSiri___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisablesSiri:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setInteractiveScreenshotGestureDisabled:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SBSUIRemoteAlertScene_setInteractiveScreenshotGestureDisabled___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __65__SBSUIRemoteAlertScene_setInteractiveScreenshotGestureDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisablesInteractiveScreenshotGesture:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setReachabilityDisabled:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SBSUIRemoteAlertScene_setReachabilityDisabled___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __49__SBSUIRemoteAlertScene_setReachabilityDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisablesReachability:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setAllowsAlertStacking:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SBSUIRemoteAlertScene_setAllowsAlertStacking___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __48__SBSUIRemoteAlertScene_setAllowsAlertStacking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowsAlertStacking:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setAllowsMenuButtonDismissal:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBSUIRemoteAlertScene_setAllowsMenuButtonDismissal___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __54__SBSUIRemoteAlertScene_setAllowsMenuButtonDismissal___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowsMenuButtonDismissal:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDesiredHardwareButtonEvents:(unint64_t)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SBSUIRemoteAlertScene_setDesiredHardwareButtonEvents___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  void v5[4] = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __56__SBSUIRemoteAlertScene_setDesiredHardwareButtonEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredHardwareButtonEvents:*(void *)(a1 + 32)];
}

- (void)setContentOpaque:(BOOL)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SBSUIRemoteAlertScene_setContentOpaque___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __42__SBSUIRemoteAlertScene_setContentOpaque___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentOpaque:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setWallpaperStyle:(int64_t)a3 animationSettings:(id)a4
{
  id v6 = a4;
  v7 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBSUIRemoteAlertScene_setWallpaperStyle_animationSettings___block_invoke;
  v9[3] = &unk_1E5CCDC98;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 updateClientSettings:v9];
}

void __61__SBSUIRemoteAlertScene_setWallpaperStyle_animationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 isUISubclass])
  {
    [v6 setBackgroundStyle:*(void *)(a1 + 40)];
    [v5 setAnimationSettings:*(void *)(a1 + 32)];
  }
}

- (void)setDismissalAnimationStyle:(int64_t)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SBSUIRemoteAlertScene_setDismissalAnimationStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  void v5[4] = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __52__SBSUIRemoteAlertScene_setDismissalAnimationStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDismissalAnimationStyle:*(void *)(a1 + 32)];
}

- (void)setSwipeDismissalStyle:(int64_t)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SBSUIRemoteAlertScene_setSwipeDismissalStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  void v5[4] = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __48__SBSUIRemoteAlertScene_setSwipeDismissalStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSwipeDismissalStyle:*(void *)(a1 + 32)];
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBSUIRemoteAlertScene_setWhitePointAdaptivityStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  void v5[4] = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __54__SBSUIRemoteAlertScene_setWhitePointAdaptivityStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWhitePointAdaptivityStyle:*(void *)(a1 + 32)];
}

- (void)setBackgroundActivitiesToSuppress:(id)a3 animationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__SBSUIRemoteAlertScene_setBackgroundActivitiesToSuppress_animationSettings___block_invoke;
  v11[3] = &unk_1E5CCDCC0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 updateClientSettings:v11];
}

void __77__SBSUIRemoteAlertScene_setBackgroundActivitiesToSuppress_animationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [a2 setBackgroundActivitiesToSuppress:v5];
  [v6 setAnimationSettings:*(void *)(a1 + 40)];
}

- (void)setContentOverlaysStatusBar:(BOOL)a3 animationSettings:(id)a4
{
  id v6 = a4;
  id v7 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBSUIRemoteAlertScene_setContentOverlaysStatusBar_animationSettings___block_invoke;
  v9[3] = &unk_1E5CCDCE8;
  BOOL v11 = a3;
  id v10 = v6;
  id v8 = v6;
  [v7 updateClientSettings:v9];
}

void __71__SBSUIRemoteAlertScene_setContentOverlaysStatusBar_animationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  [a2 setContentOverlaysStatusBar:v5];
  [v6 setAnimationSettings:*(void *)(a1 + 32)];
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  id v6 = a4;
  id v7 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SBSUIRemoteAlertScene_setIdleTimerDisabled_forReason___block_invoke;
  v9[3] = &unk_1E5CCDCE8;
  BOOL v11 = a3;
  id v10 = v6;
  id v8 = v6;
  [v7 updateClientSettings:v9];
}

void __56__SBSUIRemoteAlertScene_setIdleTimerDisabled_forReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  id v5 = a3;
  [v5 setWantsIdleTimerDisabled:v4];
  [v5 setWantsIdleTimerDisabledReason:*(void *)(a1 + 32)];
}

- (void)setDesiredAutoLockDuration:(double)a3
{
  uint64_t v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SBSUIRemoteAlertScene_setDesiredAutoLockDuration___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  *(double *)&void v5[4] = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __52__SBSUIRemoteAlertScene_setDesiredAutoLockDuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredAutoLockDuration:*(double *)(a1 + 32)];
}

- (void)setDesiredIdleTimerSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBSUIRemoteAlertScene_setDesiredIdleTimerSettings___block_invoke;
  v7[3] = &unk_1E5CCDD10;
  id v8 = v4;
  id v6 = v4;
  [v5 updateClientSettings:v7];
}

uint64_t __53__SBSUIRemoteAlertScene_setDesiredIdleTimerSettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredIdleTimerSettings:*(void *)(a1 + 32)];
}

- (void)setOrientationChangedEventsDisabled:(BOOL)a3
{
  id v4 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SBSUIRemoteAlertScene_setOrientationChangedEventsDisabled___block_invoke;
  v5[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v6 = a3;
  [v4 updateClientSettings:v5];
}

uint64_t __61__SBSUIRemoteAlertScene_setOrientationChangedEventsDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOrientationChangedEventsDisabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setSceneDeactivationReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SBSUIRemoteAlertScene_setSceneDeactivationReason___block_invoke;
  v7[3] = &unk_1E5CCDD10;
  id v8 = v4;
  id v6 = v4;
  [v5 updateClientSettings:v7];
}

uint64_t __52__SBSUIRemoteAlertScene_setSceneDeactivationReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredSceneDeactivationReason:*(void *)(a1 + 32)];
}

- (void)setInputHardwareEventsDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogTransientOverlay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SBSUIRemoteAlertScene *)self _FBSScene];
    id v7 = [v6 identityToken];
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Remote alert scene %{public}@ setting input hardware events disabled: %d", buf, 0x12u);
  }
  id v8 = [(SBSUIRemoteAlertScene *)self _FBSScene];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SBSUIRemoteAlertScene_setInputHardwareEventsDisabled___block_invoke;
  v9[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
  BOOL v10 = v3;
  [v8 updateClientSettings:v9];
}

uint64_t __56__SBSUIRemoteAlertScene_setInputHardwareEventsDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHIDEventDeferringDisabled:*(unsigned __int8 *)(a1 + 32)];
}

@end