@interface FMDRequest
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)cancelled;
- (BOOL)completed;
- (BOOL)inProgress;
- (BOOL)showAuthFailedMessage;
- (BOOL)willRetry;
- (FMDRequest)initWithAccount:(id)a3;
- (FMDRequestDecorator)decorator;
- (FMDRequestRetryHelper)retryHelper;
- (NSData)requestBodyData;
- (NSDictionary)alertFromServerResponse;
- (NSDictionary)httpResponseBody;
- (NSDictionary)httpResponseHeaders;
- (NSError)httpResponseError;
- (NSMutableDictionary)requestBody;
- (NSMutableDictionary)requestHeaders;
- (NSString)apsEnv;
- (NSString)authHeaderValue;
- (NSString)authId;
- (NSString)authToken;
- (NSString)urlTemplateType;
- (NSURL)fileLocation;
- (NSURL)requestUrl;
- (NSUUID)requestId;
- (double)firstRetryInterval;
- (double)maxRetryInterval;
- (double)retryIntervalDecayFactor;
- (id)completionHandler;
- (id)description;
- (id)willSendHandler;
- (int64_t)httpResponseStatus;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (int64_t)maxTimerBasedNetworkRetries;
- (int64_t)responseErrorType;
- (unint64_t)type;
- (void)dealloc;
- (void)deinitializeRequest;
- (void)setAlertFromServerResponse:(id)a3;
- (void)setApsEnv:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDecorator:(id)a3;
- (void)setFileLocation:(id)a3;
- (void)setHttpResponseBody:(id)a3;
- (void)setHttpResponseError:(id)a3;
- (void)setHttpResponseHeaders:(id)a3;
- (void)setHttpResponseStatus:(int64_t)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setRetryHelper:(id)a3;
- (void)setWillRetry:(BOOL)a3;
- (void)setWillSendHandler:(id)a3;
@end

@implementation FMDRequest

- (void)dealloc
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10023D064((uint64_t)self, v3);
  }

  [(FMDRequest *)self deinitializeRequest];
  v4.receiver = self;
  v4.super_class = (Class)FMDRequest;
  [(FMDRequest *)&v4 dealloc];
}

- (void)deinitializeRequest
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    v9 = self;
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) deinitializing...", (uint8_t *)&v6, 0x16u);
  }
  [(FMDRequest *)self setCompletionHandler:0];
  v5 = [(FMDRequest *)self retryHelper];
  [v5 deinitializeHelper];

  [(FMDRequest *)self setRetryHelper:0];
}

- (FMDRequest)initWithAccount:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMDRequest;
  v5 = [(FMDRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 authId];
    authId = v5->_authId;
    v5->_authId = (NSString *)v6;

    uint64_t v8 = [v4 authToken];
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v8;

    uint64_t v10 = [v4 apsEnvironment];
    apsEnv = v5->_apsEnv;
    v5->_apsEnv = (NSString *)v10;

    uint64_t v12 = +[NSUUID UUID];
    requestId = v5->_requestId;
    v5->_requestId = (NSUUID *)v12;

    [(FMDRequest *)v5 setWillRetry:1];
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@-%p", objc_opt_class(), self];
}

- (NSURL)requestUrl
{
  return 0;
}

- (NSString)urlTemplateType
{
  return (NSString *)&stru_1002E7428;
}

- (NSMutableDictionary)requestBody
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDRequest *)self decorator];

  if (v4)
  {
    v5 = [(FMDRequest *)self decorator];
    uint64_t v6 = [v5 serverContextGenerator];
    id v7 = v6[2]();

    [v3 fm_safelyMapKey:@"serverContext" toObject:v7];
    uint64_t v8 = [(FMDRequest *)self decorator];
    v9 = [v8 deviceContextGenerator];
    uint64_t v10 = v9[2]();

    [v3 fm_safelyMapKey:@"deviceContext" toObject:v10];
    v11 = [(FMDRequest *)self decorator];
    uint64_t v12 = [v11 deviceInfoGenerator];
    v13 = v12[2]();

    [v3 fm_safelyMapKey:@"deviceInfo" toObject:v13];
  }

  return (NSMutableDictionary *)v3;
}

- (BOOL)showAuthFailedMessage
{
  return 1;
}

- (unint64_t)type
{
  return 1;
}

