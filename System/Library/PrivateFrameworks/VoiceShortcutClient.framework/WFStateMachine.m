@interface WFStateMachine
- (BOOL)blocksTransitionsOnInvalidation;
- (BOOL)isInvalidated;
- (BOOL)lock_prepareForInvalidation;
- (BOOL)silentlyDropInvalidTransitions;
- (BOOL)transitionToState:(id)a3 withReason:(id)a4;
- (NSArray)stateHistory;
- (NSMutableArray)mutableStateHistory;
- (OS_dispatch_queue)timerQueue;
- (OS_os_activity)activity;
- (WFDispatchSourceTimer)timer;
- (WFState)currentState;
- (WFStateMachine)init;
- (id)lock_printedStateHistory;
- (os_unfair_lock_s)transitionLock;
- (void)lock_addTransitionEventToHistoryWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5;
- (void)lock_cancelPendingTimers;
- (void)setBlocksTransitionsOnInvalidation:(BOOL)a3;
- (void)setCurrentState:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setSilentlyDropInvalidTransitions:(BOOL)a3;
- (void)setTimer:(id)a3;
@end

@implementation WFStateMachine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableStateHistory, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (NSMutableArray)mutableStateHistory
{
  return self->_mutableStateHistory;
}

- (void)setTimer:(id)a3
{
}

