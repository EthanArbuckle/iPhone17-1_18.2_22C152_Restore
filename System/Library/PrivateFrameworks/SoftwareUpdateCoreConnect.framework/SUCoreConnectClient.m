@interface SUCoreConnectClient
+ (id)_sharedClientLogger;
- (NSXPCConnection)serverConnection;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_dispatch_queue)clientConnectionStateAccessQueue;
- (OS_dispatch_queue)clientDelegateCallbackQueue;
- (OS_dispatch_queue)clientMessageQueue;
- (OS_dispatch_queue)clientReplyCompletionQueue;
- (SUCoreConnectClient)initWithClientPolicy:(id)a3;
- (SUCoreConnectClientPolicy)policy;
- (SUCoreLog)logger;
- (void)_droppedConnection:(id)a3;
- (void)_internalConnectToServerWithCompletion:(id)a3;
- (void)_invalidateConnection:(id)a3;
- (void)connectClientSendServerMessage:(id)a3;
- (void)connectClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5;
- (void)connectProtocolFromServerRequestClientID:(id)a3;
- (void)connectProtocolFromServerSendClientMessage:(id)a3;
- (void)connectProtocolFromServerSendClientMessage:(id)a3 reply:(id)a4;
- (void)connectToServerWithCompletion:(id)a3;
- (void)dealloc;
- (void)forceCloseConnection;
- (void)setLogger:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setServerConnection:(id)a3;
@end

@implementation SUCoreConnectClient

- (void)connectProtocolFromServerRequestClientID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(SUCoreConnectClient *)self clientReplyCompletionQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__SUCoreConnectClient_connectProtocolFromServerRequestClientID___block_invoke;
    v12[3] = &unk_264188328;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v5, v12);
  }
  else
  {
    v6 = [(SUCoreConnectClient *)self logger];
    v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(SUCoreConnectClient *)self policy];
      v9 = [v8 serviceName];
      v10 = [(SUCoreConnectClient *)self policy];
      v11 = [v10 clientID];
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_210A6A000, v7, OS_LOG_TYPE_DEFAULT, "[RequestClientID](%{public}@) Replying to server for clientID request: %{public}@, no reply block provided", buf, 0x16u);
    }
  }
}

- (OS_dispatch_queue)clientReplyCompletionQueue
{
  return self->_clientReplyCompletionQueue;
}

- (void)connectClientSendServerMessage:(id)a3 proxyObject:(id)a4 withReply:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263F77D78];
  v12 = [v8 clientID];
  id v13 = [(SUCoreConnectClient *)self policy];
  v14 = [v13 clientID];
  LOBYTE(v11) = [v11 stringIsEqual:v12 to:v14];

  if (v11)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109;
    v31[3] = &unk_264188440;
    v31[4] = self;
    id v34 = v10;
    id v32 = v8;
    id v33 = v9;
    [(SUCoreConnectClient *)self _internalConnectToServerWithCompletion:v31];
  }
  else
  {
    v15 = [MEMORY[0x263F77D78] sharedCore];
    __int16 v16 = NSString;
    v17 = [v8 clientID];
    uint64_t v18 = [(SUCoreConnectClient *)self policy];
    v19 = [v18 clientID];
    v20 = [v16 stringWithFormat:@"ClientID of message (%@) does not align with policy clientID (%@)", v17, v19];
    v21 = [v15 buildError:8907 underlying:0 description:v20];

    v22 = [MEMORY[0x263F77DA8] sharedDiag];
    v23 = [v21 description];
    objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", @"connectClientSendServerMessage", v23, objc_msgSend(v21, "code"), v21);

    v24 = [(SUCoreConnectClient *)self logger];
    v25 = [v24 oslog];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClient connectClientSendServerMessage:proxyObject:withReply:](self, (uint64_t)v21, v25);
    }

    if (v10)
    {
      v26 = [(SUCoreConnectClient *)self clientCompletionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke;
      block[3] = &unk_2641883A0;
      v37 = v10;
      id v36 = v21;
      dispatch_async(v26, block);

      v27 = v37;
    }
    else
    {
      v28 = [(SUCoreConnectClient *)self logger];
      v27 = [v28 oslog];

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(SUCoreConnectClient *)self policy];
        v30 = [v29 serviceName];
        *(_DWORD *)buf = 138543362;
        v39 = v30;
        _os_log_impl(&dword_210A6A000, v27, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Validation Error: No reply completion was provided", buf, 0xCu);
      }
    }
  }
}

