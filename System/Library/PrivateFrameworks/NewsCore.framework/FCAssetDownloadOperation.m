@interface FCAssetDownloadOperation
+ (id)sharedURLRequestScheduler;
+ (id)sharedURLSession;
- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4;
- (BOOL)validateOperation;
- (FCAssetDownloadOperation)init;
- (FCAssetDownloadOperation)initWithNetworkReachability:(id)a3;
- (FCAssetDownloadOperation)initWithNetworkReachability:(id)a3 URLRequestScheduler:(id)a4;
- (FCNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCNetworkEvent)networkEvent;
- (FCURLRequestScheduler)scheduler;
- (NSData)downloadedData;
- (NSDictionary)additionalRequestHTTPHeaders;
- (NSString)loggingKey;
- (NSString)requestUUID;
- (NSURL)URL;
- (NSURL)downloadedFileURL;
- (id)dataDownloadCompletionHandler;
- (id)fileDownloadCompletionHandler;
- (id)throttleGroup;
- (int)networkEventType;
- (int64_t)downloadDestination;
- (unint64_t)cachePolicy;
- (unint64_t)maxRetries;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setAdditionalRequestHTTPHeaders:(id)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setDataDownloadCompletionHandler:(id)a3;
- (void)setDownloadDestination:(int64_t)a3;
- (void)setDownloadedData:(id)a3;
- (void)setDownloadedFileURL:(id)a3;
- (void)setFileDownloadCompletionHandler:(id)a3;
- (void)setLoggingKey:(id)a3;
- (void)setNetworkBehaviorMonitor:(id)a3;
- (void)setNetworkEvent:(id)a3;
- (void)setNetworkEventType:(int)a3;
- (void)setRequestUUID:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation FCAssetDownloadOperation

+ (id)sharedURLSession
{
  if (qword_1EB5D0ED8 != -1) {
    dispatch_once(&qword_1EB5D0ED8, &__block_literal_global_175);
  }
  v2 = (void *)qword_1EB5D0ED0;
  return v2;
}

void __44__FCAssetDownloadOperation_sharedURLSession__block_invoke()
{
  if (FCProcessIsMemoryConstrained()) {
    [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  }
  else {
  id v7 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  }
  [v7 setAllowsCellularAccess:1];
  [v7 setRequestCachePolicy:1];
  [v7 setURLCache:0];
  [v7 setTimeoutIntervalForRequest:15.0];
  [v7 setTimeoutIntervalForResource:240.0];
  objc_msgSend(v7, "set_timingDataOptions:", 1);
  v0 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", &__block_literal_global_4_14);
  [v7 setProtocolClasses:v0];

  [v7 setHTTPMaximumConnectionsPerHost:6];
  [v7 setHTTPShouldUsePipelining:1];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 bundleIdentifier];

  if (([v2 isEqualToString:@"com.apple.newsd"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.nanonews"] & 1) != 0
    || [v2 isEqualToString:@"com.apple.nanonews.widget"])
  {
    objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", @"com.apple.news");
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v3 setName:@"FCAssetManager.downloadCallbackQueue"];
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v3, "setMaxConcurrentOperationCount:", objc_msgSend(v4, "processorCount"));

  uint64_t v5 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v7 delegate:0 delegateQueue:v3];
  v6 = (void *)qword_1EB5D0ED0;
  qword_1EB5D0ED0 = v5;
}

void __44__FCAssetDownloadOperation_sharedURLSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
}

+ (id)sharedURLRequestScheduler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FCAssetDownloadOperation_sharedURLRequestScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB5D0EE8 != -1) {
    dispatch_once(&qword_1EB5D0EE8, block);
  }
  id v2 = (void *)qword_1EB5D0EE0;
  return v2;
}

