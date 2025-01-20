@interface SBLoginAppContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)pluginManager:(id)a3 plugin:(id)a4 handleAction:(id)a5;
- (BOOL)requiresPasscodeInputForUIUnlockFromSource:(int)a3 withOptions:(id)a4;
- (BOOL)shouldAutoUnlockForSource:(int)a3;
- (BOOL)shouldDisableALS;
- (BOOL)shouldShowLockStatusBarTime;
- (BOOL)suppressesControlCenter;
- (BOOL)suppressesScreenshots;
- (BOOL)willUIUnlockFromSource:(int)a3;
- (SBLoginAppContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBLoginAppContainerViewController)initWithNibName:(id)a3 bundle:(id)a4 sceneHoster:(id)a5 wallpaperController:(id)a6;
- (id)_displayLayoutElementIdentifier;
- (id)_hostedAppBundleID;
- (id)_hostedAppView;
- (id)_hostedSceneIdentifier;
- (id)_initWithSceneHoster:(id)a3 wallpaperController:(id)a4;
- (id)_statusBarSettingsAssertion;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (void)_addBatteryChargingView;
- (void)_cleanupBatteryChargingViewWithAnimationDuration:(double)a3;
- (void)_fadeViewsForChargingViewVisible:(BOOL)a3;
- (void)_handleBacklightFadeEnded;
- (void)_killLoginApp;
- (void)_reallyAcquireStatusBarAssertionIfNecessaryInitiallyVisible:(BOOL)a3;
- (void)_reallyRelinquishStatusBarAssertion;
- (void)_removeBatteryChargingView;
- (void)_setupLoginScene;
- (void)_showOrHideThermalTrapUIAnimated:(BOOL)a3;
- (void)_updateBatteryChargingViewAnimated:(BOOL)a3;
- (void)_updateLegibility;
- (void)addLoginObserver:(id)a3;
- (void)chargingViewControllerFadedOutContent:(id)a3;
- (void)dealloc;
- (void)disableLockScreenPluginWithContext:(id)a3;
- (void)enableLockScreenPluginWithContext:(id)a3;
- (void)loadView;
- (void)noteDeviceBlockedStatusUpdated;
- (void)pluginManager:(id)a3 willUnloadPlugin:(id)a4;
- (void)prepareForUILock;
- (void)prepareForUIUnlock;
- (void)removeLoginObserver:(id)a3;
- (void)sceneInvalidated;
- (void)sceneUpdatedIdleTimerMode:(int64_t)a3;
- (void)sceneUpdatedRotationMode:(int64_t)a3;
- (void)sceneUpdatedStatusBarUserName:(id)a3;
- (void)sceneUpdatedWallpaperMode:(unint64_t)a3;
- (void)startLockScreenFadeInAnimationForSource:(int)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4;
@end

@implementation SBLoginAppContainerViewController

- (id)_initWithSceneHoster:(id)a3 wallpaperController:(id)a4
{
  return [(SBLoginAppContainerViewController *)self initWithNibName:0 bundle:0 sceneHoster:a3 wallpaperController:a4];
}

- (SBLoginAppContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(SBLoginAppSceneHoster);
  v9 = +[SBWallpaperController sharedInstance];
  v10 = [(SBLoginAppContainerViewController *)self initWithNibName:v7 bundle:v6 sceneHoster:v8 wallpaperController:v9];

  return v10;
}

- (SBLoginAppContainerViewController)initWithNibName:(id)a3 bundle:(id)a4 sceneHoster:(id)a5 wallpaperController:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBLoginAppContainerViewController;
  v13 = [(SBLoginAppContainerViewController *)&v20 initWithNibName:a3 bundle:a4];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__handleBacklightFadeEnded name:*MEMORY[0x1E4FA7A10] object:0];
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    showStatusBarReasons = v13->_showStatusBarReasons;
    v13->_showStatusBarReasons = (NSMutableSet *)v15;

    objc_storeStrong((id *)&v13->_sceneHoster, a5);
    [(SBLoginAppSceneHoster *)v13->_sceneHoster setDelegate:v13];
    objc_storeStrong((id *)&v13->_wallpaperController, a6);
    [(SBWallpaperController *)v13->_wallpaperController addObserver:v13 forVariant:0];
    v13->_idleTimerMode = 0;
    v17 = objc_alloc_init(SBLockScreenPluginManager);
    pluginManager = v13->_pluginManager;
    v13->_pluginManager = v17;

    [(SBLockScreenPluginManager *)v13->_pluginManager setDelegate:v13];
  }

  return v13;
}

