@interface NRFConcurrentProcessing
- (NRFConcurrentProcessing)initWithContext:(id)a3 backgroundContext:(id)a4 doConcurrent:(BOOL)a5;
- (int)_forkBackgroundCommandQueue;
- (int)_joinBackgroundCommandQueue;
- (int)_signalBackgroundComplete;
- (int)startBackgroundTask:(id)a3;
- (int)waitForBackgroundTaskToComplete:(id)a3;
@end

@implementation NRFConcurrentProcessing

- (NRFConcurrentProcessing)initWithContext:(id)a3 backgroundContext:(id)a4 doConcurrent:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NRFConcurrentProcessing;
  v11 = [(NRFConcurrentProcessing *)&v22 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  if (!v9) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v11->_metal, a3);
  if (!v10) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v12->_backgroundContext, a4);
  v13 = [v9 device];
  uint64_t v14 = [v13 newSharedEvent];
  event = v12->_event;
  v12->_event = (MTLSharedEvent *)v14;

  if (!v12->_event
    || (v12->_eventValue = 0,
        v12->_backgroundSignalValue = 0,
        dispatch_queue_t v16 = dispatch_queue_create("ConcurrentProcessing", MEMORY[0x263EF83A8]),
        dispatchQueue = v12->_dispatchQueue,
        v12->_dispatchQueue = (OS_dispatch_queue *)v16,
        dispatchQueue,
        !v12->_dispatchQueue))
  {
LABEL_7:
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v12->_doConcurrent = a5;
  *(_WORD *)&v12->_didStartConcurrentProcessing = 0;
  v18 = v12;
  v12->_backgroundTaskErr = 0;
LABEL_9:
  v20 = v18;

  return v20;
}

- (int)_forkBackgroundCommandQueue
{
  ++self->_eventValue;
  v3 = [(FigMetalContext *)self->_backgroundContext commandQueue];
  v4 = [v3 commandBuffer];

  if (!v4) {
    goto LABEL_5;
  }
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"ConcurrentProcessing.background.wait.%lld", self->_eventValue);
  [v4 setLabel:v5];

  [v4 encodeWaitForEvent:self->_event value:self->_eventValue];
  [v4 commit];
  v6 = [(FigMetalContext *)self->_metal commandQueue];
  v7 = [v6 commandBuffer];

  if (v7)
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"ConcurrentProcessing.main.signal.%lld", self->_eventValue);
    [v7 setLabel:v8];

    [v7 encodeSignalEvent:self->_event value:self->_eventValue];
    [v7 commit];
    unint64_t v9 = self->_eventValue + 1;
    self->_eventValue = v9;
    self->_backgroundSignalValue = v9;
    self->_backgroundEncodedCompleteSignal = 0;

    int v10 = 0;
  }
  else
  {
LABEL_5:
    FigDebugAssert3();
    int v10 = FigSignalErrorAt();
  }

  return v10;
}

- (int)_signalBackgroundComplete
{
  v3 = [(FigMetalContext *)self->_backgroundContext commandQueue];
  v4 = [v3 commandBuffer];

  if (v4)
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"ConcurrentProcessing.background.signal.%lld", self->_backgroundSignalValue);
    [v4 setLabel:v5];

    [v4 encodeSignalEvent:self->_event value:self->_backgroundSignalValue];
    [v4 commit];
    int v6 = 0;
    self->_backgroundEncodedCompleteSignal = 1;
  }
  else
  {
    FigDebugAssert3();
    int v6 = FigSignalErrorAt();
  }

  return v6;
}

- (int)_joinBackgroundCommandQueue
{
  if (!self->_backgroundEncodedCompleteSignal) {
    return 0;
  }
  v3 = [(FigMetalContext *)self->_metal commandQueue];
  v4 = [v3 commandBuffer];

  if (v4)
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"ConcurrentProcessing.main.wait.%lld", self->_backgroundSignalValue);
    [v4 setLabel:v5];

    [v4 encodeWaitForEvent:self->_event value:self->_backgroundSignalValue];
    [v4 commit];
    int v6 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v6 = FigSignalErrorAt();
  }

  return v6;
}

- (int)startBackgroundTask:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  backgroundContext = self->_backgroundContext;
  if (backgroundContext
    && ([(FigMetalContext *)backgroundContext allocator],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6)
    && !self->_didStartConcurrentProcessing)
  {
    self->_backgroundTaskErr = 0;
    [(NRFConcurrentProcessing *)self _forkBackgroundCommandQueue];
    self->_didStartConcurrentProcessing = 1;
    if (self->_doConcurrent)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__NRFConcurrentProcessing_startBackgroundTask___block_invoke;
      block[3] = &unk_2655C81B0;
      block[4] = self;
      id v12 = v4;
      dispatch_async(dispatchQueue, block);

      int v8 = 0;
    }
    else
    {
      self->_backgroundTaskErr = [v4 processInBackground];
      [(NRFConcurrentProcessing *)self _signalBackgroundComplete];
      int v8 = [(NRFConcurrentProcessing *)self _joinBackgroundCommandQueue];
    }
  }
  else
  {
    int v14 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    int v8 = -73351;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v8;
}

uint64_t __47__NRFConcurrentProcessing_startBackgroundTask___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 60) = [*(id *)(a1 + 40) processInBackground];
  v2 = *(void **)(a1 + 32);

  return [v2 _signalBackgroundComplete];
}

- (int)waitForBackgroundTaskToComplete:(id)a3
{
  id v4 = a3;
  if (self->_doConcurrent)
  {
    if (!self->_didStartConcurrentProcessing)
    {
      unint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int v6 = -73351;
      goto LABEL_6;
    }
    dispatch_barrier_async_and_wait((dispatch_queue_t)self->_dispatchQueue, &__block_literal_global_12);
    int v5 = [(NRFConcurrentProcessing *)self _joinBackgroundCommandQueue];
    if (v5)
    {
      int v6 = v5;
      goto LABEL_6;
    }
  }
  int v6 = 0;
  self->_didStartConcurrentProcessing = 0;
  int backgroundTaskErr = self->_backgroundTaskErr;
  if (backgroundTaskErr)
  {
    FigDebugAssert3();
    int v6 = backgroundTaskErr;
  }
LABEL_6:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_backgroundContext, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end