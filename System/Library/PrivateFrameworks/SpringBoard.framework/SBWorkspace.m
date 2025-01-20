@interface SBWorkspace
+ (id)mainWorkspace;
- (BOOL)_executeTransitionRequest:(id)a3 options:(unint64_t)a4 validator:(id)a5;
- (BOOL)executeTransitionRequest:(id)a3;
- (BOOL)executeTransitionRequest:(id)a3 withValidator:(id)a4;
- (BOOL)requestTransitionWithBuilder:(id)a3;
- (BOOL)requestTransitionWithOptions:(unint64_t)a3 builder:(id)a4 validator:(id)a5;
- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5;
- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5 validator:(id)a6;
- (FBWorkspaceEventQueue)eventQueue;
- (SBWorkspace)init;
- (SBWorkspace)initWithEventQueue:(id)a3;
- (SBWorkspaceTransaction)currentTransaction;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)createRequestForApplicationActivation:(id)a3 options:(unint64_t)a4;
- (id)createRequestForApplicationActivation:(id)a3 withDisplayConfiguration:(id)a4 options:(unint64_t)a5;
- (id)createRequestWithOptions:(unint64_t)a3;
- (id)createRequestWithOptions:(unint64_t)a3 displayConfiguration:(id)a4;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)transactionForTransitionRequest:(id)a3;
@end

@implementation SBWorkspace

+ (id)mainWorkspace
{
  return +[SBMainWorkspace _sharedInstanceWithNilCheckPolicy:1];
}

- (FBWorkspaceEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (BOOL)executeTransitionRequest:(id)a3 withValidator:(id)a4
{
  return [(SBWorkspace *)self _executeTransitionRequest:a3 options:0 validator:a4];
}

void __86__SBWorkspace_createRequestForApplicationActivation_withDisplayConfiguration_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) BOOLForActivationSetting:3]) {
    [v3 setBackground:1];
  }
  [v3 setActivatingEntity:*(void *)(a1 + 32)];
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5 validator:(id)a6
{
  v10 = (void (**)(id, void *))a5;
  id v11 = a6;
  v12 = [(SBWorkspace *)self createRequestWithOptions:a3 displayConfiguration:a4];
  if (v10) {
    v10[2](v10, v12);
  }
  BOOL v13 = [(SBWorkspace *)self _executeTransitionRequest:v12 options:a3 validator:v11];

  return v13;
}

- (id)createRequestForApplicationActivation:(id)a3 withDisplayConfiguration:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  v9 = [(SBWorkspace *)self createRequestWithOptions:a5 displayConfiguration:a4];
  v10 = [v8 uniqueIdentifier];
  [v9 setEventLabelWithFormat:@"ActivateApplicationScene = %@", v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__SBWorkspace_createRequestForApplicationActivation_withDisplayConfiguration_options___block_invoke;
  v13[3] = &unk_1E6AF57C0;
  id v14 = v8;
  id v11 = v8;
  [v9 modifyApplicationContext:v13];

  return v9;
}

- (SBWorkspace)init
{
  return [(SBWorkspace *)self initWithEventQueue:0];
}

- (SBWorkspace)initWithEventQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBWorkspace.m", 1599, @"Invalid parameter not satisfying: %@", @"eventQueue" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBWorkspace;
  v7 = [(SBWorkspace *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_eventQueue, a3);
  }

  return v8;
}

- (id)createRequestForApplicationActivation:(id)a3 options:(unint64_t)a4
{
  return [(SBWorkspace *)self createRequestForApplicationActivation:a3 withDisplayConfiguration:0 options:a4];
}

- (BOOL)requestTransitionWithBuilder:(id)a3
{
  return [(SBWorkspace *)self requestTransitionWithOptions:0 builder:a3 validator:0];
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 builder:(id)a4 validator:(id)a5
{
  id v8 = (void (**)(id, void *))a4;
  id v9 = a5;
  v10 = [(SBWorkspace *)self createRequestWithOptions:a3];
  if (v8) {
    v8[2](v8, v10);
  }
  BOOL v11 = [(SBWorkspace *)self _executeTransitionRequest:v10 options:a3 validator:v9];

  return v11;
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5
{
  return [(SBWorkspace *)self requestTransitionWithOptions:a3 displayConfiguration:a4 builder:a5 validator:0];
}

- (BOOL)executeTransitionRequest:(id)a3
{
  return [(SBWorkspace *)self _executeTransitionRequest:a3 options:0 validator:0];
}

- (SBWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (id)createRequestWithOptions:(unint64_t)a3
{
  return 0;
}

- (id)createRequestWithOptions:(unint64_t)a3 displayConfiguration:(id)a4
{
  return 0;
}

- (id)transactionForTransitionRequest:(id)a3
{
  return 0;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  OUTLINED_FUNCTION_9();
  objc_opt_class();
  OUTLINED_FUNCTION_6();
  return +[SBIdleTimerBehavior disabledBehavior];
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  OUTLINED_FUNCTION_9();
  objc_opt_class();
  OUTLINED_FUNCTION_6();
  v5 = objc_alloc_init(SBDisabledIdleTimer);
  return v5;
}

- (BOOL)_executeTransitionRequest:(id)a3 options:(unint64_t)a4 validator:(id)a5
{
  return 0;
}

@end