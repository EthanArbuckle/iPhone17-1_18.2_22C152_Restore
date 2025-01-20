@interface ICURLSession
+ (id)_sanitizeURL:(id)a3;
+ (unint64_t)defaultMaximumConcurrentRequests;
- (ICURLSession)init;
- (ICURLSession)initWithConfiguration:(id)a3;
- (ICURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4;
- (ICURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4 qualityOfService:(int64_t)a5;
- (double)_timeoutForRequest:(id)a3;
- (id)_createURLSessionTaskForRequest:(id)a3 usingSession:(id)a4;
- (id)_createURLSessionWithConfiguration:(id)a3;
- (id)_newResponseForRequest:(id)a3;
- (id)_requestForTask:(id)a3;
- (unint64_t)maxConcurrentRequests;
- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didReceiveAVAssetDownloadToken:(unint64_t)a5;
- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_checkRequestTimeouts;
- (void)_enqueueRequest:(id)a3;
- (void)_finishRequest:(id)a3;
- (void)_processPendingRequests;
- (void)_processRequest:(id)a3;
- (void)_reportLoadURLMetricsWithSession:(id)a3 task:(id)a4 signatureName:(id)a5 request:(id)a6 error:(id)a7;
- (void)_scheduleNextRequestTimeoutCheck;
- (void)_updateProgressForSessionTask:(id)a3 withTotalBytesWritten:(int64_t)a4 totalBytesExpectedToWrite:(int64_t)a5;
- (void)cancelPendingRequestsWithError:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)cancelRequest:(id)a3 withError:(id)a4;
- (void)dealloc;
- (void)enqueueDataRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)enqueueDownloadRequest:(id)a3 toDestination:(id)a4 withCompletionHandler:(id)a5;
- (void)enqueueDownloadRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)enqueueUploadRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)pause;
- (void)pauseRequest:(id)a3;
- (void)resume;
- (void)resumeRequest:(id)a3;
@end

@implementation ICURLSession

uint64_t __32__ICURLSession__enqueueRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

void __31__ICURLSession__finishRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateState:3];
  v2 = [*(id *)(a1 + 32) currentURLRequest];
  v3 = (void *)[*(id *)(a1 + 40) _newResponseForRequest:*(void *)(a1 + 32)];
  v4 = [*(id *)(a1 + 32) responseHandler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__ICURLSession__finishRequest___block_invoke_2;
  v9[3] = &unk_1E5AC8360;
  int8x16_t v8 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  id v11 = v3;
  id v12 = v2;
  id v6 = v2;
  id v7 = v3;
  [v4 processCompletedResponse:v7 toRequest:v5 withCompletionHandler:v9];

  [*(id *)(a1 + 40) _scheduleNextRequestTimeoutCheck];
}

- (void)enqueueUploadRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setType:2];
  [v7 setCompletionHandler:v6];

  [(ICURLSession *)self _enqueueRequest:v7];
}

- (void)enqueueDataRequest:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int8x16_t v8 = [v6 urlRequest];
  v9 = [v8 URL];

  if (v9
    && ([v9 host],
        int8x16_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 length],
        v10,
        v11))
  {
    [v6 setType:0];
    [v6 setCompletionHandler:v7];
    [(ICURLSession *)self _enqueueRequest:v6];
  }
  else
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Enqueued data request with invalid url '%{public}@'", buf, 0x16u);
    }

    v13 = (void *)MEMORY[0x1E4F77950];
    uint64_t v14 = *MEMORY[0x1E4F778D8];
    v15 = [NSString stringWithFormat:@"Enqueued data request with invalid url '%@'", v9];
    [v13 snapshotWithDomain:v14 type:@"Bug" subType:@"ICURLSession" context:v15 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

    operationQueue = self->_operationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ICURLSession_enqueueDataRequest_withCompletionHandler___block_invoke;
    block[3] = &unk_1E5ACD2F0;
    id v19 = v7;
    id v18 = v9;
    dispatch_async(operationQueue, block);
  }
}

void __31__ICURLSession__finishRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 80);
  if ((unint64_t)(v2 - 1) > 1)
  {
LABEL_11:
    id v18 = [*(id *)(a1 + 32) completionHandler];
    v18[2](v18, *(void *)(a1 + 56), *(void *)(a1 + 64));

    [*(id *)(a1 + 32) setCompletionHandler:0];
    goto LABEL_12;
  }
  double v3 = 0.0;
  if (v2 != 1)
  {
    [*(id *)(a1 + 32) retryDelay];
    double v3 = v4;
  }
  unint64_t v5 = [*(id *)(a1 + 32) _retryCountForReason:*(void *)(a1 + 40)];
  unint64_t v6 = [*(id *)(a1 + 32) _maxRetryCountForReason:*(void *)(a1 + 40)];
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 >= v6)
  {
    if (v8)
    {
      double v16 = *(double *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544386;
      uint64_t v30 = v15;
      __int16 v31 = 2114;
      uint64_t v32 = v17;
      __int16 v33 = 2114;
      double v34 = v16;
      __int16 v35 = 2048;
      unint64_t v36 = v5;
      __int16 v37 = 2048;
      unint64_t v38 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rejecting retry for request %{public}@ (retryReason = %{public}@, retryCount = %lu, maxRetryCount = %lu)", buf, 0x34u);
    }

    goto LABEL_11;
  }
  if (v8)
  {
    unint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    uint64_t v30 = v9;
    __int16 v31 = 2114;
    uint64_t v32 = v11;
    __int16 v33 = 2048;
    double v34 = v3;
    __int16 v35 = 2114;
    unint64_t v36 = v10;
    __int16 v37 = 2048;
    unint64_t v38 = v5;
    __int16 v39 = 2048;
    unint64_t v40 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ retrying request %{public}@ in %f seconds (retryReason = %{public}@, retryCount = %lu, maxRetryCount = %lu)", buf, 0x3Eu);
  }

  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(NSObject **)(v13 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ICURLSession__finishRequest___block_invoke_64;
  block[3] = &unk_1E5ACD5C8;
  void block[4] = v13;
  id v27 = *(id *)(a1 + 32);
  id v28 = *(id *)(a1 + 40);
  dispatch_after(v12, v14, block);

LABEL_12:
  [*(id *)(a1 + 48) _processPendingRequests];
  id v19 = +[ICDeviceInfo currentDeviceInfo];
  int v20 = [v19 isInternalBuild];

  if (v20)
  {
    v21 = +[ICHTTPArchive sharedArchive];
    uint64_t v22 = *(void *)(a1 + 72);
    v23 = [*(id *)(a1 + 56) urlResponse];
    uint64_t v24 = [*(id *)(a1 + 56) bodyData];
    v25 = [*(id *)(a1 + 56) performanceMetrics];
    [v21 archiveRequest:v22 withResponse:v23 responseData:v24 performanceMetrics:v25];
  }
}

- (void)_enqueueRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    dispatch_time_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ICURLSession.m" lineNumber:541 description:@"_enqueue request called with nil request"];
  }
  unint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[ICURLRequest _nameForRequestType:](ICURLRequest, "_nameForRequestType:", [v5 type]);
    BOOL v8 = [v5 urlRequest];
    uint64_t v9 = [v8 URL];
    *(_DWORD *)buf = 138544130;
    int v20 = self;
    __int16 v21 = 2114;
    uint64_t v22 = v7;
    __int16 v23 = 2114;
    id v24 = v5;
    __int16 v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueing new %{public}@ request %{public}@ with url %{public}@", buf, 0x2Au);
  }
  [v5 updateState:0];
  accessQueue = self->_accessQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __32__ICURLSession__enqueueRequest___block_invoke;
  double v16 = &unk_1E5ACD4C8;
  uint64_t v17 = self;
  id v18 = v5;
  id v11 = v5;
  dispatch_sync(accessQueue, &v13);
  [(ICURLSession *)self _processPendingRequests];
}

