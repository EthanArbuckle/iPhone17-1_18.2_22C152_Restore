@interface SBInCallSceneUpdateWorkspaceTransaction
- (SBInCallSceneUpdateWorkspaceTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4;
- (id)postSceneUpdateHandler;
- (void)_begin;
- (void)setPostSceneUpdateHandler:(id)a3;
@end

@implementation SBInCallSceneUpdateWorkspaceTransaction

- (SBInCallSceneUpdateWorkspaceTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBInCallSceneUpdateWorkspaceTransaction;
  v8 = [(SBMainWorkspaceTransaction *)&v11 initWithTransitionRequest:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_applicationSceneEntity, a3);
  }

  return v9;
}

- (void)_begin
{
  v14.receiver = self;
  v14.super_class = (Class)SBInCallSceneUpdateWorkspaceTransaction;
  [(SBInCallSceneUpdateWorkspaceTransaction *)&v14 _begin];
  v3 = (void *)MEMORY[0x1D948C7A0](self->_postSceneUpdateHandler);
  id postSceneUpdateHandler = self->_postSceneUpdateHandler;
  self->_id postSceneUpdateHandler = 0;

  if (v3) {
    [(SBInCallSceneUpdateWorkspaceTransaction *)self addMilestone:@"_SBInCallSceneUpdateWorkspaceTransactionMilestonePostSceneUpdateBlocks"];
  }
  [(SBInCallSceneUpdateWorkspaceTransaction *)self addMilestone:@"_SBInCallSceneUpdateWorkspaceTransactionMilestoneSceneUpdate"];
  v5 = [(SBWorkspaceTransaction *)self transitionRequest];
  v6 = [[SBApplicationSceneUpdateTransaction alloc] initWithApplicationSceneEntity:self->_applicationSceneEntity transitionRequest:v5];
  [(FBApplicationUpdateScenesTransaction *)v6 setWaitsForSceneCommits:1];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke;
  objc_super v11 = &unk_1E6AFF0E8;
  v12 = self;
  id v13 = v3;
  id v7 = v3;
  [(SBApplicationSceneUpdateTransaction *)v6 setCompletionBlock:&v8];
  -[SBInCallSceneUpdateWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v6, 0, v8, v9, v10, v11, v12);
}

uint64_t __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke_2;
    v5[3] = &unk_1E6AF5350;
    v5[4] = *(void *)(a1 + 32);
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, a2, v5);
  }
  return [*(id *)(a1 + 32) removeMilestone:@"_SBInCallSceneUpdateWorkspaceTransactionMilestoneSceneUpdate"];
}

uint64_t __49__SBInCallSceneUpdateWorkspaceTransaction__begin__block_invoke_2(uint64_t a1, char a2)
{
  if (([*(id *)(a1 + 32) isFailed] & 1) == 0 && (a2 & 1) == 0) {
    [*(id *)(a1 + 32) failWithReason:@"Post scene update failure"];
  }
  v4 = *(void **)(a1 + 32);
  return [v4 removeMilestone:@"_SBInCallSceneUpdateWorkspaceTransactionMilestonePostSceneUpdateBlocks"];
}

- (id)postSceneUpdateHandler
{
  return self->_postSceneUpdateHandler;
}

- (void)setPostSceneUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postSceneUpdateHandler, 0);
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
}

@end