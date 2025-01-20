@interface SWCDownloader
- (SWCDownloader)init;
- (SWCDownloaderDelegate)delegate;
- (id)_URLRequestWithDomain:(id)a3 downloadRoute:(unsigned __int8)a4;
- (id)_replaceTaskState:(id)a3;
- (id)_sessionForTaskState:(id)a3;
- (id)_taskStateForDomain:(id)a3 downloadRoute:(unsigned __int8)a4;
- (unint64_t)_maximumActiveTaskCountForSessionID:(unsigned __int8)a3;
- (unsigned)_sessionIDForTaskState:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 discretionary:(BOOL)a6 completionHandlers:(id)a7;
- (void)_enumerateTaskStatesUsingBlock:(id)a3;
- (void)_invokeCompletionHandlerForState:(id)a3 JSONObject:(id)a4 error:(id)a5;
- (void)_processDownloadedDataForState:(id)a3;
- (void)_resumePendingTasks;
- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6;
- (void)enumerateActiveAASAFileDownloadsWithBlock:(id)a3;
- (void)receiveSIGTERMSignal;
- (void)setDelegate:(id)a3;
- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6;
@end

@implementation SWCDownloader

- (SWCDownloader)init
{
  v12.receiver = self;
  v12.super_class = (Class)SWCDownloader;
  v2 = [(SWCDownloader *)&v12 init];
  if (v2)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v4;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"SWC download queue"];
    [(NSOperationQueue *)v2->_queue setName:v6];

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("SWC download queue (U)", v7);

    if (v8) {
      [(NSOperationQueue *)v2->_queue setUnderlyingQueue:v8];
    }

    uint64_t v9 = +[NSMapTable weakToStrongObjectsMapTable];
    allTaskStates = v2->_allTaskStates;
    v2->_allTaskStates = (NSMapTable *)v9;
  }
  return v2;
}

- (void)receiveSIGTERMSignal
{
  v3 = (void *)os_transaction_create();
  v4 = [(NSOperationQueue *)self->_queue underlyingQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005364;
  v6[3] = &unk_1000347C0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:](self, "downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:", v10, v8, [v10 modeOfOperation] != 0, v9);
}

- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6
{
  uint64_t v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (v13)
  {
    id v6 = objc_retainBlock(v13);
    id v16 = v6;
    v15 = +[NSArray arrayWithObjects:&v16 count:1];
  }
  else
  {
    v15 = 0;
  }
  [(SWCDownloader *)self _downloadAASAFileForDomain:v11 applicationIdentifier:v12 downloadRoute:v8 discretionary:0 completionHandlers:v15];
  if (v14)
  {
  }
}

- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  -[SWCDownloader updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:](self, "updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:", v10, v8, [v10 modeOfOperation] != 0, v9);
}

- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6
{
  uint64_t v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = v13;
  if (v13)
  {
    id v6 = objc_retainBlock(v13);
    id v16 = v6;
    v15 = +[NSArray arrayWithObjects:&v16 count:1];
  }
  else
  {
    v15 = 0;
  }
  [(SWCDownloader *)self _downloadAASAFileForDomain:v11 applicationIdentifier:v12 downloadRoute:v8 discretionary:1 completionHandlers:v15];
  if (v14)
  {
  }
}

