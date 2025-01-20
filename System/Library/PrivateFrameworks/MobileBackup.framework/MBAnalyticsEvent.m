@interface MBAnalyticsEvent
+ (BOOL)submitEventName:(id)a3 metrics:(id)a4;
- (BOOL)submit;
- (MBAnalyticsEvent)initWithEventName:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (void)setError:(id)a3;
- (void)setKey:(id)a3 value:(id)a4;
- (void)setMetric:(id)a3 value:(unint64_t)a4;
@end

@implementation MBAnalyticsEvent

- (MBAnalyticsEvent)initWithEventName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBAnalyticsEvent;
  v5 = [(MBAnalyticsEvent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v6;

    uint64_t v8 = [v4 lowercaseString];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v8;
  }
  return v5;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Analytics - Setting error: %@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v6 = self;
  objc_sync_enter(v6);
  metrics = v6->_metrics;
  uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
  [(NSMutableDictionary *)metrics setValue:v8 forKey:@"errorCode"];

  v9 = v6->_metrics;
  v10 = [v4 domain];
  [(NSMutableDictionary *)v9 setValue:v10 forKey:@"errorDomain"];

  objc_super v11 = [v4 underlyingErrors];
  v12 = [v11 firstObject];

  if (v12)
  {
    v13 = v6->_metrics;
    v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 code]);
    [(NSMutableDictionary *)v13 setValue:v14 forKey:@"underlyingErrorCode"];

    v15 = v6->_metrics;
    v16 = [v12 domain];
    [(NSMutableDictionary *)v15 setValue:v16 forKey:@"underlyingErrorDomain"];
  }
  objc_sync_exit(v6);
}

- (void)setKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Analytics - Setting %@ to %@", buf, 0x16u);
    _MBLog();
  }

  v9 = self;
  objc_sync_enter(v9);
  [(NSMutableDictionary *)v9->_metrics setValue:v7 forKey:v6];
  objc_sync_exit(v9);
}

- (void)setMetric:(id)a3 value:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(MBAnalyticsEvent *)self setKey:v6 value:v7];
}

+ (BOOL)submitEventName:(id)a3 metrics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5 || (id v7 = v6) == 0) {
    __assert_rtn("+[MBAnalyticsEvent submitEventName:metrics:]", "MBAnalyticsEvent.m", 50, "eventName && metrics");
  }
  if ([v6 count])
  {
    uint64_t v8 = [v7 objectForKeyedSubscript:@"successes"];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [v7 objectForKeyedSubscript:@"failed"];

      if (v10)
      {
        id v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "CA metrics have both success and failure recordings", buf, 2u);
          _MBLog();
        }
        LOBYTE(v12) = 0;
        goto LABEL_19;
      }
    }
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Analytics - Submitting \"%{public}@\": %@", buf, 0x16u);
      _MBLog();
    }

    v17 = v7;
    int v12 = AnalyticsSendEventLazy();
    v14 = MBGetDefaultLog();
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Analytics - Successfully submitted \"%{public}@\"", buf, 0xCu);
LABEL_17:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Analytics - Failed to submit \"%@\"", buf, 0xCu);
      goto LABEL_17;
    }

    id v11 = v17;
LABEL_19:

    goto LABEL_20;
  }
  LOBYTE(v12) = 1;
LABEL_20:

  return v12;
}

- (BOOL)submit
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_metrics copy];
  objc_sync_exit(v2);

  LOBYTE(v2) = +[MBAnalyticsEvent submitEventName:v2->_eventName metrics:v3];
  return (char)v2;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_metrics copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end