@interface NRDUpdateDaemonClientImpl
- (BOOL)resendOnError:(id)a3;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (void)_invalidateConnection;
- (void)acquireNRDUpdateBrain:(id)a3 reply:(id)a4;
- (void)connectToServerIfNecessary;
- (void)getNRDUpdateBrainEndpoint:(id)a3;
- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5;
- (void)noteConnectionDropped;
- (void)update:(id)a3;
- (void)update:(id)a3 reply:(id)a4;
@end

@implementation NRDUpdateDaemonClientImpl

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(NRDUpdateDaemonClientImpl *)self connectToServerIfNecessary];
  v5 = [(NSXPCConnection *)self->_serverConnection remoteObjectProxyWithErrorHandler:v4];

  return v5;
}

- (void)_invalidateConnection
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

- (void)connectToServerIfNecessary
{
  if (!self->_connected)
  {
    [(NRDUpdateDaemonClientImpl *)self _invalidateConnection];
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.mobile.NRDUpdated" options:0];
    serverConnection = self->_serverConnection;
    self->_serverConnection = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NRDUpdated.serverConnectionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(NSXPCConnection *)self->_serverConnection _setQueue:v5];

    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NRDUpdatedProtocol];
    [(NSXPCConnection *)self->_serverConnection setRemoteObjectInterface:v6];
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__6;
    v11[4] = __Block_byref_object_dispose__6;
    v12 = 0;
    v12 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke;
    v10[3] = &unk_10005A098;
    v10[4] = v11;
    v7 = objc_retainBlock(v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7;
    v9[3] = &unk_10005A098;
    v9[4] = v11;
    v8 = objc_retainBlock(v9);
    [(NSXPCConnection *)self->_serverConnection setInvalidationHandler:v7];
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:v8];
    [(NSXPCConnection *)self->_serverConnection resume];
    self->_connected = 1;

    _Block_object_dispose(v11, 8);
  }
}

id __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
}

id __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7(uint64_t a1)
{
  v2 = nrdSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
}

- (void)noteConnectionDropped
{
  self->_connected = 0;
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
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
      -[NRDUpdateDaemonClientImpl handleConnectionError:method:handler:]((uint64_t)v8, v10, v12, v13, v14, v15, v16, v17);
    }

    v18 = [v8 domain];
    if ([v18 isEqualToString:NSCocoaErrorDomain])
    {
      if ([v8 code] == (id)4097)
      {

LABEL_12:
        [(NRDUpdateDaemonClientImpl *)self _invalidateConnection];
        goto LABEL_13;
      }
      id v19 = [v8 code];

      if (v19 == (id)4099) {
        goto LABEL_12;
      }
    }
    else
    {
    }
LABEL_13:
    v9[2](v9);
  }
}

- (void)getNRDUpdateBrainEndpoint:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke;
  v6[3] = &unk_10005A0E8;
  id v7 = a3;
  id v8 = "-[NRDUpdateDaemonClientImpl getNRDUpdateBrainEndpoint:]";
  v6[4] = self;
  id v4 = v7;
  uint64_t v5 = [(NRDUpdateDaemonClientImpl *)self _remoteInterfaceWithErrorHandler:v6];
  [v5 getNRDUpdateBrainEndpoint:v4];
}

