@interface RCNetworkOperationURLSessionDelegate
- (NSMutableDictionary)runningTasks;
- (NSPointerArray)sessionDidFinishObservers;
- (NSString)sessionIdentifier;
- (RCNetworkOperationURLSessionDelegate)initWithSessionIdentifier:(id)a3;
- (RCUnfairLock)observerLock;
- (RCUnfairLock)taskLock;
- (id)_existingNetworkTaskForURLSessionTask:(id)a3;
- (id)_networkTaskForIdentifier:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)addObserver:(id)a3;
- (void)observeCompletionOfTaskWithIdentifier:(id)a3 completion:(id)a4;
- (void)setObserverLock:(id)a3;
- (void)setRunningTasks:(id)a3;
- (void)setSessionDidFinishObservers:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setTaskLock:(id)a3;
@end

@implementation RCNetworkOperationURLSessionDelegate

- (RCNetworkOperationURLSessionDelegate)initWithSessionIdentifier:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCNetworkOperationURLSessionDelegate;
  v6 = [(RCNetworkOperationURLSessionDelegate *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionIdentifier, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    runningTasks = v7->_runningTasks;
    v7->_runningTasks = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    sessionDidFinishObservers = v7->_sessionDidFinishObservers;
    v7->_sessionDidFinishObservers = (NSPointerArray *)v10;

    v12 = [[RCUnfairLock alloc] initWithOptions:1];
    taskLock = v7->_taskLock;
    v7->_taskLock = v12;
  }
  return v7;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  v4 = [(RCNetworkOperationURLSessionDelegate *)self sessionDidFinishObservers];
  char v5 = objc_msgSend(v4, "rc_containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    v6 = [(RCNetworkOperationURLSessionDelegate *)self sessionDidFinishObservers];
    [v6 addPointer:v7];
  }
}

- (void)observeCompletionOfTaskWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v9 = [(RCNetworkOperationURLSessionDelegate *)self _networkTaskForIdentifier:a3];
  id v7 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v7 lock];

  [v9 setCompletionHandler:v6];
  uint64_t v8 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v8 unlock];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = RCSharedLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = objc_msgSend(v6, "rc_logIdentifier");
      *(_DWORD *)buf = 138543618;
      v35 = v10;
      __int16 v36 = 2114;
      id v37 = v7;
      _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_ERROR, "URL Session %{public}@ became invalid with error: %{public}@", buf, 0x16u);
    }
    id v11 = v7;
  }
  else
  {
    if (v9)
    {
      v12 = objc_msgSend(v6, "rc_logIdentifier");
      *(_DWORD *)buf = 138543362;
      v35 = v12;
      _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_ERROR, "Network operation %{public}@ became invalid with unknown error", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "rc_unknownBackgroundNetworkOperationError");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v11;
  v14 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v14 lock];

  objc_super v15 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
  v16 = [v15 allValues];

  v17 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v17 unlock];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v24 = objc_msgSend(v23, "completionHandler", (void)v29);

        if (v24)
        {
          v25 = [v23 completionHandler];
          ((void (**)(void, void, void, void *))v25)[2](v25, 0, 0, v13);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }

  v26 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v26 lock];

  v27 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
  [v27 removeAllObjects];

  v28 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v28 unlock];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(RCNetworkOperationURLSessionDelegate *)self _existingNetworkTaskForURLSessionTask:v7];

  if (!v9)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __77__RCNetworkOperationURLSessionDelegate_URLSession_task_didCompleteWithError___block_invoke;
    v44[3] = &unk_1E5B75F80;
    id v45 = v7;
    v46 = self;
    __77__RCNetworkOperationURLSessionDelegate_URLSession_task_didCompleteWithError___block_invoke((uint64_t)v44);
    uint64_t v10 = v45;
    goto LABEL_26;
  }
  uint64_t v10 = [(RCNetworkOperationURLSessionDelegate *)self _existingNetworkTaskForURLSessionTask:v7];
  uint64_t v11 = objc_opt_class();
  v12 = [v7 response];
  v13 = RCDynamicCast(v11, (uint64_t)v12);

  [v10 receiveHTTPResponse:v13];
  if (v8)
  {
    v14 = RCSharedLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_super v15 = objc_msgSend(v7, "rc_logIdentifier");
      *(_DWORD *)buf = 138543618;
      v50 = v15;
      __int16 v51 = 2114;
      uint64_t v52 = (uint64_t)v8;
      _os_log_impl(&dword_1A4AB3000, v14, OS_LOG_TYPE_ERROR, "Network operation %{public}@ failed with error: %{public}@)", buf, 0x16u);
    }
    v16 = [v10 completionHandler];

    if (!v16) {
      goto LABEL_21;
    }
    v17 = [v10 completionHandler];
    id v18 = [v10 data];
    uint64_t v19 = [v7 response];
    ((void (**)(void, void *, void *, id))v17)[2](v17, v18, v19, v8);
  }
  else if (v13 && [v13 isFailure])
  {
    uint64_t v20 = RCSharedLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend(v7, "rc_logIdentifier");
      *(_DWORD *)buf = 138543618;
      v50 = v21;
      __int16 v51 = 2050;
      uint64_t v52 = [v13 statusCode];
      _os_log_impl(&dword_1A4AB3000, v20, OS_LOG_TYPE_ERROR, "Network operation %{public}@ failed with HTTP status code: %{public}ld", buf, 0x16u);
    }
    v22 = [v10 completionHandler];

    if (!v22) {
      goto LABEL_21;
    }
    v47[0] = @"RCErrorHTTPURL";
    v42 = [v13 URL];
    v23 = [v42 absoluteString];
    v48[0] = v23;
    v47[1] = @"RCErrorHTTPRequestUUID";
    v24 = [v7 taskDescription];
    v48[1] = v24;
    v47[2] = @"RCErrorHTTPStatusCode";
    v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "statusCode"));
    v48[2] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
    v17 = (void (**)(void, void, void, void))[v26 mutableCopy];

    v27 = [v13 allHeaderFields];

    if (v27)
    {
      v28 = [v13 allHeaderFields];
      [v17 setObject:v28 forKeyedSubscript:@"RCErrorHTTPResponseHeaders"];
    }
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"URL session task failed with status code %lu", objc_msgSend(v13, "statusCode"));
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "rc_errorWithCode:description:additionalUserInfo:", 3, v18, v17);
    v43 = [v10 completionHandler];
    long long v29 = [v10 data];
    long long v30 = [v7 response];
    ((void (**)(void, void *, void *, void *))v43)[2](v43, v29, v30, v19);
  }
  else
  {
    long long v31 = RCSharedLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = objc_msgSend(v7, "rc_logIdentifier");
      *(_DWORD *)buf = 138543362;
      v50 = v32;
      _os_log_impl(&dword_1A4AB3000, v31, OS_LOG_TYPE_DEFAULT, "Network operation %{public}@ did succeed", buf, 0xCu);
    }
    v33 = [v10 completionHandler];

    if (!v33) {
      goto LABEL_21;
    }
    v17 = [v10 completionHandler];
    id v18 = [v10 data];
    uint64_t v19 = [v7 response];
    ((void (**)(void, void *, void *, void))v17)[2](v17, v18, v19, 0);
  }

