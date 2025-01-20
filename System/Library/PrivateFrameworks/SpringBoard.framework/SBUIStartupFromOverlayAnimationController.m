@interface SBUIStartupFromOverlayAnimationController
- (BOOL)_shouldDismissBanner;
- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary;
- (BOOL)waitsForAppActivation;
- (BSAnimationSettings)animationSettings;
- (SBUIStartupFromOverlayAnimationController)initWithTransitionContextProvider:(id)a3;
- (SBUIStartupFromOverlayAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4;
- (id)sceneViewPresentationIdentifier:(id)a3;
- (int64_t)sceneViewPresentationPriority:(id)a3;
- (void)_cleanupAnimation;
- (void)_prepareAnimation;
- (void)_startAnimation;
- (void)setAnimationSettings:(id)a3;
- (void)setWaitsForAppActivation:(BOOL)a3;
@end

@implementation SBUIStartupFromOverlayAnimationController

- (SBUIStartupFromOverlayAnimationController)initWithTransitionContextProvider:(id)a3
{
  return [(SBUIStartupFromOverlayAnimationController *)self initWithTransitionContextProvider:a3 overlay:0];
}

- (SBUIStartupFromOverlayAnimationController)initWithTransitionContextProvider:(id)a3 overlay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBUIStartupFromOverlayAnimationController.m", 47, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBUIStartupFromOverlayAnimationController;
  v9 = [(SBUIMainScreenAnimationController *)&v13 initWithTransitionContextProvider:v7];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_overlay, a4);
  }

  return v10;
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
  v3 = [(SBUIAnimationController *)self toApplicationSceneEntities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v29 = [(SBUIMainScreenAnimationController *)self transitionRequest];
    v5 = [v29 applicationContext];
    v6 = [v5 layoutState];

    id v7 = [v6 elementWithRole:1];
    id v8 = [v7 workspaceEntity];

    v9 = [v8 deviceApplicationSceneEntity];
    uint64_t v10 = objc_opt_class();
    v11 = [v9 sceneHandle];
    v12 = SBSafeCast(v10, v11);

    objc_super v13 = [v12 _windowScene];
    v14 = [v13 switcherController];
    char v15 = [v14 isChamoisWindowingUIEnabled];

    if (v12 && (v15 & 1) == 0)
    {
      v16 = [(SBUIMainScreenAnimationController *)self _getTransitionWindow];
      uint64_t v28 = [v16 _windowInterfaceOrientation];

      uint64_t v17 = [v12 currentInterfaceOrientation];
      v18 = [(SBUIAnimationController *)self containerView];
      v19 = [SBDeviceApplicationSceneView alloc];
      v20 = [v29 displayConfiguration];
      [v20 bounds];
      v23 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:](v19, "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", v12, v17, v28, self, v21, v22);
      sceneView = self->_sceneView;
      self->_sceneView = v23;

      id v25 = objc_alloc(MEMORY[0x1E4F4F8D0]);
      [v18 bounds];
      v26 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v25, "initWithFrame:");
      orientationWrapperView = self->_orientationWrapperView;
      self->_orientationWrapperView = v26;

      [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView setContainerOrientation:v28];
      [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView setContentOrientation:v17];
      [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView addContentView:self->_sceneView];
      [(SBSceneView *)self->_sceneView setDisplayMode:4 animationFactory:0 completion:0];
      [v18 addSubview:self->_orientationWrapperView];
    }
  }
}

- (void)_startAnimation
{
  animationSettings = self->_animationSettings;
  overlay = self->_overlay;
  if (animationSettings)
  {
    -[BKSDisplayRenderOverlay dismissWithAnimation:](overlay, "dismissWithAnimation:");
    [(BSAnimationSettings *)self->_animationSettings duration];
    double v6 = v5;
    [(BSAnimationSettings *)self->_animationSettings delay];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)((v6 + v7) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(BKSDisplayRenderOverlay *)overlay dismiss];
    v9 = [(SBTransaction *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke_2;
    v10[3] = &unk_1E6AF4AC0;
    v10[4] = self;
    dispatch_async(v9, v10);
  }
}

uint64_t __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteAnimationDidFinish];
}

uint64_t __60__SBUIStartupFromOverlayAnimationController__startAnimation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noteAnimationDidFinish];
}

- (void)_cleanupAnimation
{
  [(BSUIOrientationTransformWrapperView *)self->_orientationWrapperView removeFromSuperview];
  [(SBSceneView *)self->_sceneView removeFromSuperview];
  [(SBSceneView *)self->_sceneView invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBUIStartupFromOverlayAnimationController;
  [(SBUIMainScreenAnimationController *)&v3 _cleanupAnimation];
}

- (id)sceneViewPresentationIdentifier:(id)a3
{
  return @"SBUIStartupFromOverlayAnimationController";
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
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
}

@end