- (void)_processPendingRequests
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__10618;
  void v9[4] = __Block_byref_object_dispose__10619;
  id v10 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICURLSession__processPendingRequests__block_invoke;
  block[3] = &unk_1E5ACD088;
  void block[4] = self;
  void block[5] = v9;
  block[6] = &v5;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v6 + 24)) {
    [(ICURLSession *)self _processPendingRequests];
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
}

void __48__ICURLSession__scheduleNextRequestTimeoutCheck__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    double v6 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        char v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v8, "requestState", (void)v22) != 2)
        {
          [*(id *)(a1 + 32) _timeoutForRequest:v8];
          if (v9 != 0.0)
          {
            double v10 = v9;
            [v8 lastUpdateTime];
            if (v10 + v11 < v6)
            {
              [v8 lastUpdateTime];
              double v6 = v10 + v12;
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v4);

    if (v6 != 3.40282347e38)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v14 = v6 - v13;
      uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v16;
        __int16 v28 = 2048;
        double v29 = v14;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling next timeout check in %.2fs", buf, 0x16u);
      }

      uint64_t v17 = *(NSObject **)(*(void *)(a1 + 32) + 72);
      dispatch_time_t v18 = dispatch_time(0, (unint64_t)(v14 * 1000000000.0));
      id v19 = v17;
      goto LABEL_20;
    }
  }
  else
  {
  }
  int v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v21;
    _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling timeout timer", buf, 0xCu);
  }

  id v19 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  dispatch_time_t v18 = -1;
LABEL_20:
  dispatch_source_set_timer(v19, v18, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (double)_timeoutForRequest:(id)a3
{
  uint64_t v4 = [a3 currentURLRequest];
  [v4 timeoutInterval];
  double v6 = v5;

  if (v6 == 0.0)
  {
    uint64_t v7 = [(NSURLSession *)self->_urlSession configuration];
    [v7 timeoutIntervalForRequest];
    double v6 = v8;
  }
  return v6 + v6;
}

void __39__ICURLSession__processPendingRequests__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = (void *)[*(id *)(v2 + 40) copy];
  double v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  double v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v38 = v7;
    __int16 v39 = 2048;
    uint64_t v40 = v3;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking request queue (counter = %lu).", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(NSObject **)(v8 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICURLSession__processPendingRequests__block_invoke_61;
  block[3] = &unk_1E5AC8788;
  void block[4] = v8;
  uint64_t v35 = v3;
  id v10 = v5;
  id v33 = v10;
  id v11 = v4;
  id v34 = v11;
  dispatch_async(v9, block);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v12);
        }
        if (objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "requestState", (void)v28) != 2) {
          ++v15;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  unint64_t v18 = 0;
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    while (1)
    {
      id v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectAtIndex:", v18, (void)v28);
      int v20 = v19;
      uint64_t v21 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v21 + 64) && v15 < *(void *)(v21 + 88)) {
        break;
      }
      if ([v19 prioritize]) {
        break;
      }

      if (++v18 >= [*(id *)(*(void *)(a1 + 32) + 40) count]) {
        goto LABEL_21;
      }
    }
  }
LABEL_21:
  if (v18 < objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "count", (void)v28))
  {
    uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndex:v18];
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setLastUpdateTime:");
    long long v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v26;
      __int16 v39 = 2114;
      uint64_t v40 = v27;
      _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Activating request %{public}@", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 32) _processRequest:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)_processRequest:(id)a3
{
  id v4 = a3;
  operationQueue = self->_operationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ICURLSession__processRequest___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(operationQueue, v7);
}

void __59__ICURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transactionMetrics];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) _requestForTask:*(void *)(a1 + 48)];
    if (v4)
    {
      id v12 = v4;
      double v5 = [NSString stringWithFormat:@"%@", *(void *)(a1 + 48)];
      id v6 = [ICURLPerformanceMetrics alloc];
      uint64_t v7 = [*(id *)(a1 + 32) transactionMetrics];
      id v8 = [v7 lastObject];
      double v9 = [(ICURLPerformanceMetrics *)v6 initWithTransactionMetrics:v8 request:v12 taskIdentifier:v5];

      id v10 = [v12 aggregatedPerformanceMetrics];
      id v11 = +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:v10 addingMetrics:v9];
      [v12 setAggregatedPerformanceMetrics:v11];

      id v4 = v12;
    }
  }
}

void __31__ICURLSession__finishRequest___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  double v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ICURLSession__finishRequest___block_invoke_3;
  block[3] = &unk_1E5AC8338;
  uint64_t v19 = a2;
  id v13 = *(id *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 48);
  id v17 = v8;
  id v18 = *(id *)(a1 + 56);
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __32__ICURLSession__processRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__ICURLSession__processRequest___block_invoke_3;
  v11[3] = &unk_1E5ACD640;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (id)_newResponseForRequest:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 type];
  if (v4 > 5)
  {
    id v12 = 0;
  }
  else
  {
    if (((1 << v4) & 0x3A) != 0)
    {
      id v5 = objc_alloc((Class)[(id)objc_opt_class() _responseClass]);
      id v6 = [v3 urlResponse];
      uint64_t v7 = [v3 currentURLRequest];
      id v8 = [v3 responseDataURL];
      id v9 = [v3 aggregatedPerformanceMetrics];
      uint64_t v10 = [v5 initWithURLResponse:v6 urlRequest:v7 bodyDataURL:v8 performanceMetrics:v9];
    }
    else
    {
      id v11 = objc_alloc((Class)[(id)objc_opt_class() _responseClass]);
      id v6 = [v3 urlResponse];
      uint64_t v7 = [v3 currentURLRequest];
      id v8 = [v3 responseData];
      id v9 = [v3 aggregatedPerformanceMetrics];
      uint64_t v10 = [v11 initWithURLResponse:v6 urlRequest:v7 bodyData:v8 performanceMetrics:v9];
    }
    id v12 = (void *)v10;
  }
  return v12;
}

