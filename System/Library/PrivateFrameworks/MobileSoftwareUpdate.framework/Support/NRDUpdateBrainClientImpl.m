@interface NRDUpdateBrainClientImpl
- (NRDUpdateBrainClientImpl)init;
- (NRDUpdateBrainClientImpl)initWithDelegate:(id)a3;
- (NRDUpdateBrainClientImpl)initWithEndpoint:(id)a3;
- (NSString)brainTimeStamp;
- (NSString)brainUUID;
- (NSString)brainVersion;
- (NSString)dylibUUID;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (void)_connectToServerIfNecessary_nolock;
- (void)_invalidateConnection;
- (void)_invalidateConnection_nolock;
- (void)calculateCurrentRequiredSpace:(id)a3 callback:(id)a4;
- (void)cancelNeRDUpdate:(BOOL)a3 callback:(id)a4;
- (void)connectToServerIfNecessary;
- (void)dealloc;
- (void)downloadNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)finishNeRDUpdate:(id)a3;
- (void)getListenerEndpoint:(id)a3;
- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5;
- (void)installNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)noteConnectionDropped;
- (void)ping:(id)a3;
- (void)ping:(id)a3 reply:(id)a4;
- (void)purgeNeRDUpdate:(id)a3;
- (void)queryNeRDUpdate:(id)a3 build:(id)a4 options:(id)a5 callback:(id)a6;
- (void)run:(unint64_t)a3 callback:(id)a4;
- (void)run:(unint64_t)a3 options:(id)a4 callback:(id)a5;
@end

@implementation NRDUpdateBrainClientImpl

- (NRDUpdateBrainClientImpl)init
{
  v5.receiver = self;
  v5.super_class = (Class)NRDUpdateBrainClientImpl;
  v2 = [(NRDUpdateBrainClientImpl *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_brainProtocol, &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate);
    v3->_brainProtocolVersion = 1;
  }
  return v3;
}

- (NRDUpdateBrainClientImpl)initWithDelegate:(id)a3
{
  id v5 = a3;
  v6 = [(NRDUpdateBrainClientImpl *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (NRDUpdateBrainClientImpl)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v6 = [(NRDUpdateBrainClientImpl *)self init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_serverEndpoint, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  [(NRDUpdateBrainClientImpl *)self _invalidateConnection];
  delegate = self->_delegate;
  self->_delegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)NRDUpdateBrainClientImpl;
  [(NRDUpdateBrainClientImpl *)&v4 dealloc];
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(NRDUpdateBrainClientImpl *)self connectToServerIfNecessary];
  id v5 = [(NSXPCConnection *)self->_serverConnection remoteObjectProxyWithErrorHandler:v4];

  return v5;
}

- (void)_invalidateConnection_nolock
{
  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    [(NSXPCConnection *)serverConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_serverConnection invalidate];
    id v4 = self->_serverConnection;
    self->_serverConnection = 0;

    self->_connected = 0;
  }
}

- (void)_invalidateConnection
{
  obj = self;
  objc_sync_enter(obj);
  [(NRDUpdateBrainClientImpl *)obj _invalidateConnection_nolock];
  objc_sync_exit(obj);
}

