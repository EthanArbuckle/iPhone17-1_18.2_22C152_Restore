@interface SUCoreConnectServer
- (BOOL)isConnectionEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)connections;
- (NSMutableSet)observerConnections;
- (NSString)description;
- (OS_dispatch_queue)connectionSendMessageQueue;
- (OS_dispatch_queue)connectionsAccessQueue;
- (SUCoreConnectServer)initWithServerPolicy:(id)a3;
- (SUCoreConnectServerPolicy)connectionPolicy;
- (SUCoreLog)logger;
- (id)_clientIDForConnection:(id)a3;
- (id)_connectionsForClientID:(id)a3;
- (id)_getAllObserverConnections;
- (void)_informObserversOfCompletionReplyWithMessage:(id)a3 error:(id)a4;
- (void)_removeConnection:(id)a3;
- (void)_setConnection:(id)a3 forClientID:(id)a4;
- (void)connectProtocolFromClientSendServerMessage:(id)a3;
- (void)connectProtocolFromClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5;
- (void)connectServerSendClientMessage:(id)a3;
- (void)setupListenerAndResumeConnection;
@end

@implementation SUCoreConnectServer

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_89(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setConnection:*(void *)(a1 + 40) forClientID:*(void *)(a1 + 48)];
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_85(int8x16_t *a1)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_86;
  v8[3] = &unk_264188238;
  int8x16_t v4 = a1[2];
  int8x16_t v9 = vextq_s8(v4, v4, 8uLL);
  v2 = [(id)v4.i64[0] remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_88;
  v6[3] = &unk_264188288;
  int8x16_t v5 = a1[2];
  id v3 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 connectProtocolFromServerRequestClientID:v6];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v48[2] = *(id *)MEMORY[0x263EF8340];
  id v34 = a3;
  id v6 = a4;
  int8x16_t v7 = [(SUCoreConnectServer *)self logger];
  v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_210A6A000, v8, OS_LOG_TYPE_DEFAULT, "[ListenerNewConnection](%{public}@) Attempting to connect with new connection", (uint8_t *)&buf, 0xCu);
  }

  int8x16_t v9 = [(SUCoreConnectServer *)self connectionPolicy];
  v10 = [v9 serverDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(SUCoreConnectServer *)self connectionPolicy];
    v13 = [v12 serverDelegate];
    char v14 = [v13 isConnectionAuthorized:v6];

    if ((v14 & 1) == 0)
    {
      v15 = [(SUCoreConnectServer *)self logger];
      v16 = [v15 oslog];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SUCoreConnectServer listener:shouldAcceptNewConnection:]();
      }
LABEL_14:

      [v6 invalidate];
      BOOL v30 = 0;
      goto LABEL_15;
    }
  }
  else if (![(SUCoreConnectServer *)self isConnectionEntitled:v6])
  {
    v31 = [(SUCoreConnectServer *)self logger];
    v16 = [v31 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer listener:shouldAcceptNewConnection:]();
    }
    goto LABEL_14;
  }
  v17 = [(SUCoreConnectServer *)self connectionPolicy];
  v18 = [v17 connectionQueue];
  [v6 _setQueue:v18];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3042000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48[0] = 0;
  objc_initWeak(v48, self);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3042000000;
  v40[3] = __Block_byref_object_copy__0;
  v40[4] = __Block_byref_object_dispose__0;
  id v41 = 0;
  objc_initWeak(&v41, v6);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke;
  v39[3] = &unk_264188210;
  v39[4] = &buf;
  v39[5] = v40;
  v33 = (void *)MEMORY[0x216679110](v39);
  [v6 setInterruptionHandler:v33];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v38[3] = &unk_264188210;
  v38[4] = &buf;
  v38[5] = v40;
  v19 = (void *)MEMORY[0x216679110](v38);
  [v6 setInvalidationHandler:v19];
  v20 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C30FB48];
  v21 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C3100A8];
  v22 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v20 setClasses:v22 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:0 ofReply:0];

  v23 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v20 setClasses:v23 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:1 ofReply:0];

  v24 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v20 setClasses:v24 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:0 ofReply:1];

  v25 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v20 setClasses:v25 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:1 ofReply:1];

  [v20 setInterface:v21 forSelector:sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_ argumentIndex:1 ofReply:0];
  [v6 setExportedInterface:v20];
  [v6 setExportedObject:self];
  v26 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C310540];
  [v6 setRemoteObjectInterface:v26];
  [v6 resume];
  v27 = [(SUCoreConnectServer *)self logger];
  v28 = [v27 oslog];

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v42 = 138543362;
    id v43 = v6;
    _os_log_impl(&dword_210A6A000, v28, OS_LOG_TYPE_DEFAULT, "[ListenerNewConnection](%{public}@) Resumed connection, requesting clientID", v42, 0xCu);
  }

  v29 = [(SUCoreConnectServer *)self connectionSendMessageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_85;
  block[3] = &unk_2641881E8;
  id v36 = v6;
  v37 = self;
  dispatch_async(v29, block);

  _Block_object_dispose(v40, 8);
  objc_destroyWeak(&v41);
  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(v48);
  BOOL v30 = 1;
LABEL_15:

  return v30;
}

