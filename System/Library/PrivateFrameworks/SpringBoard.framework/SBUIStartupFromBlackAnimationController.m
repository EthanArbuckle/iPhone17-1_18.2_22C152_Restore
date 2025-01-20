@interface SBUIStartupFromBlackAnimationController
- (BOOL)_shouldDismissBanner;
- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary;
- (BOOL)waitsForAppActivation;
- (BSAnimationSettings)animationSettings;
- (SBUIStartupFromBlackAnimationController)initWithTransitionContextProvider:(id)a3;
- (id)_getTransitionWindow;
- (id)sceneViewPresentationIdentifier:(id)a3;
- (int64_t)sceneViewPresentationPriority:(id)a3;
- (void)_cleanupAnimation;
- (void)_prepareAnimation;
- (void)_setHidden:(BOOL)a3;
- (void)_showBlackView;
- (void)_startAnimation;
- (void)setAnimationSettings:(id)a3;
- (void)setWaitsForAppActivation:(BOOL)a3;
@end

@implementation SBUIStartupFromBlackAnimationController

- (SBUIStartupFromBlackAnimationController)initWithTransitionContextProvider:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBUIStartupFromBlackAnimationController;
  v3 = [(SBUIMainScreenAnimationController *)&v12 initWithTransitionContextProvider:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(SBUIStartupFromBlackAnimationController *)v3 _getTransitionWindow];
    id v6 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [v5 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    internalContainerView = v4->_internalContainerView;
    v4->_internalContainerView = (UIView *)v7;

    if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleStartupFadeAnimation"))
    {
      v9 = [v5 rootViewController];
      id v10 = [v9 view];
    }
    else
    {
      id v10 = v5;
    }
    [v10 addSubview:v4->_internalContainerView];
    [(SBUIStartupFromBlackAnimationController *)v4 _showBlackView];
  }
  return v4;
}

- (id)_getTransitionWindow
{
  if (_getTransitionWindow___once_0 != -1) {
    dispatch_once(&_getTransitionWindow___once_0, &__block_literal_global_309);
  }
  v2 = (void *)_getTransitionWindow___instance_0;
  return v2;
}

uint64_t __63__SBUIStartupFromBlackAnimationController__getTransitionWindow__block_invoke()
{
  v0 = [SBSecureWindow alloc];
  v1 = [(id)SBApp windowSceneManager];
  v2 = [v1 activeDisplayWindowScene];
  uint64_t v3 = [(SBWindow *)v0 initWithWindowScene:v2 role:@"SBTraitsParticipantRoleStartupFadeAnimation" debugName:@"FadeWindow"];
  v4 = (void *)_getTransitionWindow___instance_0;
  _getTransitionWindow___instance_0 = v3;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleStartupFadeAnimation"))
  {
    v5 = (void *)_getTransitionWindow___instance_0;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];
    [v5 setRootViewController:v6];
  }
  [(id)_getTransitionWindow___instance_0 setWindowLevel:*MEMORY[0x1E4F43958] + 1.0];
  [(id)_getTransitionWindow___instance_0 setHidden:0];
  uint64_t v7 = (void *)_getTransitionWindow___instance_0;
  return [v7 setAlpha:1.0];
}

- (void)_setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBUIStartupFromBlackAnimationController *)self _getTransitionWindow];
  [v5 setHidden:v3];

  v6.receiver = self;
  v6.super_class = (Class)SBUIStartupFromBlackAnimationController;
  [(SBUIAnimationController *)&v6 _setHidden:v3];
}

- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary
{
  return self->_waitsForAppActivation;
}

- (BOOL)_shouldDismissBanner
{
  return 0;
}

