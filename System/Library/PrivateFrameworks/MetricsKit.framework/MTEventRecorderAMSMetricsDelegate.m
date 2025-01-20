@interface MTEventRecorderAMSMetricsDelegate
+ (id)amsMetricsObjectCache;
- (AMSBagProtocol)amsBag;
- (AMSPromise)metricsBagPromise;
- (BOOL)isFlushTimerEnabled;
- (BOOL)isTransactionEnabled;
- (BOOL)monitorsLifecycleEvents;
- (BOOL)personalizedWithItunesAccount;
- (MTEventRecorderAMSMetricsDelegate)initWithContainerId:(id)a3 amsBag:(id)a4;
- (MTEventRecorderAMSMetricsDelegate)initWithContainerId:(id)a3 profileName:(id)a4 profileVersion:(id)a5;
- (NSMutableDictionary)amsMetricsByTopic;
- (NSMutableDictionary)periodicQueuesByTopic;
- (NSString)containerId;
- (OS_os_transaction)transaction;
- (double)flushTimeInterval;
- (id)_recordEvent:(id)a3 toTopic:(id)a4;
- (id)_sortedEventsFromBatch:(id)a3;
- (id)activeItunesAccount;
- (id)amsContainerIdForTopic:(id)a3;
- (id)amsMetricsForTopic:(id)a3;
- (id)flushUnreportedEvents;
- (id)lookupItunesAccount:(id)a3;
- (id)periodicQueueForTopic:(id)a3;
- (id)recordEvent:(id)a3 toTopic:(id)a4;
- (id)sendMethod;
- (int64_t)flushMode;
- (int64_t)maximumBatchSize;
- (int64_t)numberOfPendingEvents;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)_flushEvents:(id)a3 topic:(id)a4;
- (void)setAmsBag:(id)a3;
- (void)setAmsMetricsByTopic:(id)a3;
- (void)setContainerId:(id)a3;
- (void)setFlushMode:(int64_t)a3;
- (void)setFlushTimeInterval:(double)a3;
- (void)setFlushTimerEnabled:(BOOL)a3;
- (void)setMaximumBatchSize:(int64_t)a3;
- (void)setMetricsBagPromise:(id)a3;
- (void)setMonitorsLifecycleEvents:(BOOL)a3;
- (void)setNumberOfPendingEvents:(int64_t)a3;
- (void)setPeriodicQueuesByTopic:(id)a3;
- (void)setPersonalizedWithItunesAccount:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionEnabled:(BOOL)a3;
@end

@implementation MTEventRecorderAMSMetricsDelegate

- (MTEventRecorderAMSMetricsDelegate)initWithContainerId:(id)a3 amsBag:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [(MTEventRecorderAMSMetricsDelegate *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerId, a3);
    *(_DWORD *)&v10->_monitorsLifecycleEvents = 16843009;
    v10->_flushTimeInterval = 60.0;
    v10->_maximumBatchSize = 500;
    v11 = [v8 dictionaryForKey:@"metrics"];
    uint64_t v12 = [v11 valuePromise];
    metricsBagPromise = v10->_metricsBagPromise;
    v10->_metricsBagPromise = (AMSPromise *)v12;

    objc_initWeak(&location, v10);
    v14 = v10->_metricsBagPromise;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __64__MTEventRecorderAMSMetricsDelegate_initWithContainerId_amsBag___block_invoke;
    v25 = &unk_26430F430;
    objc_copyWeak(&v26, &location);
    [(AMSPromise *)v14 addFinishBlock:&v22];
    objc_storeStrong((id *)&v10->_amsBag, a4);
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", 1, v22, v23, v24, v25);
    amsMetricsByTopic = v10->_amsMetricsByTopic;
    v10->_amsMetricsByTopic = (NSMutableDictionary *)v15;

    [MEMORY[0x263F27B38] registerBagKeySetForMetricsRecorder:v8];
    v17 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = (id)objc_opt_class();
      v19 = [(MTEventRecorderAMSMetricsDelegate *)v10 containerId];
      v20 = [v8 profile];
      *(_DWORD *)buf = 138412802;
      id v29 = v18;
      __int16 v30 = 2112;
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_218211000, v17, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Created new object with container: %@ bag profile: %@", buf, 0x20u);
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __64__MTEventRecorderAMSMetricsDelegate_initWithContainerId_amsBag___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = [v12 objectForKeyedSubscript:@"postFrequency"];

  if (v3)
  {
    v4 = [v12 objectForKeyedSubscript:@"postFrequency"];
    [v4 doubleValue];
    double v6 = v5 / 1000.0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setFlushTimeInterval:v6];
  }
  id v8 = [v12 objectForKeyedSubscript:@"maxBatchSize"];

  if (v8)
  {
    v9 = [v12 objectForKeyedSubscript:@"maxBatchSize"];
    uint64_t v10 = [v9 integerValue];
    id v11 = objc_loadWeakRetained((id *)(a1 + 32));
    [v11 setMaximumBatchSize:v10];
  }
}