- (void)_connectToServerIfNecessary_nolock
{
  if (!self->_connected)
  {
    [(NRDUpdateBrainClientImpl *)self _invalidateConnection];
    serverEndpoint = self->_serverEndpoint;
    id v4 = objc_alloc((Class)NSXPCConnection);
    if (serverEndpoint) {
      id v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:self->_serverEndpoint];
    }
    else {
      id v5 = (NSXPCConnection *)[v4 initWithServiceName:@"com.apple.NRD.UpdateBrainService" options:0];
    }
    serverConnection = self->_serverConnection;
    self->_serverConnection = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NRDUpdateBrainClient.serverConnectionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(NSXPCConnection *)self->_serverConnection _setQueue:v7];

    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2];
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDUpdateBrainDelegateInterface];
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDBackgroundActivitySchedulerInterface];
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDRemoteableBlockInterface];
    [v10 setInterface:v11 forSelector:"scheduleWithRemoteableBlock:" argumentIndex:0 ofReply:0];
    [v10 setInterface:v11 forSelector:"setCheckInHandler:" argumentIndex:0 ofReply:0];
    [v8 setInterface:v11 forSelector:"downloadNeRDUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [v8 setInterface:v11 forSelector:"installNeRDUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [v8 setInterface:v11 forSelector:"finishNeRDUpdate:" argumentIndex:0 ofReply:1];
    [v9 setInterface:v10 forSelector:"newSchedulerWithIdentifier:reply:" argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)self->_serverConnection setRemoteObjectInterface:v8];
    if (self->_delegate)
    {
      [(NSXPCConnection *)self->_serverConnection setExportedInterface:v9];
      [(NSXPCConnection *)self->_serverConnection setExportedObject:self->_delegate];
    }
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__7;
    v18[4] = __Block_byref_object_dispose__7;
    v19 = 0;
    v19 = self;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__7;
    v16[4] = __Block_byref_object_dispose__7;
    v17 = 0;
    v17 = self->_delegate;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke;
    v15[3] = &unk_100059E68;
    v15[4] = v18;
    v15[5] = v16;
    v12 = objc_retainBlock(v15);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_139;
    v14[3] = &unk_100059E68;
    v14[4] = v18;
    v14[5] = v16;
    v13 = objc_retainBlock(v14);
    [(NSXPCConnection *)self->_serverConnection setInvalidationHandler:v12];
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:v13];
    [(NSXPCConnection *)self->_serverConnection resume];
    self->_connected = 1;

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v18, 8);
  }
}

uint64_t __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke(uint64_t a1)
{
  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    CFStringRef v5 = @"com.apple.NRD.UpdateBrainService";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connection to %{public}@ invalidated", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return (uint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connectionInvalidated];
    }
  }
  return result;
}

uint64_t __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_139(uint64_t a1)
{
  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    CFStringRef v5 = @"com.apple.NRD.UpdateBrainService";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connection to %{public}@ interrupted", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return (uint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connectionInterrupted];
    }
  }
  return result;
}

- (void)connectToServerIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  [(NRDUpdateBrainClientImpl *)obj _connectToServerIfNecessary_nolock];
  objc_sync_exit(obj);
}

- (void)noteConnectionDropped
{
  obj = self;
  objc_sync_enter(obj);
  obj->_connected = 0;
  objc_sync_exit(obj);
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a5;
  if (v8)
  {
    v10 = nrdSharedLogger();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v11) {
        -[NRDUpdateDaemonClientImpl handleConnectionError:method:handler:]((uint64_t)a4, (uint64_t)v8, v10);
      }
    }
    else if (v11)
    {
      -[NRDUpdateBrainClientImpl handleConnectionError:method:handler:]((uint64_t)v8, v10);
    }

    [(NRDUpdateBrainClientImpl *)self _invalidateConnection];
    v9[2](v9);
  }
}