LABEL_21:
  v34 = [v10 completionHandler];

  if (v34)
  {
    v35 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
    [v35 lock];

    __int16 v36 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
    id v37 = [v7 taskDescription];
    [v36 setObject:0 forKeyedSubscript:v37];

    uint64_t v38 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
    [v38 unlock];
  }
  else
  {
    uint64_t v38 = RCSharedLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v7, "rc_logIdentifier");
      v40 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
      v41 = [v40 allKeys];
      *(_DWORD *)buf = 138543618;
      v50 = v39;
      __int16 v51 = 2114;
      uint64_t v52 = (uint64_t)v41;
      _os_log_impl(&dword_1A4AB3000, v38, OS_LOG_TYPE_DEFAULT, "Network operation task %{public}@ has no completion handler. Tasks: %{public}@", buf, 0x16u);
    }
  }

LABEL_26:
}

void __77__RCNetworkOperationURLSessionDelegate_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = RCSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "rc_logIdentifier");
    v4 = [*(id *)(a1 + 40) runningTasks];
    char v5 = [v4 allKeys];
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2114;
    BOOL v9 = v5;
    _os_log_impl(&dword_1A4AB3000, v2, OS_LOG_TYPE_ERROR, "Network operation request: @%{public}@ failed to find existing task. Tasks: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  __int16 v8 = RCSharedLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v9 = objc_msgSend(v6, "rc_logIdentifier");
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_1A4AB3000, v8, OS_LOG_TYPE_DEBUG, "Network operation %{public}@ did finish collecting metrics: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [v7 taskDescription];

  if (v9)
  {
    int v10 = [v7 taskDescription];
    uint64_t v11 = RCSharedLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = objc_msgSend(v7, "rc_logIdentifier");
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = [v8 length];
      _os_log_impl(&dword_1A4AB3000, v11, OS_LOG_TYPE_DEFAULT, "Network operation with request %{public}@ received data (%lu bytes)", buf, 0x16u);
    }
    id v13 = [(RCNetworkOperationURLSessionDelegate *)self _networkTaskForIdentifier:v10];
    uint64_t v14 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
    [v14 lock];

    [v13 receiveData:v8];
    objc_super v15 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
    [v15 unlock];
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__RCNetworkOperationURLSessionDelegate_URLSession_dataTask_didReceiveData___block_invoke;
    v16[3] = &unk_1E5B76100;
    id v17 = v7;
    __75__RCNetworkOperationURLSessionDelegate_URLSession_dataTask_didReceiveData___block_invoke((uint64_t)v16);
    int v10 = v17;
  }
}

