@interface PAAggregateVisibilityStateMonitorHandle
- (PAAggregateVisibilityStateMonitorHandle)initWithStartupInterval:(double)a3 onQueue:(id)a4 delegate:(id)a5;
- (void)bindToRawHandle:(id)a3;
- (void)invalidate;
- (void)recomputeCurrentState;
- (void)setVisibilityState:(int64_t)a3 forBundleID:(id)a4;
- (void)startupIntervalExpired;
@end

@implementation PAAggregateVisibilityStateMonitorHandle

- (PAAggregateVisibilityStateMonitorHandle)initWithStartupInterval:(double)a3 onQueue:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PAAggregateVisibilityStateMonitorHandle;
  v11 = [(PAAggregateVisibilityStateMonitorHandle *)&v24 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    states = v11->_states;
    v11->_states = (NSMutableDictionary *)v12;

    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_queue, a4);
    v11->_currentState = 0;
    if (a3 <= 0.0)
    {
      v11->_startupPeriodElapsed = 1;
    }
    else
    {
      objc_initWeak(&location, v11);
      dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v11->_queue);
      startupTimer = v11->_startupTimer;
      v11->_startupTimer = (OS_dispatch_source *)v14;

      v16 = v11->_startupTimer;
      dispatch_time_t v17 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a3 * 1000000000.0) >> 2);
      v18 = v11->_startupTimer;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __84__PAAggregateVisibilityStateMonitorHandle_initWithStartupInterval_onQueue_delegate___block_invoke;
      v21[3] = &unk_1E5D70E00;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v18, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v19 = v11;
  }

  return v11;
}

void __84__PAAggregateVisibilityStateMonitorHandle_initWithStartupInterval_onQueue_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startupIntervalExpired];
}

- (void)bindToRawHandle:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_rawHandle, a3);
  startupTimer = self->_startupTimer;
  if (startupTimer) {
    dispatch_activate(startupTimer);
  }
}

- (void)startupIntervalExpired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_source_cancel((dispatch_source_t)self->_startupTimer);
  startupTimer = self->_startupTimer;
  self->_startupTimer = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setVisibilityState:self->_currentState];

  self->_startupPeriodElapsed = 1;

  [(PAAggregateVisibilityStateMonitorHandle *)self recomputeCurrentState];
}

- (void)setVisibilityState:(int64_t)a3 forBundleID:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2(queue);
  v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)self->_states setObject:v8 forKeyedSubscript:v7];

  [(PAAggregateVisibilityStateMonitorHandle *)self recomputeCurrentState];
}

- (void)recomputeCurrentState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t currentState = self->_currentState;
  v4 = self->_states;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_states, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        uint64_t v11 = [v10 integerValue];
        if (v11 > v7) {
          int64_t v7 = v11;
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  if (self->_startupPeriodElapsed)
  {
    self->_int64_t currentState = v7;
    if (currentState != v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained setVisibilityState:v7];
    }
  }
  else if (v7 > currentState)
  {
    self->_int64_t currentState = v7;
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  startupTimer = self->_startupTimer;
  if (startupTimer)
  {
    dispatch_source_cancel(startupTimer);
    v4 = self->_startupTimer;
    self->_startupTimer = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  states = self->_states;
  self->_states = 0;

  [(PAProcessStateMonitoringEnding *)self->_rawHandle invalidate];
  rawHandle = self->_rawHandle;
  self->_rawHandle = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_startupTimer, 0);
}

@end