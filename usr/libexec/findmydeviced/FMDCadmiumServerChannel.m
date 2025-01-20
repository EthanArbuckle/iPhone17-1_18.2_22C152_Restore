@interface FMDCadmiumServerChannel
- (BOOL)isActive;
- (BOOL)supportsRequestType:(unint64_t)a3;
- (FMDCadmiumServerChannel)init;
- (FMDURLSession)session;
- (NSHTTPCookieStorage)cookieStorage;
- (NSMutableDictionary)requests;
- (NSOperationQueue)queue;
- (NSRecursiveLock)requestModifierLock;
- (NSURLSessionConfiguration)sessionConfig;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_logRequestError:(id)a3;
- (void)cancelAllRequests;
- (void)cancelRequestWithId:(id)a3;
- (void)sendRequestWithId:(id)a3 toURL:(id)a4 withHeaders:(id)a5 body:(id)a6 completion:(id)a7;
- (void)setCookieStorage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestModifierLock:(id)a3;
- (void)setRequests:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionConfig:(id)a3;
@end

@implementation FMDCadmiumServerChannel

- (FMDCadmiumServerChannel)init
{
  v15.receiver = self;
  v15.super_class = (Class)FMDCadmiumServerChannel;
  v2 = [(FMDCadmiumServerChannel *)&v15 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    uint64_t v5 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig = v2->_sessionConfig;
    v2->_sessionConfig = (NSURLSessionConfiguration *)v5;

    [(NSURLSessionConfiguration *)v2->_sessionConfig setURLCache:0];
    [(NSURLSessionConfiguration *)v2->_sessionConfig setRequestCachePolicy:1];
    v7 = [(FMDCadmiumServerChannel *)v2 cookieStorage];
    [(NSURLSessionConfiguration *)v2->_sessionConfig setHTTPCookieStorage:v7];

    uint64_t v8 = +[FMDURLSessionFactory sessionWithConfiguration:v2->_sessionConfig delegate:v2 delegateQueue:v2->_queue];
    session = v2->_session;
    v2->_session = (FMDURLSession *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    requestModifierLock = v2->_requestModifierLock;
    v2->_requestModifierLock = (NSRecursiveLock *)v12;
  }
  return v2;
}

- (BOOL)isActive
{
  return 1;
}

- (void)sendRequestWithId:(id)a3 toURL:(id)a4 withHeaders:(id)a5 body:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  v16 = +[NSMutableURLRequest requestWithURL:a4 cachePolicy:1 timeoutInterval:120.0];
  [v16 setHTTPMethod:@"POST"];
  [v16 setAllHTTPHeaderFields:v15];

  if (v13) {
    [v16 setHTTPBody:v13];
  }
  v17 = [(FMDCadmiumServerChannel *)self session];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004A0FC;
  v24[3] = &unk_1002DB150;
  id v25 = v12;
  id v26 = v14;
  v24[4] = self;
  id v18 = v12;
  id v19 = v14;
  v20 = [v17 dataTaskWithRequest:v16 completionHandler:v24];

  v21 = [(FMDCadmiumServerChannel *)self requestModifierLock];
  [v21 lock];

  v22 = [(FMDCadmiumServerChannel *)self requests];
  [v22 setObject:v20 forKeyedSubscript:v18];

  v23 = [(FMDCadmiumServerChannel *)self requestModifierLock];
  [v23 unlock];

  [v20 resume];
}

- (void)cancelRequestWithId:(id)a3
{
  id v9 = a3;
  v4 = [(FMDCadmiumServerChannel *)self requestModifierLock];
  [v4 lock];

  uint64_t v5 = [(FMDCadmiumServerChannel *)self requests];
  v6 = [v5 objectForKeyedSubscript:v9];

  if (v6)
  {
    v7 = [(FMDCadmiumServerChannel *)self requests];
    [v7 removeObjectForKey:v9];

    [v6 cancel];
  }
  uint64_t v8 = [(FMDCadmiumServerChannel *)self requestModifierLock];
  [v8 unlock];
}

