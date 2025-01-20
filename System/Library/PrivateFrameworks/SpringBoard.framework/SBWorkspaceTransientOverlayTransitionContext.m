@interface SBWorkspaceTransientOverlayTransitionContext
- (BOOL)isAnimated;
- (BOOL)shouldDismissSiriUponPresentation;
- (BOOL)shouldPreserveAppSwitcher;
- (BSProcessHandle)originatingProcess;
- (SBTransientOverlayPresentationManager)presentationManager;
- (SBTransientOverlayPresenting)scenePresenter;
- (SBWindowScene)windowScene;
- (SBWorkspaceTransientOverlay)transientOverlay;
- (SBWorkspaceTransientOverlayTransitionContext)init;
- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)transitionType;
- (void)setAnimated:(BOOL)a3;
- (void)setOriginatingProcess:(id)a3;
- (void)setPresentationManager:(id)a3;
- (void)setScenePresenter:(id)a3;
- (void)setShouldDismissSiriUponPresentation:(BOOL)a3;
- (void)setShouldPreserveAppSwitcher:(BOOL)a3;
- (void)setTransientOverlay:(id)a3;
- (void)setTransitionType:(int64_t)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBWorkspaceTransientOverlayTransitionContext

- (SBWorkspaceTransientOverlayTransitionContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBWorkspaceTransientOverlayTransitionContext;
  result = [(SBWorkspaceTransitionContext *)&v3 init];
  if (result)
  {
    result->_animated = 1;
    result->_shouldDismissSiriUponPresentation = 1;
  }
  return result;
}

- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBWorkspaceTransientOverlayTransitionContext;
  v4 = [(SBWorkspaceTransitionContext *)&v11 compactDescriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_transientOverlay withName:@"transientOverlay" skipIfNil:1];
  int64_t transitionType = self->_transitionType;
  v7 = @"dismissal";
  if (transitionType != 1) {
    v7 = 0;
  }
  if (transitionType) {
    v8 = v7;
  }
  else {
    v8 = @"presentation";
  }
  id v9 = (id)[v4 appendObject:v8 withName:@"transitionType" skipIfNil:1];
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBWorkspaceTransientOverlayTransitionContext;
  id v4 = a3;
  id v5 = [(SBWorkspaceTransitionContext *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__SBWorkspaceTransientOverlayTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __86__SBWorkspaceTransientOverlayTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 88) withName:@"transientOverlay" skipIfNil:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 96);
  id v4 = @"dismissal";
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    id v5 = v4;
  }
  else {
    id v5 = @"presentation";
  }
  return (id)[*(id *)(a1 + 32) appendObject:v5 withName:@"transitionType" skipIfNil:1];
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)shouldDismissSiriUponPresentation
{
  return self->_shouldDismissSiriUponPresentation;
}

- (void)setShouldDismissSiriUponPresentation:(BOOL)a3
{
  self->_shouldDismissSiriUponPresentation = a3;
}

- (BOOL)shouldPreserveAppSwitcher
{
  return self->_shouldPreserveAppSwitcher;
}

- (void)setShouldPreserveAppSwitcher:(BOOL)a3
{
  self->_shouldPreserveAppSwitcher = a3;
}

- (SBTransientOverlayPresenting)scenePresenter
{
  return self->_scenePresenter;
}

- (void)setScenePresenter:(id)a3
{
}

- (SBTransientOverlayPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (void)setPresentationManager:(id)a3
{
}

- (SBWorkspaceTransientOverlay)transientOverlay
{
  return self->_transientOverlay;
}

- (void)setTransientOverlay:(id)a3
{
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_int64_t transitionType = a3;
}

- (BSProcessHandle)originatingProcess
{
  return self->_originatingProcess;
}

- (void)setOriginatingProcess:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_originatingProcess, 0);
  objc_storeStrong((id *)&self->_transientOverlay, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
}

@end