void __53__FCAssetDownloadOperation_sharedURLRequestScheduler__block_invoke(uint64_t a1)
{
  id v2 = [FCURLRequestScheduler alloc];
  id v5 = [*(id *)(a1 + 32) sharedURLSession];
  uint64_t v3 = [(FCURLRequestScheduler *)v2 initWithURLSession:v5];
  v4 = (void *)qword_1EB5D0EE0;
  qword_1EB5D0EE0 = v3;
}

- (FCAssetDownloadOperation)init
{
  uint64_t v3 = +[FCNetworkReachability sharedNetworkReachability];
  v4 = [(FCAssetDownloadOperation *)self initWithNetworkReachability:v3 URLRequestScheduler:0];

  return v4;
}

- (FCAssetDownloadOperation)initWithNetworkReachability:(id)a3
{
  return [(FCAssetDownloadOperation *)self initWithNetworkReachability:a3 URLRequestScheduler:0];
}

- (FCAssetDownloadOperation)initWithNetworkReachability:(id)a3 URLRequestScheduler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FCAssetDownloadOperation;
  id v7 = [(FCNetworkOperation *)&v13 initWithNetworkReachability:a3];
  if (v7)
  {
    v8 = v6;
    if (!v6)
    {
      v8 = [(id)objc_opt_class() sharedURLRequestScheduler];
    }
    objc_storeStrong((id *)&v7->_scheduler, v8);
    if (!v6) {

    }
    v7->_cachePolicy = 1;
    unint64_t v9 = time(0);
    unint64_t v10 = atomic_load(&qword_1EB5D0EF0);
    if (v9 > v10)
    {
      atomic_store(v9, &qword_1EB5D0EF0);
      atomic_store(0, (unsigned int *)_MergedGlobals_9);
    }
    if (atomic_fetch_add(_MergedGlobals_9, 1u) >= 0x1F5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"More than %lu asset downloads were triggered within one second", 500);
        *(_DWORD *)buf = 136315906;
        v15 = "-[FCAssetDownloadOperation initWithNetworkReachability:URLRequestScheduler:]";
        __int16 v16 = 2080;
        v17 = "FCAssetDownloadOperation.m";
        __int16 v18 = 1024;
        int v19 = 150;
        __int16 v20 = 2114;
        v21 = v12;
        _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: TooManyAssetDownloads) : %s %s:%d %{public}@", buf, 0x26u);
      }
      atomic_store(0, (unsigned int *)_MergedGlobals_9);
    }
  }

  return v7;
}

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FCAssetDownloadOperation *)self URL];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"asset download operation must have a non-nil URL"];
    int v9 = 136315906;
    unint64_t v10 = "-[FCAssetDownloadOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCAssetDownloadOperation.m";
    __int16 v13 = 1024;
    int v14 = 163;
    __int16 v15 = 2114;
    __int16 v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  v4 = [(FCAssetDownloadOperation *)self scheduler];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"asset download operation must have a non-nil scheduler"];
    int v9 = 136315906;
    unint64_t v10 = "-[FCAssetDownloadOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCAssetDownloadOperation.m";
    __int16 v13 = 1024;
    int v14 = 167;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)prepareOperation
{
  id v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = [v4 UUIDString];
  [(FCAssetDownloadOperation *)self setRequestUUID:v3];
}

