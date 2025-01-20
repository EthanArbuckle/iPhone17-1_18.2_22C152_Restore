@interface FMRequest
+ (void)initialize;
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)cancelled;
- (BOOL)inProgress;
- (BOOL)isComplete;
- (BOOL)showAuthFailedMessage;
- (BOOL)willRetry;
- (FMFURLSessionTask)currentDataTask;
- (FMRequest)init;
- (FMRequest)initWithProvider:(id)a3;
- (FMRequestDelegate)delegate;
- (FindBaseServiceProvider)provider;
- (NSDate)lastRetryTime;
- (NSDate)nextRetryTime;
- (NSDictionary)alertFromServerResponse;
- (NSDictionary)httpResponseBody;
- (NSDictionary)httpResponseHeaders;
- (NSError)httpResponseError;
- (NSMutableDictionary)consecutiveRetriesByType;
- (NSMutableDictionary)requestBody;
- (NSMutableDictionary)requestHeaders;
- (NSMutableDictionary)totalRetriesByType;
- (NSRecursiveLock)requestModifierLock;
- (NSString)authToken;
- (NSString)lastRetryType;
- (NSString)nextRetryType;
- (NSURL)requestUrl;
- (PCPersistentTimer)retryTimer;
- (double)_decayedWaitIntervalForRetryCount:(int64_t)a3;
- (double)firstRetryInterval;
- (double)maxRetryInterval;
- (double)retryIntervalDecayFactor;
- (id)_basicAuthValue;
- (id)authTokenType;
- (id)completionHandler;
- (id)urlSession;
- (id)willSendHandler;
- (int)_consecutiveRetryCountForType:(id)a3;
- (int)_retryCountForType:(id)a3;
- (int64_t)httpResponseStatus;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (int64_t)maxTimerBasedNetworkRetries;
- (int64_t)responseErrorType;
- (int64_t)totalRetryCount;
- (void)_beginXPCTransaction;
- (void)_disablePowerAssertion;
- (void)_enablePowerAssertion;
- (void)_endXPCTransaction;
- (void)_incrementRetryCountForType:(id)a3;
- (void)_networkCameUp;
- (void)_networkStateChanged:(id)a3;
- (void)_retryNow;
- (void)_retryTimerFired;
- (void)_scheduleRetryAfterTimeInterval:(double)a3;
- (void)cancel;
- (void)checkAndScheduleRetries;
- (void)dealloc;
- (void)deinitializeRequest;
- (void)send;
- (void)setAlertFromServerResponse:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConsecutiveRetriesByType:(id)a3;
- (void)setCurrentDataTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHttpResponseBody:(id)a3;
- (void)setHttpResponseError:(id)a3;
- (void)setHttpResponseHeaders:(id)a3;
- (void)setHttpResponseStatus:(int64_t)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setLastRetryTime:(id)a3;
- (void)setLastRetryType:(id)a3;
- (void)setNextRetryTime:(id)a3;
- (void)setNextRetryType:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRequestModifierLock:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setTotalRetriesByType:(id)a3;
- (void)setTotalRetryCount:(int64_t)a3;
- (void)setWillRetry:(BOOL)a3;
- (void)setWillSendHandler:(id)a3;
@end

@implementation FMRequest

- (FMRequest)init
{
  return [(FMRequest *)self initWithProvider:0];
}

- (FMRequest)initWithProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMRequest;
  v5 = [(FMRequest *)&v9 init];
  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    v7 = objc_opt_new();
    [(FMRequest *)v5 setRequestModifierLock:v7];

    [(FMRequest *)v5 setWillRetry:1];
    [(FMRequest *)v5 setProvider:v4];
    [v6 addObserver:v5 selector:"_networkStateChanged:" name:@"com.apple.icloud.fmflocatord.networkChanged" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100037650(self);
  }

  [(FMRequest *)self deinitializeRequest];
  v4.receiver = self;
  v4.super_class = (Class)FMRequest;
  [(FMRequest *)&v4 dealloc];
}

- (void)deinitializeRequest
{
  v3 = +[NSNotificationCenter defaultCenter];
  objc_super v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(FMRequest *)self fm_logID];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ deinitializing...", (uint8_t *)&v6, 0xCu);
  }
  [v3 removeObserver:self name:@"com.apple.icloud.fmflocatord.networkChanged" object:0];
}

+ (void)initialize
{
  if (!qword_10006D5D8)
  {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = (void *)qword_10006D5D8;
    qword_10006D5D8 = (uint64_t)v2;

    qword_10006D5E0 = (uint64_t)objc_alloc_init((Class)NSRecursiveLock);
    _objc_release_x1();
  }
}

