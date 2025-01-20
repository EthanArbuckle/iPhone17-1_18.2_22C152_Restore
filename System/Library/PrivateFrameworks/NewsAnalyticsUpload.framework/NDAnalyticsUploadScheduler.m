@interface NDAnalyticsUploadScheduler
- (FCAsyncSerialQueue)uploadQueue;
- (FCBalancedCounter)backgroundSessionLaunchEventCounter;
- (FCDateRange)deliveryWindow;
- (FCOperationThrottler)schedulingAndForegroundUploadThrottler;
- (NDAnalyticsUploadScheduler)init;
- (NDAnalyticsUploadScheduler)initWithURLSessionQueue:(id)a3;
- (NDAnalyticsUploadSchedulerDelegate)delegate;
- (NFMutexLock)lock;
- (NSOperationQueue)backgroundSessionQueue;
- (NSURLSession)backgroundSession;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)_scheduleBackgroundUploadInWindow:(id)a3;
- (void)_uploadWithCompletion:(id)a3;
- (void)handleLaunchEventForBackgroundSessionWithIdentifier:(id)a3 completion:(id)a4;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)scheduleUploadInWindow:(id)a3 withForegroundUploadCompletion:(id)a4;
- (void)setBackgroundSession:(id)a3;
- (void)setBackgroundSessionLaunchEventCounter:(id)a3;
- (void)setBackgroundSessionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeliveryWindow:(id)a3;
- (void)setLock:(id)a3;
- (void)setSchedulingAndForegroundUploadThrottler:(id)a3;
- (void)setUploadQueue:(id)a3;
@end

@implementation NDAnalyticsUploadScheduler

- (NDAnalyticsUploadScheduler)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsUploadScheduler init]";
    __int16 v9 = 2080;
    v10 = "NDAnalyticsUploadScheduler.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NDAnalyticsUploadScheduler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NDAnalyticsUploadScheduler)initWithURLSessionQueue:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsUploadScheduler initWithURLSessionQueue:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)NDAnalyticsUploadScheduler;
  v5 = [(NDAnalyticsUploadScheduler *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F595A0]) initWithDelegate:v5];
    schedulingAndForegroundUploadThrottler = v5->_schedulingAndForegroundUploadThrottler;
    v5->_schedulingAndForegroundUploadThrottler = (FCOperationThrottler *)v6;

    uint64_t v8 = objc_opt_new();
    lock = v5->_lock;
    v5->_lock = (NFMutexLock *)v8;

    uint64_t v10 = objc_opt_new();
    uploadQueue = v5->_uploadQueue;
    v5->_uploadQueue = (FCAsyncSerialQueue *)v10;

    int v12 = (NSOperationQueue *)objc_opt_new();
    [(NSOperationQueue *)v12 setUnderlyingQueue:v4];
    backgroundSessionQueue = v5->_backgroundSessionQueue;
    v5->_backgroundSessionQueue = v12;
    v14 = v12;

    uint64_t v15 = objc_opt_new();
    backgroundSessionLaunchEventCounter = v5->_backgroundSessionLaunchEventCounter;
    v5->_backgroundSessionLaunchEventCounter = (FCBalancedCounter *)v15;
  }
  return v5;
}

- (NSURLSession)backgroundSession
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  __int16 v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v3 = [(NDAnalyticsUploadScheduler *)self lock];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__NDAnalyticsUploadScheduler_backgroundSession__block_invoke;
  v6[3] = &unk_264538F08;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithLockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURLSession *)v4;
}

void __47__NDAnalyticsUploadScheduler_backgroundSession__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    v3 = [MEMORY[0x263F08C00] backgroundSessionConfigurationWithIdentifier:@"com.apple.newsd.analytics.uploader"];
    objc_msgSend(v3, "set_allowsRetryForBackgroundDataTasks:", 1);
    objc_msgSend(v3, "set_sourceApplicationBundleIdentifier:", @"com.apple.news");
    [v3 setDiscretionary:1];
    id v4 = (void *)MEMORY[0x263F08BF8];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 backgroundSessionQueue];
    uint64_t v7 = [v4 sessionWithConfiguration:v3 delegate:v5 delegateQueue:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 56);
    *(void *)(v8 + 56) = v7;

    v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v10, v2);
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsUploadScheduler handleLaunchEventForBackgroundSessionWithIdentifier:completion:]();
  }
  if (([v6 isEqualToString:@"com.apple.newsd.analytics.uploader"] & 1) == 0
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsUploadScheduler handleLaunchEventForBackgroundSessionWithIdentifier:completion:]();
  }
  uint64_t v8 = NDSharedServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[NDAnalyticsUploadScheduler handleLaunchEventForBackgroundSessionWithIdentifier:completion:]";
    _os_log_impl(&dword_21FDD6000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = [(NDAnalyticsUploadScheduler *)self backgroundSessionLaunchEventCounter];
  [v9 increment];
  uint64_t v10 = FCDispatchQueueForQualityOfService();
  [v9 notifyWhenCountReachesZeroOnQueue:v10 usingBlock:v7];
}

