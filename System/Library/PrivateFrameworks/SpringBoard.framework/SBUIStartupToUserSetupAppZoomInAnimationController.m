@interface SBUIStartupToUserSetupAppZoomInAnimationController
- (BOOL)_shouldDismissBanner;
- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary;
- (SBUIStartupToUserSetupAppZoomInAnimationController)initWithTransitionContextProvider:(id)a3;
- (SBUIStartupToUserSetupAppZoomInAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4;
- (id)_getTransitionWindow;
- (id)animationSettings;
- (id)sceneViewPresentationIdentifier:(id)a3;
- (int64_t)sceneViewPresentationPriority:(id)a3;
- (void)_cleanupAnimation;
- (void)_prepareAnimation;
- (void)_setHidden:(BOOL)a3;
- (void)_startAnimation;
@end

@implementation SBUIStartupToUserSetupAppZoomInAnimationController

- (SBUIStartupToUserSetupAppZoomInAnimationController)initWithTransitionContextProvider:(id)a3
{
  return [(SBUIStartupToUserSetupAppZoomInAnimationController *)self initWithTransitionContextProvider:a3 overlay:0];
}

- (SBUIStartupToUserSetupAppZoomInAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBUIStartupToUserSetupAppZoomInAnimationController.m", 53, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)SBUIStartupToUserSetupAppZoomInAnimationController;
  v9 = [(SBUIMainScreenAnimationController *)&v29 initWithTransitionContextProvider:v7];
  if (v9)
  {
    id v27 = v8;
    id obj = a4;
    v10 = [v7 applicationContext];
    v11 = [v10 applicationSceneEntityForLayoutRole:1];
    v12 = [v11 application];
    char v13 = [v12 isSetup];

    if ((v13 & 1) == 0)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:v9 file:@"SBUIStartupToUserSetupAppZoomInAnimationController.m" lineNumber:55 description:@"This transition can only run with Buddy/Setup."];
    }
    SEL v26 = a2;
    v14 = [v7 applicationContext];
    v15 = [v14 layoutState];
    v16 = [v15 elementWithRole:1];
    v17 = [v16 workspaceEntity];
    v18 = [v17 applicationSceneEntity];
    v19 = [v18 application];
    v20 = [v19 bundleIdentifier];
    char v21 = [v20 isEqualToString:@"com.apple.purplebuddy"];

    if ((v21 & 1) == 0)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:v26 object:v9 file:@"SBUIStartupToUserSetupAppZoomInAnimationController.m" lineNumber:56 description:@"Buddy's role must be primary"];
    }
    objc_storeStrong((id *)&v9->_persistentSnapshotOverlay, obj);
    id v8 = v27;
  }

  return v9;
}

- (id)_getTransitionWindow
{
  if (_getTransitionWindow___once != -1) {
    dispatch_once(&_getTransitionWindow___once, &__block_literal_global_24);
  }
  v2 = (void *)_getTransitionWindow___instance;
  return v2;
}

uint64_t __74__SBUIStartupToUserSetupAppZoomInAnimationController__getTransitionWindow__block_invoke()
{
  v0 = [SBSecureWindow alloc];
  v1 = [(id)SBApp windowSceneManager];
  v2 = [v1 activeDisplayWindowScene];
  uint64_t v3 = [(SBWindow *)v0 initWithWindowScene:v2 role:@"SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation" debugName:@"LoginBootToSetupAppZoomIn"];
  v4 = (void *)_getTransitionWindow___instance;
  _getTransitionWindow___instance = v3;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleLoginBootToSetupAppZoomInAnimation"))
  {
    v5 = (void *)_getTransitionWindow___instance;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
    [v5 setRootViewController:v6];
  }
  id v7 = (void *)_getTransitionWindow___instance;
  double v8 = *MEMORY[0x1E4F43CF8] + 15.0;
  return [v7 setWindowLevel:v8];
}

- (void)_setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBUIStartupToUserSetupAppZoomInAnimationController *)self _getTransitionWindow];
  [v5 setHidden:v3];

  v6.receiver = self;
  v6.super_class = (Class)SBUIStartupToUserSetupAppZoomInAnimationController;
  [(SBUIAnimationController *)&v6 _setHidden:v3];
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary
{
  return 1;
}

- (id)animationSettings
{
  return (id)[MEMORY[0x1E4F4F680] settingsWithDuration:1.0];
}

- (void)_prepareAnimation
{
  id v28 = [(SBUIAnimationController *)self containerView];
  BOOL v3 = [(SBUIMainScreenAnimationController *)self transitionRequest];
  v4 = [v3 applicationContext];
  v5 = [v4 layoutState];

  objc_super v6 = [v5 elementWithRole:1];
  id v7 = [v6 workspaceEntity];

  double v8 = [v7 deviceApplicationSceneEntity];
  uint64_t v9 = objc_opt_class();
  v10 = [v8 sceneHandle];
  v11 = SBSafeCast(v9, v10);

  if (v11)
  {
    v12 = [(SBUIStartupToUserSetupAppZoomInAnimationController *)self _getTransitionWindow];
    id v27 = v5;
    uint64_t v13 = [v12 _windowInterfaceOrientation];

    uint64_t v14 = [v11 currentInterfaceOrientation];
    v15 = [(SBUIAnimationController *)self containerView];
    v16 = [SBDeviceApplicationSceneView alloc];
    v17 = [v3 displayConfiguration];
    [v17 bounds];
    v20 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](v16, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v11, v14, v13, self, v18, v19);
    sceneView = self->_sceneView;
    self->_sceneView = v20;

    id v22 = objc_alloc(MEMORY[0x1E4F4F8D0]);
    [v15 bounds];
    v23 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v22, "initWithFrame:");
    orientationWrapperView = self->_orientationWrapperView;
    self->_orientationWrapperView = v23;

    uint64_t v25 = v13;
    v5 = v27;
    [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView setContainerOrientation:v25];
    [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView setContentOrientation:v14];
    [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView addContentView:self->_sceneView];
    [(SBSceneView *)self->_sceneView setDisplayMode:4 animationFactory:0 completion:0];
    [v15 addSubview:self->_orientationWrapperView];
  }
  SEL v26 = objc_msgSend(MEMORY[0x1E4F428B8], "whiteColor", v27);
  [v28 setBackgroundColor:v26];
}

- (void)_startAnimation
{
  BOOL v3 = [(SBUIStartupToUserSetupAppZoomInAnimationController *)self animationSettings];
  [(BKSDisplayRenderOverlay *)self->_persistentSnapshotOverlay dismissWithAnimation:v3];
  [v3 duration];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)((v4 + 0.1) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SBUIStartupToUserSetupAppZoomInAnimationController__startAnimation__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

uint64_t __69__SBUIStartupToUserSetupAppZoomInAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteAnimationDidFinish];
}

- (void)_cleanupAnimation
{
  [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView removeFromSuperview];
  [(SBSceneView *)self->_sceneView removeFromSuperview];
  [(SBSceneView *)self->_sceneView invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBUIStartupToUserSetupAppZoomInAnimationController;
  [(SBUIMainScreenAnimationController *)&v3 _cleanupAnimation];
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return @"SBUIStartupToUserSetupAppZoomInAnimationController";
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return 1000;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentSnapshotOverlay, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_orientationWrapperView, 0);
}

@end