- (void)dealloc
{
  v3 = +[SBWallpaperController sharedInstance];
  [v3 removeObserver:self forVariant:0];

  [(SBLoginAppContainerViewController *)self _reallyRelinquishStatusBarAssertion];
  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  [(SBLoginAppContainerViewController *)&v4 dealloc];
}

- (void)addLoginObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        id v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeLoginObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (v5)
    {
      [(NSHashTable *)self->_observers removeObject:v6];
      id v4 = v6;
    }
  }
}

- (void)loadView
{
  v3 = [SBLoginAppContainerView alloc];
  id v4 = -[SBLoginAppContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBLoginAppContainerView *)v4 setAutoresizingMask:18];
  [(SBLoginAppContainerView *)v4 setAutoresizesSubviews:1];
  [(SBLoginAppContainerViewController *)self setView:v4];
  [(SBLoginAppContainerViewController *)self _updateLegibility];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBLoginAppContainerViewController;
  [(SBLoginAppContainerViewController *)&v5 viewWillAppear:a3];
  [(SBLockScreenPluginManager *)self->_pluginManager setEnabled:1];
  [(SBLoginAppContainerViewController *)self _showOrHideThermalTrapUIAnimated:0];
  id v4 = +[SBLockScreenManager sharedInstanceIfExists];
  if ([v4 isInLostMode]) {
    [v4 enableLostModePlugin];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  [(SBLoginAppContainerViewController *)&v4 viewWillDisappear:a3];
  [(SBLockScreenPluginManager *)self->_pluginManager setEnabled:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLockScreenViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  sceneHoster = self->_sceneHoster;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__SBLoginAppContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E6B086F0;
  id v11 = v7;
  id v9 = v7;
  [(SBLoginAppSceneHoster *)sceneHoster updateSettingsWithTransitionBlock:v10];
}

id __88__SBLoginAppContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F42790];
  id v4 = a2;
  objc_super v5 = [v3 transitionContext];
  id v6 = (void *)MEMORY[0x1E4F4F680];
  [*(id *)(a1 + 32) transitionDuration];
  id v7 = objc_msgSend(v6, "settingsWithDuration:");
  [v5 setAnimationSettings:v7];

  v8 = [MEMORY[0x1E4F42D58] _synchronizedDrawingFence];
  [v5 setAnimationFence:v8];

  id v9 = SBFWindowForViewControllerTransition();
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v9, "_toWindowOrientation"));

  return v5;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBLoginAppContainerViewController;
  [(SBLoginAppContainerViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(SBLoginAppContainerViewController *)self _reallyAcquireStatusBarAssertionIfNecessaryInitiallyVisible:1];
  }
  else {
    [(SBLoginAppContainerViewController *)self _reallyRelinquishStatusBarAssertion];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)willUIUnlockFromSource:(int)a3
{
  return 0;
}

- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3
{
  return 0;
}

- (BOOL)requiresPasscodeInputForUIUnlockFromSource:(int)a3 withOptions:(id)a4
{
  return 0;
}

- (void)noteDeviceBlockedStatusUpdated
{
  id v3 = +[SBBacklightController sharedInstance];
  -[SBLoginAppContainerViewController _showOrHideThermalTrapUIAnimated:](self, "_showOrHideThermalTrapUIAnimated:", [v3 screenIsOn]);
}

