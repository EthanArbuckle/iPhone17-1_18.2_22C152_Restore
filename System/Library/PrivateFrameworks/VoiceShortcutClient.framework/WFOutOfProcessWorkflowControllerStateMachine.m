@interface WFOutOfProcessWorkflowControllerStateMachine
- (BOOL)blocksTransitionsOnInvalidation;
- (BOOL)isFinishingShortcut;
- (BOOL)isRunningShortcut;
- (OS_dispatch_queue)delegateQueue;
- (WFOutOfProcessWorkflowControllerStateMachine)init;
- (WFOutOfProcessWorkflowControllerStateMachineDelegate)delegate;
- (void)acquiringRunnerWithReason:(id)a3;
- (void)exitWithReason:(id)a3;
- (void)finishRunningWithReason:(id)a3 result:(id)a4;
- (void)handleRunnerWillExit;
- (void)handleXPCErrorWithDescription:(id)a3 reason:(id)a4 currentDialogAttribution:(id)a5;
- (void)handlingRequestWithReason:(id)a3;
- (void)idleStateWithReason:(id)a3;
- (void)invalidate;
- (void)notifyDelegateWithReason:(id)a3 result:(id)a4 currentDialogAttribution:(id)a5;
- (void)pauseAndWriteShortcutToDiskState;
- (void)setDelegate:(id)a3;
- (void)startRunningShortcutWithReason:(id)a3;
- (void)stopShortcutWithError:(id)a3 reason:(id)a4;
- (void)tearDownRunnerWithReason:(id)a3;
@end

@implementation WFOutOfProcessWorkflowControllerStateMachine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (WFOutOfProcessWorkflowControllerStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFOutOfProcessWorkflowControllerStateMachineDelegate *)WeakRetained;
}

- (void)invalidate
{
}

- (void)handleRunnerWillExit
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t isKindOfClass = [(WFStateMachine *)self currentState];
  uint64_t v4 = isKindOfClass;
  if (isKindOfClass
    && (id v6 = (id)isKindOfClass,
        objc_opt_class(),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(),
        uint64_t v4 = (uint64_t)v6,
        (isKindOfClass & 1) != 0))
  {
    if ((unint64_t)[v6 stage] > 4)
    {
      v5 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v8 = "-[WFOutOfProcessWorkflowControllerStateMachine handleRunnerWillExit]";
        _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_DEFAULT, "%s Runner will exit, but we're already in the proper cleanup. Ignore.", buf, 0xCu);
      }
    }
    else
    {
      [(WFOutOfProcessWorkflowControllerStateMachine *)self stopShortcutWithError:0 reason:@"runner notified us of exit, moving to stop and cleanup"];
    }
  }
  else
  {
    MEMORY[0x1F41817F8](isKindOfClass, v4);
  }
}

- (void)handleXPCErrorWithDescription:(id)a3 reason:(id)a4 currentDialogAttribution:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFStateMachine *)self currentState];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)[v11 stage] <= 6)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = WFOutOfProcessWorkflowControllerErrorDomain;
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = v8;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v15 = [v12 errorWithDomain:v13 code:4 userInfo:v14];

      v16 = [[WFWorkflowRunResult alloc] initWithError:v15];
      [(WFOutOfProcessWorkflowControllerStateMachine *)self notifyDelegateWithReason:v9 result:v16 currentDialogAttribution:v10];
    }
  }
  else
  {

    v11 = 0;
  }
}

- (void)exitWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(WFStateMachine *)self transitionToState:v5 withReason:v4];
}

- (void)tearDownRunnerWithReason:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setStage:8];
  BOOL v6 = [(WFStateMachine *)self transitionToState:v5 withReason:v4];

  if (v6)
  {
    v7 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegate];

    if (v7)
    {
      id v8 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__WFOutOfProcessWorkflowControllerStateMachine_tearDownRunnerWithReason___block_invoke;
      block[3] = &unk_1E6078C68;
      block[4] = self;
      dispatch_async(v8, block);
    }
  }
}

void __73__WFOutOfProcessWorkflowControllerStateMachine_tearDownRunnerWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerStateMachineDidRequestRunnerTearDown:*(void *)(a1 + 32)];
}

- (void)notifyDelegateWithReason:(id)a3 result:(id)a4 currentDialogAttribution:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFStateMachine *)self currentState];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)[v11 stage] < 7)
      {
        uint64_t v13 = objc_opt_new();
        [v13 setStage:7];
        if ([(WFStateMachine *)self transitionToState:v13 withReason:v8])
        {
          v14 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegate];

          if (v14)
          {
            v15 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegateQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __105__WFOutOfProcessWorkflowControllerStateMachine_notifyDelegateWithReason_result_currentDialogAttribution___block_invoke;
            block[3] = &unk_1E6078C40;
            block[4] = self;
            id v17 = v9;
            id v18 = v10;
            dispatch_async(v15, block);
          }
        }
      }
      else
      {
        v12 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[WFOutOfProcessWorkflowControllerStateMachine notifyDelegateWithReason:result:currentDialogAttribution:]";
          __int16 v21 = 2112;
          id v22 = v8;
          _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_DEFAULT, "%s Asked to notify delegate because %@ but we're already >= notifying delegate. Ignoring the request.", buf, 0x16u);
        }
      }
    }
  }
}

