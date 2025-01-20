@interface SSURLSessionManager
+ (BOOL)_fetchedFromCache:(id)a3;
+ (BOOL)_shouldCollectNetworkLogs;
+ (BOOL)_shouldCreateLocalCache;
+ (double)_localTimeIntervalToServerTimeInterval:(double)a3;
+ (double)_randomDouble;
+ (double)_timingDataMetricToServerTimeInterval:(id)a3;
+ (id)_DNSServerIPAddresses;
+ (id)_bagPerformanceValuesWithDelegate:(id)a3;
+ (id)_fetchNetworkQualityReports;
+ (id)_legacyBagValueForKey:(id)a3;
+ (id)_metricsDictionaryWithDelegate:(id)a3;
+ (id)_resolvedIPAddressFromTask:(id)a3;
+ (id)_responseDateFromTask:(id)a3 delegate:(id)a4;
+ (id)_tidStateForTask:(id)a3 delegate:(id)a4;
+ (id)bagValueForKey:(id)a3 delegate:(id)a4 type:(unint64_t)a5;
+ (id)eventFromTimingData:(id)a3 delegate:(id)a4 session:(id)a5 task:(id)a6 error:(id)a7;
+ (id)eventFromTimingData:(id)a3 delegate:(id)a4 task:(id)a5 error:(id)a6;
+ (id)eventFromTimingData:(id)a3 requestProperties:(id)a4 task:(id)a5 error:(id)a6;
+ (id)eventFromTimingData:(id)a3 task:(id)a4;
+ (id)eventFromTimingData:(id)a3 task:(id)a4 error:(id)a5;
+ (id)sharedManager;
+ (unint64_t)_messageSizeFromTask:(id)a3 isRequest:(BOOL)a4 delegate:(id)a5;
- (BOOL)_sendTimingDataForSessionTask:(id)a3;
- (BOOL)_shouldDisableCellularForDelegate:(id)a3;
- (BOOL)_shouldEnableAPSRWithTask:(id)a3;
- (BOOL)_shouldEnableTLSSessionForDelegate:(id)a3;
- (BOOL)_shouldRecordResponseBodyForDataTask:(id)a3;
- (BOOL)_shouldRequireCelluarForDelegate:(id)a3;
- (BOOL)_shouldSetCookiesForDelegate:(id)a3;
- (NSArray)customURLProtocols;
- (NSMapTable)taskDelegates;
- (NSMutableDictionary)recordResponseMap;
- (NSMutableDictionary)requestData;
- (NSMutableDictionary)responseData;
- (NSMutableDictionary)sendTimingDataMap;
- (NSMutableDictionary)sessions;
- (NSMutableDictionary)taskMetrics;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)recordResponseQueue;
- (OS_dispatch_queue)requestDataQueue;
- (OS_dispatch_queue)responseDataQueue;
- (OS_dispatch_queue)sendTimingDataQueue;
- (OS_dispatch_queue)sessionsQueue;
- (OS_dispatch_queue)taskDelegatesQueue;
- (OS_dispatch_queue)taskMetricsQueue;
- (SSCircularBuffer)httpArchiveBuffer;
- (SSMetricsController)metricsController;
- (SSURLSessionManager)init;
- (id)_URLCacheForDelegate:(id)a3;
- (id)_URLCacheIDForDelegate:(id)a3;
- (id)_delegateForTask:(id)a3;
- (id)_requestDataForSessionTask:(id)a3;
- (id)_responseDataForSessionTask:(id)a3;
- (id)_saveHTTPArchiveBufferToDiskDecompressed:(BOOL)a3;
- (id)_sessionConfigurationWithDelegate:(id)a3 collectTimingData:(BOOL)a4 allowsTLSSessionTickets:(BOOL)a5;
- (id)_sessionIDWithDelegate:(id)a3 collectTimingData:(BOOL)a4 allowsTLSSessionTickets:(BOOL)a5;
- (id)_sessionWithDelegate:(id)a3 collectTimingData:(BOOL *)a4;
- (id)_taskMetricsForSessionTask:(id)a3;
- (id)dataTaskWithRequest:(id)a3 delegate:(id)a4;
- (int)_PIDFromAuditTokenData:(id)a3;
- (unint64_t)httpArchiveBufferSize;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_appendResponseData:(id)a3 forSessionTask:(id)a4;
- (void)_insertEventIntoDatabase:(id)a3 delegate:(id)a4;
- (void)_listenForLowMemoryWarning;
- (void)_logAPSResultsWithTask:(id)a3;
- (void)_logCacheHitForTask:(id)a3 metrics:(id)a4;
- (void)_removeDelegateForTask:(id)a3;
- (void)_removeRecordResponseDataForSessionTask:(id)a3;
- (void)_removeResponseDataForSessionTask:(id)a3;
- (void)_setAPSTopicWithTask:(id)a3;
- (void)_setDelegate:(id)a3 forTask:(id)a4;
- (void)_setRequestData:(id)a3 forSessionTask:(id)a4;
- (void)_setSendTimingData:(id)a3 forSessionTask:(id)a4;
- (void)_setTaskMetrics:(id)a3 forSessionTask:(id)a4;
- (void)dealloc;
- (void)flushHTTPArchiveBuffer;
- (void)setCustomURLProtocols:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setHttpArchiveBuffer:(id)a3;
- (void)setHttpArchiveBufferSize:(unint64_t)a3;
- (void)setMetricsController:(id)a3;
- (void)setRecordResponseMap:(id)a3;
- (void)setRecordResponseQueue:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setRequestDataQueue:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setResponseDataQueue:(id)a3;
- (void)setSendTimingDataMap:(id)a3;
- (void)setSendTimingDataQueue:(id)a3;
- (void)setSessions:(id)a3;
- (void)setSessionsQueue:(id)a3;
- (void)setTaskDelegates:(id)a3;
- (void)setTaskDelegatesQueue:(id)a3;
- (void)setTaskMetrics:(id)a3;
- (void)setTaskMetricsQueue:(id)a3;
@end

@implementation SSURLSessionManager

- (SSURLSessionManager)init
{
  v41.receiver = self;
  v41.super_class = (Class)SSURLSessionManager;
  v2 = [(SSURLSessionManager *)&v41 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SessionManager.eventqueue", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sendTimingDataMap = v2->_sendTimingDataMap;
    v2->_sendTimingDataMap = v5;

    v7 = MEMORY[0x1E4F14430];
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.StoreServices.SessionManager.sendTimingData", MEMORY[0x1E4F14430]);
    sendTimingDataQueue = v2->_sendTimingDataQueue;
    v2->_sendTimingDataQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessions = v2->_sessions;
    v2->_sessions = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.StoreServices.SessionManager.sessions", v7);
    sessionsQueue = v2->_sessionsQueue;
    v2->_sessionsQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    taskDelegates = v2->_taskDelegates;
    v2->_taskDelegates = (NSMapTable *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.StoreServices.SessionManager.taskDelegates", v7);
    taskDelegatesQueue = v2->_taskDelegatesQueue;
    v2->_taskDelegatesQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taskMetrics = v2->_taskMetrics;
    v2->_taskMetrics = v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.StoreServices.SessionManager.taskMetrics", v7);
    taskMetricsQueue = v2->_taskMetricsQueue;
    v2->_taskMetricsQueue = (OS_dispatch_queue *)v20;

    if (SSIsInternalBuild())
    {
      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      requestData = v2->_requestData;
      v2->_requestData = v22;

      dispatch_queue_t v24 = dispatch_queue_create("com.apple.StoreServices.SessionManager.requestData", v7);
      requestDataQueue = v2->_requestDataQueue;
      v2->_requestDataQueue = (OS_dispatch_queue *)v24;

      v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      responseData = v2->_responseData;
      v2->_responseData = v26;

      dispatch_queue_t v28 = dispatch_queue_create("com.apple.StoreServices.SessionManager.responseData", v7);
      responseDataQueue = v2->_responseDataQueue;
      v2->_responseDataQueue = (OS_dispatch_queue *)v28;

      v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      recordResponseMap = v2->_recordResponseMap;
      v2->_recordResponseMap = v30;

      dispatch_queue_t v32 = dispatch_queue_create("com.apple.StoreServices.SessionManager.recordResponse", v7);
      recordResponseQueue = v2->_recordResponseQueue;
      v2->_recordResponseQueue = (OS_dispatch_queue *)v32;
    }
    if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
    {
      [(SSURLSessionManager *)v2 _listenForLowMemoryWarning];
      v34 = [[SSCircularBuffer alloc] initWithMaxSize:400];
      httpArchiveBuffer = v2->_httpArchiveBuffer;
      v2->_httpArchiveBuffer = v34;

      v36 = [MEMORY[0x1E4F28B50] mainBundle];
      v37 = [v36 bundleIdentifier];
      int v38 = [v37 isEqualToString:@"com.apple.AppStore"];

      if (v38) {
        [(SSCircularBuffer *)v2->_httpArchiveBuffer setMaxSize:2000];
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SSHTTPArchiveShouldSaveToDisk, @"SSHTTPArchiveShouldSaveToDiskNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SSHTTPArchiveShouldSaveToDiskDecompressed, @"SSHTTPArchiveShouldSaveToDiskDecompressedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v2;
}

- (void)dealloc
{
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SSHTTPArchiveShouldSaveToDiskNotification", 0);
  }
  v4 = [(SSURLSessionManager *)self sessionsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SSURLSessionManager_dealloc__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_barrier_sync(v4, block);

  v5 = [(SSURLSessionManager *)self taskDelegatesQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__SSURLSessionManager_dealloc__block_invoke_2;
  v8[3] = &unk_1E5BA7040;
  v8[4] = self;
  dispatch_barrier_sync(v5, v8);

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource) {
    dispatch_source_cancel(memoryPressureSource);
  }
  v7.receiver = self;
  v7.super_class = (Class)SSURLSessionManager;
  [(SSURLSessionManager *)&v7 dealloc];
}

void __30__SSURLSessionManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessions", 0);
  dispatch_queue_t v3 = [v2 allKeys];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        v9 = [*(id *)(a1 + 32) sessions];
        v10 = [v9 objectForKeyedSubscript:v8];

        [v10 invalidateAndCancel];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11 = [*(id *)(a1 + 32) sessions];
  [v11 removeAllObjects];
}

void __30__SSURLSessionManager_dealloc__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) taskDelegates];
  [v1 removeAllObjects];
}