- (void)scheduleUploadInWindow:(id)a3 withForegroundUploadCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsUploadScheduler scheduleUploadInWindow:withForegroundUploadCompletion:]();
  }
  uint64_t v8 = NDSharedServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 earlierDate];
    uint64_t v10 = [v6 laterDate];
    *(_DWORD *)buf = 136315650;
    v21 = "-[NDAnalyticsUploadScheduler scheduleUploadInWindow:withForegroundUploadCompletion:]";
    __int16 v22 = 2112;
    v23 = v9;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_21FDD6000, v8, OS_LOG_TYPE_INFO, "%s with start date %@, end date %@", buf, 0x20u);
  }
  int v11 = [(NDAnalyticsUploadScheduler *)self lock];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __84__NDAnalyticsUploadScheduler_scheduleUploadInWindow_withForegroundUploadCompletion___block_invoke;
  v17 = &unk_2645388A0;
  objc_super v18 = self;
  id v19 = v6;
  id v12 = v6;
  [v11 performWithLockSync:&v14];

  uint64_t v13 = [(NDAnalyticsUploadScheduler *)self schedulingAndForegroundUploadThrottler];
  [v13 tickleWithCompletion:v7];
}

uint64_t __84__NDAnalyticsUploadScheduler_scheduleUploadInWindow_withForegroundUploadCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeliveryWindow:*(void *)(a1 + 40)];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  uint64_t v8 = [(NDAnalyticsUploadScheduler *)self lock];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v15[3] = &unk_2645389F8;
  v15[4] = self;
  v15[5] = &v16;
  [v8 performWithLockSync:v15];

  uint64_t v9 = [(id)v17[5] laterDate];
  uint64_t v10 = [MEMORY[0x263EFF910] date];
  int v11 = objc_msgSend(v9, "fc_isEarlierThanOrEqualTo:", v10);

  id v12 = NDSharedServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [(id)v17[5] laterDate];
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_21FDD6000, v12, OS_LOG_TYPE_INFO, "Scheduling payload with delivery window end date of %@", buf, 0xCu);
  }
  if (v11)
  {
    uint64_t v14 = NDSharedServiceLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FDD6000, v14, OS_LOG_TYPE_INFO, "Uploading now", buf, 2u);
    }

    [(NDAnalyticsUploadScheduler *)self _uploadWithCompletion:v7];
  }
  else
  {
    [(NDAnalyticsUploadScheduler *)self _scheduleBackgroundUploadInWindow:v17[5]];
    v7[2](v7);
  }
  _Block_object_dispose(&v16, 8);
}

void __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) deliveryWindow];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke_cold_1();
  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v3 = [(NDAnalyticsUploadScheduler *)self backgroundSessionLaunchEventCounter];
  [v3 decrement];
}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = NDSharedServiceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = [v8 taskDescription];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[NDAnalyticsUploadScheduler URLSession:task:willBeginDelayedRequest:completionHandler:]";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl(&dword_21FDD6000, v10, OS_LOG_TYPE_INFO, "%s called for task with description %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__NDAnalyticsUploadScheduler_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke;
  v13[3] = &unk_264538F30;
  id v14 = v9;
  id v12 = v9;
  [(NDAnalyticsUploadScheduler *)self _uploadWithCompletion:v13];
}

