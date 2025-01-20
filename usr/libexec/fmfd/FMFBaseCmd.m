@interface FMFBaseCmd
+ (id)nextTransactionId;
- (BOOL)allowsEmptyResponse;
- (BOOL)ignoreAllResponseErrors;
- (BOOL)ignoreResponseErrors;
- (BOOL)isFireAndForget;
- (BOOL)isSuccess;
- (BOOL)isTransactionCompleteWithError:(id)a3;
- (BOOL)isUserAction;
- (BOOL)responseContainsFullModelUpdate;
- (BOOL)shouldIncludeDataContext;
- (BOOL)shouldIncludeServerContext;
- (BOOL)wasErrorHandled;
- (FMFBaseCmd)init;
- (FMFBaseCmd)initWithClientSession:(id)a3;
- (NSCopying)transactionId;
- (NSDictionary)currentLocation;
- (NSDictionary)requestTokens;
- (NSDictionary)requestTokensStatusMap;
- (NSNumber)clientPid;
- (NSNumber)requestTokensStatusCode;
- (NSString)callerIdentifier;
- (NSString)clientBundleId;
- (NSString)customCommandNotification;
- (NSString)didFailNotification;
- (NSString)didSucceedNotification;
- (NSString)groupId;
- (NSString)pathSuffix;
- (NSString)willFailNotification;
- (NSString)willSucceedNotification;
- (id)clientContext;
- (id)headers;
- (id)jsonBodyDictionary;
- (id)method;
- (id)path;
- (id)platform;
- (id)result;
- (id)tapContext;
- (int64_t)commandStatus;
- (int64_t)fmfServerError;
- (int64_t)retryCount;
- (void)initFailed;
- (void)processCommandResponse:(id)a3;
- (void)setCallerIdentifier:(id)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientPid:(id)a3;
- (void)setCommandStatus:(int64_t)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setFmfServerError:(int64_t)a3;
- (void)setGroupId:(id)a3;
- (void)setRequestTokens:(id)a3;
- (void)setRequestTokensStatusCode:(id)a3;
- (void)setRequestTokensStatusMap:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setTransactionId:(id)a3;
- (void)setWasErrorHandled:(BOOL)a3;
- (void)setupAuthentication;
@end

@implementation FMFBaseCmd

+ (id)nextTransactionId
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100007668;
  v9 = sub_1000075F8;
  id v10 = 0;
  if (qword_1000BB870 != -1) {
    dispatch_once(&qword_1000BB870, &stru_1000A2ED0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F1AC;
  block[3] = &unk_1000A2EF8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1000BB878, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (FMFBaseCmd)initWithClientSession:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FMFBaseCmd;
  uint64_t v5 = [(FMFBaseCmd *)&v32 init];
  if (v5)
  {
    if (!v4)
    {
      v6 = sub_100005560();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Created without clientSession: %@", buf, 0xCu);
      }
    }
    uint64_t v7 = [v4 clientPid];
    [(FMFBaseCmd *)v5 setClientPid:v7];

    v8 = [v4 clientBundleId];
    [(FMFBaseCmd *)v5 setClientBundleId:v8];

    v9 = +[FMFAccountManager sharedInstance];
    id v10 = [v9 account];

    v11 = [(id)objc_opt_class() nextTransactionId];
    [(FMFBaseCmd *)v5 setTransactionId:v11];

    if (+[Configuration FMFServiceUseSSL]) {
      CFStringRef v12 = @"https";
    }
    else {
      CFStringRef v12 = @"http";
    }
    [(FMFBaseCmd *)v5 setScheme:v12];
    v13 = [v10 dsid];
    [(FMFBaseCmd *)v5 setUsername:v13];

    [(FMFBaseCmd *)v5 setPassword:@"password"];
    v14 = [v10 fmfAppHostName];
    [(FMFBaseCmd *)v5 setHost:v14];

    v15 = [(FMFBaseCmd *)v5 host];

    if (!v15)
    {
      v16 = +[Configuration FMFServiceHost];
      [(FMFBaseCmd *)v5 setHost:v16];
    }
    v17 = +[Daemon sharedInstance];
    unsigned int v18 = [v17 isInternalBuild];

    if (v18)
    {
      v19 = +[NSUserDefaults standardUserDefaults];
      [v19 synchronize];

      v20 = +[NSUserDefaults standardUserDefaults];
      v21 = [v20 stringForKey:@"FMFDSchemeOverride"];

      v22 = +[NSUserDefaults standardUserDefaults];
      v23 = [v22 stringForKey:@"FMFDHostOverride"];

      v24 = +[NSUserDefaults standardUserDefaults];
      v25 = [v24 stringForKey:@"FMFDPortOverride"];

      if ([v21 length] && objc_msgSend(v23, "length") && objc_msgSend(v25, "length"))
      {
        [(FMFBaseCmd *)v5 setScheme:v21];
        [(FMFBaseCmd *)v5 setHost:v23];
        v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v25 integerValue]);
        [(FMFBaseCmd *)v5 setPort:v26];

        v27 = sub_100005560();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = [(FMFBaseCmd *)v5 scheme];
          v29 = [(FMFBaseCmd *)v5 host];
          v30 = [(FMFBaseCmd *)v5 port];
          *(_DWORD *)buf = 138412802;
          v34 = v28;
          __int16 v35 = 2112;
          v36 = v29;
          __int16 v37 = 2112;
          v38 = v30;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Overriding scheme:%@ host:%@ and port: %@", buf, 0x20u);
        }
      }
    }
    [(FMFBaseCmd *)v5 setupAuthentication];
  }
  return v5;
}