- (unint64_t)httpArchiveBufferSize
{
  dispatch_queue_t v3 = [(SSURLSessionManager *)self httpArchiveBuffer];
  if (v3)
  {
    uint64_t v4 = [(SSURLSessionManager *)self httpArchiveBuffer];
    unint64_t v5 = [v4 maxSize];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)setHttpArchiveBufferSize:(unint64_t)a3
{
  id v4 = [(SSURLSessionManager *)self httpArchiveBuffer];
  [v4 setMaxSize:a3];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)sharedManager___sessionManager;
  return v2;
}

void __36__SSURLSessionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SSURLSessionManager);
  id v1 = (void *)sharedManager___sessionManager;
  sharedManager___sessionManager = (uint64_t)v0;
}

- (id)dataTaskWithRequest:(id)a3 delegate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  HIBYTE(v26) = 0;
  uint64_t v8 = [(SSURLSessionManager *)self _sessionWithDelegate:v7 collectTimingData:(char *)&v26 + 7];
  v9 = [v8 dataTaskWithRequest:v6];
  if (!v9)
  {
    v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    long long v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      v13 &= 2u;
    }
    if (v13)
    {
      long long v15 = objc_opt_class();
      id v16 = v15;
      uint64_t v17 = [v6 URL];
      int v27 = 138412546;
      dispatch_queue_t v28 = v15;
      __int16 v29 = 2112;
      v30 = v17;
      LODWORD(v26) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      long long v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v27, v26);
      free(v18);
      SSFileLog(v11, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v14);
    }

    goto LABEL_15;
  }
  [(SSURLSessionManager *)self _setDelegate:v7 forTask:v9];
  v10 = [v6 HTTPBody];
  [(SSURLSessionManager *)self _setRequestData:v10 forSessionTask:v9];

  [(SSURLSessionManager *)self _setAPSTopicWithTask:v9];
  if (HIBYTE(v26)) {
    [(SSURLSessionManager *)self _setSendTimingData:MEMORY[0x1E4F1CC38] forSessionTask:v9];
  }
LABEL_16:

  return v9;
}

+ (id)eventFromTimingData:(id)a3 task:(id)a4
{
  return (id)[a1 eventFromTimingData:a3 task:a4 error:0];
}

+ (id)eventFromTimingData:(id)a3 task:(id)a4 error:(id)a5
{
  return (id)[a1 eventFromTimingData:a3 delegate:0 task:a4 error:a5];
}

+ (id)eventFromTimingData:(id)a3 requestProperties:(id)a4 task:(id)a5 error:(id)a6
{
  return (id)[a1 eventFromTimingData:a3 delegate:0 task:a5 error:a6];
}

+ (id)eventFromTimingData:(id)a3 delegate:(id)a4 task:(id)a5 error:(id)a6
{
  return (id)[a1 eventFromTimingData:a3 delegate:a4 session:0 task:a5 error:a6];
}

+ (id)eventFromTimingData:(id)a3 delegate:(id)a4 session:(id)a5 task:(id)a6 error:(id)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![a3 count])
  {
    uint64_t v22 = 0;
    goto LABEL_39;
  }
  if (objc_opt_respondsToSelector())
  {
    id v16 = [v12 requestProperties];
    uint64_t v17 = [v16 clientIdentifier];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      uint64_t v19 = [v12 requestProperties];
      uint64_t v20 = [v19 clientIdentifier];

      if (!v20)
      {
        uint64_t v21 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v20 = [v21 bundleIdentifier];
      }
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F4DDC8]) initWithBundleIdentifier:v20];
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v23 = [(id)objc_opt_class() sharedManager];
  uint64_t v24 = [v23 _taskMetricsForSessionTask:v14];

  v59 = (void *)v24;
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F4DD80]) initWithTask:v14 metrics:v24];
  [v25 setError:v15];
  [v25 setProcessInfo:v18];
  id v61 = v15;
  id v62 = v14;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v26 = [v12 rawResponseData];
    [v25 setResponseBody:v26];
  }
  else
  {
    [v25 setResponseBody:0];
  }
  id v63 = v13;
  [v25 setSession:v13];
  v58 = v25;
  int v27 = (void *)[objc_alloc(MEMORY[0x1E4F4DD88]) initWithContext:v25];
  dispatch_queue_t v28 = [a1 _bagPerformanceValuesWithDelegate:v12];
  __int16 v29 = [v28 objectForKeyedSubscript:@"sessionDuration"];
  [v29 doubleValue];
  objc_msgSend(v27, "setXpSessionDuration:");

  v30 = [v28 objectForKeyedSubscript:@"samplingPercentageCachedResponses"];
  [v30 doubleValue];
  objc_msgSend(v27, "setXpSamplingPercentageCachedResponses:");

  v57 = v28;
  uint64_t v31 = [v28 objectForKeyedSubscript:@"samplingPercentageUsers"];
  [v31 doubleValue];
  objc_msgSend(v27, "setXpSamplingPercentageUsers:");

  if (+[SSMetricsLoadURLEvent shouldLogTimingMetrics])
  {
    [v27 setXpSamplingForced:1];
    [v27 setXpSamplingPercentageCachedResponses:1.0];
    [v27 setXpSamplingPercentageUsers:1.0];
    dispatch_queue_t v32 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v32)
    {
      dispatch_queue_t v32 = +[SSLogConfig sharedConfig];
    }
    int v33 = [v32 shouldLog];
    if ([v32 shouldLogToDisk]) {
      int v34 = v33 | 2;
    }
    else {
      int v34 = v33;
    }
    v35 = [v32 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      int v36 = v34;
    }
    else {
      int v36 = v34 & 2;
    }
    if (v36)
    {
      int v73 = 138412290;
      v74 = v27;
      LODWORD(v56) = 12;
      v55 = &v73;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_25:

        goto LABEL_26;
      }
      v35 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v73, v56);
      free(v37);
      SSFileLog(v32, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v35);
    }

    goto LABEL_25;
  }
LABEL_26:
  if (objc_opt_respondsToSelector())
  {
    v44 = [v12 requestProperties];
    v45 = [v44 additionalMetrics];
  }
  else
  {
    v45 = 0;
  }
  v60 = (void *)v18;
  id v64 = v12;
  if (objc_msgSend(v45, "count", v55))
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __71__SSURLSessionManager_eventFromTimingData_delegate_session_task_error___block_invoke;
    v69[3] = &unk_1E5BAD9C8;
    id v70 = v27;
    id v71 = a1;
    [v45 enumerateKeysAndObjectsUsingBlock:v69];
  }
  uint64_t v22 = objc_alloc_init(SSMetricsLoadURLEvent);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v46 = [v27 underlyingDictionary];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v66 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        v52 = [v27 underlyingDictionary];
        v53 = [v52 objectForKeyedSubscript:v51];

        [(SSMetricsMutableEvent *)v22 setProperty:v53 forBodyKey:v51];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v48);
  }

  id v13 = v63;
  id v12 = v64;
  id v15 = v61;
  id v14 = v62;
LABEL_39:

  return v22;
}

void __71__SSURLSessionManager_eventFromTimingData_delegate_session_task_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) propertyForBodyKey:v5];

  if (v7)
  {
    uint64_t v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      *(_DWORD *)uint64_t v22 = 138543874;
      *(void *)&v22[4] = objc_opt_class();
      *(_WORD *)&v22[12] = 2114;
      *(void *)&v22[14] = v5;
      *(_WORD *)&v22[22] = 2112;
      id v23 = v6;
      id v12 = *(id *)&v22[4];
      LODWORD(v21) = 32;
      uint64_t v20 = v22;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16], v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "setProperty:forBodyKey:", v6, v5, v20);
}

