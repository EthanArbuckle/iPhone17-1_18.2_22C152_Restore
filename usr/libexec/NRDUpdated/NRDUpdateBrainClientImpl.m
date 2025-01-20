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
  v3.receiver = self;
  v3.super_class = (Class)NRDUpdateBrainClientImpl;
  result = [(NRDUpdateBrainClientImpl *)&v3 init];
  if (result)
  {
    result->_brainProtocol = (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate;
    result->_brainProtocolVersion = 1;
  }
  return result;
}

- (NRDUpdateBrainClientImpl)initWithDelegate:(id)a3
{
  result = [(NRDUpdateBrainClientImpl *)self init];
  if (result) {
    result->_delegate = (NRDUpdateBrainDelegateInterface *)a3;
  }
  return result;
}

- (NRDUpdateBrainClientImpl)initWithEndpoint:(id)a3
{
  v4 = [(NRDUpdateBrainClientImpl *)self init];
  result = 0;
  if (a3)
  {
    if (v4)
    {
      v4->_serverEndpoint = (NSXPCListenerEndpoint *)a3;
      id v6 = a3;
      return v4;
    }
  }
  return result;
}

- (void)dealloc
{
  [(NRDUpdateBrainClientImpl *)self _invalidateConnection];
  self->_delegate = 0;

  v3.receiver = self;
  v3.super_class = (Class)NRDUpdateBrainClientImpl;
  [(NRDUpdateBrainClientImpl *)&v3 dealloc];
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_serverConnection remoteObjectProxyWithErrorHandler:a3];
}

- (void)_invalidateConnection_nolock
{
  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    [(NSXPCConnection *)serverConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_serverConnection invalidate];

    self->_serverConnection = 0;
    self->_connected = 0;
  }
}

- (void)_invalidateConnection
{
  objc_sync_enter(self);
  [(NRDUpdateBrainClientImpl *)self _invalidateConnection_nolock];

  objc_sync_exit(self);
}

- (void)_connectToServerIfNecessary_nolock
{
  if (!self->_connected)
  {
    [(NRDUpdateBrainClientImpl *)self _invalidateConnection];
    serverEndpoint = self->_serverEndpoint;
    id v4 = objc_alloc((Class)NSXPCConnection);
    if (serverEndpoint) {
      v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:self->_serverEndpoint];
    }
    else {
      v5 = (NSXPCConnection *)[v4 initWithServiceName:@"com.apple.NRD.UpdateBrainService" options:0];
    }
    self->_serverConnection = v5;
    id v6 = dispatch_queue_create("com.apple.NRDUpdateBrainClient.serverConnectionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(NSXPCConnection *)self->_serverConnection _setQueue:v6];
    dispatch_release(v6);
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2];
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDUpdateBrainDelegateInterface];
    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDBackgroundActivitySchedulerInterface];
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDRemoteableBlockInterface];
    [(NSXPCInterface *)v9 setInterface:v10 forSelector:"scheduleWithRemoteableBlock:" argumentIndex:0 ofReply:0];
    [(NSXPCInterface *)v9 setInterface:v10 forSelector:"setCheckInHandler:" argumentIndex:0 ofReply:0];
    [(NSXPCInterface *)v7 setInterface:v10 forSelector:"downloadNeRDUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [(NSXPCInterface *)v7 setInterface:v10 forSelector:"installNeRDUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [(NSXPCInterface *)v7 setInterface:v10 forSelector:"finishNeRDUpdate:" argumentIndex:0 ofReply:1];
    [(NSXPCInterface *)v8 setInterface:v9 forSelector:"newSchedulerWithIdentifier:reply:" argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)self->_serverConnection setRemoteObjectInterface:v7];
    delegate = self->_delegate;
    if (delegate)
    {
      [(NSXPCConnection *)self->_serverConnection setExportedInterface:v8];
      [(NSXPCConnection *)self->_serverConnection setExportedObject:self->_delegate];
      delegate = self->_delegate;
    }
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3052000000;
    v15[3] = __Block_byref_object_copy_;
    v15[4] = __Block_byref_object_dispose_;
    v15[5] = self;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3052000000;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    v14[5] = delegate;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke;
    v13[3] = &unk_100018500;
    v13[4] = v15;
    v13[5] = v14;
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:", v13, _NSConcreteStackBlock, 3221225472, __62__NRDUpdateBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_139, &unk_100018500, v15, v14);
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:&v12];
    [(NSXPCConnection *)self->_serverConnection resume];
    self->_connected = 1;
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v15, 8);
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
  objc_sync_enter(self);
  [(NRDUpdateBrainClientImpl *)self _connectToServerIfNecessary_nolock];

  objc_sync_exit(self);
}