- (id)urlSession
{
  if (qword_10006D600 != -1) {
    dispatch_once(&qword_10006D600, &stru_10005A338);
  }
  id v2 = (void *)qword_10006D5E8;

  return v2;
}

- (NSURL)requestUrl
{
  return 0;
}

- (NSMutableDictionary)requestBody
{
  return (NSMutableDictionary *)+[NSMutableDictionary dictionary];
}

- (BOOL)showAuthFailedMessage
{
  return 1;
}

- (NSMutableDictionary)requestHeaders
{
  v3 = objc_opt_new();
  objc_super v4 = [(FMRequest *)self delegate];
  v5 = [v4 account];
  int v6 = [v5 authId];

  if (v6)
  {
    v7 = [v4 account];
    v8 = [v7 authId];
    [v3 setObject:v8 forKeyedSubscript:@"X-Apple-PrsId"];
  }
  objc_super v9 = [v4 account];
  v10 = [v9 apsEnvironment];

  if (v10)
  {
    v11 = [v4 account];
    v12 = [v11 apsEnvironment];
    [v3 setObject:v12 forKeyedSubscript:@"X-Apple-PushEnv"];
  }
  v13 = +[PreferencesMgr sharedInstance];
  if ([v13 userTestApplication]) {
    [v3 setObject:@"true" forKeyedSubscript:@"X-Apple-Test-Application"];
  }
  [v3 setObject:@"7.0" forKeyedSubscript:@"X-Apple-Find-API-Ver"];
  v14 = +[RealmSupport serverContextHeaderString];
  [v3 fm_safelyMapKey:@"X-Apple-Ctx" toObject:v14];

  v15 = +[SystemConfig sharedInstance];
  v16 = [v15 productType];

  v17 = +[SystemConfig sharedInstance];
  v18 = [v17 buildVersion];

  v19 = +[NSString stringWithFormat:@"fmflocatord/%@ %@/%@", @"7.0", v16, v18];
  if (v19) {
    [v3 setObject:v19 forKeyedSubscript:@"User-Agent"];
  }
  [v3 setObject:@"application/json" forKeyedSubscript:@"Content-Type"];
  v20 = [(FMRequest *)self _basicAuthValue];
  if (v20) {
    [v3 setObject:v20 forKeyedSubscript:@"Authorization"];
  }
  [v3 setObject:@"1.0" forKeyedSubscript:@"X-Apple-Realm-Support"];
  v21 = [v13 httpRequestHeaders];
  if (v21) {
    [v3 addEntriesFromDictionary:v21];
  }

  return (NSMutableDictionary *)v3;
}

- (double)firstRetryInterval
{
  return 60.0;
}

- (double)retryIntervalDecayFactor
{
  return 3.0;
}

- (double)maxRetryInterval
{
  return -1.0;
}

- (int64_t)maxTimerBasedNetworkRetries
{
  return 5;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return 3;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return 10;
}

- (BOOL)canRequestBeRetriedNow
{
  if ([(FMRequest *)self isComplete]) {
    return 0;
  }
  else {
    return ![(FMRequest *)self cancelled];
  }
}

- (NSString)authToken
{
  id v2 = [(FMRequest *)self delegate];
  v3 = [v2 account];
  objc_super v4 = [v3 authToken];

  return (NSString *)v4;
}

- (id)authTokenType
{
  id v2 = [(FMRequest *)self delegate];
  v3 = [v2 account];
  objc_super v4 = [v3 authTokenType];

  return v4;
}

- (BOOL)canReplace:(id)a3
{
  return 1;
}

- (int64_t)responseErrorType
{
  v3 = [(FMRequest *)self httpResponseError];

  if (v3)
  {
    objc_super v4 = [(FMRequest *)self httpResponseError];
    v5 = [v4 domain];
    unsigned int v6 = [NSURLErrorDomain isEqualToString:v5];

    if (v6)
    {
      v7 = [(FMRequest *)self httpResponseError];
      id v8 = [v7 code];

      if ((unint64_t)v8 + 1019 < 0x13) {
        return qword_10004DBC0[(void)v8 + 1019];
      }
      return 2;
    }
    v10 = [(FMRequest *)self httpResponseError];
    v11 = [v10 domain];
    unsigned int v12 = [NSPOSIXErrorDomain isEqualToString:v11];

    if (v12)
    {
      v13 = [(FMRequest *)self httpResponseError];
      id v14 = [v13 code];

      if (v14 == (id)22) {
        return 513;
      }
    }
  }
  int64_t v15 = [(FMRequest *)self httpResponseStatus];
  if (v15 == 401) {
    return 257;
  }
  if (v15 == 330) {
    return 769;
  }
  if ([(FMRequest *)self httpResponseStatus] < 200) {
    return 2;
  }
  return 2 * ([(FMRequest *)self httpResponseStatus] > 299);
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(FMRequest *)self requestModifierLock];
  [v5 lock];

  id v6 = objc_retainBlock(v4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  id v8 = [(FMRequest *)self requestModifierLock];
  [v8 unlock];
}

