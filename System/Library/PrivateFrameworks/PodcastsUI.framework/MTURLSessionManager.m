@interface MTURLSessionManager
+ (id)originalURLForTask:(id)a3;
+ (int64_t)statusCodeForTask:(id)a3;
+ (void)purgeExternalCookies;
- (BOOL)_subclassImplementsConfigureSession;
- (BOOL)_subclassImplementsDataDidDownload;
- (BOOL)_subclassImplementsDidFailWithError;
- (BOOL)_subclassImplementsInstanceMethod:(SEL)a3;
- (BOOL)_subclassImplementsURLDidDownload;
- (MTURLSessionManager)init;
- (NSURLSession)sessionForBackgroundDownloads;
- (NSURLSession)sessionForForegroundDownloads;
- (OS_dispatch_queue)startQueue;
- (id)backgroundSessionConfigurationIdentifier;
- (id)sessionCompletionHandler;
- (id)sessionForConfiguration:(id)a3;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)_assertSubclassRequirements;
- (void)_invokeURLSessionBackgroundEventsCompletionHandler;
- (void)_showCredentialsActionControllerForHost:(id)a3 signIn:(id)a4 cancel:(id)a5;
- (void)loadSessionsIfNeeded;
- (void)setSessionCompletionHandler:(id)a3;
- (void)setSessionForBackgroundDownloads:(id)a3;
- (void)setSessionForForegroundDownloads:(id)a3;
- (void)setStartQueue:(id)a3;
- (void)startDownloadTaskForURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 usePrivatePath:(id)a6 downloadStartedBlock:(id)a7;
@end

@implementation MTURLSessionManager

+ (id)originalURLForTask:(id)a3
{
  v3 = [a3 originalRequest];
  v4 = [v3 URL];

  return v4;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v23 = self;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_1E3BC5000, v11, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didCompleteWithError called for task %@ with session %@. Error: %@", buf, 0x2Au);
  }

  v12 = [MEMORY[0x1E4F91F10] sharedLogger];
  int v13 = [v12 shouldOverrideCondition:@"MAXDEBUG" file:@"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F91F10] sharedLogger];
    [v14 logFunction:"-[MTURLSessionManager URLSession:task:didCompleteWithError:]", @"Session Did Complete: %@", v8 format];
  }
  v15 = [MEMORY[0x1E4F91F10] sharedLogger];
  v16 = v15;
  if (v10)
  {
    v17 = debuggingInfoForTask(v9);
    v18 = [v10 description];
    [v16 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m", 487, @"ERROR: %@ (%@)", v17, v18 lineNumber format];

    [(MTURLSessionManager *)self _invokeURLSessionBackgroundEventsCompletionHandler];
    [(MTURLSessionManager *)self task:v9 didFailWithError:v10 orStatusCode:-1];
  }
  else
  {
    int v19 = [v15 shouldOverrideCondition:@"MAXDEBUG" file:@"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"];

    if (v19)
    {
      v20 = [MEMORY[0x1E4F91F10] sharedLogger];
      v21 = debuggingInfoForTask(v9);
      [v20 logFunction:"-[MTURLSessionManager URLSession:task:didCompleteWithError:]", @"SUCCESS: %@", v21 format];
    }
  }
}

void __116__MTURLSessionManager_startDownloadTaskForURL_userInitiated_useBackgroundFetch_usePrivatePath_downloadStartedBlock___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) loadSessionsIfNeeded];
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72)) {
    [v2 sessionForBackgroundDownloads];
  }
  else {
  v3 = [v2 sessionForForegroundDownloads];
  }
  v4 = [MEMORY[0x1E4F28E88] requestWithURL:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setNonAppInitiated:", objc_msgSend(*(id *)(a1 + 48), "nonAppInitiated"));
  v5 = [v3 downloadTaskWithRequest:v4];
  v6 = v5;
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(v5, "set_pathToDownloadTaskFile:");
    v7 = _MTLogCategoryDownload();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v6 _pathToDownloadTaskFile];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1E3BC5000, v7, OS_LOG_TYPE_DEFAULT, "Download task created for URL %@. Response to be stored at %@.", buf, 0x16u);
    }
  }
  [v6 setInteractive:*(unsigned __int8 *)(a1 + 73)];
  [v6 setUseBackgroundFetch:*(unsigned __int8 *)(a1 + 72)];
  id v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  int v13 = [v10 stringWithFormat:@"%@ task for: %@", v12, *(void *)(a1 + 40)];
  [v6 setTaskDescription:v13];

  if (*(unsigned char *)(a1 + 73))
  {
    LODWORD(v14) = 1.0;
    [v6 setPriority:v14];
  }
  v15 = [MEMORY[0x1E4F91F10] sharedLogger];
  int v16 = [v15 shouldOverrideCondition:@"MAXDEBUG" file:@"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F91F10] sharedLogger];
    [v17 logFunction:"-[MTURLSessionManager startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:]_block_invoke", @"Start: %@, Session: %@, backgroundFetch: %d", *(void *)(a1 + 40), v3, *(unsigned __int8 *)(a1 + 72) format];
  }
  [v6 resume];
  uint64_t v18 = *(void *)(a1 + 64);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, 1);
  }
}