void __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke(id *a1)
{
  v77[1] = *MEMORY[0x1E4F143B8];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__10618;
  v58 = __Block_byref_object_dispose__10619;
  id v59 = [a1[4] _requestForTask:a1[5]];
  if (v55[5])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend((id)v55[5], "setLastUpdateTime:");
    uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[4];
      unint64_t v4 = (void *)v55[5];
      id v5 = a1[6];
      *(_DWORD *)buf = 138412802;
      id v61 = v3;
      __int16 v62 = 2114;
      id v63 = v4;
      __int16 v64 = 2114;
      id v65 = v5;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ task finished. err=%{public}@", buf, 0x20u);
    }

    if ([(id)v55[5] type] != 3 && objc_msgSend((id)v55[5], "type") != 5)
    {
      id v6 = [a1[5] response];
      [(id)v55[5] setUrlResponse:v6];
    }
    id v7 = a1[6];
    if (v7)
    {
      id v8 = [v7 domain];
      int v9 = [v8 isEqualToString:*MEMORY[0x1E4F289A0]];

      if (v9)
      {
        uint64_t v10 = [a1[6] code];
        if (v10 == -1008 || v10 == -1100) {
          uint64_t v12 = -7104;
        }
        else {
          uint64_t v12 = -7100;
        }
      }
      else
      {
        uint64_t v12 = -7100;
      }
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28A50];
      id v18 = a1[6];
      uint64_t v76 = *MEMORY[0x1E4F28A50];
      v77[0] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
      int v20 = [v16 errorWithDomain:@"ICError" code:v12 userInfo:v19];

      uint64_t v21 = [(id)v55[5] error];
      uint64_t v22 = v21;
      if (v21)
      {
        uint64_t v23 = [v21 userInfo];
        if (v23)
        {
          long long v24 = [v22 userInfo];
          long long v25 = (void *)[v24 mutableCopy];
        }
        else
        {
          long long v25 = [MEMORY[0x1E4F1CA60] dictionary];
        }

        [v25 setObject:v20 forKey:v17];
        uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = [v22 domain];
        long long v28 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(v22, "code"), v25);
        [(id)v55[5] setError:v28];
      }
      else
      {
        [(id)v55[5] setError:v20];
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v30 = v29;
    [(id)v55[5] startTime];
    double v32 = v31;
    uint64_t v33 = [a1[5] countOfBytesSent];
    uint64_t v34 = [a1[5] countOfBytesReceived];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v36 = v35;
    [(id)v55[5] startTime];
    double v38 = v37;
    __int16 v39 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = a1[4];
      id v40 = a1[5];
      v42 = (void *)v55[5];
      uint64_t v43 = [v40 countOfBytesSent];
      uint64_t v44 = [a1[5] countOfBytesReceived];
      v45 = [(id)v55[5] error];
      *(_DWORD *)buf = 138545154;
      id v61 = v41;
      __int16 v62 = 2114;
      id v63 = v40;
      __int16 v64 = 2114;
      id v65 = v42;
      __int16 v66 = 2048;
      uint64_t v67 = v43;
      __int16 v68 = 2048;
      uint64_t v69 = v44;
      __int16 v70 = 2048;
      double v71 = v30 - v32;
      __int16 v72 = 2048;
      uint64_t v73 = (uint64_t)(((double)v33 + (double)v34) / (v36 - v38));
      __int16 v74 = 2114;
      v75 = v45;
      _os_log_impl(&dword_1A2D01000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ finished task %{public}@ for request %{public}@ [%lld sent, %lld rcvd in %.3fs (%lld bytes/s)]. err=%{public}@", buf, 0x52u);
    }
    id v13 = [(id)v55[5] loadURLMetricsRequestName];
    [*((id *)a1[4] + 6) removeObject:v55[5]];
    [a1[4] _finishRequest:v55[5]];
    if ([(id)v55[5] shouldReportLoadURLMetrics])
    {
      id v46 = a1[4];
      v47 = *((void *)v46 + 3);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke_29;
      v48[3] = &unk_1E5AC8248;
      v48[4] = v46;
      id v49 = a1[7];
      id v50 = a1[5];
      id v13 = v13;
      v51 = v13;
      v53 = &v54;
      id v52 = a1[6];
      dispatch_async(v47, v48);
    }
  }
  else
  {
    id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = a1[4];
      id v15 = a1[5];
      *(_DWORD *)buf = 138543618;
      id v61 = v14;
      __int16 v62 = 2114;
      id v63 = v15;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ no request for completed task %{public}@ - ignoring", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v54, 8);
}

void __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ICDeviceInfo currentDeviceInfo];
  int v3 = [v2 isInternalBuild];

  if (v3)
  {
    unint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v6;
      __int16 v27 = 2114;
      uint64_t v28 = v5;
      __int16 v29 = 2114;
      uint64_t v30 = v7;
      __int16 v31 = 2114;
      double v32 = v8;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ received response for task %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 48) statusCode];
    unint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = ICURLResponseStatusCodeGetExtendedDescription(v9);
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v11;
      __int16 v27 = 2114;
      uint64_t v28 = v10;
      __int16 v29 = 2114;
      uint64_t v30 = v12;
      __int16 v31 = 2114;
      double v32 = v13;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ received response for task %{public}@: %{public}@", buf, 0x2Au);
    }
  }

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setUrlResponse:*(void *)(a1 + 48)];
  id v14 = (void *)[*(id *)(a1 + 32) _newResponseForRequest:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  id v15 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) responseHandler];
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(*(void *)(v16 + 8) + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_43;
  v19[3] = &unk_1E5AC82C0;
  id v20 = v14;
  uint64_t v24 = v16;
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 64);
  id v18 = v14;
  [v15 processInitialResponse:v18 toRequest:v17 withCompletionHandler:v19];
}

void __51__ICURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _requestForTask:*(void *)(a1 + 40)];
  if (v5)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setLastUpdateTime:");
    uint64_t v2 = [v5 responseData];
    [v2 appendData:*(void *)(a1 + 48)];

    int v3 = [v5 progress];
    unint64_t v4 = [v5 responseData];
    objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v4, "length") + 1);
  }
}

void __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_43(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v17 = a4;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) urlResponse];
    uint64_t v11 = [v10 expectedContentLength];

    if (v11 >= 1)
    {
      uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) progress];
      [v12 setTotalUnitCount:v11 + 1];

      id v13 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) progress];
      [v13 setCompletedUnitCount:1];
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setHandlingType:a3];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setRetryReason:v17];
  id v14 = [*(id *)(a1 + 40) configuration];
  int v15 = [v14 _ignoreDidReceiveResponseDisposition];

  if (v15)
  {
    if (a2) {
      [*(id *)(a1 + 48) cancel];
    }
    uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v16();
}