- (FMFBaseCmd)init
{
  return 0;
}

- (void)initFailed
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to instantiate command %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)headers
{
  v21.receiver = self;
  v21.super_class = (Class)FMFBaseCmd;
  id v2 = [(FMFBaseCmd *)&v21 headers];
  v3 = +[FMFSystemInfo sharedInstance];
  int v4 = +[FMFDataManager sharedInstance];
  v20 = [v4 modelVersion];

  uint64_t v5 = [v3 appVersion];
  v6 = [v3 productType];
  uint64_t v7 = [v3 osVersion];
  v8 = [v3 osBuildVersion];
  v9 = +[NSString stringWithFormat:@"FMFD/%@ %@/%@(%@)", v5, v6, v7, v8, 0];

  [v2 setObject:v9 forKey:@"User-Agent"];
  [v2 setObject:@"3.0" forKey:@"X-Apple-Find-API-Ver"];
  [v2 setObject:@"1.0" forKey:@"X-Apple-Realm-Support"];
  id v10 = [v3 productType];
  v11 = [v3 osName];
  CFStringRef v12 = [v3 osVersion];
  v13 = [v3 osBuildVersion];
  v14 = [v3 bundleIdentifier];
  v15 = [v3 clientInfoVersionTagString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@> <%@;%@;%@> <%@/%@>",
    v10,
    v11,
    v12,
    v13,
    v14,
  v16 = v15);

  [v2 setObject:v16 forKey:off_1000BB290];
  if (v20) {
    [v2 setObject:v20 forKey:@"X-FMF-Model-Version"];
  }
  v17 = +[NSUserDefaults standardUserDefaults];
  unsigned int v18 = [v17 BOOLForKey:@"useTestFMFServer"];

  if (v18) {
    [v2 setObject:@"true" forKey:@"x-apple-test-application"];
  }

  return v2;
}

