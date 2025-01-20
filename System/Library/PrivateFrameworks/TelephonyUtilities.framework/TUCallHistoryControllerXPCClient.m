@interface TUCallHistoryControllerXPCClient
+ (NSSet)callHistoryControllerAllowedClasses;
+ (NSXPCInterface)callHistoryControllerClientXPCInterface;
+ (NSXPCInterface)callHistoryControllerServerXPCInterface;
+ (TUCallHistoryControllerXPCServer)asynchronousServer;
+ (TUCallHistoryControllerXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (BOOL)hasInitialState;
- (BOOL)hasRequestedInitialState;
- (BOOL)shouldConnectToHost;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUCallHistoryControllerXPCClient)init;
- (id)asynchronousServerWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int)shouldConnectToken;
- (os_unfair_lock_s)accessorLock;
- (void)_invokeCompletionHandler:(id)a3;
- (void)_requestInitialStateIfNecessary;
- (void)_requestInitialStateWithCompletionHandler:(id)a3;
- (void)allCallHistoryDeleted;
- (void)dealloc;
- (void)init;
- (void)invalidate;
- (void)recentCallsDeleted:(id)a3;
- (void)registerWithCompletionHandler:(id)a3;
- (void)setHasInitialState:(BOOL)a3;
- (void)setHasRequestedInitialState:(BOOL)a3;
- (void)setShouldConnectToHost:(BOOL)a3;
- (void)setShouldConnectToken:(int)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation TUCallHistoryControllerXPCClient

- (TUCallHistoryControllerXPCClient)init
{
  v14.receiver = self;
  v14.super_class = (Class)TUCallHistoryControllerXPCClient;
  v2 = [(TUCallHistoryControllerXPCClient *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Initializing TUCallHistoryControllerXPCClient", (uint8_t *)buf, 2u);
    }

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.telephonyutilities.callhistorycontrollerxpcclient", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    objc_initWeak(buf, v3);
    v7 = v3->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__TUCallHistoryControllerXPCClient_init__block_invoke;
    handler[3] = &unk_1E58E5F18;
    objc_copyWeak(&v12, buf);
    notify_register_dispatch("CSDCallHistoryControllerClientsShouldConnectNotification", &v3->_shouldConnectToken, v7, handler);
    id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_5);
    v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(TUCallHistoryControllerXPCClient *)(uint64_t)v3 init];
    }

    [WeakRetained registerClient:v3];
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  return v3;
}

+ (TUCallHistoryControllerXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_5);

  return (TUCallHistoryControllerXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUCallHistoryControllerXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_5);

  return (TUCallHistoryControllerXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

void __40__TUCallHistoryControllerXPCClient_init__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "CSDCallHistoryControllerClientsShouldConnectNotification";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection for CallHistoryController", buf, 0xCu);
  }

  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__TUCallHistoryControllerXPCClient_init__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __40__TUCallHistoryControllerXPCClient_init__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
  return [*(id *)(a1 + 32) _requestInitialStateWithCompletionHandler:0];
}

- (void)dealloc
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  notify_cancel(self->_shouldConnectToken);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_5);
  [WeakRetained unregisterClient:self];

  os_unfair_lock_unlock(p_accessorLock);
  v5.receiver = self;
  v5.super_class = (Class)TUCallHistoryControllerXPCClient;
  [(TUCallHistoryControllerXPCClient *)&v5 dealloc];
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TUCallHistoryControllerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__TUCallHistoryControllerXPCClient_registerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __66__TUCallHistoryControllerXPCClient_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) hasRequestedInitialState];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    return [v3 _invokeCompletionHandler:v4];
  }
  else
  {
    return [v3 _requestInitialStateWithCompletionHandler:v4];
  }
}

- (void)recentCallsDeleted:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__TUCallHistoryControllerXPCClient_recentCallsDeleted___block_invoke;
  v7[3] = &unk_1E58E6A70;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(TUCallHistoryControllerXPCClient *)self asynchronousServerWithErrorHandler:v7];
  [v6 recentCallsDeleted:v5];
}