- (void)ping:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  CFStringRef v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain...", (uint8_t *)&buf, 2u);
  }

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke;
  v38[3] = &unk_10005A1F8;
  v38[4] = self;
  v41 = "-[NRDUpdateBrainClientImpl ping:]";
  id v6 = v4;
  id v39 = v6;
  v40 = &v42;
  dispatch_queue_t v7 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v38];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_142;
  v35[3] = &unk_10005A270;
  v35[4] = self;
  id v8 = v6;
  id v36 = v8;
  v37 = &v42;
  [v7 ping:v35];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v32 = __33__NRDUpdateBrainClientImpl_ping___block_invoke_169;
  v33 = &unk_100059FA8;
  v34 = &v42;
  v9 = v31;
  BOOL v11 = +[NSDate date];
  do
  {
    v12 = +[NSDate date];
    v13 = [v12 dateByAddingTimeInterval:0.125];
    v14 = +[NSRunLoop currentRunLoop];
    [v14 runUntilDate:v13];

    v15 = +[NSDate date];
    [v15 timeIntervalSinceDate:v12];
    double v17 = v16;

    if (v17 < 0.125)
    {
      buf.tv_sec = (uint64_t)(0.125 - v17);
      buf.tv_nsec = (uint64_t)((0.125 - v17 - (double)buf.tv_sec) * 1000000000.0);
      nanosleep(&buf, 0);
    }

    if (v32((uint64_t)v9)) {
      break;
    }
    v18 = +[NSDate date];
    [v18 timeIntervalSinceDate:v11];
    BOOL v20 = v19 < 30.0;
  }
  while (v20);

  if (!*((unsigned char *)v43 + 24))
  {
    v21 = nrdSharedLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

    NSErrorUserInfoKey v47 = NSDebugDescriptionErrorKey;
    CFStringRef v48 = @"timeout connecting to brain endpoint";
    v29 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v30 = +[NSError errorWithDomain:@"NRDUpdateErrorDomain" code:101 userInfo:v29];
    (*((void (**)(id, void *))v8 + 2))(v8, v30);
  }
  _Block_object_dispose(&v42, 8);
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_2;
  v8[3] = &unk_10005A1D0;
  CFStringRef v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 48);
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_2(uint64_t a1)
{
  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __33__NRDUpdateBrainClientImpl_ping___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_142(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = nrdSharedLogger();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __33__NRDUpdateBrainClientImpl_ping___block_invoke_142_cold_1((uint64_t)v3, v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timespec buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain succeeded", buf, 2u);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_143;
    v8[3] = &unk_10005A248;
    void v8[4] = v6;
    id v7 = *(id *)(a1 + 40);
    id v9 = 0;
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 48);
    [v6 getListenerEndpoint:v8];
  }
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_143(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = nrdSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Could not probe for NRDUpdateBrainInterfacePrivate2.", v10, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    id v7 = [[NRDUpdateBrainClientImpl alloc] initWithEndpoint:v5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_150;
    v11[3] = &unk_10005A220;
    v11[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 56);
    id v12 = v8;
    v13 = v7;
    id v9 = v7;
    [(NRDUpdateBrainClientImpl *)v9 ping:&off_100064B50 reply:v11];
  }
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_150(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = nrdSharedLogger();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NeRD update brain does not support NRDUpdateBrainInterfacePrivate2.", v22, 2u);
    }
    goto LABEL_8;
  }
  if (v7)
  {
    *(_WORD *)timespec buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NeRD update brain supports NRDUpdateBrainInterfacePrivate2.", buf, 2u);
  }

  uint64_t v8 = [v5 objectForKeyedSubscript:@"BrainVersion"];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 8);
  *(void *)(v9 + 8) = v8;

  uint64_t v11 = [v5 objectForKeyedSubscript:@"BrainTimeStamp"];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v11;

  uint64_t v14 = [v5 objectForKeyedSubscript:@"BrainUUID"];
  uint64_t v15 = *(void *)(a1 + 32);
  double v16 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v14;

  uint64_t v17 = [v5 objectForKeyedSubscript:@"DylibUUID"];
  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = *(void **)(v18 + 32);
  *(void *)(v18 + 32) = v17;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2);
  BOOL v20 = [v5 objectForKeyedSubscript:@"__BrainProtocolVersion"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"__BrainProtocolVersion"];
    *(_DWORD *)(*(void *)(a1 + 32) + 80) = [v6 unsignedIntValue];
