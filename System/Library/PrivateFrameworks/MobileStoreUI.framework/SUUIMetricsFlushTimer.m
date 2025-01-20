@interface SUUIMetricsFlushTimer
+ (id)sharedTimer;
- (SUUIMetricsFlushTimer)init;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_cancelFlushTimer;
- (void)_performFlush;
- (void)addMetricsController:(id)a3;
- (void)dealloc;
- (void)reloadFlushInterval;
- (void)removeMetricsController:(id)a3;
@end

@implementation SUUIMetricsFlushTimer

- (SUUIMetricsFlushTimer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIMetricsFlushTimer;
  v2 = [(SUUIMetricsFlushTimer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:514 capacity:0];
    metricsControllers = v2->_metricsControllers;
    v2->_metricsControllers = (NSHashTable *)v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F83330] object:0];
    [v5 addObserver:v2 selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83330] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F833B8] object:0];
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }

  v5.receiver = self;
  v5.super_class = (Class)SUUIMetricsFlushTimer;
  [(SUUIMetricsFlushTimer *)&v5 dealloc];
}

+ (id)sharedTimer
{
  uint64_t v3 = (void *)sharedTimer_sTimer;
  if (!sharedTimer_sTimer)
  {
    id v4 = objc_alloc_init((Class)a1);
    objc_super v5 = (void *)sharedTimer_sTimer;
    sharedTimer_sTimer = (uint64_t)v4;

    uint64_t v3 = (void *)sharedTimer_sTimer;
  }
  return v3;
}

- (void)addMetricsController:(id)a3
{
  [(NSHashTable *)self->_metricsControllers addObject:a3];
  [(SUUIMetricsFlushTimer *)self reloadFlushInterval];
}

- (void)reloadFlushInterval
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(NSHashTable *)self->_metricsControllers count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v3 = self->_metricsControllers;
    uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      double v7 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) flushInterval];
          if (v7 < 1.0 || v9 < v7) {
            double v7 = v9;
          }
        }
        uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v5);

      if (v7 >= 1.0)
      {
        timer = self->_timer;
        if (timer)
        {
          dispatch_time_t v11 = dispatch_time(self->_timerStartTime, (uint64_t)(v7 * 1000000000.0));
          dispatch_source_set_timer(timer, v11, 0, 0);
        }
        else
        {
          v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
          v13 = self->_timer;
          self->_timer = v12;

          dispatch_time_t v14 = dispatch_walltime(0, 0);
          self->_timerStartTime = v14;
          v15 = self->_timer;
          dispatch_time_t v16 = dispatch_time(v14, (uint64_t)(v7 * 1000000000.0));
          dispatch_source_set_timer(v15, v16, 0, 0);
          objc_initWeak(&location, self);
          v17 = self->_timer;
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __44__SUUIMetricsFlushTimer_reloadFlushInterval__block_invoke;
          v18[3] = &unk_265401538;
          objc_copyWeak(&v19, &location);
          dispatch_source_set_event_handler(v17, v18);
          dispatch_resume((dispatch_object_t)self->_timer);
          objc_destroyWeak(&v19);
          objc_destroyWeak(&location);
        }
        return;
      }
    }
    else
    {
    }
    [(SUUIMetricsFlushTimer *)self _cancelFlushTimer];
    return;
  }
  [(SUUIMetricsFlushTimer *)self _cancelFlushTimer];
}

void __44__SUUIMetricsFlushTimer_reloadFlushInterval__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performFlush];
}

- (void)removeMetricsController:(id)a3
{
  id v4 = a3;
  if ([(NSHashTable *)self->_metricsControllers count] == 1
    && [(NSHashTable *)self->_metricsControllers containsObject:v4])
  {
    [v4 flushImmediately];
  }
  [(NSHashTable *)self->_metricsControllers removeObject:v4];
  [(SUUIMetricsFlushTimer *)self reloadFlushInterval];
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = [(NSHashTable *)self->_metricsControllers anyObject];
  [v4 flushImmediately];
  [(SUUIMetricsFlushTimer *)self _cancelFlushTimer];
}

- (void)_cancelFlushTimer
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)_performFlush
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_metricsControllers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "closeImpressionsSession", (void)v12);
          [v9 _waitUntilRecordingComplete];
        }
        else
        {
          id v6 = v9;
        }
      }
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  [v6 flushImmediately];
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    dispatch_time_t v11 = self->_timer;
    self->_timer = 0;
  }
  [(SUUIMetricsFlushTimer *)self reloadFlushInterval];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_metricsControllers, 0);
}

@end