- (void)loadSessionsIfNeeded
{
  v3 = [(MTURLSessionManager *)self sessionForBackgroundDownloads];

  if (!v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = [(MTURLSessionManager *)v4 sessionForBackgroundDownloads];

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E4F290F0];
      v7 = [(MTURLSessionManager *)v4 backgroundSessionConfigurationIdentifier];
      uint64_t v8 = [v6 backgroundSessionConfigurationWithIdentifier:v7];

      objc_msgSend(v8, "set_allowsConstrainedNetworkAccess:", 0);
      id v9 = [(MTURLSessionManager *)v4 sessionForConfiguration:v8];
      [(MTURLSessionManager *)v4 setSessionForBackgroundDownloads:v9];
    }
    objc_sync_exit(v4);
  }
  id v10 = [(MTURLSessionManager *)self sessionForForegroundDownloads];

  if (!v10)
  {
    obj = self;
    objc_sync_enter(obj);
    v11 = [(MTURLSessionManager *)obj sessionForForegroundDownloads];

    if (!v11)
    {
      v12 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
      int v13 = [(MTURLSessionManager *)obj sessionForConfiguration:v12];
      [(MTURLSessionManager *)obj setSessionForForegroundDownloads:v13];
    }
    objc_sync_exit(obj);
  }
}

- (NSURLSession)sessionForForegroundDownloads
{
  return self->_sessionForForegroundDownloads;
}

- (NSURLSession)sessionForBackgroundDownloads
{
  return self->_sessionForBackgroundDownloads;
}

- (void)_invokeURLSessionBackgroundEventsCompletionHandler
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MTURLSessionManager *)self sessionCompletionHandler];
    v5 = _Block_copy(v4);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    double v14 = v5;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ _invokeURLSessionBackgroundEventsCompletionHandler called with completionHandler: %@.", buf, 0x16u);
  }
  v6 = [(MTURLSessionManager *)self sessionCompletionHandler];

  if (v6)
  {
    v7 = [(MTURLSessionManager *)self sessionCompletionHandler];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MTURLSessionManager__invokeURLSessionBackgroundEventsCompletionHandler__block_invoke;
    block[3] = &unk_1E6E1FB48;
    id v10 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    [(MTURLSessionManager *)self setSessionCompletionHandler:0];
  }
}

- (id)sessionCompletionHandler
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_sessionCompletionHandler);
  objc_sync_exit(v2);

  return v3;
}

- (MTURLSessionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTURLSessionManager;
  v2 = [(MTURLSessionManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(MTURLSessionManager *)v2 _assertSubclassRequirements];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    v6 = (const char *)[v5 UTF8String];
    dispatch_queue_t v7 = dispatch_queue_create(v6, MEMORY[0x1E4F14430]);
    [(MTURLSessionManager *)v3 setStartQueue:v7];

    id v8 = v3;
  }

  return v3;
}

- (void)setStartQueue:(id)a3
{
}

