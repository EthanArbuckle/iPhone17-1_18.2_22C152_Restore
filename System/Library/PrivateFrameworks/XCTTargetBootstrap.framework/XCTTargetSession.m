@interface XCTTargetSession
- (BOOL)_on_queue_loadAutomationSupportLibraryFromPath:(id)a3 error:(id *)a4;
- (BOOL)isInternallyEntitledConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)targetIsRegistering;
- (NSXPCConnection)daemonConnection;
- (NSXPCListener)clientListener;
- (OS_dispatch_queue)queue;
- (XCTConnectionAccepting)connectionHandler;
- (XCTTargetSession)initWithDaemonConnection:(id)a3 registrationHandler:(id)a4;
- (XCTTargetSession)initWithServiceName:(id)a3 registrationHandler:(id)a4;
- (id)_on_queue_getListenerEndpoint;
- (id)registrationHandler;
- (void)_XCT_requestEndpointWithAutomationSupportLibraryPath:(id)a3 protocolVersion:(unint64_t)a4 reply:(id)a5;
- (void)_on_queue_connect;
- (void)_on_queue_startListeningForClientConnections;
- (void)connect;
- (void)registerForBootstrap;
- (void)setClientListener:(id)a3;
- (void)setConnectionHandler:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTargetIsRegistering:(BOOL)a3;
@end

@implementation XCTTargetSession

- (XCTTargetSession)initWithServiceName:(id)a3 registrationHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = XCTSharedDaemonConnectionProvider();
  v9 = [v8 makeNewDaemonConnectionWithServiceName:v7];

  v10 = [(XCTTargetSession *)self initWithDaemonConnection:v9 registrationHandler:v6];
  return v10;
}

- (XCTTargetSession)initWithDaemonConnection:(id)a3 registrationHandler:(id)a4
{
  id v7 = (NSXPCConnection *)a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"XCTTargetSession.m", 49, @"Invalid parameter not satisfying: %@", @"daemonConnection != nil" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)XCTTargetSession;
  v9 = [(XCTTargetSession *)&v19 init];
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.dt.xctest.targetsession", v10);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v11;

  daemonConnection = v9->_daemonConnection;
  v9->_daemonConnection = v7;
  v14 = v7;

  uint64_t v15 = MEMORY[0x21668AE90](v8);
  id registrationHandler = v9->_registrationHandler;
  v9->_id registrationHandler = (id)v15;

  return v9;
}

- (void)connect
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__XCTTargetSession_connect__block_invoke;
  block[3] = &unk_2641985B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__XCTTargetSession_connect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_on_queue_connect");
}

- (void)registerForBootstrap
{
  if (![(XCTTargetSession *)self targetIsRegistering])
  {
    [(XCTTargetSession *)self setTargetIsRegistering:1];
    v3 = [(XCTTargetSession *)self registrationHandler];
    v3[2]();
  }
}

- (void)_on_queue_connect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = [(XCTTargetSession *)self daemonConnection];
  v4 = [v3 exportedObject];

  if (!v4)
  {
    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C3CF580];
    id v6 = [(XCTTargetSession *)self daemonConnection];
    [v6 setRemoteObjectInterface:v5];

    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C3CE878];
    id v8 = [(XCTTargetSession *)self daemonConnection];
    [v8 setExportedInterface:v7];

    v9 = [(XCTTargetSession *)self daemonConnection];
    [v9 setExportedObject:self];

    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __37__XCTTargetSession__on_queue_connect__block_invoke;
    v17[3] = &unk_2641985E0;
    objc_copyWeak(&v18, &location);
    v10 = [(XCTTargetSession *)self daemonConnection];
    [v10 setInterruptionHandler:v17];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __37__XCTTargetSession__on_queue_connect__block_invoke_273;
    v15[3] = &unk_2641985E0;
    objc_copyWeak(&v16, &location);
    dispatch_queue_t v11 = [(XCTTargetSession *)self daemonConnection];
    [v11 setInvalidationHandler:v15];

    v12 = [(XCTTargetSession *)self daemonConnection];
    [v12 resume];

    v13 = [(XCTTargetSession *)self daemonConnection];
    v14 = [v13 remoteObjectProxyWithErrorHandler:&__block_literal_global_277];

    objc_msgSend(v14, "_XCT_registerTarget");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __37__XCTTargetSession__on_queue_connect__block_invoke(uint64_t a1)
{
  v2 = XCTTBDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __37__XCTTargetSession__on_queue_connect__block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained registerForBootstrap];
}