- (void)enumerateActiveAASAFileDownloadsWithBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(NSOperationQueue *)self->_queue underlyingQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000580C;
  v8[3] = &unk_100034810;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  dispatch_sync(v6, v8);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t, void *))a6;
  id v12 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v12);

  allTaskStates = self->_allTaskStates;
  v14 = [v9 taskDescription];
  v15 = [(NSMapTable *)allTaskStates objectForKey:v14];

  if (v15)
  {
    id v16 = [v10 protectionSpace];
    v17 = [v16 authenticationMethod];
    unsigned int v18 = [v17 isEqualToString:NSURLAuthenticationMethodServerTrust];

    if (!v18)
    {
      v25 = 0;
      uint64_t v27 = 1;
LABEL_28:

      goto LABEL_29;
    }
    id v19 = [v16 serverTrust];
    if (!v19)
    {
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      v28 = qword_10003B1A8;
      if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v41 = v16;
        __int16 v42 = 2112;
        v43 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to get server trust from %@ for task %@", buf, 0x16u);
      }
      id v29 = objc_alloc((Class)NSError);
      v38[0] = @"Line";
      v38[1] = @"Function";
      v39[0] = &off_100036738;
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:task:didReceiveChallenge:completionHandler:]");
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v39[1] = v24;
      v30 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
      id v31 = [v29 initWithDomain:_SWCErrorDomain code:101 userInfo:v30];
      [(SWCDownloader *)self _invokeCompletionHandlerForState:v15 JSONObject:0 error:v31];

      goto LABEL_26;
    }
    v20 = [v15 domain];
    unsigned __int8 v21 = [v20 modeOfOperation];

    v22 = +[SWCSecurityGuard sharedSecurityGuard];
    id v37 = 0;
    unsigned int v23 = [v22 verifyTrust:v19 allowInstalledRootCertificates:v21 & 1 error:&v37];
    id v24 = v37;

    if (v23)
    {
      v25 = +[NSURLCredential credentialForTrust:v19];
      if (v25)
      {
        if (qword_10003B1B0 != -1) {
          dispatch_once(&qword_10003B1B0, &stru_100034918);
        }
        v26 = qword_10003B1A8;
        if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v41 = v10;
          __int16 v42 = 2112;
          v43 = v15;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Successfully got credential for challenge %@ for task %@", buf, 0x16u);
        }
        uint64_t v27 = 0;
        goto LABEL_27;
      }
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      uint64_t v36 = qword_10003B1A8;
      if (!os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412546;
      id v41 = v19;
      __int16 v42 = 2112;
      v43 = v15;
      v33 = "Failed to get credential from server trust %@ for task %@";
      v34 = v36;
      uint32_t v35 = 22;
    }
    else
    {
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      uint64_t v32 = qword_10003B1A8;
      if (!os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412802;
      id v41 = v19;
      __int16 v42 = 2112;
      v43 = v15;
      __int16 v44 = 2114;
      id v45 = v24;
      v33 = "Failed to verify server trust %@ for task %@: %{public}@";
      v34 = v32;
      uint32_t v35 = 32;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
LABEL_25:
    [(SWCDownloader *)self _invokeCompletionHandlerForState:v15 JSONObject:0 error:v24];
LABEL_26:
    v25 = 0;
    uint64_t v27 = 2;
LABEL_27:

    goto LABEL_28;
  }
  v25 = 0;
  uint64_t v27 = 2;
LABEL_29:

  v11[2](v11, v27, v25);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  id v12 = (void (**)(id, void))a7;
  id v13 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v13);

  allTaskStates = self->_allTaskStates;
  v15 = [v10 taskDescription];
  id v16 = [(NSMapTable *)allTaskStates objectForKey:v15];

  if (v16)
  {
    v17 = [v11 URL];
    unsigned int v18 = [v17 scheme];

    if (v18 && ![v18 caseInsensitiveCompare:@"https"])
    {
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      id v19 = (id)qword_10003B1A8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v24 = [v10 originalRequest];
        v25 = [v24 URL];
        v26 = [v11 URL];
        int v27 = 138412802;
        v28 = v25;
        __int16 v29 = 2112;
        v30 = v26;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Allowing redirect '%@' -> '%@' for task %@", (uint8_t *)&v27, 0x20u);
      }
      id v20 = v11;
    }
    else
    {
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      id v19 = (id)qword_10003B1A8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v21 = [v10 originalRequest];
        v22 = [v21 URL];
        unsigned int v23 = [v11 URL];
        int v27 = 138412802;
        v28 = v22;
        __int16 v29 = 2112;
        v30 = v23;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Denying redirect '%@' -> '%@' for task %@ because the new URL has a bad scheme", (uint8_t *)&v27, 0x20u);
      }
      id v20 = 0;
    }

    ((void (**)(id, id))v12)[2](v12, v20);
  }
  else
  {
    v12[2](v12, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, uint64_t))a6;
  id v12 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v12);

  allTaskStates = self->_allTaskStates;
  v14 = [v9 taskDescription];
  v15 = [(NSMapTable *)allTaskStates objectForKey:v14];

  if (v15)
  {
    if (qword_10003B1B0 != -1) {
      dispatch_once(&qword_10003B1B0, &stru_100034918);
    }
    id v16 = (id)qword_10003B1A8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v40 = [v10 URL];
      *(_DWORD *)buf = 138412546;
      v56 = v40;
      __int16 v57 = 2112;
      v58 = (char *)v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Received URL '%@' response start for task %@", buf, 0x16u);
    }
    v17 = [(__CFString *)v15 buffer];
    [v17 setLength:0];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      unsigned int v18 = (id)qword_10003B1A8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v42 = [v10 URL];
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        __int16 v44 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v56 = v42;
        __int16 v57 = 2112;
        v58 = (char *)v15;
        __int16 v59 = 2114;
        v60 = v44;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Request for '%@' for task %@ denied because it is not an HTTP response (%{public}@)", buf, 0x20u);
      }
      uint64_t v22 = 0;
      goto LABEL_51;
    }
    unsigned int v18 = v10;
    v52 = (char *)[v18 statusCode];
    id v19 = [v18 valueForHTTPHeaderField:@"Apple-Failure-Reason"];
    id v20 = [v18 valueForHTTPHeaderField:@"Apple-Failure-Details"];
    if ([v20 length])
    {
      if ([(__CFString *)v19 length])
      {
        unsigned __int8 v21 = [(__CFString *)v19 stringByAppendingFormat:@" -- %@", v20];
      }
      else
      {
        unsigned __int8 v21 = v20;
      }
      unsigned int v23 = v21;
    }
    else
    {
      unsigned int v23 = v19;
    }

    CFStringRef v24 = v23;
    if (![(__CFString *)v23 length])
    {

      CFStringRef v24 = @"unknown";
    }
    unsigned int v25 = [(__CFString *)v15 downloadRoute];
    unint64_t v26 = (unint64_t)(v52 - 400);
    if (v25)
    {
      if (v26 <= 0x63)
      {
        id v27 = objc_alloc((Class)NSError);
        v53[0] = @"Line";
        v53[1] = @"Function";
        v54[0] = &off_100036768;
        v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]");
        v54[1] = v28;
        __int16 v29 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
        v30 = (__CFString *)v24;
        id v31 = [v27 initWithDomain:@"HTTP" code:v52 userInfo:v29];
        [(__CFString *)v15 setCancellationError:v31];

        if (qword_10003B1B0 != -1) {
          dispatch_once(&qword_10003B1B0, &stru_100034918);
        }
        uint64_t v32 = (id)qword_10003B1A8;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v45 = [v18 URL];
          sub_1000050D8((uint64_t)[(__CFString *)v15 downloadRoute]);
          v46 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v56 = v45;
          __int16 v57 = 2048;
          v58 = v52;
          __int16 v59 = 2114;
          v60 = v46;
          __int16 v61 = 2112;
          CFStringRef v62 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Request for '%@' denied due to HTTP status %lli on route %{public}@ for task %@", buf, 0x2Au);
        }