- (void)startLockScreenFadeInAnimationForSource:(int)a3
{
  if ((a3 - 21) <= 1 && !self->_batteryChargingViewController) {
    [(SBLoginAppContainerViewController *)self _updateBatteryChargingViewAnimated:0];
  }
  id v7 = +[SBScreenWakeAnimationController sharedInstance];
  id v4 = +[SBBacklightController sharedInstance];
  if (([v4 screenIsOn] & 1) == 0)
  {
    char v5 = [v7 isWakeAnimationInProgress];

    if (v5) {
      goto LABEL_8;
    }
    uint64_t v6 = SBUIConvertUnlockSourceToBacklightChangeSource();
    id v4 = [(SBLockScreenViewControllerBase *)self legacyWallpaperWakeAnimator];
    [v7 prepareToWakeForSource:v6 timeAlpha:v4 statusBarAlpha:0 target:0 dateView:0.0 completion:0.0];
  }

LABEL_8:
}

- (void)enableLockScreenPluginWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [v4 name];
  int v6 = [v5 isEqualToString:@"FindMyiPhoneLockScreen"];

  if (v6
    && !self->_pluginWrapperViewController
    && [(SBLockScreenPluginManager *)self->_pluginManager enableLockScreenPluginWithContext:v4])
  {
    id v7 = [SBLoginAppContainerPluginWrapperViewController alloc];
    v8 = [(SBLockScreenPluginManager *)self->_pluginManager activePlugin];
    id v9 = [(SBLoginAppContainerPluginWrapperViewController *)v7 initWithPlugin:v8];
    pluginWrapperViewController = self->_pluginWrapperViewController;
    self->_pluginWrapperViewController = v9;

    [(SBLoginAppContainerViewController *)self addChildViewController:self->_pluginWrapperViewController];
    id v11 = [(SBLoginAppContainerViewController *)self loginContainerView];
    objc_super v12 = [(SBLoginAppContainerPluginWrapperViewController *)self->_pluginWrapperViewController view];
    [v11 setPluginView:v12];

    [(SBLoginAppContainerPluginWrapperViewController *)self->_pluginWrapperViewController didMoveToParentViewController:self];
    v13 = [(SBLoginAppContainerPluginWrapperViewController *)self->_pluginWrapperViewController view];
    [v13 setAlpha:0.0];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__SBLoginAppContainerViewController_enableLockScreenPluginWithContext___block_invoke;
    v14[3] = &unk_1E6AF4AC0;
    v14[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v14 animations:0.5];
  }
}

void __71__SBLoginAppContainerViewController_enableLockScreenPluginWithContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1056) view];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) loginContainerView];
  [v3 setContentHidden:1 forRequester:@"LockScreenPlugin"];
}

- (void)disableLockScreenPluginWithContext:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (self->_pluginWrapperViewController)
  {
    int v6 = [v4 name];
    int v7 = [v6 isEqualToString:@"FindMyiPhoneLockScreen"];

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F42FF0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke;
      v11[3] = &unk_1E6AF4AC0;
      v11[4] = self;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke_2;
      v9[3] = &unk_1E6AF4A98;
      v9[4] = self;
      id v10 = v5;
      [v8 animateWithDuration:v11 animations:v9 completion:0.5];
    }
  }
}

void __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1056) view];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) loginContainerView];
  [v3 setContentHidden:0 forRequester:@"LockScreenPlugin"];
}

uint64_t __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1056) willMoveToParentViewController:0];
  v2 = [*(id *)(a1 + 32) loginContainerView];
  [v2 setPluginView:0];

  [*(id *)(*(void *)(a1 + 32) + 1056) removeFromParentViewController];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1056);
  *(void *)(v3 + 1056) = 0;

  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(void **)(*(void *)(a1 + 32) + 1096);
  return [v6 disableLockScreenPluginWithContext:v5];
}