- (void)setFlushTimeInterval:(double)a3
{
  self->_flushTimeInterval = a3;
  v4 = self;
  objc_sync_enter(v4);
  double v5 = [(MTEventRecorderAMSMetricsDelegate *)v4 periodicQueuesByTopic];
  id v7 = [v5 allValues];

  objc_sync_exit(v4);
  double v6 = [NSNumber numberWithDouble:a3];
  [v7 setValue:v6 forKey:@"flushTimeInterval"];
}

- (id)flushUnreportedEvents
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MTEventRecorderAMSMetricsDelegate *)v2 amsMetricsByTopic];
  v4 = [v3 allValues];

  double v5 = [(MTEventRecorderAMSMetricsDelegate *)v2 periodicQueuesByTopic];
  double v6 = [v5 allValues];

  objc_sync_exit(v2);
  if (([v4 count] || objc_msgSend(v6, "count"))
    && ([v6 makeObjectsPerformSelector:sel_flushObjects], objc_msgSend(v4, "count")))
  {
    id v7 = objc_msgSend(v4, "mt_map:", &__block_literal_global_58);
    id v8 = objc_alloc_init(MTPromise);
    v9 = [MEMORY[0x263F27E18] promiseWithAll:v7];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__MTEventRecorderAMSMetricsDelegate_flushUnreportedEvents__block_invoke_2;
    v12[3] = &unk_26430F580;
    uint64_t v10 = v8;
    v13 = v10;
    [v9 addFinishBlock:v12];
  }
  else
  {
    uint64_t v10 = +[MTPromise promiseWithResult:&unk_26C96FCE8];
  }

  return v10;
}

- (NSMutableDictionary)periodicQueuesByTopic
{
  return self->_periodicQueuesByTopic;
}

- (NSMutableDictionary)amsMetricsByTopic
{
  return self->_amsMetricsByTopic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_periodicQueuesByTopic, 0);
  objc_storeStrong((id *)&self->_amsMetricsByTopic, 0);
  objc_storeStrong((id *)&self->_metricsBagPromise, 0);
  objc_storeStrong((id *)&self->_amsBag, 0);

  objc_storeStrong((id *)&self->_containerId, 0);
}

- (MTEventRecorderAMSMetricsDelegate)initWithContainerId:(id)a3 profileName:(id)a4 profileVersion:(id)a5
{
  id v8 = (void *)MEMORY[0x263F27B30];
  id v9 = a3;
  uint64_t v10 = [v8 bagForProfile:a4 profileVersion:a5];
  id v11 = [(MTEventRecorderAMSMetricsDelegate *)self initWithContainerId:v9 amsBag:v10];

  return v11;
}

+ (id)amsMetricsObjectCache
{
  if (amsMetricsObjectCache_onceToken != -1) {
    dispatch_once(&amsMetricsObjectCache_onceToken, &__block_literal_global);
  }
  v2 = (void *)amsMetricsObjectCache_cache;

  return v2;
}