- (id)jsonBodyDictionary
{
  v11.receiver = self;
  v11.super_class = (Class)FMFBaseCmd;
  v3 = [(FMFBaseCmd *)&v11 jsonBodyDictionary];
  int v4 = [(FMFBaseCmd *)self clientContext];
  uint64_t v5 = [(FMFBaseCmd *)self tapContext];
  v6 = +[FMFCommandManager sharedInstance];
  uint64_t v7 = [v6 commandServerContext];

  if (v4) {
    [v3 setObject:v4 forKey:@"clientContext"];
  }
  if ([v5 count]) {
    [v3 setObject:v5 forKey:@"tapContext"];
  }
  if (v7 && [(FMFBaseCmd *)self shouldIncludeServerContext]) {
    [v3 setObject:v7 forKey:@"serverContext"];
  }
  if ([(FMFBaseCmd *)self shouldIncludeDataContext])
  {
    v8 = +[FMFCommandManager sharedInstance];
    v9 = [v8 commandDataContext];

    if (v9) {
      [v3 setObject:v9 forKey:@"dataContext"];
    }
  }

  return v3;
}

- (id)result
{
  int v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FMFBaseCmd.m" lineNumber:204 description:@"must implement in subclass"];

  return 0;
}

- (NSString)willSucceedNotification
{
  return 0;
}

- (NSString)didSucceedNotification
{
  return 0;
}

- (NSString)willFailNotification
{
  return 0;
}

- (NSString)didFailNotification
{
  return 0;
}

- (NSString)customCommandNotification
{
  return 0;
}

- (id)method
{
  return @"POST";
}

- (id)tapContext
{
  return 0;
}

- (id)clientContext
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  int v4 = +[FMFSystemInfo sharedInstance];
  uint64_t v5 = +[NSTimeZone localTimeZone];
  v6 = [v4 appName];
  [v3 setObject:v6 forKeyedSubscript:@"appName"];

  uint64_t v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isFMFAppRemoved]);
  [v3 setObject:v7 forKeyedSubscript:@"isFMFAppRemoved"];

  v8 = [v4 deviceUDID];
  [v3 setObject:v8 forKeyedSubscript:@"deviceUDID"];

  v9 = [v4 deviceClass];
  [v3 setObject:v9 forKeyedSubscript:@"deviceClass"];

  id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 e928760c5fbc1719e59c427e2be01ce6]);
  [v3 setObject:v10 forKeyedSubscript:@"deviceHasPasscode"];

  objc_super v11 = [v4 productType];
  [v3 setObject:v11 forKeyedSubscript:@"productType"];

  CFStringRef v12 = [v4 osVersion];
  [v3 setObject:v12 forKeyedSubscript:@"osVersion"];

  v13 = [v4 osBuildVersion];
  [v3 setObject:v13 forKeyedSubscript:@"buildVersion"];

  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 unlockState]);
  [v3 setObject:v14 forKeyedSubscript:@"unlockState"];

  v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 processId]);
  v16 = [v15 stringValue];
  [v3 safelySetObject:v16 forKey:@"processId"];

  v17 = +[NSDate date];
  [v17 timeIntervalSince1970];
  v19 = +[NSNumber numberWithDouble:floor(v18 * 1000.0)];
  [v3 setObject:v19 forKeyedSubscript:@"currentTime"];

  v20 = [v5 abbreviation];
  objc_super v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 secondsFromGMT]);
  v22 = +[NSString stringWithFormat:@"%@, %@", v20, v21];
  [v3 setObject:v22 forKeyedSubscript:@"timezone"];

  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"fencingEnabled"];
  [v3 setObject:@"7.0" forKeyedSubscript:@"appVersion"];
  v23 = [(FMFBaseCmd *)self platform];
  [v3 setObject:v23 forKeyedSubscript:@"platform"];

  v24 = +[GEOCountryConfiguration sharedConfiguration];
  v25 = [v24 countryCode];
  [v3 setObject:v25 forKeyedSubscript:@"countryCode"];

  v26 = +[NSLocale currentLocale];
  v27 = [v26 objectForKey:NSLocaleCountryCode];
  [v3 setObject:v27 forKeyedSubscript:@"regionCode"];

  v28 = [v4 iCloudAccountName];
  v29 = +[FMFAccountManager sharedInstance];
  v30 = [v29 account];
  uint64_t v31 = [v30 apsEnvironment];
  objc_super v32 = (void *)v31;
  v33 = off_1000BB010;
  if (v31) {
    v33 = (__CFString *)v31;
  }
  v34 = v33;

  __int16 v35 = +[FMFAPSHandler instanceForEnvironment:v34];
  v36 = [v35 apsToken];

  if (v28) {
    [v3 setObject:v28 forKeyedSubscript:@"signedInAs"];
  }
  if (v36) {
    [v3 setObject:v36 forKeyedSubscript:@"apsToken"];
  }
  __int16 v37 = sub_100005560();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v36;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "APSToken %@", buf, 0xCu);
  }

  v38 = [(FMFBaseCmd *)self callerIdentifier];

  if (v38)
  {
    v39 = [(FMFBaseCmd *)self callerIdentifier];
    [v3 setObject:v39 forKeyedSubscript:@"callerIdHandle"];
  }
  v40 = [(FMFBaseCmd *)self clientPid];

  if (v40)
  {
    v41 = [(FMFBaseCmd *)self clientPid];
    [v3 setObject:v41 forKeyedSubscript:@"contextApp"];
  }
  v42 = [(FMFBaseCmd *)self clientBundleId];

  if (v42)
  {
    v43 = [(FMFBaseCmd *)self clientBundleId];
    [v3 setObject:v43 forKeyedSubscript:@"contextBundleApp"];
  }
  v44 = sub_100005560();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v3;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "FMBaseCmd: clientContext %@", buf, 0xCu);
  }

  id v45 = v3;
  return v45;
}