- (void)flushHTTPArchiveBuffer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [(SSURLSessionManager *)self httpArchiveBuffer];
  uint64_t v4 = [v3 count];

  id v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (!v9) {
    goto LABEL_12;
  }
  int v20 = 134217984;
  uint64_t v21 = v4;
  LODWORD(v19) = 12;
  int v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v20, v19);
    free(v10);
    SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_12:
  }
  uint64_t v17 = [(SSURLSessionManager *)self httpArchiveBuffer];
  id v18 = (id)[v17 flush];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(SSURLSessionManager *)self _shouldRecordResponseBodyForDataTask:v8]) {
    [(SSURLSessionManager *)self _appendResponseData:v9 forSessionTask:v8];
  }
  int v10 = [(SSURLSessionManager *)self _delegateForTask:v8];
  if (objc_opt_respondsToSelector()) {
    [v10 URLSession:v11 dataTask:v8 didReceiveData:v9];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(SSURLSessionManager *)self _delegateForTask:v10];
  if (objc_opt_respondsToSelector()) {
    [v13 URLSession:v14 dataTask:v10 didReceiveResponse:v11 completionHandler:v12];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SSURLSessionManager *)self _delegateForTask:v8];
  id v11 = [v8 _timingData];
  if (v11 && [(SSURLSessionManager *)self _sendTimingDataForSessionTask:v8])
  {
    id v12 = [(id)objc_opt_class() eventFromTimingData:v11 delegate:v10 session:v16 task:v8 error:v9];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v10 metricsLoadURLSamplingPercentageCachedResponses],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      id v14 = [v10 metricsLoadURLSamplingPercentageCachedResponses];
      [v14 doubleValue];
      BOOL v15 = +[SSMetricsLoadURLEvent shouldReportCachedEventWithSamplingPercentage:](SSMetricsLoadURLEvent, "shouldReportCachedEventWithSamplingPercentage:");
    }
    else
    {
      BOOL v15 = +[SSMetricsLoadURLEvent shouldReportCachedEvent];
    }
    if (![v12 connectionReused] || v15) {
      [(SSURLSessionManager *)self _insertEventIntoDatabase:v12 delegate:v10];
    }
  }
  else
  {
    id v12 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v10 URLSession:v16 task:v8 didCompleteWithEvent:v12 error:v9];
  }
  [(SSURLSessionManager *)self _removeDelegateForTask:v8];
  [(SSURLSessionManager *)self _setSendTimingData:0 forSessionTask:v8];
  [(SSURLSessionManager *)self _setTaskMetrics:0 forSessionTask:v8];
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  [(SSURLSessionManager *)self _setTaskMetrics:v9 forSessionTask:v8];
  if (SSIsInternalBuild())
  {
    id v10 = [(SSURLSessionManager *)self _requestDataForSessionTask:v8];
    id v11 = [(SSURLSessionManager *)self _responseDataForSessionTask:v8];
    id v12 = [(SSURLSessionManager *)self _delegateForTask:v8];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v12 URLSession:v21 task:v8 decodedDataForResponseData:v11];

      id v11 = (void *)v13;
    }
    if (SSDebugShouldDisableNetworkLogging()) {
      goto LABEL_15;
    }
    id v14 = [(SSURLSessionManager *)self httpArchiveBuffer];
    uint64_t v15 = [v14 maxSize];

    if (!v15) {
      goto LABEL_15;
    }
    id v16 = [[SSHTTPArchive alloc] initWithTaskMetrics:v9 requestData:v10 responseData:v11];
    if (objc_opt_respondsToSelector()) {
      [v12 URLSession:v21 task:v8 didFinishCreatingHTTPArchive:v16];
    }
    uint64_t v17 = [v8 response];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [v8 response];
      BOOL v19 = +[SSVCookieStorage responseHasSetCookies:v18];

      if (!v19)
      {
LABEL_12:
        if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
        {
          int v20 = [(SSURLSessionManager *)self httpArchiveBuffer];
          [v20 addObject:v16];
        }
LABEL_15:
        [(SSURLSessionManager *)self _removeResponseDataForSessionTask:v8];
        [(SSURLSessionManager *)self _setRequestData:0 forSessionTask:v8];
        [(SSURLSessionManager *)self _removeRecordResponseDataForSessionTask:v8];

        goto LABEL_16;
      }
      uint64_t v17 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      [(SSHTTPArchive *)v16 writeToDiskWithLogConfig:v17 compressed:0 error:0];
    }

    goto LABEL_12;
  }
LABEL_16:
  [(SSURLSessionManager *)self _logAPSResultsWithTask:v8];
  [(SSURLSessionManager *)self _logCacheHitForTask:v8 metrics:v9];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t, void))a6;
  uint64_t v13 = [(SSURLSessionManager *)self _delegateForTask:v10];
  if (objc_opt_respondsToSelector()) {
    [v13 URLSession:v14 task:v10 didReceiveChallenge:v11 completionHandler:v12];
  }
  else {
    v12[2](v12, 1, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v14 = a3;
  id v12 = a4;
  uint64_t v13 = [(SSURLSessionManager *)self _delegateForTask:v12];
  if (objc_opt_respondsToSelector()) {
    [v13 URLSession:v14 task:v12 didSendBodyData:a5 totalBytesSent:a6 totalBytesExpectedToSend:a7];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SSURLSessionManager *)self _delegateForTask:v8];
  if (objc_opt_respondsToSelector()) {
    [v10 URLSession:v11 task:v8 needNewBodyStream:v9];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(SSURLSessionManager *)self _delegateForTask:v12];
  if (objc_opt_respondsToSelector()) {
    [v16 URLSession:v17 task:v12 willPerformHTTPRedirection:v13 newRequest:v14 completionHandler:v15];
  }
}

+ (id)_legacyBagValueForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SSURLBagContext contextWithBagType:0];
  if (SSIsDaemon())
  {
    uint64_t v5 = SSViTunesStoreFramework();
    int v6 = objc_msgSend(SSVWeakLinkedClassForString(&cfstr_Isurlbagcache.isa, v5), "sharedCache");
    int v7 = [v6 URLBagForContext:v4];

    [v7 valueForKey:v3];
  }
  else
  {
    int v7 = +[SSURLBag URLBagForContext:v4];
    [v7 valueForKey:v3 error:0];
  id v8 = };

  return v8;
}

- (id)_delegateForTask:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__65;
  id v16 = __Block_byref_object_dispose__65;
  id v17 = 0;
  uint64_t v5 = [(SSURLSessionManager *)self taskDelegatesQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSURLSessionManager__delegateForTask___block_invoke;
  block[3] = &unk_1E5BA6F80;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__SSURLSessionManager__delegateForTask___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) taskDelegates];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)_DNSServerIPAddresses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (__res_9_state *)malloc_type_calloc(1uLL, 0x228uLL, 0x10B20402089BC1DuLL);
  if (!res_9_ninit(v3))
  {
    id v4 = (res_9_sockaddr_union *)malloc_type_malloc((uint64_t)v3->nscount << 7, 0x1000040AE2C30F4uLL);
    res_9_getservers(v3, v4, v3->nscount);
    if (v3->nscount)
    {
      unint64_t v5 = 0;
      id v6 = &v4->__space[4];
      while (1)
      {
        int v7 = *(v6 - 3);
        if (v7 == 30) {
          break;
        }
        if (v7 == 2)
        {
          int v8 = 2;
          id v9 = v6;
          socklen_t v10 = 16;
          goto LABEL_8;
        }
LABEL_10:
        ++v5;
        v6 += 128;
        if (v5 >= v3->nscount) {
          goto LABEL_11;
        }
      }
      id v9 = v6 + 4;
      int v8 = 30;
      socklen_t v10 = 46;
LABEL_8:
      inet_ntop(v8, v9, v15, v10);
      id v11 = [NSString stringWithUTF8String:v15];
      if (v11)
      {
        [v2 addObject:v11];
      }
      goto LABEL_10;
    }
LABEL_11:
    free(v4);
  }
  res_9_ndestroy(v3);
  free(v3);
  if ([v2 count]) {
    uint64_t v12 = v2;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (unint64_t)_messageSizeFromTask:(id)a3 isRequest:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v32 = 0;
  int v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  if (v6)
  {
    id v9 = [v7 originalRequest];
    if (v9)
    {
LABEL_3:
      socklen_t v10 = [v9 allHTTPHeaderFields];
      id v11 = [v9 HTTPBody];
      uint64_t v12 = [v11 length];

      id v13 = [v9 HTTPMethod];
      uint64_t v14 = [v13 length];
      v33[3] += v14 + 1;

      id v15 = [v9 URL];
      uint64_t v16 = [v15 path];
      uint64_t v17 = [v16 length];
      v33[3] += v17;

      id v18 = [v9 URL];
      BOOL v19 = [v18 query];

      if (v19)
      {
        int v20 = [v9 URL];
        id v21 = [v20 query];
        uint64_t v22 = [v21 length];
        v33[3] += v22 + 2;
      }
      v33[3] += 10;
      goto LABEL_22;
    }
    getISURLOperationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 activeURLRequest];
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_3;
    }
