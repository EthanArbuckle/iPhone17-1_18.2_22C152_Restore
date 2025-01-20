@interface SPQueryResultsQueue
+ (id)findResultsQueueWithIdentifier:(id)a3;
+ (id)sharedInstanceDispatchQueue:(id)a3;
+ (id)sharedInstanceMaintenanceDispatchQueue:(id)a3;
+ (void)startTrackingResultsQueue:(id)a3;
+ (void)stopTrackingResultsQueueWithIdentifier:(id)a3;
- (BOOL)canceled;
- (BOOL)disableResultStreaming;
- (BOOL)hasPausedResults;
- (BOOL)live;
- (BOOL)shared;
- (BOOL)tracked;
- (NSMutableDictionary)jobs;
- (NSString)identifier;
- (OS_dispatch_queue)dispatchQueue;
- (SPQueryResultsQueue)initWithIdentifier:(id)a3 dispatchQueue:(id)a4;
- (__SIResultQueue)siResultsQueue;
- (int64_t)pausedCount;
- (void)_processResults;
- (void)_scheduleWakeupForced:(BOOL)a3;
- (void)_startTracking;
- (void)_stopTracking;
- (void)addJob:(id)a3;
- (void)cancel;
- (void)cancelJob:(id)a3;
- (void)dealloc;
- (void)pauseResults;
- (void)resumeResults;
- (void)resumeResultsIfSystemInGoodState;
- (void)setCanceled:(BOOL)a3;
- (void)setDisableResultStreaming:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setJobs:(id)a3;
- (void)setLive:(BOOL)a3;
- (void)setPausedCount:(int64_t)a3;
- (void)setShared:(BOOL)a3;
- (void)setSiResultsQueue:(__SIResultQueue *)a3;
- (void)setTracked:(BOOL)a3;
@end

@implementation SPQueryResultsQueue

- (__SIResultQueue)siResultsQueue
{
  return self->_siResultsQueue;
}

- (void)addJob:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 siJob];
  v5 = [MEMORY[0x263F08D40] valueWithPointer:v4];
  v6 = self->_jobs;
  objc_sync_enter(v6);
  [(NSMutableDictionary *)self->_jobs setObject:v7 forKey:v5];
  [v7 setResultsQueue:self];
  objc_sync_exit(v6);
}

void __38__SPQueryResultsQueue__processResults__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x223C480D0]();
  v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __38__SPQueryResultsQueue__processResults__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 12))
  {
    [*(id *)(a1 + 32) pauseResults];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v5 + 24))
  {
    if (*(unsigned char *)(v5 + 12)) {
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  char v6 = 0;
  *(void *)&long long v4 = 134217984;
  long long v22 = v4;
  do
  {
    uint64_t v7 = SIResultQueueDequeue();
    v8 = (unsigned int *)v7;
    if (!v7) {
      break;
    }
    v9 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(v7 + 8)];
    id v10 = *(id *)(*(void *)(a1 + 32) + 32);
    objc_sync_enter(v10);
    v11 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v9];
    objc_sync_exit(v10);

    if (v11)
    {
      uint64_t v12 = *v8;
      v13 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16);
        *(_DWORD *)buf = 134218242;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        uint64_t v26 = v17;
        _os_log_debug_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEBUG, "Processing results, kind:%ld, identifier:%@", buf, 0x16u);
      }

      uint64_t v14 = [v11 resultsHandler];
      v15 = (void (**)(void, void, void, void, void, void))v14;
      if (v14)
      {
        switch((int)v12)
        {
          case 1:
            v16 = logForCSLogCategoryQuery();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v21 = *((void *)v8 + 6);
              *(_DWORD *)buf = v22;
              uint64_t v24 = v21;
              _os_log_debug_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEBUG, "%ld items", buf, 0xCu);
            }

            ((void (**)(void, void *, void, void, void, void))v15)[2](v15, v11, 0, *((void *)v8 + 6), *((void *)v8 + 4), *((void *)v8 + 5));
            goto LABEL_34;
          case 2:
            (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 3, 0, 0, *((void *)v8 + 4));
            char v6 = 1;
            goto LABEL_23;
          case 3:
            (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 4, 0, 0, *((void *)v8 + 4));
            goto LABEL_34;
          case 4:
            goto LABEL_22;
          case 5:
            if (*(unsigned char *)(*(void *)(a1 + 32) + 10))
            {
              (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 2, 0, 0, 0);
              SIResultBatchFree();
            }
            else
            {
LABEL_22:
              (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 1, 0, 0, 0);
LABEL_23:
              SIResultBatchFree();
              [v11 setResultsHandler:0];
              id v18 = *(id *)(*(void *)(a1 + 32) + 32);
              objc_sync_enter(v18);
              [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v9];
              objc_sync_exit(v18);
            }
            goto LABEL_30;
          case 6:
            (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 5, *((void *)v8 + 4), 0, 0);
            goto LABEL_34;
          case 7:
            uint64_t v19 = (int)v8[14];
            if (v19 > 3) {
              uint64_t v20 = -1;
            }
            else {
              uint64_t v20 = qword_21F26AED8[v19];
            }
            (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, v20, *((void *)v8 + 6), *((void *)v8 + 4), *((void *)v8 + 5));
