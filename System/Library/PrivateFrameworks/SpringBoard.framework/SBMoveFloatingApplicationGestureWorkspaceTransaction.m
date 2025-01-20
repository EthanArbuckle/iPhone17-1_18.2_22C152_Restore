@interface SBMoveFloatingApplicationGestureWorkspaceTransaction
- (id)_transitionRequestForPreemptiveFloatingApplicationActivation;
- (int64_t)_gestureType;
- (void)_begin;
- (void)_beginWithGesture:(id)a3;
- (void)_didComplete;
- (void)_finishWithGesture:(id)a3;
- (void)_performBlockWithLiveContentOverlayUpdatesSuspended:(id)a3;
- (void)_startSuppressingKeyboardForFloatingApplication;
- (void)_stopSuppressingKeyboard;
- (void)_tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture:(id)a3;
- (void)_updateWithGesture:(id)a3;
@end

@implementation SBMoveFloatingApplicationGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 4;
}

- (void)_begin
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v26 _begin];
  v3 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  v4 = [v3 layoutContext];
  v5 = [v4 layoutState];

  char v6 = [v5 layoutContainsRole:3];
  self->_tryPreemptiveFloatingApplicationActivation = v6 ^ 1;
  self->_didAddActivateFloatingApplicationTransaction = 0;
  v7 = [v3 dataSource];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v7, "switcherContentController:frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", v3, objc_msgSend(v5, "interfaceOrientation"), objc_msgSend(v5, "floatingConfiguration"));
  }
  else
  {
    CGFloat v8 = *MEMORY[0x1E4F1DB28];
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  self->_initialFloatingApplicationFrame.origin.x = v8;
  self->_initialFloatingApplicationFrame.origin.y = v9;
  self->_initialFloatingApplicationFrame.size.width = v10;
  self->_initialFloatingApplicationFrame.size.height = v11;
  if ((v6 & 1) == 0)
  {
    [(SBMoveFloatingApplicationGestureWorkspaceTransaction *)self _startSuppressingKeyboardForFloatingApplication];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v12 = objc_msgSend(v5, "elements", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v22 + 1) + 8 * v16) workspaceEntity];
          v18 = [v17 deviceApplicationSceneEntity];

          if (v18)
          {
            v19 = [v18 sceneHandle];
            [v19 setKeyboardContextMaskStyle:2];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }

    v20 = [(SBWorkspaceTransaction *)self windowScene];
    v21 = [v20 medusaHostedKeyboardWindowController];
    [v21 updateMedusaHostedKeyboardWindow];
  }
}

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v3 _didComplete];
  [(SBMoveFloatingApplicationGestureWorkspaceTransaction *)self _stopSuppressingKeyboard];
}

- (void)_beginWithGesture:(id)a3
{
  id v4 = a3;
  v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  char v6 = [v5 appLayouts];
  v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_405);

  [(SBFluidSwitcherGestureWorkspaceTransaction *)self setSelectedAppLayout:v7];
  v8.receiver = self;
  v8.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v8 _beginWithGesture:v4];
}

BOOL __74__SBMoveFloatingApplicationGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] == 2;
}

- (void)_updateWithGesture:(id)a3
{
  id v4 = a3;
  [(SBMoveFloatingApplicationGestureWorkspaceTransaction *)self _tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture:v4];
  v5.receiver = self;
  v5.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v5 _updateWithGesture:v4];
}

- (void)_finishWithGesture:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  char v6 = v5;
  if (self->_didAddActivateFloatingApplicationTransaction && [v5 isTransitioning])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__SBMoveFloatingApplicationGestureWorkspaceTransaction__finishWithGesture___block_invoke;
    v11[3] = &unk_1E6AF5290;
    id v12 = v6;
    uint64_t v13 = self;
    [(SBMoveFloatingApplicationGestureWorkspaceTransaction *)self _performBlockWithLiveContentOverlayUpdatesSuspended:v11];
  }
  v10.receiver = self;
  v10.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v10 _finishWithGesture:v4];
  v7 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  objc_super v8 = [v7 layoutContext];
  CGFloat v9 = [v8 layoutState];

  if (([v9 layoutContainsRole:3] & 1) == 0) {
    [(SBMoveFloatingApplicationGestureWorkspaceTransaction *)self _startSuppressingKeyboardForFloatingApplication];
  }
}

void *__75__SBMoveFloatingApplicationGestureWorkspaceTransaction__finishWithGesture___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboard.moveFloatingApplicationTransaction" code:0 userInfo:0];
  [v2 endTransitionWithError:v3];

  result = *(void **)(*(void *)(a1 + 40) + 432);
  if (result)
  {
    return (void *)[result interruptWithReason:@"Finished Move Gesture"];
  }
  return result;
}

