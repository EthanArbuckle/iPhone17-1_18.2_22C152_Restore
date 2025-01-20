@interface SBActivateAppClipFromPlaceholderWorkspaceTransaction
- (unint64_t)_concurrentOverlayDismissalOptions;
- (unint64_t)_serialOverlayPreDismissalOptions;
- (void)_begin;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBActivateAppClipFromPlaceholderWorkspaceTransaction

- (void)_begin
{
  v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  v5 = [v4 applicationContext];

  v6 = [v5 previousLayoutState];
  uint64_t v7 = [v6 interfaceOrientation];

  v8 = [v5 layoutState];
  uint64_t v9 = [v8 interfaceOrientation];

  v10 = [v5 resolvedActivatingWorkspaceEntity];
  v11 = [v10 deviceApplicationSceneEntity];

  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBActivateAppClipFromPlaceholderWorkspaceTransaction.m" lineNumber:38 description:@"Expected non-nil applicationSceneEntity"];
  }
  v12 = [v11 sceneHandle];
  if ([v12 _mainSceneSupportsInterfaceOrientation:v7])
  {
    v19.receiver = self;
    v19.super_class = (Class)SBActivateAppClipFromPlaceholderWorkspaceTransaction;
    [(SBAppToAppWorkspaceTransaction *)&v19 _begin];
  }
  else
  {
    v13 = [(SBWorkspaceTransaction *)self transitionRequest];
    v14 = [v13 workspace];
    v15 = [v14 createRequestWithOptions:0];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__SBActivateAppClipFromPlaceholderWorkspaceTransaction__begin__block_invoke;
    v20[3] = &__block_descriptor_48_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
    v20[4] = v9;
    v20[5] = v7;
    [v15 modifyApplicationContext:v20];
    v16 = [(SBAppToAppWorkspaceTransaction *)[SBRotateScenesWorkspaceTransaction alloc] initWithTransitionRequest:v15];
    rotateScenesTransaction = self->_rotateScenesTransaction;
    self->_rotateScenesTransaction = v16;

    [(SBRotateScenesWorkspaceTransaction *)self->_rotateScenesTransaction addObserver:self];
    [(SBActivateAppClipFromPlaceholderWorkspaceTransaction *)self addMilestone:@"kActivateAppClipFromPlaceholderWaitingForRotation"];
    [(SBActivateAppClipFromPlaceholderWorkspaceTransaction *)self addChildTransaction:self->_rotateScenesTransaction];
  }
}

void __62__SBActivateAppClipFromPlaceholderWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setInterfaceOrientation:v3];
  id v5 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:*(void *)(a1 + 40) toInterfaceOrientation:*(void *)(a1 + 32)];
  [v4 setAnimationSettings:v5];
}

- (void)transactionDidComplete:(id)a3
{
  id v4 = (SBRotateScenesWorkspaceTransaction *)a3;
  id v5 = v4;
  if (self->_rotateScenesTransaction == v4)
  {
    self->_rotateScenesTransaction = 0;

    v6.receiver = self;
    v6.super_class = (Class)SBActivateAppClipFromPlaceholderWorkspaceTransaction;
    [(SBAppToAppWorkspaceTransaction *)&v6 _begin];
    [(SBActivateAppClipFromPlaceholderWorkspaceTransaction *)self satisfyMilestone:@"kActivateAppClipFromPlaceholderWaitingForRotation"];
  }
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return 0;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  return 0;
}

- (void).cxx_destruct
{
}

@end