void __64__SUCoreConnectClient_connectProtocolFromServerRequestClientID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) logger];
  v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) policy];
    v5 = [v4 serviceName];
    v6 = [*(id *)(a1 + 32) policy];
    v7 = [v6 clientID];
    int v11 = 138543618;
    v12 = v5;
    __int16 v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_210A6A000, v3, OS_LOG_TYPE_DEFAULT, "[RequestClientID](%{public}@) Replying to server for clientID request: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) policy];
  id v10 = [v9 clientID];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);
}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke(uint64_t a1)
{
  v63[2] = *(id *)MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) policy];
  if (([v2 usesPersistentXPCConnections] & 1) == 0)
  {

    goto LABEL_8;
  }
  v3 = [*(id *)(a1 + 32) serverConnection];

  if (!v3)
  {
LABEL_8:
    int v11 = [*(id *)(a1 + 32) logger];
    v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [*(id *)(a1 + 32) policy];
      v14 = [v13 serviceName];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_210A6A000, v12, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Attempting to connect to server", buf, 0xCu);
    }
    id v15 = objc_alloc(MEMORY[0x263F08D68]);
    __int16 v16 = [*(id *)(a1 + 32) policy];
    v17 = [v16 serviceName];
    uint64_t v18 = (void *)[v15 initWithMachServiceName:v17 options:0];

    v19 = (const char *)[@"com.apple.SUCoreConnect.ServerConnectionQueue" UTF8String];
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);

    [v18 _setQueue:v21];
    v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C310540];
    v23 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C30FB48];
    v24 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C3100A8];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3042000000;
    v61 = __Block_byref_object_copy__2;
    v62 = __Block_byref_object_dispose__2;
    v63[0] = 0;
    location = v63;
    objc_initWeak(v63, *(id *)(a1 + 32));
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_90;
    v53[3] = &unk_2641881C0;
    v55 = buf;
    id v25 = v18;
    id v54 = v25;
    v49 = (void *)MEMORY[0x216679110](v53);
    [v25 setInvalidationHandler:v49];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_91;
    v50[3] = &unk_2641881C0;
    v52 = buf;
    id v10 = v25;
    id v51 = v10;
    v26 = (void *)MEMORY[0x216679110](v50);
    [v10 setInterruptionHandler:v26];
    v27 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v22 setClasses:v27 forSelector:sel_connectProtocolFromServerSendClientMessage_reply_ argumentIndex:0 ofReply:0];

    v28 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v22 setClasses:v28 forSelector:sel_connectProtocolFromServerSendClientMessage_reply_ argumentIndex:0 ofReply:1];

    v29 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v22 setClasses:v29 forSelector:sel_connectProtocolFromServerSendClientMessage_reply_ argumentIndex:1 ofReply:1];

    v30 = [*(id *)(a1 + 32) policy];
    v31 = [v30 proxyObjectClasses];

    if (v31)
    {
      id v32 = objc_msgSend(*(id *)(a1 + 32), "policy", v63);
      id v33 = [v32 proxyObjectClasses];
      [v24 setClasses:v33 forSelector:sel_executeGenericBlock_ argumentIndex:0 ofReply:0];

      id v34 = [*(id *)(a1 + 32) policy];
      v35 = [v34 proxyObjectClasses];
      [v24 setClasses:v35 forSelector:sel_executeGenericBlock_disableVerboseLogging_ argumentIndex:0 ofReply:0];
    }
    objc_msgSend(v23, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_connectProtocolFromClientSendServerMessage_proxyObject_withReply_, 1, 0, location);
    [v10 setExportedInterface:v22];
    [v10 setRemoteObjectInterface:v23];
    [v10 setExportedObject:*(void *)(a1 + 32)];
    [v10 resume];
    id v36 = [*(id *)(a1 + 32) policy];
    int v37 = [v36 usesPersistentXPCConnections];

    if (v37)
    {
      v38 = [*(id *)(a1 + 32) logger];
      v39 = [v38 oslog];

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = [*(id *)(a1 + 32) policy];
        v41 = [v40 serviceName];
        *(_DWORD *)v56 = 138543362;
        v57 = v41;
        _os_log_impl(&dword_210A6A000, v39, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Client usesPersistentXPCConnections, assigning serverConnection", v56, 0xCu);
      }
      [*(id *)(a1 + 32) setServerConnection:v10];
    }
    v42 = [*(id *)(a1 + 32) logger];
    v43 = [v42 oslog];

    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [*(id *)(a1 + 32) policy];
      v45 = [v44 serviceName];
      *(_DWORD *)v56 = 138543618;
      v57 = v45;
      __int16 v58 = 2114;
      id v59 = v10;
      _os_log_impl(&dword_210A6A000, v43, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Successfully connected to server with connection %{public}@", v56, 0x16u);
    }
    uint64_t v46 = *(void *)(a1 + 40);
    if (v46) {
      (*(void (**)(uint64_t, id))(v46 + 16))(v46, v10);
    }

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(locationa);

    goto LABEL_21;
  }
  id v4 = [*(id *)(a1 + 32) logger];
  v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [*(id *)(a1 + 32) policy];
    v7 = [v6 serviceName];
    uint64_t v8 = [*(id *)(a1 + 32) serverConnection];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_210A6A000, v5, OS_LOG_TYPE_DEFAULT, "[ConnectToServer](%{public}@) Already connected to server, not reconnecting for client that usesPersistentXPCConnections for connection %{public}@", buf, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) serverConnection];
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
LABEL_21:
  }
}