LABEL_19:
    id v9 = 0;
    goto LABEL_25;
  }
  id v9 = [v7 response];
  if (!v9)
  {
    getISURLOperationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    id v9 = [v8 response];
    if (!v9) {
      goto LABEL_25;
    }
  }
  socklen_t v10 = [v9 allHeaderFields];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8 rawResponseData], v23 = objc_claimAutoreleasedReturnValue(), (uint64_t v24 = v23) != 0))
  {
    uint64_t v12 = [v23 length];
  }
  else
  {
    uint64_t v12 = [v9 expectedContentLength];
    uint64_t v24 = 0;
  }
  [v9 _CFURLResponse];
  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
  uint64_t v26 = (__CFString *)CFHTTPMessageCopyResponseStatusLine(HTTPResponse);
  int v27 = v26;
  if (v26)
  {
    uint64_t v28 = [(__CFString *)v26 length];
    v33[3] += v28 + 2;
    CFRelease(v27);
  }
  else
  {
    v33[3] += 15;
  }

LABEL_22:
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __63__SSURLSessionManager__messageSizeFromTask_isRequest_delegate___block_invoke;
  v31[3] = &unk_1E5BAD9F0;
  v31[4] = &v32;
  [v10 enumerateKeysAndObjectsUsingBlock:v31];
  uint64_t v29 = v12 + 2;
  if (!v12) {
    uint64_t v29 = 0;
  }
  id v9 = (void *)(v33[3] + v29 + 2);
  v33[3] = (uint64_t)v9;

LABEL_25:
  _Block_object_dispose(&v32, 8);

  return (unint64_t)v9;
}

void __63__SSURLSessionManager__messageSizeFromTask_isRequest_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [a2 length];
  uint64_t v6 = [v5 length];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v6;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += 4;
}

- (void)_logCacheHitForTask:(id)a3 metrics:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_logCacheHitForTask_metrics__onceToken != -1) {
    dispatch_once(&_logCacheHitForTask_metrics__onceToken, &__block_literal_global_82);
  }
  if ([(id)_logCacheHitForTask_metrics__cacheConfig debugLogsEnabled])
  {
    id v8 = [v7 transactionMetrics];
    id v9 = [v8 lastObject];

    socklen_t v10 = [v9 response];
    objc_opt_class();
    id v11 = SSSafeCast((uint64_t)v10);
    if ([v11 statusCode] >= 200 && objc_msgSend(v11, "statusCode") <= 299)
    {
      uint64_t v12 = [v9 resourceFetchType];
      id v13 = @"NO";
      if (v12 == 3) {
        id v13 = @"YES";
      }
      uint64_t v29 = v13;
      uint64_t v14 = [v11 allHeaderFields];
      uint64_t v28 = [v14 objectForKeyedSubscript:@"Cache-Control"];

      id v15 = [(SSURLSessionManager *)self _delegateForTask:v6];
      id v16 = (id)_logCacheHitForTask_metrics__cacheConfig;
      if (!v16)
      {
        id v16 = +[SSLogConfig sharedConfig];
      }
      int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        v17 |= 2u;
      }
      id v18 = [v16 OSLogObject];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        v17 &= 2u;
      }
      if (v17)
      {
        [v10 URL];
        int v30 = 138413058;
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v32 = 2112;
        int v33 = v15;
        __int16 v34 = 2112;
        uint64_t v35 = v28;
        __int16 v36 = 2112;
        v37 = v29;
        LODWORD(v27) = 42;
        BOOL v19 = (void *)_os_log_send_and_compose_impl();

        if (v19)
        {
          int v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v30, v27);
          free(v19);
          SSFileLog(v16, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
        }
      }
      else
      {
      }
    }
  }
}

void __51__SSURLSessionManager__logCacheHitForTask_metrics___block_invoke()
{
  id v2 = objc_alloc_init(SSMutableLogConfig);
  [(SSLogConfig *)v2 setSubsystem:@"com.apple.StoreServices"];
  [(SSLogConfig *)v2 setCategory:@"urlcache"];
  [(SSLogConfig *)v2 setEnvironment:2];
  uint64_t v0 = [(SSMutableLogConfig *)v2 copy];
  id v1 = (void *)_logCacheHitForTask_metrics__cacheConfig;
  _logCacheHitForTask_metrics__cacheConfig = v0;
}

- (int)_PIDFromAuditTokenData:(id)a3
{
  if (a3) {
    return *((_DWORD *)CFDataGetBytePtr((CFDataRef)a3) + 5);
  }
  else {
    return 0;
  }
}

- (void)_removeDelegateForTask:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(SSURLSessionManager *)self taskDelegatesQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SSURLSessionManager__removeDelegateForTask___block_invoke;
    block[3] = &unk_1E5BA8860;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_barrier_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __46__SSURLSessionManager__removeDelegateForTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained taskDelegates];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

+ (id)_responseDateFromTask:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = [a3 response];
  if (!v6)
  {
    getISURLOperationClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 response];
    }
    else
    {
      id v6 = 0;
    }
  }
  id v7 = [v6 allHeaderFields];
  id v8 = [v7 objectForKey:@"Date"];

  return v8;
}

- (BOOL)_sendTimingDataForSessionTask:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__65;
  id v15 = __Block_byref_object_dispose__65;
  id v16 = 0;
  id v5 = [(SSURLSessionManager *)self sendTimingDataQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SSURLSessionManager__sendTimingDataForSessionTask___block_invoke;
  block[3] = &unk_1E5BA6F80;
  socklen_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(v5, block);

  LOBYTE(v4) = [(id)v12[5] BOOLValue];
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

void __53__SSURLSessionManager__sendTimingDataForSessionTask___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sendTimingDataMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_sessionWithDelegate:(id)a3 collectTimingData:(BOOL *)a4
{
  id v6 = a3;
  BOOL v7 = [(SSURLSessionManager *)self _shouldEnableTLSSessionForDelegate:v6];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v6 metricsLoadURLSessionDuration];
  }
  else
  {
    id v8 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v6 metricsLoadURLSamplingPercentage];
    socklen_t v10 = (void *)v9;
    if (v8 && v9)
    {
      [v8 doubleValue];
      double v12 = v11;
      [v10 doubleValue];
      BOOL v14 = +[SSMetricsLoadURLEvent shouldCollectTimingDataWithSessionDuration:v12 samplingPercentage:v13];
      goto LABEL_10;
    }
  }
  else
  {
    socklen_t v10 = 0;
  }
  BOOL v14 = +[SSMetricsLoadURLEvent shouldCollectTimingDataWithSessionDelegate:v6];
LABEL_10:
  BOOL v15 = v14;
  id v16 = [(SSURLSessionManager *)self _sessionIDWithDelegate:v6 collectTimingData:v14 allowsTLSSessionTickets:v7];
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x3032000000;
  __int16 v34 = __Block_byref_object_copy__65;
  uint64_t v35 = __Block_byref_object_dispose__65;
  id v36 = 0;
  int v17 = [(SSURLSessionManager *)self sessionsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke;
  block[3] = &unk_1E5BA6F80;
  int v30 = &v31;
  void block[4] = self;
  id v18 = v16;
  id v29 = v18;
  dispatch_sync(v17, block);

  if (!v32[5])
  {
    BOOL v19 = [(SSURLSessionManager *)self sessionsQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke_2;
    v22[3] = &unk_1E5BADA18;
    uint64_t v25 = &v31;
    v22[4] = self;
    id v23 = v18;
    id v24 = v6;
    BOOL v26 = v15;
    BOOL v27 = v7;
    dispatch_barrier_sync(v19, v22);
  }
  if (a4) {
    *a4 = v15;
  }
  id v20 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v20;
}

void __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sessions];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sessions];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v6 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      v8 &= 2u;
    }
    if (v8)
    {
      socklen_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)id v29 = 138412546;
      *(void *)&v29[4] = v10;
      *(_WORD *)&v29[12] = 2112;
      *(void *)&v29[14] = v11;
      id v12 = v10;
      LODWORD(v28) = 22;
      double v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        id v20 = objc_opt_new();
        [v20 setMaxConcurrentOperationCount:5];
        uint64_t v21 = (void *)MEMORY[0x1E4F290E0];
        uint64_t v22 = [*(id *)(a1 + 32) _sessionConfigurationWithDelegate:*(void *)(a1 + 48) collectTimingData:*(unsigned __int8 *)(a1 + 64) allowsTLSSessionTickets:*(unsigned __int8 *)(a1 + 65)];
        uint64_t v23 = [v21 sessionWithConfiguration:v22 delegate:*(void *)(a1 + 32) delegateQueue:v20];
        uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;

        uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        BOOL v27 = [*(id *)(a1 + 32) sessions];
        [v27 setObject:v26 forKeyedSubscript:*(void *)(a1 + 40)];

        return;
      }
      uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v29, v28, *(_OWORD *)v29, *(void *)&v29[16]);
      free(v13);
      SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v9);
    }

    goto LABEL_13;
  }
}