void __37__XCTTargetSession__on_queue_connect__block_invoke_273(uint64_t a1)
{
  v2 = XCTTBDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212A06000, v2, OS_LOG_TYPE_DEFAULT, "Connection to test daemon invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained registerForBootstrap];
}

void __37__XCTTargetSession__on_queue_connect__block_invoke_274(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = XCTTBDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __37__XCTTargetSession__on_queue_connect__block_invoke_274_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_on_queue_loadAutomationSupportLibraryFromPath:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = [(XCTTargetSession *)self connectionHandler];

  if (!v7)
  {
    if (!v6)
    {
      uint64_t v9 = XCTTBDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212A06000, v9, OS_LOG_TYPE_DEFAULT, "Using default automation support library path", buf, 2u);
      }

      uint64_t v6 = @"/Developer/Library/PrivateFrameworks/XCTAutomationSupport.framework";
    }
    v10 = XCTTBDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_212A06000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to load %@.", buf, 0xCu);
    }

    dispatch_queue_t v11 = [MEMORY[0x263F086E0] bundleWithPath:v6];
    v12 = v11;
    if (v11)
    {
      if ([v11 loadAndReturnError:a4])
      {
        if ([v12 principalClass])
        {
          if (objc_msgSend((id)objc_msgSend(v12, "principalClass"), "instancesRespondToSelector:", sel_acceptNewConnection_))
          {
            [v12 principalClass];
            v13 = objc_opt_new();
            [(XCTTargetSession *)self setConnectionHandler:v13];

            v14 = [(XCTTargetSession *)self connectionHandler];
            char v15 = objc_opt_respondsToSelector();

            if (v15)
            {
              id v16 = [(XCTTargetSession *)self connectionHandler];
              [v16 setInternalEntitlementChecker:self];
            }
            else
            {
              id v16 = XCTTBDefaultLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_212A06000, v16, OS_LOG_TYPE_DEFAULT, "Not setting internal entitlement checker, connection handler does not support it.", buf, 2u);
              }
            }

            BOOL v8 = 1;
            goto LABEL_24;
          }
          if (a4)
          {
            v20 = (void *)MEMORY[0x263F087E8];
            uint64_t v22 = [v12 principalClass];
            id v18 = @"Bundle principal class '%@' does not conform to the XCTConnectionAccepting protocol.";
            v17 = v20;
            uint64_t v19 = 3;
            goto LABEL_21;
          }
        }
        else if (a4)
        {
          v17 = (void *)MEMORY[0x263F087E8];
          id v18 = @"Bundle does not specify a principal class.";
          uint64_t v19 = 2;
LABEL_21:
          objc_msgSend(v17, "_xct_error:description:", v19, v18, v22);
          goto LABEL_22;
        }
      }
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "_xct_error:description:", 1, @"No bundle at path %@", v6);
LABEL_22:
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    BOOL v8 = 0;
    goto LABEL_24;
  }
  BOOL v8 = 1;
LABEL_25:

  return v8;
}

- (void)_on_queue_startListeningForClientConnections
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v4 = [(XCTTargetSession *)self connectionHandler];

  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"XCTTargetSession.m" lineNumber:159 description:@"Connection handler must be loaded from the automation support library before listening for connections."];
  }
  if (!self->_clientListener)
  {
    uint64_t v5 = XCTTBDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_212A06000, v5, OS_LOG_TYPE_DEFAULT, "Setting up target listener.", v8, 2u);
    }

    uint64_t v6 = [MEMORY[0x263F08D88] anonymousListener];
    [(XCTTargetSession *)self setClientListener:v6];

    [(NSXPCListener *)self->_clientListener setDelegate:self];
    [(NSXPCListener *)self->_clientListener resume];
  }
}

- (id)_on_queue_getListenerEndpoint
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(XCTTargetSession *)self _on_queue_startListeningForClientConnections];
  clientListener = self->_clientListener;

  return [(NSXPCListener *)clientListener endpoint];
}