void __32__ICURLSession__processRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2) {
    goto LABEL_2;
  }
  id v9 = *(void **)(a1 + 40);
  if (!v9)
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
LABEL_2:
    int v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      id v5 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v4;
      __int16 v41 = 2114;
      v42 = v5;
      __int16 v43 = 2114;
      id v44 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to build URL request. err=%{public}@", buf, 0x20u);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(NSObject **)(v6 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__ICURLSession__processRequest___block_invoke_62;
    block[3] = &unk_1E5ACD4C8;
    void block[4] = v6;
    id v38 = *(id *)(a1 + 56);
    dispatch_sync(v7, block);
    id v8 = [*(id *)(a1 + 56) completionHandler];
    ((void (**)(void, void, id))v8)[2](v8, 0, v2);

    [*(id *)(a1 + 56) setCompletionHandler:0];
    goto LABEL_19;
  }
  id v2 = (id)[v9 mutableCopy];
  uint64_t v10 = [*(id *)(a1 + 56) requestContext];
  uint64_t v11 = [v10 networkConstraints];

  if (v11
    && ([v11 shouldAllowDataForCellularNetworkTypes] & 1) == 0
    && [v2 allowsCellularAccess])
  {
    [v2 setAllowsCellularAccess:0];
  }
  uint64_t v12 = +[ICDefaults standardDefaults];
  id v13 = [v12 requestTimeoutOverride];

  if (v13)
  {
    [v13 doubleValue];
    objc_msgSend(v2, "setTimeoutInterval:");
  }
  [*(id *)(a1 + 56) setCurrentURLRequest:v2];
  id v14 = [*(id *)(a1 + 48) _createURLSessionTaskForRequest:*(void *)(a1 + 56) usingSession:*(void *)(*(void *)(a1 + 48) + 80)];
  [*(id *)(a1 + 56) setTask:v14];

  int v15 = +[ICDeviceInfo currentDeviceInfo];
  int v16 = [v15 isInternalBuild];

  id v17 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      uint64_t v19 = *(void **)(a1 + 56);
      uint64_t v35 = *(void *)(a1 + 48);
      uint64_t v34 = [v19 task];
      uint64_t v33 = [*(id *)(a1 + 56) retryCount] + 1;
      uint64_t v20 = [*(id *)(a1 + 56) maxRetryCount] + 1;
      id v21 = [*(id *)(a1 + 56) currentURLRequest];
      id v22 = [*(id *)(a1 + 56) currentURLRequest];
      id v23 = [v22 allHTTPHeaderFields];
      *(_DWORD *)buf = 138544898;
      uint64_t v40 = v35;
      __int16 v41 = 2114;
      v42 = v19;
      __int16 v43 = 2114;
      id v44 = v34;
      __int16 v45 = 2048;
      uint64_t v46 = v33;
      __int16 v47 = 2048;
      uint64_t v48 = v20;
      __int16 v49 = 2114;
      id v50 = v21;
      __int16 v51 = 2114;
      id v52 = v23;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ created URL task %{public}@ (attempt %lu/%lu) for request: %{public}@\n%{public}@", buf, 0x48u);
    }
  }
  else if (v18)
  {
    uint64_t v24 = *(void **)(a1 + 56);
    uint64_t v36 = *(void *)(a1 + 48);
    long long v25 = [v24 task];
    uint64_t v26 = [*(id *)(a1 + 56) retryCount] + 1;
    uint64_t v27 = [*(id *)(a1 + 56) maxRetryCount] + 1;
    uint64_t v28 = [*(id *)(a1 + 56) currentURLRequest];
    *(_DWORD *)buf = 138544642;
    uint64_t v40 = v36;
    __int16 v41 = 2114;
    v42 = v24;
    __int16 v43 = 2114;
    id v44 = v25;
    __int16 v45 = 2048;
    uint64_t v46 = v26;
    __int16 v47 = 2048;
    uint64_t v48 = v27;
    __int16 v49 = 2114;
    id v50 = v28;
    _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ created URL task %{public}@ (attempt %lu/%lu) for request: %{public}@", buf, 0x3Eu);
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [*(id *)(a1 + 56) setResponseData:v29];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v31 = v30;
  objc_msgSend(*(id *)(a1 + 56), "setLastUpdateTime:");
  [*(id *)(a1 + 56) setStartTime:v31];
  [*(id *)(a1 + 56) updateState:1];
  double v32 = [*(id *)(a1 + 56) task];
  [v32 resume];

  [*(id *)(a1 + 48) _scheduleNextRequestTimeoutCheck];
LABEL_19:
}

- (id)_requestForTask:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_activeRequests;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "task", (void)v14);
        uint64_t v11 = [v10 taskIdentifier];
        uint64_t v12 = [v4 taskIdentifier];

        if (v11 == v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_scheduleNextRequestTimeoutCheck
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICURLSession__scheduleNextRequestTimeoutCheck__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_finishRequest:(id)a3
{
  id v4 = a3;
  operationQueue = self->_operationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__ICURLSession__finishRequest___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(operationQueue, v7);
}

- (id)_createURLSessionTaskForRequest:(id)a3 usingSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  switch([v7 type])
  {
    case 0:
      id v9 = [v7 currentURLRequest];
      uint64_t v10 = [v8 dataTaskWithRequest:v9];
      goto LABEL_7;
    case 1:
      id v9 = [v7 currentURLRequest];
      uint64_t v10 = [v8 downloadTaskWithRequest:v9];
      goto LABEL_7;
    case 2:
      id v9 = [v7 currentURLRequest];
      uint64_t v11 = [v7 currentURLRequest];
      uint64_t v12 = [v11 HTTPBody];
      id v13 = [v8 uploadTaskWithRequest:v9 fromData:v12];

      break;
    case 4:
      id v9 = [v7 resumeData];
      uint64_t v10 = [v8 downloadTaskWithResumeData:v9];
LABEL_7:
      id v13 = (void *)v10;
      break;
    default:
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ICURLSession.m", 749, @"unsupported request type %d", objc_msgSend(v7, "type"));
      id v13 = 0;
      break;
  }

  return v13;
}

void __32__ICURLSession__processRequest___block_invoke(int8x16_t *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__ICURLSession__processRequest___block_invoke_2;
  v2[3] = &unk_1E5AC8310;
  int8x16_t v1 = a1[2];
  int8x16_t v3 = vextq_s8(v1, v1, 8uLL);
  [(id)v1.i64[0] buildURLRequestWithCompletionHandler:v2];
}

void __39__ICURLSession__processPendingRequests__block_invoke_61(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v5 = a1[7];
    int v7 = 138544130;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Request queue state for counter = %lu: _activeRequests = %{public}@, _pendingRequests = %{public}@", (uint8_t *)&v7, 0x2Au);
  }
}