- (BOOL)handleHomeButtonDoublePress
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(SBLoginAppSceneHoster *)self->_sceneHoster hostedApp];
  uint64_t v3 = [(id)SBApp menuButtonInterceptApp];
  id v4 = [v3 processState];
  uint64_t v5 = v4;
  if (v2 == v3 && [v4 isRunning])
  {
    int v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = [v2 bundleIdentifier];
      int v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "intercepting menu button event and forwarding to %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v8 = [v2 bundleIdentifier];
    SBSendFakeHomeButtonTapEventToApplication(v8, [v5 pid]);

    id v9 = [v2 bundleIdentifier];
    SBSendFakeHomeButtonTapEventToApplication(v9, [v5 pid]);

    if (([(id)SBApp menuButtonInterceptAppEnabledForever] & 1) == 0) {
      [(id)SBApp setMenuButtonInterceptApp:0 forever:0];
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)handleVolumeUpButtonPress
{
  if ([(SBLoginAppContainerPluginWrapperViewController *)self->_pluginWrapperViewController handleVolumeUpButtonPress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  return [(SBLockScreenViewControllerBase *)&v4 handleVolumeUpButtonPress];
}

- (BOOL)handleVolumeDownButtonPress
{
  if ([(SBLoginAppContainerPluginWrapperViewController *)self->_pluginWrapperViewController handleVolumeDownButtonPress])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  return [(SBLockScreenViewControllerBase *)&v4 handleVolumeDownButtonPress];
}

- (BOOL)shouldShowLockStatusBarTime
{
  return 1;
}

- (BOOL)shouldDisableALS
{
  return 0;
}

- (id)_displayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E4FA6F58];
}

- (BOOL)suppressesScreenshots
{
  return 1;
}

- (void)prepareForUILock
{
  v3.receiver = self;
  v3.super_class = (Class)SBLoginAppContainerViewController;
  [(SBLockScreenViewControllerBase *)&v3 prepareForUILock];
  [(SBLoginAppContainerViewController *)self _setupLoginScene];
  [(SBLoginAppSceneHoster *)self->_sceneHoster setDeferHIDEvents:1];
}

- (void)prepareForUIUnlock
{
  v3.receiver = self;
  v3.super_class = (Class)SBLoginAppContainerViewController;
  [(SBLockScreenViewControllerBase *)&v3 prepareForUIUnlock];
  [(SBLoginAppSceneHoster *)self->_sceneHoster setDeferHIDEvents:0];
}

- (BOOL)suppressesControlCenter
{
  v2 = [MEMORY[0x1E4F5AD18] standardDefaults];
  char v3 = [v2 shouldAlwaysBeEnabled] ^ 1;

  return v3;
}

- (void)_killLoginApp
{
}

- (id)_hostedAppBundleID
{
  return [(SBLoginAppSceneHoster *)self->_sceneHoster hostedAppBundleID];
}

- (id)_hostedAppView
{
  return [(SBLoginAppSceneHoster *)self->_sceneHoster contentView];
}

- (id)_hostedSceneIdentifier
{
  return [(SBLoginAppSceneHoster *)self->_sceneHoster hostedSceneIdentifier];
}

- (id)_statusBarSettingsAssertion
{
  return self->_statusBarAssertion;
}

- (void)_reallyAcquireStatusBarAssertionIfNecessaryInitiallyVisible:(BOOL)a3
{
  if (!self->_statusBarAssertion)
  {
    BOOL v3 = a3;
    uint64_t v5 = [(UIViewController *)self _sbWindowScene];

    if (v5)
    {
      int v6 = [(UIViewController *)self _sbWindowScene];
      int v7 = [v6 statusBarManager];
      id v10 = [v7 assertionManager];

      v8 = (SBWindowSceneStatusBarSettingsAssertion *)[v10 newSettingsAssertionWithStatusBarHidden:!v3 atLevel:10 reason:@"login"];
      statusBarAssertion = self->_statusBarAssertion;
      self->_statusBarAssertion = v8;

      [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarAssertion acquire];
    }
  }
}

- (void)_reallyRelinquishStatusBarAssertion
{
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarAssertion invalidate];
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;
}

