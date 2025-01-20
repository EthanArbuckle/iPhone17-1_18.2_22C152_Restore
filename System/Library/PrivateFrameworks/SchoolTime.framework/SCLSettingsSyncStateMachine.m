@interface SCLSettingsSyncStateMachine
- (BOOL)_isRelevantMessage:(id)a3;
- (SCLSettingsSyncContext)context;
- (SCLSettingsSyncErrorHandler)errorHandler;
- (SCLSettingsSyncState)currentState;
- (SCLSettingsSyncState)failedState;
- (SCLSettingsSyncState)pendingSendState;
- (SCLSettingsSyncState)sendingState;
- (SCLSettingsSyncState)sentState;
- (SCLSettingsSyncState)syncedState;
- (SCLSettingsSyncStateMachine)init;
- (SCLSettingsSyncStateMachine)initWithContext:(id)a3;
- (SCLSettingsSyncStateMachineDelegate)delegate;
- (void)activate;
- (void)cancelCommitTimer;
- (void)cancelRetryActivity;
- (void)commitSettings;
- (void)didEnqueueMessage:(id)a3;
- (void)enqueueFailedWithError:(id)a3;
- (void)message:(id)a3 didFailToAcknowledgeWithError:(id)a4;
- (void)message:(id)a3 failedWithError:(id)a4;
- (void)messageDidSend:(id)a3;
- (void)messageWasDelivered:(id)a3;
- (void)performSync;
- (void)scheduleCommitTimerWithInterval:(double)a3;
- (void)scheduleRetryWithActivityCriteria:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)settingsDidChange;
- (void)significantUserInteractionOccurred;
- (void)transitionToState:(id)a3;
- (void)xpcActivityStarted;
@end

@implementation SCLSettingsSyncStateMachine

- (SCLSettingsSyncStateMachine)init
{
  return [(SCLSettingsSyncStateMachine *)self initWithContext:0];
}

- (SCLSettingsSyncStateMachine)initWithContext:(id)a3
{
  v4 = (SCLSettingsSyncContext *)a3;
  v19.receiver = self;
  v19.super_class = (Class)SCLSettingsSyncStateMachine;
  v5 = [(SCLSettingsSyncStateMachine *)&v19 init];
  if (v5)
  {
    if (!v4)
    {
      v4 = objc_alloc_init(SCLSettingsSyncContext);
      [(SCLSettingsSyncContext *)v4 setSyncStatus:0];
    }
    objc_storeStrong((id *)&v5->_context, v4);
    v6 = [[SCLSettingsSyncStateSynced alloc] initWithStateMachine:v5];
    syncedState = v5->_syncedState;
    v5->_syncedState = &v6->super;

    v8 = [[SCLSettingsSyncStatePendingSend alloc] initWithStateMachine:v5];
    pendingSendState = v5->_pendingSendState;
    v5->_pendingSendState = &v8->super;

    v10 = [[SCLSettingsSyncStateSending alloc] initWithStateMachine:v5];
    sendingState = v5->_sendingState;
    v5->_sendingState = &v10->super;

    v12 = [[SCLSettingsSyncStateSent alloc] initWithStateMachine:v5];
    sentState = v5->_sentState;
    v5->_sentState = &v12->super;

    v14 = [[SCLSettingsSyncStateFailed alloc] initWithStateMachine:v5];
    failedState = v5->_failedState;
    v5->_failedState = &v14->super;

    v16 = objc_alloc_init(SCLSettingsSyncErrorHandler);
    errorHandler = v5->_errorHandler;
    v5->_errorHandler = v16;
  }
  return v5;
}

- (void)activate
{
  v3 = [(SCLSettingsSyncStateMachine *)self context];
  uint64_t v4 = [v3 syncStatus];

  switch(v4)
  {
    case 0:
      uint64_t v5 = [(SCLSettingsSyncStateMachine *)self syncedState];
      goto LABEL_8;
    case 1:
      uint64_t v5 = [(SCLSettingsSyncStateMachine *)self pendingSendState];
      goto LABEL_8;
    case 2:
      uint64_t v5 = [(SCLSettingsSyncStateMachine *)self sendingState];
      goto LABEL_8;
    case 3:
      uint64_t v5 = [(SCLSettingsSyncStateMachine *)self sentState];
      goto LABEL_8;
    case 4:
      uint64_t v5 = [(SCLSettingsSyncStateMachine *)self failedState];
LABEL_8:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }
  id v7 = v6;
  [(SCLSettingsSyncStateMachine *)self transitionToState:v6];
}

- (void)settingsDidChange
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = scl_transport_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(SCLSettingsSyncStateMachine *)self currentState];
  [v6 settingsDidChange];
}

- (void)commitSettings
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = scl_transport_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(SCLSettingsSyncStateMachine *)self currentState];
  [v6 commitSettings];
}

