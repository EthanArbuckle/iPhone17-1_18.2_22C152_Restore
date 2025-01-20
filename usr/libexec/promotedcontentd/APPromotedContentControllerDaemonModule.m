@interface APPromotedContentControllerDaemonModule
+ (NSDate)daemonStartTime;
+ (id)_loadSettings;
+ (id)setup;
+ (void)_migrateData;
+ (void)didPrewarm:(id)a3;
- (BOOL)httpUseFixedHttpSessionManager;
- (BOOL)useAMSMescal;
- (double)httpLookBackWindow;
- (int64_t)cacheSizeLimit;
- (int64_t)httpMaximumConnectionsPerHost;
- (int64_t)httpMaximumConnectionsPerHostTempSession;
- (void)setCacheSizeLimit:(int64_t)a3;
- (void)setHttpLookBackWindow:(double)a3;
- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3;
- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3;
- (void)setHttpUseFixedHttpSessionManager:(BOOL)a3;
- (void)setUseAMSMescal:(BOOL)a3;
@end

@implementation APPromotedContentControllerDaemonModule

+ (void)didPrewarm:(id)a3
{
  v4 = [a3 objectForKey:@"pcStartTime"];
  if (v4)
  {
    v5 = [a1 daemonStartTime];
    [v4 timeIntervalSinceDate:v5];
    BOOL v7 = v6 < 0.0;

    CFStringRef v10 = @"coldStart";
    v8 = +[NSNumber numberWithBool:v7];
    v11 = v8;
    v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    +[APAnalytics sendEvent:@"coldstart" customPayload:v9];
  }
}

+ (NSDate)daemonStartTime
{
  return (NSDate *)(id)_daemonStartTime;
}

+ (id)setup
{
  uint64_t v3 = +[NSDate now];
  v4 = (void *)_daemonStartTime;
  _daemonStartTime = v3;

  [a1 _migrateData];
  double v6 = [a1 _loadSettings];

  return v6;
}

+ (void)_migrateData
{
  id v9 = 0;
  v2 = +[APKeychainServices objectForKey:@"APPromotedContentDaemonSettings.efsVersion" error:&v9];
  id v3 = v9;
  v4 = v3;
  if (!v3
    || (([v3 domain],
         v5 = objc_claimAutoreleasedReturnValue(),
         ![v5 isEqualToString:APKeychainServicesErrorDomain])
      ? (BOOL v6 = 1)
      : (BOOL v6 = [v4 code] != (id)-25300),
        v5,
        !v6))
  {
    if (v2)
    {
      BOOL v7 = APLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Detected old EFS version.", v8, 2u);
      }

      +[APStorageManager cleanupOldStorage];
      +[APKeychainServices setObject:0 forKey:@"com.apple.ap.APCryptor.seed"];
      +[APKeychainServices setObject:0 forKey:@"APPromotedContentDaemonSettings.efsVersion"];
    }
  }
}

+ (id)_loadSettings
{
  v2 = +[APPCControllerDaemonSettings settings];
  id v3 = [v2 useAMSMescalValue];
  id v4 = [v2 httpUseFixedHttpSessionManagerValue];
  id v5 = [v2 httpMaximumConnectionsPerHostValue];
  id v6 = [v2 httpMaximumConnectionsPerHostTempSessionValue];
  [v2 httpLookBackWindowValue];
  double v8 = v7;
  id v9 = [v2 cacheSizeLimitValue];
  CFStringRef v10 = objc_alloc_init(APPromotedContentControllerDaemonModule);
  [(APPromotedContentControllerDaemonModule *)v10 setUseAMSMescal:v3];
  [(APPromotedContentControllerDaemonModule *)v10 setHttpUseFixedHttpSessionManager:v4];
  [(APPromotedContentControllerDaemonModule *)v10 setHttpMaximumConnectionsPerHost:v5];
  [(APPromotedContentControllerDaemonModule *)v10 setHttpMaximumConnectionsPerHostTempSession:v6];
  [(APPromotedContentControllerDaemonModule *)v10 setHttpLookBackWindow:v8];
  [(APPromotedContentControllerDaemonModule *)v10 setCacheSizeLimit:v9];
  v11 = +[NSProcessInfo processInfo];
  unsigned __int8 v12 = [v11 isRunningTests];

  if ((v12 & 1) == 0)
  {
    v13 = dispatch_get_global_queue(25, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100182008;
    v15[3] = &unk_100238AF0;
    char v21 = (char)v3;
    id v16 = v2;
    char v22 = (char)v4;
    double v17 = v8;
    id v18 = v5;
    id v19 = v6;
    id v20 = v9;
    dispatch_async(v13, v15);
  }

  return v10;
}

- (BOOL)useAMSMescal
{
  return self->_useAMSMescal;
}

- (void)setUseAMSMescal:(BOOL)a3
{
  self->_useAMSMescal = a3;
}

- (BOOL)httpUseFixedHttpSessionManager
{
  return self->_httpUseFixedHttpSessionManager;
}

- (void)setHttpUseFixedHttpSessionManager:(BOOL)a3
{
  self->_httpUseFixedHttpSessionManager = a3;
}

- (int64_t)httpMaximumConnectionsPerHost
{
  return self->_httpMaximumConnectionsPerHost;
}

- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHost = a3;
}

- (int64_t)httpMaximumConnectionsPerHostTempSession
{
  return self->_httpMaximumConnectionsPerHostTempSession;
}

- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHostTempSession = a3;
}

- (double)httpLookBackWindow
{
  return self->_httpLookBackWindow;
}

- (void)setHttpLookBackWindow:(double)a3
{
  self->_httpLookBackWindow = a3;
}

- (int64_t)cacheSizeLimit
{
  return self->_cacheSizeLimit;
}

- (void)setCacheSizeLimit:(int64_t)a3
{
  self->_cacheSizeLimit = a3;
}

@end