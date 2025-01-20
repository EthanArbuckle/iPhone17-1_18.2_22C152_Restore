@interface SBInCallTransientOverlayPresentationWorkspaceTransaction
- (NSString)analyticsSource;
- (SBInCallPresentationSession)sourcePresentationSession;
- (SBInCallTransientOverlayPresentationWorkspaceTransaction)initWithTransitionRequest:(id)a3 sourcePresentationSession:(id)a4 analyticsSource:(id)a5;
- (void)_begin;
- (void)_performInCallPresentationWithCompletion:(id)a3;
@end

@implementation SBInCallTransientOverlayPresentationWorkspaceTransaction

- (SBInCallTransientOverlayPresentationWorkspaceTransaction)initWithTransitionRequest:(id)a3 sourcePresentationSession:(id)a4 analyticsSource:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBInCallTransientOverlayPresentationWorkspaceTransaction;
  v11 = [(SBMainWorkspaceTransaction *)&v15 initWithTransitionRequest:a3];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    analyticsSource = v11->_analyticsSource;
    v11->_analyticsSource = (NSString *)v12;

    objc_storeStrong((id *)&v11->_sourcePresentationSession, a4);
  }

  return v11;
}

- (void)_begin
{
  v19.receiver = self;
  v19.super_class = (Class)SBInCallTransientOverlayPresentationWorkspaceTransaction;
  [(SBInCallTransientOverlayPresentationWorkspaceTransaction *)&v19 _begin];
  if (!self->_sourcePresentationSession)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"SBInCallTransientOverlayPresentationWorkspaceTransaction.m" lineNumber:38 description:@"Source presentation session required."];
  }
  [(SBInCallTransientOverlayPresentationWorkspaceTransaction *)self addMilestone:@"_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"];
  v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  v5 = [v4 workspace];
  v6 = [v4 applicationContext];
  v7 = [(SBInCallPresentationSession *)self->_sourcePresentationSession sceneHandle];
  v8 = [v6 layoutState];
  id v9 = [v7 sceneIdentifier];
  id v10 = [v8 elementWithIdentifier:v9];

  if (v10)
  {
    v11 = (void *)[v4 copyMainWorkspaceTransitionRequest];
    [v11 modifyApplicationContext:&__block_literal_global_182];
    [(SBInCallTransientOverlayPresentationWorkspaceTransaction *)self addMilestone:@"_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestoneToAppsTransaction"];
    uint64_t v12 = [v5 transactionForTransitionRequest:v11];
    v13 = [v12 completionBlock];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_3;
    v17[3] = &unk_1E6AFF0E8;
    v17[4] = self;
    id v18 = v13;
    id v14 = v13;
    [v12 setCompletionBlock:v17];
    [(SBInCallTransientOverlayPresentationWorkspaceTransaction *)self addChildTransaction:v12 withSchedulingPolicy:0];
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_5;
    v16[3] = &unk_1E6AF5350;
    v16[4] = self;
    [(SBInCallTransientOverlayPresentationWorkspaceTransaction *)self _performInCallPresentationWithCompletion:v16];
  }
}

void __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_2;
  v5[3] = &unk_1E6AF8788;
  id v6 = v2;
  id v3 = v2;
  SBLayoutRoleEnumerateValidRoles(v5);
  v4 = +[SBWorkspaceEntity entity];
  [v3 setActivatingEntity:v4];

  [v3 setAnimationDisabled:1];
}

void __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[SBWorkspaceEntity entity];
  [v3 setEntity:v4 forLayoutRole:a2];
}

uint64_t __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  v5 = *(void **)(a1 + 32);
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_4;
    v7[3] = &unk_1E6AF5350;
    v7[4] = v5;
    [v5 _performInCallPresentationWithCompletion:v7];
  }
  else
  {
    [v5 removeMilestone:@"_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"];
  }
  return [*(id *)(a1 + 32) removeMilestone:@"_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestoneToAppsTransaction"];
}

uint64_t __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeMilestone:@"_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"];
}

uint64_t __66__SBInCallTransientOverlayPresentationWorkspaceTransaction__begin__block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) failWithReason:@"PreparationFailure"];
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 removeMilestone:@"_SBInCallTransientOverlayPresentationWorkspaceTransactionMilestonePresentation"];
}

- (void)_performInCallPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v6 = [v5 workspace];
  sourcePresentationSession = self->_sourcePresentationSession;
  v8 = [v5 transientOverlayContext];
  uint64_t v9 = [v8 isAnimated];
  analyticsSource = self->_analyticsSource;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke;
  v13[3] = &unk_1E6B02FB0;
  objc_super v15 = self;
  id v16 = v4;
  id v14 = v6;
  id v11 = v4;
  id v12 = v6;
  [(SBInCallPresentationSession *)sourcePresentationSession _prepareForTransientOverlayPresentationTransactionWithAnimation:v9 analyticsSource:analyticsSource completion:v13];
}

void __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke(id *a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = [a3 requestBuilder];
    v5 = [a1[4] createRequestWithOptions:0];
    ((void (**)(void, void *))v4)[2](v4, v5);
    id v6 = [a1[4] transactionForTransitionRequest:v5];
    v7 = [v6 completionBlock];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke_2;
    v13 = &unk_1E6B02F88;
    id v14 = v7;
    id v15 = a1[6];
    id v8 = v7;
    [v6 setCompletionBlock:&v10];
    objc_msgSend(a1[5], "addChildTransaction:withSchedulingPolicy:", v6, 0, v10, v11, v12, v13);
  }
  else
  {
    uint64_t v9 = (void (*)(void))*((void *)a1[6] + 2);
    v9();
  }
}

uint64_t __101__SBInCallTransientOverlayPresentationWorkspaceTransaction__performInCallPresentationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (NSString)analyticsSource
{
  return self->_analyticsSource;
}

- (SBInCallPresentationSession)sourcePresentationSession
{
  return self->_sourcePresentationSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePresentationSession, 0);
  objc_storeStrong((id *)&self->_analyticsSource, 0);
}

@end