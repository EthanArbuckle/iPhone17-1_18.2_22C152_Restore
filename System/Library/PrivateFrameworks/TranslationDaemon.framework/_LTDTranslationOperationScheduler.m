@interface _LTDTranslationOperationScheduler
- (BOOL)shouldStartOperation:(id)a3;
- (_LTDTranslationOperationScheduler)initWithQueue:(id)a3;
- (double)offlineOperationTimeout;
- (id)scheduleOperationWithGroupID:(id)a3 route:(int64_t)a4 block:(id)a5;
- (void)cancelOperationsWithGroupID:(id)a3;
- (void)scheduleOperation:(id)a3 route:(int64_t)a4;
- (void)setOfflineOperationTimeout:(double)a3;
@end

@implementation _LTDTranslationOperationScheduler

- (_LTDTranslationOperationScheduler)initWithQueue:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LTDTranslationOperationScheduler;
  v5 = [(_LTDTranslationOperationScheduler *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    offlineEngineQueue = v5->_offlineEngineQueue;
    v5->_offlineEngineQueue = (NSOperationQueue *)v6;

    [(NSOperationQueue *)v5->_offlineEngineQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_offlineEngineQueue setQualityOfService:25];
    [(NSOperationQueue *)v5->_offlineEngineQueue setUnderlyingQueue:v4];
    v5->_offlineOperationTimeout = 90.0;
    uint64_t v8 = objc_opt_new();
    onlineEngineQueue = v5->_onlineEngineQueue;
    v5->_onlineEngineQueue = (NSOperationQueue *)v8;

    [(NSOperationQueue *)v5->_onlineEngineQueue setQualityOfService:25];
    [(NSOperationQueue *)v5->_onlineEngineQueue setUnderlyingQueue:v4];
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cancellationCache = v5->_cancellationCache;
    v5->_cancellationCache = v10;

    objc_initWeak(&location, v5);
    v12 = (void *)MEMORY[0x263EFFA20];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __51___LTDTranslationOperationScheduler_initWithQueue___block_invoke;
    v17[3] = &unk_265546D58;
    objc_copyWeak(&v18, &location);
    uint64_t v13 = [v12 scheduledTimerWithTimeInterval:1 repeats:v17 block:10.0];
    statusTimer = v5->_statusTimer;
    v5->_statusTimer = (NSTimer *)v13;

    v15 = v5;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)scheduleOperation:(id)a3 route:(int64_t)a4
{
  id v6 = a3;
  v7 = _LTOSLogTranslationEngine();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (a4 == 2)
  {
    if (v8) {
      -[_LTDTranslationOperationScheduler scheduleOperation:route:](v6, v7);
    }
    uint64_t v9 = 16;
  }
  else
  {
    if (v8) {
      -[_LTDTranslationOperationScheduler scheduleOperation:route:](v6, v7);
    }
    [v6 setOperationTimeout:self->_offlineOperationTimeout];
    uint64_t v9 = 8;
  }
  [*(id *)((char *)&self->super.isa + v9) addOperation:v6];
}

- (id)scheduleOperationWithGroupID:(id)a3 route:(int64_t)a4 block:(id)a5
{
  v7 = +[_LTDContinuationOperation continuationOperationWithGroupID:a3 delegate:self block:a5];
  [(_LTDTranslationOperationScheduler *)self scheduleOperation:v7 route:a4];
  return v7;
}

- (void)cancelOperationsWithGroupID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Client requested cancelling operations with groupID %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [(NSCache *)self->_cancellationCache setObject:MEMORY[0x263EFFA88] forKey:v4];
  }
}

- (BOOL)shouldStartOperation:(id)a3
{
  id v4 = [a3 groupID];
  if (v4)
  {
    v5 = [(NSCache *)self->_cancellationCache objectForKey:v4];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (double)offlineOperationTimeout
{
  return self->_offlineOperationTimeout;
}

- (void)setOfflineOperationTimeout:(double)a3
{
  self->_offlineOperationTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_cancellationCache, 0);
  objc_storeStrong((id *)&self->_onlineEngineQueue, 0);
  objc_storeStrong((id *)&self->_offlineEngineQueue, 0);
}

- (void)scheduleOperation:(void *)a1 route:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 groupID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_2600DC000, v5, v6, "Translation operation scheduled as concurrent: %p; groupID: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

- (void)scheduleOperation:(void *)a1 route:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 groupID];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_2600DC000, v5, v6, "Translation operation scheduled as serial: %p; groupID: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

@end