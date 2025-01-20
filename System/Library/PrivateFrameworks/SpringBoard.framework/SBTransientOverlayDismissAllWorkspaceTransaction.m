@interface SBTransientOverlayDismissAllWorkspaceTransaction
+ (BOOL)isValidForTransitionRequest:(id)a3;
- (SBTransientOverlayDismissAllWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (int64_t)isAnimatedOverride;
- (void)_begin;
- (void)setAnimatedOverride:(int64_t)a3;
@end

@implementation SBTransientOverlayDismissAllWorkspaceTransaction

- (SBTransientOverlayDismissAllWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissAllWorkspaceTransaction;
  result = [(SBMainWorkspaceTransaction *)&v4 initWithTransitionRequest:a3];
  if (result) {
    result->_animatedOverride = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_begin
{
  v27.receiver = self;
  v27.super_class = (Class)SBTransientOverlayDismissAllWorkspaceTransaction;
  [(SBTransientOverlayDismissAllWorkspaceTransaction *)&v27 _begin];
  [(SBTransientOverlayDismissAllWorkspaceTransaction *)self addMilestone:@"_SBTransientOverlayDismissAllWorkspaceTransactionMilestoneDismissalRequest"];
  v3 = [(SBWorkspaceTransaction *)self windowScene];
  objc_super v4 = [v3 switcherController];
  v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  v6 = [v5 transientOverlayContext];
  v7 = [v6 scenePresenter];
  v8 = [v6 presentationManager];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__17;
  v25[4] = __Block_byref_object_dispose__17;
  id v26 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke;
  v21[3] = &unk_1E6AFACF8;
  id v9 = v4;
  id v22 = v9;
  id v10 = v8;
  id v23 = v10;
  v24 = v25;
  [v9 enumerateTransientOverlayViewControllersUsingBlock:v21];
  if (v7) {
    +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllersInWindowScene:v3];
  }
  else {
  v11 = +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllers];
  }
  uint64_t IsYes = [v6 isAnimated];
  if (self->_animatedOverride != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t IsYes = BSSettingFlagIsYes();
  }
  [v11 setAnimated:IsYes];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke_2;
  v17 = &unk_1E6AF6380;
  v20 = v25;
  id v13 = v9;
  id v18 = v13;
  v19 = self;
  [v11 setCompletionHandler:&v14];
  objc_msgSend(v10, "performDismissalRequest:", v11, v14, v15, v16, v17);

  _Block_object_dispose(v25, 8);
}

void __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isAcquiredTransientOverlayViewController:v5] & 1) == 0
    && [*(id *)(a1 + 40) isPresentingViewController:v5])
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v6 setObject:v5 forKey:v10];
  }
}

uint64_t __58__SBTransientOverlayDismissAllWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKey:", v7, (void)v10);
        [*(id *)(a1 + 32) addAcquiredTransientOverlayViewController:v8 forAppLayout:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) removeMilestone:@"_SBTransientOverlayDismissAllWorkspaceTransactionMilestoneDismissalRequest"];
}

+ (BOOL)isValidForTransitionRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 transientOverlayContext];
  if ([v4 transitionType] == 1)
  {
    uint64_t v5 = [(id)SBApp windowSceneManager];
    v6 = [v3 displayIdentity];
    uint64_t v7 = [v5 windowSceneForDisplayIdentity:v6];

    uint64_t v8 = [v7 switcherController];
    if ([v8 hasTransientOverlayAppLayouts])
    {
      BOOL v9 = 1;
    }
    else
    {
      long long v10 = [v4 scenePresenter];
      if ([v10 hasActivePresentation])
      {
        BOOL v9 = 1;
      }
      else
      {
        long long v11 = [v4 presentationManager];
        long long v12 = v11;
        BOOL v9 = !v10 && ([v11 hasActivePresentation] & 1) != 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int64_t)isAnimatedOverride
{
  return self->_animatedOverride;
}

- (void)setAnimatedOverride:(int64_t)a3
{
  self->_animatedOverride = a3;
}

@end