LABEL_49:
        uint64_t v22 = 0;
        goto LABEL_50;
      }
      v30 = (__CFString *)v24;
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      v38 = qword_10003B1A8;
      if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v56 = v52;
        __int16 v57 = 2112;
        v58 = (char *)v15;
        v39 = "Proceeding with response (status: %lli) for task %@";
LABEL_43:
        _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, v39, buf, 0x16u);
      }
    }
    else
    {
      if (v26 < 0xC8)
      {
        id v51 = objc_alloc((Class)NSError);
        v66[0] = &off_100036750;
        v65[0] = @"Line";
        v65[1] = @"Function";
        v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]");
        v66[1] = v50;
        v66[2] = v24;
        v65[2] = NSDebugDescriptionErrorKey;
        v65[3] = NSUnderlyingErrorKey;
        id v33 = objc_alloc((Class)NSError);
        v63[1] = @"Function";
        v64[0] = &off_100036750;
        v63[0] = @"Line";
        v49 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]");
        v64[1] = v49;
        v48 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
        id v34 = [v33 initWithDomain:@"HTTP" code:v52];
        v66[3] = v34;
        uint32_t v35 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
        v30 = (__CFString *)v24;
        id v36 = [v51 initWithDomain:_SWCErrorDomain code:7 userInfo:v35];
        [(__CFString *)v15 setCancellationError:v36];

        if (qword_10003B1B0 != -1) {
          dispatch_once(&qword_10003B1B0, &stru_100034918);
        }
        id v37 = (id)qword_10003B1A8;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v47 = [v18 URL];
          *(_DWORD *)buf = 138413058;
          v56 = v47;
          __int16 v57 = 2112;
          v58 = (char *)v15;
          __int16 v59 = 2048;
          v60 = v52;
          __int16 v61 = 2114;
          CFStringRef v62 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Request for '%@' for task %@ denied because the CDN told us to stop with HTTP status %lli: %{public}@", buf, 0x2Au);
        }
        goto LABEL_49;
      }
      v30 = (__CFString *)v24;
      if ((unint64_t)(v52 - 200) >= 0x64)
      {
        if (qword_10003B1B0 != -1) {
          dispatch_once(&qword_10003B1B0, &stru_100034918);
        }
        id v41 = qword_10003B1A8;
        if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v56 = v52;
          __int16 v57 = 2112;
          v58 = (char *)v15;
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "CDN sent an unexpected HTTP status %lli (ignoring) for task %@", buf, 0x16u);
        }
        goto LABEL_49;
      }
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      v38 = qword_10003B1A8;
      if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v56 = v52;
        __int16 v57 = 2112;
        v58 = (char *)v15;
        v39 = "Proceeding: CDN gave HTTP status %lli for task %@";
        goto LABEL_43;
      }
    }
    uint64_t v22 = 1;
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  uint64_t v22 = 0;
LABEL_52:

  v11[2](v11, v22);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  uint64_t v8 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v8);

  allTaskStates = self->_allTaskStates;
  id v10 = [v12 taskDescription];
  id v11 = [(NSMapTable *)allTaskStates objectForKey:v10];

  if (v11)
  {
    if (v7) {
      [(SWCDownloader *)self _invokeCompletionHandlerForState:v11 JSONObject:0 error:v7];
    }
    else {
      [(SWCDownloader *)self _processDownloadedDataForState:v11];
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v9);

  allTaskStates = self->_allTaskStates;
  id v11 = [v7 taskDescription];
  id v12 = [(NSMapTable *)allTaskStates objectForKey:v11];

  if (v12)
  {
    id v13 = [v12 buffer];
    [v13 appendData:v8];

    v14 = [v12 buffer];
    id v15 = [v14 length];

    if ((unint64_t)v15 > 0x20000)
    {
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      id v16 = qword_10003B1A8;
      if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Data for task %@ exceeded maximum length", buf, 0xCu);
      }
      id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Data exceeded maximum length of %zu bytes.", 0x20000];
      unsigned int v18 = [v12 task];
      id v19 = [v18 response];

      if (v19 && (uint64_t)[v19 expectedContentLength] >= 1)
      {
        id v20 = [objc_alloc((Class)NSString) initWithFormat:@"Data exceeded maximum length of %zu bytes (server said it would be %lld bytes.)", 0x20000, [v19 expectedContentLength]];

        id v17 = v20;
      }

      id v21 = objc_alloc((Class)NSError);
      v26[0] = &off_100036780;
      v25[0] = @"Line";
      v25[1] = @"Function";
      uint64_t v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveData:]");
      v25[2] = NSDebugDescriptionErrorKey;
      v26[1] = v22;
      v26[2] = v17;
      unsigned int v23 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
      id v24 = [v21 initWithDomain:NSURLErrorDomain code:-1103 userInfo:v23];
      [v12 cancelTaskWithError:v24];
    }
  }
}