- (void)_setupLoginScene
{
  BOOL v3 = [MEMORY[0x1E4F624E0] sharedInstance];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F624E8]) initWithEventQueue:v3 reason:@"Launch LoginUI"];
  uint64_t v5 = [(SBLoginAppContainerViewController *)self interfaceOrientation];
  sceneHoster = self->_sceneHoster;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke;
  v8[3] = &unk_1E6B08718;
  id v9 = v4;
  id v10 = self;
  uint64_t v11 = v5;
  id v7 = v4;
  [(SBLoginAppSceneHoster *)sceneHoster launchLoginAppWithInitialOrientation:v5 completion:v8];
}

void __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = SBLogWorkspace();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = a2;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "LoginUI app activation completed: %d", buf, 8u);
  }

  [*(id *)(a1 + 32) relinquish];
  if (a2)
  {
    id v7 = [*(id *)(a1 + 40) loginContainerView];
    v8 = [*(id *)(*(void *)(a1 + 40) + 1032) contentView];
    [v7 setContentView:v8];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = [*(id *)(*(void *)(a1 + 40) + 1112) allObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v13++) loginAppDidFinishLaunching:*(void *)(a1 + 40)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    if ([*(id *)(a1 + 40) interfaceOrientation] != *(void *)(a1 + 48))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void **)(v14 + 1032);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_56;
      v22[3] = &unk_1E6B086F0;
      v22[4] = v14;
      [v15 updateSettingsWithTransitionBlock:v22];
    }
  }
  else
  {
    dispatch_time_t v16 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2;
    block[3] = &unk_1E6AF5290;
    id v17 = v5;
    uint64_t v18 = *(void *)(a1 + 40);
    id v20 = v17;
    uint64_t v21 = v18;
    dispatch_after(v16, MEMORY[0x1E4F14428], block);
  }
}

id __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_56(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x1E4F42790];
  id v4 = a2;
  id v5 = [v3 transitionContext];
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));

  return v5;
}

uint64_t __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2(uint64_t a1)
{
  v2 = SBLogWorkspace();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 40) _setupLoginScene];
}

- (void)sceneInvalidated
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke(uint64_t a1)
{
  v2 = SBLogWorkspace();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke_cold_1(v2);
  }

  return [*(id *)(a1 + 32) _setupLoginScene];
}

- (void)sceneUpdatedIdleTimerMode:(int64_t)a3
{
  if (self->_idleTimerMode != a3)
  {
    self->_idleTimerMode = a3;
    id v4 = [(SBLockScreenViewControllerBase *)self idleTimerCoordinator];
    if (v4)
    {
      id v7 = v4;
      id v5 = [(SBLoginAppContainerViewController *)self coordinatorRequestedIdleTimerBehavior:v4];
      id v6 = (id)[v7 idleTimerProvider:self didProposeBehavior:v5 forReason:@"SBLoginAppContainerViewControllerSceneUpdatedIdleTimerMode"];

      id v4 = v7;
    }
  }
}

- (void)sceneUpdatedStatusBarUserName:(id)a3
{
  dispatch_time_t v3 = (void *)SBApp;
  id v4 = a3;
  id v5 = [v3 statusBarStateAggregator];
  [v5 setUserNameOverride:v4];
}

- (void)sceneUpdatedRotationMode:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"LoginAppDisablingRotation"];
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v4;
  }
  else
  {
    [(BSInvalidatable *)self->_deferOrientationUpdatesAssertion invalidate];
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;
  }
}

- (void)sceneUpdatedWallpaperMode:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  [(SBWallpaperController *)self->_wallpaperController _updateWallpaperForLocations:1 options:0 wallpaperMode:v3 withCompletion:0];
}

- (void)_handleBacklightFadeEnded
{
  uint64_t v3 = +[SBBacklightController sharedInstance];
  char v4 = [v3 screenIsOn];

  if ((v4 & 1) == 0)
  {
    [(SBLoginAppContainerViewController *)self _cleanupBatteryChargingViewWithAnimationDuration:0.0];
  }
}

