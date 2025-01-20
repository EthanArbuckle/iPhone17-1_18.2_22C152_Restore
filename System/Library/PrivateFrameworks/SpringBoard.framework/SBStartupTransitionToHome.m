@interface SBStartupTransitionToHome
- (void)performTransitionWithCompletionBlock:(id)a3;
@end

@implementation SBStartupTransitionToHome

- (void)performTransitionWithCompletionBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBStartupTransitionToHome.m", 20, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  v6 = [(SBBaseStartupTransition *)self mainWorkspace];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E6AF7128;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [v6 requestTransitionWithOptions:0 builder:v9 validator:&__block_literal_global_16_0];
}

void __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:31];
  [v3 modifyApplicationContext:&__block_literal_global_190];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E6B03B48;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 setTransactionConfigurator:v5];
}

void __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SBWorkspaceEntity entity];
  [v2 setEntity:v3 forLayoutRole:1];

  id v4 = +[SBWorkspaceEntity entity];
  [v2 setEntity:v4 forLayoutRole:2];
}

void __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [SBUIStartupToHomescreenAnimationController alloc];
  id v5 = [v3 transitionRequest];
  id v6 = [*(id *)(a1 + 32) context];
  id v7 = [v6 overlay];
  v8 = [(SBUIStartupToHomescreenAnimationController *)v4 initWithTransitionContextProvider:v5 overlay:v7];

  [v3 setSuggestedAnimationController:v8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_4;
  v9[3] = &unk_1E6AF5A50;
  id v10 = *(id *)(a1 + 40);
  [v3 setCompletionBlock:v9];
}

uint64_t __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_5()
{
  return 1;
}

@end