- (void)send
{
  v3 = [(FMRequest *)self requestModifierLock];
  [v3 lock];

  if (![(FMRequest *)self inProgress]
    && ![(FMRequest *)self cancelled]
    && ![(FMRequest *)self isComplete]
    && [(FMRequest *)self willRetry])
  {
    id v4 = [(FMRequest *)self delegate];
    *(void *)v52 = 0;
    v53 = v52;
    uint64_t v54 = 0x3032000000;
    v55 = sub_100020FD8;
    v56 = sub_100020FE8;
    id v57 = 0;
    [(FMRequest *)self setInProgress:1];
    [(FMRequest *)self setAlertFromServerResponse:0];
    v5 = [(FMRequest *)self willSendHandler];

    if (v5)
    {
      id v6 = [(FMRequest *)self willSendHandler];
      ((void (**)(void, FMRequest *))v6)[2](v6, self);
    }
    v7 = [(FMRequest *)self completionHandler];
    id v8 = [v4 account];
    objc_super v9 = [v8 authId];
    if (!v9
      || ([(FMRequest *)self authToken],
          v10 = objc_claimAutoreleasedReturnValue(),
          BOOL v11 = v10 == 0,
          v10,
          v9,
          v11))
    {
      unsigned int v12 = sub_10001B6D4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(FMRequest *)self fm_logID];
        *(_DWORD *)buf = 138412290;
        v59 = v32;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ No credentials found. Not sending the request", buf, 0xCu);
      }
      goto LABEL_49;
    }
    unsigned int v12 = [(FMRequest *)self requestUrl];
    v13 = sub_10001B6D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [v8 authId];
      int64_t v15 = [(FMRequest *)self authToken];
      sub_100038738(v14, v15, v67, v13);
    }

    v16 = sub_10001B6D4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [(FMRequest *)self authTokenType];
      *(_DWORD *)buf = 138412290;
      v59 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Using auth token of type - %@", buf, 0xCu);
    }
    if (!v12)
    {
      unsigned int v12 = sub_10001B6D4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [(FMRequest *)self fm_logID];
        *(_DWORD *)buf = 138412290;
        v59 = v33;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ No url found. Not sending the request", buf, 0xCu);
      }
      goto LABEL_49;
    }
    v45 = [v12 host];
    v18 = [v8 authId];
    uint64_t v19 = +[RealmSupport redirectedHostForHost:v45 withContext:v18];
    v20 = (void *)*((void *)v53 + 5);
    *((void *)v53 + 5) = v19;

    if (*((void *)v53 + 5) && (objc_msgSend(v45, "isEqualToString:") & 1) == 0)
    {
      uint64_t v21 = [v12 URLByReplacingHost:*((void *)v53 + 5)];

      unsigned int v12 = v21;
    }
    v44 = [(FMRequest *)self requestHeaders];
    v22 = [(FMRequest *)self requestBody];
    if (v22)
    {
      id v51 = 0;
      uint64_t v23 = +[NSJSONSerialization dataWithJSONObject:v22 options:0 error:&v51];
      id v24 = v51;
      v43 = (void *)v23;
      if (!v23)
      {
        v25 = sub_10001B6D4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = [(FMRequest *)self fm_logID];
          sub_1000386E0(v26, v66, v25);
        }
      }
      if (v24)
      {
        v27 = sub_10001B6D4();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [(FMRequest *)self fm_logID];
          sub_100038678(v28, (uint64_t)v24, buf, v27);
        }

        v29 = sub_10001B804();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v64 = 138412290;
          v65 = v22;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Encountered a serializing error for the request body : %@", v64, 0xCu);
        }