- (OS_dispatch_queue)connectionSendMessageQueue
{
  return self->_connectionSendMessageQueue;
}

- (void)connectProtocolFromClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  char v11 = [(SUCoreConnectServer *)self logger];
  v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = @"YES";
    if (v9) {
      char v14 = @"YES";
    }
    else {
      char v14 = @"NO";
    }
    *(_DWORD *)long long buf = 138543874;
    id v54 = v8;
    v56 = v14;
    __int16 v55 = 2114;
    if (!v10) {
      v13 = @"NO";
    }
    __int16 v57 = 2114;
    v58 = v13;
    _os_log_impl(&dword_210A6A000, v12, OS_LOG_TYPE_DEFAULT, "[SendServerMessage] Received message: %{public}@ (proxyObject:%{public}@, reply:%{public}@)", buf, 0x20u);
  }

  v15 = [MEMORY[0x263F08D68] currentConnection];
  v16 = [v8 clientID];
  int v17 = [v16 isEqualToString:@"*"];

  if (v17)
  {
    v18 = (void *)[[NSString alloc] initWithFormat:@"[SendServerMessage](%@) Observer clients cannot send messages to server", v15];
    v19 = [MEMORY[0x263F77D78] sharedCore];
    v20 = [v19 buildError:8906 underlying:0 description:v18];

    [(SUCoreConnectServer *)self _informObserversOfCompletionReplyWithMessage:v8 error:v20];
    v21 = [(SUCoreConnectServer *)self logger];
    v22 = [v21 oslog];

    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v23) {
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    if (v23) {
      -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:]();
    }
    goto LABEL_32;
  }
  v24 = [(SUCoreConnectServer *)self connectionPolicy];
  v25 = [v24 serverDelegate];
  char v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0)
  {
    v18 = (void *)[[NSString alloc] initWithFormat:@"[SendServerMessage](%@) handleMessage selector is not implemented by server delegate", v15];
    v27 = [MEMORY[0x263F77D78] sharedCore];
    v20 = [v27 buildError:8113 underlying:0 description:v18];

    [(SUCoreConnectServer *)self _informObserversOfCompletionReplyWithMessage:v8 error:v20];
    v28 = [(SUCoreConnectServer *)self logger];
    v22 = [v28 oslog];

    BOOL v29 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v29) {
LABEL_17:
      }
        -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:]();
LABEL_18:

      v10[2](v10, 0, v20);
LABEL_33:

      goto LABEL_39;
    }
    if (v29) {
      -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:]();
    }
LABEL_32:

    goto LABEL_33;
  }
  if (v15)
  {
    [v15 auditToken];
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
  }
  v50[0] = v51;
  v50[1] = v52;
  [v8 setClientConnectionAuditToken:v50];
  BOOL v30 = [(SUCoreConnectServer *)self connectionPolicy];
  v31 = [v30 serverDelegate];
  char v32 = objc_opt_respondsToSelector();

  if (v32)
  {
    v33 = [(SUCoreConnectServer *)self logger];
    id v34 = [v33 oslog];

    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v54 = v15;
      _os_log_impl(&dword_210A6A000, v34, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage using isConnection:authorizedForMessage: via server delegate", buf, 0xCu);
    }

    v35 = [(SUCoreConnectServer *)self connectionPolicy];
    id v36 = [v35 serverDelegate];
    char v37 = [v36 isConnection:v15 authorizedForMessage:v8];

    if ((v37 & 1) == 0)
    {
      v38 = (void *)[[NSString alloc] initWithFormat:@"[SendServerMessage](%@) client is not entitled for specific message request", v15];
      v39 = [MEMORY[0x263F77D78] sharedCore];
      v40 = [v39 buildError:8113 underlying:0 description:v38];

      [(SUCoreConnectServer *)self _informObserversOfCompletionReplyWithMessage:v8 error:v40];
      id v41 = [(SUCoreConnectServer *)self logger];
      v42 = [v41 oslog];

      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
      if (v10)
      {
        if (v43) {
          -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:]();
        }

        v10[2](v10, 0, v40);
      }
      else
      {
        if (v43) {
          -[SUCoreConnectServer connectProtocolFromClientSendServerMessage:proxyObject:withReply:]();
        }
      }
    }
  }
  v44 = [(SUCoreConnectServer *)self connectionPolicy];
  uint64_t v45 = [v44 serverDelegate];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __88__SUCoreConnectServer_connectProtocolFromClientSendServerMessage_proxyObject_withReply___block_invoke;
  v46[3] = &unk_2641882D8;
  v46[4] = self;
  id v47 = v8;
  v49 = v10;
  id v48 = v15;
  [v45 handleMessage:v47 proxyObject:v9 reply:v46];

LABEL_39:
}