LABEL_8:
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  [*(id *)(a1 + 48) _invalidateConnection];
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_169(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)ping:(id)a3 reply:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  BOOL v7 = nrdSharedLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Probing NeRD update brain for NRDUpdateBrainInterfacePrivate2...", (uint8_t *)&buf, 2u);
  }

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke;
  v41[3] = &unk_10005A1F8;
  v41[4] = self;
  uint64_t v44 = "-[NRDUpdateBrainClientImpl ping:reply:]";
  id v8 = v6;
  id v42 = v8;
  v43 = &v45;
  uint64_t v9 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v41];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3;
  v38[3] = &unk_10005A298;
  id v10 = v8;
  id v39 = v10;
  v40 = &v45;
  [v9 ping:v33 reply:v38];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v35 = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4;
  id v36 = &unk_100059FA8;
  v37 = &v45;
  uint64_t v11 = v34;
  v13 = +[NSDate date];
  do
  {
    uint64_t v14 = +[NSDate date];
    uint64_t v15 = [v14 dateByAddingTimeInterval:0.125];
    double v16 = +[NSRunLoop currentRunLoop];
    [v16 runUntilDate:v15];

    uint64_t v17 = +[NSDate date];
    [v17 timeIntervalSinceDate:v14];
    double v19 = v18;

    if (v19 < 0.125)
    {
      buf.tv_sec = (uint64_t)(0.125 - v19);
      buf.tv_nsec = (uint64_t)((0.125 - v19 - (double)buf.tv_sec) * 1000000000.0);
      nanosleep(&buf, 0);
    }

    if (v35((uint64_t)v11)) {
      break;
    }
    BOOL v20 = +[NSDate date];
    [v20 timeIntervalSinceDate:v13];
    BOOL v22 = v21 < 30.0;
  }
  while (v22);

  if (!*((unsigned char *)v46 + 24))
  {
    uint64_t v23 = nrdSharedLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:reply:](v23, v24, v25, v26, v27, v28, v29, v30);
    }

    v50[0] = NSDebugDescriptionErrorKey;
    v50[1] = @"Protocol";
    v51[0] = @"timeout connecting to brain endpoint";
    v51[1] = @"NRDUpdateBrainInterfacePrivate2";
    v50[2] = @"Non-fatal";
    v51[2] = &__kCFBooleanTrue;
    v31 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];
    v32 = +[NSError errorWithDomain:@"NRDUpdateErrorDomain" code:101 userInfo:v31];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v32);
  }
  _Block_object_dispose(&v45, 8);
}

void __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2;
  v8[3] = &unk_10005A1D0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 48);
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)run:(unint64_t)a3 callback:(id)a4
{
}

- (void)run:(unint64_t)a3 options:(id)a4 callback:(id)a5
{
  id v8 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke;
  v11[3] = &unk_10005A0E8;
  v11[4] = self;
  v13 = "-[NRDUpdateBrainClientImpl run:options:callback:]";
  id v9 = a5;
  id v12 = v9;
  id v10 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v11];
  if (protocol_isEqual(self->_brainProtocol, (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2)) {
    [v10 run:a3 options:v8 callback:v9];
  }
  else {
    [v10 run:a3 callback:v9];
  }
}

void __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getListenerEndpoint:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke;
  v6[3] = &unk_10005A0E8;
  id v7 = a3;
  id v8 = "-[NRDUpdateBrainClientImpl getListenerEndpoint:]";
  v6[4] = self;
  id v4 = v7;
  id v5 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v6];
  [v5 getListenerEndpoint:v4];
}

void __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)queryNeRDUpdate:(id)a3 build:(id)a4 options:(id)a5 callback:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke;
  v15[3] = &unk_10005A0E8;
  id v16 = a6;
  uint64_t v17 = "-[NRDUpdateBrainClientImpl queryNeRDUpdate:build:options:callback:]";
  v15[4] = self;
  id v10 = v16;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v15];
  [v14 queryNeRDUpdate:v13 build:v12 options:v11 callback:v10];
}

void __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

- (void)downloadNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke;
  v24[3] = &unk_10005A0E8;
  v24[4] = self;
  uint64_t v26 = "-[NRDUpdateBrainClientImpl downloadNeRDUpdate:options:progress:completion:]";
  id v13 = a6;
  id v25 = v13;
  uint64_t v14 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v24];
  uint64_t v15 = [NRDRemoteableBlock alloc];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3;
  v22[3] = &unk_10005A2C0;
  id v16 = v12;
  id v23 = v16;
  uint64_t v17 = [(NRDRemoteableBlock *)v15 initWithProgressBlock:v22];
  if (v14)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4;
    v20[3] = &unk_10005A160;
    id v21 = v13;
    [v14 downloadNeRDUpdate:v10 options:v11 progress:v17 completion:v20];
    double v18 = v21;
  }
  else
  {
    NSErrorUserInfoKey v27 = NSDebugDescriptionErrorKey;
    CFStringRef v28 = @"no remote object connection";
    double v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    double v19 = +[NSError errorWithDomain:@"NRDUpdateErrorDomain" code:105 userInfo:v18];
    (*((void (**)(id, void *))v13 + 2))(v13, v19);
  }
}