- (BOOL)responseContainsFullModelUpdate
{
  return 1;
}

- (BOOL)ignoreResponseErrors
{
  return 0;
}

- (BOOL)ignoreAllResponseErrors
{
  return 0;
}

- (BOOL)isFireAndForget
{
  return 0;
}

- (BOOL)allowsEmptyResponse
{
  return 1;
}

- (void)processCommandResponse:(id)a3
{
  id v41 = a3;
  int v4 = [v41 objectForKey:@"commandResponse"];
  uint64_t v5 = +[NSNull null];
  if (v4 == v5) {
    v6 = 0;
  }
  else {
    v6 = v4;
  }
  id v7 = v6;

  v8 = [v7 objectForKeyedSubscript:@"requestTokens"];
  v9 = +[NSNull null];
  if (v8 == v9)
  {
    [(FMFBaseCmd *)self setRequestTokens:0];
  }
  else
  {
    id v10 = [v7 objectForKeyedSubscript:@"requestTokens"];
    [(FMFBaseCmd *)self setRequestTokens:v10];
  }
  objc_super v11 = [v7 objectForKeyedSubscript:@"statusCode"];
  CFStringRef v12 = +[NSNull null];
  if (v11 == v12)
  {
    [(FMFBaseCmd *)self setRequestTokensStatusCode:0];
  }
  else
  {
    v13 = [v7 objectForKeyedSubscript:@"statusCode"];
    [(FMFBaseCmd *)self setRequestTokensStatusCode:v13];
  }
  v14 = [v7 objectForKeyedSubscript:@"statusMap"];
  v15 = +[NSNull null];
  if (v14 == v15)
  {
    [(FMFBaseCmd *)self setRequestTokensStatusMap:0];
  }
  else
  {
    v16 = [v7 objectForKeyedSubscript:@"statusMap"];
    [(FMFBaseCmd *)self setRequestTokensStatusMap:v16];
  }
  v17 = [(FMFBaseCmd *)self response];
  -[FMFBaseCmd setCommandStatus:](self, "setCommandStatus:", [v17 statusCode]);

  double v18 = [v41 objectForKey:@"dataContext"];
  v19 = [v41 objectForKey:@"serverContext"];
  v20 = +[NSNull null];

  objc_super v21 = +[NSNull null];

  if (v18 != v20 && v18)
  {
    v22 = +[FMFCommandManager sharedInstance];
    v23 = [v41 objectForKey:@"dataContext"];
    [v22 setCommandDataContext:v23];
  }
  if (v19 != v21 && v19)
  {
    v24 = +[FMFCommandManager sharedInstance];
    v25 = [v41 objectForKey:@"serverContext"];
    [v24 setCommandServerContext:v25];
  }
  if (v7)
  {
    v26 = [v7 objectForKey:@"statusCode"];
    v27 = +[NSNull null];
    if (v26 == v27) {
      v28 = 0;
    }
    else {
      v28 = v26;
    }
    id v29 = v28;

    id v30 = [v29 integerValue];
    [(FMFBaseCmd *)self setCommandStatus:v30];
    uint64_t v31 = [v7 objectForKey:@"alert"];
    objc_super v32 = +[NSNull null];

    if ((id)[(FMFBaseCmd *)self commandStatus] != (id)599) {
      [(FMFBaseCmd *)self commandStatus];
    }
  }
  else
  {
    v33 = [v41 objectForKey:@"statusCode"];
    v34 = +[NSNull null];
    if (v33 == v34) {
      __int16 v35 = 0;
    }
    else {
      __int16 v35 = v33;
    }
    id v36 = v35;

    if (v36)
    {
      -[FMFBaseCmd setCommandStatus:](self, "setCommandStatus:", [v36 integerValue]);
    }
    else
    {
      __int16 v37 = [v41 objectForKey:@"fetchStatus"];
      v38 = +[NSNull null];
      if (v37 == v38) {
        v39 = 0;
      }
      else {
        v39 = v37;
      }
      id v40 = v39;

      if (v40) {
        -[FMFBaseCmd setCommandStatus:](self, "setCommandStatus:", [v40 integerValue]);
      }
    }
  }
  [(FMFBaseCmd *)self commandStatus];
}

