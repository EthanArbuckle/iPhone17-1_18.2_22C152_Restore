@interface SBWakeToInCallWorkspaceTransaction
- (void)_begin;
@end

@implementation SBWakeToInCallWorkspaceTransaction

- (void)_begin
{
  v24.receiver = self;
  v24.super_class = (Class)SBWakeToInCallWorkspaceTransaction;
  [(SBWakeToInCallWorkspaceTransaction *)&v24 _begin];
  [(SBWakeToInCallWorkspaceTransaction *)self addMilestone:@"_SBWakeToInCallWorkspaceTransactionMilestonePresentation"];
  v3 = [(SBWorkspaceTransaction *)self transitionRequest];
  v4 = [v3 workspace];
  v5 = [v4 inCallPresentationManager];
  v6 = [v3 applicationContext];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__61;
  v22 = __Block_byref_object_dispose__61;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke;
  v14[3] = &unk_1E6B03EA8;
  id v7 = v6;
  id v15 = v7;
  v17 = &v18;
  id v8 = v5;
  id v16 = v8;
  SBLayoutRoleEnumerateValidRoles(v14);
  v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = [v8 _lastPresentationSession];
    if (!v10)
    {
      [(SBWakeToInCallWorkspaceTransaction *)self removeMilestone:@"_SBWakeToInCallWorkspaceTransactionMilestonePresentation"];
      goto LABEL_5;
    }
  }
  v11 = [SBInCallTransientOverlayPresentationWorkspaceTransaction alloc];
  v12 = [(SBInCallTransientOverlayPresentationWorkspaceTransaction *)v11 initWithTransitionRequest:v3 sourcePresentationSession:v10 analyticsSource:*MEMORY[0x1E4FA7E28]];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke_2;
  v13[3] = &unk_1E6AF5350;
  v13[4] = self;
  [(SBInCallTransientOverlayPresentationWorkspaceTransaction *)v12 setCompletionBlock:v13];
  [(SBWakeToInCallWorkspaceTransaction *)self addChildTransaction:v12 withSchedulingPolicy:0];

LABEL_5:
  _Block_object_dispose(&v18, 8);
}

void __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) entityForLayoutRole:a2];
  id v12 = [v3 deviceApplicationSceneEntity];

  v4 = v12;
  if (v12)
  {
    v5 = [v12 sceneHandle];
    v6 = v5;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [v5 sceneIdentifier];
      uint64_t v9 = [v7 _sessionForSceneWithIdentifier:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    v4 = v12;
  }
}

uint64_t __44__SBWakeToInCallWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeMilestone:@"_SBWakeToInCallWorkspaceTransactionMilestonePresentation"];
}

@end