uint64_t __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _requestForTask:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (ICURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4 qualityOfService:(int64_t)a5
{
  id v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ICURLSession;
  __int16 v9 = [(ICURLSession *)&v40 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_maxConcurrentRequests = a4;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSession.access", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v11;

    __int16 v13 = MEMORY[0x1E4F14430];
    id v14 = MEMORY[0x1E4F14430];
    if (a5 != -1)
    {
      unint64_t v15 = __ROR8__(a5 - 9, 3);
      if (v15 >= 4) {
        dispatch_qos_class_t v16 = QOS_CLASS_UNSPECIFIED;
      }
      else {
        dispatch_qos_class_t v16 = 8 * v15 + 9;
      }
      long long v17 = (void *)MEMORY[0x1E4F14430];
      __int16 v13 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], v16, 0);
    }
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSession.operation", v13);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSession.utility", v20);
    utilityQueue = v10->_utilityQueue;
    v10->_utilityQueue = (OS_dispatch_queue *)v21;

    id v23 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = v23;

    long long v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeRequests = v10->_activeRequests;
    v10->_activeRequests = v25;

    v10->_paused = 0;
    dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v10->_accessQueue);
    requestTimeoutTimer = v10->_requestTimeoutTimer;
    v10->_requestTimeoutTimer = (OS_dispatch_source *)v27;

    objc_initWeak(&location, v10);
    id v29 = v10->_requestTimeoutTimer;
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    uint64_t v36 = __77__ICURLSession_initWithConfiguration_maxConcurrentRequests_qualityOfService___block_invoke;
    double v37 = &unk_1E5ACD778;
    objc_copyWeak(&v38, &location);
    dispatch_source_set_event_handler(v29, &v34);
    dispatch_source_set_timer((dispatch_source_t)v10->_requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    dispatch_resume((dispatch_object_t)v10->_requestTimeoutTimer);
    objc_msgSend(v8, "timeoutIntervalForRequest", v34, v35, v36, v37);
    if (v30 == 0.0) {
      [v8 setTimeoutIntervalForRequest:120.0];
    }
    objc_msgSend(v8, "set_timingDataOptions:", 5);
    uint64_t v31 = [(ICURLSession *)v10 _createURLSessionWithConfiguration:v8];
    urlSession = v10->_urlSession;
    v10->_urlSession = (NSURLSession *)v31;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (id)_createURLSessionWithConfiguration:(id)a3
{
  return (id)[MEMORY[0x1E4F18DC0] sessionWithConfiguration:a3 delegate:self delegateQueue:0];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ICURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(accessQueue, block);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(accessQueue, block);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke;
  v15[3] = &unk_1E5ACD640;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(accessQueue, v15);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = __Block_byref_object_copy__10618;
  uint64_t v31 = __Block_byref_object_dispose__10619;
  id v32 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  block[3] = &unk_1E5ACCC88;
  uint64_t v26 = &v27;
  void block[4] = self;
  id v15 = v11;
  id v25 = v15;
  dispatch_sync(accessQueue, block);
  if (v28[5])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend((id)v28[5], "setLastUpdateTime:");
    operationQueue = self->_operationQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5AC82E8;
    v18[4] = self;
    id v23 = &v27;
    id v19 = v15;
    id v20 = v12;
    id v21 = v10;
    id v22 = v13;
    dispatch_async(operationQueue, v18);
  }
  else
  {
    id v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = self;
      __int16 v35 = 2114;
      id v36 = v15;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ no request for data task %{public}@ - ignoring", buf, 0x16u);
    }

    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
  }

  _Block_object_dispose(&v27, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (unint64_t)maxConcurrentRequests
{
  return self->_maxConcurrentRequests;
}

- (void)_reportLoadURLMetricsWithSession:(id)a3 task:(id)a4 signatureName:(id)a5 request:(id)a6 error:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [v10 aggregatedPerformanceMetrics];
  id v12 = [v11 urlMetrics];
  id v13 = [v12 lastObject];

  if (v13)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__ICURLSession__reportLoadURLMetricsWithSession_task_signatureName_request_error___block_invoke;
    v15[3] = &unk_1E5AC83B0;
    id v16 = v13;
    id v17 = v9;
    id v18 = v10;
    id v19 = self;
    id v20 = @"com.apple.amp.itunescloud.LoadURL";
    id v14 = (void *)MEMORY[0x1A6240BF0](v15);
    AnalyticsSendEventLazy();
  }
}

id __82__ICURLSession__reportLoadURLMetricsWithSession_task_signatureName_request_error___block_invoke(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = +[ICClientInfo defaultInfo];
  uint64_t v4 = [v3 bundleIdentifier];
  [v2 setObject:v4 forKeyedSubscript:@"app"];

  uint64_t v5 = [v3 clientVersion];
  [v2 setObject:v5 forKeyedSubscript:@"appVersion"];

  uint64_t v6 = [*(id *)(a1 + 32) appleTimingApp];
  id v7 = [v6 componentsSeparatedByString:@" "];

  id v8 = [v7 firstObject];
  uint64_t v9 = [v8 integerValue];

  if (v9 >= 1)
  {
    id v10 = [NSNumber numberWithInteger:v9];
    [v2 setObject:v10 forKeyedSubscript:@"appleTimingApp"];
  }
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "cachedResponse"));
  [v2 setObject:v11 forKeyedSubscript:@"cachedResponse"];

  id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "connectionReused"));
  [v2 setObject:v12 forKeyedSubscript:@"connectionReused"];

  id v13 = [*(id *)(a1 + 32) connectionType];
  [v2 setObject:v13 forKeyedSubscript:@"connectionType"];

  id v14 = +[ICEnvironmentMonitor sharedMonitor];
  uint64_t v15 = [v14 networkType];

  if (v15 > 499)
  {
    id v17 = @"Ethernet";
    id v18 = @"Other";
    if (v15 != 3000) {
      id v18 = 0;
    }
    if (v15 != 2000) {
      id v17 = v18;
    }
    id v19 = @"Bluetooth";
    if (v15 != 500) {
      id v19 = 0;
    }
    if ((unint64_t)(v15 - 1000) >= 2) {
      id v20 = v19;
    }
    else {
      id v20 = @"WiFi";
    }
    if (v15 <= 1999) {
      id v16 = v20;
    }
    else {
      id v16 = v17;
    }
  }
  else if ((unint64_t)(v15 - 1) < 8 || v15 == 100)
  {
    id v16 = @"Cellular";
  }
  else
  {
    id v16 = 0;
  }
  [v2 setObject:v16 forKeyedSubscript:@"radioType"];
  id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "redirectCount"));
  [v2 setObject:v21 forKeyedSubscript:@"redirectCount"];

  id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "requestBytesSent"));
  [v2 setObject:v22 forKeyedSubscript:@"requestMessageSize"];

  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"requestSignature"];
  id v23 = [*(id *)(a1 + 48) urlRequest];
  uint64_t v24 = [v23 URL];
  id v25 = +[ICURLSession _sanitizeURL:v24];
  [v2 setObject:v25 forKeyedSubscript:@"requestUrl"];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "responseBytesReceived"));
  [v2 setObject:v26 forKeyedSubscript:@"responseMessageSize"];

  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "responseMessageSize"));
  [v2 setObject:v27 forKeyedSubscript:@"responseMessageSizeUncompressed"];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "statusCode"));
  [v2 setObject:v28 forKeyedSubscript:@"statusCode"];

  uint64_t v29 = NSNumber;
  [*(id *)(a1 + 32) dnsTime];
  double v30 = objc_msgSend(v29, "numberWithDouble:");
  [v2 setObject:v30 forKeyedSubscript:@"domainLookupTime"];

  uint64_t v31 = NSNumber;
  [*(id *)(a1 + 32) connectionTime];
  id v32 = objc_msgSend(v31, "numberWithDouble:");
  [v2 setObject:v32 forKeyedSubscript:@"connectionTime"];

  uint64_t v33 = NSNumber;
  [*(id *)(a1 + 32) responseTime];
  uint64_t v34 = objc_msgSend(v33, "numberWithDouble:");
  [v2 setObject:v34 forKeyedSubscript:@"responseTime"];

  __int16 v35 = NSNumber;
  [*(id *)(a1 + 32) totalTime];
  id v36 = objc_msgSend(v35, "numberWithDouble:");
  [v2 setObject:v36 forKeyedSubscript:@"totalTime"];

  [*(id *)(a1 + 32) fetchStartTime];
  if (v37 != 0.0)
  {
    [*(id *)(a1 + 32) domainLookupStartTime];
    if (v38 != 0.0)
    {
      __int16 v39 = NSNumber;
      [*(id *)(a1 + 32) domainLookupStartTime];
      double v41 = v40;
      [*(id *)(a1 + 32) fetchStartTime];
      __int16 v43 = [v39 numberWithDouble:v41 - v42];
      [v2 setObject:v43 forKeyedSubscript:@"domainLookupStartTime"];
    }
  }
  [*(id *)(a1 + 32) fetchStartTime];
  if (v44 != 0.0)
  {
    [*(id *)(a1 + 32) connectionStartTime];
    if (v45 != 0.0)
    {
      uint64_t v46 = NSNumber;
      [*(id *)(a1 + 32) connectionStartTime];
      double v48 = v47;
      [*(id *)(a1 + 32) fetchStartTime];
      id v50 = [v46 numberWithDouble:v48 - v49];
      [v2 setObject:v50 forKeyedSubscript:@"connectionStartTime"];
    }
  }
  [*(id *)(a1 + 32) connectionStartTime];
  if (v51 != 0.0)
  {
    [*(id *)(a1 + 32) secureConnectionStartTime];
    if (v52 != 0.0)
    {
      uint64_t v53 = NSNumber;
      [*(id *)(a1 + 32) secureConnectionStartTime];
      double v55 = v54;
      [*(id *)(a1 + 32) connectionStartTime];
      v57 = [v53 numberWithDouble:v55 - v56];
      [v2 setObject:v57 forKeyedSubscript:@"secureConnectionStartTime"];
    }
  }
  [*(id *)(a1 + 32) connectionEndTime];
  if (v58 != 0.0)
  {
    [*(id *)(a1 + 32) requestStartTime];
    if (v59 != 0.0)
    {
      [*(id *)(a1 + 32) requestStartTime];
      double v61 = v60;
      [*(id *)(a1 + 32) connectionEndTime];
      if (v61 > v62)
      {
        id v63 = NSNumber;
        [*(id *)(a1 + 32) requestStartTime];
        double v65 = v64;
        [*(id *)(a1 + 32) connectionEndTime];
        uint64_t v67 = [v63 numberWithDouble:v65 - v66];
        [v2 setObject:v67 forKeyedSubscript:@"requestStartTime"];
      }
    }
  }
  [*(id *)(a1 + 32) requestStartTime];
  if (v68 != 0.0)
  {
    [*(id *)(a1 + 32) responseStartTime];
    if (v69 != 0.0)
    {
      __int16 v70 = NSNumber;
      [*(id *)(a1 + 32) responseStartTime];
      double v72 = v71;
      [*(id *)(a1 + 32) requestStartTime];
      __int16 v74 = [v70 numberWithDouble:v72 - v73];
      [v2 setObject:v74 forKeyedSubscript:@"responseStartTime"];
    }
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    v75 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v76 = *(void *)(a1 + 56);
      uint64_t v77 = *(void *)(a1 + 64);
      int v79 = 138543874;
      uint64_t v80 = v76;
      __int16 v81 = 2114;
      uint64_t v82 = v77;
      __int16 v83 = 2112;
      v84 = v2;
      _os_log_impl(&dword_1A2D01000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ Logging CoreAnalytics %{public}@ event: %@", (uint8_t *)&v79, 0x20u);
    }
  }

  return v2;
}

