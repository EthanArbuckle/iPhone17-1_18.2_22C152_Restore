@interface SKUIMetricsFlushTimer
+ (id)sharedTimer;
- (SKUIMetricsFlushTimer)init;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_cancelFlushTimer;
- (void)_performFlush;
- (void)addMetricsController:(id)a3;
- (void)dealloc;
- (void)init;
- (void)reloadFlushInterval;
- (void)removeMetricsController:(id)a3;
@end

@implementation SKUIMetricsFlushTimer

- (SKUIMetricsFlushTimer)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMetricsFlushTimer init]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIMetricsFlushTimer;
  v3 = [(SKUIMetricsFlushTimer *)&v8 init];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:514 capacity:0];
    metricsControllers = v3->_metricsControllers;
    v3->_metricsControllers = (NSHashTable *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB2640] object:0];
    [v6 addObserver:v3 selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKUIMetricsFlushTimer;
  [(SKUIMetricsFlushTimer *)&v5 dealloc];
}

+ (id)sharedTimer
{
  v3 = (void *)sharedTimer_sTimer;
  if (!sharedTimer_sTimer)
  {
    id v4 = objc_alloc_init((Class)a1);
    objc_super v5 = (void *)sharedTimer_sTimer;
    sharedTimer_sTimer = (uint64_t)v4;

    v3 = (void *)sharedTimer_sTimer;
  }

  return v3;
}

- (void)addMetricsController:(id)a3
{
  [(NSHashTable *)self->_metricsControllers addObject:a3];

  [(SKUIMetricsFlushTimer *)self reloadFlushInterval];
}

- (void)reloadFlushInterval
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_metricsControllers count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v3 = self->_metricsControllers;
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
          v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
          v13 = self->_timer;
          self->_timer = v12;

          dispatch_time_t v14 = dispatch_walltime(0, 0);
          self->_timerStartTime = v14;
          v15 = self->_timer;
          dispatch_time_t v16 = dispatch_time(v14, (uint64_t)(v7 * 1000000000.0));
          dispatch_source_set_timer(v15, v16, 0, 0);
          objc_initWeak(&location, self);
          v17 = self->_timer;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __44__SKUIMetricsFlushTimer_reloadFlushInterval__block_invoke;
          v18[3] = &unk_1E6422250;
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
    [(SKUIMetricsFlushTimer *)self _cancelFlushTimer];
    return;
  }

  [(SKUIMetricsFlushTimer *)self _cancelFlushTimer];
}

void __44__SKUIMetricsFlushTimer_reloadFlushInterval__block_invoke(uint64_t a1)
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
  [(SKUIMetricsFlushTimer *)self reloadFlushInterval];
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = [(NSHashTable *)self->_metricsControllers anyObject];
  [v4 flushImmediately];
  [(SKUIMetricsFlushTimer *)self _cancelFlushTimer];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_metricsControllers;
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
  [(SKUIMetricsFlushTimer *)self reloadFlushInterval];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_metricsControllers, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMetricsFlushTimer init]";
}

@end