- (SWCDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SWCDownloaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allTaskStates, 0);
  for (uint64_t i = 40; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (unsigned)_sessionIDForTaskState:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 downloadRoute];
  unsigned int v5 = [v3 isDiscretionary];
  unsigned __int8 v6 = v4 == 0;

  if (v5) {
    return v6 | 2;
  }
  else {
    return v6;
  }
}

- (id)_sessionForTaskState:(id)a3
{
  unsigned int v6 = [(SWCDownloader *)self _sessionIDForTaskState:a3];
  sessions = self->_sessions;
  id v8 = self->_sessions[v6];
  if (!v8)
  {
    unsigned int v9 = v6;
    id v10 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v10 setHTTPCookieAcceptPolicy:1];
    [v10 setHTTPCookieStorage:0];
    [v10 setHTTPShouldSetCookies:0];
    [v10 setRequestCachePolicy:1];
    [v10 setURLCredentialStorage:0];
    [v10 setURLCache:0];
    [v10 setAllowsCellularAccess:1];
    id v11 = +[_SWCPrefs sharedPrefs];
    [v10 set_performsEVCertCheck:[v11 verifyExtendedValidation]];

    if (v9) {
      [v10 setWaitsForConnectivity:1];
    }
    if ((v9 & 2) != 0) {
      [v10 setDiscretionary:1];
    }
    uint64_t v12 = +[NSURLSession sessionWithConfiguration:v10 delegate:self delegateQueue:self->_queue];
    id v13 = sessions[v9];
    sessions[v9] = (NSURLSession *)v12;

    id v8 = sessions[v9];
  }
  v14 = v8;

  return v14;
}

