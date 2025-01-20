@interface FMDDirectServerChannel
- (BOOL)isActive;
- (BOOL)supportsRequestType:(unint64_t)a3;
- (FMDDirectServerChannel)init;
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

@implementation FMDDirectServerChannel

- (FMDDirectServerChannel)init
{
  v18.receiver = self;
  v18.super_class = (Class)FMDDirectServerChannel;
  v2 = [(FMDDirectServerChannel *)&v18 init];
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
    v7 = [(FMDDirectServerChannel *)v2 cookieStorage];
    [(NSURLSessionConfiguration *)v2->_sessionConfig setHTTPCookieStorage:v7];

    v8 = +[NSBundle mainBundle];
    v9 = [v8 bundleIdentifier];

    id v10 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:v9];
    [(NSURLSessionConfiguration *)v2->_sessionConfig set_appleIDContext:v10];
    uint64_t v11 = +[FMDURLSessionFactory sessionWithConfiguration:v2->_sessionConfig delegate:v2 delegateQueue:v2->_queue];
    session = v2->_session;
    v2->_session = (FMDURLSession *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    requestModifierLock = v2->_requestModifierLock;
    v2->_requestModifierLock = (NSRecursiveLock *)v15;
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
  v17 = [(FMDDirectServerChannel *)self session];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005FAF0;
  v24[3] = &unk_1002DB150;
  id v25 = v12;
  id v26 = v14;
  v24[4] = self;
  id v18 = v12;
  id v19 = v14;
  v20 = [v17 dataTaskWithRequest:v16 completionHandler:v24];

  v21 = [(FMDDirectServerChannel *)self requestModifierLock];
  [v21 lock];

  v22 = [(FMDDirectServerChannel *)self requests];
  [v22 setObject:v20 forKeyedSubscript:v18];

  v23 = [(FMDDirectServerChannel *)self requestModifierLock];
  [v23 unlock];

  [v20 resume];
}

- (void)cancelRequestWithId:(id)a3
{
  id v9 = a3;
  v4 = [(FMDDirectServerChannel *)self requestModifierLock];
  [v4 lock];

  uint64_t v5 = [(FMDDirectServerChannel *)self requests];
  v6 = [v5 objectForKeyedSubscript:v9];

  if (v6)
  {
    v7 = [(FMDDirectServerChannel *)self requests];
    [v7 removeObjectForKey:v9];

    [v6 cancel];
  }
  v8 = [(FMDDirectServerChannel *)self requestModifierLock];
  [v8 unlock];
}

- (void)cancelAllRequests
{
  v3 = [(FMDDirectServerChannel *)self requestModifierLock];
  [v3 lock];

  v4 = [(FMDDirectServerChannel *)self requests];
  uint64_t v5 = +[NSMutableDictionary dictionary];
  [(FMDDirectServerChannel *)self setRequests:v5];

  v6 = [(FMDDirectServerChannel *)self requestModifierLock];
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
      uint64_t v11 = 0;
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

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (NSHTTPCookieStorage)cookieStorage
{
  cookieStorage = self->_cookieStorage;
  if (!cookieStorage)
  {
    v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    uint64_t v5 = [v4 objectAtIndex:0];
    v6 = [v5 stringByAppendingPathComponent:@"com.apple.icloud.findmydeviced"];
    id v7 = [v6 stringByAppendingPathComponent:@"cookies"];

    id v8 = v7;
    id v9 = (const char *)[v8 UTF8String];
    size_t v10 = strlen(v9);
    CFURLRef v11 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v9, v10, 1u);
    id v12 = (const void *)CFHTTPCookieStorageCreateFromFile();
    CFRunLoopGetMain();
    CFHTTPCookieStorageScheduleWithRunLoop();
    id v13 = [objc_alloc((Class)NSHTTPCookieStorage) _initWithCFHTTPCookieStorage:v12];
    [(FMDDirectServerChannel *)self setCookieStorage:v13];

    if (v11) {
      CFRelease(v11);
    }
    if (v12) {
      CFRelease(v12);
    }

    cookieStorage = self->_cookieStorage;
  }

  return cookieStorage;
}