uint64_t __58__MTEventRecorderAMSMetricsDelegate_amsMetricsObjectCache__block_invoke()
{
  amsMetricsObjectCache_cache = objc_alloc_init(MTNonretainedCache);

  return MEMORY[0x270F9A758]();
}

- (id)amsMetricsForTopic:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  double v6 = [(MTEventRecorderAMSMetricsDelegate *)v5 amsMetricsByTopic];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    id v8 = [(MTEventRecorderAMSMetricsDelegate *)v5 amsContainerIdForTopic:v4];
    id v9 = +[MTEventRecorderAMSMetricsDelegate amsMetricsObjectCache];
    uint64_t v10 = NSString;
    id v11 = [(MTEventRecorderAMSMetricsDelegate *)v5 amsBag];
    id v12 = [v10 stringWithFormat:@"%@-%lu", v8, objc_msgSend(v11, "hash")];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __56__MTEventRecorderAMSMetricsDelegate_amsMetricsForTopic___block_invoke;
    v23[3] = &unk_26430F478;
    id v13 = v8;
    id v24 = v13;
    v25 = v5;
    id v7 = [v9 objectForKeyedSubscript:v12 creation:v23];
    [v7 setFlushTimerEnabled:v5->_flushTimerEnabled];
    [v7 setMaxBatchSize:v5->_maximumBatchSize];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v7, "setMonitorsLifecycleEvents:", -[MTEventRecorderAMSMetricsDelegate monitorsLifecycleEvents](v5, "monitorsLifecycleEvents"));
    }
    v14 = [(MTEventRecorderAMSMetricsDelegate *)v5 amsMetricsByTopic];
    [v14 setObject:v7 forKeyedSubscript:v4];

    uint64_t v15 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = (id)objc_opt_class();
      v17 = [(MTEventRecorderAMSMetricsDelegate *)v5 amsBag];
      id v18 = [v17 profile];
      *(_DWORD *)buf = 138412802;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_218211000, v15, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Created new AMSMetrics for containerId: %@ bag profile: %@", buf, 0x20u);
    }
  }
  objc_sync_exit(v5);

  if (!v7)
  {
    v19 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v27 = v20;
      id v21 = v20;
      _os_log_impl(&dword_218211000, v19, OS_LOG_TYPE_ERROR, "MetricsKit: %@: Failed to create AMSMetrics, check to make sure AMSBag is provided.", buf, 0xCu);
    }
  }

  return v7;
}

id __56__MTEventRecorderAMSMetricsDelegate_amsMetricsForTopic___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F27D38]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) amsBag];
  double v5 = (void *)[v2 initWithContainerID:v3 bag:v4];

  return v5;
}

- (id)periodicQueueForTopic:(id)a3
{
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  double v6 = [(MTEventRecorderAMSMetricsDelegate *)v5 periodicQueuesByTopic];

  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    [(MTEventRecorderAMSMetricsDelegate *)v5 setPeriodicQueuesByTopic:v7];
  }
  id v8 = [(MTEventRecorderAMSMetricsDelegate *)v5 periodicQueuesByTopic];
  id v9 = [v8 objectForKeyedSubscript:v4];

  if (!v9)
  {
    id v9 = objc_alloc_init(MTPeriodicQueue);
    [(MTPeriodicQueue *)v9 setFlushTimeInterval:v5->_flushTimeInterval];
    [(MTPeriodicQueue *)v9 setFlushTimerEnabled:v5->_flushTimerEnabled];
    [(MTPeriodicQueue *)v9 setMaximumBatchSize:v5->_maximumBatchSize];
    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__MTEventRecorderAMSMetricsDelegate_periodicQueueForTopic___block_invoke;
    v13[3] = &unk_26430F4A0;
    objc_copyWeak(&v15, &location);
    id v10 = v4;
    id v14 = v10;
    [(MTPeriodicQueue *)v9 setFlushHandler:v13];
    id v11 = [(MTEventRecorderAMSMetricsDelegate *)v5 periodicQueuesByTopic];
    [v11 setObject:v9 forKeyedSubscript:v10];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);

  return v9;
}