- (SUCoreConnectClientPolicy)policy
{
  return self->_policy;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  v5 = [*(id *)(a1 + 32) logger];
  v6 = [v5 oslog];

  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [*(id *)(a1 + 32) policy];
      uint64_t v8 = [v7 serviceName];
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v28 = v8;
      __int16 v29 = 2114;
      uint64_t v30 = v9;
      __int16 v31 = 2114;
      id v32 = v3;
      _os_log_impl(&dword_210A6A000, v6, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Connected to server and calling sendMessage %{public}@ for connection %{public}@", buf, 0x20u);
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_114;
    v22[3] = &unk_2641883F0;
    v22[4] = *(void *)(a1 + 32);
    id v10 = v3;
    id v23 = v10;
    id v24 = *(id *)(a1 + 56);
    int v11 = [v10 remoteObjectProxyWithErrorHandler:v22];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_117;
    v19[3] = &unk_264188418;
    v19[4] = *(void *)(a1 + 32);
    id v20 = v10;
    id v21 = *(id *)(a1 + 56);
    [v11 connectProtocolFromClientSendServerMessage:v12 proxyObject:v13 withReply:v19];

    v14 = v23;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109_cold_2((id *)(a1 + 32));
  }

  id v15 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 56))
  {
    __int16 v16 = [v15 clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_110;
    block[3] = &unk_2641883C8;
    id v26 = *(id *)(a1 + 56);
    dispatch_async(v16, block);

    v14 = v26;
LABEL_9:

    goto LABEL_10;
  }
  v17 = [v15 logger];
  uint64_t v18 = [v17 oslog];

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109_cold_1(v4);
  }

LABEL_10:
}

- (void)_internalConnectToServerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SUCoreConnectClient *)self clientConnectionStateAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke;
  v7[3] = &unk_264188328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)clientConnectionStateAccessQueue
{
  return self->_clientConnectionStateAccessQueue;
}