LABEL_48:
LABEL_49:

        _Block_object_dispose(v52, 8);
        goto LABEL_31;
      }
    }
    else
    {
      v43 = 0;
    }
    id v34 = [v44 mutableCopy];
    v35 = [v34 objectForKeyedSubscript:@"Authorization"];

    if (v35) {
      [v34 setObject:@"REDACTED" forKeyedSubscript:@"Authorization"];
    }
    v36 = sub_10001B804();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [(FMRequest *)self fm_logID];
      *(_DWORD *)buf = 138412802;
      v59 = v37;
      __int16 v60 = 2112;
      v61 = v12;
      __int16 v62 = 2112;
      id v63 = v34;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Sending %@ to url %@ with headers: \n%@", buf, 0x20u);
    }
    v38 = sub_10001B804();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [(FMRequest *)self fm_logID];
      *(_DWORD *)buf = 138412546;
      v59 = v39;
      __int16 v60 = 2112;
      v61 = v22;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Sending %@ body dictionary : \n%@ ", buf, 0x16u);
    }
    id v24 = +[NSMutableURLRequest requestWithURL:v12 cachePolicy:1 timeoutInterval:120.0];
    [v24 setHTTPMethod:@"POST"];
    [v24 setAllHTTPHeaderFields:v44];
    if (v43) {
      [v24 setHTTPBody:v43];
    }
    [(FMRequest *)self _enablePowerAssertion];
    if (![(FMRequest *)self totalRetryCount]) {
      [(FMRequest *)self _beginXPCTransaction];
    }
    v40 = [(FMRequest *)self urlSession];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100020FF0;
    v46[3] = &unk_10005A360;
    v46[4] = self;
    id v47 = 0;
    v50 = v52;
    id v48 = v4;
    id v49 = v7;
    v41 = [v40 dataTaskWithRequest:v24 completionHandler:v46];
    [(FMRequest *)self setCurrentDataTask:v41];

    v42 = [(FMRequest *)self currentDataTask];
    [v42 resume];

    goto LABEL_48;
  }
  v30 = sub_10001B6D4();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v52 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Not sending", v52, 2u);
  }

LABEL_31:
  v31 = [(FMRequest *)self requestModifierLock];
  [v31 unlock];
}

- (void)cancel
{
  v3 = [(FMRequest *)self delegate];
  id v4 = [(FMRequest *)self requestModifierLock];
  [v4 lock];

  [(FMRequest *)self setCancelled:1];
  [(FMRequest *)self setCurrentDataTask:0];
  [(FMRequest *)self setInProgress:0];
  v5 = [(FMRequest *)self retryTimer];
  [v5 invalidate];

  [(FMRequest *)self setRetryTimer:0];
  [(FMRequest *)self setNextRetryTime:0];
  id v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "endXPCTransaction because cancel", v8, 2u);
  }

  [(FMRequest *)self _endXPCTransaction];
  [(FMRequest *)self _disablePowerAssertion];
  [v3 didCancelRequest:self];
  v7 = [(FMRequest *)self requestModifierLock];
  [v7 unlock];
}

- (id)_basicAuthValue
{
  v3 = [(FMRequest *)self delegate];
  id v4 = [v3 account];
  v5 = [v4 authId];
  id v6 = [(FMRequest *)self authToken];
  v7 = +[NSString stringWithFormat:@"%@:%@", v5, v6];

  id v8 = [v3 account];
  objc_super v9 = [v8 authId];
  v10 = [(FMRequest *)self authToken];
  CFStringRef v11 = @"(not-nil)";
  if (!v10) {
    CFStringRef v11 = @"(nil)";
  }
  unsigned int v12 = +[NSString stringWithFormat:@"%@:%@", v9, v11];

  v13 = sub_10001B6D4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100038918();
  }

  [(id)qword_10006D5E0 lock];
  id v14 = [(id)qword_10006D5D8 objectForKeyedSubscript:v7];
  if (!v14)
  {
    int64_t v15 = [v7 dataUsingEncoding:4];
    v16 = v15;
    if (v15 && [v15 length])
    {
      v17 = [v16 base64EncodedString];
      if (v17)
      {
        id v14 = +[NSString stringWithFormat:@"Basic %@", v17];
        if (v14) {
          [(id)qword_10006D5D8 setObject:v14 forKeyedSubscript:v7];
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  [(id)qword_10006D5E0 unlock];

  return v14;
}

- (void)_beginXPCTransaction
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 beginTransaction:v6];
}

- (void)_endXPCTransaction
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[FMXPCTransactionManager sharedInstance];
  [v5 endTransaction:v6];
}

- (void)_enablePowerAssertion
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[PowerMgr sharedInstance];
  [v5 powerAssertionEnableWithReason:v6];
}

- (void)_disablePowerAssertion
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v6 = +[NSString stringWithFormat:@"%@-%X", v4, self];

  v5 = +[PowerMgr sharedInstance];
  [v5 powerAssertionDisableWithReason:v6];
}

