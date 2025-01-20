@interface CRLAnalyticsLogger
+ (id)loggerWithDomain:(id)a3;
+ (void)sendEventInDomain:(id)a3 lazily:(BOOL)a4 eventPayload:(id)a5;
- (BOOL)canLogAnalytics;
- (BOOL)recalculateDomain;
- (CRLAnalyticsLogger)initWithDomain:(id)a3;
- (NSString)baseDomain;
- (NSString)cachedFullDomain;
- (NSString)domain;
- (id)p_eventPayloadFromPayload:(id)a3;
- (void)p_loadCoreAnalyticsIfNeeded;
- (void)postNotificationForEventPayload:(id)a3;
- (void)sendEventLazily:(BOOL)a3 eventPayload:(id)a4;
- (void)setBaseDomain:(id)a3;
- (void)setCachedFullDomain:(id)a3;
- (void)setRecalculateDomain:(BOOL)a3;
@end

@implementation CRLAnalyticsLogger

+ (id)loggerWithDomain:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithDomain:v3];

  return v4;
}

- (CRLAnalyticsLogger)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLAnalyticsLogger;
  v6 = [(CRLAnalyticsLogger *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseDomain, a3);
    v7->_recalculateDomain = 1;
  }

  return v7;
}

- (NSString)domain
{
  if ([(CRLAnalyticsLogger *)self recalculateDomain])
  {
    id v3 = [(CRLAnalyticsLogger *)self baseDomain];
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.freeform.%@", v3];
    [(CRLAnalyticsLogger *)self setCachedFullDomain:v4];

    [(CRLAnalyticsLogger *)self setRecalculateDomain:0];
  }

  return [(CRLAnalyticsLogger *)self cachedFullDomain];
}

- (BOOL)canLogAnalytics
{
  return 1;
}

- (void)p_loadCoreAnalyticsIfNeeded
{
  if (qword_1016A9AC8 != -1) {
    dispatch_once(&qword_1016A9AC8, &stru_1014F95B8);
  }
}

- (id)p_eventPayloadFromPayload:(id)a3
{
  id v32 = a3;
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 infoDictionary];
  id v5 = [v4 objectForKey:@"CFBundleName"];

  uint64_t v6 = [v5 lowercaseString];

  v46[0] = @"bundleID";
  v7 = +[NSBundle mainBundle];
  v8 = [v7 bundleIdentifier];
  v47[0] = v8;
  v47[1] = v6;
  v30 = (void *)v6;
  v46[1] = @"appName";
  v46[2] = @"appVersion";
  objc_super v9 = +[NSBundle mainBundle];
  v10 = [v9 infoDictionary];
  v11 = [v10 objectForKey:@"CFBundleShortVersionString"];
  v47[2] = v11;
  v46[3] = @"appBuild";
  v12 = +[NSBundle mainBundle];
  v13 = [v12 objectForInfoDictionaryKey:kCFBundleVersionKey];
  v47[3] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v29 = v14;
  id obj = [v14 allKeys];
  id v15 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = [v32 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * (void)v18)];

        if (v19)
        {
          unsigned int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F95D8);
          }
          v21 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v38 = v20;
            __int16 v39 = 2082;
            v40 = "-[CRLAnalyticsLogger p_eventPayloadFromPayload:]";
            __int16 v41 = 2082;
            v42 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnalyticsLogger.m";
            __int16 v43 = 1024;
            int v44 = 105;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Duplicate key found in Core Analytics event payload, added value may be overridden.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F95F8);
          }
          v22 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v25 = v22;
            v26 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v38 = v20;
            __int16 v39 = 2114;
            v40 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnalyticsLogger p_eventPayloadFromPayload:]");
          v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnalyticsLogger.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 105, 0, "Duplicate key found in Core Analytics event payload, added value may be overridden.");
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v16);
  }

  v27 = +[NSMutableDictionary dictionaryWithDictionary:v32];
  [v27 addEntriesFromDictionary:v29];

  return v27;
}

- (void)sendEventLazily:(BOOL)a3 eventPayload:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(CRLAnalyticsLogger *)self canLogAnalytics])
  {
    [(CRLAnalyticsLogger *)self postNotificationForEventPayload:v6];
    [(CRLAnalyticsLogger *)self p_loadCoreAnalyticsIfNeeded];
    [(CRLAnalyticsLogger *)self setRecalculateDomain:1];
    v7 = [(CRLAnalyticsLogger *)self domain];
    uint64_t v8 = [(CRLAnalyticsLogger *)self p_eventPayloadFromPayload:v6];
    objc_super v9 = (void *)v8;
    if (v4 && off_1016A9AE0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100432D08;
      v10[3] = &unk_1014F9620;
      v10[4] = v8;
      off_1016A9AE0(v7, v10);
    }
    else if (off_1016A9AD8)
    {
      off_1016A9AD8(v7, v8);
    }
  }
}

- (void)postNotificationForEventPayload:(id)a3
{
  id v6 = [a3 mutableCopy];
  BOOL v4 = [(CRLAnalyticsLogger *)self baseDomain];
  [v6 setObject:v4 forKeyedSubscript:@"CRLAnalyticsLoggerEventLoggedNotificationEventDomainKey"];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"CRLAnalyticsLoggerEventLoggedNotification" object:self userInfo:v6];
}

+ (void)sendEventInDomain:(id)a3 lazily:(BOOL)a4 eventPayload:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a1 loggerWithDomain:a3];
  [v9 sendEventLazily:v5 eventPayload:v8];
}

- (NSString)baseDomain
{
  return self->_baseDomain;
}

- (void)setBaseDomain:(id)a3
{
}

- (NSString)cachedFullDomain
{
  return self->_cachedFullDomain;
}

- (void)setCachedFullDomain:(id)a3
{
}

- (BOOL)recalculateDomain
{
  return self->_recalculateDomain;
}

- (void)setRecalculateDomain:(BOOL)a3
{
  self->_recalculateDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFullDomain, 0);

  objc_storeStrong((id *)&self->_baseDomain, 0);
}

@end