- (id)_sessionIDWithDelegate:(id)a3 collectTimingData:(BOOL)a4 allowsTLSSessionTickets:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F28E78] stringWithString:@"com.apple.itunesstore"];
  if (objc_opt_respondsToSelector())
  {
    socklen_t v10 = [v8 sourceAppBundleID];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v12 = [v8 sourceAppBundleID];
      [v9 appendFormat:@".client-%@", v12];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    double v13 = [v8 sourceAppAuditTokenData];

    if (v13)
    {
      uint64_t v14 = [v8 sourceAppAuditTokenData];
      objc_msgSend(v9, "appendFormat:", @".auditToken-%d-%ld", -[SSURLSessionManager _PIDFromAuditTokenData:](self, "_PIDFromAuditTokenData:", v14), objc_msgSend(v14, "hash"));
    }
  }
  if ([(SSURLSessionManager *)self _shouldSetCookiesForDelegate:v8]) {
    [v9 appendString:@".setcookies"];
  }
  if (v6) {
    [v9 appendString:@".collecttimingdata"];
  }
  if ([(SSURLSessionManager *)self _shouldRequireCelluarForDelegate:v8])
  {
    uint64_t v15 = @".requirescellular";
  }
  else
  {
    if ([(SSURLSessionManager *)self _shouldDisableCellularForDelegate:v8]) {
      goto LABEL_16;
    }
    uint64_t v15 = @".allowscellular";
  }
  [v9 appendString:v15];
LABEL_16:
  uint64_t v16 = [(SSURLSessionManager *)self _URLCacheIDForDelegate:v8];
  if ([v16 length]) {
    [v9 appendFormat:@".cache-%@", v16];
  }
  if (v5) {
    [v9 appendString:@".allowstls"];
  }

  return v9;
}

- (id)_sessionConfigurationWithDelegate:(id)a3 collectTimingData:(BOOL)a4 allowsTLSSessionTickets:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  if ([(SSURLSessionManager *)self _shouldRequireCelluarForDelegate:v8])
  {
    objc_msgSend(v9, "set_CTDataConnectionServiceType:", *MEMORY[0x1E4F23D58]);
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = [(SSURLSessionManager *)self _shouldDisableCellularForDelegate:v8] ^ 1;
  }
  [v9 setAllowsCellularAccess:v10];
  objc_msgSend(v9, "set_allowsTLSSessionTickets:", v5);
  objc_msgSend(v9, "setHTTPShouldSetCookies:", -[SSURLSessionManager _shouldSetCookiesForDelegate:](self, "_shouldSetCookiesForDelegate:", v8));
  [v9 setHTTPShouldUsePipelining:1];
  if (v6) {
    objc_msgSend(v9, "set_timingDataOptions:", 7);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v8 sourceAppBundleID];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      double v13 = [v8 sourceAppBundleID];
      objc_msgSend(v9, "set_sourceApplicationBundleIdentifier:", v13);

      objc_msgSend(v9, "set_infersDiscretionaryFromOriginatingClient:", 1);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [v8 sourceAppAuditTokenData];

    if (v14)
    {
      uint64_t v15 = [v8 sourceAppAuditTokenData];
      objc_msgSend(v9, "set_sourceApplicationAuditTokenData:", v15);

      objc_msgSend(v9, "set_infersDiscretionaryFromOriginatingClient:", 1);
    }
  }
  uint64_t v16 = [(SSURLSessionManager *)self _URLCacheForDelegate:v8];
  if (v16
    || [(id)objc_opt_class() _shouldCreateLocalCache]
    && (uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F29078]) initWithMemoryCapacity:0 diskCapacity:20971520 diskPath:@"StoreServices"]) != 0)
  {
    [v9 setURLCache:v16];
  }
  if ([(NSArray *)self->_customURLProtocols count])
  {
    uint64_t v17 = (void *)[(NSArray *)self->_customURLProtocols mutableCopy];
    uint64_t v18 = [v17 count];
    if (v18 - 1 >= 0)
    {
      uint64_t v19 = v18;
      do
      {
        if ((objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", --v19), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)objc_msgSend(v17, "removeObjectAtIndex:", v19); {
      }
        }
      while (v19 > 0);
    }
    id v20 = [v9 protocolClasses];
    [v17 addObjectsFromArray:v20];

    uint64_t v21 = (void *)[v17 copy];
    [v9 setProtocolClasses:v21];
  }
  return v9;
}

- (void)_setDelegate:(id)a3 forTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(SSURLSessionManager *)self taskDelegatesQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__SSURLSessionManager__setDelegate_forTask___block_invoke;
    v10[3] = &unk_1E5BA9318;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    id v12 = v8;
    dispatch_barrier_async(v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __44__SSURLSessionManager__setDelegate_forTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained taskDelegates];
  [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (void)_setSendTimingData:(id)a3 forSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SSURLSessionManager *)self sendTimingDataQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__SSURLSessionManager__setSendTimingData_forSessionTask___block_invoke;
  v11[3] = &unk_1E5BA9318;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __57__SSURLSessionManager__setSendTimingData_forSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  uint64_t v4 = [WeakRetained sendTimingDataMap];
  BOOL v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else {
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)_setTaskMetrics:(id)a3 forSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SSURLSessionManager *)self taskMetricsQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SSURLSessionManager__setTaskMetrics_forSessionTask___block_invoke;
  v11[3] = &unk_1E5BA9318;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__SSURLSessionManager__setTaskMetrics_forSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  uint64_t v4 = [WeakRetained taskMetrics];
  BOOL v5 = v4;
  if (v3) {
    [v4 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
  }
  else {
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

+ (BOOL)_shouldCreateLocalCache
{
  uint64_t v2 = [MEMORY[0x1E4F29078] sharedURLCache];
  BOOL v3 = [v2 diskCapacity] == 0;

  return v3;
}

- (BOOL)_shouldDisableCellularForDelegate:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldDisableCellular];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldRequireCelluarForDelegate:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldRequireCellular];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldEnableTLSSessionForDelegate:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  char v4 = (void *)CFPreferencesCopyAppValue(@"TLSLastSampleDate", @"com.apple.itunesstored");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"TLSLastSampleResult", @"com.apple.itunesstored", 0);
  id v6 = [(id)objc_opt_class() bagValueForKey:@"TLSSamplingPercentage" delegate:v3 type:3];
  [v6 doubleValue];
  double v8 = v7;

  id v9 = [(id)objc_opt_class() bagValueForKey:@"TLSSamplingSessionDuration" delegate:v3 type:3];

  [v9 doubleValue];
  double v11 = v10;

  id v12 = [MEMORY[0x1E4F1C9C8] date];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (BOOL v13 = AppBooleanValue != 0,
        [v4 dateByAddingTimeInterval:v11 / 1000.0],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v12 compare:v14],
        v14,
        v15 != -1))
  {
    [(id)objc_opt_class() _randomDouble];
    if (v16 == 0.0)
    {
      BOOL v13 = 0;
    }
    else
    {
      double v17 = v16;
      CFPreferencesSetAppValue(@"TLSLastSampleDate", v12, @"com.apple.itunesstored");
      BOOL v13 = v17 <= v8;
      uint64_t v18 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
      if (v17 > v8) {
        uint64_t v18 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
      }
      CFPreferencesSetAppValue(@"TLSLastSampleResult", *v18, @"com.apple.itunesstored");
    }
  }

  return v13;
}

- (BOOL)_shouldSetCookiesForDelegate:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldSetCookies];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)_taskMetricsForSessionTask:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__65;
  uint64_t v18 = __Block_byref_object_dispose__65;
  id v19 = 0;
  objc_initWeak(&location, self);
  BOOL v5 = [(SSURLSessionManager *)self taskMetricsQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SSURLSessionManager__taskMetricsForSessionTask___block_invoke;
  v9[3] = &unk_1E5BADA40;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  double v11 = &v14;
  id v6 = v4;
  dispatch_sync(v5, v9);

  id v7 = (id)v15[5];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __50__SSURLSessionManager__taskMetricsForSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained taskMetrics];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)_tidStateForTask:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = [a3 originalRequest];
  if (v6) {
    goto LABEL_2;
  }
  getISURLOperationClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 activeURLRequest];
    if (v6)
    {
LABEL_2:
      id v7 = [v6 allHTTPHeaderFields];
      double v8 = [v7 objectForKey:@"X-Apple-TID-State"];

      goto LABEL_8;
    }
  }
  else
  {
    id v6 = 0;
  }
  double v8 = 0;
LABEL_8:

  return v8;
}