- (BOOL)supportsRequestType:(unint64_t)a3
{
  return a3 & 1;
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

  CFURLRef v11 = [v7 protectionSpace];
  id v12 = [v11 host];

  if ([v12 isEqualToString:@"gateway.icloud.com"])
  {
    unsigned int v13 = +[FMPreferencesUtil BOOLForKey:@"EnableCertPinningForFindkit" inDomain:kFMDNotBackedUpPrefDomain];
    long long v14 = sub_100059878();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "cert pinning for Findkit enabled = %d", buf, 8u);
    }

    if ((v13 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if (v10)
  {
LABEL_8:
    v8[2](v8, 1, 0);
    goto LABEL_32;
  }
  long long v15 = sub_100004238();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMDDirectServerChannel Detecting authentication method", buf, 2u);
  }

  long long v16 = [v7 protectionSpace];
  long long v17 = [v16 authenticationMethod];
  unsigned int v18 = [v17 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v18)
  {
    id v19 = sub_100004238();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMDDirectServerChannel Setting server trust policy", buf, 2u);
    }

    v20 = [v16 host];
    AppleFMiPService = (const void *)SecPolicyCreateAppleFMiPService();

    if (AppleFMiPService)
    {
      v22 = (__SecTrust *)[v16 serverTrust];
      OSStatus v23 = SecTrustSetPolicies(v22, AppleFMiPService);
      CFRelease(AppleFMiPService);
      if (v23)
      {
        v24 = sub_100004238();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error setting the trust policies : %ld", buf, 0xCu);
        }

        CFStringRef v38 = @"FMDUnerlyingErrorKey";
        id v25 = +[NSError errorWithDomain:@"SecTrustSetPolicies" code:v23 userInfo:0];
        v39 = v25;
        id v26 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v27 = +[NSError errorWithDomain:@"FMDDirectServerChannelPinningErrorDomain" code:0 userInfo:v26];

        v28 = 0;
        uint64_t v29 = 2;
      }
      else
      {
        *(void *)buf = 0;
        if (SecTrustEvaluateWithError(v22, (CFErrorRef *)buf))
        {
          v28 = +[NSURLCredential credentialForTrust:v22];
          v32 = sub_100004238();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v35 = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "FMDDirectServerChannel Pinning success - presenting fmip trust as credential.", v35, 2u);
          }
          uint64_t v29 = 0;
          v27 = 0;
        }
        else
        {
          v33 = sub_100004238();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10023F9AC(v33);
          }

          CFStringRef v41 = @"FMDUnerlyingErrorKey";
          v32 = +[NSError errorWithDomain:@"SecTrustEvaluate" code:1 userInfo:0];
          v42 = v32;
          v34 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          v27 = +[NSError errorWithDomain:@"FMDDirectServerChannelPinningErrorDomain" code:1 userInfo:v34];

          v28 = 0;
          uint64_t v29 = 2;
        }
      }
    }
    else
    {
      CFStringRef v36 = @"FMDUnerlyingErrorKey";
      v30 = +[NSError errorWithDomain:@"SecPolicyCreateAppleFMiPService" code:0 userInfo:0];
      v37 = v30;
      v31 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v29 = 2;
      v27 = +[NSError errorWithDomain:@"FMDDirectServerChannelPinningErrorDomain" code:2 userInfo:v31];

      v28 = 0;
    }
    [(FMDDirectServerChannel *)self _logRequestError:v27];
  }
  else
  {
    v28 = 0;
    uint64_t v29 = 1;
  }
  ((void (**)(id, uint64_t, void *))v8)[2](v8, v29, v28);

LABEL_32:
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

    uint64_t v5 = [(FMDEventLoggerEventError *)[FMDEventLoggerEventDataPeekError alloc] initWithEventName:@"FMDDirectServerChannelRequestError"];
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