- (unint64_t)_maximumActiveTaskCountForSessionID:(unsigned __int8)a3
{
  if (a3 > 3u) {
    return 1;
  }
  else {
    return qword_10002C588[(char)a3];
  }
}

- (id)_taskStateForDomain:(id)a3 downloadRoute:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unsigned int v18 = sub_100007ECC;
  id v19 = sub_100007EDC;
  id v20 = 0;
  id v7 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007EE4;
  v11[3] = &unk_100034838;
  unsigned __int8 v14 = a4;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  [(SWCDownloader *)self _enumerateTaskStatesUsingBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)_downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 discretionary:(BOOL)a6 completionHandlers:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = objc_alloc((Class)NSString);
  uint64_t v17 = [v13 redactedDescription];
  id v18 = [v16 initWithFormat:@"com.apple.swc.dl.begin-%@", v17];
  [v18 UTF8String];
  id v19 = (void *)os_transaction_create();

  id v20 = [(NSOperationQueue *)self->_queue underlyingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008178;
  block[3] = &unk_100034860;
  block[4] = self;
  id v26 = v13;
  unsigned __int8 v31 = a5;
  BOOL v32 = a6;
  id v27 = v15;
  id v28 = v14;
  id v29 = v19;
  SEL v30 = a2;
  id v21 = v19;
  id v22 = v14;
  id v23 = v15;
  id v24 = v13;
  dispatch_async(v20, block);
}