- (void)noteConnectionDropped
{
  objc_sync_enter(self);
  self->_connected = 0;

  objc_sync_exit(self);
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  if (a3)
  {
    v9 = nrdSharedLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v10) {
        -[NRDUpdateBrainClientImpl handleConnectionError:method:handler:]((uint64_t)a4, (uint64_t)a3, v9);
      }
    }
    else if (v10)
    {
      -[NRDUpdateBrainClientImpl handleConnectionError:method:handler:]((uint64_t)a3, v9);
    }
    [(NRDUpdateBrainClientImpl *)self _invalidateConnection];
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)ping:(id)a3
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  CFStringRef v5 = nrdSharedLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain...", (uint8_t *)&buf, 2u);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke;
  v25[3] = &unk_100018550;
  v25[4] = self;
  v25[5] = a3;
  v25[6] = &v26;
  v25[7] = "-[NRDUpdateBrainClientImpl ping:]";
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_142;
  v24[3] = &unk_1000185C8;
  v24[4] = self;
  v24[5] = a3;
  v24[6] = &v26;
  [self _remoteInterfaceWithErrorHandler:v25] ping:v24];
  v21 = __33__NRDUpdateBrainClientImpl_ping___block_invoke_169;
  v22 = &unk_1000185F0;
  v23 = &v26;
  v7 = +[NSDate date];
  do
  {
    v8 = +[NSDate date];
    [+[NSRunLoop currentRunLoop] runUntilDate:[(NSDate *)v8 dateByAddingTimeInterval:0.125]];
    [+[NSDate date] timeIntervalSinceDate:v8];
    if (v9 < 0.125)
    {
      double v10 = 0.125 - v9;
      buf.tv_sec = (uint64_t)v10;
      buf.tv_nsec = (uint64_t)((v10 - (double)(uint64_t)v10) * 1000000000.0);
      nanosleep(&buf, 0);
    }
    if (v21((uint64_t)&v20)) {
      break;
    }
    [+[NSDate date] timeIntervalSinceDate:v7];
  }
  while (v11 < 30.0);
  if (!*((unsigned char *)v27 + 24))
  {
    uint64_t v12 = nrdSharedLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
    CFStringRef v32 = @"timeout connecting to brain endpoint";
    (*((void (**)(id, NSError *))a3 + 2))(a3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NRDUpdateErrorDomain", 101, +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1]));
  }
  _Block_object_dispose(&v26, 8);
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_2;
  v5[3] = &unk_100018528;
  v5[4] = a2;
  long long v6 = *(_OWORD *)(a1 + 40);
  return [v2 handleConnectionError:a2 method:v3 handler:v5];
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

id __33__NRDUpdateBrainClientImpl_ping___block_invoke_142(void *a1, uint64_t a2)
{
  uint64_t v4 = nrdSharedLogger();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __33__NRDUpdateBrainClientImpl_ping___block_invoke_142_cold_1(a2, v5);
    }
    id result = (id)(*(uint64_t (**)(void))(a1[5] + 16))();
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timespec buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinging NeRD update brain succeeded", buf, 2u);
    }
    uint64_t v7 = (void *)a1[4];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_143;
    v8[3] = &unk_1000185A0;
    v8[4] = v7;
    v8[5] = 0;
    long long v9 = *(_OWORD *)(a1 + 5);
    return [v7 getListenerEndpoint:v8];
  }
  return result;
}

NRDUpdateBrainClientImpl *__33__NRDUpdateBrainClientImpl_ping___block_invoke_143(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = nrdSharedLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not probe for NRDUpdateBrainInterfacePrivate2.", v8, 2u);
    }
    id result = (NRDUpdateBrainClientImpl *)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v6 = [[NRDUpdateBrainClientImpl alloc] initWithEndpoint:a2];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    long long v7 = *(_OWORD *)(a1 + 48);
    long long v10 = *(_OWORD *)(a1 + 32);
    v9[2] = __33__NRDUpdateBrainClientImpl_ping___block_invoke_150;
    v9[3] = &unk_100018578;
    long long v12 = v7;
    double v11 = v6;
    [(NRDUpdateBrainClientImpl *)v6 ping:&off_100019AC0 reply:v9];
    return v6;
  }
  return result;
}