- (void)significantUserInteractionOccurred
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = scl_transport_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(SCLSettingsSyncStateMachine *)self currentState];
  [v6 significantUserInteractionOccurred];
}

- (void)xpcActivityStarted
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = scl_transport_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [(SCLSettingsSyncStateMachine *)self currentState];
  [v6 xpcActivityStarted];
}

- (void)enqueueFailedWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = scl_transport_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }
  v8 = [(SCLSettingsSyncStateMachine *)self currentState];
  [v8 enqueueFailedWithError:v5];
}

- (void)didEnqueueMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = scl_transport_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSStringFromSelector(a2);
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }
  v8 = [(SCLSettingsSyncStateMachine *)self currentState];
  [v8 didEnqueueMessage:v5];
}

- (void)message:(id)a3 failedWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([(SCLSettingsSyncStateMachine *)self _isRelevantMessage:v7])
  {
    int v9 = scl_transport_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(a2);
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_22B7B4000, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = [(SCLSettingsSyncStateMachine *)self currentState];
    [v11 message:v7 failedWithError:v8];
  }
}

- (void)messageDidSend:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(SCLSettingsSyncStateMachine *)self _isRelevantMessage:v5])
  {
    v6 = scl_transport_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(a2);
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(SCLSettingsSyncStateMachine *)self currentState];
    [v8 messageDidSend:v5];
  }
}

- (void)messageWasDelivered:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(SCLSettingsSyncStateMachine *)self _isRelevantMessage:v5])
  {
    v6 = scl_transport_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(a2);
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(SCLSettingsSyncStateMachine *)self currentState];
    [v8 messageWasDelivered:v5];
  }
}

- (void)message:(id)a3 didFailToAcknowledgeWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([(SCLSettingsSyncStateMachine *)self _isRelevantMessage:v7])
  {
    int v9 = scl_transport_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(a2);
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_22B7B4000, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = [(SCLSettingsSyncStateMachine *)self currentState];
    [v11 message:v7 didFailToAcknowledgeWithError:v8];
  }
}

- (BOOL)_isRelevantMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSettingsSyncStateMachine *)self context];
  v6 = [v5 messageIdentifier];
  char v7 = [v6 isEqual:v4];

  return v7;
}

- (void)performSync
{
  id v3 = [(SCLSettingsSyncStateMachine *)self delegate];
  [v3 performSyncForStateMachine:self];
}

- (void)scheduleRetryWithActivityCriteria:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSettingsSyncStateMachine *)self delegate];
  [v5 stateMachine:self scheduleRetryWithActivityCriteria:v4];
}

- (void)cancelRetryActivity
{
  id v3 = [(SCLSettingsSyncStateMachine *)self delegate];
  [v3 cancelRetryActivityForStateMachine:self];
}

- (void)scheduleCommitTimerWithInterval:(double)a3
{
  id v5 = [(SCLSettingsSyncStateMachine *)self delegate];
  [v5 stateMachine:self scheduleCommitTimerWithInterval:a3];
}

- (void)cancelCommitTimer
{
  id v3 = [(SCLSettingsSyncStateMachine *)self delegate];
  [v3 cancelCommitTimerForStateMachine:self];
}

- (void)transitionToState:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(SCLSettingsSyncStateMachine *)self currentState];
  [v6 willExitWithNextState:v5];
  objc_storeStrong((id *)&self->_currentState, a3);
  char v7 = [(SCLSettingsSyncStateMachine *)self context];
  objc_msgSend(v7, "setSyncStatus:", objc_msgSend(v5, "status"));

  [v5 didEnterWithPreviousState:v6];
  id v8 = scl_transport_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_22B7B4000, v8, OS_LOG_TYPE_DEFAULT, "Transition from state %@ to state: %@", (uint8_t *)&v10, 0x16u);
  }

  int v9 = [(SCLSettingsSyncStateMachine *)self delegate];
  [v9 stateMachine:self didTransitionFromState:v6 toState:v5];
}

- (SCLSettingsSyncStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCLSettingsSyncStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCLSettingsSyncContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (SCLSettingsSyncErrorHandler)errorHandler
{
  return self->_errorHandler;
}

- (SCLSettingsSyncState)currentState
{
  return self->_currentState;
}

- (SCLSettingsSyncState)syncedState
{
  return self->_syncedState;
}

- (SCLSettingsSyncState)pendingSendState
{
  return self->_pendingSendState;
}

- (SCLSettingsSyncState)sendingState
{
  return self->_sendingState;
}

- (SCLSettingsSyncState)sentState
{
  return self->_sentState;
}

- (SCLSettingsSyncState)failedState
{
  return self->_failedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedState, 0);
  objc_storeStrong((id *)&self->_sentState, 0);
  objc_storeStrong((id *)&self->_sendingState, 0);
  objc_storeStrong((id *)&self->_pendingSendState, 0);
  objc_storeStrong((id *)&self->_syncedState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end