@interface SASActivePresentationInstrumentationSender
- (BOOL)_canInstrumentForRequestState:(int64_t)a3;
- (NSMutableArray)queuedMesasges;
- (SASActivePresentationInstrumentationSender)initWithAnalyticsStream:(id)a3;
- (int64_t)aggregateRequestState;
- (void)_instrumentActivationMessage:(id)a3;
- (void)_requestStateDidChange:(int64_t)a3;
- (void)aggregatePresentationRequestStateDidChange:(int64_t)a3;
- (void)barrierWithCompletion:(id)a3;
- (void)instrumentActivationMessage:(id)a3;
- (void)setAggregateRequestState:(int64_t)a3;
- (void)setQueuedMesasges:(id)a3;
@end

@implementation SASActivePresentationInstrumentationSender

- (SASActivePresentationInstrumentationSender)initWithAnalyticsStream:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SASActivePresentationInstrumentationSender;
  v3 = [(SASActivationInstrumentationSender *)&v9 initWithAnalyticsStream:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.siri-activation.activePresentationSender", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    queuedMesasges = v3->_queuedMesasges;
    v3->_queuedMesasges = (NSMutableArray *)v6;
  }
  return v3;
}

- (void)instrumentActivationMessage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SASActivePresentationInstrumentationSender_instrumentActivationMessage___block_invoke;
  block[3] = &unk_1E6B676F8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __74__SASActivePresentationInstrumentationSender_instrumentActivationMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _instrumentActivationMessage:*(void *)(a1 + 32)];
}

- (void)aggregatePresentationRequestStateDidChange:(int64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SASActivePresentationInstrumentationSender_aggregatePresentationRequestStateDidChange___block_invoke;
  block[3] = &unk_1E6B675B0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __89__SASActivePresentationInstrumentationSender_aggregatePresentationRequestStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestStateDidChange:*(void *)(a1 + 40)];
}

- (void)barrierWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SASActivePresentationInstrumentationSender_barrierWithCompletion___block_invoke;
  block[3] = &unk_1E6B67BC8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __68__SASActivePresentationInstrumentationSender_barrierWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SASActivePresentationInstrumentationSender barrierWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_instrumentActivationMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SASActivePresentationInstrumentationSender *)self _canInstrumentForRequestState:self->_aggregateRequestState];
  uint64_t v6 = (NSObject **)MEMORY[0x1E4F4E360];
  v7 = *MEMORY[0x1E4F4E360];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SASActivePresentationInstrumentationSender _instrumentActivationMessage:]";
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Allowing message %@", buf, 0x16u);
    }
    v15.receiver = self;
    v15.super_class = (Class)SASActivePresentationInstrumentationSender;
    [(SASActivationInstrumentationSender *)&v15 instrumentActivationMessage:v4];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SASActivePresentationInstrumentationSender _instrumentActivationMessage:]";
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Buffering message %@", buf, 0x16u);
    }
    id v9 = [(NSMutableArray *)self->_queuedMesasges lastObject];
    v10 = [v9 activationEventIdentifier];
    v11 = [v4 activationEventIdentifier];
    if (v10 && ([v10 isEqual:v11] & 1) == 0)
    {
      v12 = *v6;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "-[SASActivePresentationInstrumentationSender _instrumentActivationMessage:]";
        __int16 v18 = 2112;
        id v19 = v10;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New activation interaction detected. Old %@, New %@", buf, 0x20u);
      }
      v13 = [MEMORY[0x1E4F1CA48] array];
      queuedMesasges = self->_queuedMesasges;
      self->_queuedMesasges = v13;
    }
    [(NSMutableArray *)self->_queuedMesasges addObject:v4];
  }
}

- (void)_requestStateDidChange:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    v7 = SASRequestStateGetName(a3);
    *(_DWORD *)buf = 136315394;
    v23 = "-[SASActivePresentationInstrumentationSender _requestStateDidChange:]";
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Request state did change %@", buf, 0x16u);
  }
  if ([(SASActivePresentationInstrumentationSender *)self _canInstrumentForRequestState:a3])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v8 = self->_queuedMesasges;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          v16.receiver = self;
          v16.super_class = (Class)SASActivePresentationInstrumentationSender;
          [(SASActivationInstrumentationSender *)&v16 instrumentActivationMessage:v13];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    v14 = [MEMORY[0x1E4F1CA48] array];
    queuedMesasges = self->_queuedMesasges;
    self->_queuedMesasges = v14;
  }
  self->_aggregateRequestState = a3;
}

- (BOOL)_canInstrumentForRequestState:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

- (int64_t)aggregateRequestState
{
  return self->_aggregateRequestState;
}

- (void)setAggregateRequestState:(int64_t)a3
{
  self->_aggregateRequestState = a3;
}

- (NSMutableArray)queuedMesasges
{
  return self->_queuedMesasges;
}

- (void)setQueuedMesasges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedMesasges, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end