@interface SBUIStartupToLoginWindowAnimationController
- (BOOL)_shouldDismissBanner;
- (SBUIStartupToLoginWindowAnimationController)initWithTransitionContextProvider:(id)a3;
- (SBUIStartupToLoginWindowAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4;
- (id)_getTransitionWindow;
- (id)animationSettings;
- (void)_cleanupAnimation;
- (void)_setHidden:(BOOL)a3;
- (void)_startAnimation;
- (void)loginAppDidFinishLaunching:(id)a3;
@end

@implementation SBUIStartupToLoginWindowAnimationController

- (SBUIStartupToLoginWindowAnimationController)initWithTransitionContextProvider:(id)a3
{
  return [(SBUIStartupToLoginWindowAnimationController *)self initWithTransitionContextProvider:a3 overlay:0];
}

- (SBUIStartupToLoginWindowAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBUIStartupToLoginWindowAnimationController.m", 44, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBUIStartupToLoginWindowAnimationController;
  v9 = [(SBUIMainScreenAnimationController *)&v18 initWithTransitionContextProvider:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentSnapshotOverlay, a4);
    v11 = (BSTransaction *)objc_alloc_init(MEMORY[0x1E4F4F850]);
    waitForLoginAppToFinishLaunchingTransaction = v10->_waitForLoginAppToFinishLaunchingTransaction;
    v10->_waitForLoginAppToFinishLaunchingTransaction = v11;

    [(BSTransaction *)v10->_waitForLoginAppToFinishLaunchingTransaction addMilestone:@"WaitForLoginWindowToFinishLaunchingMilestone"];
    [(SBUIAnimationController *)v10 delayAnimationUntilTransactionFinishes:v10->_waitForLoginAppToFinishLaunchingTransaction];
    [(BSTransaction *)v10->_waitForLoginAppToFinishLaunchingTransaction begin];
    v13 = +[SBLockScreenManager sharedInstance];
    v14 = [v13 lockScreenEnvironment];
    v15 = [v14 rootViewController];

    [v15 addLoginObserver:v10];
  }

  return v10;
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (id)_getTransitionWindow
{
  if (_getTransitionWindow___once_1 != -1) {
    dispatch_once(&_getTransitionWindow___once_1, &__block_literal_global_350);
  }
  v2 = (void *)_getTransitionWindow___instance_1;
  return v2;
}

uint64_t __67__SBUIStartupToLoginWindowAnimationController__getTransitionWindow__block_invoke()
{
  v0 = [SBSecureWindow alloc];
  v1 = [(id)SBApp windowSceneManager];
  v2 = [v1 activeDisplayWindowScene];
  uint64_t v3 = [(SBWindow *)v0 initWithWindowScene:v2 role:@"SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation" debugName:@"BootToLoginWindow"];
  v4 = (void *)_getTransitionWindow___instance_1;
  _getTransitionWindow___instance_1 = v3;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation"))
  {
    v5 = (void *)_getTransitionWindow___instance_1;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
    [v5 setRootViewController:v6];
  }
  [(id)_getTransitionWindow___instance_1 setWindowLevel:*MEMORY[0x1E4F43CF8] + 15.0];
  id v7 = (void *)_getTransitionWindow___instance_1;
  return [v7 setUserInteractionEnabled:0];
}

- (void)_setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBUIStartupToLoginWindowAnimationController *)self _getTransitionWindow];
  [v5 setHidden:v3];

  v6.receiver = self;
  v6.super_class = (Class)SBUIStartupToLoginWindowAnimationController;
  [(SBUIAnimationController *)&v6 _setHidden:v3];
}

- (id)animationSettings
{
  return (id)[MEMORY[0x1E4F4F680] settingsWithDuration:0.5];
}

- (void)_startAnimation
{
  BOOL v3 = [(SBUIAnimationController *)self containerView];
  v4 = [MEMORY[0x1E4F428B8] blackColor];
  [v3 setBackgroundColor:v4];

  persistentSnapshotOverlay = self->_persistentSnapshotOverlay;
  objc_super v6 = [(SBUIStartupToLoginWindowAnimationController *)self animationSettings];
  [(BKSDisplayRenderOverlay *)persistentSnapshotOverlay dismissWithAnimation:v6];

  dispatch_time_t v7 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
}

uint64_t __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_2;
  v3[3] = &unk_1E6AF4AC0;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_3;
  v2[3] = &unk_1E6AF5350;
  v2[4] = v4;
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v2 completion:0.5];
}

void __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setBackgroundColor:0];
}

uint64_t __62__SBUIStartupToLoginWindowAnimationController__startAnimation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteAnimationDidFinish];
}

- (void)_cleanupAnimation
{
  id v5 = +[SBLockScreenManager sharedInstance];
  BOOL v3 = [v5 lockScreenEnvironment];
  uint64_t v4 = [v3 rootViewController];

  [v4 removeLoginObserver:self];
}

- (void)loginAppDidFinishLaunching:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForLoginAppToFinishLaunchingTransaction, 0);
  objc_storeStrong((id *)&self->_persistentSnapshotOverlay, 0);
  objc_storeStrong((id *)&self->_transitionWindow, 0);
}

@end