- (void)cancelAllRequests
{
  v3 = [(FMDCadmiumServerChannel *)self requestModifierLock];
  [v3 lock];

  v4 = [(FMDCadmiumServerChannel *)self requests];
  uint64_t v5 = +[NSMutableDictionary dictionary];
  [(FMDCadmiumServerChannel *)self setRequests:v5];

  v6 = [(FMDCadmiumServerChannel *)self requestModifierLock];
  [v6 unlock];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11), (void)v14];
        id v13 = v12;
        if (v12) {
          [v12 cancel];
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (BOOL)supportsRequestType:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t, void))a5;
  id v9 = +[FMSystemInfo sharedInstance];
  if ([v9 isInternalBuild]) {
    unsigned int v10 = +[FMPreferencesUtil BOOLForKey:@"DisableCertPinning" inDomain:kFMDNotBackedUpPrefDomain];
  }
  else {
    unsigned int v10 = 0;
  }

  v11 = [v7 protectionSpace];
  id v12 = [v11 host];

  if (([v12 isEqualToString:@"gateway.icloud.com"] & 1) != 0 || v10)
  {
    v8[2](v8, 1, 0);
  }
  else
  {
    id v13 = sub_100004238();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDCadmiumServerChannel Detecting authentication method", buf, 2u);
    }

    long long v14 = [v7 protectionSpace];
    long long v15 = [v14 authenticationMethod];
    unsigned int v16 = [v15 isEqualToString:NSURLAuthenticationMethodServerTrust];

    if (v16)
    {
      long long v17 = sub_100004238();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDCadmiumServerChannel Setting server trust policy", buf, 2u);
      }

      id v18 = [v14 host];
      AppleFMiPService = (const void *)SecPolicyCreateAppleFMiPService();

      if (AppleFMiPService)
      {
        v20 = (__SecTrust *)[v14 serverTrust];
        OSStatus v21 = SecTrustSetPolicies(v20, AppleFMiPService);
        CFRelease(AppleFMiPService);
        if (v21)
        {
          v22 = sub_100004238();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error setting the trust policies : %ld", buf, 0xCu);
          }

          CFStringRef v36 = @"FMDUnerlyingErrorKey";
          v23 = +[NSError errorWithDomain:@"SecTrustSetPolicies" code:v21 userInfo:0];
          v37 = v23;
          v24 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          id v25 = +[NSError errorWithDomain:@"FMDCadmiumServerChannelPinningErrorDomain" code:0 userInfo:v24];

          id v26 = 0;
          uint64_t v27 = 2;
        }
        else
        {
          *(void *)buf = 0;
          if (SecTrustEvaluateWithError(v20, (CFErrorRef *)buf))
          {
            id v26 = +[NSURLCredential credentialForTrust:v20];
            v30 = sub_100004238();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v33 = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "FMDCadmiumServerChannel Pinning success - presenting fmip trust as credential.", v33, 2u);
            }
            id v25 = 0;
            uint64_t v27 = 0;
          }
          else
          {
            v31 = sub_100004238();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_10023EBF0(v31);
            }

            CFStringRef v39 = @"FMDUnerlyingErrorKey";
            v30 = +[NSError errorWithDomain:@"SecTrustEvaluate" code:1 userInfo:0];
            v40 = v30;
            v32 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            id v25 = +[NSError errorWithDomain:@"FMDCadmiumServerChannelPinningErrorDomain" code:1 userInfo:v32];

            id v26 = 0;
            uint64_t v27 = 2;
          }
        }
      }
      else
      {
        CFStringRef v34 = @"FMDUnerlyingErrorKey";
        v28 = +[NSError errorWithDomain:@"SecPolicyCreateAppleFMiPService" code:0 userInfo:0];
        v35 = v28;
        v29 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        uint64_t v27 = 2;
        id v25 = +[NSError errorWithDomain:@"FMDCadmiumServerChannelPinningErrorDomain" code:2 userInfo:v29];

        id v26 = 0;
      }
      [(FMDCadmiumServerChannel *)self _logRequestError:v25];
    }
    else
    {
      id v26 = 0;
      uint64_t v27 = 1;
    }
    ((void (**)(id, uint64_t, void *))v8)[2](v8, v27, v26);
  }
}

- (void)_logRequestError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Network error occured %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v5 = [(FMDEventLoggerEventError *)[FMDEventLoggerEventDataPeekError alloc] initWithEventName:@"FMDCadmiumServerChannelRequestFailedEventName"];
    v6 = [v3 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"FMDUnerlyingErrorKey"];

    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = v3;
    }
    [(FMDEventLoggerEventDataPeekError *)v5 setError:v8];
    id v9 = +[FMDEventLogger sharedLogger];
    [v9 logEvent:v5];
  }
}

- (FMDURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionConfiguration)sessionConfig
{
  return self->_sessionConfig;
}

- (void)setSessionConfig:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
}

- (NSHTTPCookieStorage)cookieStorage
{
  return self->_cookieStorage;
}

- (void)setCookieStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end