- (SUCoreConnectServerPolicy)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)_setConnection:(id)a3 forClientID:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreConnectServer *)self connectionsAccessQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(SUCoreConnectServer *)self logger];
  v10 = [v9 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v34 = 138543618;
    *(void *)&v34[4] = v7;
    __int16 v35 = 2114;
    id v36 = v6;
    _os_log_impl(&dword_210A6A000, v10, OS_LOG_TYPE_DEFAULT, "[SetConnection] Attempting to set new clientID: %{public}@, for connection: %{public}@", v34, 0x16u);
  }

  if (v6)
  {
    if ([v7 isEqualToString:@"*"])
    {
      char v11 = [(SUCoreConnectServer *)self logger];
      v12 = [v11 oslog];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v34 = 138543362;
        *(void *)&v34[4] = v6;
        _os_log_impl(&dword_210A6A000, v12, OS_LOG_TYPE_DEFAULT, "[SetConnection] Adding new observable connection: %{public}@", v34, 0xCu);
      }

      *(void *)id v34 = 0;
      objc_initWeak((id *)v34, v6);
      v13 = [(SUCoreConnectServer *)self observerConnections];
      id WeakRetained = objc_loadWeakRetained((id *)v34);
      [v13 addObject:WeakRetained];

      objc_destroyWeak((id *)v34);
    }
    else
    {
      int v17 = [(SUCoreConnectServer *)self connections];
      v18 = [v17 safeObjectForKey:v7 ofClass:objc_opt_class()];

      v19 = [(SUCoreConnectServer *)self logger];
      v20 = [v19 oslog];

      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          uint64_t v22 = [v18 count];
          *(_DWORD *)id v34 = 134218242;
          *(void *)&v34[4] = v22;
          __int16 v35 = 2114;
          id v36 = v7;
          _os_log_impl(&dword_210A6A000, v20, OS_LOG_TYPE_DEFAULT, "[SetConnection] Found %lu existing connections for clientID: %{public}@", v34, 0x16u);
        }

        int v23 = [v18 containsObject:v6];
        v24 = [(SUCoreConnectServer *)self logger];
        v25 = [v24 oslog];

        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v26)
          {
            *(_DWORD *)id v34 = 138543362;
            *(void *)&v34[4] = v7;
            _os_log_impl(&dword_210A6A000, v25, OS_LOG_TYPE_DEFAULT, "[SetConnection] Same connection already exists for clientID: %{public}@", v34, 0xCu);
          }
        }
        else
        {
          if (v26)
          {
            *(_DWORD *)id v34 = 138543618;
            *(void *)&v34[4] = v7;
            __int16 v35 = 2114;
            id v36 = v6;
            _os_log_impl(&dword_210A6A000, v25, OS_LOG_TYPE_DEFAULT, "[SetConnection] Setting new connection (to existing set) for clientID: %{public}@, newConnection: %{public}@", v34, 0x16u);
          }

          *(void *)id v34 = 0;
          objc_initWeak((id *)v34, v6);
          v31 = [(SUCoreConnectServer *)self connections];
          id v32 = objc_loadWeakRetained((id *)v34);
          v33 = [v18 setByAddingObject:v32];
          [v31 setSafeObject:v33 forKey:v7];

          objc_destroyWeak((id *)v34);
        }
      }
      else
      {
        if (v21)
        {
          *(_DWORD *)id v34 = 138543618;
          *(void *)&v34[4] = v7;
          __int16 v35 = 2114;
          id v36 = v6;
          _os_log_impl(&dword_210A6A000, v20, OS_LOG_TYPE_DEFAULT, "[SetConnection] Setting new connection (to new set) for clientID: %{public}@, newConnection: %{public}@", v34, 0x16u);
        }

        *(void *)id v34 = 0;
        objc_initWeak((id *)v34, v6);
        v27 = [(SUCoreConnectServer *)self connections];
        v28 = (void *)MEMORY[0x263EFFA08];
        id v29 = objc_loadWeakRetained((id *)v34);
        BOOL v30 = [v28 setWithObject:v29];
        [v27 setSafeObject:v30 forKey:v7];

        objc_destroyWeak((id *)v34);
      }
    }
  }
  else
  {
    v15 = [(SUCoreConnectServer *)self logger];
    v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer _setConnection:forClientID:]();
    }
  }
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int8x16_t v4 = [*(id *)(a1 + 32) logger];
  int8x16_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_210A6A000, v5, OS_LOG_TYPE_DEFAULT, "[ListenerNewConnection](%{public}@) Completion successfully received for request of clientID: %{public}@", buf, 0x16u);
  }

  id v7 = [*(id *)(a1 + 32) connectionsAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_89;
  block[3] = &unk_264188260;
  id v8 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v8;
  id v12 = v3;
  id v9 = v3;
  dispatch_async(v7, block);
}

- (OS_dispatch_queue)connectionsAccessQueue
{
  return self->_connectionsAccessQueue;
}