- (NSMutableDictionary)requestHeaders
{
  v3 = objc_opt_new();
  id v4 = [(FMDRequest *)self authId];

  if (v4)
  {
    v5 = [(FMDRequest *)self authId];
    [v3 setObject:v5 forKeyedSubscript:@"X-Apple-PrsId"];
  }
  uint64_t v6 = [(FMDRequest *)self apsEnv];

  if (v6)
  {
    id v7 = [(FMDRequest *)self apsEnv];
    [v3 setObject:v7 forKeyedSubscript:@"X-Apple-PushEnv"];
  }
  uint64_t v8 = +[FMDProtectedContextManager sharedManager];
  id v18 = 0;
  id v19 = 0;
  v9 = [v8 contextForKey:@"serverContextHeaderContext" contextUUID:&v19 error:&v18];
  id v10 = v19;
  id v11 = v18;

  if (v11)
  {
    uint64_t v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023D10C((uint64_t)v11, v12);
    }
  }
  [v3 fm_safelyMapKey:@"X-Apple-Ctx" toObject:v9];
  [v3 setObject:@"6.0" forKeyedSubscript:@"X-Apple-Find-API-Ver"];
  v13 = +[FMDServerConfig sharedInstance];
  v14 = [v13 userAgent];

  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:@"User-Agent"];
  }
  [v3 setObject:@"application/json" forKeyedSubscript:@"Content-Type"];
  objc_super v15 = [(FMDRequest *)self authHeaderValue];
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:@"Authorization"];
  }
  if (+[FMDPreferencesMgr userTestApplication]) {
    [v3 setObject:@"true" forKeyedSubscript:@"X-Apple-Test-Application"];
  }
  [v3 setObject:@"1.0" forKeyedSubscript:@"X-Apple-Realm-Support"];
  v16 = +[FMDPreferencesMgr httpRequestHeaders];
  if (v16) {
    [v3 addEntriesFromDictionary:v16];
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
  if ([(FMDRequest *)self completed]) {
    return 0;
  }
  else {
    return ![(FMDRequest *)self cancelled];
  }
}

- (BOOL)canReplace:(id)a3
{
  return 1;
}

- (int64_t)responseErrorType
{
  v3 = [(FMDRequest *)self httpResponseError];

  if (v3)
  {
    id v4 = [(FMDRequest *)self httpResponseError];
    v5 = [v4 domain];
    unsigned int v6 = [NSURLErrorDomain isEqualToString:v5];

    if (v6)
    {
      id v7 = [(FMDRequest *)self httpResponseError];
      id v8 = [v7 code];

      if ((unint64_t)v8 + 1019 >= 0x13) {
        v9 = &qword_10026A3E0;
      }
      else {
        v9 = off_1002DA558[(void)v8 + 1019];
      }
      return *v9;
    }
    id v10 = [(FMDRequest *)self httpResponseError];
    id v11 = [v10 domain];
    unsigned int v12 = [NSPOSIXErrorDomain isEqualToString:v11];

    if (v12)
    {
      v13 = [(FMDRequest *)self httpResponseError];
      id v14 = [v13 code];

      if (v14 == (id)22)
      {
        v9 = &qword_10026A3F0;
        return *v9;
      }
    }
  }
  int64_t v15 = [(FMDRequest *)self httpResponseStatus];
  if (v15 == 401)
  {
    v9 = &qword_10026A3E8;
  }
  else if (v15 == 330)
  {
    v9 = &qword_10026A400;
  }
  else
  {
    v9 = &qword_10026A3E0;
    if ([(FMDRequest *)self httpResponseStatus] >= 200
      && [(FMDRequest *)self httpResponseStatus] <= 299)
    {
      v9 = &qword_10026A3D0;
    }
  }
  return *v9;
}

- (NSString)authHeaderValue
{
  v3 = [(FMDRequest *)self authId];
  id v4 = [(FMDRequest *)self authToken];
  v5 = +[NSString stringWithFormat:@"%@:%@", v3, v4];

  unsigned int v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10023D184((uint64_t)v5, v6);
  }

  id v7 = [v5 dataUsingEncoding:4];
  id v8 = v7;
  if (v7 && [v7 length])
  {
    v9 = [v8 base64EncodedString];
    if (v9)
    {
      id v10 = +[NSString stringWithFormat:@"Basic %@", v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return (NSString *)v10;
}

- (NSUUID)requestId
{
  return self->_requestId;
}

- (NSData)requestBodyData
{
  return self->_requestBodyData;
}

- (NSString)authId
{
  return self->_authId;
}

- (NSString)authToken
{
  return self->_authToken;
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

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
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

- (NSURL)fileLocation
{
  return self->_fileLocation;
}

- (void)setFileLocation:(id)a3
{
}

- (FMDRequestDecorator)decorator
{
  return self->_decorator;
}

- (void)setDecorator:(id)a3
{
}

- (FMDRequestRetryHelper)retryHelper
{
  return self->_retryHelper;
}

- (void)setRetryHelper:(id)a3
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

- (void)setCompletionHandler:(id)a3
{
}

- (NSDictionary)alertFromServerResponse
{
  return self->_alertFromServerResponse;
}

- (void)setAlertFromServerResponse:(id)a3
{
}

- (NSString)apsEnv
{
  return self->_apsEnv;
}

- (void)setApsEnv:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsEnv, 0);
  objc_storeStrong((id *)&self->_alertFromServerResponse, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_willSendHandler, 0);
  objc_storeStrong((id *)&self->_retryHelper, 0);
  objc_storeStrong((id *)&self->_decorator, 0);
  objc_storeStrong((id *)&self->_fileLocation, 0);
  objc_storeStrong((id *)&self->_httpResponseError, 0);
  objc_storeStrong((id *)&self->_httpResponseBody, 0);
  objc_storeStrong((id *)&self->_httpResponseHeaders, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authId, 0);
  objc_storeStrong((id *)&self->_requestBodyData, 0);

  objc_storeStrong((id *)&self->_requestId, 0);
}

@end