void __59__MTEventRecorderAMSMetricsDelegate_periodicQueueForTopic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _flushEvents:v4 topic:*(void *)(a1 + 32)];
}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->_monitorsLifecycleEvents = a3;
  id v4 = self;
  objc_sync_enter(v4);
  double v5 = [(MTEventRecorderAMSMetricsDelegate *)v4 amsMetricsByTopic];
  double v6 = [v5 allValues];

  objc_sync_exit(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "setMonitorsLifecycleEvents:", v3, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)setTransactionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  v4->_transactionEnabled = v3;
  if (v3)
  {
    if (v4->_numberOfPendingEvents >= 1) {
      [(MTEventRecorderAMSMetricsDelegate *)v4 _beginTransaction];
    }
  }
  else
  {
    [(MTEventRecorderAMSMetricsDelegate *)v4 _endTransaction];
  }
  double v5 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 1024;
    BOOL v10 = v3;
    id v6 = v8;
    _os_log_impl(&dword_218211000, v5, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Updated transactionEnabled to %d", (uint8_t *)&v7, 0x12u);
  }
  objc_sync_exit(v4);
}

- (void)setFlushMode:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  if ([(NSMutableDictionary *)v4->_amsMetricsByTopic count]
    || [(NSMutableDictionary *)v4->_periodicQueuesByTopic count])
  {
    int v7 = (void *)MEMORY[0x263EFF940];
    id v8 = NSString;
    __int16 v9 = (objc_class *)objc_opt_class();
    BOOL v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 stringWithFormat:@"Flush mode cannot be changed after recording events for the class %@", v10];
    id v12 = [v7 exceptionWithName:*MEMORY[0x263EFF498] reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }
  objc_sync_exit(v4);

  v4->_flushMode = a3;
  double v5 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2048;
    int64_t v16 = a3;
    id v6 = v14;
    _os_log_impl(&dword_218211000, v5, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Updated flushMode to %ld", buf, 0x16u);
  }
}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_flushTimerEnabled = a3;
  id v4 = self;
  objc_sync_enter(v4);
  double v5 = [(MTEventRecorderAMSMetricsDelegate *)v4 amsMetricsByTopic];
  id v10 = [v5 allValues];

  id v6 = [(MTEventRecorderAMSMetricsDelegate *)v4 periodicQueuesByTopic];
  int v7 = [v6 allValues];

  objc_sync_exit(v4);
  id v8 = [NSNumber numberWithBool:v3];
  [v10 setValue:v8 forKey:@"flushTimerEnabled"];

  __int16 v9 = [NSNumber numberWithBool:v3];
  [v7 setValue:v9 forKey:@"flushTimerEnabled"];
}

- (void)setMaximumBatchSize:(int64_t)a3
{
  self->_maximumBatchSize = a3;
  id v4 = self;
  objc_sync_enter(v4);
  double v5 = [(MTEventRecorderAMSMetricsDelegate *)v4 amsMetricsByTopic];
  id v10 = [v5 allValues];

  id v6 = [(MTEventRecorderAMSMetricsDelegate *)v4 periodicQueuesByTopic];
  int v7 = [v6 allValues];

  objc_sync_exit(v4);
  id v8 = [NSNumber numberWithInteger:a3];
  [v10 setValue:v8 forKey:@"maxBatchSize"];

  __int16 v9 = [NSNumber numberWithInteger:a3];
  [v7 setValue:v9 forKey:@"maximumBatchSize"];
}