LABEL_34:
            SIResultBatchFree();
            break;
          case 9:
            (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 8, *((void *)v8 + 6), *((void *)v8 + 4), *((void *)v8 + 5));
            SIResultBatchFree();
            goto LABEL_30;
          case 10:
            (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 9, 0, 0, *((void *)v8 + 4));
            SIResultBatchFree();
            goto LABEL_30;
          case 11:
            (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v14 + 16))(v14, v11, 11, 0, 0, *((void *)v8 + 5));
            SIResultBatchFree();
            goto LABEL_30;
          default:
            goto LABEL_17;
        }
LABEL_35:
        if (*(unsigned char *)(*(void *)(a1 + 32) + 12))
        {

          char v6 = 1;
          break;
        }
        char v6 = 1;
      }
      else
      {
LABEL_17:
        SIResultBatchFree();
LABEL_30:
        if (v6) {
          goto LABEL_35;
        }
        char v6 = 0;
      }

      goto LABEL_38;
    }
    SIResultBatchFree();
LABEL_38:
  }
  while (*(void *)(*(void *)(a1 + 32) + 24));
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 12))
  {
LABEL_46:
    objc_msgSend((id)v5, "_scheduleWakeupForced:", 0, v22);
    goto LABEL_47;
  }
  if ((v6 & 1) == 0) {
LABEL_45:
  }
    objc_msgSend((id)v5, "resumeResults", v22);
LABEL_47:
}

- (void)_scheduleWakeupForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 || ![(SPQueryResultsQueue *)self hasPausedResults])
  {
    uint64_t v5 = self->_identifier;
    char v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = @"NO";
      BOOL canceled = self->_canceled;
      if (v3) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      if (canceled) {
        v8 = @"YES";
      }
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_debug_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEBUG, "Schedule wakeup, identifier:%@, forced:%@, canceled:%@", (uint8_t *)&v11, 0x20u);
    }

    uint64_t v7 = v5;
    if ((SIResultQueueSetWakeupTrigger() & 1) == 0) {
      CFRelease(v7);
    }
  }
}

+ (id)findResultsQueueWithIdentifier:(id)a3
{
  id v3 = a3;
  if (!sResultsQueueMap) {
    +[SPQueryResultsQueue findResultsQueueWithIdentifier:]();
  }
  long long v4 = v3;
  id v5 = (id)sResultsQueueMap;
  objc_sync_enter(v5);
  char v6 = [(id)sResultsQueueMap objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_processResults
{
  qos_class_self();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS _processResults 1: %d", v2, v3, v4, v5, 0);
}

- (BOOL)hasPausedResults
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_pausedCount > 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

+ (id)sharedInstanceDispatchQueue:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke;
  block[3] = &unk_2645063F8;
  id v9 = v3;
  uint64_t v4 = sharedInstanceDispatchQueue__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceDispatchQueue__onceToken, block);
  }
  id v6 = (id)sharedInstanceDispatchQueue__sSharedInstance;

  return v6;
}