- (id)_URLRequestWithDomain:(id)a3 downloadRoute:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  id v7 = objc_alloc_init((Class)NSURLComponents);
  [v7 setScheme:@"https"];
  if (v4)
  {
    if (v4 == 1)
    {
      id v8 = [v5 host];
      [v7 setHost:v8];

      id v9 = [v5 port];
      [v7 setPort:v9];

      [v7 setPath:@"/.well-known/apple-app-site-association"];
    }
    else
    {
      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      id v16 = qword_10003B1A8;
      if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = v4;
        _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Unknown download route %llu: this is a bug in SWC.", buf, 0xCu);
      }
    }
    id v14 = 0;
  }
  else
  {
    [v7 setHost:@"app-site-association.cdn-apple.com"];
    id v10 = [@"/a/v1/" mutableCopy];
    id v11 = [v5 host];
    [v10 appendString:v11];

    uint64_t v12 = [v5 port];
    id v13 = (void *)v12;
    if (v12) {
      [v10 appendFormat:@":%@", v12];
    }

    [v7 setPath:v10];
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = [v5 host];
    [v14 setObject:v15 forKeyedSubscript:@"Apple-Proxied-Domain-Name"];
  }
  id v17 = objc_alloc((Class)NSMutableURLRequest);
  id v18 = [v7 URL];
  id v19 = [v17 initWithURL:v18];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100008C64;
  v23[3] = &unk_100034888;
  id v20 = v19;
  id v24 = v20;
  [v14 enumerateKeysAndObjectsUsingBlock:v23];
  if (v4)
  {
    [v20 _CFURLRequest];
    _CFURLRequestSetAllowedProtocolTypes();
  }
  [v20 setCachePolicy:1];
  [v20 setHTTPShouldHandleCookies:0];
  id v21 = [v20 copy];

  return v21;
}

- (void)_enumerateTaskStatesUsingBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  id v5 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(NSMapTable *)self->_allTaskStates objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      v4[2](v4, v10, &v16);
      LODWORD(v10) = v16;
      if (v10) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_resumePendingTasks
{
  id v3 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v3);

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x5812000000;
  v18[3] = sub_1000090C8;
  memset(&v18[5], 0, 40);
  v18[4] = sub_100009138;
  int v19 = 1065353216;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009140;
  v17[3] = &unk_1000348B0;
  v17[4] = self;
  v17[5] = v18;
  [(SWCDownloader *)self _enumerateTaskStatesUsingBlock:v17];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000091E4;
  v14[3] = &unk_1000348D8;
  v14[4] = self;
  unsigned __int8 v16 = v18;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v15 = v5;
  [(SWCDownloader *)self _enumerateTaskStatesUsingBlock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) resumeTask:v10];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v20 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(v18, 8);
  sub_100009E24((uint64_t)&v18[6]);
}

- (id)_replaceTaskState:(id)a3
{
  id v5 = a3;
  id v6 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [SWCDownloadTaskState alloc];
  uint64_t v8 = [v5 domain];
  uint64_t v9 = -[SWCDownloadTaskState initWithDownloader:domain:downloadRoute:](v7, "initWithDownloader:domain:downloadRoute:", self, v8, [v5 downloadRoute]);

  if (!v9)
  {
    id v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:709 description:@"Failed to create download state object"];
  }
  long long v10 = [(SWCDownloadTaskState *)v9 completionHandlers];
  long long v11 = [v5 completionHandlers];
  [v10 setArray:v11];

  long long v12 = [v5 completionHandlers];
  [v12 removeAllObjects];

  long long v13 = [v5 cancellationError];
  [(SWCDownloadTaskState *)v9 setCancellationError:v13];

  allTaskStates = self->_allTaskStates;
  id v15 = [v5 task];
  unsigned __int8 v16 = [v15 taskDescription];
  [(NSMapTable *)allTaskStates removeObjectForKey:v16];

  id v17 = self->_allTaskStates;
  id v18 = [(SWCDownloadTaskState *)v9 taskDescription];
  [(NSMapTable *)v17 setObject:v9 forKey:v18];

  [v5 cancelTaskWithError:0];

  return v9;
}