- (void)checkAndScheduleRetries
{
  v3 = [(FMRequest *)self delegate];
  [(FMRequest *)self setNextRetryType:0];
  id v4 = [(FMRequest *)self nextRetryType];
  if (v4)
  {
  }
  else if ([(FMRequest *)self isComplete])
  {
    v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(FMRequest *)self fm_logID];
      int v46 = 138412290;
      id v47 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Request is complete", (uint8_t *)&v46, 0xCu);
    }
    [(FMRequest *)self setNextRetryType:@"NoMoreRetries"];
  }
  v7 = [(FMRequest *)self nextRetryType];
  if (v7)
  {
  }
  else if (![(FMRequest *)self canRequestBeRetriedNow])
  {
    id v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = [(FMRequest *)self fm_logID];
      int v46 = 138412290;
      id v47 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Request cannot be retried anymore. Not scheduling any more retries", (uint8_t *)&v46, 0xCu);
    }
    [(FMRequest *)self setNextRetryType:@"NoMoreRetries"];
  }
  v10 = [(FMRequest *)self nextRetryType];

  double v11 = -1.0;
  if (!v10)
  {
    unsigned int v12 = [(FMRequest *)self httpResponseHeaders];
    v13 = [v12 objectForKeyedSubscript:@"X-Apple-Retry-After"];

    if (v13)
    {
      [v13 doubleValue];
      if (v14 < 0.0)
      {
        int64_t v15 = sub_10001B6D4();
        double v16 = -1.0;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(FMRequest *)self fm_logID];
          int v46 = 138412290;
          id v47 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Server requested that no more retries be done.", (uint8_t *)&v46, 0xCu);
        }
        CFStringRef v18 = @"NoMoreRetries";
LABEL_23:

        [(FMRequest *)self setNextRetryType:v18];
        double v11 = v16;
        goto LABEL_24;
      }
      if (v14 > 0.0)
      {
        double v16 = v14;
        int64_t v15 = sub_10001B6D4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [(FMRequest *)self fm_logID];
          int v46 = 138412546;
          id v47 = v19;
          __int16 v48 = 2048;
          double v49 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Server requested a retry after %f seconds", (uint8_t *)&v46, 0x16u);
        }
        CFStringRef v18 = @"ServerDelayedRetry";
        goto LABEL_23;
      }
    }
LABEL_24:
  }
  v20 = [(FMRequest *)self nextRetryType];
  if (v20)
  {
  }
  else if ((id)[(FMRequest *)self responseErrorType] == (id)257)
  {
    [(FMRequest *)self setNextRetryType:@"NoMoreRetries"];
  }
  uint64_t v21 = [(FMRequest *)self nextRetryType];
  if (v21)
  {
    v22 = (void *)v21;
LABEL_31:

    goto LABEL_34;
  }
  if ((id)[(FMRequest *)self responseErrorType] == (id)514
    && ![(FMRequest *)self _retryCountForType:@"TryOriginalHost"])
  {
    [(FMRequest *)self setNextRetryType:@"TryOriginalHost"];
    v22 = [v3 account];
    v26 = [v22 authId];
    +[RealmSupport clearCachedHostsWithContext:v26];

    double v11 = 0.0;
    goto LABEL_31;
  }