- (SUCoreConnectServer)initWithServerPolicy:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUCoreConnectServer;
  uint64_t v6 = [(SUCoreConnectServer *)&v27 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionPolicy, a3);
    id v8 = objc_alloc(MEMORY[0x263F77DE8]);
    id v9 = NSString;
    v10 = [v5 serviceName];
    id v11 = [v9 stringWithFormat:@"SERVER-%@", v10];
    uint64_t v12 = [v8 initWithCategory:v11];
    logger = v7->_logger;
    v7->_logger = (SUCoreLog *)v12;

    uint64_t v14 = (const char *)[@"com.apple.SUCoreConnect.ConnectionsAccessQueue" UTF8String];
    __int16 v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    connectionsAccessQueue = v7->_connectionsAccessQueue;
    v7->_connectionsAccessQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    connections = v7->_connections;
    v7->_connections = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    observerConnections = v7->_observerConnections;
    v7->_observerConnections = v20;

    uint64_t v22 = (const char *)[@"com.apple.SUCoreConnect.ConnectionSendMessageQueue" UTF8String];
    int v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    connectionSendMessageQueue = v7->_connectionSendMessageQueue;
    v7->_connectionSendMessageQueue = (OS_dispatch_queue *)v24;
  }
  return v7;
}

- (BOOL)isConnectionEntitled:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUCoreConnectServer *)self connectionPolicy];

  if (!v5)
  {
    dispatch_queue_t v24 = [(SUCoreConnectServer *)self logger];
    v13 = [v24 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer isConnectionEntitled:]();
    }
    goto LABEL_31;
  }
  uint64_t v6 = [(SUCoreConnectServer *)self connectionPolicy];
  uint64_t v7 = [v6 entitlements];
  if (!v7)
  {

LABEL_20:
    v25 = [(SUCoreConnectServer *)self logger];
    v13 = [v25 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectServer isConnectionEntitled:]();
    }
LABEL_31:
    BOOL v23 = 0;
    goto LABEL_32;
  }
  id v8 = (void *)v7;
  id v9 = [(SUCoreConnectServer *)self connectionPolicy];
  v10 = [v9 entitlements];
  uint64_t v11 = [v10 count];

  if (!v11) {
    goto LABEL_20;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v12 = [(SUCoreConnectServer *)self connectionPolicy];
  v13 = [v12 entitlements];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v14)
  {
    BOOL v23 = 1;
    goto LABEL_32;
  }
  uint64_t v16 = v14;
  uint64_t v17 = *(void *)v34;
  *(void *)&long long v15 = 138543618;
  long long v32 = v15;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
      v20 = [(SUCoreConnectServer *)self logger];
      BOOL v21 = [v20 oslog];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = v32;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        _os_log_impl(&dword_210A6A000, v21, OS_LOG_TYPE_DEFAULT, "[EntitlementValidation](%{public}@)(%@) Checking for entitlement", buf, 0x16u);
      }

      uint64_t v22 = [v4 valueForEntitlement:v19];
      if (!v22)
      {
        BOOL v26 = [(SUCoreConnectServer *)self logger];
        objc_super v27 = [v26 oslog];

        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        *(_DWORD *)long long buf = v32;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        v28 = "[EntitlementValidation](%{public}@)(%@) Client process does not have the entitlement";
LABEL_29:
        _os_log_impl(&dword_210A6A000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v29 = [(SUCoreConnectServer *)self logger];
        objc_super v27 = [v29 oslog];

        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        *(_DWORD *)long long buf = v32;
        id v38 = v4;
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        v28 = "[EntitlementValidation](%{public}@)(%@) New connection's entitlement is not a BOOLean";
        goto LABEL_29;
      }
      if (([v22 BOOLValue] & 1) == 0)
      {
        BOOL v30 = [(SUCoreConnectServer *)self logger];
        objc_super v27 = [v30 oslog];

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v32;
          id v38 = v4;
          __int16 v39 = 2112;
          uint64_t v40 = v19;
          v28 = "[EntitlementValidation](%{public}@)(%@) New connection's value for entitlement is false";
          goto LABEL_29;
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    uint64_t v16 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
    BOOL v23 = 1;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_32:

  return v23;
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = [WeakRetained logger];
      uint64_t v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        long long v15 = v4;
        _os_log_impl(&dword_210A6A000, v6, OS_LOG_TYPE_DEFAULT, "[InterruptedHandler](%{public}@) Client connection interrupted, removing from connections list", buf, 0xCu);
      }

      uint64_t v7 = [WeakRetained connectionsAccessQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_13;
      v11[3] = &unk_2641881E8;
      uint64_t v12 = WeakRetained;
      id v13 = v4;
      dispatch_async(v7, v11);

      id v8 = v12;
    }
    else
    {
      v10 = [MEMORY[0x263F77DE8] sharedLogger];
      id v8 = [v10 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    id v8 = [v9 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
    }
  }
}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeConnection:*(void *)(a1 + 40)];
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = [WeakRetained logger];
      uint64_t v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        long long v15 = v4;
        _os_log_impl(&dword_210A6A000, v6, OS_LOG_TYPE_DEFAULT, "[InvalidatedHandler](%{public}@) Client connection invalidated, removing from connections list", buf, 0xCu);
      }

      uint64_t v7 = [WeakRetained connectionsAccessQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_15;
      v11[3] = &unk_2641881E8;
      uint64_t v12 = WeakRetained;
      id v13 = v4;
      dispatch_async(v7, v11);

      id v8 = v12;
    }
    else
    {
      v10 = [MEMORY[0x263F77DE8] sharedLogger];
      id v8 = [v10 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_2();
      }
    }
  }
  else
  {
    id v9 = [MEMORY[0x263F77DE8] sharedLogger];
    id v8 = [v9 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_1();
    }
  }
}