- (void)_prepareAnimation
{
  BOOL v3 = [(SBUIAnimationController *)self toApplicationSceneEntities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v25 = [(SBUIMainScreenAnimationController *)self transitionRequest];
    v5 = [v25 applicationContext];
    objc_super v6 = [v5 layoutState];

    uint64_t v7 = [v6 elementWithRole:1];
    v8 = [v7 workspaceEntity];

    v9 = [v8 deviceApplicationSceneEntity];
    uint64_t v10 = objc_opt_class();
    v11 = [v9 sceneHandle];
    objc_super v12 = SBSafeCast(v10, v11);

    if (v12)
    {
      v13 = [(SBUIStartupFromBlackAnimationController *)self _getTransitionWindow];
      uint64_t v14 = [v13 _windowInterfaceOrientation];

      uint64_t v15 = [v12 currentInterfaceOrientation];
      v16 = [SBDeviceApplicationSceneView alloc];
      v17 = [v25 displayConfiguration];
      [v17 bounds];
      v20 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](v16, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v12, v14, v15, self, v18, v19);
      sceneView = self->_sceneView;
      self->_sceneView = v20;

      id v22 = objc_alloc(MEMORY[0x1E4F4F8D0]);
      [(UIView *)self->_internalContainerView bounds];
      v23 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v22, "initWithFrame:");
      orientationWrapperView = self->_orientationWrapperView;
      self->_orientationWrapperView = v23;

      [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView setContainerOrientation:v14];
      [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView setContentOrientation:v15];
      [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView addContentView:self->_sceneView];
      [(SBSceneView *)self->_sceneView setDisplayMode:4 animationFactory:0 completion:0];
      [(UIView *)self->_internalContainerView addSubview:self->_orientationWrapperView];
      [(UIView *)self->_internalContainerView sendSubviewToBack:self->_orientationWrapperView];
    }
  }
}

- (void)_startAnimation
{
  animationSettings = self->_animationSettings;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke_2;
  v3[3] = &unk_1E6AF5350;
  v3[4] = self;
  [MEMORY[0x1E4F4F898] animateWithSettings:animationSettings actions:v4 completion:v3];
}

uint64_t __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 312) setAlpha:0.0];
}

uint64_t __58__SBUIStartupFromBlackAnimationController__startAnimation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteAnimationDidFinish];
}

- (void)_cleanupAnimation
{
  [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView removeFromSuperview];
  orientationWrapperView = self->_orientationWrapperView;
  self->_orientationWrapperView = 0;

  [(SBDeviceApplicationSceneView *)self->_sceneView removeFromSuperview];
  [(SBDeviceApplicationSceneView *)self->_sceneView invalidate];
  sceneView = self->_sceneView;
  self->_sceneView = 0;

  [(UIView *)self->_internalContainerView removeFromSuperview];
  internalContainerView = self->_internalContainerView;
  self->_internalContainerView = 0;

  objc_super v6 = [(SBUIStartupFromBlackAnimationController *)self _getTransitionWindow];
  [v6 setHidden:1];

  v7.receiver = self;
  v7.super_class = (Class)SBUIStartupFromBlackAnimationController;
  [(SBUIMainScreenAnimationController *)&v7 _cleanupAnimation];
}

- (void)_showBlackView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(UIView *)self->_internalContainerView bounds];
  uint64_t v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  blackView = self->_blackView;
  self->_blackView = v4;

  objc_super v6 = self->_blackView;
  objc_super v7 = [MEMORY[0x1E4F428B8] blackColor];
  [(UIView *)v6 setBackgroundColor:v7];

  [(UIView *)self->_blackView setAlpha:1.0];
  internalContainerView = self->_internalContainerView;
  v9 = self->_blackView;
  [(UIView *)internalContainerView addSubview:v9];
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return @"SBUIStartupFromBlackAnimationController";
}

- (int64_t)sceneViewPresentationPriority:(id)a3
{
  return 1000;
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (BOOL)waitsForAppActivation
{
  return self->_waitsForAppActivation;
}

- (void)setWaitsForAppActivation:(BOOL)a3
{
  self->_waitsForAppActivation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_orientationWrapperView, 0);
  objc_storeStrong((id *)&self->_blackView, 0);
  objc_storeStrong((id *)&self->_internalContainerView, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end