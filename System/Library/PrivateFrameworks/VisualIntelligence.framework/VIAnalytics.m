@interface VIAnalytics
+ (void)logEvent:(id)a3;
- (OS_dispatch_queue)serialQueue;
- (VIAFeedbackSubmitter)feedbackSubmitter;
- (VIAnalytics)initWithFeedbackSubmitter:(id)a3;
- (VIAnalyticsTestingDelegate)testingDelegate;
- (void)_logEvent:(id)a3;
- (void)_performLogEvent:(id)a3;
- (void)setTestingDelegate:(id)a3;
@end

@implementation VIAnalytics

- (VIAnalytics)initWithFeedbackSubmitter:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VIAnalytics;
  v6 = [(VIAnalytics *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackSubmitter, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.argos.analytics", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    v10 = [[VIAEventCache alloc] initWithQueue:v7->_serialQueue];
    eventCache = v7->_eventCache;
    v7->_eventCache = v10;

    v12 = [[VIAEntryPointLogger alloc] initWithQueue:v7->_serialQueue feedbackSubmitter:v5 eventCache:v7->_eventCache];
    id v33 = v5;
    v30 = [[VIACacheHitLogger alloc] initWithQueue:v7->_serialQueue feedbackSubmitter:v5];
    v31 = v12;
    v48[0] = v12;
    v48[1] = v30;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    loggers = v7->_loggers;
    v7->_loggers = (NSArray *)v13;

    v32 = v7;
    v15 = v7->_loggers;
    v16 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obj = v15;
    uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v45;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v17;
          uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * v17);
          v19 = [(id)objc_opt_class() feedbackNamesToLog];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v41 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * i);
                v25 = [v16 objectForKeyedSubscript:v24];

                if (v25)
                {
                  if (+[VILogger shouldLogMessage])
                  {
                    v26 = +[VILogger log];
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1DCCF9000, v26, OS_LOG_TYPE_ERROR, "Cannot have two loggers register the same feedback", buf, 2u);
                    }
                  }
                }
                else
                {
                  [v16 setObject:v18 forKeyedSubscript:v24];
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
            }
            while (v21);
          }

          uint64_t v17 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v36);
    }

    uint64_t v27 = [v16 copy];
    v7 = v32;
    feedbackNameToLoggerMap = v32->_feedbackNameToLoggerMap;
    v32->_feedbackNameToLoggerMap = (NSDictionary *)v27;

    id v5 = v33;
  }

  return v7;
}

+ (void)logEvent:(id)a3
{
  id v5 = a3;
  v3 = [v5 feedback];
  if (v3)
  {
    v4 = _VISharedAnalytics();
    [v4 _logEvent:v5];
  }
}

- (void)_logEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__VIAnalytics__logEvent___block_invoke;
  block[3] = &unk_1E6CB1818;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__VIAnalytics__logEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performLogEvent:*(void *)(a1 + 32)];
}

- (void)_performLogEvent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_loggers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v9++), "didObserveEvent:", v4, (void)v18);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v10 = [v4 feedback];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);

  uint64_t v13 = [(NSDictionary *)self->_feedbackNameToLoggerMap objectForKeyedSubscript:v12];
  if (v13 && (v14 = (void *)v13, char v15 = [v4 shouldReportDirectly], v14, (v15 & 1) == 0))
  {
    uint64_t v17 = [(NSDictionary *)self->_feedbackNameToLoggerMap objectForKeyedSubscript:v12];
    [v17 logEvent:v4];
  }
  else
  {
    feedbackSubmitter = self->_feedbackSubmitter;
    uint64_t v17 = objc_msgSend(v4, "feedback", (void)v18);
    -[VIAFeedbackSubmitter reportFeedback:queryId:](feedbackSubmitter, "reportFeedback:queryId:", v17, [v4 queryID]);
  }
}

- (void)setTestingDelegate:(id)a3
{
  p_testingDelegate = &self->_testingDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_testingDelegate, v5);
  [(VIAEventCache *)self->_eventCache setTestingDelegate:v5];
  [(VIAFeedbackSubmitter *)self->_feedbackSubmitter setTestingDelegate:v5];
}

- (VIAnalyticsTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  return (VIAnalyticsTestingDelegate *)WeakRetained;
}

- (VIAFeedbackSubmitter)feedbackSubmitter
{
  return self->_feedbackSubmitter;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_feedbackSubmitter, 0);
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_feedbackNameToLoggerMap, 0);
  objc_storeStrong((id *)&self->_loggers, 0);
}

@end