- (WFDispatchSourceTimer)timer
{
  return self->_timer;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (os_unfair_lock_s)transitionLock
{
  return self->_transitionLock;
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setSilentlyDropInvalidTransitions:(BOOL)a3
{
  self->_silentlyDropInvalidTransitions = a3;
}

- (BOOL)silentlyDropInvalidTransitions
{
  return self->_silentlyDropInvalidTransitions;
}

- (void)setBlocksTransitionsOnInvalidation:(BOOL)a3
{
  self->_blocksTransitionsOnInvalidation = a3;
}

- (BOOL)blocksTransitionsOnInvalidation
{
  return self->_blocksTransitionsOnInvalidation;
}

- (void)setCurrentState:(id)a3
{
}

- (WFState)currentState
{
  return (WFState *)objc_getProperty(self, a2, 16, 1);
}

- (id)lock_printedStateHistory
{
  os_unfair_lock_assert_owner(&self->_transitionLock);
  v3 = [(WFStateMachine *)self mutableStateHistory];
  v4 = [v3 componentsJoinedByString:@" -> "];

  return v4;
}

- (void)lock_addTransitionEventToHistoryWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5
{
  BOOL v5 = a5;
  p_transitionLock = &self->_transitionLock;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_assert_owner(p_transitionLock);
  id v12 = +[WFStateMachineTransitionEvent transitionEventWithState:v10 reason:v9 valid:v5];

  v11 = [(WFStateMachine *)self mutableStateHistory];
  [v11 addObject:v12];
}

- (void)lock_cancelPendingTimers
{
  os_unfair_lock_assert_owner(&self->_transitionLock);
  uint64_t v3 = [(WFStateMachine *)self timer];
  if (v3)
  {
    v4 = (void *)v3;
    BOOL v5 = [(WFStateMachine *)self timer];
    char v6 = [v5 isCancelled];

    if ((v6 & 1) == 0)
    {
      id v7 = [(WFStateMachine *)self timer];
      [v7 cancel];
    }
  }
}

- (BOOL)lock_prepareForInvalidation
{
  os_unfair_lock_assert_owner(&self->_transitionLock);
  [(WFStateMachine *)self lock_cancelPendingTimers];
  BOOL v3 = [(WFStateMachine *)self isInvalidated];
  if (!v3)
  {
    [(WFStateMachine *)self setInvalidated:1];
    if ([(WFStateMachine *)self blocksTransitionsOnInvalidation])
    {
      v4 = objc_opt_new();
      [(WFStateMachine *)self setCurrentState:v4];
    }
  }
  return !v3;
}

- (NSArray)stateHistory
{
  os_unfair_lock_lock(&self->_transitionLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__WFStateMachine_stateHistory__block_invoke;
  aBlock[3] = &unk_1E6078C68;
  aBlock[4] = self;
  BOOL v3 = (void (**)(void))_Block_copy(aBlock);
  v4 = [(WFStateMachine *)self mutableStateHistory];
  BOOL v5 = (void *)[v4 copy];

  v3[2](v3);
  return (NSArray *)v5;
}

void __30__WFStateMachine_stateHistory__block_invoke(uint64_t a1)
{
}

- (BOOL)transitionToState:(id)a3 withReason:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  p_transitionLock = &self->_transitionLock;
  os_unfair_lock_assert_not_owner(&self->_transitionLock);
  if (!v7)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFStateMachine.m", 99, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_29:
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"WFStateMachine.m", 100, @"Invalid parameter not satisfying: %@", @"transitionReason" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_29;
  }
LABEL_3:
  os_unfair_lock_lock(&self->_transitionLock);
  id v10 = [(WFStateMachine *)self currentState];
  v11 = v10;
  if (!v10 || ([v10 canTransitionToState:v7] & 1) != 0)
  {
    [(WFStateMachine *)self lock_addTransitionEventToHistoryWithState:v7 reason:v8 valid:1];
    [(WFStateMachine *)self lock_cancelPendingTimers];
    [(WFStateMachine *)self setCurrentState:v7];
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v12 = [(WFStateMachine *)self activity];
    os_activity_scope_enter(v12, &state);

    v13 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v40 = "-[WFStateMachine transitionToState:withReason:]";
      __int16 v41 = 2112;
      double v42 = *(double *)&v11;
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl(&dword_1B3C5C000, v13, OS_LOG_TYPE_DEFAULT, "%s Transitioning from %@ to %@, reason: %@", buf, 0x2Au);
    }

    id v14 = v7;
    v15 = v14;
    if (v7)
    {
      if ([v14 conformsToProtocol:&unk_1F0CD9798])
      {
        id v16 = v15;
        if (![v15 shouldStartTimer])
        {
LABEL_19:
          os_unfair_lock_unlock(p_transitionLock);
          if (objc_opt_respondsToSelector()) {
            [v15 performAction];
          }

          os_activity_scope_leave(&state);
          BOOL v30 = 1;
          goto LABEL_27;
        }
        [v15 timeoutDuration];
        double v18 = v17;
        v19 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[WFStateMachine transitionToState:withReason:]";
          __int16 v41 = 2048;
          double v42 = v18;
          _os_log_impl(&dword_1B3C5C000, v19, OS_LOG_TYPE_DEFAULT, "%s This is a timed state - setting timer with a timeout of %f seconds", buf, 0x16u);
        }

        v20 = [WFDispatchSourceTimer alloc];
        v21 = [(WFStateMachine *)self timerQueue];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __47__WFStateMachine_transitionToState_withReason___block_invoke;
        v36[3] = &unk_1E6078C68;
        id v16 = v15;
        id v37 = v16;
        uint64_t v22 = [(WFDispatchSourceTimer *)v20 initWithInterval:v21 queue:v36 handler:v18];
        timer = self->_timer;
        p_timer = (id *)&self->_timer;
        id *p_timer = (id)v22;

        [*p_timer start];
        v25 = v37;
      }
      else
      {
        id v16 = 0;
        v25 = v15;
      }
    }
    else
    {
      v25 = 0;
      id v16 = 0;
    }

    goto LABEL_19;
  }
  [(WFStateMachine *)self lock_addTransitionEventToHistoryWithState:v7 reason:v8 valid:0];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v26 = [(WFStateMachine *)self activity];
  os_activity_scope_enter(v26, &state);

  BOOL v27 = [(WFStateMachine *)self silentlyDropInvalidTransitions];
  v28 = getWFVoiceShortcutClientLogObject();
  v29 = v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v40 = "-[WFStateMachine transitionToState:withReason:]";
      __int16 v41 = 2112;
      double v42 = *(double *)&v11;
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl(&dword_1B3C5C000, v29, OS_LOG_TYPE_DEBUG, "%s Invalid transition from current state: %@ to new state: %@, reason: %@ (Silently dropping.)", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    v31 = [(WFStateMachine *)self lock_printedStateHistory];
    *(_DWORD *)buf = 136316162;
    v40 = "-[WFStateMachine transitionToState:withReason:]";
    __int16 v41 = 2112;
    double v42 = *(double *)&v11;
    __int16 v43 = 2112;
    id v44 = v7;
    __int16 v45 = 2112;
    id v46 = v8;
    __int16 v47 = 2112;
    v48 = v31;
    _os_log_impl(&dword_1B3C5C000, v29, OS_LOG_TYPE_FAULT, "%s Invalid transition from current state: %@ to new state: %@, reason: %@, events: %@", buf, 0x34u);
  }
  BOOL v32 = [(WFStateMachine *)self lock_prepareForInvalidation];
  os_unfair_lock_unlock(&self->_transitionLock);
  if (v32) {
    [(WFStateMachine *)self invalidate];
  }
  os_activity_scope_leave(&state);
  BOOL v30 = 0;
LABEL_27:

  return v30;
}

uint64_t __47__WFStateMachine_transitionToState_withReason___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    char v6 = "-[WFStateMachine transitionToState:withReason:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_DEFAULT, "%s State %@ hit a timeout, cancelling it", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 32) cancel];
}

- (WFStateMachine)init
{
  v12.receiver = self;
  v12.super_class = (Class)WFStateMachine;
  v2 = [(WFStateMachine *)&v12 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.shortcuts.WFStateMachine.timer", v3);
    timerQueue = v2->_timerQueue;
    v2->_timerQueue = (OS_dispatch_queue *)v4;

    v2->_transitionLock._os_unfair_lock_opaque = 0;
    os_activity_t v6 = _os_activity_create(&dword_1B3C5C000, "WFStateMachine", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v2->_activity;
    v2->_activity = (OS_os_activity *)v6;

    v2->_invalidated = 0;
    uint64_t v8 = objc_opt_new();
    mutableStateHistory = v2->_mutableStateHistory;
    v2->_mutableStateHistory = (NSMutableArray *)v8;

    *(_WORD *)&v2->_blocksTransitionsOnInvalidation = 1;
    id v10 = v2;
  }
  return v2;
}

@end