- (void)performOperation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F18D50];
  id v4 = [(FCAssetDownloadOperation *)self URL];
  BOOL v5 = [v3 requestWithURL:v4];

  FCOperationFlagsApplyToURLRequest([(FCOperation *)self flags], v5);
  [(FCNetworkOperation *)self preferredTimeoutIntervalForRequest];
  objc_msgSend(v5, "setTimeoutInterval:");
  objc_msgSend(v5, "setCachePolicy:", -[FCAssetDownloadOperation cachePolicy](self, "cachePolicy"));
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [(FCAssetDownloadOperation *)self requestUUID];
  [v6 setObject:v7 forKeyedSubscript:@"X-Apple-Request-UUID"];

  v8 = FCClientInfoHeaderValue();
  [v6 setObject:v8 forKeyedSubscript:@"X-MMe-Client-Info"];

  int v9 = FCUserAgentHeaderValue();
  [v6 setObject:v9 forKeyedSubscript:@"User-Agent"];

  unint64_t v10 = [(FCAssetDownloadOperation *)self additionalRequestHTTPHeaders];

  if (v10)
  {
    __int16 v11 = [(FCAssetDownloadOperation *)self additionalRequestHTTPHeaders];
    [v6 addEntriesFromDictionary:v11];
  }
  [v5 setAllHTTPHeaderFields:v6];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __44__FCAssetDownloadOperation_performOperation__block_invoke;
  v28 = &unk_1E5B5B6B8;
  v29 = self;
  id v12 = v5;
  id v30 = v12;
  __int16 v13 = _Block_copy(&v25);
  int v14 = [(FCAssetDownloadOperation *)self scheduler];
  int64_t v15 = [(FCAssetDownloadOperation *)self downloadDestination];
  int64_t v16 = [(FCOperation *)self relativePriority];
  uint64_t v17 = [(FCOperation *)self shortOperationDescription];
  __int16 v18 = [v14 scheduleURLRequest:v12 destination:v15 priority:v16 loggingKey:v17 completion:v13];

  [(FCOperation *)self associateChildOperation:v18];
  int v19 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = v19;
    v21 = [(FCOperation *)self shortOperationDescription];
    uint64_t v22 = [(FCAssetDownloadOperation *)self loggingKey];
    v23 = [(FCAssetDownloadOperation *)self requestUUID];
    v24 = [(FCAssetDownloadOperation *)self URL];
    *(_DWORD *)buf = 138544130;
    v32 = v21;
    __int16 v33 = 2114;
    v34 = v22;
    __int16 v35 = 2114;
    v36 = v23;
    __int16 v37 = 2114;
    v38 = v24;
    _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ will download asset %{public}@ with request UUID: %{public}@, URL: %{public}@", buf, 0x2Au);
  }
}