- (SUCoreConnectClient)initWithClientPolicy:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUCoreConnectClient;
  id v6 = [(SUCoreConnectClient *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_policy, a3);
    uint64_t v8 = +[SUCoreConnectClient _sharedClientLogger];
    logger = v7->_logger;
    v7->_logger = (SUCoreLog *)v8;

    id v10 = (const char *)[@"com.apple.SUCoreConnect.ClientConnectionStateAccessQueue" UTF8String];
    int v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    clientConnectionStateAccessQueue = v7->_clientConnectionStateAccessQueue;
    v7->_clientConnectionStateAccessQueue = (OS_dispatch_queue *)v12;

    v14 = (const char *)[@"com.apple.SUCoreConnect.ClientDelegateCallbackQueue" UTF8String];
    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    clientDelegateCallbackQueue = v7->_clientDelegateCallbackQueue;
    v7->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = (const char *)[@"com.apple.SUCoreConnect.ClientCompletionQueue" UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    clientCompletionQueue = v7->_clientCompletionQueue;
    v7->_clientCompletionQueue = (OS_dispatch_queue *)v20;

    v22 = (const char *)[@"com.apple.SUCoreConnect.ClientMessageQueue" UTF8String];
    id v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    clientMessageQueue = v7->_clientMessageQueue;
    v7->_clientMessageQueue = (OS_dispatch_queue *)v24;

    id v26 = (const char *)[@"com.apple.SUCoreConnect.ClientReplyCompletionQueue" UTF8String];
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create(v26, v27);
    clientReplyCompletionQueue = v7->_clientReplyCompletionQueue;
    v7->_clientReplyCompletionQueue = (OS_dispatch_queue *)v28;
  }
  return v7;
}

+ (id)_sharedClientLogger
{
  if (_sharedClientLogger_oneClientLoggerToken != -1) {
    dispatch_once(&_sharedClientLogger_oneClientLoggerToken, &__block_literal_global_1);
  }
  v2 = (void *)_sharedClientLogger___sharedLogger;
  return v2;
}

uint64_t __42__SUCoreConnectClient__sharedClientLogger__block_invoke()
{
  _sharedClientLogger___sharedLogger = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"CLIENT"];
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(SUCoreConnectClient *)self serverConnection];

  if (v3)
  {
    id v4 = [(SUCoreConnectClient *)self logger];
    id v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(SUCoreConnectClient *)self policy];
      v7 = [v6 serviceName];
      uint64_t v8 = [(SUCoreConnectClient *)self serverConnection];
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      __int16 v15 = 2114;
      dispatch_queue_t v16 = v8;
      _os_log_impl(&dword_210A6A000, v5, OS_LOG_TYPE_DEFAULT, "[InvalidateConnection](%{public}@) Invalidating the persistent server connection %{public}@", buf, 0x16u);
    }
    uint64_t v9 = [(SUCoreConnectClient *)self serverConnection];
    [v9 setInvalidationHandler:0];

    id v10 = [(SUCoreConnectClient *)self serverConnection];
    [v10 setInterruptionHandler:0];

    int v11 = [(SUCoreConnectClient *)self serverConnection];
    [v11 invalidate];

    [(SUCoreConnectClient *)self setServerConnection:0];
  }
  v12.receiver = self;
  v12.super_class = (Class)SUCoreConnectClient;
  [(SUCoreConnectClient *)&v12 dealloc];
}

- (void)_invalidateConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreConnectClient *)self clientConnectionStateAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUCoreConnectClient__invalidateConnection___block_invoke;
  v7[3] = &unk_2641881E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__SUCoreConnectClient__invalidateConnection___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) policy];
  if ([v2 usesPersistentXPCConnections])
  {
    id v3 = [*(id *)(a1 + 32) serverConnection];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) logger];
      id v5 = [v4 oslog];

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [*(id *)(a1 + 32) policy];
        v7 = [v6 serviceName];
        uint64_t v8 = *(void *)(a1 + 40);
        int v14 = 138543618;
        __int16 v15 = v7;
        __int16 v16 = 2114;
        uint64_t v17 = v8;
        _os_log_impl(&dword_210A6A000, v5, OS_LOG_TYPE_DEFAULT, "[InvalidateConnection](%{public}@) Not invalidating server connection %{public}@ as client usesPersistentXPCConnections", (uint8_t *)&v14, 0x16u);
      }
      return;
    }
  }
  else
  {
  }
  uint64_t v9 = [*(id *)(a1 + 32) logger];
  id v10 = [v9 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [*(id *)(a1 + 32) policy];
    objc_super v12 = [v11 serviceName];
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    __int16 v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_impl(&dword_210A6A000, v10, OS_LOG_TYPE_DEFAULT, "[InvalidateConnection](%{public}@) Invalidating the server connection %{public}@", (uint8_t *)&v14, 0x16u);
  }
  [*(id *)(a1 + 40) setInvalidationHandler:0];
  [*(id *)(a1 + 40) setInterruptionHandler:0];
  [*(id *)(a1 + 40) invalidate];
}

