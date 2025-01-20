@interface SBTransientOverlayDismissWorkspaceTransaction
+ (BOOL)isValidForTransitionRequest:(id)a3;
- (void)_begin;
- (void)_didComplete;
- (void)_sendActivationResultWithError:(id)a3;
@end

@implementation SBTransientOverlayDismissWorkspaceTransaction

- (void)_begin
{
  v22.receiver = self;
  v22.super_class = (Class)SBTransientOverlayDismissWorkspaceTransaction;
  [(SBTransientOverlayDismissWorkspaceTransaction *)&v22 _begin];
  v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  v4 = [v3 transientOverlayContext];
  v5 = [v4 transientOverlay];
  v6 = [v5 viewController];
  v7 = [v4 presentationManager];
  v8 = [(SBWorkspaceTransaction *)self windowScene];
  v9 = [v8 switcherController];

  v10 = [v9 appLayoutForWorkspaceTransientOverlay:v5];

  if (v10)
  {
    [(SBTransientOverlayDismissWorkspaceTransaction *)self addMilestone:@"_SBTransientOverlayDismissWorkspaceTransactionMilestoneSwitcherTransition"];
    v11 = [v3 applicationContext];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke;
    v21[3] = &unk_1E6AF5350;
    v21[4] = self;
    [v9 performTransitionWithContext:v11 animated:0 completion:v21];
  }
  v12 = +[SBTransientOverlayDismissalRequest dismissalRequestForViewController:v6];
  objc_msgSend(v12, "setAnimated:", objc_msgSend(v4, "isAnimated"));
  [(SBTransientOverlayDismissWorkspaceTransaction *)self addMilestone:@"_SBTransientOverlayDismissWorkspaceTransactionMilestoneDismissalAnimation"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke_2;
  v16[3] = &unk_1E6AF59B8;
  id v17 = v9;
  id v18 = v5;
  id v19 = v6;
  v20 = self;
  id v13 = v6;
  id v14 = v5;
  id v15 = v9;
  [v12 setCompletionHandler:v16];
  [v7 performDismissalRequest:v12];
}

uint64_t __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeMilestone:@"_SBTransientOverlayDismissWorkspaceTransactionMilestoneSwitcherTransition"];
}

void __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) appLayoutForWorkspaceTransientOverlay:*(void *)(a1 + 40)];
  if (v5) {
    [*(id *)(a1 + 32) addAcquiredTransientOverlayViewController:*(void *)(a1 + 48) forAppLayout:v5];
  }
  v2 = +[SBKeyboardFocusCoordinator sharedInstance];
  v3 = [*(id *)(a1 + 56) windowScene];
  v4 = +[SBKeyboardFocusArbitrationReason transientOverlayDismissWorkspaceTransactionDidBegin];
  [v2 requestArbitrationForSBWindowScene:v3 forReason:v4];

  [*(id *)(a1 + 56) removeMilestone:@"_SBTransientOverlayDismissWorkspaceTransactionMilestoneDismissalAnimation"];
}

- (void)_didComplete
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissWorkspaceTransaction;
  [(SBMainWorkspaceTransaction *)&v4 _didComplete];
  v3 = SBWTErrorCreateForTransaction(self);
  [(SBTransientOverlayDismissWorkspaceTransaction *)self _sendActivationResultWithError:v3];
}

- (void)_sendActivationResultWithError:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v5 = [v4 applicationContext];

  if ([v5 needsToSendActivationResult])
  {
    [v5 sendActivationResultError:v7];
    if ([(SBTransientOverlayDismissWorkspaceTransaction *)self isAuditHistoryEnabled])
    {
      v6 = [v7 localizedFailureReason];
      -[SBTransientOverlayDismissWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", @"Sent activation result; error = %@",
        v6);
    }
  }
}

+ (BOOL)isValidForTransitionRequest:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 transientOverlayContext];
  if ([v4 transitionType] == 1)
  {
    id v5 = [v4 presentationManager];
    v6 = [v4 transientOverlay];
    if (v6)
    {
      id v7 = [(id)SBApp windowSceneManager];
      v8 = [v3 displayIdentity];
      v9 = [v7 windowSceneForDisplayIdentity:v8];

      v10 = [v9 switcherController];
      v11 = [v6 viewController];
      if ([v10 hasAppLayoutForTransientOverlayViewController:v11]) {
        char v12 = 1;
      }
      else {
        char v12 = [v5 isPresentingViewController:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

@end