@interface NDTodayFeedServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FCContentContext)contentContext;
- (NDTodayFeedManager)todayFeedManager;
- (NDTodayFeedServiceListenerDelegate)init;
- (NDTodayFeedServiceListenerDelegate)initWithContentContext:(id)a3 ANFHelper:(id)a4;
@end

@implementation NDTodayFeedServiceListenerDelegate

- (NDTodayFeedServiceListenerDelegate)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDTodayFeedServiceListenerDelegate init]";
    __int16 v7 = 2080;
    v8 = "NDTodayFeedServiceListenerDelegate.m";
    __int16 v9 = 1024;
    int v10 = 29;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDTodayFeedServiceListenerDelegate init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDTodayFeedServiceListenerDelegate)initWithContentContext:(id)a3 ANFHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NDTodayFeedServiceListenerDelegate;
  __int16 v9 = [(NDTodayFeedServiceListenerDelegate *)&v14 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentContext, a3);
    __int16 v11 = [[NDTodayFeedManager alloc] initWithContext:v7 ANFHelper:v8];
    todayFeedManager = v10->_todayFeedManager;
    v10->_todayFeedManager = v11;
  }
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSString stringWithFormat:@"%p", v5];
  id v7 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    __int16 v9 = [v5 serviceName];
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    __int16 v21 = 2114;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TodayFeedService will accept new XPC connection, connection=%{public}@, serviceName=%{public}@", buf, 0x16u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E724;
  v17[3] = &unk_100061828;
  id v10 = v6;
  id v18 = v10;
  [v5 setInvalidationHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E7CC;
  v15[3] = &unk_100061828;
  id v16 = v10;
  id v11 = v10;
  [v5 setInterruptionHandler:v15];
  id v12 = NDTodayFeedServiceXPCInterface();
  [v5 setExportedInterface:v12];

  v13 = [(NDTodayFeedServiceListenerDelegate *)self todayFeedManager];
  [v5 setExportedObject:v13];

  [v5 resume];
  return 1;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NDTodayFeedManager)todayFeedManager
{
  return self->_todayFeedManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayFeedManager, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end