LABEL_34:
  uint64_t v23 = [(FMRequest *)self nextRetryType];
  if (v23)
  {
  }
  else if (([(FMRequest *)self responseErrorType] & 0x200) != 0)
  {
    uint64_t v24 = [(FMRequest *)self _retryCountForType:@"TimerBasedNetworkRetry"];
    if ([(FMRequest *)self maxTimerBasedNetworkRetries] == -1
      || [(FMRequest *)self maxTimerBasedNetworkRetries] > v24)
    {
      [(FMRequest *)self setNextRetryType:@"TimerBasedNetworkRetry"];
      [(FMRequest *)self _decayedWaitIntervalForRetryCount:v24];
      double v11 = v25;
    }
    else
    {
      signed int v27 = [(FMRequest *)self _consecutiveRetryCountForType:@"NotificationBasedNetworkRetry"];
      if ([(FMRequest *)self maxConsecutiveNetworkNotificationRetries] == -1
        || [(FMRequest *)self maxConsecutiveNetworkNotificationRetries] > v27)
      {
        [(FMRequest *)self setNextRetryType:@"NotificationBasedNetworkRetry"];
        v28 = sub_10001B6D4();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = [(FMRequest *)self fm_logID];
          int v46 = 138412290;
          id v47 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@ Waiting for a network-up notification to retry again", (uint8_t *)&v46, 0xCu);
        }
        double v11 = -1.0;
      }
      else
      {
        [(FMRequest *)self setNextRetryType:@"NoMoreRetries"];
        v30 = sub_10001B6D4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = [(FMRequest *)self fm_logID];
          int v46 = 138412290;
          id v47 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@ Stopped retrying since we exceeded the maximum number of consecutive network-up notification based retries", (uint8_t *)&v46, 0xCu);
        }
      }
    }
  }
  v32 = [(FMRequest *)self nextRetryType];
  if (v32)
  {
  }
  else if ((id)[(FMRequest *)self responseErrorType] == (id)769)
  {
    signed int v33 = [(FMRequest *)self _retryCountForType:@"RedirectRetry"];
    if (v33)
    {
      uint64_t v34 = v33;
      if ([(FMRequest *)self maxNonNetworkRelatedRetries] == -1
        || [(FMRequest *)self maxNonNetworkRelatedRetries] > v34)
      {
        [(FMRequest *)self setNextRetryType:@"RedirectRetry"];
        [(FMRequest *)self _decayedWaitIntervalForRetryCount:v34];
        double v11 = v35;
      }
      else
      {
        [(FMRequest *)self setNextRetryType:@"NoMoreRetries"];
        v36 = sub_10001B6D4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = [(FMRequest *)self fm_logID];
          int v46 = 138412290;
          id v47 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@ Stopped retrying since we exceeded the maximum number of redirect retries", (uint8_t *)&v46, 0xCu);
        }
      }
    }
    else
    {
      [(FMRequest *)self setNextRetryType:@"RedirectRetry"];
      double v11 = 0.0;
    }
  }
  v38 = [(FMRequest *)self nextRetryType];

  if (!v38)
  {
    v39 = +[NSNumber numberWithInteger:[(FMRequest *)self httpResponseStatus]];
    v40 = [v39 stringValue];

    uint64_t v41 = [(FMRequest *)self _retryCountForType:v40];
    if ([(FMRequest *)self maxNonNetworkRelatedRetries] == -1
      || [(FMRequest *)self maxNonNetworkRelatedRetries] > v41)
    {
      [(FMRequest *)self setNextRetryType:v40];
      [(FMRequest *)self _decayedWaitIntervalForRetryCount:v41];
      double v11 = v42;
    }
    else
    {
      [(FMRequest *)self setNextRetryType:@"NoMoreRetries"];
      v43 = sub_10001B6D4();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = [(FMRequest *)self fm_logID];
        int v46 = 138412546;
        id v47 = v44;
        __int16 v48 = 2112;
        double v49 = *(double *)&v40;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%@ Stopped retrying since we exceeded the maximum number of retries for status code %@", (uint8_t *)&v46, 0x16u);
      }
    }
  }
  v45 = [(FMRequest *)self nextRetryType];
  -[FMRequest setWillRetry:](self, "setWillRetry:", [v45 isEqualToString:@"NoMoreRetries"] ^ 1);

  [(FMRequest *)self _scheduleRetryAfterTimeInterval:v11];
}

- (double)_decayedWaitIntervalForRetryCount:(int64_t)a3
{
  [(FMRequest *)self firstRetryInterval];
  double v6 = v5;
  [(FMRequest *)self retryIntervalDecayFactor];
  double v8 = v6 * pow(v7, (double)a3);
  [(FMRequest *)self maxRetryInterval];
  if (v9 <= -1.0) {
    return v8;
  }
  [(FMRequest *)self maxRetryInterval];
  if (v8 <= v10) {
    return v8;
  }

  [(FMRequest *)self maxRetryInterval];
  return result;
}

- (void)_retryTimerFired
{
  v3 = [(FMRequest *)self retryTimer];
  [v3 invalidate];

  [(FMRequest *)self setRetryTimer:0];
  [(FMRequest *)self setNextRetryTime:0];
  if ([(FMRequest *)self inProgress])
  {
    id v4 = sub_10001B6D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = [(FMRequest *)self fm_logID];
      int v6 = 138412290;
      long double v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ Retry time arrived, but request cannot be retried anymore or retry is already in progress. Not retrying", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [(FMRequest *)self _retryNow];
  }
}

- (void)_retryNow
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    uint64_t v7 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ Retrying request now...", (uint8_t *)&v6, 0xCu);
  }

  id v4 = +[NSDate date];
  [(FMRequest *)self setLastRetryTime:v4];

  double v5 = [(FMRequest *)self nextRetryType];
  [(FMRequest *)self _incrementRetryCountForType:v5];

  [(FMRequest *)self send];
}

