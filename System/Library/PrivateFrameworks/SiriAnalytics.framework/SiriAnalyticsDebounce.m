@interface SiriAnalyticsDebounce
- (SiriAnalyticsDebounce)initWithDebounceInterval:(double)a3 maximumInterval:(double)a4 queue:(id)a5 delegate:(id)a6;
- (SiriAnalyticsDebounce)initWithDebounceInterval:(double)a3 queue:(id)a4 delegate:(id)a5;
- (void)_debounceFired;
- (void)_pulse;
- (void)_reset;
- (void)_timedOut;
- (void)cancel;
- (void)pulse;
@end

@implementation SiriAnalyticsDebounce

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumTimer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_reset
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v3 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    v9 = "-[SiriAnalyticsDebounce _reset]";
    _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v8, 0xCu);
  }
  debounceTimer = self->_debounceTimer;
  if (debounceTimer)
  {
    dispatch_source_cancel(debounceTimer);
    v5 = self->_debounceTimer;
    self->_debounceTimer = 0;
  }
  maximumTimer = self->_maximumTimer;
  if (maximumTimer)
  {
    dispatch_source_cancel(maximumTimer);
    v7 = self->_maximumTimer;
    self->_maximumTimer = 0;
  }
}

- (void)_timedOut
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v3 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[SiriAnalyticsDebounce _timedOut]";
    _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(SiriAnalyticsDebounce *)self _reset];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained debounceFired:self maximumReached:1];
}

- (void)_debounceFired
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v3 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    v6 = "-[SiriAnalyticsDebounce _debounceFired]";
    _os_log_debug_impl(&dword_1A2B39000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(SiriAnalyticsDebounce *)self _reset];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained debounceFired:self maximumReached:0];
}

- (void)_pulse
{
  objc_initWeak(&location, self);
  double debounceInterval = self->_debounceInterval;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __31__SiriAnalyticsDebounce__pulse__block_invoke;
  v13[3] = &unk_1E5AC05D8;
  objc_copyWeak(&v14, &location);
  SiriAnalyticsCreateFireOnceTimer(queue, v13, debounceInterval);
  int v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  debounceTimer = self->_debounceTimer;
  self->_debounceTimer = v5;

  dispatch_resume((dispatch_object_t)self->_debounceTimer);
  if (self->_hasMaximumInterval && !self->_maximumTimer)
  {
    double maximumInterval = self->_maximumInterval;
    int v8 = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__SiriAnalyticsDebounce__pulse__block_invoke_2;
    v11[3] = &unk_1E5AC05D8;
    objc_copyWeak(&v12, &location);
    SiriAnalyticsCreateFireOnceTimer(v8, v11, maximumInterval);
    v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    maximumTimer = self->_maximumTimer;
    self->_maximumTimer = v9;

    dispatch_resume((dispatch_object_t)self->_maximumTimer);
    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __31__SiriAnalyticsDebounce__pulse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _debounceFired];
}

void __31__SiriAnalyticsDebounce__pulse__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timedOut];
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SiriAnalyticsDebounce_cancel__block_invoke;
  block[3] = &unk_1E5AC05B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __31__SiriAnalyticsDebounce_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

- (void)pulse
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SiriAnalyticsDebounce_pulse__block_invoke;
  block[3] = &unk_1E5AC05B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__SiriAnalyticsDebounce_pulse__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pulse];
}

- (SiriAnalyticsDebounce)initWithDebounceInterval:(double)a3 maximumInterval:(double)a4 queue:(id)a5 delegate:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SiriAnalyticsDebounce;
  v13 = [(SiriAnalyticsDebounce *)&v16 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a5);
    v14->_double debounceInterval = a3;
    v14->_double maximumInterval = a4;
    v14->_hasMaximumInterval = 1;
    objc_storeWeak((id *)&v14->_delegate, v12);
  }

  return v14;
}

- (SiriAnalyticsDebounce)initWithDebounceInterval:(double)a3 queue:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SiriAnalyticsDebounce;
  id v11 = [(SiriAnalyticsDebounce *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    v12->_double debounceInterval = a3;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

@end