- (void)_droppedConnection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = v5;
  if (v5)
  {
    v7 = [(SUCoreConnectClient *)v5 clientConnectionStateAccessQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SUCoreConnectClient__droppedConnection___block_invoke;
    block[3] = &unk_264188260;
    int v11 = v6;
    id v12 = v4;
    uint64_t v13 = v11;
    dispatch_async(v7, block);

    uint64_t v8 = v11;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v8 = [v9 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClient _droppedConnection:](v8);
    }
  }
}

uint64_t __42__SUCoreConnectClient__droppedConnection___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [a1[4] policy];
  id v3 = [v2 clientDelegate];
  char v4 = objc_opt_respondsToSelector();

  id v5 = a1[4];
  if (v4)
  {
    id v6 = [v5 clientDelegateCallbackQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__SUCoreConnectClient__droppedConnection___block_invoke_2;
    v13[3] = &unk_2641881E8;
    int v14 = a1[4];
    id v15 = a1[5];
    dispatch_async(v6, v13);

    v7 = v14;
  }
  else
  {
    uint64_t v8 = [v5 logger];
    v7 = [v8 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [a1[4] policy];
      id v10 = [v9 serviceName];
      id v11 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_210A6A000, v7, OS_LOG_TYPE_DEFAULT, "[ConnectionDropped](%{public}@) Client connection dropped from XPC server, no delegate callback provided for connection %{public}@", buf, 0x16u);
    }
  }

  [a1[6] setServerConnection:0];
  return [a1[5] invalidate];
}

void __42__SUCoreConnectClient__droppedConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) logger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [*(id *)(a1 + 32) policy];
    id v5 = [v4 serviceName];
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_210A6A000, v3, OS_LOG_TYPE_DEFAULT, "[ConnectionDropped](%{public}@) Client connection dropped to XPC server, calling connectionClosed delegate callback for connection %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v7 = [*(id *)(a1 + 32) policy];
  uint64_t v8 = [v7 clientDelegate];
  [v8 connectionClosed];
}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_90(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F77DE8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id v5 = [WeakRetained policy];
    uint64_t v6 = [v5 clientID];
    id v7 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v8 = [v7 policy];
    int v9 = [v8 serviceName];
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    int v14 = v9;
    _os_log_impl(&dword_210A6A000, v3, OS_LOG_TYPE_DEFAULT, "[CLIENT-%{public}@][InvalidatedHandler](%{public}@) Connection invalidated", (uint8_t *)&v11, 0x16u);
  }
  id v10 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v10 _droppedConnection:*(void *)(a1 + 32)];
}

void __62__SUCoreConnectClient__internalConnectToServerWithCompletion___block_invoke_91(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F77DE8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id v5 = [WeakRetained policy];
    uint64_t v6 = [v5 clientID];
    id v7 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v8 = [v7 policy];
    int v9 = [v8 serviceName];
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    int v14 = v9;
    _os_log_impl(&dword_210A6A000, v3, OS_LOG_TYPE_DEFAULT, "[CLIENT-%{public}@][InterruptedHandler](%{public}@) Connection interrupted", (uint8_t *)&v11, 0x16u);
  }
  id v10 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v10 _droppedConnection:*(void *)(a1 + 32)];
}

- (void)connectToServerWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke;
  v6[3] = &unk_264188378;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SUCoreConnectClient *)self _internalConnectToServerWithCompletion:v6];
}

void __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientCompletionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke_2;
  block[3] = &unk_264188350;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  void block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __53__SUCoreConnectClient_connectToServerWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 _invalidateConnection:v4];
}