id __33__NRDUpdateBrainClientImpl_ping___block_invoke_150(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = nrdSharedLogger();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NeRD update brain does not support NRDUpdateBrainInterfacePrivate2.", v9, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)timespec buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NeRD update brain supports NRDUpdateBrainInterfacePrivate2.", buf, 2u);
    }
    *(void *)(*(void *)(a1 + 32) + 8) = [a2 objectForKeyedSubscript:@"BrainVersion"];
    *(void *)(*(void *)(a1 + 32) + 16) = [a2 objectForKeyedSubscript:@"BrainTimeStamp"];
    *(void *)(*(void *)(a1 + 32) + 24) = [a2 objectForKeyedSubscript:@"BrainUUID"];
    *(void *)(*(void *)(a1 + 32) + 32) = [a2 objectForKeyedSubscript:@"DylibUUID"];
    *(void *)(*(void *)(a1 + 32) + 72) = &OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2;
    [a2 objectForKeyedSubscript:@"__BrainProtocolVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(_DWORD *)(*(void *)(a1 + 32) + 80) = [objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"__BrainProtocolVersion"), "unsignedIntValue");
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  return [*(id *)(a1 + 48) _invalidateConnection];
}

uint64_t __33__NRDUpdateBrainClientImpl_ping___block_invoke_169(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)ping:(id)a3 reply:(id)a4
{
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  BOOL v7 = nrdSharedLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.tv_sec) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Probing NeRD update brain for NRDUpdateBrainInterfacePrivate2...", (uint8_t *)&buf, 2u);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke;
  v27[3] = &unk_100018550;
  v27[4] = self;
  v27[5] = a4;
  v27[6] = &v28;
  v27[7] = "-[NRDUpdateBrainClientImpl ping:reply:]";
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_3;
  v26[3] = &unk_100018618;
  v26[4] = a4;
  v26[5] = &v28;
  [self _remoteInterfaceWithErrorHandler:v27] ping:a3 reply:v26];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v23 = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_4;
  v24 = &unk_1000185F0;
  v25 = &v28;
  long long v9 = +[NSDate date];
  do
  {
    long long v10 = +[NSDate date];
    [+[NSRunLoop currentRunLoop] runUntilDate:[(NSDate *)v10 dateByAddingTimeInterval:0.125]];
    [+[NSDate date] timeIntervalSinceDate:v10];
    if (v11 < 0.125)
    {
      double v12 = 0.125 - v11;
      buf.tv_sec = (uint64_t)v12;
      buf.tv_nsec = (uint64_t)((v12 - (double)(uint64_t)v12) * 1000000000.0);
      nanosleep(&buf, 0);
    }
    if (v23((uint64_t)v22)) {
      break;
    }
    [+[NSDate date] timeIntervalSinceDate:v9];
  }
  while (v13 < 30.0);
  if (!*((unsigned char *)v29 + 24))
  {
    uint64_t v14 = nrdSharedLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateBrainClientImpl ping:reply:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v33[0] = NSDebugDescriptionErrorKey;
    v33[1] = @"Protocol";
    v34[0] = @"timeout connecting to brain endpoint";
    v34[1] = @"NRDUpdateBrainInterfacePrivate2";
    v33[2] = @"Non-fatal";
    v34[2] = &__kCFBooleanTrue;
    (*((void (**)(id, void, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NRDUpdateErrorDomain", 101, +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3]));
  }
  _Block_object_dispose(&v28, 8);
}

id __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __39__NRDUpdateBrainClientImpl_ping_reply___block_invoke_2;
  v5[3] = &unk_100018528;
  v5[4] = a2;
  long long v6 = *(_OWORD *)(a1 + 40);
  return [v2 handleConnectionError:a2 method:v3 handler:v5];
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
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke;
  v10[3] = &unk_100018668;
  v10[5] = a5;
  v10[6] = "-[NRDUpdateBrainClientImpl run:options:callback:]";
  v10[4] = self;
  id v9 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v10];
  if (protocol_isEqual(self->_brainProtocol, (Protocol *)&OBJC_PROTOCOL___NRDUpdateBrainInterfacePrivate2)) {
    [v9 run:a3 options:a4 callback:a5];
  }
  else {
    [v9 run:a3 callback:a5];
  }
}

id __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2;
  v6[3] = &unk_100018640;
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __49__NRDUpdateBrainClientImpl_run_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getListenerEndpoint:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke;
  v3[3] = &unk_100018668;
  v3[5] = a3;
  v3[6] = "-[NRDUpdateBrainClientImpl getListenerEndpoint:]";
  v3[4] = self;
  [self _remoteInterfaceWithErrorHandler:v3 getListenerEndpoint:a3];
}

id __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2;
  v6[3] = &unk_100018640;
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __48__NRDUpdateBrainClientImpl_getListenerEndpoint___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)queryNeRDUpdate:(id)a3 build:(id)a4 options:(id)a5 callback:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke;
  v6[3] = &unk_100018668;
  v6[5] = a6;
  void v6[6] = "-[NRDUpdateBrainClientImpl queryNeRDUpdate:build:options:callback:]";
  v6[4] = self;
  [self _remoteInterfaceWithErrorHandler:v6 queryNeRDUpdate:a3 build:a4 options:a5 callback:a6];
}

