@interface NDDownloadServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FCContentContext)contentContext;
- (NDContentDownloadService)downloadService;
- (NDDownloadServiceListenerDelegate)init;
- (NDDownloadServiceListenerDelegate)initWithContentContext:(id)a3 ANFHelper:(id)a4;
@end

@implementation NDDownloadServiceListenerDelegate

- (NDDownloadServiceListenerDelegate)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[NDDownloadServiceListenerDelegate init]";
    __int16 v7 = 2080;
    v8 = "NDDownloadServiceListenerDelegate.m";
    __int16 v9 = 1024;
    int v10 = 33;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[NDDownloadServiceListenerDelegate init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (NDDownloadServiceListenerDelegate)initWithContentContext:(id)a3 ANFHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NDDownloadServiceListenerDelegate;
  __int16 v9 = [(NDDownloadServiceListenerDelegate *)&v16 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentContext, a3);
    __int16 v11 = [NDContentDownloadService alloc];
    id v12 = [(NDDownloadServiceListenerDelegate *)v10 contentContext];
    v13 = [(NDContentDownloadService *)v11 initWithContentContext:v12 ANFHelper:v8];
    downloadService = v10->_downloadService;
    v10->_downloadService = v13;
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
    v23 = v6;
    __int16 v24 = 2114;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "will accept new XPC connection, connection=%{public}@, serviceName=%{public}@", buf, 0x16u);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100010B24;
  v20[3] = &unk_100061828;
  id v10 = v6;
  id v21 = v10;
  [v5 setInvalidationHandler:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010BCC;
  v18[3] = &unk_100061828;
  id v19 = v10;
  id v11 = v10;
  [v5 setInterruptionHandler:v18];
  id v12 = NDDownloadServiceXPCInterface();
  [v5 setExportedInterface:v12];

  v13 = [(NDDownloadServiceListenerDelegate *)self downloadService];
  [v5 setExportedObject:v13];

  v14 = [(NDDownloadServiceListenerDelegate *)self downloadService];
  v15 = [v14 xpcMessageQueue];
  [v5 _setQueue:v15];

  objc_super v16 = [(NDDownloadServiceListenerDelegate *)self downloadService];
  [v16 setCurrentConnection:v5];

  [v5 resume];
  return 1;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NDContentDownloadService)downloadService
{
  return self->_downloadService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadService, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end