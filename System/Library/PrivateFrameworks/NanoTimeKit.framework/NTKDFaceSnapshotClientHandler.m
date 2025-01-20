@interface NTKDFaceSnapshotClientHandler
- (NTKDFaceSnapshotClientHandler)initWithConnection:(id)a3 snapshotController:(id)a4;
- (id)invalidationHandler;
- (void)_handleInvalidation;
- (void)_onQueueAsync:(id)a3;
- (void)faceSnapshotChangedForKey:(id)a3;
- (void)performAfterCompletingCurrentlyPendingSnapshots:(id)a3;
- (void)requestSnapshotOfFaceInstanceDescriptor:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)snapshotFaceInstanceDescriptor:(id)a3 options:(id)a4 completion:(id)a5;
- (void)snapshotLibrarySelectedFaceForDeviceUUID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)updateAllSnapshots;
@end

@implementation NTKDFaceSnapshotClientHandler

- (NTKDFaceSnapshotClientHandler)initWithConnection:(id)a3 snapshotController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKDFaceSnapshotClientHandler;
  v9 = [(NTKDFaceSnapshotClientHandler *)&v22 init];
  if (v9)
  {
    id v10 = +[NSString stringWithFormat:@"com.apple.ntkd.facesnapshotclient.%p", v9];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_connection, a3);
    connection = v9->_connection;
    v14 = NTKFaceSnapshotClientInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v14];

    v15 = v9->_connection;
    v16 = NTKFaceSnapshotServerInterface();
    [(NSXPCConnection *)v15 setExportedInterface:v16];

    [(NSXPCConnection *)v9->_connection setExportedObject:v9];
    objc_storeStrong((id *)&v9->_snapshotController, a4);
    [v8 addObserver:v9];
    objc_initWeak(&location, v9);
    v17 = v9->_connection;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000057FC;
    v19[3] = &unk_100060A68;
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v17 setInvalidationHandler:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v9;
}

- (void)_handleInvalidation
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated: %@ %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005950;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateAllSnapshots
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412546;
    id v8 = v5;
    __int16 v9 = 2080;
    id v10 = "-[NTKDFaceSnapshotClientHandler updateAllSnapshots]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Inside: %@ %s", buf, 0x16u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005B28;
  v6[3] = &unk_100060A90;
  v6[4] = self;
  [(NTKDFaceSnapshotClientHandler *)self _onQueueAsync:v6];
}

- (void)requestSnapshotOfFaceInstanceDescriptor:(id)a3
{
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    __int16 v14 = 2080;
    v15 = "-[NTKDFaceSnapshotClientHandler requestSnapshotOfFaceInstanceDescriptor:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Inside: %@ %s", buf, 0x16u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005C88;
  v9[3] = &unk_100060AB8;
  id v10 = v4;
  dispatch_queue_t v11 = self;
  id v8 = v4;
  [(NTKDFaceSnapshotClientHandler *)self _onQueueAsync:v9];
}

- (void)performAfterCompletingCurrentlyPendingSnapshots:(id)a3
{
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    __int16 v13 = 2080;
    __int16 v14 = "-[NTKDFaceSnapshotClientHandler performAfterCompletingCurrentlyPendingSnapshots:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Inside: %@ %s", buf, 0x16u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005E4C;
  v9[3] = &unk_100060AE0;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NTKDFaceSnapshotClientHandler *)self _onQueueAsync:v9];
}

- (void)snapshotFaceInstanceDescriptor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412546;
    v23 = v13;
    __int16 v24 = 2080;
    v25 = "-[NTKDFaceSnapshotClientHandler snapshotFaceInstanceDescriptor:options:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Inside: %@ %s", buf, 0x16u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100005FF8;
  v17[3] = &unk_100060B08;
  id v18 = v8;
  v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(NTKDFaceSnapshotClientHandler *)self _onQueueAsync:v17];
}

- (void)snapshotLibrarySelectedFaceForDeviceUUID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412546;
    objc_super v22 = v13;
    __int16 v23 = 2080;
    __int16 v24 = "-[NTKDFaceSnapshotClientHandler snapshotLibrarySelectedFaceForDeviceUUID:options:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Inside: %@ %s", buf, 0x16u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000620C;
  v17[3] = &unk_100060B08;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(NTKDFaceSnapshotClientHandler *)self _onQueueAsync:v17];
}

- (void)faceSnapshotChangedForKey:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000062B4;
  v4[3] = &unk_100060AB8;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDFaceSnapshotClientHandler *)v5 _onQueueAsync:v4];
}

- (void)_onQueueAsync:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.facesnapshotclient.busy");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006468;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_snapshotController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end