- (id)_URLCacheForDelegate:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 URLCacheID],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = [v3 URLCache];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_URLCacheIDForDelegate:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v4 = [v3 URLCache];

  if (!v4) {
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 URLCacheID];
  }
  else
  {
LABEL_5:
    uint64_t v4 = 0;
  }
LABEL_6:

  return v4;
}

- (void)_appendResponseData:(id)a3 forSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    double v8 = (void *)[v6 copy];
    objc_initWeak(&location, self);
    id v9 = [(SSURLSessionManager *)self responseDataQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__SSURLSessionManager__appendResponseData_forSessionTask___block_invoke;
    v11[3] = &unk_1E5BA9318;
    objc_copyWeak(&v14, &location);
    id v12 = v7;
    id v13 = v8;
    id v10 = v8;
    dispatch_barrier_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __58__SSURLSessionManager__appendResponseData_forSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained responseData];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    uint64_t v4 = [WeakRetained responseData];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  [v3 appendData:*(void *)(a1 + 40)];
}

+ (BOOL)_fetchedFromCache:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 sharedManager];
  id v6 = [v5 _taskMetricsForSessionTask:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = objc_msgSend(v6, "transactionMetrics", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) resourceFetchType] == 3)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)_fetchNetworkQualityReports
{
  id v3 = +[SSNetworkQualityInquiry sharedInstance];
  id v4 = [v3 investigateNetworks];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SSURLSessionManager__fetchNetworkQualityReports__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a1;
  [v4 addErrorBlock:v7];
  uint64_t v5 = [v4 resultWithTimeout:0 error:10.0];

  return v5;
}

void __50__SSURLSessionManager__fetchNetworkQualityReports__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  *(_DWORD *)uint64_t v16 = 138412546;
  *(void *)&v16[4] = objc_opt_class();
  *(_WORD *)&v16[12] = 2112;
  *(void *)&v16[14] = v2;
  id v7 = *(id *)&v16[4];
  LODWORD(v15) = 22;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16], v17);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:
  }
}

- (void)_listenForLowMemoryWarning
{
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14468], 0, 3uLL, 0);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v3;

  if (self->_memoryPressureSource)
  {
    objc_initWeak(&location, self);
    int v5 = self->_memoryPressureSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__SSURLSessionManager__listenForLowMemoryWarning__block_invoke;
    handler[3] = &unk_1E5BA8860;
    objc_copyWeak(&v7, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__SSURLSessionManager__listenForLowMemoryWarning__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 16);
  *(_DWORD *)(v3 + 16) = dispatch_source_get_data(*(dispatch_source_t *)(v3 + 8));
  int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
  if (v4 == v5) {
    goto LABEL_31;
  }
  if (v5 == 1)
  {
    uint64_t v25 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v25)
    {
      uint64_t v25 = +[SSLogConfig sharedConfig];
    }
    int v26 = [v25 shouldLog];
    if ([v25 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    uint64_t v28 = [v25 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      *(_DWORD *)uint64_t v38 = 138412290;
      *(void *)&v38[4] = objc_opt_class();
      id v29 = *(id *)&v38[4];
      LODWORD(v37) = 12;
      uint64_t v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_28:

        uint64_t v12 = [WeakRetained httpArchiveBuffer];
        [v12 setMaxSize:*(void *)(*(void *)(a1 + 32) + 24)];
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, v38, v37, *(void *)v38, *(void *)&v38[8]);
      free(v30);
      SSFileLog(v25, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v28);
    }

    goto LABEL_28;
  }
  if (v5 == 2)
  {
    id v6 = [WeakRetained httpArchiveBuffer];
    *(void *)(*(void *)(a1 + 32) + 24) = [v6 maxSize];

    id v7 = [WeakRetained httpArchiveBuffer];
    unint64_t v8 = [v7 count];

    if (v8 >= 0x28) {
      uint64_t v9 = 20;
    }
    else {
      uint64_t v9 = v8 >> 1;
    }
    uint64_t v10 = [WeakRetained httpArchiveBuffer];
    [v10 setMaxSize:v9];

    uint64_t v11 = [WeakRetained httpArchiveBuffer];
    [v11 setMaxSize:20];

    uint64_t v12 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v12)
    {
      uint64_t v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    uint64_t v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      v14 &= 2u;
    }
    if (v14)
    {
      *(_DWORD *)uint64_t v38 = 138412546;
      *(void *)&v38[4] = objc_opt_class();
      *(_WORD *)&v38[12] = 2048;
      *(void *)&v38[14] = v8 - v9;
      id v16 = *(id *)&v38[4];
      LODWORD(v37) = 22;
      uint64_t v17 = (void *)_os_log_send_and_compose_impl();

      if (v17)
      {
        uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, v38, v37, *(_OWORD *)v38, *(void *)&v38[16], v39);
        free(v17);
        SSFileLog(v12, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
      }
    }
    else
    {
    }
    goto LABEL_30;
  }
LABEL_31:
}

+ (double)_randomDouble
{
  if (_randomDouble_onceToken != -1) {
    dispatch_once(&_randomDouble_onceToken, &__block_literal_global_164);
  }
  return drand48();
}

void __36__SSURLSessionManager__randomDouble__block_invoke()
{
  uint64_t v0 = arc4random();
  srand48(v0);
}

- (void)_removeRecordResponseDataForSessionTask:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    objc_initWeak(&location, self);
    int v5 = [(SSURLSessionManager *)self recordResponseQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SSURLSessionManager__removeRecordResponseDataForSessionTask___block_invoke;
    block[3] = &unk_1E5BA8860;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_barrier_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __63__SSURLSessionManager__removeRecordResponseDataForSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained recordResponseMap];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)_removeResponseDataForSessionTask:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    objc_initWeak(&location, self);
    int v5 = [(SSURLSessionManager *)self responseDataQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SSURLSessionManager__removeResponseDataForSessionTask___block_invoke;
    block[3] = &unk_1E5BA8860;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_barrier_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __57__SSURLSessionManager__removeResponseDataForSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained responseData];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (id)_requestDataForSessionTask:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__65;
    uint64_t v15 = __Block_byref_object_dispose__65;
    id v16 = 0;
    int v5 = [(SSURLSessionManager *)self requestDataQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SSURLSessionManager__requestDataForSessionTask___block_invoke;
    block[3] = &unk_1E5BA6F80;
    uint64_t v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __50__SSURLSessionManager__requestDataForSessionTask___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) requestData];
  id v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_responseDataForSessionTask:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__65;
    uint64_t v15 = __Block_byref_object_dispose__65;
    id v16 = 0;
    int v5 = [(SSURLSessionManager *)self responseDataQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SSURLSessionManager__responseDataForSessionTask___block_invoke;
    block[3] = &unk_1E5BA6F80;
    uint64_t v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __51__SSURLSessionManager__responseDataForSessionTask___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) responseData];
  id v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_saveHTTPArchiveBufferToDiskDecompressed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (![(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    uint64_t v25 = 0;
    goto LABEL_25;
  }
  int v5 = [(SSURLSessionManager *)self httpArchiveBuffer];
  id v6 = [v5 allObjects];

  if ([v6 count])
  {
    id v7 = +[SSHTTPArchive merge:v6 withEstimatedFileSizeLimit:4000];

    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v34 = 134217984;
      uint64_t v35 = [v7 count];
      LODWORD(v28) = 12;
      int v27 = &v34;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_14:

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v6 = v7;
        uint64_t v19 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v30;
          BOOL v22 = !v3;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v30 != v21) {
                objc_enumerationMutation(v6);
              }
              objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "writeToDiskWithLogConfig:compressed:error:", 0, v22, 0, v27);
            }
            uint64_t v20 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v20);
        }

        uint64_t v24 = dispatch_get_global_queue(-32768, 0);
        dispatch_async(v24, &__block_literal_global_166);

        uint64_t v25 = +[SSHTTPArchive outputDirectoryForLogConfig:0];
        goto LABEL_24;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v34, v28);
      free(v12);
      SSFileLog(v8, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
    }

    goto LABEL_14;
  }
  uint64_t v25 = 0;
LABEL_24:

LABEL_25:
  return v25;
}

void __64__SSURLSessionManager__saveHTTPArchiveBufferToDiskDecompressed___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9C8] date];
  id v1 = [v0 dateByAddingTimeInterval:-2419200.0];

  +[SSHTTPArchive removeLogsWithLogConfig:0 olderThanDate:v1];
}

