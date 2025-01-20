@interface RMDebounceTimer
+ (id)debounceTimerWithMinimumInterval:(double)a3 maximumInterval:(double)a4 delegate:(id)a5 identifier:(id)a6;
- (NSString)identifier;
- (NSString)lastTimerID;
- (RMDebounceTimer)initWithMinimumInterval:(double)a3 maximumInterval:(double)a4 delegate:(id)a5 identifier:(id)a6;
- (RMDebounceTimerDelegate)delegate;
- (RMTimedDispatch)maximumTimer;
- (RMTimedDispatch)minimumTimer;
- (double)maximumInterval;
- (double)minimumInterval;
- (void)_timerDidFire;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setLastTimerID:(id)a3;
- (void)setMaximumInterval:(double)a3;
- (void)setMaximumTimer:(id)a3;
- (void)setMinimumInterval:(double)a3;
- (void)setMinimumTimer:(id)a3;
- (void)trigger;
@end

@implementation RMDebounceTimer

+ (id)debounceTimerWithMinimumInterval:(double)a3 maximumInterval:(double)a4 delegate:(id)a5 identifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = [[RMDebounceTimer alloc] initWithMinimumInterval:v10 maximumInterval:v9 delegate:a3 identifier:a4];

  return v11;
}

- (RMDebounceTimer)initWithMinimumInterval:(double)a3 maximumInterval:(double)a4 delegate:(id)a5 identifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)RMDebounceTimer;
  v12 = [(RMDebounceTimer *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    lock = v12->_lock;
    v12->_lock = v13;

    v12->_minimumInterval = a3;
    v12->_maximumInterval = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v12->_identifier, a6);
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(RMDebounceTimer *)self minimumTimer];

  if (v3)
  {
    v4 = [(RMDebounceTimer *)self minimumTimer];
    [v4 cancel];

    [(RMDebounceTimer *)self setMinimumTimer:0];
  }
  v5 = [(RMDebounceTimer *)self maximumTimer];

  if (v5)
  {
    v6 = [(RMDebounceTimer *)self maximumTimer];
    [v6 cancel];

    [(RMDebounceTimer *)self setMaximumTimer:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)RMDebounceTimer;
  [(RMDebounceTimer *)&v7 dealloc];
}

- (void)trigger
{
}

void __26__RMDebounceTimer_trigger__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) minimumTimer];

  if (v3)
  {
    v4 = +[RMLog debounceTimer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [*(id *)(a1 + 32) minimumTimer];
      v6 = [v5 timerID];
      __26__RMDebounceTimer_trigger__block_invoke_cold_2(v6, v17, v4, v5);
    }

    objc_super v7 = [*(id *)(a1 + 32) minimumTimer];
    v8 = [v7 timerID];
    [*(id *)(a1 + 32) setLastTimerID:v8];

    [*(id *)(a1 + 32) _timerDidFire];
  }
  else
  {
    id v9 = +[RMLog debounceTimer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __26__RMDebounceTimer_trigger__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_sync_exit(v2);
}

void __26__RMDebounceTimer_trigger__block_invoke_11(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) maximumTimer];

  if (v3)
  {
    v4 = +[RMLog debounceTimer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = [*(id *)(a1 + 32) maximumTimer];
      v6 = [v5 timerID];
      __26__RMDebounceTimer_trigger__block_invoke_11_cold_2(v6, v17, v4, v5);
    }

    objc_super v7 = [*(id *)(a1 + 32) maximumTimer];
    v8 = [v7 timerID];
    [*(id *)(a1 + 32) setLastTimerID:v8];

    [*(id *)(a1 + 32) _timerDidFire];
  }
  else
  {
    id v9 = +[RMLog debounceTimer];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __26__RMDebounceTimer_trigger__block_invoke_11_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_sync_exit(v2);
}

- (void)_timerDidFire
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = +[RMLog debounceTimer];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [(RMDebounceTimer *)self identifier];
    v5 = (void *)v4;
    v6 = @"unknown";
    if (v4) {
      v6 = (__CFString *)v4;
    }
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_224784000, v3, OS_LOG_TYPE_INFO, "Debounce fired for %{public}@", (uint8_t *)&v10, 0xCu);
  }
  objc_super v7 = [(RMDebounceTimer *)self minimumTimer];
  [v7 cancel];

  [(RMDebounceTimer *)self setMinimumTimer:0];
  v8 = [(RMDebounceTimer *)self maximumTimer];
  [v8 cancel];

  [(RMDebounceTimer *)self setMaximumTimer:0];
  id v9 = [(RMDebounceTimer *)self delegate];
  [v9 triggerAggregatingTimerAction];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)minimumInterval
{
  return self->_minimumInterval;
}

- (void)setMinimumInterval:(double)a3
{
  self->_minimumInterval = a3;
}

- (double)maximumInterval
{
  return self->_maximumInterval;
}

- (void)setMaximumInterval:(double)a3
{
  self->_maximumInterval = a3;
}

- (RMTimedDispatch)minimumTimer
{
  return (RMTimedDispatch *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMinimumTimer:(id)a3
{
}

- (RMTimedDispatch)maximumTimer
{
  return (RMTimedDispatch *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMaximumTimer:(id)a3
{
}

- (NSString)lastTimerID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastTimerID:(id)a3
{
}

- (RMDebounceTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMDebounceTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastTimerID, 0);
  objc_storeStrong((id *)&self->_maximumTimer, 0);
  objc_storeStrong((id *)&self->_minimumTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

void __26__RMDebounceTimer_trigger__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __26__RMDebounceTimer_trigger__block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_224784000, log, OS_LOG_TYPE_DEBUG, "Debounce execute minimum timer: %{public}@", buf, 0xCu);
}

void __26__RMDebounceTimer_trigger__block_invoke_11_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __26__RMDebounceTimer_trigger__block_invoke_11_cold_2(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_224784000, log, OS_LOG_TYPE_DEBUG, "Debounce execute maximum timer: %{public}@", buf, 0xCu);
}

@end