- (void)_tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture:(id)a3
{
  id v4 = a3;
  if (self->_tryPreemptiveFloatingApplicationActivation && !self->_didAddActivateFloatingApplicationTransaction)
  {
    objc_super v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];

    if (v5)
    {
      char v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
      v7 = [v6 layoutContext];
      objc_super v8 = [v7 layoutState];

      CGFloat v9 = [v6 view];
      [v4 translationInView:v9];
      double v11 = v10;

      [v8 interfaceOrientation];
      SBLayoutDefaultSideLayoutElementWidth();
      if (fabs(v11) > v12 * 0.3)
      {
        uint64_t v13 = [(SBMoveFloatingApplicationGestureWorkspaceTransaction *)self _transitionRequestForPreemptiveFloatingApplicationActivation];
        [v13 finalize];
        objc_storeStrong((id *)&self->super.super.super.super._transitionRequest, v13);
        uint64_t v14 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
        [v14 beginTransitionForWorkspaceTransaction:self];

        uint64_t v15 = [v13 applicationContext];
        uint64_t v16 = [v15 layoutState];
        v17 = [v16 elementWithRole:3];

        v18 = [v17 workspaceEntity];
        v19 = [v18 applicationSceneEntity];

        v20 = [[SBApplicationSceneUpdateTransaction alloc] initWithApplicationSceneEntity:v19 transitionRequest:v13];
        activateFloatingApplicationTransaction = self->_activateFloatingApplicationTransaction;
        self->_activateFloatingApplicationTransaction = v20;

        [(FBApplicationUpdateScenesTransaction *)self->_activateFloatingApplicationTransaction setWaitsForSceneCommits:0];
        objc_initWeak(&location, self);
        long long v22 = self->_activateFloatingApplicationTransaction;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __122__SBMoveFloatingApplicationGestureWorkspaceTransaction__tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture___block_invoke;
        v23[3] = &unk_1E6AF80B8;
        objc_copyWeak(&v24, &location);
        [(SBApplicationSceneUpdateTransaction *)v22 setCompletionBlock:v23];
        [(SBMoveFloatingApplicationGestureWorkspaceTransaction *)self addChildTransaction:self->_activateFloatingApplicationTransaction];
        self->_didAddActivateFloatingApplicationTransaction = 1;
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __122__SBMoveFloatingApplicationGestureWorkspaceTransaction__tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[54];
    WeakRetained[54] = 0;
    objc_super v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (id)_transitionRequestForPreemptiveFloatingApplicationActivation
{
  objc_super v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v4 = [v3 workspace];

  objc_super v5 = [v4 createRequestWithOptions:0];
  char v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];
  v7 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v6];

  objc_super v8 = [(SBWorkspaceTransaction *)self windowScene];
  CGFloat v9 = [v8 switcherController];

  [v9 configureRequest:v5 forSwitcherTransitionRequest:v7 withEventLabel:@"PreemptiveFloatingApplicationActivation"];
  double v10 = [(SBWorkspaceTransaction *)self transitionRequest];
  objc_msgSend(v5, "setSource:", objc_msgSend(v10, "source"));

  [v5 modifyApplicationContext:&__block_literal_global_27_2];
  return v5;
}

void __116__SBMoveFloatingApplicationGestureWorkspaceTransaction__transitionRequestForPreemptiveFloatingApplicationActivation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 applicationSceneEntities];
  objc_msgSend(v2, "bs_each:", &__block_literal_global_30_5);
}

uint64_t __116__SBMoveFloatingApplicationGestureWorkspaceTransaction__transitionRequestForPreemptiveFloatingApplicationActivation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFlag:1 forActivationSetting:9];
}

- (void)_performBlockWithLiveContentOverlayUpdatesSuspended:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  uint64_t v5 = [v6 areLiveContentOverlayUpdatesSuspended];
  [v6 setLiveContentOverlayUpdatesSuspended:1];
  v4[2](v4);

  [v6 setLiveContentOverlayUpdatesSuspended:v5];
}

- (void)_startSuppressingKeyboardForFloatingApplication
{
  objc_super v3 = +[SBKeyboardSuppressionManager sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__SBMoveFloatingApplicationGestureWorkspaceTransaction__startSuppressingKeyboardForFloatingApplication__block_invoke;
  v4[3] = &unk_1E6AF9A10;
  v4[4] = self;
  [v3 startSuppressingKeyboardWithReason:@"SBMoveFloatingApplicationKeyboardSuppressionReason" predicate:v4 displayIdentity:0];
}

uint64_t __103__SBMoveFloatingApplicationGestureWorkspaceTransaction__startSuppressingKeyboardForFloatingApplication__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedAppLayout];
  uint64_t v5 = [v4 itemForLayoutRole:1];

  id v6 = [v3 identifier];

  v7 = [v5 uniqueIdentifier];
  uint64_t v8 = [v6 isEqualToString:v7];

  return v8;
}

- (void)_stopSuppressingKeyboard
{
  id v2 = +[SBKeyboardSuppressionManager sharedInstance];
  [v2 stopSuppressingKeyboardWithReason:@"SBMoveFloatingApplicationKeyboardSuppressionReason"];
}

- (void).cxx_destruct
{
}

@end