id __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2;
  v6[3] = &unk_100018640;
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __67__NRDUpdateBrainClientImpl_queryNeRDUpdate_build_options_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

- (void)downloadNeRDUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100018668;
  v15[5] = a6;
  void v15[6] = "-[NRDUpdateBrainClientImpl downloadNeRDUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100018690;
  v14[4] = a5;
  double v11 = [[NRDRemoteableBlock alloc] initWithProgressBlock:v14];
  double v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_1000186B8;
    v13[4] = a6;
    [v10 downloadNeRDUpdate:a3 options:a4 progress:v11 completion:v13];
  }
  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    CFStringRef v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))(a6, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NRDUpdateErrorDomain", 105, +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1]));
  }
}

id __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __75__NRDUpdateBrainClientImpl_downloadNeRDUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100018640;
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
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
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100018668;
  v15[5] = a6;
  void v15[6] = "-[NRDUpdateBrainClientImpl installNeRDUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = [(NRDUpdateBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100018690;
  v14[4] = a5;
  double v11 = [[NRDRemoteableBlock alloc] initWithProgressBlock:v14];
  double v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_1000186B8;
    v13[4] = a6;
    [v10 installNeRDUpdate:a3 options:a4 progress:v11 completion:v13];
  }
  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    CFStringRef v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))(a6, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NRDUpdateErrorDomain", 105, +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1]));
  }
}

id __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __74__NRDUpdateBrainClientImpl_installNeRDUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100018640;
  __n128 v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
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
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke;
  v3[3] = &unk_100018668;
  v3[5] = a3;
  v3[6] = "-[NRDUpdateBrainClientImpl purgeNeRDUpdate:]";
  v3[4] = self;
  [self _remoteInterfaceWithErrorHandler:v3] purgeNeRDUpdate:a3;
}

id __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2;
  v6[3] = &unk_100018640;
  __n128 v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __44__NRDUpdateBrainClientImpl_purgeNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)finishNeRDUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke;
  v4[3] = &unk_100018668;
  v4[5] = a3;
  v4[6] = "-[NRDUpdateBrainClientImpl finishNeRDUpdate:]";
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3;
  v3[3] = &unk_100018748;
  v3[4] = a3;
  [self._remoteInterfaceWithErrorHandler:v4 finishNeRDUpdate:v3];
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2;
  v6[3] = &unk_100018640;
  __n128 v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  __n128 v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  uint64_t v5 = __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4;
  long long v6 = &unk_100018720;
  uint64_t v7 = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute:&__block_literal_global_1];
}

void __45__NRDUpdateBrainClientImpl_finishNeRDUpdate___block_invoke_5(id a1, int a2)
{
  uint64_t v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "sending NRD update brain the all-clear.", v3, 2u);
  }
}

- (void)calculateCurrentRequiredSpace:(id)a3 callback:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke;
  v4[3] = &unk_100018668;
  v4[5] = a4;
  v4[6] = "-[NRDUpdateBrainClientImpl calculateCurrentRequiredSpace:callback:]";
  v4[4] = self;
  [self _remoteInterfaceWithErrorHandler:v4 calculateCurrentRequiredSpace:a3 callback:a4];
}

id __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2;
  v6[3] = &unk_100018640;
  __n128 v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __67__NRDUpdateBrainClientImpl_calculateCurrentRequiredSpace_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)cancelNeRDUpdate:(BOOL)a3 callback:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke;
  v4[3] = &unk_100018668;
  v4[5] = a4;
  v4[6] = "-[NRDUpdateBrainClientImpl cancelNeRDUpdate:callback:]";
  v4[4] = self;
  [self _remoteInterfaceWithErrorHandler:v4 cancelNeRDUpdate:a3 callback:a4];
}

id __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2;
  v6[3] = &unk_100018640;
  __n128 v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __54__NRDUpdateBrainClientImpl_cancelNeRDUpdate_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (NSString)brainTimeStamp
{
  return self->_brainTimeStamp;
}

- (NSString)brainUUID
{
  return self->_brainUUID;
}

- (NSString)dylibUUID
{
  return self->_dylibUUID;
}

- (void)handleConnectionError:(uint64_t)a1 method:(NSObject *)a2 handler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "connection error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)handleConnectionError:(uint64_t)a1 method:(uint64_t)a2 handler:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s - connection error: %{public}@", (uint8_t *)&v3, 0x16u);
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