- (void)setNumberOfPendingEvents:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  int64_t numberOfPendingEvents = obj->_numberOfPendingEvents;
  obj->_int64_t numberOfPendingEvents = a3;
  if (a3 != 1 || numberOfPendingEvents)
  {
    if (!a3) {
      [(MTEventRecorderAMSMetricsDelegate *)obj _endTransaction];
    }
  }
  else
  {
    [(MTEventRecorderAMSMetricsDelegate *)obj _beginTransaction];
  }
  objc_sync_exit(obj);
}

- (void)_beginTransaction
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_transactionEnabled)
  {
    [@"com.apple.amp-ae.metricskit.amsqueue" UTF8String];
    BOOL v3 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v3;

    double v5 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = (id)objc_opt_class();
      id v6 = v8;
      _os_log_impl(&dword_218211000, v5, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: begin transaction", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_endTransaction
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;

    BOOL v3 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = (id)objc_opt_class();
      id v4 = v6;
      _os_log_impl(&dword_218211000, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: end transaction", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)lookupItunesAccount:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue"));

    id v3 = (id)v4;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = objc_msgSend(MEMORY[0x263EFB218], "ams_sharedAccountStore", 0);
  id v6 = objc_msgSend(v5, "ams_iTunesAccounts");

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "ams_DSID");
        id v12 = v11;
        if (v11 && ([v11 isEqualToNumber:v3] & 1) != 0)
        {
          id v7 = v10;

          goto LABEL_14;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v7;
}

- (id)activeItunesAccount
{
  id v2 = objc_msgSend(MEMORY[0x263EFB218], "ams_sharedAccountStore");
  id v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return v3;
}

- (id)recordEvent:(id)a3 toTopic:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"eventType"];
  uint64_t v9 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = (id)objc_opt_class();
    __int16 v28 = 2112;
    id v29 = v8;
    id v10 = v27;
    _os_log_impl(&dword_218211000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Start recording %@ event", buf, 0x16u);
  }
  uint64_t v11 = objc_alloc_init(MTPromise);
  objc_initWeak((id *)buf, self);
  metricsBagPromise = self->_metricsBagPromise;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke;
  v20[3] = &unk_26430F4F0;
  objc_copyWeak(&v25, (id *)buf);
  long long v13 = v11;
  id v21 = v13;
  id v14 = v6;
  id v22 = v14;
  id v15 = v7;
  id v23 = v15;
  id v16 = v8;
  id v24 = v16;
  [(AMSPromise *)metricsBagPromise addFinishBlock:v20];
  long long v17 = v24;
  id v18 = v13;

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

  return v18;
}

void __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = [WeakRetained _recordEvent:*(void *)(a1 + 40) toTopic:*(void *)(a1 + 48)];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke_2;
    v5[3] = &unk_26430F4C8;
    uint64_t v8 = v3;
    id v6 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 32);
    [v4 addFinishBlock:v5];
  }
  else
  {
    [*(id *)(a1 + 32) finishWithResult:MEMORY[0x263EFFA78]];
  }
}

void __57__MTEventRecorderAMSMetricsDelegate_recordEvent_toTopic___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = MTMetricsKitOSLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138412802;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Failed recording %@ event with error: %@", (uint8_t *)&v13, 0x20u);
    }

    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    if (v8)
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Finished recording %@ event", (uint8_t *)&v13, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithResult:v5];
  }
}

