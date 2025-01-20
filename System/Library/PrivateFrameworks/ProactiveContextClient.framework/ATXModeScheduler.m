@interface ATXModeScheduler
- (ATXModeScheduler)initWithQueue:(id)a3 operationBlock:(id)a4 andLeeway:(double)a5;
- (id)runAfterDelaySecondsIfNotYetScheduled:(double)a3;
- (void)cancelPendingOperation;
@end

@implementation ATXModeScheduler

- (ATXModeScheduler)initWithQueue:(id)a3 operationBlock:(id)a4 andLeeway:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXModeScheduler;
  v11 = [(ATXModeScheduler *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    uint64_t v13 = MEMORY[0x1E0187570](v10);
    id block = v12->_block;
    v12->_id block = (id)v13;

    v12->_leewaySeconds = a5;
  }

  return v12;
}

- (id)runAfterDelaySecondsIfNotYetScheduled:(double)a3
{
  if (self->_timer)
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[ATXModeScheduler runAfterDelaySecondsIfNotYetScheduled:]((uint64_t)self, v4);
    }
  }
  else
  {
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v6;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, [MEMORY[0x1E4F93B18] dispatchTimeWithSecondsFromNow:a3], 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_leewaySeconds * 1000000000.0));
    objc_initWeak(&location, self);
    v8 = self->_timer;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    objc_super v16 = __58__ATXModeScheduler_runAfterDelaySecondsIfNotYetScheduled___block_invoke;
    v17 = &unk_1E6BE68A8;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v8, &v14);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", a3, v14, v15, v16, v17);
    id v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    scheduledDate = self->_scheduledDate;
    self->_scheduledDate = v9;

    v11 = __atxlog_handle_modes();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXModeScheduler runAfterDelaySecondsIfNotYetScheduled:](v11, a3);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  v12 = self->_scheduledDate;

  return v12;
}

void __58__ATXModeScheduler_runAfterDelaySecondsIfNotYetScheduled___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    (*(void (**)(void))(WeakRetained[3] + 16))();
    [v2 cancelPendingOperation];
    WeakRetained = v2;
  }
}

- (void)cancelPendingOperation
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

    scheduledDate = self->_scheduledDate;
    self->_scheduledDate = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)runAfterDelaySecondsIfNotYetScheduled:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[ATXModeScheduler runAfterDelaySecondsIfNotYetScheduled:]";
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_debug_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_DEBUG, "%s: schedule an operation with %.2lf seconds delay", (uint8_t *)&v2, 0x16u);
}

- (void)runAfterDelaySecondsIfNotYetScheduled:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 136315394;
  __int16 v4 = "-[ATXModeScheduler runAfterDelaySecondsIfNotYetScheduled:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_DEBUG, "%s: an operation has already been scheduled at %@. Skip this request.", (uint8_t *)&v3, 0x16u);
}

@end