- (void)connectClientSendServerMessage:(id)a3
{
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_110(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x263F77D78] sharedCore];
  uint64_t v2 = [v3 buildError:8909 underlying:0 description:@"No server connection present to send client->server message"];
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) logger];
  id v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = [*(id *)(a1 + 32) policy];
    int v14 = [v13 serviceName];
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    id v22 = v3;
    __int16 v23 = 2114;
    uint64_t v24 = v15;
    _os_log_error_impl(&dword_210A6A000, v5, OS_LOG_TYPE_ERROR, "[SendServerMessage](%{public}@) ErrorHandler: Calling provided reply completion on connection error %{public}@ for connection %{public}@", buf, 0x20u);
  }
  id v6 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    id v7 = [v6 clientCompletionQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_115;
    v16[3] = &unk_2641883A0;
    __int16 v18 = *(id *)(a1 + 48);
    id v17 = v3;
    dispatch_async(v7, v16);

    id v8 = v18;
  }
  else
  {
    id v9 = [v6 logger];
    id v8 = [v9 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 32) policy];
      int v11 = [v10 serviceName];
      uint64_t v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      id v22 = v12;
      _os_log_impl(&dword_210A6A000, v8, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) ErrorHandler: No reply completion was provided for connection %{public}@", buf, 0x16u);
    }
  }

  [*(id *)(a1 + 32) _invalidateConnection:*(void *)(a1 + 40)];
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) logger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 32) policy];
    id v10 = [v9 serviceName];
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v40 = v10;
    __int16 v41 = 2114;
    id v42 = v5;
    __int16 v43 = 2114;
    id v44 = v6;
    __int16 v45 = 2114;
    uint64_t v46 = v11;
    _os_log_impl(&dword_210A6A000, v8, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) sendMessage response received from server with response %{public}@ error %{public}@ for connection %{public}@", buf, 0x2Au);
  }
  uint64_t v12 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    __int16 v13 = [v12 clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_118;
    block[3] = &unk_264188350;
    id v38 = *(id *)(a1 + 48);
    id v36 = v5;
    id v37 = v6;
    dispatch_async(v13, block);

    int v14 = v38;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v15 = [v12 policy];
  __int16 v16 = [v15 clientDelegate];
  char v17 = objc_opt_respondsToSelector();

  __int16 v18 = [*(id *)(a1 + 32) logger];
  id v19 = [v18 oslog];

  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v20)
    {
      __int16 v21 = [*(id *)(a1 + 32) policy];
      id v22 = [v21 serviceName];
      __int16 v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v22;
      __int16 v41 = 2114;
      id v42 = v23;
      _os_log_impl(&dword_210A6A000, v19, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Calling reply delegate callback 'handleResponse:error:' for connection %{public}@", buf, 0x16u);
    }
    uint64_t v24 = [*(id *)(a1 + 32) clientDelegateCallbackQueue];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_121;
    objc_super v31 = &unk_264188260;
    uint64_t v32 = *(void *)(a1 + 32);
    id v33 = v5;
    id v34 = v6;
    dispatch_async(v24, &v28);

    int v14 = v33;
    goto LABEL_9;
  }
  if (v20)
  {
    uint64_t v25 = [*(id *)(a1 + 32) policy];
    id v26 = [v25 serviceName];
    v27 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v26;
    __int16 v41 = 2114;
    id v42 = v27;
    _os_log_impl(&dword_210A6A000, v19, OS_LOG_TYPE_DEFAULT, "[SendServerMessage](%{public}@) Client does not respond to the handleMessage:reply: delegate callback and no reply completion was provided for connection %{public}@", buf, 0x16u);
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection:", *(void *)(a1 + 40), v28, v29, v30, v31, v32);
}

uint64_t __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_118(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_121(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) policy];
  uint64_t v2 = [v3 clientDelegate];
  [v2 handleResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)forceCloseConnection
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [(SUCoreConnectClient *)self logger];
  uint64_t v4 = [v3 oslog];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SUCoreConnectClient *)self policy];
    id v6 = [v5 serviceName];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_210A6A000, v4, OS_LOG_TYPE_DEFAULT, "[ForceCloseConnection](%{public}@) Incoming client request to force close connection", (uint8_t *)&v7, 0xCu);
  }
}

- (void)connectProtocolFromServerSendClientMessage:(id)a3
{
}

