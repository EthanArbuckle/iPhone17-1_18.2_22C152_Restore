@interface SBTransientOverlayDismissToAppsWorkspaceTransaction
+ (BOOL)isValidForTransitionRequest:(id)a3;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (void)_begin;
- (void)_didComplete;
- (void)_sendActivationResultWithError:(id)a3;
@end

@implementation SBTransientOverlayDismissToAppsWorkspaceTransaction

- (void)_begin
{
  v10.receiver = self;
  v10.super_class = (Class)SBTransientOverlayDismissToAppsWorkspaceTransaction;
  [(SBTransientOverlayDismissToAppsWorkspaceTransaction *)&v10 _begin];
  v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  if (![(id)objc_opt_class() isValidForTransitionRequest:v3]) {
    goto LABEL_9;
  }
  v4 = [v3 transientOverlayContext];
  v5 = [v4 transientOverlay];
  if (v5)
  {
    v6 = [v4 presentationManager];
    uint64_t v7 = [v6 presentedViewControllerCount];
    v8 = off_1E6AF1070;
    if (v7 <= 1) {
      v8 = off_1E6AF1058;
    }
    v9 = (SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)[objc_alloc(*v8) initWithTransitionRequest:v3];
  }
  else
  {
    v9 = [[SBTransientOverlayDismissAllToAppsWorkspaceTransaction alloc] initWithTransitionRequest:v3];
  }

  if (v9)
  {
    [(SBTransientOverlayDismissToAppsWorkspaceTransaction *)self addChildTransaction:v9 withSchedulingPolicy:0];
  }
  else
  {
LABEL_9:
    [(SBTransientOverlayDismissToAppsWorkspaceTransaction *)self _evaluateCompletion];
  }
}

- (void)_didComplete
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissToAppsWorkspaceTransaction;
  [(SBMainWorkspaceTransaction *)&v4 _didComplete];
  v3 = SBWTErrorCreateForTransaction(self);
  [(SBTransientOverlayDismissToAppsWorkspaceTransaction *)self _sendActivationResultWithError:v3];
}

- (void)_sendActivationResultWithError:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  v5 = [v4 applicationContext];

  if ([v5 needsToSendActivationResult])
  {
    [v5 sendActivationResultError:v7];
    if ([(SBTransientOverlayDismissToAppsWorkspaceTransaction *)self isAuditHistoryEnabled])
    {
      v6 = [v7 localizedFailureReason];
      -[SBTransientOverlayDismissToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", @"Sent activation result; error = %@",
        v6);
    }
  }
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(SBTransientOverlayDismissToAppsWorkspaceTransaction *)self childTransactions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ![v10 canInterruptForTransitionRequest:v4])
        {
          BOOL v11 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)isValidForTransitionRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 transientOverlayContext];
  v5 = [v4 transientOverlay];
  uint64_t v6 = off_1E6AF1060;
  if (v5) {
    uint64_t v6 = off_1E6AF1070;
  }
  char v7 = [(__objc2_class *)*v6 isValidForTransitionRequest:v3];

  return v7;
}

@end