- (void)_setRequestData:(id)a3 forSessionTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    id v8 = (void *)[v6 copy];
    objc_initWeak(&location, self);
    int v9 = [(SSURLSessionManager *)self requestDataQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__SSURLSessionManager__setRequestData_forSessionTask___block_invoke;
    v11[3] = &unk_1E5BA9318;
    objc_copyWeak(&v14, &location);
    id v12 = v8;
    id v13 = v7;
    id v10 = v8;
    dispatch_barrier_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __54__SSURLSessionManager__setRequestData_forSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  uint64_t v4 = [WeakRetained requestData];
  int v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else {
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

+ (BOOL)_shouldCollectNetworkLogs
{
  if (_shouldCollectNetworkLogs_onceToken != -1) {
    dispatch_once(&_shouldCollectNetworkLogs_onceToken, &__block_literal_global_168);
  }
  return (_shouldCollectNetworkLogs_shouldCollectLogs & 1) == 0;
}

void __48__SSURLSessionManager__shouldCollectNetworkLogs__block_invoke()
{
  if ((SSIsInternalBuild() & 1) != 0 && !SSDebugShouldDisableNetworkLogging())
  {
    uint64_t v0 = +[SSLogConfig sharedConfig];
    id v4 = [v0 outputDirectory];

    id v1 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v2 = [v1 fileExistsAtPath:v4];

    if ((v2 & 1) == 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
    }
    if (!SSFileIsLocalWritable(v4)) {
      _shouldCollectNetworkLogs_shouldCollectLogs = 1;
    }
  }
  else
  {
    _shouldCollectNetworkLogs_shouldCollectLogs = 1;
  }
}

- (BOOL)_shouldRecordResponseBodyForDataTask:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldCollectNetworkLogs])
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__65;
    int v26 = __Block_byref_object_dispose__65;
    id v27 = 0;
    int v5 = [(SSURLSessionManager *)self recordResponseQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke;
    block[3] = &unk_1E5BA6F80;
    uint64_t v21 = &v22;
    void block[4] = self;
    id v6 = v4;
    id v20 = v6;
    dispatch_sync(v5, block);

    id v7 = (void *)v23[5];
    if (v7)
    {
      char v8 = [v7 BOOLValue];
    }
    else
    {
      int v9 = [v6 response];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v11 = [v6 response];
        id v12 = [v11 MIMEType];
        id v13 = [v12 lowercaseString];

        if ([v13 containsString:@"image"])
        {
          char v8 = 0;
        }
        else if (([v13 isEqualToString:@"application/json"] & 1) != 0 {
               || ([v13 isEqualToString:@"application/javascript"] & 1) != 0
        }
               || ([v13 isEqualToString:@"application/x-javascript"] & 1) != 0
               || ([v13 isEqualToString:@"text/html"] & 1) != 0
               || ([v13 isEqualToString:@"text/xml"] & 1) != 0)
        {
          char v8 = 1;
        }
        else
        {
          char v8 = [v13 isEqualToString:@"text/xml+itml"];
        }
        id v14 = [(SSURLSessionManager *)self recordResponseQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke_2;
        v16[3] = &unk_1E5BADA88;
        v16[4] = self;
        id v17 = v6;
        char v18 = v8;
        dispatch_barrier_sync(v14, v16);
      }
      else
      {
        char v8 = 0;
      }
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

void __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) recordResponseMap];
  char v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke_2(uint64_t a1)
{
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  char v2 = [*(id *)(a1 + 32) recordResponseMap];
  [v2 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)_logAPSResultsWithTask:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SSURLSessionManager *)self _taskMetricsForSessionTask:v4];
  id v6 = [v5 transactionMetrics];
  id v7 = [v6 lastObject];

  if ([v7 _apsRelayAttempted])
  {
    if ([v7 _apsRelaySucceeded]) {
      char v8 = @"YES";
    }
    else {
      char v8 = @"NO";
    }
    long long v29 = v8;
    if ([v7 _apsRelayAttempted]) {
      int v9 = @"YES";
    }
    else {
      int v9 = @"NO";
    }
    id v10 = v9;
    uint64_t v11 = [v4 originalRequest];
    id v12 = [v11 URL];
    id v13 = [v12 absoluteString];

    id v14 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    id v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      int v30 = 138544130;
      id v31 = (id)objc_opt_class();
      __int16 v32 = 2114;
      uint64_t v33 = v10;
      __int16 v34 = 2114;
      uint64_t v35 = v29;
      __int16 v36 = 2112;
      uint64_t v37 = v13;
      id v19 = v31;
      LODWORD(v28) = 42;
      id v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        uint64_t v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v30, v28);
        free(v20);
        SSFileLog(v14, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v21);
      }
    }
    else
    {
    }
  }
}

- (void)_setAPSTopicWithTask:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SSURLSessionManager *)self _shouldEnableAPSRWithTask:v4])
  {
    int v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      int v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    char v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      LODWORD(v18) = 138543362;
      *(void *)((char *)&v18 + 4) = objc_opt_class();
      id v9 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        objc_msgSend(v4, "set_APSRelayTopic:", @"com.apple.private.alloy.itunes.apsr");
        goto LABEL_14;
      }
      char v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v18, v17, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (BOOL)_shouldEnableAPSRWithTask:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SSURLSessionManager *)self _delegateForTask:v4];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 requestProperties];
  }
  else
  {
    int v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v5 isURLBagRequest] & 1) != 0
    || ([v6 shouldDisableReversePush] & 1) != 0)
  {
    goto LABEL_9;
  }
  uint64_t v7 = [MEMORY[0x1E4F4DC40] reversePushEnabled];
  if (v7 == 1) {
    goto LABEL_13;
  }
  if (v7 == 2)
  {
LABEL_9:
    LOBYTE(v8) = 0;
    goto LABEL_35;
  }
  if ([v6 shouldDisableReversePushSampling]) {
    goto LABEL_13;
  }
  [(id)objc_opt_class() _randomDouble];
  double v10 = v9;
  uint64_t v11 = [(id)objc_opt_class() bagValueForKey:@"aps-sampling-percentage" delegate:v5 type:3];
  [v11 doubleValue];
  double v13 = v12;

  LOBYTE(v8) = 0;
  if (v10 > 0.0 && v10 <= v13)
  {
LABEL_13:
    uint64_t v14 = [v4 originalRequest];
    uint64_t v15 = [v14 URL];

    if (!v15)
    {
      uint64_t v15 = [v6 URL];
      if (!v15)
      {
        uint64_t v24 = [v6 URLBagKey];
        if (!v24) {
          goto LABEL_9;
        }
        uint64_t v25 = (void *)v24;
        uint64_t v15 = [(id)objc_opt_class() bagValueForKey:v24 delegate:v5 type:6];

        if (!v15) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v16 = [v15 absoluteString];
    uint64_t v17 = [(id)objc_opt_class() bagValueForKey:@"aps-enabled-patterns" delegate:v5 type:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32[0] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v19 = 0;
        goto LABEL_21;
      }
      id v18 = v17;
    }
    uint64_t v19 = v18;
LABEL_21:
    if (![v19 count])
    {

      uint64_t v19 = &unk_1EF9A99D8;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = v19;
    uint64_t v8 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v26 = v15;
      uint64_t v21 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v20);
          }
          if ([v16 rangeOfString:*(void *)(*((void *)&v27 + 1) + 8 * i) options:1024] != 0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v8) = 1;
            goto LABEL_33;
          }
        }
        uint64_t v8 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_33:
      uint64_t v15 = v26;
    }
  }
LABEL_35:

  return v8;
}

+ (id)_bagPerformanceValuesWithDelegate:(id)a3
{
  id v3 = [a1 _metricsDictionaryWithDelegate:a3];
  id v4 = [v3 objectForKeyedSubscript:@"performance"];

  return v4;
}

+ (id)_metricsDictionaryWithDelegate:(id)a3
{
  return (id)[a1 bagValueForKey:@"metrics" delegate:a3 type:2];
}

+ (id)bagValueForKey:(id)a3 delegate:(id)a4 type:(unint64_t)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v9 bag], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v11 = (void *)v10;
    if (objc_opt_respondsToSelector()) {
      char v12 = [v9 isURLBagRequest];
    }
    else {
      char v12 = 0;
    }
    long long v29 = [v11 profileConfig];
    long long v30 = [v29 bagKeys];
    int v31 = [v30 containsObject:v8];

    uint64_t v14 = @"YES";
    if ((v12 & 1) != 0 || !v31) {
      goto LABEL_7;
    }
    switch(a5)
    {
      case 0uLL:
        uint64_t v57 = 0;
        __int16 v32 = (id *)&v57;
        uint64_t v33 = [v11 arrayForKey:v8 error:&v57];
        goto LABEL_34;
      case 1uLL:
        uint64_t v56 = 0;
        __int16 v32 = (id *)&v56;
        uint64_t v33 = [v11 BOOLForKey:v8 error:&v56];
        goto LABEL_34;
      case 2uLL:
        uint64_t v55 = 0;
        __int16 v32 = (id *)&v55;
        uint64_t v33 = [v11 dictionaryForKey:v8 error:&v55];
        goto LABEL_34;
      case 3uLL:
        uint64_t v54 = 0;
        __int16 v32 = (id *)&v54;
        uint64_t v33 = [v11 doubleForKey:v8 error:&v54];
        goto LABEL_34;
      case 4uLL:
        uint64_t v53 = 0;
        __int16 v32 = (id *)&v53;
        uint64_t v33 = [v11 integerForKey:v8 error:&v53];
        goto LABEL_34;
      case 5uLL:
        uint64_t v52 = 0;
        __int16 v32 = (id *)&v52;
        uint64_t v33 = [v11 stringForKey:v8 error:&v52];
        goto LABEL_34;
      case 6uLL:
        uint64_t v51 = 0;
        __int16 v32 = (id *)&v51;
        uint64_t v33 = [v11 URLForKey:v8 error:&v51];
LABEL_34:
        double v13 = (void *)v33;
        __int16 v34 = (__CFString *)*v32;
        if (!v34) {
          break;
        }
        uint64_t v35 = v34;
        __int16 v36 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v36)
        {
          __int16 v36 = +[SSLogConfig sharedConfig];
        }
        int v37 = [v36 shouldLog];
        if ([v36 shouldLogToDisk]) {
          int v38 = v37 | 2;
        }
        else {
          int v38 = v37;
        }
        uint64_t v39 = [v36 OSLogObject];
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          v38 &= 2u;
        }
        if (!v38) {
          goto LABEL_45;
        }
        uint64_t v40 = objc_opt_class();
        int v58 = 138412802;
        v59 = v40;
        __int16 v60 = 2112;
        id v61 = v8;
        __int16 v62 = 2112;
        id v63 = v35;
        id v41 = v40;
        LODWORD(v50) = 32;
        uint64_t v49 = &v58;
        uint64_t v42 = (void *)_os_log_send_and_compose_impl();

        if (v42)
        {
          uint64_t v39 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v58, v50);
          free(v42);
          SSFileLog(v36, @"%@", v43, v44, v45, v46, v47, v48, (uint64_t)v39);