void __75__RCNetworkOperationURLSessionDelegate_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = RCSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "rc_logIdentifier");
    int v4 = 138543362;
    char v5 = v3;
    _os_log_impl(&dword_1A4AB3000, v2, OS_LOG_TYPE_ERROR, "Error: Missing task identifier for request %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v22 = 0;
  BOOL v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:0 error:&v22];
  id v10 = v22;
  uint64_t v11 = RCSharedLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = objc_msgSend(v7, "rc_logIdentifier");
    uint64_t v13 = [v9 length];
    uint64_t v14 = [v8 absoluteString];
    *(_DWORD *)buf = 138543874;
    v24 = v12;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2114;
    v28 = v14;
    _os_log_impl(&dword_1A4AB3000, v11, OS_LOG_TYPE_DEFAULT, "Network operation with request %{public}@ finished downloading data (%lu bytes) to location %{public}@", buf, 0x20u);
  }
  objc_super v15 = [v7 taskDescription];

  if (v15)
  {
    v16 = [v7 taskDescription];
    if (v10)
    {
      id v17 = RCSharedLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
      id v18 = objc_msgSend(v7, "rc_logIdentifier");
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      __int16 v25 = 2114;
      uint64_t v26 = (uint64_t)v10;
      _os_log_impl(&dword_1A4AB3000, v17, OS_LOG_TYPE_ERROR, "Network operation download %{public}@ failed with error: %{public}@", buf, 0x16u);
    }
    else
    {
      id v17 = [(RCNetworkOperationURLSessionDelegate *)self _networkTaskForIdentifier:v16];
      uint64_t v19 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
      [v19 lock];

      [v17 receiveData:v9];
      id v18 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
      [v18 unlock];
    }

    goto LABEL_10;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__RCNetworkOperationURLSessionDelegate_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  v20[3] = &unk_1E5B76100;
  id v21 = v7;
  __90__RCNetworkOperationURLSessionDelegate_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke((uint64_t)v20);
  v16 = v21;
LABEL_11:
}

void __90__RCNetworkOperationURLSessionDelegate_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = RCSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "rc_logIdentifier");
    int v4 = 138543362;
    char v5 = v3;
    _os_log_impl(&dword_1A4AB3000, v2, OS_LOG_TYPE_ERROR, "Error: Missing task identifier for request %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = RCSharedLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_msgSend(v4, "rc_logIdentifier");
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = v6;
    _os_log_impl(&dword_1A4AB3000, v5, OS_LOG_TYPE_DEFAULT, "Background URL session did finish for identifier: %{public}@", buf, 0xCu);
  }
  id v7 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v7 lock];

  id v8 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
  BOOL v9 = [v8 allValues];

  id v10 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v10 unlock];

  uint64_t v11 = [(RCNetworkOperationURLSessionDelegate *)self observerLock];
  [v11 lock];

  __int16 v12 = [(RCNetworkOperationURLSessionDelegate *)self sessionDidFinishObservers];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      objc_super v15 = [(RCNetworkOperationURLSessionDelegate *)self sessionDidFinishObservers];
      v16 = [v15 pointerAtIndex:v14];

      [v16 networkSessionDidFinishWithTasks:v9];
      ++v14;
      id v17 = [(RCNetworkOperationURLSessionDelegate *)self sessionDidFinishObservers];
      unint64_t v18 = [v17 count];
    }
    while (v14 < v18);
  }
  uint64_t v19 = [(RCNetworkOperationURLSessionDelegate *)self observerLock];
  [v19 unlock];

  __int16 v20 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v20 lock];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
  id v22 = [v21 allValues];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        __int16 v27 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v28 = [v27 completionHandler];

        if (!v28)
        {
          uint64_t v29 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
          long long v30 = [v27 identifier];
          [v29 setObject:0 forKeyedSubscript:v30];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v24);
  }

  long long v31 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v31 unlock];
}

- (id)_networkTaskForIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v5 lock];

  uint64_t v6 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    id v7 = [[RCNetworkOperationTask alloc] initWithIdentifier:v4];
    id v8 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
    [v8 setObject:v7 forKeyedSubscript:v4];
  }
  BOOL v9 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
  [v9 unlock];

  return v7;
}

- (id)_existingNetworkTaskForURLSessionTask:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 taskDescription];
  if (v5)
  {
    uint64_t v6 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
    [v6 lock];

    id v7 = [(RCNetworkOperationURLSessionDelegate *)self runningTasks];
    id v8 = [v7 objectForKeyedSubscript:v5];

    BOOL v9 = [(RCNetworkOperationURLSessionDelegate *)self taskLock];
    [v9 unlock];
  }
  else
  {
    id v10 = RCSharedLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_1A4AB3000, v10, OS_LOG_TYPE_ERROR, "Identifier is missing for task: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (RCUnfairLock)taskLock
{
  return self->_taskLock;
}

- (void)setTaskLock:(id)a3
{
}

- (NSMutableDictionary)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
}

- (RCUnfairLock)observerLock
{
  return self->_observerLock;
}

- (void)setObserverLock:(id)a3
{
}

- (NSPointerArray)sessionDidFinishObservers
{
  return self->_sessionDidFinishObservers;
}

- (void)setSessionDidFinishObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDidFinishObservers, 0);
  objc_storeStrong((id *)&self->_observerLock, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_taskLock, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end