- (void)_XCT_requestEndpointWithAutomationSupportLibraryPath:(id)a3 protocolVersion:(unint64_t)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = XCTTBDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212A06000, v9, OS_LOG_TYPE_DEFAULT, "Received request for endpoint.", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke;
  block[3] = &unk_264198628;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_sync(queue, block);
}

void __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  int v4 = objc_msgSend(v2, "_on_queue_loadAutomationSupportLibraryFromPath:error:", v3, &v16);
  id v5 = v16;
  uint64_t v6 = XCTTBDefaultLog();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_212A06000, v7, OS_LOG_TYPE_DEFAULT, "Sending anonymous endpoint.", v15, 2u);
    }

    id v8 = objc_msgSend(*(id *)(a1 + 32), "_on_queue_getListenerEndpoint");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke_cold_1((uint64_t)v5, v7, v9, v10, v11, v12, v13, v14);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)isInternallyEntitledConnection:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  long long v18 = 0u;
  long long v19 = 0u;
  if (v4) {
    [v4 auditToken];
  }
  uint64_t v6 = [(XCTTargetSession *)self daemonConnection];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_298];

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v8 = XCTTBDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    *(_DWORD *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = DWORD1(v18);
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v21) = DWORD2(v18);
    WORD2(v21) = 1024;
    *(_DWORD *)((char *)&v21 + 6) = HIDWORD(v18);
    WORD5(v21) = 1024;
    HIDWORD(v21) = v19;
    __int16 v22 = 1024;
    int v23 = DWORD1(v19);
    __int16 v24 = 1024;
    int v25 = DWORD2(v19);
    __int16 v26 = 1024;
    int v27 = HIDWORD(v19);
    _os_log_impl(&dword_212A06000, v8, OS_LOG_TYPE_DEFAULT, "Sending sync request to check entitlement for token %u %u %u %u %u %u %u %u", buf, 0x32u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__XCTTargetSession_isInternallyEntitledConnection___block_invoke_299;
  v13[3] = &unk_264198650;
  v13[4] = &v14;
  *(_OWORD *)buf = v18;
  long long v21 = v19;
  objc_msgSend(v7, "_XCT_checkInternalEntitlementForAuditToken:completion:", buf, v13);
  uint64_t v9 = XCTTBDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *((unsigned __int8 *)v15 + 24);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_212A06000, v9, OS_LOG_TYPE_DEFAULT, "Returning %d for has internal entitlement.", buf, 8u);
  }

  BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __51__XCTTargetSession_isInternallyEntitledConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = XCTTBDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __37__XCTTargetSession__on_queue_connect__block_invoke_274_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __51__XCTTargetSession_isInternallyEntitledConnection___block_invoke_299(uint64_t a1, char a2)
{
  uint64_t v4 = XCTTBDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_212A06000, v4, OS_LOG_TYPE_DEFAULT, "Got response to entitlement check", v5, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(XCTTargetSession *)self connectionHandler];

  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"XCTTargetSession.m" lineNumber:215 description:@"Connection handler object must be loaded before any incoming connections."];
  }
  uint64_t v8 = XCTTBDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_212A06000, v8, OS_LOG_TYPE_DEFAULT, "Received client to target connection.", v13, 2u);
  }

  uint64_t v9 = [(XCTTargetSession *)self connectionHandler];
  char v10 = [v9 acceptNewConnection:v6];

  return v10;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSXPCConnection)daemonConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSXPCListener)clientListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientListener:(id)a3
{
}

- (XCTConnectionAccepting)connectionHandler
{
  return (XCTConnectionAccepting *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnectionHandler:(id)a3
{
}

- (id)registrationHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)targetIsRegistering
{
  return self->_targetIsRegistering;
}

- (void)setTargetIsRegistering:(BOOL)a3
{
  self->_targetIsRegistering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registrationHandler, 0);
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_clientListener, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __37__XCTTargetSession__on_queue_connect__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212A06000, log, OS_LOG_TYPE_ERROR, "Connection to test daemon interrupted.", v1, 2u);
}

void __37__XCTTargetSession__on_queue_connect__block_invoke_274_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end