void __44__FCAssetDownloadOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v43 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = v12;
    int v14 = [v10 shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v45 = v14;
    _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", buf, 0xCu);
  }
  objc_opt_class();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v15 = v9;
    if (([v15 statusCode] < 200 || objc_msgSend(v15, "statusCode") >= 300)
      && [v15 statusCode] != 304)
    {
      int64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v17 = [v15 allHeaderFields];

      if (v17)
      {
        __int16 v18 = [v15 allHeaderFields];
        [v16 setObject:v18 forKeyedSubscript:@"FCErrorHTTPResponseHeaders"];
      }
      if ([v15 statusCode] >= 500 && objc_msgSend(v15, "statusCode") <= 598)
      {
        int v19 = [v15 allHeaderFields];
        __int16 v20 = [v19 objectForKeyedSubscript:@"Retry-After"];

        if (v20)
        {
          uint64_t v21 = [v20 integerValue];
          if (v21)
          {
            uint64_t v22 = [NSNumber numberWithInteger:v21];
            if (v22)
            {
              v23 = (void *)v22;
              [v16 setObject:v22 forKeyedSubscript:@"FCErrorRetryAfter"];
            }
          }
        }
      }
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = [*(id *)(a1 + 32) URL];
      uint64_t v26 = [v15 statusCode];
      v27 = [*(id *)(a1 + 32) requestUUID];
      uint64_t v28 = objc_msgSend(v24, "fc_HTTPErrorWithURL:statusCode:requestUUID:additionalUserInfo:", v25, v26, v27, v16);

      id v11 = (id)v28;
    }
  }
  else
  {
    id v15 = 0;
  }
  v42 = v9;
  if (!v11)
  {
    uint64_t v41 = [*(id *)(a1 + 32) downloadDestination];
    if (v41 == 1)
    {
      [*(id *)(a1 + 32) setDownloadedData:v43];
    }
    else if (!v41)
    {
      [*(id *)(a1 + 32) setDownloadedFileURL:v43];
    }
  }
  v29 = [FCNetworkEvent alloc];
  uint64_t v30 = [*(id *)(a1 + 32) networkEventType];
  uint64_t v31 = *(void *)(a1 + 40);
  v32 = [*(id *)(a1 + 32) operationID];
  __int16 v33 = [*(id *)(a1 + 32) requestUUID];
  [*(id *)(a1 + 32) operationStartTime];
  double v35 = v34;
  [v10 _incompleteCurrentTaskTransactionMetrics];
  __int16 v37 = v36 = v10;
  v38 = [(FCNetworkEvent *)v29 initWithType:v30 URLRequest:v31 operationID:v32 requestUUID:v33 startTime:v15 HTTPResponse:v37 metrics:v35 containerName:0 error:v11];
  [*(id *)(a1 + 32) setNetworkEvent:v38];

  uint64_t v39 = [*(id *)(a1 + 32) networkBehaviorMonitor];
  v40 = [*(id *)(a1 + 32) networkEvent];
  [v39 logNetworkEvent:v40];

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v11];
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    id v10 = (void *)FCOperationLog;
    if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    id v7 = v10;
    id v11 = [(FCOperation *)self shortOperationDescription];
    id v12 = [(FCAssetDownloadOperation *)self loggingKey];
    __int16 v13 = (void *)MEMORY[0x1E4F28B68];
    int v14 = [(FCAssetDownloadOperation *)self networkEvent];
    id v15 = objc_msgSend(v13, "stringFromByteCount:countStyle:", objc_msgSend(v14, "responseSize"), 0);
    int64_t v16 = [(FCAssetDownloadOperation *)self networkEvent];
    [v16 totalDuration];
    unint64_t v18 = (unint64_t)(fmax(v17, 0.0) * 1000.0);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v20 = v19;
    uint64_t v21 = [(FCAssetDownloadOperation *)self networkEvent];
    [v21 startTime];
    int v38 = 138544386;
    uint64_t v39 = v11;
    __int16 v40 = 2114;
    uint64_t v41 = v12;
    __int16 v42 = 2114;
    id v43 = v15;
    __int16 v44 = 2048;
    unint64_t v45 = v18;
    __int16 v46 = 2048;
    unint64_t v47 = (unint64_t)(fmax(v20 - v22, 0.0) * 1000.0);
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully downloaded asset %{public}@ with size: %{public}@, network time: %llums, total time: %llums", (uint8_t *)&v38, 0x34u);

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "fc_isCancellationError"))
  {
    id v6 = (void *)FCOperationLog;
    if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    id v7 = v6;
    v8 = [(FCOperation *)self shortOperationDescription];
    id v9 = [(FCAssetDownloadOperation *)self loggingKey];
    int v38 = 138543618;
    uint64_t v39 = v8;
    __int16 v40 = 2114;
    uint64_t v41 = v9;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled downloading asset %{public}@", (uint8_t *)&v38, 0x16u);
    goto LABEL_5;
  }
  v23 = [v5 userInfo];
  v24 = [v23 objectForKeyedSubscript:@"FCErrorHTTPStatusCode"];

  uint64_t v25 = (void *)FCOperationLog;
  BOOL v26 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR);
  if (v24)
  {
    if (v26)
    {
      id v7 = v25;
      v8 = [(FCOperation *)self shortOperationDescription];
      v27 = [(FCAssetDownloadOperation *)self loggingKey];
      uint64_t v28 = [v5 userInfo];
      v29 = [v28 objectForKeyedSubscript:@"FCErrorHTTPStatusCode"];
      int v38 = 138543874;
      uint64_t v39 = v8;
      __int16 v40 = 2114;
      uint64_t v41 = v27;
      __int16 v42 = 2114;
      id v43 = v29;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to download asset %{public}@ with response status code: %{public}@", (uint8_t *)&v38, 0x20u);

      goto LABEL_6;
    }
  }
  else if (v26)
  {
    id v7 = v25;
    v8 = [(FCOperation *)self shortOperationDescription];
    id v9 = [(FCAssetDownloadOperation *)self loggingKey];
    __int16 v37 = [v5 localizedDescription];
    int v38 = 138543874;
    uint64_t v39 = v8;
    __int16 v40 = 2114;
    uint64_t v41 = v9;
    __int16 v42 = 2114;
    id v43 = v37;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ failed to download asset %{public}@ with error: %{public}@", (uint8_t *)&v38, 0x20u);

LABEL_5:
LABEL_6:

LABEL_9:
  }