- (id)_recordEvent:(id)a3 toTopic:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 objectForKeyedSubscript:@"dsId"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F27D50]) initWithTopic:v7];
  if (isKindOfClass)
  {
    if (objc_opt_respondsToSelector()) {
      [v10 setAnonymous:1];
    }
  }
  else if ([(MTEventRecorderAMSMetricsDelegate *)self personalizedWithItunesAccount])
  {
    if (!v8
      || ([(MTEventRecorderAMSMetricsDelegate *)self lookupItunesAccount:v8],
          (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v11 = [(MTEventRecorderAMSMetricsDelegate *)self activeItunesAccount];
    }
    [v10 setAccount:v11];
  }
  uint64_t v12 = +[MTReflectUtil removeNullValuesFromDictionary:v6];
  [v10 addPropertiesWithDictionary:v12];
  int64_t flushMode = self->_flushMode;
  if (flushMode == 2)
  {
    [(MTEventRecorderAMSMetricsDelegate *)self setNumberOfPendingEvents:[(MTEventRecorderAMSMetricsDelegate *)self numberOfPendingEvents] + 1];
    id v25 = v10;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [(MTEventRecorderAMSMetricsDelegate *)self _flushEvents:v18 topic:v7];
  }
  else if (flushMode == 1)
  {
    uint64_t v19 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_opt_class();
      id v21 = v20;
      id v22 = [v6 objectForKeyedSubscript:@"eventType"];
      *(_DWORD *)buf = 138412546;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v22;
      _os_log_impl(&dword_218211000, v19, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: enqueue %@ event using in-memory queue", buf, 0x16u);
    }
    [(MTEventRecorderAMSMetricsDelegate *)self setNumberOfPendingEvents:[(MTEventRecorderAMSMetricsDelegate *)self numberOfPendingEvents] + 1];
    id v18 = [(MTEventRecorderAMSMetricsDelegate *)self periodicQueueForTopic:v7];
    [v18 appendObject:v10];
  }
  else
  {
    if (flushMode) {
      goto LABEL_20;
    }
    uint64_t v14 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = objc_opt_class();
      id v16 = v15;
      __int16 v17 = [v6 objectForKeyedSubscript:@"eventType"];
      *(_DWORD *)buf = 138412546;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_218211000, v14, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: enqueue %@ event using AMSMetrics", buf, 0x16u);
    }
    id v18 = [(MTEventRecorderAMSMetricsDelegate *)self amsMetricsForTopic:v7];
    [v18 enqueueEvent:v10];
  }

LABEL_20:
  id v23 = +[MTPromise promiseWithResult:v12];

  return v23;
}

- (void)_flushEvents:(id)a3 topic:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v9;
    *(_DWORD *)buf = 138412546;
    id v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = [v6 count];
    _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Start flushing %lu in-memory events", buf, 0x16u);
  }
  uint64_t v11 = [(MTEventRecorderAMSMetricsDelegate *)self _sortedEventsFromBatch:v6];
  uint64_t v12 = [(MTEventRecorderAMSMetricsDelegate *)self amsMetricsForTopic:v7];
  int v13 = [v12 flushEvents:v11];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__MTEventRecorderAMSMetricsDelegate__flushEvents_topic___block_invoke;
  v17[3] = &unk_26430F518;
  id v18 = v11;
  uint64_t v19 = self;
  id v20 = v6;
  id v21 = v7;
  id v14 = v7;
  id v15 = v6;
  id v16 = v11;
  [v13 addFinishBlock:v17];
}

void __56__MTEventRecorderAMSMetricsDelegate__flushEvents_topic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 || [v5 integerValue] <= 0 && objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    id v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v18 = 138412546;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v6;
      id v8 = *(id *)&v18[4];
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: %@: Failed to flush events with error: %@", v18, 0x16u);
    }
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) count];
  }
  else
  {
    uint64_t v11 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = objc_opt_class();
      int v13 = *(void **)(a1 + 48);
      id v14 = v12;
      *(_DWORD *)id v18 = 138412546;
      *(void *)&v18[4] = v12;
      *(_WORD *)&v18[12] = 2048;
      *(void *)&v18[14] = [v13 count];
      _os_log_impl(&dword_218211000, v11, OS_LOG_TYPE_DEBUG, "MetricsKit: %@: Finished flushing %lu in-memory events", v18, 0x16u);
    }
    uint64_t v15 = [v5 integerValue];
    if (v15 != [*(id *)(a1 + 32) count])
    {
      id v16 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", objc_msgSend(v5, "integerValue"), objc_msgSend(*(id *)(a1 + 32), "count") - objc_msgSend(v5, "integerValue"));
      __int16 v17 = [*(id *)(a1 + 40) periodicQueueForTopic:*(void *)(a1 + 56)];
      [v17 insertObjects:v16];
    }
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [v5 integerValue];
  }
  objc_msgSend(v9, "setNumberOfPendingEvents:", objc_msgSend(v9, "numberOfPendingEvents", *(_OWORD *)v18, *(void *)&v18[16], v19) - v10);
}