void __105__WFOutOfProcessWorkflowControllerStateMachine_notifyDelegateWithReason_result_currentDialogAttribution___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerStateMachine:*(void *)(a1 + 32) shouldNotifyDelegateWithResult:*(void *)(a1 + 40) currentDialogAttribution:*(void *)(a1 + 48)];

  v3 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315394;
    BOOL v6 = "-[WFOutOfProcessWorkflowControllerStateMachine notifyDelegateWithReason:result:currentDialogAttribution:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_DEFAULT, "%s Notifying delegate with result: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)finishRunningWithReason:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  [v8 setStage:6];
  BOOL v9 = [(WFStateMachine *)self transitionToState:v8 withReason:v7];

  if (v9)
  {
    id v10 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegate];

    if (v10)
    {
      v11 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegateQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __79__WFOutOfProcessWorkflowControllerStateMachine_finishRunningWithReason_result___block_invoke;
      v12[3] = &unk_1E6079130;
      v12[4] = self;
      id v13 = v6;
      dispatch_async(v11, v12);
    }
  }
}

void __79__WFOutOfProcessWorkflowControllerStateMachine_finishRunningWithReason_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerStateMachine:*(void *)(a1 + 32) didFinishRunningShortcutWithResult:*(void *)(a1 + 40)];
}

- (void)stopShortcutWithError:(id)a3 reason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFStateMachine *)self currentState];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v9 = objc_opt_new();
      [v9 setStage:5];
      if ((unint64_t)[v8 stage] > 1)
      {
        if ([v8 stage] != 2)
        {
          if ([v8 stage] == 3)
          {
            if ([(WFStateMachine *)self transitionToState:v9 withReason:v7])
            {
              v11 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegate];

              if (v11)
              {
                v12 = [(WFOutOfProcessWorkflowControllerStateMachine *)self delegateQueue];
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __77__WFOutOfProcessWorkflowControllerStateMachine_stopShortcutWithError_reason___block_invoke;
                block[3] = &unk_1E6079130;
                block[4] = self;
                id v15 = v6;
                dispatch_async(v12, block);
              }
            }
          }
          else if ((unint64_t)[v8 stage] >= 4)
          {
            id v13 = getWFVoiceShortcutClientLogObject();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              id v17 = "-[WFOutOfProcessWorkflowControllerStateMachine stopShortcutWithError:reason:]";
              __int16 v18 = 2048;
              uint64_t v19 = [v8 stage];
              _os_log_impl(&dword_1B3C5C000, v13, OS_LOG_TYPE_DEFAULT, "%s stop was requested, but we're ignoring it because the current stage (%lu) will already result in a stop.", buf, 0x16u);
            }
          }
          goto LABEL_8;
        }
        [(WFStateMachine *)self transitionToState:v9 withReason:v7];
        id v10 = [NSString stringWithFormat:@"stop was requested because %@, tearing down runner", v7];
        [(WFOutOfProcessWorkflowControllerStateMachine *)self tearDownRunnerWithReason:v10];
      }
      else
      {
        [(WFStateMachine *)self transitionToState:v9 withReason:v7];
        id v10 = [NSString stringWithFormat:@"stop was requested because %@, but we haven't yet acquired a runner, so just exiting", v7];
        [(WFOutOfProcessWorkflowControllerStateMachine *)self exitWithReason:v10];
      }

LABEL_8:
    }
  }
}

void __77__WFOutOfProcessWorkflowControllerStateMachine_stopShortcutWithError_reason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 controllerStateMachine:*(void *)(a1 + 32) didRequestStoppingShortcutWithError:*(void *)(a1 + 40)];
}

- (void)pauseAndWriteShortcutToDiskState
{
  id v3 = (id)objc_opt_new();
  [v3 setStage:4];
  [(WFStateMachine *)self transitionToState:v3 withReason:@"pause and write shortcut to disk requested"];
}

- (void)startRunningShortcutWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setStage:3];
  [(WFStateMachine *)self transitionToState:v5 withReason:v4];
}

- (void)acquiringRunnerWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setStage:2];
  [(WFStateMachine *)self transitionToState:v5 withReason:v4];
}

- (void)handlingRequestWithReason:(id)a3
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

- (BOOL)isFinishingShortcut
{
  id v2 = [(WFStateMachine *)self currentState];
  BOOL v3 = v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v2 stage] == 6;

  return v3;
}

- (BOOL)isRunningShortcut
{
  id v2 = [(WFStateMachine *)self currentState];
  BOOL v3 = v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v2 stage] == 3;

  return v3;
}

- (BOOL)blocksTransitionsOnInvalidation
{
  return 0;
}

- (WFOutOfProcessWorkflowControllerStateMachine)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFOutOfProcessWorkflowControllerStateMachine;
  id v2 = [(WFStateMachine *)&v8 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.shortcuts.WFOutOfProcessWorkflowControllerStateMachine.delegate-queue", v3);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v4;

    id v6 = v2;
  }

  return v2;
}

@end