- (void)_addBatteryChargingView
{
  batteryChargingViewController = self->_batteryChargingViewController;
  if (!batteryChargingViewController)
  {
    char v4 = [[SBLockScreenBatteryChargingViewController alloc] initForDisplayOfBattery:1];
    id v5 = self->_batteryChargingViewController;
    self->_batteryChargingViewController = v4;

    [(SBLockScreenBatteryChargingViewController *)self->_batteryChargingViewController setDelegate:self];
    batteryChargingViewController = self->_batteryChargingViewController;
  }
  [(SBLoginAppContainerViewController *)self addChildViewController:batteryChargingViewController];
  id v6 = [(SBLoginAppContainerViewController *)self loginContainerView];
  id v7 = [(SBLockScreenBatteryChargingViewController *)self->_batteryChargingViewController chargingView];
  [v6 setBatteryChargingView:v7];

  v8 = self->_batteryChargingViewController;
  [(SBLockScreenBatteryChargingViewController *)v8 didMoveToParentViewController:self];
}

- (void)_removeBatteryChargingView
{
  [(SBLockScreenBatteryChargingViewController *)self->_batteryChargingViewController willMoveToParentViewController:0];
  uint64_t v3 = [(SBLoginAppContainerViewController *)self loginContainerView];
  [v3 setBatteryChargingView:0];

  [(SBLockScreenBatteryChargingViewController *)self->_batteryChargingViewController removeFromParentViewController];
  batteryChargingViewController = self->_batteryChargingViewController;
  self->_batteryChargingViewController = 0;
}

- (void)_updateBatteryChargingViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SBUIController sharedInstanceIfExists];
  int v6 = [v5 isConnectedToExternalChargingSource];

  if (v6)
  {
    if (v3) {
      double v7 = 0.25;
    }
    else {
      double v7 = 0.0;
    }
    [(SBLoginAppContainerViewController *)self _addBatteryChargingView];
    [(SBLockScreenBatteryChargingViewController *)self->_batteryChargingViewController showChargeLevelWithBatteryVisible:1];
    v8 = [(SBLockScreenBatteryChargingViewController *)self->_batteryChargingViewController view];
    [v8 setAlpha:0.0];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    void v10[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_2;
    v9[3] = &unk_1E6AFF1A8;
    *(double *)&void v9[5] = v7;
    v9[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v10 animations:v9 completion:v7];
  }
  else if (self->_batteryChargingViewController)
  {
    [(SBLoginAppContainerViewController *)self _cleanupBatteryChargingViewWithAnimationDuration:0.0];
  }
}

uint64_t __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fadeViewsForChargingViewVisible:1];
}

uint64_t __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_3;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v1];
}

void __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1040) view];
  [v1 setAlpha:1.0];
}

- (void)_fadeViewsForChargingViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBLoginAppContainerViewController *)self loginContainerView];
  [v4 setContentHidden:v3 forRequester:@"ChargingView"];
}

- (void)_cleanupBatteryChargingViewWithAnimationDuration:(double)a3
{
  [(SBLockScreenBatteryChargingViewController *)self->_batteryChargingViewController prepareForDismissalWithAnimation:0];
  [(SBLoginAppContainerViewController *)self _removeBatteryChargingView];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__SBLoginAppContainerViewController__cleanupBatteryChargingViewWithAnimationDuration___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:a3];
}

uint64_t __86__SBLoginAppContainerViewController__cleanupBatteryChargingViewWithAnimationDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fadeViewsForChargingViewVisible:0];
}

- (void)chargingViewControllerFadedOutContent:(id)a3
{
}

