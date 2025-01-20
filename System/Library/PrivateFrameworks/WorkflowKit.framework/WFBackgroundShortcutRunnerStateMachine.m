@interface WFBackgroundShortcutRunnerStateMachine
- (BOOL)blocksTransitionsOnInvalidation;
- (BOOL)isRunningShortcut;
- (OS_dispatch_queue)delegateQueue;
- (WFBackgroundShortcutRunnerStateMachine)initWithProcessPolicy:(unint64_t)a3;
- (WFBackgroundShortcutRunnerStateMachineDelegate)delegate;
- (WFWorkflow)shortcut;
- (unint64_t)processPolicy;
- (void)connectionInvalidatedOrInterrupted;
- (void)exitWithReason:(id)a3;
- (void)finishRunningWithReason:(id)a3 result:(id)a4;
- (void)handlingRequestStateWithReason:(id)a3;
- (void)idleStateWithReason:(id)a3;
- (void)invalidate;
- (void)invalidateWithReason:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startRunningShortcutWithEnvironment:(int64_t)a3 reference:(id)a4 isPersonalAutomation:(BOOL)a5 reason:(id)a6;
- (void)stopShortcutWithError:(id)a3 reason:(id)a4;
@end

@implementation WFBackgroundShortcutRunnerStateMachine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (WFWorkflow)shortcut
{
  return self->_shortcut;
}

- (unint64_t)processPolicy
{
  return self->_processPolicy;
}

- (void)setDelegate:(id)a3
{
}

- (WFBackgroundShortcutRunnerStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFBackgroundShortcutRunnerStateMachineDelegate *)WeakRetained;
}

- (void)invalidateWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFStateMachine *)self currentState];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)[v5 stage] > 2)
    {
      if ([v5 stage] == 4 || objc_msgSend(v5, "stage") == 5)
      {
        v6 = getWFStateMachineLogObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315394;
          v8 = "-[WFBackgroundShortcutRunnerStateMachine invalidateWithReason:]";
          __int16 v9 = 2112;
          id v10 = v4;
          _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s %@ while finishing shortcut or exiting runner. Exiting should already be in process, not transitioning.", (uint8_t *)&v7, 0x16u);
        }
      }
    }
    else
    {
      [(WFBackgroundShortcutRunnerStateMachine *)self stopShortcutWithError:0 reason:v4];
    }
  }
  else
  {

    v5 = 0;
  }
}

- (void)connectionInvalidatedOrInterrupted
{
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = getWFStateMachineLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[WFBackgroundShortcutRunnerStateMachine invalidate]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s State machine invalidated", (uint8_t *)&v4, 0xCu);
  }

  [(WFBackgroundShortcutRunnerStateMachine *)self invalidateWithReason:@"state machine invalidated"];
}

- (void)exitWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WFBackgroundShortcutRunnerStateMachine *)self processPolicy] == 1)
  {
    v5 = getWFStateMachineLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[WFBackgroundShortcutRunnerStateMachine exitWithReason:]";
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s exit was requested for reason '%{public}@', but not exiting because process policy is a shared runner", buf, 0x16u);
    }
  }
  else
  {
    v5 = objc_opt_new();
    [v5 setStage:5];
    if ([(WFStateMachine *)self transitionToState:v5 withReason:v4])
    {
      uint64_t v6 = [(WFBackgroundShortcutRunnerStateMachine *)self delegate];

      if (v6)
      {
        int v7 = [(WFBackgroundShortcutRunnerStateMachine *)self delegateQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__WFBackgroundShortcutRunnerStateMachine_exitWithReason___block_invoke;
        block[3] = &unk_1E6558B28;
        block[4] = self;
        dispatch_async(v7, block);
      }
    }
  }
}

void __57__WFBackgroundShortcutRunnerStateMachine_exitWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 runnerStateMachineDidRequestProcessExit:*(void *)(a1 + 32)];
}

- (void)finishRunningWithReason:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setStage:4];
  BOOL v9 = [(WFStateMachine *)self transitionToState:v8 withReason:v7];

  if (v9)
  {
    id v10 = [(WFBackgroundShortcutRunnerStateMachine *)self delegate];

    if (v10)
    {
      __int16 v11 = [(WFBackgroundShortcutRunnerStateMachine *)self delegateQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__WFBackgroundShortcutRunnerStateMachine_finishRunningWithReason_result___block_invoke;
      v12[3] = &unk_1E6558938;
      v12[4] = self;
      id v13 = v6;
      dispatch_async(v11, v12);
    }
  }
}