void __55__TUCallHistoryControllerXPCClient_recentCallsDeleted___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error notifying CSD of deleted recent calls: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)allCallHistoryDeleted
{
  id v2 = [(TUCallHistoryControllerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_54];
  [v2 allCallHistoryDeleted];
}

void __57__TUCallHistoryControllerXPCClient_allCallHistoryDeleted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error notifying CSD of all call history deleted error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)invalidate
{
  id v3 = [(TUCallHistoryControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__TUCallHistoryControllerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__TUCallHistoryControllerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
}

- (void)_requestInitialStateIfNecessary
{
  id v3 = [(TUCallHistoryControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(TUCallHistoryControllerXPCClient *)self hasRequestedInitialState])
  {
    [(TUCallHistoryControllerXPCClient *)self _requestInitialStateWithCompletionHandler:0];
  }
}

- (void)_requestInitialStateWithCompletionHandler:(id)a3
{
  id v5 = a3;
  int v4 = [(TUCallHistoryControllerXPCClient *)self queue];
  dispatch_assert_queue_V2(v4);

  [(TUCallHistoryControllerXPCClient *)self setHasRequestedInitialState:1];
  [(TUCallHistoryControllerXPCClient *)self _invokeCompletionHandler:v5];
}

- (void)_invokeCompletionHandler:(id)a3
{
  if (a3)
  {
    int v4 = dispatch_get_global_queue(21, 0);
    dispatch_async(v4, a3);
  }
}

- (NSXPCConnection)xpcConnection
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Starting XPC Connection.", (uint8_t *)buf, 2u);
    }

    uint64_t v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.callhistorycontroller" options:0];
    uint64_t v7 = self->_xpcConnection;
    self->_xpcConnection = v6;

    __int16 v8 = [(id)objc_opt_class() callHistoryControllerServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v8];

    id v9 = [(id)objc_opt_class() callHistoryControllerClientXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v9];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(buf, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke;
    v17[3] = &unk_1E58E5C50;
    objc_copyWeak(&v18, buf);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v17];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    objc_super v14 = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_9;
    v15 = &unk_1E58E5C50;
    objc_copyWeak(&v16, buf);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&v12];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
    xpcConnection = self->_xpcConnection;
  }
  uint64_t v10 = xpcConnection;
  os_unfair_lock_unlock(p_accessorLock);

  return v10;
}

void __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;
}

void __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2_10;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __49__TUCallHistoryControllerXPCClient_xpcConnection__block_invoke_2_10(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
}

- (void)setXpcConnection:(id)a3
{
  __int16 v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  xpcConnection = self->_xpcConnection;
  p_xpcConnection = &self->_xpcConnection;
  if (xpcConnection != v8) {
    objc_storeStrong((id *)p_xpcConnection, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_5);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    __int16 v8 = [(TUCallHistoryControllerXPCClient *)self xpcConnection];
    id v7 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_5);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    __int16 v8 = [(TUCallHistoryControllerXPCClient *)self xpcConnection];
    id v7 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

+ (NSSet)callHistoryControllerAllowedClasses
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v10 = (void *)getCHRecentCallClass_softClass_0;
  uint64_t v18 = getCHRecentCallClass_softClass_0;
  if (!getCHRecentCallClass_softClass_0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getCHRecentCallClass_block_invoke_0;
    v14[3] = &unk_1E58E5F90;
    v14[4] = &v15;
    __getCHRecentCallClass_block_invoke_0((uint64_t)v14);
    uint64_t v10 = (void *)v16[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v15, 8);
  uint64_t v12 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v11, objc_opt_class(), 0);

  return (NSSet *)v12;
}

+ (NSXPCInterface)callHistoryControllerClientXPCInterface
{
  if (callHistoryControllerClientXPCInterface_onceToken != -1) {
    dispatch_once(&callHistoryControllerClientXPCInterface_onceToken, &__block_literal_global_20_0);
  }
  id v2 = (void *)callHistoryControllerClientXPCInterface_callHistoryControllerClientXPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __75__TUCallHistoryControllerXPCClient_callHistoryControllerClientXPCInterface__block_invoke()
{
  callHistoryControllerClientXPCInterface_callHistoryControllerClientXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED4D078];

  return MEMORY[0x1F41817F8]();
}

+ (NSXPCInterface)callHistoryControllerServerXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__TUCallHistoryControllerXPCClient_callHistoryControllerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (callHistoryControllerServerXPCInterface_onceToken != -1) {
    dispatch_once(&callHistoryControllerServerXPCInterface_onceToken, block);
  }
  id v2 = (void *)callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface;

  return (NSXPCInterface *)v2;
}

void __75__TUCallHistoryControllerXPCClient_callHistoryControllerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61BA8];
  uint64_t v3 = (void *)callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface;
  callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface = v2;

  uint64_t v4 = (void *)callHistoryControllerServerXPCInterface_callHistoryControllerXPCInterface;
  id v5 = [*(id *)(a1 + 32) callHistoryControllerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_recentCallsDeleted_ argumentIndex:0 ofReply:0];
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasRequestedInitialState
{
  return self->_hasRequestedInitialState;
}

- (void)setHasRequestedInitialState:(BOOL)a3
{
  self->_hasRequestedInitialState = a3;
}

- (BOOL)hasInitialState
{
  return self->_hasInitialState;
}

- (void)setHasInitialState:(BOOL)a3
{
  self->_hasInitialState = a3;
}

- (int)shouldConnectToken
{
  return self->_shouldConnectToken;
}

- (void)setShouldConnectToken:(int)a3
{
  self->_shouldConnectToken = a3;
}

- (BOOL)shouldConnectToHost
{
  return self->_shouldConnectToHost;
}

- (void)setShouldConnectToHost:(BOOL)a3
{
  self->_shouldConnectToHost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19C496000, log, OS_LOG_TYPE_DEBUG, "Registering TUCallHistoryControllerXPCClient %p with async server %p", (uint8_t *)&v3, 0x16u);
}

@end