- (void)_showOrHideThermalTrapUIAnimated:(BOOL)a3
{
  if (a3) {
    double v4 = 0.5;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [(id)SBApp lockOutController];
  int v6 = [v5 isThermallyBlocked];

  thermalWarningViewController = self->_thermalWarningViewController;
  if (v6)
  {
    if (!thermalWarningViewController)
    {
      v8 = [[SBLockScreenTemperatureWarningViewController alloc] initWithNibName:0 bundle:0];
      id v9 = self->_thermalWarningViewController;
      self->_thermalWarningViewController = v8;

      uint64_t v10 = [(SBLockOverlayViewController *)self->_thermalWarningViewController overlayView];
      uint64_t v11 = [SBLoginAppContainerOverlayWrapperView alloc];
      uint64_t v12 = -[SBLoginAppContainerOverlayWrapperView initWithFrame:overlayView:](v11, "initWithFrame:overlayView:", v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(SBLoginAppContainerViewController *)self addChildViewController:self->_thermalWarningViewController];
      uint64_t v13 = [(SBLoginAppContainerViewController *)self loginContainerView];
      [v13 setThermalWarningView:v12];

      [(SBLockScreenTemperatureWarningViewController *)self->_thermalWarningViewController didMoveToParentViewController:self];
      [(SBLoginAppContainerOverlayWrapperView *)v12 setAlpha:0.0];
      uint64_t v14 = (void *)MEMORY[0x1E4F42FF0];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke;
      v18[3] = &unk_1E6AF5290;
      v19 = v12;
      id v20 = self;
      uint64_t v15 = v12;
      [v14 animateWithDuration:v18 animations:v4];
    }
  }
  else if (thermalWarningViewController)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_2;
    v17[3] = &unk_1E6AF4AC0;
    v17[4] = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_3;
    v16[3] = &unk_1E6AF5350;
    v16[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v17 animations:v16 completion:v4];
  }
}

void __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = [*(id *)(a1 + 40) loginContainerView];
  [v2 setContentHidden:1 forRequester:@"ThermalTrap"];
}

void __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loginContainerView];
  BOOL v3 = [v2 thermalWarningView];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) loginContainerView];
  [v4 setContentHidden:0 forRequester:@"ThermalTrap"];
}

void __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1048) willMoveToParentViewController:0];
  id v2 = [*(id *)(a1 + 32) loginContainerView];
  [v2 setThermalWarningView:0];

  [*(id *)(*(void *)(a1 + 32) + 1048) removeFromParentViewController];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1048);
  *(void *)(v3 + 1048) = 0;
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (!a4) {
    [(SBLoginAppContainerViewController *)self _updateLegibility];
  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (!a3) {
    [(SBLoginAppContainerViewController *)self _updateLegibility];
  }
}

- (void)_updateLegibility
{
  id v4 = [(SBLoginAppContainerViewController *)self loginContainerView];
  id v2 = +[SBWallpaperController sharedInstance];
  uint64_t v3 = [v2 legibilitySettingsForVariant:0];
  [v4 setLegibilitySettings:v3];
}

- (void)pluginManager:(id)a3 willUnloadPlugin:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  pluginWrapperViewController = self->_pluginWrapperViewController;
  if (pluginWrapperViewController)
  {
    id v8 = [(SBLoginAppContainerPluginWrapperViewController *)pluginWrapperViewController plugin];

    if (v8 == v6)
    {
      id v9 = (void *)MEMORY[0x1E4FA7958];
      uint64_t v10 = [v6 name];
      uint64_t v11 = [v9 contextWithName:v10];
      [(SBLoginAppContainerViewController *)self disableLockScreenPluginWithContext:v11];
    }
  }
}

- (BOOL)pluginManager:(id)a3 plugin:(id)a4 handleAction:(id)a5
{
  return 0;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  return (a3 < 0x2A) & (0x20000800008uLL >> a3);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  id v4 = a3;
  int64_t idleTimerMode = self->_idleTimerMode;
  if (idleTimerMode == 1)
  {
    id v6 = +[SBIdleTimerBehavior lockScreenBehavior];
  }
  else
  {
    if (idleTimerMode) {
      goto LABEL_6;
    }
    id v6 = +[SBIdleTimerBehavior autoLockBehavior];
  }
  self = v6;
LABEL_6:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_showStatusBarReasons, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_pluginWrapperViewController, 0);
  objc_storeStrong((id *)&self->_thermalWarningViewController, 0);
  objc_storeStrong((id *)&self->_batteryChargingViewController, 0);
  objc_storeStrong((id *)&self->_sceneHoster, 0);
}

void __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to activate login scene, retrying; error = %@",
    (uint8_t *)&v3,
    0xCu);
}

void __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Login scene invalidated", v1, 2u);
}

@end