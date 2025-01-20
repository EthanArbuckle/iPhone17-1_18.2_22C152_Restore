@interface SiriAnalyticsTimePeriodBuffer
- (SiriAnalyticsTimePeriodBuffer)initWithInterval:(double)a3 queue:(id)a4;
- (void)_startProducing;
- (void)_stopProducing;
- (void)_timerElapsed;
- (void)enqueueMessages:(id)a3;
- (void)onMessagesProduced:(id)a3;
@end

@implementation SiriAnalyticsTimePeriodBuffer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onMessagesProduced, 0);
  objc_storeStrong((id *)&self->_bufferedMessages, 0);
  objc_storeStrong((id *)&self->_bufferTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)onMessagesProduced:(id)a3
{
  self->_onMessagesProduced = (id)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)enqueueMessages:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v5 = (void *)SiriAnalyticsLogContextStreaming;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_DEBUG))
  {
    v8 = v5;
    int v9 = 136315394;
    v10 = "-[SiriAnalyticsTimePeriodBuffer enqueueMessages:]";
    __int16 v11 = 2048;
    uint64_t v12 = [v4 count];
    _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Enqueueing %lu messages", (uint8_t *)&v9, 0x16u);
  }
  bufferedMessages = self->_bufferedMessages;
  v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  [(NSMutableSet *)bufferedMessages unionSet:v7];

  [(SiriAnalyticsTimePeriodBuffer *)self _startProducing];
}

- (void)_timerElapsed
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(SiriAnalyticsTimePeriodBuffer *)self _stopProducing];
  v3 = self->_bufferedMessages;
  id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  bufferedMessages = self->_bufferedMessages;
  self->_bufferedMessages = v4;

  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v6 = (void *)SiriAnalyticsLogContextStreaming;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_DEBUG))
  {
    int v9 = v6;
    int v10 = 136315394;
    __int16 v11 = "-[SiriAnalyticsTimePeriodBuffer _timerElapsed]";
    __int16 v12 = 2048;
    uint64_t v13 = [(NSMutableSet *)v3 count];
    _os_log_debug_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_DEBUG, "%s Producing %lu messages from buffer", (uint8_t *)&v10, 0x16u);
  }
  if ([(NSMutableSet *)v3 count])
  {
    onMessagesProduced = (void (**)(id, void *))self->_onMessagesProduced;
    if (onMessagesProduced)
    {
      v8 = [(NSMutableSet *)v3 allObjects];
      onMessagesProduced[2](onMessagesProduced, v8);
    }
  }
}

- (void)_stopProducing
{
  bufferTimer = self->_bufferTimer;
  if (bufferTimer)
  {
    dispatch_source_cancel(bufferTimer);
    id v4 = self->_bufferTimer;
    self->_bufferTimer = 0;
  }
}

- (void)_startProducing
{
  if (!self->_bufferTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    bufferTimer = self->_bufferTimer;
    self->_bufferTimer = v3;

    v5 = self->_bufferTimer;
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_bufferInterval * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_leeway * 1000000000.0));
    objc_initWeak(&location, self);
    v7 = self->_bufferTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__SiriAnalyticsTimePeriodBuffer__startProducing__block_invoke;
    v8[3] = &unk_1E5AC05D8;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_bufferTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __48__SiriAnalyticsTimePeriodBuffer__startProducing__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A623C920]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerElapsed];
}

- (SiriAnalyticsTimePeriodBuffer)initWithInterval:(double)a3 queue:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriAnalyticsTimePeriodBuffer;
  v8 = [(SiriAnalyticsTimePeriodBuffer *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_bufferInterval = a3;
    v9->_leeway = 1.0;
    int v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    bufferedMessages = v9->_bufferedMessages;
    v9->_bufferedMessages = v10;
  }
  return v9;
}

@end