uint64_t __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeConnection:*(void *)(a1 + 40)];
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_86_cold_1(a1, (uint64_t)v3, v5);
  }

  [*(id *)(a1 + 40) invalidate];
}

- (void)setupListenerAndResumeConnection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUCoreConnectServer_setupListenerAndResumeConnection__block_invoke;
  block[3] = &unk_2641882B0;
  void block[4] = self;
  if (setupListenerAndResumeConnection_onceToken != -1) {
    dispatch_once(&setupListenerAndResumeConnection_onceToken, block);
  }
}

void __55__SUCoreConnectServer_setupListenerAndResumeConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) connectionPolicy];
    int v13 = 138543362;
    uint64_t v14 = v4;
    _os_log_impl(&dword_210A6A000, v3, OS_LOG_TYPE_DEFAULT, "[ListenerStartup] Setting up listener, enabling transactions, and resuming connection using policy: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  [MEMORY[0x263F08D88] enableTransactions];
  id v5 = objc_alloc(MEMORY[0x263F08D88]);
  uint64_t v6 = [*(id *)(a1 + 32) connectionPolicy];
  uint64_t v7 = [v6 serviceName];
  id v8 = (void *)[v5 initWithMachServiceName:v7];

  [v8 setDelegate:*(void *)(a1 + 32)];
  id v9 = [*(id *)(a1 + 32) connectionPolicy];
  v10 = [v9 connectionQueue];
  [v8 _setQueue:v10];

  [v8 resume];
  uint64_t v11 = [*(id *)(a1 + 32) logger];
  uint64_t v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_210A6A000, v12, OS_LOG_TYPE_DEFAULT, "[ListenerStartup] Listener connection resumed, setup completed.", (uint8_t *)&v13, 2u);
  }
}

- (void)connectProtocolFromClientSendServerMessage:(id)a3
{
}

void __88__SUCoreConnectServer_connectProtocolFromClientSendServerMessage_proxyObject_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _informObserversOfCompletionReplyWithMessage:*(void *)(a1 + 40) error:v6];
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) logger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = [v6 checkedDescription];
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v5;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_210A6A000, v9, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage was not provided a reply block, response:%{public}@ error:%{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_informObserversOfCompletionReplyWithMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreConnectServer *)self connectionsAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke;
  block[3] = &unk_264188260;
  id v12 = v6;
  id v13 = v7;
  __int16 v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setSafeObject:*(void *)(a1 + 32) forKey:@"SUCoreConnectMonitorReplyMessage"];
  [v2 setSafeObject:*(void *)(a1 + 40) forKey:@"SUCoreConnectMonitorReplyError"];
  id v3 = [SUCoreConnectMessage alloc];
  uint64_t v4 = [*(id *)(a1 + 32) messageType];
  id v5 = [*(id *)(a1 + 32) messageName];
  id v6 = [*(id *)(a1 + 32) clientID];
  id v7 = [*(id *)(a1 + 32) version];
  id v8 = [(SUCoreConnectMessage *)v3 initWithType:v4 messageName:v5 clientID:v6 version:v7 message:v2];

  id v9 = [*(id *)(a1 + 48) _getAllObserverConnections];
  id v10 = v9;
  if (v9 && [v9 count])
  {
    v20 = v10;
    id v21 = v2;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          __int16 v16 = objc_msgSend(*(id *)(a1 + 48), "logger", v20, v21);
          uint64_t v17 = [v16 oslog];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v30 = v15;
            _os_log_impl(&dword_210A6A000, v17, OS_LOG_TYPE_DEFAULT, "[InformObserversOfReplyCompletion] Attempting to send message (no reply expected) to observer client with connection %{public}@", buf, 0xCu);
          }

          uint64_t v18 = [*(id *)(a1 + 48) connectionSendMessageQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_114;
          block[3] = &unk_264188260;
          uint64_t v19 = *(void *)(a1 + 48);
          void block[4] = v15;
          void block[5] = v19;
          dispatch_queue_t v24 = v8;
          dispatch_async(v18, block);
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v12);
    }

    id v10 = v20;
    id v2 = v21;
  }
}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_114(int8x16_t *a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_2;
  v4[3] = &unk_264188238;
  int8x16_t v2 = a1[2];
  int8x16_t v5 = vextq_s8(v2, v2, 8uLL);
  id v3 = [(id)v2.i64[0] remoteObjectProxyWithErrorHandler:v4];
  [v3 connectProtocolFromServerSendClientMessage:a1[3].i64[0]];
}

void __74__SUCoreConnectServer__informObserversOfCompletionReplyWithMessage_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) logger];
  int8x16_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [v3 checkedDescription];
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_210A6A000, v5, OS_LOG_TYPE_DEFAULT, "[InformObserversOfReplyCompletion] ErrorHandler: Connection failed (no completion was expected to be called) for observer client connection %{public}@ with error %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) invalidate];
}