- (SPQueryResultsQueue)initWithIdentifier:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SPQueryResultsQueue;
  id v9 = [(SPQueryResultsQueue *)&v21 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_dispatchQueue, a4);
    v10->_siResultsQueue = (__SIResultQueue *)SIResultQueueCreate();
    int v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    jobs = v10->_jobs;
    v10->_jobs = v11;

    [(SPQueryResultsQueue *)v10 _startTracking];
    [(SPQueryResultsQueue *)v10 _scheduleWakeupForced:1];
    __int16 v13 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SPQueryResultsQueue initWithIdentifier:dispatchQueue:]((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_startTracking
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL tracked = v2->_tracked;
  v2->_BOOL tracked = 1;
  objc_sync_exit(v2);

  if (!tracked)
  {
    +[SPQueryResultsQueue startTrackingResultsQueue:v2];
  }
}

+ (void)startTrackingResultsQueue:(id)a3
{
  id v3 = a3;
  id v6 = v3;
  if (startTrackingResultsQueue__onceToken != -1)
  {
    dispatch_once(&startTrackingResultsQueue__onceToken, &__block_literal_global_0);
    id v3 = v6;
  }
  uint64_t v4 = [v3 identifier];
  id v5 = (id)sResultsQueueMap;
  objc_sync_enter(v5);
  [(id)sResultsQueueMap setObject:v6 forKey:v4];
  objc_sync_exit(v5);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_stopTracking
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL tracked = v2->_tracked;
  v2->_BOOL tracked = 0;
  objc_sync_exit(v2);

  if (tracked)
  {
    identifier = v2->_identifier;
    +[SPQueryResultsQueue stopTrackingResultsQueueWithIdentifier:identifier];
  }
}

+ (void)stopTrackingResultsQueueWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!sResultsQueueMap) {
    +[SPQueryResultsQueue stopTrackingResultsQueueWithIdentifier:]();
  }
  id v3 = (id)sResultsQueueMap;
  objc_sync_enter(v3);
  [(id)sResultsQueueMap removeObjectForKey:v4];
  objc_sync_exit(v3);
}

- (void)setDisableResultStreaming:(BOOL)a3
{
  self->_disableResultStreaming = a3;
}

- (void)resumeResults
{
  OUTLINED_FUNCTION_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Resumed results, identifier:%@, count:%ld");
}

- (void)pauseResults
{
  OUTLINED_FUNCTION_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Paused results, identifier:%@, count:%ld");
}

- (void)cancel
{
  if (!self->_shared)
  {
    uint64_t v2 = self;
    objc_sync_enter(v2);
    BOOL canceled = v2->_canceled;
    v2->_BOOL canceled = 1;
    objc_sync_exit(v2);

    if (!canceled)
    {
      dispatchQueue = v2->_dispatchQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__SPQueryResultsQueue_cancel__block_invoke;
      block[3] = &unk_2645063F8;
      void block[4] = v2;
      dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(dispatchQueue, v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __29__SPQueryResultsQueue_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C480D0]();
  id v3 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __29__SPQueryResultsQueue_cancel__block_invoke_cold_1();
  }

  SIResultQueueCancel();
  [*(id *)(a1 + 32) _scheduleWakeupForced:1];
}

- (void)dealloc
{
}

void __36__SPQueryResultsQueue_resumeResults__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C480D0]();
  [*(id *)(a1 + 32) _scheduleWakeupForced:1];
}

+ (id)sharedInstanceMaintenanceDispatchQueue:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke;
  block[3] = &unk_2645063F8;
  id v9 = v3;
  uint64_t v4 = sharedInstanceMaintenanceDispatchQueue__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceMaintenanceDispatchQueue__onceToken, block);
  }
  id v6 = (id)sharedInstanceMaintenanceDispatchQueue__sSharedInstance;

  return v6;
}

uint64_t __49__SPQueryResultsQueue_startTrackingResultsQueue___block_invoke()
{
  sResultsQueueMap = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  return MEMORY[0x270F9A758]();
}

void __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke_cold_1();
  }
  os_log_t v1 = [[SPQueryResultsQueue alloc] initWithIdentifier:@"com.apple.spotlight.queryResults.default" dispatchQueue:*(void *)(a1 + 32)];
  [(SPQueryResultsQueue *)v1 setShared:1];
  uint64_t v2 = (void *)sharedInstanceDispatchQueue__sSharedInstance;
  sharedInstanceDispatchQueue__sSharedInstance = (uint64_t)v1;
}