- (void)connectProtocolFromServerSendClientMessage:(id)a3 reply:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreConnectClient *)self policy];
  uint64_t v9 = [v8 clientDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(SUCoreConnectClient *)self logger];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [(SUCoreConnectClient *)self policy];
      int v14 = [v13 serviceName];
      *(_DWORD *)buf = 138543362;
      id v33 = v14;
      _os_log_impl(&dword_210A6A000, v12, OS_LOG_TYPE_DEFAULT, "[SendClientMessage](%{public}@) Calling client delegate method handleMessage", buf, 0xCu);
    }
    uint64_t v15 = [(SUCoreConnectClient *)self clientMessageQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke;
    block[3] = &unk_264188468;
    void block[4] = self;
    id v30 = v6;
    id v31 = v7;
    dispatch_async(v15, block);
  }
  else
  {
    __int16 v16 = [MEMORY[0x263F77D78] sharedCore];
    char v17 = [v16 buildError:8900 underlying:0 description:@"Client does not respond to messages"];

    __int16 v18 = [(SUCoreConnectClient *)self logger];
    id v19 = [v18 oslog];

    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v20)
      {
        __int16 v21 = [(SUCoreConnectClient *)self policy];
        id v22 = [v21 serviceName];
        *(_DWORD *)buf = 138543874;
        id v33 = v22;
        __int16 v34 = 2114;
        id v35 = v6;
        __int16 v36 = 2114;
        id v37 = v17;
        _os_log_impl(&dword_210A6A000, v19, OS_LOG_TYPE_DEFAULT, "[SendClientMessage](%{public}@) Client does not respond to handleMessage:%{public}@, error:%{public}@, calling reply block", buf, 0x20u);
      }
      __int16 v23 = [(SUCoreConnectClient *)self clientReplyCompletionQueue];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke_128;
      v26[3] = &unk_2641883A0;
      uint64_t v28 = v7;
      id v27 = v17;
      dispatch_async(v23, v26);

      id v19 = v28;
    }
    else if (v20)
    {
      uint64_t v24 = [(SUCoreConnectClient *)self policy];
      uint64_t v25 = [v24 serviceName];
      *(_DWORD *)buf = 138543874;
      id v33 = v25;
      __int16 v34 = 2114;
      id v35 = v6;
      __int16 v36 = 2114;
      id v37 = v17;
      _os_log_impl(&dword_210A6A000, v19, OS_LOG_TYPE_DEFAULT, "[SendClientMessage](%{public}@) Client does not respond to handleMessage:%{public}@, error: %{public}@, and no reply block provided", buf, 0x20u);
    }
  }
}

void __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) policy];
  uint64_t v2 = [v3 clientDelegate];
  [v2 handleMessage:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

uint64_t __72__SUCoreConnectClient_connectProtocolFromServerSendClientMessage_reply___block_invoke_128(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (void)setPolicy:(id)a3
{
}

- (void)setLogger:(id)a3
{
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (OS_dispatch_queue)clientMessageQueue
{
  return self->_clientMessageQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReplyCompletionQueue, 0);
  objc_storeStrong((id *)&self->_clientMessageQueue, 0);
  objc_storeStrong((id *)&self->_clientCompletionQueue, 0);
  objc_storeStrong((id *)&self->_clientDelegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_clientConnectionStateAccessQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)_droppedConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_210A6A000, log, OS_LOG_TYPE_ERROR, "[ConnectionDropped] Client connection dropped to XPC server, found no retained client object available during cleanup", v1, 2u);
}

- (void)connectClientSendServerMessage:(void *)a1 proxyObject:(uint64_t)a2 withReply:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [a1 policy];
  id v6 = [v5 serviceName];
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_210A6A000, a3, OS_LOG_TYPE_ERROR, "[SendServerMessage](%{public}@) Validation Error: Calling provided reply completion with error %{public}@", (uint8_t *)&v7, 0x16u);
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109_cold_1(id *a1)
{
  uint64_t v1 = [*a1 policy];
  uint64_t v2 = [v1 serviceName];
  OUTLINED_FUNCTION_0_1(&dword_210A6A000, v3, v4, "[SendServerMessage](%{public}@) No reply completion provided", v5, v6, v7, v8, 2u);
}

void __76__SUCoreConnectClient_connectClientSendServerMessage_proxyObject_withReply___block_invoke_109_cold_2(id *a1)
{
  uint64_t v1 = [*a1 policy];
  uint64_t v2 = [v1 serviceName];
  OUTLINED_FUNCTION_0_1(&dword_210A6A000, v3, v4, "[SendServerMessage](%{public}@) No server connection present to send client->server message", v5, v6, v7, v8, 2u);
}

@end