- (void)_assertSubclassRequirements
{
  BOOL v3 = [(MTURLSessionManager *)self _subclassImplementsDataDidDownload];
  BOOL v4 = [(MTURLSessionManager *)self _subclassImplementsURLDidDownload];
  BOOL v5 = [(MTURLSessionManager *)self _subclassImplementsDidFailWithError];
  BOOL v6 = [(MTURLSessionManager *)self _subclassImplementsConfigureSession];
  if (v3 && v4)
  {
    dispatch_queue_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    id v9 = @"Subclasses may not implement both -task:didCompleteWithData: and -task:didCompleteWithDownloadedContentUrl:";
    goto LABEL_11;
  }
  if (!v3 && !v4)
  {
    dispatch_queue_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    id v9 = @"Subclasses must implement one of -task:didCompleteWithData: or -task:didCompleteWithDownloadedContentUrl:";
    goto LABEL_11;
  }
  if (!v5)
  {
    dispatch_queue_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    id v9 = @"Subclasses must implement task:didFailWithError:orStatusCode:";
    goto LABEL_11;
  }
  if (!v6)
  {
    dispatch_queue_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    id v9 = @"Subclasses must implement configureSession:";
LABEL_11:
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
}

- (BOOL)_subclassImplementsInstanceMethod:(SEL)a3
{
  uint64_t v5 = +[MTURLSessionManager instanceMethodForSelector:](MTURLSessionManager, "instanceMethodForSelector:");
  return [(MTURLSessionManager *)self methodForSelector:a3] != v5;
}

- (BOOL)_subclassImplementsURLDidDownload
{
  return [(MTURLSessionManager *)self _subclassImplementsInstanceMethod:sel_task_didCompleteWithDownloadedContentUrl_];
}

- (BOOL)_subclassImplementsDidFailWithError
{
  return [(MTURLSessionManager *)self _subclassImplementsInstanceMethod:sel_task_didFailWithError_orStatusCode_];
}

- (BOOL)_subclassImplementsDataDidDownload
{
  return [(MTURLSessionManager *)self _subclassImplementsInstanceMethod:sel_task_didCompleteWithData_];
}

- (BOOL)_subclassImplementsConfigureSession
{
  return [(MTURLSessionManager *)self _subclassImplementsInstanceMethod:sel_configureSession_];
}

- (id)sessionForConfiguration:(id)a3
{
  id v4 = a3;
  [v4 setAllowsCellularAccess:1];
  [v4 setDiscretionary:0];
  [v4 setSessionSendsLaunchEvents:1];
  [v4 setHTTPShouldUsePipelining:1];
  [v4 setRequestCachePolicy:1];
  [v4 setHTTPShouldSetCookies:0];
  [v4 setHTTPCookieAcceptPolicy:1];
  [(MTURLSessionManager *)self configureSession:v4];
  uint64_t v5 = objc_opt_new();
  if (isMulticore()) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setMaxConcurrentOperationCount:v6];
  dispatch_queue_t v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = [v4 identifier];
  v11 = [v7 stringWithFormat:@"%@ - %@", v9, v10];
  [v5 setName:v11];

  v12 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v4 delegate:self delegateQueue:v5];

  return v12;
}

- (void)setSessionForForegroundDownloads:(id)a3
{
}

- (void)setSessionForBackgroundDownloads:(id)a3
{
}

- (void)startDownloadTaskForURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5 usePrivatePath:(id)a6 downloadStartedBlock:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = [v12 url];
  if (v15)
  {
    int v16 = [(MTURLSessionManager *)self startQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __116__MTURLSessionManager_startDownloadTaskForURL_userInitiated_useBackgroundFetch_usePrivatePath_downloadStartedBlock___block_invoke;
    v18[3] = &unk_1E6E20A18;
    v18[4] = self;
    BOOL v23 = a5;
    id v19 = v15;
    id v20 = v12;
    id v21 = v13;
    BOOL v24 = a4;
    id v22 = v14;
    dispatch_async(v16, v18);
  }
  else
  {
    v17 = _MTLogCategoryDownload();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E3BC5000, v17, OS_LOG_TYPE_ERROR, "Download task failed to start. Found nil URL", buf, 2u);
    }

    if (v14) {
      (*((void (**)(id, void))v14 + 2))(v14, 0);
    }
  }
}

- (OS_dispatch_queue)startQueue
{
  return self->_startQueue;
}

- (id)backgroundSessionConfigurationIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setSessionCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v7 = _Block_copy(v4);
    int v10 = 138412546;
    v11 = v5;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1E3BC5000, v6, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ setting sessionCompletionHandler to %@.", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = _Block_copy(v4);
  id sessionCompletionHandler = v5->_sessionCompletionHandler;
  v5->_id sessionCompletionHandler = v8;

  objc_sync_exit(v5);
  [(MTURLSessionManager *)v5 loadSessionsIfNeeded];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    id v52 = v9;
    __int16 v53 = 2112;
    id v54 = v11;
    _os_log_impl(&dword_1E3BC5000, v13, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didReceiveChallenge called for task %@ with session %@. Challenge: %@", buf, 0x2Au);
  }

  uint64_t v14 = [v11 proposedCredential];
  uint64_t v15 = [v11 protectionSpace];
  if (!v14)
  {
    int v16 = [MEMORY[0x1E4F290A0] sharedCredentialStorage];
    v17 = [v16 credentialsForProtectionSpace:v15];

    if ([v17 count] == 1)
    {
      uint64_t v18 = [v17 allValues];
      id v19 = [v18 firstObject];

      id v20 = (void *)MEMORY[0x1E4F29098];
      id v21 = [v19 user];
      id v22 = [v19 password];
      uint64_t v14 = [v20 credentialWithUser:v21 password:v22 persistence:3];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v52) = 0;
  LOBYTE(v52) = [v11 previousFailureCount] > 2;
  BOOL v23 = [v11 failureResponse];
  if (v23 && [v11 previousFailureCount] >= 1)
  {

    if (v14)
    {
      BOOL v24 = [MEMORY[0x1E4F91F10] sharedLogger];
      int v25 = [v24 shouldOverrideCondition:@"MAXDEBUG" file:@"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Networking/MTURLSessionManager.m"];

      if (v25)
      {
        __int16 v26 = [MEMORY[0x1E4F91F10] sharedLogger];
        objc_msgSend(v26, "logFunction:format:", "-[MTURLSessionManager URLSession:task:didReceiveChallenge:completionHandler:]", @"Failing auth due to max failure count: %ld", objc_msgSend(v11, "previousFailureCount"));
      }
      [v10 setUserCanceledAuth:1];
    }
    uint64_t v14 = 0;
  }
  else
  {
  }
  if ([MEMORY[0x1E4F91FC8] supportsGUI])
  {
    int v27 = [v10 isInteractive];
    uint64_t v28 = *(void *)&buf[8];
    if (v27 && !*(unsigned char *)(*(void *)&buf[8] + 24) && !v14)
    {
      id v29 = [v10 originalRequest];
      uint64_t v30 = [v29 URL];

      v31 = [MEMORY[0x1E4F91F60] sharedInstance];
      v32 = [v31 importContext];

      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      char v50 = 0;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
      v43[3] = &unk_1E6E1FD80;
      id v33 = v32;
      id v44 = v33;
      id v34 = v30;
      id v45 = v34;
      v46 = &v47;
      [v33 performBlockAndWait:v43];
      if (!*((unsigned char *)v48 + 24))
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2;
        block[3] = &unk_1E6E20A68;
        id v38 = v10;
        v39 = self;
        id v40 = v11;
        id v41 = v12;
        v42 = buf;
        dispatch_async(MEMORY[0x1E4F14428], block);

        _Block_object_dispose(&v47, 8);
        goto LABEL_30;
      }

      _Block_object_dispose(&v47, 8);
      if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
        goto LABEL_28;
      }
LABEL_25:
      uint64_t v35 = 3;
LABEL_29:
      (*((void (**)(id, uint64_t, void))v12 + 2))(v12, v35, 0);
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v28 = *(void *)&buf[8];
  }
  if (*(unsigned char *)(v28 + 24)) {
    goto LABEL_25;
  }
  if (!v14)
  {
LABEL_28:
    uint64_t v35 = 1;
    goto LABEL_29;
  }
  (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
LABEL_30:
  _Block_object_dispose(buf, 8);
}

void __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) absoluteString];
  id v5 = [v2 podcastForFeedUrl:v3];

  id v4 = v5;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 isAuthenticatedDark];
    id v4 = v5;
  }
}

void __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) originalRequest];
  BOOL v3 = [v2 URL];
  id v4 = [v3 host];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3;
  v10[3] = &unk_1E6E20A40;
  id v5 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4;
  v6[3] = &unk_1E6E209A0;
  uint64_t v9 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  [v5 _showCredentialsActionControllerForHost:v4 signIn:v10 cancel:v6];
}