- (void)_networkCameUp
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100038A30(self);
  }

  if ([(FMRequest *)self canRequestBeRetriedNow]
    && ![(FMRequest *)self inProgress])
  {
    id v4 = [(FMRequest *)self nextRetryType];
    if ([v4 isEqualToString:@"TimerBasedNetworkRetry"])
    {
    }
    else
    {
      double v5 = [(FMRequest *)self nextRetryType];
      unsigned int v6 = [v5 isEqualToString:@"NotificationBasedNetworkRetry"];

      if (!v6) {
        return;
      }
    }
    uint64_t v7 = +[NSDate date];
    double v8 = [(FMRequest *)self nextRetryType];
    if ([v8 isEqualToString:@"NotificationBasedNetworkRetry"])
    {
      double v9 = [(FMRequest *)self nextRetryTime];

      if (v9)
      {
        double v10 = sub_10001B6D4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          double v11 = [(FMRequest *)self fm_logID];
          unsigned int v12 = [(FMRequest *)self nextRetryTime];
          int v24 = 138412546;
          double v25 = v11;
          __int16 v26 = 2112;
          signed int v27 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ Network up retry already pending for %@", (uint8_t *)&v24, 0x16u);
        }
        goto LABEL_28;
      }
    }
    else
    {
    }
    v13 = [(FMRequest *)self lastRetryType];
    if ([v13 isEqualToString:@"NotificationBasedNetworkRetry"])
    {
      double v14 = [(FMRequest *)self lastRetryTime];

      if (v14)
      {
        int64_t v15 = [(FMRequest *)self lastRetryTime];
        [v7 timeIntervalSinceDate:v15];
        double v17 = v16;

        if (v17 >= 60.0 || v17 < 0.0) {
          double v19 = 0.0;
        }
        else {
          double v19 = 60.0 - v17;
        }
        goto LABEL_23;
      }
    }
    else
    {
    }
    double v19 = 0.0;
LABEL_23:
    v20 = [(FMRequest *)self nextRetryTime];

    if (!v20
      || ([(FMRequest *)self nextRetryTime],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          [v21 timeIntervalSinceDate:v7],
          double v23 = v22,
          v21,
          v23 < 0.0)
      || v23 >= v19)
    {
      [(FMRequest *)self _scheduleRetryAfterTimeInterval:v19];
      goto LABEL_30;
    }
    double v10 = sub_10001B6D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10003898C(self);
    }
LABEL_28:

LABEL_30:
  }
}

- (void)_scheduleRetryAfterTimeInterval:(double)a3
{
  if (a3 <= 0.0)
  {
    int64_t v15 = sub_10001B6D4();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (a3 >= 0.0)
    {
      if (v16)
      {
        CFStringRef v18 = [(FMRequest *)self fm_logID];
        double v19 = [(FMRequest *)self nextRetryType];
        *(_DWORD *)buf = 138412546;
        double v23 = v18;
        __int16 v24 = 2112;
        double v25 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ Scheduling retry of type '%@' to occur now", buf, 0x16u);
      }
      v20 = +[NSDate date];
      [(FMRequest *)self setNextRetryTime:v20];

      uint64_t v21 = +[NSThread currentThread];
      [(FMRequest *)self performSelector:"_retryNow" onThread:v21 withObject:0 waitUntilDone:0];
    }
    else
    {
      if (v16)
      {
        double v17 = [(FMRequest *)self fm_logID];
        *(_DWORD *)buf = 138412290;
        double v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ Not scheduling any retry", buf, 0xCu);
      }
      [(FMRequest *)self setNextRetryTime:0];
    }
  }
  else
  {
    double v5 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    [(FMRequest *)self setNextRetryTime:v5];

    unsigned int v6 = sub_10001B6D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [(FMRequest *)self fm_logID];
      double v8 = [(FMRequest *)self nextRetryType];
      double v9 = [(FMRequest *)self nextRetryTime];
      *(_DWORD *)buf = 138412802;
      double v23 = v7;
      __int16 v24 = 2112;
      double v25 = v8;
      __int16 v26 = 2112;
      signed int v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Scheduling retry of type '%@' to occur at %@", buf, 0x20u);
    }
    double v10 = +[NSString stringWithFormat:@"com.apple.icloud.fmflocatord.retry.%@-%X", objc_opt_class(), self];
    id v11 = [objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:v10 serviceIdentifier:self target:"_retryTimerFired" selector:0 userInfo:a3];
    [(FMRequest *)self setRetryTimer:v11];

    unsigned int v12 = [(FMRequest *)self retryTimer];
    [v12 setMinimumEarlyFireProportion:0.75];

    v13 = [(FMRequest *)self retryTimer];
    double v14 = +[NSRunLoop currentRunLoop];
    [v13 scheduleInRunLoop:v14];
  }
}

- (int)_retryCountForType:(id)a3
{
  id v4 = a3;
  double v5 = [(FMRequest *)self totalRetriesByType];
  unsigned int v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int v7 = [v6 intValue];
  }
  else {
    int v7 = 0;
  }

  return v7;
}

