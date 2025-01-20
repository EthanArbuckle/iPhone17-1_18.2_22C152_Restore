@interface SBCoverSheetAnimator
- (BOOL)isTransitioning;
- (SBCoverSheetAnimator)initWithCoverSheetWindow:(id)a3 sceneManager:(id)a4 hostingWindow:(id)a5 switcherWindow:(id)a6 wallpaperController:(id)a7 folderController:(id)a8 unlockSettings:(id)a9;
- (SBFolderController)folderController;
- (SBHUnlockSettings)unlockSettings;
- (SBIconZoomAnimator)iconAnimator;
- (SBLockToAppStatusBarAnimator)statusBarAnimator;
- (SBSceneManager)sceneManager;
- (SBWallpaperController)wallpaperController;
- (SBWindowSelfHostWrapper)coverSheetWindowHostWrapper;
- (UIWindow)coverSheetWindow;
- (UIWindow)hostingWindow;
- (UIWindow)switcherWindow;
- (void)_prepareIconAnimatorIncludingLockScreen:(BOOL)a3;
- (void)_setWallpaperToLocked:(BOOL)a3 duration:(double)a4;
- (void)_updateCoverSheetHosting;
- (void)animateToCoverSheet:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)setCoverSheetWindow:(id)a3;
- (void)setCoverSheetWindowHostWrapper:(id)a3;
- (void)setFolderController:(id)a3;
- (void)setHostingWindow:(id)a3;
- (void)setIconAnimator:(id)a3;
- (void)setSceneManager:(id)a3;
- (void)setStatusBarAnimator:(id)a3;
- (void)setSwitcherWindow:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setUnlockSettings:(id)a3;
- (void)setWallpaperController:(id)a3;
@end

@implementation SBCoverSheetAnimator

- (SBCoverSheetAnimator)initWithCoverSheetWindow:(id)a3 sceneManager:(id)a4 hostingWindow:(id)a5 switcherWindow:(id)a6 wallpaperController:(id)a7 folderController:(id)a8 unlockSettings:(id)a9
{
  id obj = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SBCoverSheetAnimator;
  v18 = [(SBCoverSheetAnimator *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_coverSheetWindow, obj);
    objc_storeStrong((id *)&v19->_sceneManager, a4);
    objc_storeStrong((id *)&v19->_hostingWindow, a5);
    objc_storeStrong((id *)&v19->_switcherWindow, a6);
    objc_storeStrong((id *)&v19->_wallpaperController, a7);
    objc_storeStrong((id *)&v19->_folderController, a8);
    objc_storeStrong((id *)&v19->_unlockSettings, a9);
  }

  return v19;
}

- (void)animateToCoverSheet:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = 0.0;
  if (a3)
  {
    id v10 = 0;
    double v11 = 0.0;
  }
  else
  {
    if (v5)
    {
      v12 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_UNLOCK_ANIMATION_START", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }

      kdebug_trace();
      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"SBCoverSheetWillAnimateDeactivation" object:self];
    }
    v14 = objc_alloc_init(SBLockToAppStatusBarAnimator);
    statusBarAnimator = self->_statusBarAnimator;
    self->_statusBarAnimator = v14;

    [(SBLockToAppStatusBarAnimator *)self->_statusBarAnimator animateStatusBarFromLockToHome];
    [(SBCoverSheetAnimator *)self _prepareIconAnimatorIncludingLockScreen:1];
    double v11 = 1.0;
    [(SBIconZoomAnimator *)self->_iconAnimator setFraction:1.0];
    [MEMORY[0x1E4F42D58] _synchronizeDrawing];
    id v16 = (void *)MEMORY[0x1E4F4F6B8];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke;
    v29[3] = &unk_1E6AF6828;
    v29[4] = self;
    id v30 = v8;
    id v17 = [v16 sentinelWithQueue:MEMORY[0x1E4F14428] signalCount:2 completion:v29];
    iconAnimator = self->_iconAnimator;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_2;
    v27[3] = &unk_1E6AF5350;
    id v10 = v17;
    id v28 = v10;
    [(SBIconZoomAnimator *)iconAnimator animateToFraction:v27 afterDelay:0.0 withCompletion:0.0];
  }
  if (v5) {
    double v9 = 0.5;
  }
  v19 = (void *)MEMORY[0x1E4F42FF0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_3;
  v25[3] = &unk_1E6AFA400;
  v25[4] = self;
  BOOL v26 = a3;
  *(double *)&v25[5] = v11;
  *(double *)&v25[6] = v9;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_4;
  v22[3] = &unk_1E6AF5AA0;
  id v23 = v10;
  id v24 = v8;
  id v20 = v8;
  id v21 = v10;
  [v19 animateWithDuration:v25 animations:v22 completion:v9];
}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) cleanup];
  [*(id *)(*(void *)(a1 + 32) + 32) stopHosting];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:*(double *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  double v4 = *(double *)(a1 + 48);
  return [v2 _setWallpaperToLocked:v3 duration:v4];
}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    return [v2 signal];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateCoverSheetHosting
{
  coverSheetWindowHostWrapper = self->_coverSheetWindowHostWrapper;
  if (coverSheetWindowHostWrapper) {
    [(SBWindowSelfHostWrapper *)coverSheetWindowHostWrapper stopHosting];
  }
  id v9 = [(SBCoverSheetAnimator *)self coverSheetWindow];
  hostingWindow = self->_hostingWindow;
  BOOL v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  objc_msgSend(v9, "sb_hostWrapperForUseInWindow:hostRequester:", hostingWindow, v6);
  v7 = (SBWindowSelfHostWrapper *)objc_claimAutoreleasedReturnValue();
  id v8 = self->_coverSheetWindowHostWrapper;
  self->_coverSheetWindowHostWrapper = v7;
}

- (void)_prepareIconAnimatorIncludingLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(SBCoverSheetAnimator *)self _updateCoverSheetHosting];
    BOOL v5 = [SBCenterAppIconZoomAnimator alloc];
    folderController = self->_folderController;
    v7 = [(SBWindowSelfHostWrapper *)self->_coverSheetWindowHostWrapper hostView];
  }
  else
  {
    BOOL v5 = [SBCenterAppIconZoomAnimator alloc];
    v7 = 0;
    folderController = self->_folderController;
  }
  id v8 = [(SBCenterAppIconZoomAnimator *)v5 initWithFolderController:folderController appView:v7];
  iconAnimator = self->_iconAnimator;
  self->_iconAnimator = v8;

  if (v3) {
  [(SBIconZoomAnimator *)self->_iconAnimator setSettings:self->_unlockSettings];
  }
  [(SBIconZoomAnimator *)self->_iconAnimator setDistantScale:0.26];
  id v10 = self->_iconAnimator;
  [(SBIconZoomAnimator *)v10 prepare];
}

- (void)_setWallpaperToLocked:(BOOL)a3 duration:(double)a4
{
  BOOL v6 = !a3;
  objc_msgSend(MEMORY[0x1E4F4F898], "factoryWithDuration:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [MEMORY[0x1E4F4F898] factoryWithDuration:a4];
  [(SBWallpaperController *)self->_wallpaperController setActiveVariant:v6 withOutAnimationFactory:v7 inAnimationFactory:v8 completion:0];
}

- (SBLockToAppStatusBarAnimator)statusBarAnimator
{
  return self->_statusBarAnimator;
}

- (void)setStatusBarAnimator:(id)a3
{
}

- (SBIconZoomAnimator)iconAnimator
{
  return self->_iconAnimator;
}

- (void)setIconAnimator:(id)a3
{
}

- (SBWindowSelfHostWrapper)coverSheetWindowHostWrapper
{
  return self->_coverSheetWindowHostWrapper;
}

- (void)setCoverSheetWindowHostWrapper:(id)a3
{
}

- (SBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)setSceneManager:(id)a3
{
}

- (UIWindow)hostingWindow
{
  return self->_hostingWindow;
}

- (void)setHostingWindow:(id)a3
{
}

- (UIWindow)switcherWindow
{
  return self->_switcherWindow;
}

- (void)setSwitcherWindow:(id)a3
{
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (void)setWallpaperController:(id)a3
{
}

- (SBFolderController)folderController
{
  return self->_folderController;
}

- (void)setFolderController:(id)a3
{
}

- (SBHUnlockSettings)unlockSettings
{
  return self->_unlockSettings;
}

- (void)setUnlockSettings:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UIWindow)coverSheetWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setCoverSheetWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverSheetWindow);
  objc_storeStrong((id *)&self->_unlockSettings, 0);
  objc_storeStrong((id *)&self->_folderController, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_switcherWindow, 0);
  objc_storeStrong((id *)&self->_hostingWindow, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_coverSheetWindowHostWrapper, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_statusBarAnimator, 0);
}

@end