void __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x1E4F290A0];
  id v6 = a2;
  id v4 = [v3 sharedCredentialStorage];
  id v5 = [*(id *)(a1 + 32) protectionSpace];
  [v4 setCredential:v6 forProtectionSpace:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __77__MTURLSessionManager_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 32) setUserCanceledAuth:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_showCredentialsActionControllerForHost:(id)a3 signIn:(id)a4 cancel:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = NSString;
  id v10 = (void *)MEMORY[0x1E4F28B50];
  id v11 = a3;
  id v12 = [v10 mainBundle];
  id v13 = [v12 localizedStringForKey:@"AUTHENTICATION_MESSAGE" value:&stru_1F3F553C0 table:0];
  uint64_t v14 = objc_msgSend(v9, "stringWithFormat:", v13, v11);

  uint64_t v15 = (void *)MEMORY[0x1E4FB1418];
  int v16 = [MEMORY[0x1E4F28B50] mainBundle];
  v17 = [v16 localizedStringForKey:@"AUTHENTICATION_TITLE" value:&stru_1F3F553C0 table:0];
  uint64_t v18 = [v15 alertControllerWithTitle:v17 message:v14 preferredStyle:1];

  id v19 = (void *)MEMORY[0x1E4FB1410];
  id v20 = [MEMORY[0x1E4F28B50] mainBundle];
  id v21 = [v20 localizedStringForKey:@"AUTHENTICATION_SIGNIN" value:&stru_1F3F553C0 table:0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke;
  v34[3] = &unk_1E6E20A90;
  id v35 = v18;
  id v36 = v7;
  id v22 = v7;
  id v23 = v18;
  BOOL v24 = [v19 actionWithTitle:v21 style:0 handler:v34];
  [v23 addAction:v24];

  int v25 = (void *)MEMORY[0x1E4FB1410];
  __int16 v26 = [MEMORY[0x1E4F28B50] mainBundle];
  int v27 = [v26 localizedStringForKey:@"Cancel" value:&stru_1F3F553C0 table:0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_2;
  v32[3] = &unk_1E6E20AB8;
  id v33 = v8;
  id v28 = v8;
  id v29 = [v25 actionWithTitle:v27 style:1 handler:v32];
  [v23 addAction:v29];

  [v23 addTextFieldWithConfigurationHandler:&__block_literal_global_17];
  [v23 addTextFieldWithConfigurationHandler:&__block_literal_global_72];
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4FB1EC0], "mt_rootViewController");
  v31 = objc_msgSend(v30, "mt_topViewController");

  [v31 presentViewController:v23 animated:1 completion:0];
}

void __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  id v10 = [v2 objectAtIndex:0];

  BOOL v3 = [*(id *)(a1 + 32) textFields];
  id v4 = [v3 objectAtIndex:1];

  id v5 = (void *)MEMORY[0x1E4F29098];
  id v6 = [v10 text];
  id v7 = [v4 text];
  id v8 = [v5 credentialWithUser:v6 password:v7 persistence:3];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
  }
}

uint64_t __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  id v3 = a2;
  id v5 = [v2 mainBundle];
  id v4 = [v5 localizedStringForKey:@"Username" value:&stru_1F3F553C0 table:0];
  [v3 setPlaceholder:v4];
}

void __77__MTURLSessionManager__showCredentialsActionControllerForHost_signIn_cancel___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setSecureTextEntry:1];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v4 localizedStringForKey:@"Password" value:&stru_1F3F553C0 table:0];
  [v2 setPlaceholder:v3];
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  id v11 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    id v36 = v9;
    _os_log_impl(&dword_1E3BC5000, v11, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didReceiveChallenge called for session %@. Challenge: %@", buf, 0x20u);
  }

  id v12 = [v9 protectionSpace];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v36 = __Block_byref_object_copy__7;
  v37 = __Block_byref_object_dispose__7;
  id v38 = [v9 proposedCredential];
  BOOL v13 = [v9 previousFailureCount] > 2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6E20B00;
  BOOL v34 = v13;
  id v14 = v10;
  id v32 = v14;
  id v33 = buf;
  uint64_t v15 = (void (**)(void))_Block_copy(aBlock);
  int v16 = [v12 authenticationMethod];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F28988]];

  if (!v17) {
    goto LABEL_8;
  }
  uint64_t v18 = [MEMORY[0x1E4F58108] defaultTrustManager];
  uint64_t v19 = [v12 serverTrust];
  id v20 = [v12 host];
  int v21 = [v18 actionForTrust:v19 forHost:v20 andService:*MEMORY[0x1E4F58110]];

  if (v21 == 1)
  {
    id v22 = (void *)MEMORY[0x1E4F29098];
    id v23 = [v9 protectionSpace];
    uint64_t v24 = objc_msgSend(v22, "credentialForTrust:", objc_msgSend(v23, "serverTrust"));
    int v25 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v24;

    goto LABEL_8;
  }
  if (v21 != 2)
  {
LABEL_8:
    v15[2](v15);
    goto LABEL_9;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke_2;
  v26[3] = &unk_1E6E20B28;
  int v27 = v9;
  id v28 = v12;
  uint64_t v30 = buf;
  id v29 = v15;
  [v8 getAllTasksWithCompletionHandler:v26];

LABEL_9:
  _Block_object_dispose(buf, 8);
}