- (id)path
{
  id v3 = +[Configuration FMFServiceService];
  int v4 = +[FMFAccountManager sharedInstance];
  uint64_t v5 = [v4 account];
  v6 = [v5 dsid];

  id v7 = +[FMFSystemInfo sharedInstance];
  v8 = [v7 deviceUDID];

  if (qword_1000BB888 != -1) {
    dispatch_once(&qword_1000BB888, &stru_1000A2F18);
  }
  v9 = +[FMFSystemInfo sharedInstance];
  unsigned int v10 = [v9 isAudioAccessory];

  objc_super v11 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:qword_1000BB880];
  CFStringRef v12 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:qword_1000BB880];
  uint64_t v13 = [(FMFBaseCmd *)self pathSuffix];
  v14 = (void *)v13;
  if (v10) {
    CFStringRef v15 = @"%@ha/%@/%@/%@";
  }
  else {
    CFStringRef v15 = @"%@%@/%@/%@";
  }
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v3, v11, v12, v13);

  return v16;
}

- (NSString)pathSuffix
{
  return (NSString *)&stru_1000A3938;
}

- (void)setupAuthentication
{
  id v3 = +[FMFAccountManager sharedInstance];
  int v4 = [v3 account];
  uint64_t v5 = [v4 dsid];
  [(FMFBaseCmd *)self setUsername:v5];

  v6 = +[FMFAccountManager sharedInstance];
  id v7 = [v6 account];
  id v8 = [v7 fmfAppToken];

  [(FMFBaseCmd *)self setPassword:v8];
}

