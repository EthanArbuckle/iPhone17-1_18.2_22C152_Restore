@interface BKAlternateSystemAppServer
+ (id)sharedInstance;
- (BKAlternateSystemAppManager)alternateSystemAppManager;
- (BKAlternateSystemAppServer)init;
- (BOOL)_queue_listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)clientConnection;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (void)_handleInterruptedOrInvalidatedConnection;
- (void)blockSystemAppForAlternateSystemApp;
- (void)dealloc;
- (void)openAlternateSystemAppWithBundleID:(id)a3;
- (void)run;
- (void)setAlternateSystemAppManager:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)terminateAlternateSystemAppWithBundleID:(id)a3;
- (void)unblockSystemAppForAlternateSystemApp;
@end

@implementation BKAlternateSystemAppServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateSystemAppManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)setAlternateSystemAppManager:(id)a3
{
}

- (BKAlternateSystemAppManager)alternateSystemAppManager
{
  return self->_alternateSystemAppManager;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setClientConnection:(id)a3
{
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setXpcListener:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)terminateAlternateSystemAppWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Server] Received request to terminate alternate system app \"%{public}@\"", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100090650;
  v8[3] = &unk_1000F8E50;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)openAlternateSystemAppWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Server] Received request to open alternate system app \"%{public}@\"", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000908E0;
  v8[3] = &unk_1000F8E50;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)unblockSystemAppForAlternateSystemApp
{
  v3 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Server] Received request to unblock primary system app for alternate system app", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090E40;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)blockSystemAppForAlternateSystemApp
{
  v3 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Server] Received request to block primary system app for alternate system app", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091010;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Server] Got a connection request on listener %{public}@: connection %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v19 = 0;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100091288;
  v14[3] = &unk_1000F88B0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v17 = buf;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, v14);
  char v12 = *(unsigned char *)(*(void *)&buf[8] + 24);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (BOOL)_queue_listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v22, 0, sizeof(v22));
  }
  id v9 = +[BSAuditToken tokenFromAuditToken:v22];
  uint64_t v10 = BKReplaceSystemAppEntitlement;
  if (([v9 hasEntitlement:BKReplaceSystemAppEntitlement] & 1) == 0)
  {
    id v11 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Server] Entitlement %{public}@ required to open alternate system app.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (self->_clientConnection)
  {
    id v11 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Server] Rejecting BKAlternateSystemAppServer connection because we already have one", buf, 2u);
    }
LABEL_11:

    BOOL v12 = 0;
    goto LABEL_12;
  }
  v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BKSAlternateSystemAppClientProtocol];
  [v8 setRemoteObjectInterface:v14];

  id v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BKSAlternateSystemAppServerProtocol];
  [v8 setExportedInterface:v15];

  [v8 setExportedObject:self];
  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100091614;
  v20[3] = &unk_1000F8888;
  objc_copyWeak(&v21, (id *)buf);
  [v8 setInterruptionHandler:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100091654;
  v18[3] = &unk_1000F8888;
  objc_copyWeak(&v19, (id *)buf);
  [v8 setInvalidationHandler:v18];
  [v8 resume];
  [(BKAlternateSystemAppServer *)self setClientConnection:v8];
  id v16 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[Server] Accepted connection request", v17, 2u);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (void)_handleInterruptedOrInvalidatedConnection
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091708;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)run
{
}

- (void)dealloc
{
  [(NSXPCListener *)self->_xpcListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKAlternateSystemAppServer;
  [(BKAlternateSystemAppServer *)&v3 dealloc];
}

- (BKAlternateSystemAppServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKAlternateSystemAppServer;
  v2 = [(BKAlternateSystemAppServer *)&v10 init];
  if (v2)
  {
    objc_super v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.backboard.altsysapp"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v3;

    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    clientConnection = v2->_clientConnection;
    v2->_clientConnection = 0;

    id v6 = +[BKAlternateSystemAppManager sharedInstance];
    [(BKAlternateSystemAppServer *)v2 setAlternateSystemAppManager:v6];

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100123138 != -1) {
    dispatch_once(&qword_100123138, &stru_1000F8860);
  }
  v2 = (void *)qword_100123130;

  return v2;
}

@end