- (void)connectServerSendClientMessage:(id)a3
{
  id v4 = a3;
  int8x16_t v5 = [(SUCoreConnectServer *)self connectionsAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke;
  v7[3] = &unk_2641881E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  int8x16_t v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 138543362;
    long long v52 = v4;
    _os_log_impl(&dword_210A6A000, v3, OS_LOG_TYPE_DEFAULT, "[SendClientMessage] Method called to send message: %{public}@", buf, 0xCu);
  }

  long long v35 = (id *)(a1 + 40);
  int8x16_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) clientID];
  id v7 = [v5 _connectionsForClientID:v6];

  if (v7)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      long long v33 = v7;
      uint64_t v10 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v13 = [*(id *)(a1 + 32) logger];
          __int16 v14 = [v13 oslog];

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = [*v35 clientID];
            *(_DWORD *)long long buf = 138543618;
            long long v52 = v15;
            __int16 v53 = 2114;
            uint64_t v54 = v12;
            _os_log_impl(&dword_210A6A000, v14, OS_LOG_TYPE_DEFAULT, "[SendClientMessage] Attempting to send message (no reply expected) to client %{public}@ with connection %{public}@", buf, 0x16u);
          }
          __int16 v16 = [*(id *)(a1 + 32) connectionSendMessageQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_115;
          block[3] = &unk_264188260;
          uint64_t v17 = *(void *)(a1 + 32);
          uint64_t v18 = *(void **)(a1 + 40);
          void block[4] = v12;
          void block[5] = v17;
          id v45 = v18;
          dispatch_async(v16, block);
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v9);
      id v7 = v33;
    }
  }
  else
  {
    uint64_t v19 = [*(id *)(a1 + 32) logger];
    v20 = [v19 oslog];

    id obj = v20;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_cold_1(v35, v20);
    }
  }

  id v21 = [*(id *)(a1 + 32) _getAllObserverConnections];
  uint64_t v22 = v21;
  if (v21 && [v21 count])
  {
    long long v34 = v7;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obja = v22;
    uint64_t v23 = [obja countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(obja);
          }
          long long v27 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          long long v28 = [*(id *)(a1 + 32) logger];
          id v29 = [v28 oslog];

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            long long v52 = v27;
            _os_log_impl(&dword_210A6A000, v29, OS_LOG_TYPE_DEFAULT, "[SendClientMessage] Attempting to send message (no reply expected) to observer client with connection %{public}@", buf, 0xCu);
          }

          uint64_t v30 = [*(id *)(a1 + 32) connectionSendMessageQueue];
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_116;
          v38[3] = &unk_264188260;
          uint64_t v31 = *(void *)(a1 + 32);
          uint64_t v32 = *(void **)(a1 + 40);
          v38[4] = v27;
          v38[5] = v31;
          id v39 = v32;
          dispatch_async(v30, v38);
        }
        uint64_t v24 = [obja countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v24);
    }

    id v7 = v34;
  }
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_115(void *a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2;
  v7[3] = &unk_264188300;
  int8x16_t v2 = (void *)a1[4];
  id v3 = (void *)a1[6];
  v7[4] = a1[5];
  id v4 = v3;
  uint64_t v5 = a1[4];
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = [v2 remoteObjectProxyWithErrorHandler:v7];
  [v6 connectProtocolFromServerSendClientMessage:a1[6]];
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logger];
  uint64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_cold_1(a1, v3, v5);
  }

  [*(id *)(a1 + 48) invalidate];
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_116(int8x16_t *a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_117;
  v4[3] = &unk_264188238;
  int8x16_t v2 = a1[2];
  int8x16_t v5 = vextq_s8(v2, v2, 8uLL);
  id v3 = [(id)v2.i64[0] remoteObjectProxyWithErrorHandler:v4];
  [v3 connectProtocolFromServerSendClientMessage:a1[3].i64[0]];
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_117(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logger];
  int8x16_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_117_cold_1(a1, v3);
  }

  [*(id *)(a1 + 40) invalidate];
}

- (id)_getAllObserverConnections
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(SUCoreConnectServer *)self connectionsAccessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SUCoreConnectServer *)self logger];
  int8x16_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SUCoreConnectServer *)self observerConnections];
    int v9 = 134217984;
    uint64_t v10 = [v6 count];
    _os_log_impl(&dword_210A6A000, v5, OS_LOG_TYPE_DEFAULT, "[GetAllObserverConnections] Returning %lu observable connections", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(SUCoreConnectServer *)self observerConnections];
  return v7;
}