- (BOOL)isTransactionCompleteWithError:(id)a3
{
  v40.receiver = self;
  v40.super_class = (Class)FMFBaseCmd;
  unsigned int v5 = -[FMFBaseCmd isTransactionCompleteWithError:](&v40, "isTransactionCompleteWithError:");
  BOOL v6 = v5;
  if (!a3)
  {
    if (v5)
    {
      id v7 = [(FMFBaseCmd *)self response];
      id v8 = [v7 statusCode];

      if (v8 == (id)409)
      {
        int64_t modelOldRetryCount = self->modelOldRetryCount;
        if (modelOldRetryCount > 0)
        {
          unsigned int v10 = sub_100005560();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received 409 (modelIsOld) too many times. Flagging an error", buf, 2u);
          }

          objc_super v11 = +[NSError errorWithDomain:NSURLErrorDomain code:-1011 userInfo:0];
          [(FMFBaseCmd *)self setError:v11];

          return 1;
        }
        self->int64_t modelOldRetryCount = modelOldRetryCount + 1;
        v33 = +[NSNotificationCenter defaultCenter];
        [v33 postNotificationName:off_1000BAFE8 object:self userInfo:0];

        v34 = +[FMFCommandManager sharedInstance];
        [v34 clearDataAndServerContext];

        __int16 v35 = sub_100005560();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Received 409 (modelIsOld). Replaying the command after clearing local state", buf, 2u);
        }

LABEL_40:
        [(FMFBaseCmd *)self sendRequest];
        return 0;
      }
    }
  }
  CFStringRef v12 = [(FMFBaseCmd *)self response];
  id v13 = [v12 statusCode];

  if (v13 == (id)401)
  {
    v14 = +[NSError errorWithDomain:FMFErrorDomain code:1003 userInfo:0];
    [(FMFBaseCmd *)self setError:v14];

    CFStringRef v15 = sub_100005560();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMFErrorServerErrorUnauthorized for command(%@), renewing account credentials", buf, 0xCu);
    }

    BOOL v16 = [(FMFBaseCmd *)self isUserAction];
    v17 = +[FMFAccountManager sharedInstance];
    [v17 updateAccountCredentials:v16];

    double v18 = +[FMFAccountManager sharedInstance];
    [v18 setAccountStateUnauthorizedDueTo401];
    goto LABEL_12;
  }
  v19 = [(FMFBaseCmd *)self response];
  id v20 = [v19 statusCode];

  if (v20 == (id)403)
  {
    objc_super v21 = [(FMFBaseCmd *)self valueForResponseHTTPHeader:@"x-forbidden-reason"];
    if ([v21 isEqualToString:@"40399"]) {
      uint64_t v22 = 1005;
    }
    else {
      uint64_t v22 = 100;
    }
    id v20 = +[NSError errorWithDomain:FMFErrorDomain code:v22 userInfo:0];
    [(FMFBaseCmd *)self setError:v20];
LABEL_18:

LABEL_19:
    return v6;
  }
  v23 = [(FMFBaseCmd *)self response];
  if ((uint64_t)[v23 statusCode] <= 499)
  {
  }
  else
  {
    id v20 = [(FMFBaseCmd *)self response];
    uint64_t v24 = (uint64_t)[v20 statusCode];

    if (v24 <= 599)
    {
      v25 = [(FMFBaseCmd *)self response];
      if ([v25 statusCode] == (id)500) {
        uint64_t v26 = 1006;
      }
      else {
        uint64_t v26 = 1007;
      }

      if (![(FMFBaseCmd *)self isUserAction] && [(FMFBaseCmd *)self retryCount] <= 0)
      {
        __int16 v37 = sub_100005560();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v38 = [(FMFBaseCmd *)self retryCount];
          unsigned int v39 = [(FMFBaseCmd *)self isUserAction];
          *(_DWORD *)buf = 134218754;
          v42 = (FMFBaseCmd *)v38;
          __int16 v43 = 2048;
          uint64_t v44 = v26;
          __int16 v45 = 2112;
          v46 = self;
          __int16 v47 = 1024;
          unsigned int v48 = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Retrying due to 500/503, retryCount(%ld), statusCode(%ld), command(%@), isUserAction(%d)", buf, 0x26u);
        }

        [(FMFBaseCmd *)self setRetryCount:(char *)[(FMFBaseCmd *)self retryCount] + 1];
        goto LABEL_40;
      }
      v27 = sub_100005560();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v28 = [(FMFBaseCmd *)self retryCount];
        unsigned int v29 = [(FMFBaseCmd *)self isUserAction];
        *(_DWORD *)buf = 134218754;
        v42 = (FMFBaseCmd *)v28;
        __int16 v43 = 2048;
        uint64_t v44 = v26;
        __int16 v45 = 2112;
        v46 = self;
        __int16 v47 = 1024;
        unsigned int v48 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Returning error code 500/503 retryCount(%ld), statusCode(%ld), command(%@), isUserAction(%d)", buf, 0x26u);
      }

      id v30 = +[NSError errorWithDomain:FMFErrorDomain code:v26 userInfo:0];
      [(FMFBaseCmd *)self setError:v30];

      double v18 = +[FMFCommandManager sharedInstance];
      [v18 enter5XXGracePeriod];