void __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __55__NRDUpdateDaemonClientImpl_getNRDUpdateBrainEndpoint___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)acquireNRDUpdateBrain:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke;
  v15[3] = &unk_10005A138;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  id v17 = v7;
  id v9 = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_2;
  v12[3] = &unk_10005A188;
  id v13 = v8;
  uint64_t v14 = objc_retainBlock(v15);
  v12[4] = self;
  id v10 = v8;
  BOOL v11 = v14;
  [(NRDUpdateDaemonClientImpl *)self update:v10 reply:v12];
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (([a1[4] resendOnError:v3] & 1) == 0)
  {
    uint64_t v4 = [a1[5] objectForKeyedSubscript:@"__nrd_brain-location_key"];

    if (!v3 || !v4)
    {
      id v12 = a1[4];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_12;
      v13[3] = &unk_10005A110;
      id v14 = v3;
      id v15 = a1[6];
      [v12 getNRDUpdateBrainEndpoint:v13];

      goto LABEL_9;
    }
    uint64_t v5 = nrdSharedLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  (*((void (**)(void))a1[6] + 2))();
LABEL_9:
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (*(void *)(a1 + 32)
      && ([v5 userInfo],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 objectForKeyedSubscript:NSUnderlyingErrorKey],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      uint64_t v11 = [v6 userInfo];

      if (v11)
      {
        id v12 = [v6 userInfo];
        id v13 = [v12 mutableCopy];
      }
      else
      {
        id v13 = +[NSMutableDictionary dictionary];
      }
      [v13 setObject:*(void *)(a1 + 32) forKeyedSubscript:NSUnderlyingErrorKey];
      id v14 = [v6 domain];
      uint64_t v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, [v6 code], v13);

      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = v6;
    }
  }
  else
  {
    uint64_t v9 = [[NRDUpdateBrainClientImpl alloc] initWithEndpoint:v15];
    uint64_t v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) resendOnError:v3])
  {
    id v5 = +[NSDate date];
    do
    {
      uint64_t v6 = +[NSDate date];
      uint64_t v7 = [v6 dateByAddingTimeInterval:2.0];
      uint64_t v8 = +[NSRunLoop currentRunLoop];
      [v8 runUntilDate:v7];

      uint64_t v9 = +[NSDate date];
      [v9 timeIntervalSinceDate:v6];
      double v11 = v10;

      if (v11 < 2.0)
      {
        __rqtp.tv_sec = (uint64_t)(2.0 - v11);
        __rqtp.tv_nsec = (uint64_t)((2.0 - v11 - (double)__rqtp.tv_sec) * 1000000000.0);
        nanosleep(&__rqtp, 0);
      }

      id v12 = +[NSDate date];
      [v12 timeIntervalSinceDate:v5];
      double v14 = v13;
    }
    while (v14 < 2.0);

    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_3;
    v17[3] = &unk_10005A160;
    id v18 = *(id *)(a1 + 48);
    [v15 update:v16 reply:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)update:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __36__NRDUpdateDaemonClientImpl_update___block_invoke;
  v6[3] = &unk_10005A0E8;
  id v7 = a3;
  uint64_t v8 = "-[NRDUpdateDaemonClientImpl update:]";
  v6[4] = self;
  id v4 = v7;
  id v5 = [(NRDUpdateDaemonClientImpl *)self _remoteInterfaceWithErrorHandler:v6];
  [v5 update:v4];
}

void __36__NRDUpdateDaemonClientImpl_update___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __36__NRDUpdateDaemonClientImpl_update___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __36__NRDUpdateDaemonClientImpl_update___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)update:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = nrdSharedLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warning: NRDUpdated options are not supported on this platform. options=%{public}@", buf, 0xCu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke;
  v11[3] = &unk_10005A0E8;
  id v12 = v7;
  double v13 = "-[NRDUpdateDaemonClientImpl update:reply:]";
  v11[4] = self;
  id v9 = v7;
  id v10 = [(NRDUpdateDaemonClientImpl *)self _remoteInterfaceWithErrorHandler:v11];
  [v10 update:v9];
}

void __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke_2;
  v8[3] = &unk_10005A0C0;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 handleConnectionError:v7 method:v4 handler:v8];
}

uint64_t __42__NRDUpdateDaemonClientImpl_update_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)resendOnError:(id)a3
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v7)
  {
    BOOL v17 = 0;
    goto LABEL_22;
  }
  id v19 = v7;
  id v9 = v7;
  while (1)
  {
    id v10 = objc_msgSend(v9, "userInfo", v19);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v3 = [v9 userInfo];
      id v5 = [v3 objectForKeyedSubscript:@"com.apple.NRD-Resend"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
    }
    int v12 = 0;
LABEL_8:
    double v13 = [v9 domain];
    if ([v13 isEqualToString:@"NRDUpdateErrorDomain"]) {
      BOOL v14 = [v9 code] == (id)112;
    }
    else {
      BOOL v14 = 0;
    }

    if (v12)
    {
    }
    if (isKindOfClass)
    {
    }
    if (v14) {
      goto LABEL_20;
    }
    id v15 = [v9 userInfo];
    uint64_t v16 = [v15 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v9 = (void *)v16;
    if (!v16)
    {
      BOOL v17 = 0;
      goto LABEL_21;
    }
  }
  uint64_t v4 = [v9 userInfo];
  id v6 = [v4 objectForKeyedSubscript:@"com.apple.NRD-Resend"];
  if (![v6 BOOLValue])
  {
    int v12 = 1;
    goto LABEL_8;
  }

LABEL_20:
  BOOL v17 = 1;
LABEL_21:
  uint64_t v8 = v19;

LABEL_22:
  return v17;
}

- (void).cxx_destruct
{
}

void __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__NRDUpdateDaemonClientImpl_connectToServerIfNecessary__block_invoke_7_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleConnectionError:(uint64_t)a3 method:(uint64_t)a4 handler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleConnectionError:(uint64_t)a1 method:(uint64_t)a2 handler:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s - connection error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void __57__NRDUpdateDaemonClientImpl_acquireNRDUpdateBrain_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end