void __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3.n128_f64[0] = (double)(unint64_t)[a2 unsignedIntegerValue] / 100.0;
  uint64_t v4 = *(uint64_t (**)(uint64_t, __n128))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)installNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke;
  v24[3] = &unk_10005A0E8;
  v24[4] = self;
  uint64_t v26 = "-[NRDUpdateBrainClientImpl installNeRDUpdate:options:progress:completion:]";
  id v13 = a6;
  id v25 = v13;
  uint64_t v14 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v24];
  uint64_t v15 = [NRDRemoteableBlock alloc];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3;
  v22[3] = &unk_10005A2C0;
  id v16 = v12;
  id v23 = v16;
  uint64_t v17 = [(NRDRemoteableBlock *)v15 initWithProgressBlock:v22];
  if (v14)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4;
    v20[3] = &unk_10005A160;
    id v21 = v13;
    [v14 installNeRDUpdate:v10 options:v11 progress:v17 completion:v20];
    double v18 = v21;
  }
  else
  {
    NSErrorUserInfoKey v27 = NSDebugDescriptionErrorKey;
    CFStringRef v28 = @"no remote object connection";
    double v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    double v19 = +[NSError errorWithDomain:@"NRDUpdateErrorDomain" code:105 userInfo:v18];
    (*((void (**)(id, void *))v13 + 2))(v13, v19);
  }
}

void __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3.n128_f64[0] = (double)(unint64_t)[a2 unsignedIntegerValue] / 100.0;
  uint64_t v4 = *(uint64_t (**)(uint64_t, __n128))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)purgeNeRDUpdate:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke;
  v6[3] = &unk_10005A0E8;
  id v7 = a3;
  id v8 = "-[NRDUpdateBrainClientImpl purgeNeRDUpdate:]";
  v6[4] = self;
  id v4 = v7;
  id v5 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v6];
  [v5 purgeNeRDUpdate:v4];
}

void __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)finishNeRDUpdate:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke;
  v8[3] = &unk_10005A0E8;
  id v9 = self;
  id v11 = "-[NRDUpdateBrainClientImpl finishNeRDUpdate:]";
  id v3 = a3;
  id v10 = v3;
  uint64_t v4 = [(NRDUpdateBrainClientImpl *)v9 _remoteInterfaceWithErrorHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3;
  v6[3] = &unk_10005A328;
  id v7 = v3;
  id v5 = v3;
  [v4 finishNeRDUpdate:v6];
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4;
  v8[3] = &unk_100059200;
  id v9 = a2;
  id v5 = v9;
  id v6 = a3;
  id v7 = objc_retainBlock(v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute:&__block_literal_global_12];
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_5(id a1, int a2)
{
  uint64_t v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "sending NRD update brain the all-clear.", v3, 2u);
  }
}

- (void)calculateCurrentRequiredSpace:(id)a3 callback:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke;
  v9[3] = &unk_10005A0E8;
  id v10 = a4;
  id v11 = "-[NRDUpdateBrainClientImpl calculateCurrentRequiredSpace:callback:]";
  v9[4] = self;
  id v6 = v10;
  id v7 = a3;
  id v8 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v9];
  [v8 calculateCurrentRequiredSpace:v7 callback:v6];
}

void __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)cancelNeRDUpdate:(BOOL)a3 callback:(id)a4
{
  BOOL v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke;
  v8[3] = &unk_10005A0E8;
  id v9 = a4;
  id v10 = "-[NRDUpdateBrainClientImpl cancelNeRDUpdate:callback:]";
  void v8[4] = self;
  id v6 = v9;
  id v7 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v8];
  [v7 cancelNeRDUpdate:v4 callback:v6];
}

void __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSString)brainVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)brainTimeStamp
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)brainUUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)dylibUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brainProtocol, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_dylibUUID, 0);
  objc_storeStrong((id *)&self->_brainUUID, 0);
  objc_storeStrong((id *)&self->_brainTimeStamp, 0);
  objc_storeStrong((id *)&self->_brainVersion, 0);
}

- (void)handleConnectionError:(uint64_t)a1 method:(NSObject *)a2 handler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "connection error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)ping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__NRDUpdateBrainClientImpl_ping___block_invoke_142_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Pinging NeRD update brain failed with error:%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)ping:(uint64_t)a3 reply:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end