uint64_t __88__NDAnalyticsUploadScheduler_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = NDSharedServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v7 taskDescription];
    int v16 = 136315650;
    __int16 v17 = "-[NDAnalyticsUploadScheduler URLSession:task:didCompleteWithError:]";
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_21FDD6000, v9, OS_LOG_TYPE_INFO, "%s called for task with description %@, error %@", (uint8_t *)&v16, 0x20u);
  }
  int v11 = [v8 domain];
  if ([v11 isEqualToString:*MEMORY[0x263F08438]])
  {
    uint64_t v12 = [v8 code];

    if (v12 == 2) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v13 = [v8 domain];
  if ([v13 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v14 = [v8 code];

    if (v14 == -999) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v15 = [(NDAnalyticsUploadScheduler *)self delegate];
  [v15 uploadSchedulerDidDropScheduledBackgroundUpload:self];

LABEL_12:
}

- (void)_scheduleBackgroundUploadInWindow:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsUploadScheduler _scheduleBackgroundUploadInWindow:]();
  }
  v5 = [(NDAnalyticsUploadScheduler *)self backgroundSession];
  [v5 getAllTasksWithCompletionHandler:&__block_literal_global_6];
  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];

  id v8 = (void *)MEMORY[0x263F08BD8];
  id v9 = NSURL;
  uint64_t v10 = [NSString stringWithFormat:@"https://www.%@.com", v7];
  int v11 = [v9 URLWithString:v10];
  uint64_t v12 = [v8 requestWithURL:v11];

  uint64_t v13 = [v5 downloadTaskWithRequest:v12];
  [v13 setTaskDescription:v7];
  uint64_t v14 = [v4 earlierDate];
  [v13 setEarliestBeginDate:v14];

  uint64_t v15 = [v4 laterDate];
  [v15 timeIntervalSinceNow];
  objc_msgSend(v13, "set_timeoutIntervalForResource:");

  int v16 = NDSharedServiceLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = [v4 earlierDate];
    __int16 v18 = [v4 laterDate];
    *(_DWORD *)buf = 138412802;
    __int16 v20 = v17;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    _os_log_impl(&dword_21FDD6000, v16, OS_LOG_TYPE_INFO, "Scheduling background task with start date %@, end date %@, taskDescription %@", buf, 0x20u);
  }
  [v13 resume];
}

uint64_t __64__NDAnalyticsUploadScheduler__scheduleBackgroundUploadInWindow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateObjectsUsingBlock:&__block_literal_global_37_0];
}

void __64__NDAnalyticsUploadScheduler__scheduleBackgroundUploadInWindow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = NDSharedServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [v2 taskDescription];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_21FDD6000, v3, OS_LOG_TYPE_INFO, "Cancelling background task with taskDescription %@", (uint8_t *)&v5, 0xCu);
  }
  [v2 cancel];
}

- (void)_uploadWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsUploadScheduler _uploadWithCompletion:]();
  }
  int v5 = [(NDAnalyticsUploadScheduler *)self uploadQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke;
  v7[3] = &unk_264538FC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enqueueBlock:v7];
}

void __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke_2;
  int v11 = &unk_264538F98;
  id v12 = *(id *)(a1 + 40);
  id v4 = v3;
  id v13 = v4;
  int v5 = (void (**)(void))_Block_copy(&v8);
  id v6 = objc_msgSend(*(id *)(a1 + 32), "delegate", v8, v9, v10, v11);
  uint64_t v7 = v6;
  if (v6) {
    [v6 uploadScheduler:*(void *)(a1 + 32) performUploadWithCompletion:v5];
  }
  else {
    v5[2](v5);
  }
}

uint64_t __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (NDAnalyticsUploadSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDAnalyticsUploadSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NFMutexLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (FCDateRange)deliveryWindow
{
  return self->_deliveryWindow;
}

- (void)setDeliveryWindow:(id)a3
{
}

- (FCOperationThrottler)schedulingAndForegroundUploadThrottler
{
  return self->_schedulingAndForegroundUploadThrottler;
}

- (void)setSchedulingAndForegroundUploadThrottler:(id)a3
{
}

- (FCAsyncSerialQueue)uploadQueue
{
  return self->_uploadQueue;
}

- (void)setUploadQueue:(id)a3
{
}

- (NSOperationQueue)backgroundSessionQueue
{
  return self->_backgroundSessionQueue;
}

- (void)setBackgroundSessionQueue:(id)a3
{
}

- (void)setBackgroundSession:(id)a3
{
}

- (FCBalancedCounter)backgroundSessionLaunchEventCounter
{
  return self->_backgroundSessionLaunchEventCounter;
}

- (void)setBackgroundSessionLaunchEventCounter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionLaunchEventCounter, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_backgroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_uploadQueue, 0);
  objc_storeStrong((id *)&self->_schedulingAndForegroundUploadThrottler, 0);
  objc_storeStrong((id *)&self->_deliveryWindow, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithURLSessionQueue:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URLSessionQueue", v6, 2u);
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"[identifier isEqualToString:NDAnalyticsUploadSchedulerBackgroundSessionIdentifier]", v6, 2u);
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);
}

- (void)scheduleUploadInWindow:withForegroundUploadCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deliveryWindow", v6, 2u);
}

void __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"invalid nil value for '%s'"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deliveryWindow", v6, 2u);
}

- (void)_scheduleBackgroundUploadInWindow:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deliveryWindow", v6, 2u);
}

- (void)_uploadWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

@end