- (void)_updateProgressForSessionTask:(id)a3 withTotalBytesWritten:(int64_t)a4 totalBytesExpectedToWrite:(int64_t)a5
{
  id v8 = a3;
  accessQueue = self->_accessQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__ICURLSession__updateProgressForSessionTask_withTotalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  v11[3] = &unk_1E5AC8388;
  void v11[4] = self;
  id v12 = v8;
  int64_t v13 = a5;
  int64_t v14 = a4;
  id v10 = v8;
  dispatch_sync(accessQueue, v11);
}

void __94__ICURLSession__updateProgressForSessionTask_withTotalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _requestForTask:*(void *)(a1 + 40)];
  if (v2)
  {
    id v11 = v2;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3;
    if (*(uint64_t *)(a1 + 48) >= 1)
    {
      uint64_t v5 = [v11 progress];
      uint64_t v6 = [v5 totalUnitCount];
      uint64_t v7 = *(void *)(a1 + 48) + 1;

      if (v6 != v7)
      {
        id v8 = [v11 progress];
        [v8 setTotalUnitCount:*(void *)(a1 + 48) + 1];
      }
      [v11 lastProgressUpdateTime];
      if (v4 - v9 > 0.5)
      {
        id v10 = [v11 progress];
        [v10 setCompletedUnitCount:*(void *)(a1 + 56) + 1];

        [v11 setLastProgressUpdateTime:v4];
      }
    }
    [v11 setLastUpdateTime:v4];
    id v2 = v11;
  }
}

- (void)_checkRequestTimeouts
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ICURLSession__checkRequestTimeouts__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __37__ICURLSession__checkRequestTimeouts__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking for timeouts", buf, 0xCu);
  }

  double v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    char v9 = 0;
    char v10 = 0;
    uint64_t v11 = *(void *)v25;
    *(void *)&long long v7 = 138543618;
    long long v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v5);
        }
        int64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "requestState", v23, (void)v24) != 2)
        {
          [*(id *)(a1 + 32) _timeoutForRequest:v13];
          if (v14 == 0.0
            || (double v15 = v14,
                [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate],
                double v17 = v16,
                [v13 lastUpdateTime],
                v17 <= v15 + v18))
          {
            char v9 = 1;
          }
          else
          {
            id v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v23;
              uint64_t v29 = v20;
              __int16 v30 = 2114;
              uint64_t v31 = v13;
              _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ timing out request %{public}@", buf, 0x16u);
            }

            id v21 = *(void **)(a1 + 32);
            id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7003 userInfo:0];
            [v21 cancelRequest:v13 withError:v22];

            char v9 = 1;
            char v10 = 1;
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);

    if (!(v10 & 1 | ((v9 & 1) == 0))) {
      [*(id *)(a1 + 32) _scheduleNextRequestTimeoutCheck];
    }
  }
  else
  {
  }
}

void __31__ICURLSession__finishRequest___block_invoke_64(id *a1)
{
  id v2 = *((void *)a1[4] + 1);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ICURLSession__finishRequest___block_invoke_2_65;
  block[3] = &unk_1E5ACD5C8;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  dispatch_sync(v2, block);
  [a1[4] _processPendingRequests];
}

uint64_t __31__ICURLSession__finishRequest___block_invoke_2_65(uint64_t a1)
{
  [*(id *)(a1 + 32) setError:0];
  id v2 = [*(id *)(a1 + 32) task];
  [v2 cancel];

  [*(id *)(a1 + 32) setTask:0];
  [*(id *)(a1 + 32) setCurrentURLRequest:0];
  [*(id *)(a1 + 32) setHandlingType:0];
  [*(id *)(a1 + 32) setRetryReason:0];
  [*(id *)(a1 + 32) _incrementRetryCountForReason:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) updateState:0];
  id v3 = *(void **)(*(void *)(a1 + 48) + 40);
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 addObject:v4];
}