LABEL_14:
  int64_t v30 = [(FCAssetDownloadOperation *)self downloadDestination];
  if (v30 == 1)
  {
    double v34 = [(FCAssetDownloadOperation *)self dataDownloadCompletionHandler];

    if (v34)
    {
      v32 = [(FCAssetDownloadOperation *)self dataDownloadCompletionHandler];
      uint64_t v33 = [(FCAssetDownloadOperation *)self downloadedData];
      goto LABEL_20;
    }
  }
  else if (!v30)
  {
    uint64_t v31 = [(FCAssetDownloadOperation *)self fileDownloadCompletionHandler];

    if (v31)
    {
      v32 = [(FCAssetDownloadOperation *)self fileDownloadCompletionHandler];
      uint64_t v33 = [(FCAssetDownloadOperation *)self downloadedFileURL];
LABEL_20:
      double v35 = (void *)v33;
      v36 = [(FCAssetDownloadOperation *)self networkEvent];
      ((void (**)(void, void *, void *, void *))v32)[2](v32, v35, v36, v5);
    }
  }
}

- (unint64_t)maxRetries
{
  return 0;
}

- (id)throttleGroup
{
  uint64_t v3 = [(FCAssetDownloadOperation *)self URL];
  id v4 = [v3 host];

  if ([(FCAssetDownloadOperation *)self networkEventType] == 16)
  {
    uint64_t v5 = [v4 stringByAppendingString:@"-appconfig"];

    id v4 = (void *)v5;
  }
  return v4;
}

- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4
{
  id v5 = a3;
  char v6 = [v5 isCloudKitReachable];
  if ((v6 & 1) == 0) {
    *a4 = [v5 offlineReason];
  }

  return v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)loggingKey
{
  return self->_loggingKey;
}

- (void)setLoggingKey:(id)a3
{
}

- (int64_t)downloadDestination
{
  return self->_downloadDestination;
}

- (void)setDownloadDestination:(int64_t)a3
{
  self->_downloadDestination = a3;
}

- (int)networkEventType
{
  return self->_networkEventType;
}

- (void)setNetworkEventType:(int)a3
{
  self->_networkEventType = a3;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  return self->_additionalRequestHTTPHeaders;
}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (void)setNetworkBehaviorMonitor:(id)a3
{
}

- (id)fileDownloadCompletionHandler
{
  return self->_fileDownloadCompletionHandler;
}

- (void)setFileDownloadCompletionHandler:(id)a3
{
}

- (id)dataDownloadCompletionHandler
{
  return self->_dataDownloadCompletionHandler;
}

- (void)setDataDownloadCompletionHandler:(id)a3
{
}

- (FCURLRequestScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (NSURL)downloadedFileURL
{
  return self->_downloadedFileURL;
}

- (void)setDownloadedFileURL:(id)a3
{
}

- (NSData)downloadedData
{
  return self->_downloadedData;
}

- (void)setDownloadedData:(id)a3
{
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (FCNetworkEvent)networkEvent
{
  return self->_networkEvent;
}

- (void)setNetworkEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_downloadedData, 0);
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_dataDownloadCompletionHandler, 0);
  objc_storeStrong(&self->_fileDownloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end