uint64_t __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__MTURLSessionManager_URLSession_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  id v5 = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v3);
      }
      if (objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v8), "isInteractive", (void)v22)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v6) {
          goto LABEL_3;
        }
        id v5 = v3;
        goto LABEL_14;
      }
    }

    id v5 = objc_alloc_init(MEMORY[0x1E4F58100]);
    uint64_t v9 = [*(id *)(a1 + 32) protectionSpace];
    objc_msgSend(v5, "setTrust:", objc_msgSend(v9, "serverTrust"));

    id v10 = [*(id *)(a1 + 32) protectionSpace];
    id v11 = [v10 host];
    [v5 setHost:v11];

    uint64_t v12 = *MEMORY[0x1E4F58110];
    [v5 setService:*MEMORY[0x1E4F58110]];
    int v13 = [v5 showAndWaitForResponse];
    if (v13 != 1)
    {
      if (v13 != 2) {
        goto LABEL_14;
      }
      id v14 = [MEMORY[0x1E4F58108] defaultTrustManager];
      uint64_t v15 = [*(id *)(a1 + 40) serverTrust];
      int v16 = [*(id *)(a1 + 40) host];
      [v14 addSSLTrust:v15 hostname:v16 service:v12];
    }
    int v17 = (void *)MEMORY[0x1E4F29098];
    uint64_t v18 = [*(id *)(a1 + 32) protectionSpace];
    uint64_t v19 = objc_msgSend(v17, "credentialForTrust:", objc_msgSend(v18, "serverTrust"));
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    int v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
LABEL_14:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_1E3BC5000, v11, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ didFinishDownloadingToURL called for task %@ with session %@ and location %@", (uint8_t *)&v14, 0x2Au);
  }

  if ([(MTURLSessionManager *)self _subclassImplementsURLDidDownload])
  {
    [(MTURLSessionManager *)self task:v9 didCompleteWithDownloadedContentUrl:v10];
  }
  else
  {
    uint64_t v12 = [(id)objc_opt_class() statusCodeForTask:v9];
    if (v10 && v12 == 200)
    {
      int v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10];
      [(MTURLSessionManager *)self task:v9 didCompleteWithData:v13];
    }
    else
    {
      [(MTURLSessionManager *)self task:v9 didFailWithError:0 orStatusCode:v12];
    }
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1E3BC5000, v8, OS_LOG_TYPE_ERROR, "[BackgroundSession] %@ didBecomeInvalidWithError called for session %@ with error %@.", (uint8_t *)&v9, 0x20u);
  }

  [(MTURLSessionManager *)self _invokeURLSessionBackgroundEventsCompletionHandler];
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MTURLSessionManager *)self sessionCompletionHandler];
    id v7 = _Block_copy(v6);
    int v8 = 138412802;
    int v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ URLSessionDidFinishEventsForBackgroundURLSession called for session %@ with completionHandler: %@.", (uint8_t *)&v8, 0x20u);
  }
  [(MTURLSessionManager *)self _invokeURLSessionBackgroundEventsCompletionHandler];
}

+ (int64_t)statusCodeForTask:(id)a3
{
  id v3 = [a3 response];
  int64_t v4 = [v3 statusCode];

  return v4;
}

uint64_t __73__MTURLSessionManager__invokeURLSessionBackgroundEventsCompletionHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)purgeExternalCookies
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = _MTLogCategoryNetwork();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEBUG, "Purging external cookies", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v4 = [v3 cookies];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        __int16 v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "domain", v16);
        char v12 = [v11 hasSuffix:@".apple.com"];

        if ((v12 & 1) == 0)
        {
          __int16 v13 = _MTLogCategoryNetwork();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v14 = [v10 domain];
            uint64_t v15 = [v10 value];
            *(_DWORD *)buf = v16;
            uint64_t v22 = v14;
            __int16 v23 = 2112;
            long long v24 = v15;
            _os_log_impl(&dword_1E3BC5000, v13, OS_LOG_TYPE_DEBUG, "Purging cookie: %@ (%@)", buf, 0x16u);
          }
          [v3 deleteCookie:v10];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionForBackgroundDownloads, 0);
  objc_storeStrong((id *)&self->_startQueue, 0);
  objc_storeStrong((id *)&self->_sessionForForegroundDownloads, 0);

  objc_storeStrong(&self->_sessionCompletionHandler, 0);
}

@end