uint64_t __32__ICURLSession__processRequest___block_invoke_62(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(accessQueue, block);
}

void __66__ICURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _requestForTask:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v4;
      __int16 v29 = 2114;
      __int16 v30 = v2;
      __int16 v31 = 2114;
      uint64_t v32 = v5;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ download task finished. location=%{public}@", buf, 0x20u);
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v2, "setLastUpdateTime:");
    id v6 = [*(id *)(a1 + 40) response];
    uint64_t v7 = [v6 statusCode];
    id v8 = [*(id *)(a1 + 40) error];

    if (v8 || v7 < 300)
    {
      char v9 = [v2 responseDataURL];
      if (!v9 && !*(void *)(a1 + 48))
      {
        char v9 = 0;
        goto LABEL_17;
      }
      id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 48);
        double v16 = [v2 responseDataURL];
        *(_DWORD *)buf = 138413058;
        uint64_t v28 = v14;
        __int16 v29 = 2114;
        __int16 v30 = v2;
        __int16 v31 = 2114;
        uint64_t v32 = v15;
        __int16 v33 = 2114;
        uint64_t v34 = v16;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ moving download file %{public}@ --> %{public}@", buf, 0x2Au);
      }
      double v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v18 = *(void *)(a1 + 48);
      id v19 = [v2 responseDataURL];
      id v26 = 0;
      char v20 = [v17 moveItemAtURL:v18 toURL:v19 error:&v26];
      id v11 = v26;

      if ((v20 & 1) == 0)
      {
        id v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          uint64_t v23 = *(void *)(a1 + 48);
          long long v24 = [v2 responseDataURL];
          *(_DWORD *)buf = 138413314;
          uint64_t v28 = v22;
          __int16 v29 = 2114;
          __int16 v30 = v2;
          __int16 v31 = 2114;
          uint64_t v32 = v23;
          __int16 v33 = 2114;
          uint64_t v34 = v24;
          __int16 v35 = 2114;
          id v36 = v11;
          _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%@ %{public}@ failed to move download file from %{public}@ --> %{public}@. err=%{public}@", buf, 0x34u);
        }
        long long v25 = [v2 error];

        if (!v25) {
          [v2 setError:v11];
        }
      }
    }
    else
    {
      char v9 = [v2 error];
      id v10 = (void *)MEMORY[0x1E4F28C58];
      ICURLResponseStatusCodeGetExtendedDescription(v7);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = objc_msgSend(v10, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7004, v9, @"Download request received HTTP status code %@", v11);
      [v2 setError:v12];
    }
LABEL_17:
  }
}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didReceiveAVAssetDownloadToken:(unint64_t)a5
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__ICURLSession_URLSession_avAssetDownloadTask_didReceiveAVAssetDownloadToken___block_invoke;
  v9[3] = &unk_1E5ACD4C8;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(accessQueue, v9);
}

void __78__ICURLSession_URLSession_avAssetDownloadTask_didReceiveAVAssetDownloadToken___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _requestForTask:*(void *)(a1 + 40)];
  if (v1)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v1, "setLastUpdateTime:");
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__10618;
  v31[4] = __Block_byref_object_dispose__10619;
  id v32 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  block[3] = &unk_1E5ACCC88;
  __int16 v30 = v31;
  void block[4] = self;
  id v16 = v11;
  id v29 = v16;
  dispatch_sync(accessQueue, block);
  operationQueue = self->_operationQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v22[3] = &unk_1E5AC82E8;
  id v26 = v14;
  long long v27 = v31;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v16;
  id v18 = v16;
  id v19 = v13;
  id v20 = v12;
  id v21 = v14;
  dispatch_async(operationQueue, v22);

  _Block_object_dispose(v31, 8);
}

uint64_t __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _requestForTask:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v11;
      __int16 v38 = 2114;
      uint64_t v39 = v12;
      id v13 = "%{public}@ no request for redirected task %{public}@ - ignoring";
      id v14 = v10;
      uint32_t v15 = 22;
LABEL_15:
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
LABEL_16:

    char v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_17:
    v9();
    return;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setLastUpdateTime:");
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) redirectCount] >= 0x14)
  {
    uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v3;
      __int16 v38 = 2114;
      uint64_t v39 = v4;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ exceeded the redirect limit - aborting", buf, 0x16u);
    }

    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28228];
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Too many redirects (%d)", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "redirectCount"));
    v43[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    id v8 = [v5 errorWithDomain:@"ICError" code:-7102 userInfo:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setError:v8];

    char v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_17;
  }
  if (!*(void *)(a1 + 40) || !*(void *)(a1 + 48))
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      uint64_t v31 = *(void *)(a1 + 40);
      id v32 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v30;
      __int16 v38 = 2114;
      uint64_t v39 = v31;
      __int16 v40 = 2114;
      double v41 = v32;
      id v13 = "%{public}@ either response %{public}@ or new request %{public}@ is invalid - ignoring";
      id v14 = v10;
      uint32_t v15 = 32;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v19 = [*(id *)(a1 + 48) URL];
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v17;
    __int16 v38 = 2114;
    uint64_t v39 = v18;
    __int16 v40 = 2114;
    double v41 = v19;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ handling redirect response --> %{public}@", buf, 0x20u);
  }
  id v20 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) currentURLRequest];
  id v21 = (void *)[v20 mutableCopy];
  uint64_t v22 = [*(id *)(a1 + 48) URL];
  [v21 setURL:v22];

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCurrentURLRequest:v21];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setRedirectCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "redirectCount") + 1);
  id v23 = objc_alloc((Class)[(id)objc_opt_class() _responseClass]);
  uint64_t v24 = *(void *)(a1 + 40);
  id v25 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) aggregatedPerformanceMetrics];
  id v26 = (void *)[v23 initWithURLResponse:v24 urlRequest:v20 bodyData:0 performanceMetrics:v25];

  long long v27 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) responseHandler];
  uint64_t v28 = *(void *)(a1 + 72);
  uint64_t v29 = *(void *)(*(void *)(v28 + 8) + 40);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_38;
  v33[3] = &unk_1E5AC8298;
  v33[4] = *(void *)(a1 + 32);
  uint64_t v35 = v28;
  id v34 = *(id *)(a1 + 64);
  [v27 processInitialResponse:v26 toRequest:v29 withCompletionHandler:v33];
}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_39;
  block[3] = &unk_1E5ACCEA0;
  id v13 = v6;
  uint64_t v14 = v7;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v11;
  long long v15 = v11;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_39(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v4;
      __int16 v13 = 2114;
      uint64_t v14 = v3;
      __int16 v15 = 2114;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Failed to process redirect response. err=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void **)(*(void *)(v6 + 8) + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_40;
    v8[3] = &unk_1E5AC8270;
    uint64_t v10 = v6;
    id v9 = *(id *)(a1 + 48);
    [v7 buildURLRequestWithCompletionHandler:v8];
  }
}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setCurrentURLRequest:");
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = (void (**)(id, uint64_t, void *))a6;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__10618;
  uint64_t v30 = __Block_byref_object_dispose__10619;
  id v31 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__ICURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E5ACCC88;
  id v25 = &v26;
  void block[4] = self;
  id v15 = v11;
  id v24 = v15;
  dispatch_sync(accessQueue, block);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend((id)v27[5], "setLastUpdateTime:");
  uint64_t v16 = [v12 protectionSpace];
  uint64_t v17 = [v16 authenticationMethod];
  if (![v17 isEqualToString:*MEMORY[0x1E4F18C78]])
  {
    if ([v17 isEqualToString:*MEMORY[0x1E4F18CB8]])
    {
      uint64_t v18 = +[ICDeviceInfo currentDeviceInfo];
      if (![v18 isInternalBuild])
      {
        uint64_t v19 = 1;
        goto LABEL_3;
      }
      id v21 = +[ICDefaults standardDefaults];
      int v22 = [v21 ignoreExtendedCertificateValidation];

      if (v22)
      {
        id v20 = objc_msgSend(MEMORY[0x1E4F18D88], "credentialForTrust:", objc_msgSend(v16, "serverTrust"));
        uint64_t v19 = 0;
        goto LABEL_9;
      }
    }
    id v20 = 0;
    uint64_t v19 = 1;
    goto LABEL_9;
  }
  uint64_t v18 = [v12 sender];
  uint64_t v19 = objc_opt_respondsToSelector() & 1;
