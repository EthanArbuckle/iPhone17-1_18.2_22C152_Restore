@interface SDXPCDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSSet)activeConnections;
- (NSString)machServiceName;
- (NSXPCConnection)currentConnection;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (OS_dispatch_queue)dispatchQueue;
- (SDXPCDaemon)init;
- (void)_activate;
- (void)_invalidate;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)dealloc;
- (void)enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)establishConnectionWithCompletionHandler:(id)a3;
- (void)onqueue_activate;
- (void)onqueue_connectionInvalidated:(id)a3;
- (void)onqueue_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)onqueue_invalidate;
- (void)onqueue_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)setActiveConnections:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SDXPCDaemon

- (SDXPCDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDXPCDaemon;
  v2 = [(SDXPCDaemon *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  if ([(NSSet *)self->_activeConnections count])
  {
    v4 = (SDXPCDaemon *)FatalErrorF();
    [(SDXPCDaemon *)v4 setDispatchQueue:v6];
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;
    }
    v7.receiver = self;
    v7.super_class = (Class)SDXPCDaemon;
    [(SDXPCDaemon *)&v7 dealloc];
  }
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100243934;
  v7[3] = &unk_1008CAD20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)onqueue_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activateCalled) {
    FatalErrorF();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  SEL v5 = [(SDXPCDaemon *)self activeConnections];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v5);
      }
      v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      id location = 0;
      objc_initWeak(&location, v9);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100243B58;
      v13[3] = &unk_1008CE8C0;
      objc_copyWeak(&v14, &location);
      v10 = [v9 remoteObjectProxyWithErrorHandler:v13];
      char v12 = 0;
      v4[2](v4, v10, &v12);
      BOOL v11 = v12 == 0;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      if (!v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (void)remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100243C80;
  block[3] = &unk_1008CAD48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id location = 0;
  objc_initWeak(&location, v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100243DA4;
  v9[3] = &unk_1008CE8C0;
  objc_copyWeak(&v10, &location);
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  v7[2](v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)currentConnection
{
  return (NSXPCConnection *)dispatch_queue_get_specific((dispatch_queue_t)self->_dispatchQueue, "SDXPCDaemonConnection");
}

- (void)_activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100243E8C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL activateCalled = self->_activateCalled;
  id v4 = daemon_log();
  SEL v5 = v4;
  if (activateCalled)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100244CC4(v5);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SDXPCDaemon *)self machServiceName];
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating %@", (uint8_t *)&v11, 0xCu);
    }
    self->_BOOL activateCalled = 1;
    id v7 = objc_alloc((Class)NSXPCListener);
    uint64_t v8 = [(SDXPCDaemon *)self machServiceName];
    id v9 = (NSXPCListener *)[v7 initWithMachServiceName:v8];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v9;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
}

- (void)_invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024405C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)onqueue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    [(NSXPCListener *)self->_xpcListener invalidate];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [(SDXPCDaemon *)self activeConnections];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) invalidate];
        }
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    self->_invalidateDone = 1;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v8 = [(SDXPCDaemon *)self shouldAcceptNewConnection:v7];
  long long v9 = daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 sd_description];
    long long v11 = (void *)v10;
    id v12 = "no";
    if (v8) {
      id v12 = "yes";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    __int16 v23 = 2080;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection from %@ accepted %s", buf, 0x16u);
  }
  if (v8)
  {
    [v7 _setQueue:self->_dispatchQueue];
    [v7 setDelegate:self];
    [v7 setExportedObject:self];
    id v13 = [(SDXPCDaemon *)self exportedInterface];
    [v7 setExportedInterface:v13];

    id v14 = [(SDXPCDaemon *)self remoteObjectInterface];
    [v7 setRemoteObjectInterface:v14];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id location = 0;
    objc_initWeak(&location, v7);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100244458;
    v18[3] = &unk_1008CED20;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(&v20, (id *)buf);
    [v7 setInvalidationHandler:v18];
    [v7 resume];
    v15 = [(SDXPCDaemon *)self activeConnections];
    long long v16 = +[NSMutableSet setWithSet:v15];

    [v16 addObject:v7];
    [(SDXPCDaemon *)self setActiveConnections:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)onqueue_connectionInvalidated:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sd_description];
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection %@ invalidated", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(SDXPCDaemon *)self activeConnections];
  id v8 = [v7 mutableCopy];

  [v8 removeObject:v4];
  [(SDXPCDaemon *)self setActiveConnections:v8];
  [(SDXPCDaemon *)self connectionInvalidated:v4];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  [v8 retainArguments];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002446A0;
  block[3] = &unk_1008CAF18;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)establishConnectionWithCompletionHandler:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = (void (**)(void))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v5[2](v5);

  id v6 = [(SDXPCDaemon *)self currentConnection];
  id v7 = daemon_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 sd_description];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "New connection established to %@", (uint8_t *)&v9, 0xCu);
  }
  [(SDXPCDaemon *)self connectionEstablished:v6];
}

- (NSString)machServiceName
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"Subclass %@ must override %@", v4, v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSXPCInterface)exportedInterface
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"Subclass %@ must override %@", v4, v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSXPCInterface)remoteObjectInterface
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"Subclass %@ must override %@", v4, v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"Subclass %@ must override %@", v6, v7];
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (void)connectionEstablished:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"Subclass %@ must override %@", v6, v7];
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"Subclass %@ must override %@", v6, v7];
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (NSSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end