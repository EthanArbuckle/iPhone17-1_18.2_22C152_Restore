@interface NDTodayServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FCAsyncSerialQueue)fetchQueue;
- (FCContentContext)contentContext;
- (NDTodayServiceListenerDelegate)init;
- (NDTodayServiceListenerDelegate)initWithContentContext:(id)a3 fetchQueue:(id)a4;
@end

@implementation NDTodayServiceListenerDelegate

- (NDTodayServiceListenerDelegate)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDTodayServiceListenerDelegate init]";
    __int16 v7 = 2080;
    v8 = "NDTodayServiceListenerDelegate.m";
    __int16 v9 = 1024;
    int v10 = 32;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDTodayServiceListenerDelegate init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDTodayServiceListenerDelegate)initWithContentContext:(id)a3 fetchQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100048CC0();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100048BE0();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)NDTodayServiceListenerDelegate;
  __int16 v9 = [(NDTodayServiceListenerDelegate *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentContext, a3);
    objc_storeStrong((id *)&v10->_fetchQueue, a4);
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NDNewsServiceClient];
  [v5 setRemoteObjectInterface:v6];

  id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NDNewsService];
  id v8 = +[NSSet setWithObject:objc_opt_class()];
  [v7 setClasses:v8 forSelector:"fetchLatestResultsWithParameters:completion:" argumentIndex:0 ofReply:0];

  __int16 v9 = +[NSSet setWithObject:objc_opt_class()];
  [v7 setClasses:v9 forSelector:"fetchPlaceholderResultsWithOperationInfo:syncCompletion:" argumentIndex:0 ofReply:0];

  uint64_t v10 = objc_opt_class();
  __int16 v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
  [v7 setClasses:v11 forSelector:"markAnalyticsElements:asSeenAtDate:withCompletion:" argumentIndex:0 ofReply:0];

  objc_super v12 = +[NSSet setWithObject:objc_opt_class()];
  [v7 setClasses:v12 forSelector:"markAnalyticsElement:asReadAtDate:withCompletion:" argumentIndex:0 ofReply:0];

  [v5 setExportedInterface:v7];
  v13 = [v5 remoteObjectProxy];
  v14 = [NDTodayClientConnection alloc];
  v15 = [(NDTodayServiceListenerDelegate *)self contentContext];
  v16 = [(NDTodayServiceListenerDelegate *)self fetchQueue];
  v17 = [(NDTodayClientConnection *)v14 initWithClient:v13 contentContext:v15 fetchQueue:v16];
  [v5 setExportedObject:v17];

  [v5 resume];
  return 1;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (FCAsyncSerialQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end