LABEL_3:

  id v20 = 0;
LABEL_9:
  v13[2](v13, v19, v20);

  _Block_object_dispose(&v26, 8);
}

uint64_t __70__ICURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _requestForTask:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportLoadURLMetricsWithSession:*(void *)(a1 + 40) task:*(void *)(a1 + 48) signatureName:*(void *)(a1 + 56) request:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) error:*(void *)(a1 + 64)];
}

- (void)resume
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__ICURLSession_resume__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  [(ICURLSession *)self _processPendingRequests];
}

void __22__ICURLSession_resume__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v3;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming...", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "requestState", (void)v11) == 2)
          {
            id v10 = [v9 task];
            [v10 resume];

            [v9 setRequestState:1];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)pause
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__ICURLSession_pause__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __21__ICURLSession_pause__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v3;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Pausing...", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(v9, "prioritize", (void)v11) & 1) == 0 && objc_msgSend(v9, "requestState") != 2)
          {
            id v10 = [v9 task];
            [v10 suspend];

            [v9 setRequestState:2];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)cancelPendingRequestsWithError:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ICURLSession_cancelPendingRequestsWithError___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __47__ICURLSession_cancelPendingRequestsWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v16 = v10;
            __int16 v17 = 2114;
            uint64_t v18 = v8;
            _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ cancelling request...", buf, 0x16u);
          }

          [v8 setHandlingType:0];
          [v8 setRetryReason:0];
          [v8 setMaxRetryCount:0];
          [v8 setError:*(void *)(a1 + 40)];
          [*(id *)(a1 + 32) _finishRequest:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
      }
      while (v5);
    }
  }
}

- (void)cancelRequest:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ICURLSession_cancelRequest_withError___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

void __40__ICURLSession_cancelRequest_withError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ cancelling request...", (uint8_t *)&v9, 0x16u);
  }

  [*(id *)(a1 + 40) setHandlingType:0];
  [*(id *)(a1 + 40) setRetryReason:0];
  [*(id *)(a1 + 40) setMaxRetryCount:0];
  [*(id *)(a1 + 40) setError:*(void *)(a1 + 48)];
  if ([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v5 = [*(id *)(a1 + 40) task];
    [v5 cancel];
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _finishRequest:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ failed to cancel request because it could not be found", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)cancelRequest:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"ICError" code:-7004 userInfo:0];
  [(ICURLSession *)self cancelRequest:v5 withError:v6];
}

- (void)resumeRequest:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__ICURLSession_resumeRequest___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __30__ICURLSession_resumeRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ resuming request...", (uint8_t *)&v9, 0x16u);
  }

  int v5 = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)];
  id v6 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t result = [v6 requestState];
    if (result == 2)
    {
      id v8 = [*(id *)(a1 + 40) task];
      [v8 resume];

      return [*(id *)(a1 + 40) setRequestState:1];
    }
  }
  else
  {
    [v6 setRequestState:0];
    return [*(id *)(a1 + 32) _processPendingRequests];
  }
  return result;
}

- (void)pauseRequest:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __29__ICURLSession_pauseRequest___block_invoke;
  uint64_t v10 = &unk_1E5ACD4C8;
  __int16 v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, &v7);
  [(ICURLSession *)self _processPendingRequests];
}

uint64_t __29__ICURLSession_pauseRequest___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ pausing request...", (uint8_t *)&v7, 0x16u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)]
    && [*(id *)(a1 + 40) requestState] != 2)
  {
    int v5 = [*(id *)(a1 + 40) task];
    [v5 suspend];
  }
  return [*(id *)(a1 + 40) setRequestState:2];
}

- (void)enqueueDownloadRequest:(id)a3 toDestination:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = a3;
  uint64_t v10 = [v12 resumeData];
  if (v10) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 1;
  }
  [v12 setType:v11];

  [v12 setCompletionHandler:v8];
  [v12 setResponseDataURL:v9];

  [(ICURLSession *)self _enqueueRequest:v12];
}

- (void)enqueueDownloadRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a4;
  id v8 = a3;
  id v9 = NSTemporaryDirectory();
  uint64_t v10 = NSString;
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v11 UUIDString];
  uint64_t v13 = [v10 stringWithFormat:@"tmp.%@", v12];
  long long v14 = [v9 stringByAppendingPathComponent:v13];
  id v15 = [v6 fileURLWithPath:v14];

  [(ICURLSession *)self enqueueDownloadRequest:v8 toDestination:v15 withCompletionHandler:v7];
}

void __57__ICURLSession_enqueueDataRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7101, 0, @"Enqueued data request with invalid url '%@'", *(void *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)dealloc
{
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer) {
    dispatch_source_cancel(requestTimeoutTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICURLSession;
  [(ICURLSession *)&v4 dealloc];
}

void __77__ICURLSession_initWithConfiguration_maxConcurrentRequests_qualityOfService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _checkRequestTimeouts];
    id WeakRetained = v2;
  }
}

- (ICURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4
{
  return [(ICURLSession *)self initWithConfiguration:a3 maxConcurrentRequests:a4 qualityOfService:-1];
}

- (ICURLSession)initWithConfiguration:(id)a3
{
  return [(ICURLSession *)self initWithConfiguration:a3 maxConcurrentRequests:3];
}

- (ICURLSession)init
{
  uint64_t v3 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  objc_super v4 = [(ICURLSession *)self initWithConfiguration:v3];

  return v4;
}

+ (id)_sanitizeURL:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
    [v3 setFragment:0];
    objc_super v4 = [v3 queryItems];
    int v5 = objc_msgSend(v4, "msv_filter:", &__block_literal_global_10701);
    [v3 setQueryItems:v5];

    id v6 = [v3 string];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __29__ICURLSession__sanitizeURL___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 name];
  if ([v3 isEqualToString:@"guid"])
  {
    objc_super v4 = [v2 name];
    uint64_t v5 = [v4 isEqualToString:@"id"] ^ 1;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

+ (unint64_t)defaultMaximumConcurrentRequests
{
  return 3;
}

@end