@interface WFRemoteExecutionSession
- (IDSService)service;
- (NSString)idsIdentifier;
- (OS_dispatch_source)timeoutTimer;
- (WFRemoteExecutionRequest)request;
- (WFRemoteExecutionSession)initWithService:(id)a3;
- (WFRemoteExecutionSessionDelegate)delegate;
- (double)timeoutLimitInSeconds;
- (id)invalidAceCommandError;
- (id)sessionTimedOutError;
- (unint64_t)state;
- (void)cancelTimeout;
- (void)finish;
- (void)restartTimeout;
- (void)sendToDestinations:(id)a3 options:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setRequest:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation WFRemoteExecutionSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setRequest:(id)a3
{
}

- (WFRemoteExecutionRequest)request
{
  return self->_request;
}

- (void)setDelegate:(id)a3
{
}

- (WFRemoteExecutionSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRemoteExecutionSessionDelegate *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)invalidAceCommandError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v3 = WFLocalizedString(@"Unable to run action");
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:@"WFRemoteExecutionCoordinatorErrorDomain" code:2 userInfo:v4];

  return v5;
}

- (id)sessionTimedOutError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v3 = WFLocalizedString(@"Remote execution timed out");
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:@"WFRemoteExecutionCoordinatorErrorDomain" code:0 userInfo:v4];

  return v5;
}

- (void)cancelTimeout
{
  v3 = [(WFRemoteExecutionSession *)self timeoutTimer];

  if (v3)
  {
    v4 = [(WFRemoteExecutionSession *)self timeoutTimer];
    dispatch_source_cancel(v4);

    [(WFRemoteExecutionSession *)self setTimeoutTimer:0];
  }
}

- (void)restartTimeout
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(WFRemoteExecutionSession *)self cancelTimeout];
  v3 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    [(WFRemoteExecutionSession *)self timeoutLimitInSeconds];
    *(_DWORD *)buf = 136315650;
    v14 = "-[WFRemoteExecutionSession restartTimeout]";
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 2114;
    v18 = self;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Starting %f second timer for session %{public}@", buf, 0x20u);
  }

  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
  [(WFRemoteExecutionSession *)self setTimeoutTimer:v5];

  [(WFRemoteExecutionSession *)self timeoutLimitInSeconds];
  uint64_t v7 = (uint64_t)(v6 * 1000000000.0);
  v8 = [(WFRemoteExecutionSession *)self timeoutTimer];
  dispatch_time_t v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, v7, 0x3B9ACA00uLL);

  v10 = [(WFRemoteExecutionSession *)self timeoutTimer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__WFRemoteExecutionSession_restartTimeout__block_invoke;
  handler[3] = &unk_1E6558B28;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);

  v11 = [(WFRemoteExecutionSession *)self timeoutTimer];
  dispatch_activate(v11);
}

uint64_t __42__WFRemoteExecutionSession_restartTimeout__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) cancelTimeout];
  v2 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    [v3 timeoutLimitInSeconds];
    int v6 = 136315650;
    uint64_t v7 = "-[WFRemoteExecutionSession restartTimeout]_block_invoke";
    __int16 v8 = 2114;
    dispatch_time_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_INFO, "%s %{public}@ hit timeout (%f)", (uint8_t *)&v6, 0x20u);
  }

  return [*(id *)(a1 + 32) handleTimeout];
}

- (double)timeoutLimitInSeconds
{
  return 0.0;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_source_t v5 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t state = self->_state;
    int v7 = 136315650;
    __int16 v8 = "-[WFRemoteExecutionSession setState:]";
    __int16 v9 = 2048;
    unint64_t v10 = state;
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Transitioning from state %lu to %lu", (uint8_t *)&v7, 0x20u);
  }

  self->_unint64_t state = a3;
}

- (void)finish
{
  [(WFRemoteExecutionSession *)self cancelTimeout];
  v3 = [(WFRemoteExecutionSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFRemoteExecutionSession *)self delegate];
    [v5 sessionDidFinish:self];
  }
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2, self, @"WFRemoteExecutionSession.m", 37, @"Invalid parameter not satisfying: %@", @"destinations" object file lineNumber description];
  }
}

- (WFRemoteExecutionSession)initWithService:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFRemoteExecutionSession.m", 25, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteExecutionSession;
  id v7 = [(WFRemoteExecutionSession *)&v12 init];
  __int16 v8 = v7;
  if (v7)
  {
    v7->_unint64_t state = 0;
    objc_storeStrong((id *)&v7->_service, a3);
    __int16 v9 = v8;
  }

  return v8;
}

@end