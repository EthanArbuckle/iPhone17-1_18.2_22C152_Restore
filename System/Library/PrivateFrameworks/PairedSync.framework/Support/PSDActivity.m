@interface PSDActivity
- (BOOL)_shouldPrelaunchWithBackboard;
- (NSMutableSet)requestedServiceNames;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (PSDActivity)initWithActivityInfo:(id)a3 queue:(id)a4;
- (PSDActivityDelegate)delegate;
- (PSDServiceProgressDelegate)progressDelegate;
- (PSYActivityInfo)activityInfo;
- (id)_prelaunchBundleIdentifier;
- (id)_remoteServiceWithErrorHandler:(id)a3;
- (id)description;
- (void)_abortSyncJustDoItWithCompletion:(id)a3 interruptionHandler:(id)a4;
- (void)_beginSyncJustDoItWithOptions:(id)a3 completion:(id)a4 interruptionHandler:(id)a5;
- (void)_handleInterruptionWithError:(id)a3 interruptionHandler:(id)a4;
- (void)_preloadAppWithBundleID:(id)a3 inBackboardWithCompletion:(id)a4;
- (void)_startConnectionIfNeeded;
- (void)abortSyncWithCompletion:(id)a3 interruptionHandler:(id)a4;
- (void)beginSyncWithOptions:(id)a3 completion:(id)a4 interruptionHandler:(id)a5;
- (void)progressDelegateDidCompleteSending;
- (void)progressDelegateDidUpdateProgress:(float)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProgressDelegate:(id)a3;
- (void)setRequestedServiceNames:(id)a3;
@end

@implementation PSDActivity

- (PSDActivity)initWithActivityInfo:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PSDActivity;
  v9 = [(PSDActivity *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityInfo, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    uint64_t v11 = +[NSMutableSet set];
    requestedServiceNames = v10->_requestedServiceNames;
    v10->_requestedServiceNames = (NSMutableSet *)v11;

    v13 = objc_alloc_init(PSDServiceProgressDelegate);
    progressDelegate = v10->_progressDelegate;
    v10->_progressDelegate = v13;

    [(PSDServiceProgressDelegate *)v10->_progressDelegate setService:v10];
  }

  return v10;
}

- (void)_startConnectionIfNeeded
{
  if (!self->_connection)
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc((Class)NSXPCConnection);
    v4 = [(PSYActivityInfo *)self->_activityInfo machServiceName];
    v5 = (NSXPCConnection *)[v3 initWithMachServiceName:v4 options:4096];
    connection = self->_connection;
    self->_connection = v5;

    id v7 = self->_connection;
    id v8 = PSYActivityXPCInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    v9 = self->_connection;
    v10 = PSYActivityProgressXPCInterface();
    [(NSXPCConnection *)v9 setExportedInterface:v10];

    [(NSXPCConnection *)self->_connection setExportedObject:self->_progressDelegate];
    uint64_t v11 = self->_connection;
    objc_super v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_10001AAA0;
    v19 = &unk_10002CED8;
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v11 setInvalidationHandler:&v16];
    v12 = psd_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = psd_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_connection;
        *(_DWORD *)buf = 138543362;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PSDActivity - Creating new connection: %{public}@", buf, 0xCu);
      }
    }
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)beginSyncWithOptions:(id)a3 completion:(id)a4 interruptionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PSDActivity *)self queue];
  dispatch_assert_queue_V2(v11);

  if ([(PSDActivity *)self _shouldPrelaunchWithBackboard])
  {
    v12 = [(PSDActivity *)self _prelaunchBundleIdentifier];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001AD74;
    v13[3] = &unk_10002CF28;
    v13[4] = self;
    id v15 = v10;
    id v14 = v8;
    id v16 = v9;
    [(PSDActivity *)self _preloadAppWithBundleID:v12 inBackboardWithCompletion:v13];
  }
  else
  {
    [(PSDActivity *)self _beginSyncJustDoItWithOptions:v8 completion:v9 interruptionHandler:v10];
  }
}