- (void)_processDownloadedDataForState:(id)a3
{
  id v4 = a3;
  if (qword_10003B1B0 != -1) {
    dispatch_once(&qword_10003B1B0, &stru_100034918);
  }
  id v6 = (id)qword_10003B1A8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v20 = [v4 domain];
    id v21 = sub_1000050D8((uint64_t)[v4 downloadRoute]);
    int __buf = 138412546;
    id v24 = v20;
    __int16 v25 = 2114;
    id v26 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Downloaded data for domain %@ (route? %{public}@)", (uint8_t *)&__buf, 0x16u);
  }
  id v7 = [v4 domain];
  uint64_t v8 = [v4 buffer];
  id v9 = objc_alloc((Class)NSString);
  long long v10 = [v7 redactedDescription];
  id v11 = [v9 initWithFormat:@"com.apple.swc.aasa.read-%@", v10];
  [v11 UTF8String];
  long long v12 = (void *)os_transaction_create();

  if (v8)
  {
    if (_SWCDiagnosticStorage[2]
      && (+[_SWCPrefs sharedPrefs],
          long long v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v13 isAppleInternal],
          v13,
          v14))
    {
      arc4random_buf(&__buf, 0x80uLL);
      id v15 = [objc_alloc((Class)NSMutableData) initWithCapacity:([v8 length] + 128)];
      [v15 appendBytes:&__buf length:128];
      [v15 appendData:v8];
    }
    else
    {
      id v15 = v8;
    }
  }
  else
  {
    id v15 = 0;
  }
  unsigned __int8 v16 = +[SWCSecurityGuard sharedSecurityGuard];
  id v22 = 0;
  id v17 = [v16 JSONObjectWithSignedJSONData:v15 error:&v22];
  id v18 = v22;

  if (v17)
  {
    [(SWCDownloader *)self _invokeCompletionHandlerForState:v4 JSONObject:v17 error:0];
  }
  else
  {
    if (qword_10003B1B0 != -1) {
      dispatch_once(&qword_10003B1B0, &stru_100034918);
    }
    int v19 = qword_10003B1A8;
    if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_ERROR))
    {
      int __buf = 138412546;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error securing JSON file for %@: %@", (uint8_t *)&__buf, 0x16u);
    }
    [(SWCDownloader *)self _invokeCompletionHandlerForState:v4 JSONObject:0 error:v18];
  }
}

- (void)_invokeCompletionHandlerForState:(id)a3 JSONObject:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSOperationQueue *)self->_queue underlyingQueue];
  dispatch_assert_queue_V2(v11);

  uint32_t v35 = [(SWCDownloader *)self delegate];
  id v12 = [v8 downloadRoute];
  if (v9)
  {
    if (v35 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      long long v13 = [v8 domain];
      [v35 downloader:self didDownloadAASAFileContainingJSONObject:v9 fromDomain:v13 downloadRoute:v12];
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    unsigned int v14 = [v8 completionHandlers];
    id v15 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v14);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v40 + 1) + 8 * i) + 16))();
        }
        id v15 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v15);
    }
  }
  else
  {
    unsigned int v14 = [v8 cancellationError];
    if ([v10 code] == (id)-999)
    {
      id v18 = [v10 domain];
      unsigned int v19 = [v18 isEqual:NSURLErrorDomain];
      unsigned int v20 = v14 ? v19 : 0;

      if (v20 == 1)
      {
        if (qword_10003B1B0 != -1) {
          dispatch_once(&qword_10003B1B0, &stru_100034918);
        }
        id v21 = qword_10003B1A8;
        if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v14;
          __int16 v47 = 2112;
          id v48 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Substituting cancellation error %@ for error %@", buf, 0x16u);
        }
        id v22 = v14;

        id v10 = v22;
      }
    }
    if (v35 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v23 = [v8 domain];
      [v35 downloader:self failedToDownloadAASAFileFromDomain:v23 error:v10];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v24 = [v8 completionHandlers];
    id v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v37;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v24);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v36 + 1) + 8 * (void)j) + 16))();
        }
        id v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v25);
    }
  }
  allTaskStates = self->_allTaskStates;
  id v29 = [v8 task];
  SEL v30 = [v29 taskDescription];
  [(NSMapTable *)allTaskStates removeObjectForKey:v30];

  if ([(NSMapTable *)self->_allTaskStates count])
  {
    [(SWCDownloader *)self _resumePendingTasks];
  }
  else
  {
    uint64_t v31 = 0;
    sessions = self->_sessions;
    do
    {
      [(NSURLSession *)sessions[v31] finishTasksAndInvalidate];
      id v33 = sessions[v31];
      sessions[v31] = 0;

      ++v31;
    }
    while (v31 != 4);
  }
}

@end