LABEL_45:
        }
        uint64_t v14 = @"YES";
        break;
      default:
        double v13 = 0;
        break;
    }
  }
  else
  {
    double v13 = [a1 _legacyBagValueForKey:v8];
    uint64_t v11 = 0;
    uint64_t v14 = @"NO";
  }
  if (v13) {
    goto LABEL_19;
  }
LABEL_7:
  uint64_t v15 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v15)
  {
    uint64_t v15 = +[SSLogConfig sharedConfig];
  }
  int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  id v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    v17 &= 2u;
  }
  if (!v17) {
    goto LABEL_17;
  }
  uint64_t v19 = objc_opt_class();
  int v58 = 138543874;
  v59 = v19;
  __int16 v60 = 2114;
  id v61 = v8;
  __int16 v62 = 2114;
  id v63 = v14;
  id v20 = v19;
  LODWORD(v50) = 32;
  uint64_t v21 = (void *)_os_log_send_and_compose_impl();

  if (v21)
  {
    id v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v58, v50);
    free(v21);
    SSFileLog(v15, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v18);
LABEL_17:
  }
  double v13 = 0;
LABEL_19:

  return v13;
}

- (void)_insertEventIntoDatabase:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    id v8 = [(SSURLSessionManager *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SSURLSessionManager__insertEventIntoDatabase_delegate___block_invoke;
    block[3] = &unk_1E5BADAB0;
    objc_copyWeak(&v12, &location);
    void block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __57__SSURLSessionManager__insertEventIntoDatabase_delegate___block_invoke(uint64_t a1)
{
  char v2 = +[SSTransactionStore defaultStore];
  [v2 takeKeepAliveWithTransactionID:@"com.apple.storeservices.metricsEventTransactionIdentifier"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained metricsController];

  if (!v3)
  {
    id v4 = objc_alloc_init(SSMetricsController);
    [WeakRetained setMetricsController:v4];

    int v5 = [(id)objc_opt_class() _metricsDictionaryWithDelegate:*(void *)(a1 + 40)];
    if (v5)
    {
      id v6 = [[SSMetricsConfiguration alloc] initWithGlobalConfiguration:v5];
      id v7 = [WeakRetained metricsController];
      [v7 setGlobalConfiguration:v6];
    }
  }
  id v8 = [WeakRetained metricsController];
  id v9 = [v8 configuration];
  id v10 = [v9 reportingURLString];

  if (v10
    && ([*(id *)(a1 + 48) requestURL],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 containsString:v10],
        v11,
        (v12 & 1) == 0))
  {
    double v13 = [WeakRetained metricsController];
    [v13 insertEvent:*(void *)(a1 + 48) withCompletionHandler:&__block_literal_global_214];
  }
  else
  {
    double v13 = +[SSTransactionStore defaultStore];
    [v13 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.metricsEventTransactionIdentifier"];
  }
}

void __57__SSURLSessionManager__insertEventIntoDatabase_delegate___block_invoke_2()
{
  id v0 = +[SSTransactionStore defaultStore];
  [v0 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.metricsEventTransactionIdentifier"];
}

+ (double)_localTimeIntervalToServerTimeInterval:(double)a3
{
  if (_localTimeIntervalToServerTimeInterval__onceToken != -1) {
    dispatch_once(&_localTimeIntervalToServerTimeInterval__onceToken, &__block_literal_global_216);
  }
  return *(double *)&_localTimeIntervalToServerTimeInterval__timeIntervalBetweenReferenceDates + a3;
}

void __62__SSURLSessionManager__localTimeIntervalToServerTimeInterval___block_invoke()
{
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  id v0 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  [v2 timeIntervalSinceDate:v0];
  _localTimeIntervalToServerTimeInterval__timeIntervalBetweenReferenceDates = v1;
}

+ (id)_resolvedIPAddressFromTask:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 response];
  uint64_t v4 = [v3 _CFURLResponse];

  if (v4 && (CFDataRef v5 = (const __CFData *)CFURLResponseCopyPeerAddress()) != 0)
  {
    CFDataRef v6 = v5;
    BytePtr = CFDataGetBytePtr(v5);
    socklen_t v8 = *BytePtr;
    id v9 = (char *)v12 - (((_WORD)v8 + 15) & 0x1F0);
    inet_ntop(BytePtr[1], BytePtr + 4, v9, v8);
    id v10 = [NSString stringWithCString:v9 encoding:1];
    CFRelease(v6);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

+ (double)_timingDataMetricToServerTimeInterval:(id)a3
{
  [a3 doubleValue];
  if (v4 == 0.0) {
    return 0.0;
  }
  objc_msgSend(a1, "_localTimeIntervalToServerTimeInterval:");
  return result;
}

- (NSArray)customURLProtocols
{
  return self->_customURLProtocols;
}

- (void)setCustomURLProtocols:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (SSCircularBuffer)httpArchiveBuffer
{
  return self->_httpArchiveBuffer;
}

- (void)setHttpArchiveBuffer:(id)a3
{
}

- (SSMetricsController)metricsController
{
  return self->_metricsController;
}

- (void)setMetricsController:(id)a3
{
}

- (NSMutableDictionary)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (OS_dispatch_queue)requestDataQueue
{
  return self->_requestDataQueue;
}

- (void)setRequestDataQueue:(id)a3
{
}

- (NSMutableDictionary)taskMetrics
{
  return self->_taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
}

- (OS_dispatch_queue)taskMetricsQueue
{
  return self->_taskMetricsQueue;
}

- (void)setTaskMetricsQueue:(id)a3
{
}

- (NSMutableDictionary)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
}

- (OS_dispatch_queue)responseDataQueue
{
  return self->_responseDataQueue;
}

- (void)setResponseDataQueue:(id)a3
{
}

- (NSMutableDictionary)recordResponseMap
{
  return self->_recordResponseMap;
}

- (void)setRecordResponseMap:(id)a3
{
}

- (OS_dispatch_queue)recordResponseQueue
{
  return self->_recordResponseQueue;
}

- (void)setRecordResponseQueue:(id)a3
{
}

- (NSMutableDictionary)sendTimingDataMap
{
  return self->_sendTimingDataMap;
}

- (void)setSendTimingDataMap:(id)a3
{
}

- (OS_dispatch_queue)sendTimingDataQueue
{
  return self->_sendTimingDataQueue;
}

- (void)setSendTimingDataQueue:(id)a3
{
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (OS_dispatch_queue)sessionsQueue
{
  return self->_sessionsQueue;
}

- (void)setSessionsQueue:(id)a3
{
}

- (NSMapTable)taskDelegates
{
  return self->_taskDelegates;
}

- (void)setTaskDelegates:(id)a3
{
}

- (OS_dispatch_queue)taskDelegatesQueue
{
  return self->_taskDelegatesQueue;
}

- (void)setTaskDelegatesQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskDelegatesQueue, 0);
  objc_storeStrong((id *)&self->_taskDelegates, 0);
  objc_storeStrong((id *)&self->_sessionsQueue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_sendTimingDataQueue, 0);
  objc_storeStrong((id *)&self->_sendTimingDataMap, 0);
  objc_storeStrong((id *)&self->_recordResponseQueue, 0);
  objc_storeStrong((id *)&self->_recordResponseMap, 0);
  objc_storeStrong((id *)&self->_responseDataQueue, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_taskMetricsQueue, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_requestDataQueue, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_httpArchiveBuffer, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_customURLProtocols, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
}

@end