void __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke_cold_1();
  }
  os_log_t v1 = [[SPQueryResultsQueue alloc] initWithIdentifier:@"com.apple.spotlight.queryResults.maintenance" dispatchQueue:*(void *)(a1 + 32)];
  [(SPQueryResultsQueue *)v1 setShared:1];
  uint64_t v2 = (void *)sharedInstanceMaintenanceDispatchQueue__sSharedInstance;
  sharedInstanceMaintenanceDispatchQueue__sSharedInstance = (uint64_t)v1;
}

- (void)cancelJob:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", objc_msgSend(v4, "siJob"));
    id v7 = self->_jobs;
    objc_sync_enter(v7);
    id v8 = [(NSMutableDictionary *)self->_jobs objectForKey:v6];
    [(NSMutableDictionary *)self->_jobs removeObjectForKey:v6];
    objc_sync_exit(v7);

    if (v8)
    {
      id v9 = [v8 resultsHandler];
      if (v9)
      {
        [v8 setResultsHandler:0];
        dispatchQueue = self->_dispatchQueue;
        uint64_t v13 = MEMORY[0x263EF8330];
        uint64_t v14 = 3221225472;
        uint64_t v15 = __33__SPQueryResultsQueue_cancelJob___block_invoke;
        uint64_t v16 = &unk_264506440;
        id v18 = v9;
        id v17 = v8;
        dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v13);
        dispatch_async(dispatchQueue, v11);
      }
      if (objc_msgSend(v8, "siJob", v13, v14, v15, v16))
      {
        uint64_t v12 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[SPQueryResultsQueue cancelJob:](v8, v12);
        }

        [v8 siJob];
        SICancel();
        [v8 setSiJob:0];
      }
    }
  }
}

void __33__SPQueryResultsQueue_cancelJob___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C480D0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resumeResultsIfSystemInGoodState
{
  id v3 = [MEMORY[0x263F3AFE0] sharedInstance];
  char v4 = [v3 allowsDiscretionaryWorkForTask:@"indexing" withPriority:*MEMORY[0x263F3B050] withParameters:0];

  if (v4)
  {
    [(SPQueryResultsQueue *)self resumeResults];
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0, 60000000000);
    dispatchQueue = self->_dispatchQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__SPQueryResultsQueue_resumeResultsIfSystemInGoodState__block_invoke;
    v7[3] = &unk_264506468;
    objc_copyWeak(&v8, &location);
    dispatch_after(v5, dispatchQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__SPQueryResultsQueue_resumeResultsIfSystemInGoodState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resumeResults];
}

- (void)setIdentifier:(id)a3
{
}

- (void)setSiResultsQueue:(__SIResultQueue *)a3
{
  self->_siResultsQueue = a3;
}

- (NSMutableDictionary)jobs
{
  return self->_jobs;
}

- (void)setJobs:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (int64_t)pausedCount
{
  return self->_pausedCount;
}

- (void)setPausedCount:(int64_t)a3
{
  self->_pausedCount = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_BOOL canceled = a3;
}

- (BOOL)tracked
{
  return self->_tracked;
}

- (void)setTracked:(BOOL)a3
{
  self->_BOOL tracked = a3;
}

- (BOOL)live
{
  return self->_live;
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)disableResultStreaming
{
  return self->_disableResultStreaming;
}

+ (void)stopTrackingResultsQueueWithIdentifier:.cold.1()
{
}

+ (void)findResultsQueueWithIdentifier:.cold.1()
{
}

void __51__SPQueryResultsQueue_sharedInstanceDispatchQueue___block_invoke_cold_1()
{
}

void __62__SPQueryResultsQueue_sharedInstanceMaintenanceDispatchQueue___block_invoke_cold_1()
{
}

- (void)initWithIdentifier:(uint64_t)a3 dispatchQueue:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cancelJob:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 67109376;
  v4[1] = qos_class_self();
  __int16 v5 = 2048;
  uint64_t v6 = [a1 siJob];
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "Canceling query in results queue at QoS: %d for job id:%p", (uint8_t *)v4, 0x12u);
}

void __29__SPQueryResultsQueue_cancel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Canceling query results queue, identifier:%@", v2, v3, v4, v5, v6);
}

void __38__SPQueryResultsQueue__processResults__block_invoke_cold_1()
{
  qos_class_self();
  OUTLINED_FUNCTION_5(&dword_21F1CE000, v0, v1, "QOS _processResults 2: %d", v2, v3, v4, v5, 0);
}

@end