- (void)_removeConnection:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int8x16_t v5 = [(SUCoreConnectServer *)self connectionsAccessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SUCoreConnectServer *)self logger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(SUCoreConnectServer *)self connections];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v34 = [v8 count];
    __int16 v35 = 2114;
    id v36 = v4;
    _os_log_impl(&dword_210A6A000, v7, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] From %lu clientIDs currently connected, attempting to remove connection: %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    int v9 = [(SUCoreConnectServer *)self observerConnections];
    int v10 = [v9 containsObject:v4];

    if (v10)
    {
      uint64_t v11 = [(SUCoreConnectServer *)self logger];
      uint64_t v12 = [v11 oslog];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v34 = (uint64_t)v4;
        _os_log_impl(&dword_210A6A000, v12, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Removing observable connection: %{public}@", buf, 0xCu);
      }

      uint64_t v13 = [(SUCoreConnectServer *)self observerConnections];
      [v13 removeObject:v4];

      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  __int16 v14 = [(SUCoreConnectServer *)self _clientIDForConnection:v4];
  if (v14)
  {
    uint64_t v15 = [(SUCoreConnectServer *)self logger];
    __int16 v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v34 = (uint64_t)v14;
      __int16 v35 = 2114;
      id v36 = v4;
      _os_log_impl(&dword_210A6A000, v16, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Removing connection for clientID: %{public}@, connection: %{public}@", buf, 0x16u);
    }

    uint64_t v17 = [(SUCoreConnectServer *)self connections];
    uint64_t v18 = [v17 safeObjectForKey:v14 ofClass:objc_opt_class()];
    uint64_t v19 = [v18 mutableCopy];

    if ([v19 containsObject:v4]) {
      [v19 removeObject:v4];
    }
    uint64_t v20 = [v19 count];
    id v21 = [(SUCoreConnectServer *)self logger];
    uint64_t v22 = [v21 oslog];

    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v23)
      {
        uint64_t v24 = [v19 count];
        *(_DWORD *)long long buf = 134218498;
        uint64_t v34 = v24;
        __int16 v35 = 2114;
        id v36 = v14;
        __int16 v37 = 2114;
        id v38 = v19;
        _os_log_impl(&dword_210A6A000, v22, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Set remaining %lu connections for clientID: %{public}@, connections: %{public}@", buf, 0x20u);
      }

      uint64_t v25 = [(SUCoreConnectServer *)self connections];
      [v25 setSafeObject:v19 forKey:v14];
    }
    else
    {
      if (v23)
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v34 = (uint64_t)v14;
        _os_log_impl(&dword_210A6A000, v22, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] No remaining connections for clientID: %{public}@", buf, 0xCu);
      }

      uint64_t v25 = [(SUCoreConnectServer *)self connections];
      [v25 removeObjectForKey:v14];
    }
  }
  else
  {
    if (v10) {
      goto LABEL_26;
    }
    long long v26 = [(SUCoreConnectServer *)self logger];
    uint64_t v19 = [v26 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v34 = (uint64_t)v4;
      _os_log_impl(&dword_210A6A000, v19, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Unable to locate the clientID for connection: %{public}@", buf, 0xCu);
    }
  }

LABEL_26:
  long long v27 = [(SUCoreConnectServer *)self connectionPolicy];
  long long v28 = [v27 serverDelegate];
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    uint64_t v30 = [(SUCoreConnectServer *)self connectionSendMessageQueue];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __41__SUCoreConnectServer__removeConnection___block_invoke;
    v31[3] = &unk_2641881E8;
    v31[4] = self;
    id v32 = v14;
    dispatch_async(v30, v31);
  }
}

void __41__SUCoreConnectServer__removeConnection___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int8x16_t v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_210A6A000, v3, OS_LOG_TYPE_DEFAULT, "[RemoveConnection] Informing server of connection disconnect for clientID: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  int8x16_t v5 = [*(id *)(a1 + 32) connectionPolicy];
  id v6 = [v5 serverDelegate];
  [v6 connectionClosedForClientID:*(void *)(a1 + 40)];
}

- (id)_connectionsForClientID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int8x16_t v5 = [(SUCoreConnectServer *)self connectionsAccessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SUCoreConnectServer *)self connections];
  int v7 = [v6 safeObjectForKey:v4 ofClass:objc_opt_class()];

  uint64_t v8 = [(SUCoreConnectServer *)self logger];
  uint64_t v9 = [v8 oslog];

  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(SUCoreConnectServer *)self connections];
      int v12 = 134218754;
      uint64_t v13 = [v10 count];
      __int16 v14 = 2048;
      uint64_t v15 = [v7 count];
      __int16 v16 = 2114;
      id v17 = v4;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl(&dword_210A6A000, v9, OS_LOG_TYPE_DEFAULT, "[ConnectionForClientID] From %lu clientIDs, %lu connections located for clientID: %{public}@, connections: %{public}@", (uint8_t *)&v12, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SUCoreConnectServer _connectionsForClientID:](self);
  }

  return v7;
}

