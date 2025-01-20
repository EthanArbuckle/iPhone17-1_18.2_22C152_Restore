@interface NDAnalyticsServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NDAnalyticsService)service;
- (NDAnalyticsServiceListenerDelegate)init;
- (NDAnalyticsServiceListenerDelegate)initWithService:(id)a3;
- (void)setService:(id)a3;
@end

@implementation NDAnalyticsServiceListenerDelegate

- (NDAnalyticsServiceListenerDelegate)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDAnalyticsServiceListenerDelegate init]";
    __int16 v7 = 2080;
    v8 = "NDAnalyticsServiceListenerDelegate.m";
    __int16 v9 = 1024;
    int v10 = 24;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDAnalyticsServiceListenerDelegate init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDAnalyticsServiceListenerDelegate)initWithService:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100047EA4();
  }
  v9.receiver = self;
  v9.super_class = (Class)NDAnalyticsServiceListenerDelegate;
  v6 = [(NDAnalyticsServiceListenerDelegate *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_service, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NDAnalyticsService];
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  [v6 setClasses:v8 forSelector:"submitEnvelopes:withCompletion:" argumentIndex:0 ofReply:0];

  [v5 setExportedInterface:v6];
  objc_super v9 = [(NDAnalyticsServiceListenerDelegate *)self service];
  [v5 setExportedObject:v9];

  [v5 resume];
  return 1;
}

- (NDAnalyticsService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end