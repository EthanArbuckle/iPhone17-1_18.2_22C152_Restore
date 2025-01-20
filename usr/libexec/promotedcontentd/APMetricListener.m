@interface APMetricListener
- (APMetricListener)init;
- (id)actionReceiverForConnection:(id)a3;
- (id)machServiceName;
@end

@implementation APMetricListener

- (APMetricListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)APMetricListener;
  v2 = [(APMetricListener *)&v7 init];
  if (v2)
  {
    v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v9 = v4;
      id v5 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for MetricRouter", buf, 0xCu);
    }
    +[APXPCListenerManager addDelegate:v2];
  }
  return v2;
}

- (id)actionReceiverForConnection:(id)a3
{
  id v3 = a3;
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    objc_super v7 = [v3 bundleID];
    int v10 = 138478083;
    v11 = v5;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{private}@] Opening new connection from %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v8 = [[APMetricReceiver alloc] initWithConnection:v3];

  return v8;
}

- (id)machServiceName
{
  return @"com.apple.ap.promotedcontent.metrics";
}

@end