LABEL_12:

      return v6;
    }
  }
  objc_super v21 = [(FMFBaseCmd *)self response];
  uint64_t v31 = (uint64_t)[v21 statusCode];
  if (v31 >= 200)
  {
    id v20 = [(FMFBaseCmd *)self response];
    if ((uint64_t)[v20 statusCode] <= 299) {
      goto LABEL_18;
    }
  }
  objc_super v32 = [(FMFBaseCmd *)self error];

  if (v31 >= 200) {
  if (!v32)
  }
  {
    objc_super v21 = +[NSError errorWithDomain:FMFErrorDomain code:100 userInfo:0];
    [(FMFBaseCmd *)self setError:v21];
    goto LABEL_19;
  }
  return v6;
}

- (BOOL)shouldIncludeDataContext
{
  return 1;
}

- (BOOL)shouldIncludeServerContext
{
  return 1;
}

- (BOOL)isUserAction
{
  return 0;
}

- (BOOL)isSuccess
{
  if ([(FMFBaseCmd *)self commandStatus] < 200
    || [(FMFBaseCmd *)self commandStatus] > 299)
  {
    return 0;
  }
  id v3 = [(FMFBaseCmd *)self jsonResponseParseError];
  BOOL v4 = v3 == 0;

  return v4;
}

- (NSString)groupId
{
  groupId = self->_groupId;
  if (!groupId)
  {
    [(FMFBaseCmd *)self setGroupId:FMFGroupIdOneToOne];
    groupId = self->_groupId;
  }

  return groupId;
}

- (void)setGroupId:(id)a3
{
}

- (id)platform
{
  return @"iphoneos";
}

- (NSCopying)transactionId
{
  return self->_transactionId;
}

- (void)setTransactionId:(id)a3
{
}

- (NSDictionary)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (int64_t)commandStatus
{
  return self->_commandStatus;
}

- (void)setCommandStatus:(int64_t)a3
{
  self->_commandStatus = a3;
}

- (int64_t)fmfServerError
{
  return self->_fmfServerError;
}

- (void)setFmfServerError:(int64_t)a3
{
  self->_fmfServerError = a3;
}

- (BOOL)wasErrorHandled
{
  return self->_wasErrorHandled;
}

- (void)setWasErrorHandled:(BOOL)a3
{
  self->_wasErrorHandled = a3;
}

- (NSString)callerIdentifier
{
  return self->_callerIdentifier;
}

- (void)setCallerIdentifier:(id)a3
{
}

- (NSDictionary)requestTokens
{
  return self->_requestTokens;
}

- (void)setRequestTokens:(id)a3
{
}

- (NSNumber)requestTokensStatusCode
{
  return self->_requestTokensStatusCode;
}

- (void)setRequestTokensStatusCode:(id)a3
{
}

- (NSDictionary)requestTokensStatusMap
{
  return self->_requestTokensStatusMap;
}

- (void)setRequestTokensStatusMap:(id)a3
{
}

- (NSNumber)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientPid, 0);
  objc_storeStrong((id *)&self->_requestTokensStatusMap, 0);
  objc_storeStrong((id *)&self->_requestTokensStatusCode, 0);
  objc_storeStrong((id *)&self->_requestTokens, 0);
  objc_storeStrong((id *)&self->_callerIdentifier, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);

  objc_storeStrong((id *)&self->_groupId, 0);
}

@end