- (void)abortSyncWithCompletion:(id)a3 interruptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSDActivity *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([(PSDActivity *)self _shouldPrelaunchWithBackboard])
  {
    id v9 = [(PSDActivity *)self _prelaunchBundleIdentifier];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001AF98;
    v10[3] = &unk_10002CF78;
    v10[4] = self;
    id v11 = v7;
    id v12 = v6;
    [(PSDActivity *)self _preloadAppWithBundleID:v9 inBackboardWithCompletion:v10];
  }
  else
  {
    [(PSDActivity *)self _abortSyncJustDoItWithCompletion:v6 interruptionHandler:v7];
  }
}

- (void)_handleInterruptionWithError:(id)a3 interruptionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, id))a4 + 2))(a4, a3);
  }
}

- (void)_beginSyncJustDoItWithOptions:(id)a3 completion:(id)a4 interruptionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [(PSDActivity *)self _startConnectionIfNeeded];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001B1F0;
  v16[3] = &unk_10002CFA0;
  v16[4] = self;
  id v17 = v9;
  id v11 = v9;
  id v12 = [(PSDActivity *)self _remoteServiceWithErrorHandler:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001B2C8;
  v14[3] = &unk_10002CFF0;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v12 beginSyncWithOptions:v10 completion:v14];
}

- (void)_abortSyncJustDoItWithCompletion:(id)a3 interruptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PSDActivity *)self _startConnectionIfNeeded];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001B5B8;
  v13[3] = &unk_10002CFA0;
  v13[4] = self;
  id v14 = v7;
  id v8 = v7;
  id v9 = [(PSDActivity *)self _remoteServiceWithErrorHandler:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001B690;
  v11[3] = &unk_10002CFF0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 abortSyncWithCompletion:v11];
}

- (id)_remoteServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PSDActivity *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)progressDelegateDidCompleteSending
{
  id v3 = [(PSDActivity *)self delegate];
  [v3 activityDidCompleteSending:self];
}

- (void)progressDelegateDidUpdateProgress:(float)a3
{
  id v6 = [(PSDActivity *)self delegate];
  *(float *)&double v5 = a3;
  [v6 activity:self didUpdateProgress:v5];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  double v5 = [(PSDActivity *)self activityInfo];
  id v6 = [v5 label];
  id v7 = +[NSString stringWithFormat:@"<%@ %p label=%@>", v4, self, v6];;

  return v7;
}

- (BOOL)_shouldPrelaunchWithBackboard
{
  v2 = [(PSDActivity *)self activityInfo];
  id v3 = [v2 backboardPrelaunchBundleIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_preloadAppWithBundleID:(id)a3 inBackboardWithCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = psd_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = psd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PSDActivity Preloading application with backboard - %{public}@", buf, 0xCu);
    }
  }
  id v10 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v13 = FBSOpenApplicationOptionKeyActivateSuspended;
  id v14 = &__kCFBooleanTrue;
  id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v12 = +[FBSOpenApplicationOptions optionsWithDictionary:v11];

  [v10 openApplication:v5 withOptions:v12 completion:v6];
}

- (id)_prelaunchBundleIdentifier
{
  v2 = [(PSDActivity *)self activityInfo];
  id v3 = [v2 backboardPrelaunchBundleIdentifier];

  return v3;
}

- (PSDActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSDActivityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PSYActivityInfo)activityInfo
{
  return self->_activityInfo;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (PSDServiceProgressDelegate)progressDelegate
{
  return self->_progressDelegate;
}

- (void)setProgressDelegate:(id)a3
{
}

- (NSMutableSet)requestedServiceNames
{
  return self->_requestedServiceNames;
}

- (void)setRequestedServiceNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedServiceNames, 0);
  objc_storeStrong((id *)&self->_progressDelegate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end