void __73__WFBackgroundShortcutRunnerStateMachine_finishRunningWithReason_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 runnerStateMachine:*(void *)(a1 + 32) didFinishRunningShortcutWithResult:*(void *)(a1 + 40)];
}

- (void)stopShortcutWithError:(id)a3 reason:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFStateMachine *)self currentState];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)[v8 stage] < 3)
      {
        id v10 = objc_opt_new();
        [v10 setStage:3];
        if ([(WFStateMachine *)self transitionToState:v10 withReason:v7])
        {
          __int16 v11 = [(WFBackgroundShortcutRunnerStateMachine *)self delegate];

          if (v11)
          {
            id v12 = [(WFBackgroundShortcutRunnerStateMachine *)self delegateQueue];
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v13[2] = __71__WFBackgroundShortcutRunnerStateMachine_stopShortcutWithError_reason___block_invoke;
            v13[3] = &unk_1E6558938;
            v13[4] = self;
            id v14 = v6;
            dispatch_async(v12, v13);
          }
        }
      }
      else
      {
        BOOL v9 = getWFStateMachineLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "-[WFBackgroundShortcutRunnerStateMachine stopShortcutWithError:reason:]";
          __int16 v17 = 2114;
          id v18 = v7;
          __int16 v19 = 2048;
          uint64_t v20 = [v8 stage];
          _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s stop was requested because %{public}@, but we're already in the process of stopping/finishing (current stage: %lu)", buf, 0x20u);
        }
      }
    }
  }
}

void __71__WFBackgroundShortcutRunnerStateMachine_stopShortcutWithError_reason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 runnerStateMachine:*(void *)(a1 + 32) didRequestStoppingShortcutWithError:*(void *)(a1 + 40)];
}

- (void)startRunningShortcutWithEnvironment:(int64_t)a3 reference:(id)a4 isPersonalAutomation:(BOOL)a5 reason:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = [[WFRunnerRunningState alloc] initWithEnvironment:a3 isPersonalAutomation:v7];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __116__WFBackgroundShortcutRunnerStateMachine_startRunningShortcutWithEnvironment_reference_isPersonalAutomation_reason___block_invoke;
  __int16 v17 = &unk_1E6558938;
  id v18 = v10;
  __int16 v19 = self;
  id v13 = v10;
  [(WFRunnerRunningState *)v12 setTimeoutHandler:&v14];
  -[WFStateMachine transitionToState:withReason:](self, "transitionToState:withReason:", v12, v11, v14, v15, v16, v17);
}

void __116__WFBackgroundShortcutRunnerStateMachine_startRunningShortcutWithEnvironment_reference_isPersonalAutomation_reason___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = NSString;
    v3 = WFLocalizedString(@"“%@” took too long to run.");
    id v4 = [*(id *)(a1 + 32) name];
    v5 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v4);
  }
  else
  {
    v5 = WFLocalizedString(@"The shortcut took too long to run.");
  }
  id v6 = (void *)MEMORY[0x1E4F28C58];
  v10[0] = *MEMORY[0x1E4F28568];
  BOOL v7 = WFLocalizedString(@"Shortcut Timed Out");
  v10[1] = *MEMORY[0x1E4F28588];
  v11[0] = v7;
  v11[1] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  BOOL v9 = [v6 errorWithDomain:@"WFBackgroundShortcutRunnerErrorDomain" code:11 userInfo:v8];

  [*(id *)(a1 + 40) stopShortcutWithError:v9 reason:@"runner timed out"];
}

- (void)handlingRequestStateWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setStage:1];
  [(WFStateMachine *)self transitionToState:v5 withReason:v4];
}

- (void)idleStateWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setStage:0];
  [(WFStateMachine *)self transitionToState:v5 withReason:v4];
}

- (BOOL)isRunningShortcut
{
  id v2 = [(WFStateMachine *)self currentState];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)blocksTransitionsOnInvalidation
{
  return 0;
}

- (WFBackgroundShortcutRunnerStateMachine)initWithProcessPolicy:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFBackgroundShortcutRunnerStateMachine;
  id v4 = [(WFStateMachine *)&v10 init];
  if (v4)
  {
    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.shortcuts.WFBackgroundShortcutRunnerStateMachine.delegate-queue", v5);
    delegateQueue = v4->_delegateQueue;
    v4->_delegateQueue = (OS_dispatch_queue *)v6;

    v4->_processPolicy = a3;
    v8 = v4;
  }
  return v4;
}

@end