- (int)_consecutiveRetryCountForType:(id)a3
{
  id v4 = a3;
  double v5 = [(FMRequest *)self consecutiveRetriesByType];
  unsigned int v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int v7 = [v6 intValue];
  }
  else {
    int v7 = 0;
  }

  return v7;
}

- (void)_incrementRetryCountForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v18 = v4;
    double v5 = [(FMRequest *)self totalRetriesByType];

    if (!v5)
    {
      unsigned int v6 = +[NSMutableDictionary dictionary];
      [(FMRequest *)self setTotalRetriesByType:v6];

      int v7 = +[NSMutableDictionary dictionary];
      [(FMRequest *)self setConsecutiveRetriesByType:v7];
    }
    double v8 = [(FMRequest *)self totalRetriesByType];
    double v9 = [v8 objectForKeyedSubscript:v18];

    double v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 intValue] + 1);
    id v11 = [(FMRequest *)self totalRetriesByType];
    [v11 setObject:v10 forKeyedSubscript:v18];

    unsigned int v12 = [(FMRequest *)self consecutiveRetriesByType];
    v13 = [v12 objectForKeyedSubscript:v18];

    double v14 = [(FMRequest *)self lastRetryType];
    unsigned int v15 = [v18 isEqualToString:v14];

    if (v15)
    {
      +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 intValue] + 1);
      BOOL v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v16 = &off_10005EEE8;
    }
    double v17 = [(FMRequest *)self consecutiveRetriesByType];
    [v17 setObject:v16 forKeyedSubscript:v18];

    id v4 = v18;
  }
  ++self->_totalRetryCount;
}

- (void)_networkStateChanged:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:@"IsNetworkAvailable"];

  if (v5 && [v5 BOOLValue]) {
    [(FMRequest *)self _networkCameUp];
  }

  _objc_release_x1();
}

- (FindBaseServiceProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (BOOL)willRetry
{
  return self->_willRetry;
}

- (void)setWillRetry:(BOOL)a3
{
  self->_willRetry = a3;
}

- (int64_t)httpResponseStatus
{
  return self->_httpResponseStatus;
}

- (void)setHttpResponseStatus:(int64_t)a3
{
  self->_httpResponseStatus = a3;
}

- (NSDictionary)httpResponseHeaders
{
  return self->_httpResponseHeaders;
}

- (void)setHttpResponseHeaders:(id)a3
{
}

- (NSDictionary)httpResponseBody
{
  return self->_httpResponseBody;
}

- (void)setHttpResponseBody:(id)a3
{
}

- (NSError)httpResponseError
{
  return self->_httpResponseError;
}

- (void)setHttpResponseError:(id)a3
{
}

- (FMRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)willSendHandler
{
  return self->_willSendHandler;
}

- (void)setWillSendHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSDictionary)alertFromServerResponse
{
  return self->_alertFromServerResponse;
}

- (void)setAlertFromServerResponse:(id)a3
{
}

- (FMFURLSessionTask)currentDataTask
{
  return self->_currentDataTask;
}

- (void)setCurrentDataTask:(id)a3
{
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
}

- (int64_t)totalRetryCount
{
  return self->_totalRetryCount;
}

- (void)setTotalRetryCount:(int64_t)a3
{
  self->_totalRetryCount = a3;
}

- (NSMutableDictionary)totalRetriesByType
{
  return self->_totalRetriesByType;
}

- (void)setTotalRetriesByType:(id)a3
{
}

- (NSMutableDictionary)consecutiveRetriesByType
{
  return self->_consecutiveRetriesByType;
}

- (void)setConsecutiveRetriesByType:(id)a3
{
}

- (NSString)lastRetryType
{
  return self->_lastRetryType;
}

- (void)setLastRetryType:(id)a3
{
}

- (NSDate)lastRetryTime
{
  return self->_lastRetryTime;
}

- (void)setLastRetryTime:(id)a3
{
}

- (NSString)nextRetryType
{
  return self->_nextRetryType;
}

- (void)setNextRetryType:(id)a3
{
}

- (NSDate)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(id)a3
{
}

- (PCPersistentTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_nextRetryTime, 0);
  objc_storeStrong((id *)&self->_nextRetryType, 0);
  objc_storeStrong((id *)&self->_lastRetryTime, 0);
  objc_storeStrong((id *)&self->_lastRetryType, 0);
  objc_storeStrong((id *)&self->_consecutiveRetriesByType, 0);
  objc_storeStrong((id *)&self->_totalRetriesByType, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_currentDataTask, 0);
  objc_storeStrong((id *)&self->_alertFromServerResponse, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_willSendHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_httpResponseError, 0);
  objc_storeStrong((id *)&self->_httpResponseBody, 0);
  objc_storeStrong((id *)&self->_httpResponseHeaders, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end