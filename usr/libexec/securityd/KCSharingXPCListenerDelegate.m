@interface KCSharingXPCListenerDelegate
+ (KCSharingXPCListenerDelegate)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (KCSharingDaemonGroupManager)groupManager;
- (KCSharingEntitlementBearerProtocol)entitlementBearer;
- (KCSharingSyncController)syncController;
- (KCSharingXPCListenerDelegate)init;
- (KCSharingXPCListenerDelegate)initWithListener:(id)a3 queue:(id)a4 daemonGroupManager:(id)a5 syncController:(id)a6 entitlementBearer:(id)a7;
- (NSMutableArray)clientConnections;
- (NSXPCListener)listener;
- (OS_dispatch_queue)connectionQueue;
- (id)allowedProtocolForEntitlementBearer:(id)a3;
- (void)accountChanged;
- (void)connectionWasInterrupted:(id)a3;
- (void)connectionWasInvalidated:(id)a3;
- (void)groupsUpdated;
- (void)setClientConnections:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setEntitlementBearer:(id)a3;
- (void)setGroupManager:(id)a3;
- (void)setListener:(id)a3;
- (void)setSyncController:(id)a3;
@end

@implementation KCSharingXPCListenerDelegate

- (id)allowedProtocolForEntitlementBearer:(id)a3
{
  id v3 = a3;
  if (sub_100004268(v3, @"com.apple.private.keychain.kcsharing.client"))
  {
    v4 = &protocolRef_KCSharingXPCServerProtocol;
LABEL_5:
    v5 = *v4;
    goto LABEL_7;
  }
  if (sub_100004268(v3, @"com.apple.private.keychain.kcsharing.invitation.notifier"))
  {
    v4 = &protocolRef_KCSharingInvitationNotificationProtocol;
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = [(KCSharingXPCListenerDelegate *)self entitlementBearer];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v6;
  }
  id v10 = v9;

  v11 = [(KCSharingXPCListenerDelegate *)self allowedProtocolForEntitlementBearer:v10];
  v12 = KCSharingLogObject();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Rejected connection %{public}@ lacks entitlement", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSStringFromProtocol(v11);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v6;
    __int16 v31 = 2114;
    v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Accepted connection %{public}@, allowed protocol %{public}@", buf, 0x16u);
  }
  v15 = [KCSharingXPCServer alloc];
  v16 = [(KCSharingXPCListenerDelegate *)self groupManager];
  v17 = [(KCSharingXPCListenerDelegate *)self syncController];
  v13 = [(KCSharingXPCServer *)v15 initWithConnection:v6 allowedProtocol:v11 groupManager:v16 syncController:v17];

  if (!v13)
  {
    v20 = KCSharingLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to init KCSharingXPCServer for connection %{public}@", buf, 0xCu);
    }

    v13 = 0;
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v13);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001C5474;
  v26[3] = &unk_100306DB0;
  objc_copyWeak(&v27, (id *)buf);
  objc_copyWeak(&v28, &location);
  [v6 setInterruptionHandler:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001C54D8;
  v23[3] = &unk_100306DB0;
  objc_copyWeak(&v24, (id *)buf);
  objc_copyWeak(&v25, &location);
  [v6 setInvalidationHandler:v23];
  v18 = [(KCSharingXPCListenerDelegate *)self connectionQueue];
  [v6 _setQueue:v18];

  [v6 resume];
  [(NSMutableArray *)self->_clientConnections addObject:v13];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
  BOOL v19 = 1;
LABEL_15:

  return v19;
}

- (KCSharingSyncController)syncController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncController);

  return (KCSharingSyncController *)WeakRetained;
}

- (KCSharingDaemonGroupManager)groupManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupManager);

  return (KCSharingDaemonGroupManager *)WeakRetained;
}

- (KCSharingEntitlementBearerProtocol)entitlementBearer
{
  return self->_entitlementBearer;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementBearer, 0);
  objc_destroyWeak((id *)&self->_syncController);
  objc_destroyWeak((id *)&self->_groupManager);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setEntitlementBearer:(id)a3
{
}

- (void)setSyncController:(id)a3
{
}

- (void)setGroupManager:(id)a3
{
}

- (void)setConnectionQueue:(id)a3
{
}

- (void)setClientConnections:(id)a3
{
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)accountChanged
{
  id v3 = [(KCSharingXPCListenerDelegate *)self connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4ED4;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)groupsUpdated
{
  id v3 = [(KCSharingXPCListenerDelegate *)self connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C50E8;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)connectionWasInvalidated:(id)a3
{
  id v4 = a3;
  v5 = KCSharingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "connection invalidated %@", buf, 0xCu);
  }

  clientConnections = self->_clientConnections;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C53B4;
  v9[3] = &unk_100306DD8;
  id v7 = v4;
  id v10 = v7;
  id v8 = [(NSMutableArray *)clientConnections indexOfObjectPassingTest:v9];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_clientConnections removeObjectAtIndex:v8];
  }
}

- (void)connectionWasInterrupted:(id)a3
{
  id v3 = a3;
  id v4 = KCSharingLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "connection interrupted %@", (uint8_t *)&v5, 0xCu);
  }
}

- (KCSharingXPCListenerDelegate)initWithListener:(id)a3 queue:(id)a4 daemonGroupManager:(id)a5 syncController:(id)a6 entitlementBearer:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = KCSharingLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "initing KCSharingXPCListenerDelegate", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)KCSharingXPCListenerDelegate;
  BOOL v19 = [(KCSharingXPCListenerDelegate *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_listener, a3);
    objc_storeStrong((id *)&v20->_connectionQueue, a4);
    uint64_t v21 = +[NSMutableArray array];
    clientConnections = v20->_clientConnections;
    v20->_clientConnections = (NSMutableArray *)v21;

    objc_storeWeak((id *)&v20->_groupManager, v15);
    objc_storeWeak((id *)&v20->_syncController, v16);
    objc_storeStrong((id *)&v20->_entitlementBearer, a7);
    [(NSXPCListener *)v20->_listener setDelegate:v20];
    [(NSXPCListener *)v20->_listener _setQueue:v20->_connectionQueue];
    [(NSXPCListener *)v20->_listener resume];
  }

  return v20;
}

- (KCSharingXPCListenerDelegate)init
{
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.security.kcsharing"];
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, -1);

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.KCSharingXPCListenerDelegate.clientConnections", v5);
  id v7 = +[KCSharingDaemonGroupManager sharedInstance];
  id v8 = +[KCSharingSyncController sharedInstance];
  v9 = [(KCSharingXPCListenerDelegate *)self initWithListener:v3 queue:v6 daemonGroupManager:v7 syncController:v8 entitlementBearer:0];

  return v9;
}

+ (KCSharingXPCListenerDelegate)sharedInstance
{
  if (qword_10035D280 != -1) {
    dispatch_once(&qword_10035D280, &stru_100306D88);
  }
  v2 = (void *)qword_10035D288;

  return (KCSharingXPCListenerDelegate *)v2;
}

@end