- (id)_clientIDForConnection:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int8x16_t v5 = [(SUCoreConnectServer *)self connectionsAccessQueue];
  dispatch_assert_queue_V2(v5);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v26 = self;
  id v6 = [(SUCoreConnectServer *)self connections];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v32;
    id obj = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = [(SUCoreConnectServer *)v26 connections];
        __int16 v14 = [v13 safeObjectForKey:v12 ofClass:objc_opt_class()];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              if ([v4 isEqual:*(void *)(*((void *)&v27 + 1) + 8 * j)])
              {
                id v20 = v12;

                uint64_t v9 = v20;
                goto LABEL_16;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v8);

    if (v9)
    {
      id v21 = [(SUCoreConnectServer *)v26 logger];
      uint64_t v22 = [v21 oslog];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v36 = v9;
        __int16 v37 = 2114;
        id v38 = v4;
        _os_log_impl(&dword_210A6A000, v22, OS_LOG_TYPE_DEFAULT, "[ClientIDForConnection] Located clientID: %{public}@, for connection: %{public}@", buf, 0x16u);
      }
      goto LABEL_25;
    }
  }
  else
  {
  }
  BOOL v23 = [(SUCoreConnectServer *)v26 logger];
  uint64_t v22 = [v23 oslog];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[SUCoreConnectServer _clientIDForConnection:]();
  }
  uint64_t v9 = 0;
LABEL_25:

  return v9;
}

- (NSString)description
{
  int8x16_t v2 = NSString;
  id v3 = [(SUCoreConnectServer *)self connectionPolicy];
  id v4 = [v2 stringWithFormat:@"SUCoreConnectServer(connectionPolicy:%@)", v3];

  return (NSString *)v4;
}

- (NSMutableSet)observerConnections
{
  return self->_observerConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionSendMessageQueue, 0);
  objc_storeStrong((id *)&self->_observerConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionsAccessQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
}

- (void)isConnectionEntitled:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_210A6A000, v0, v1, "[EntitlementValidation](%{public}@) No connection policy provided, unable to determine what entitlements are required for new connection", v2, v3, v4, v5, v6);
}

- (void)isConnectionEntitled:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_210A6A000, v0, v1, "[EntitlementValidation](%{public}@) Policy did not define entitlements; unable to determine entitlements and one is "
    "always required for new connection",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_210A6A000, v0, v1, "[ListenerNewConnection](%{public}@) Rejecting connection - client is not entitled correctly per server delegate", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_210A6A000, v0, v1, "[ListenerNewConnection](%{public}@) Rejecting connection - client is not entitled correctly", v2, v3, v4, v5, v6);
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_210A6A000, v0, v1, "[InterruptedHandler] Server connection interrupted to XPC client, found no retained server object available", v2, v3, v4, v5, v6);
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_210A6A000, v0, v1, "[InterruptedHandler] Server connection interrupted to XPC client, found no retained connection object available", v2, v3, v4, v5, v6);
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_210A6A000, v0, v1, "[InvalidatedHandler] Server connection invalidated to XPC client, found no retained server object available", v2, v3, v4, v5, v6);
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_210A6A000, v0, v1, "[InvalidatedHandler] Server connection invalidated to XPC client, found no retained connection object available", v2, v3, v4, v5, v6);
}

void __58__SUCoreConnectServer_listener_shouldAcceptNewConnection___block_invoke_2_86_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_8(&dword_210A6A000, a2, a3, "[ListenerNewConnection](%{public}@) ErrorHandler: Failed to receive clientID when requested for new connection, error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_210A6A000, v0, v1, "[SendServerMessage](%{public}@) Observer clients cannot send messages to server, error: %{public}@");
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(v0, v1), "checkedDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A6A000, v3, v4, "[SendServerMessage](%{public}@) Calling completion block with error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)connectProtocolFromClientSendServerMessage:proxyObject:withReply:.cold.3()
{
  OUTLINED_FUNCTION_6();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5(v0, v1), "checkedDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A6A000, v3, v4, "[SendServerMessage](%{public}@) connectProtocolFromClientSendServerMessage was not provided a reply block, error:%{public}@", v5, v6, v7, v8, v9);
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 clientID];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_210A6A000, a2, OS_LOG_TYPE_ERROR, "[SendClientMessage] Unable to send message, no connection could be located for clientID: %{public}@", v4, 0xCu);
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [*(id *)(a1 + 40) clientID];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [a2 checkedDescription];
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  __int16 v14 = v8;
  _os_log_error_impl(&dword_210A6A000, a3, OS_LOG_TYPE_ERROR, "[SendClientMessage] ErrorHandler: Connection failed (no completion was expected to be called) for client with clientID: %{public}@ %{public}@ with error %{public}@", (uint8_t *)&v9, 0x20u);
}

void __54__SUCoreConnectServer_connectServerSendClientMessage___block_invoke_2_117_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 checkedDescription];
  OUTLINED_FUNCTION_0(&dword_210A6A000, v2, v3, "[SendClientMessage] ErrorHandler: Connection failed (no completion was expected to be called) for observer client connection %{public}@ with error %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_setConnection:forClientID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_210A6A000, v0, v1, "[SetConnection] New connection to add is nil, aborting", v2, v3, v4, v5, v6);
}

- (void)_connectionsForClientID:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 connections];
  [v1 count];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_210A6A000, v2, v3, "[ConnectionForClientID] From %lu current clientIDs, no connection was located for clientID: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_clientIDForConnection:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_210A6A000, v0, v1, "[ClientIDForConnection] No clientID located for connection: %{public}@", v2, v3, v4, v5, v6);
}

@end