- (id)_sortedEventsFromBatch:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_46];
}

uint64_t __60__MTEventRecorderAMSMetricsDelegate__sortedEventsFromBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 account];
  uint64_t v7 = objc_msgSend(v6, "ams_DSID");
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = &unk_26C96FCE8;
  }
  id v10 = v9;

  uint64_t v11 = [v5 account];
  uint64_t v12 = objc_msgSend(v11, "ams_DSID");
  int v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = &unk_26C96FCE8;
  }
  id v15 = v14;

  uint64_t v16 = [v10 compare:v15];
  if (!v16)
  {
    uint64_t v17 = [v4 canaryIdentifier];
    id v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (__CFString *)v17;
    }
    else {
      uint64_t v19 = &stru_26C95D008;
    }
    id v20 = v19;

    uint64_t v21 = [v5 canaryIdentifier];
    id v22 = (void *)v21;
    if (v21) {
      id v23 = (__CFString *)v21;
    }
    else {
      id v23 = &stru_26C95D008;
    }
    __int16 v24 = v23;

    uint64_t v16 = [(__CFString *)v20 compare:v24];
  }

  return v16;
}

- (id)sendMethod
{
  return @"amsmetrics";
}

uint64_t __58__MTEventRecorderAMSMetricsDelegate_flushUnreportedEvents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 flush];
}

void __58__MTEventRecorderAMSMetricsDelegate_flushUnreportedEvents__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) finishWithError:a3];
  }
  else
  {
    if ([v5 count] == 1)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = [v6 firstObject];
      [v7 finishWithResult:v8];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v9);
          }
          v12 += objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "integerValue", (void)v17);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }

    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = [NSNumber numberWithInteger:v12];
    [v15 finishWithResult:v16];
  }
}

- (id)amsContainerIdForTopic:(id)a3
{
  id v4 = a3;
  containerId = self->_containerId;
  if (containerId)
  {
    id v6 = containerId;
  }
  else
  {
    uint64_t v7 = +[MTFrameworkEnvironment sharedEnvironment];
    id v6 = [v7 metricsKitBundleIdentifier];
  }
  id v8 = [NSString stringWithFormat:@"%@.%@", v6, v4];

  return v8;
}

- (BOOL)monitorsLifecycleEvents
{
  return self->_monitorsLifecycleEvents;
}

- (NSString)containerId
{
  return self->_containerId;
}

- (void)setContainerId:(id)a3
{
}

- (BOOL)isTransactionEnabled
{
  return self->_transactionEnabled;
}

- (int64_t)flushMode
{
  return self->_flushMode;
}

- (double)flushTimeInterval
{
  return self->_flushTimeInterval;
}

- (BOOL)isFlushTimerEnabled
{
  return self->_flushTimerEnabled;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (BOOL)personalizedWithItunesAccount
{
  return self->_personalizedWithItunesAccount;
}

- (void)setPersonalizedWithItunesAccount:(BOOL)a3
{
  self->_personalizedWithItunesAccount = a3;
}

- (AMSBagProtocol)amsBag
{
  return self->_amsBag;
}

- (void)setAmsBag:(id)a3
{
}

- (AMSPromise)metricsBagPromise
{
  return self->_metricsBagPromise;
}

- (void)setMetricsBagPromise:(id)a3
{
}

- (void)setAmsMetricsByTopic:(id)a3
{
}

- (void)setPeriodicQueuesByTopic:(id)a3
{
}

- (int64_t)numberOfPendingEvents
{
  return self->_numberOfPendingEvents;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

@end