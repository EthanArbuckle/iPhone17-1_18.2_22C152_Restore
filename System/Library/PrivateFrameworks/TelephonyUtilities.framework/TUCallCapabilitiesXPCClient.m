@interface TUCallCapabilitiesXPCClient
+ (NSXPCInterface)callCapabilitiesClientXPCInterface;
+ (NSXPCInterface)callCapabilitiesServerXPCInterface;
+ (TUCallCapabilitiesXPCServer)asynchronousServer;
+ (TUCallCapabilitiesXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (NSMapTable)delegateToQueue;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUCallCapabilitiesState)state;
- (TUCallCapabilitiesXPCClient)init;
- (id)asynchronousServer;
- (id)asynchronousServerWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int)token;
- (void)_retrieveState;
- (void)_updateState:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)cancelPinRequestFromPrimaryDevice;
- (void)capabilityStateUpdated:(id)a3;
- (void)dealloc;
- (void)endEmergencyCallbackMode;
- (void)handleServerDisconnect;
- (void)invalidate;
- (void)invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:(id)a3;
- (void)invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:(id)a3;
- (void)performDelegateCallbackBlock:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)requestPinFromPrimaryDevice;
- (void)setRelayCallingEnabled:(BOOL)a3;
- (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4;
- (void)setState:(id)a3;
- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
- (void)setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setXpcConnection:(id)a3;
@end

@implementation TUCallCapabilitiesXPCClient

- (void)_retrieveState
{
  v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving initial call capabilities state.", buf, 2u);
  }

  v5 = [(TUCallCapabilitiesXPCClient *)self synchronousServerWithErrorHandler:&__block_literal_global_21];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_12;
  v6[3] = &unk_1E58E6EE0;
  v6[4] = self;
  [v5 callCapabilitiesState:v6];
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_1);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    v9 = [(TUCallCapabilitiesXPCClient *)self xpcConnection];
    id v8 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = @"com.apple.telephonyutilities.callservicesdaemon.callcapabilities";
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Setting up XPC connection for %@", buf, 0xCu);
    }

    v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.callcapabilities" options:0];
    v7 = self->_xpcConnection;
    self->_xpcConnection = v6;

    id v8 = [(id)objc_opt_class() callCapabilitiesServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v8];

    v9 = [(id)objc_opt_class() callCapabilitiesClientXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v9];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke;
    v16[3] = &unk_1E58E5C50;
    objc_copyWeak(&v17, (id *)buf);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v16];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_8;
    v14 = &unk_1E58E5C50;
    objc_copyWeak(&v15, (id *)buf);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&v11];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

+ (NSXPCInterface)callCapabilitiesServerXPCInterface
{
  if (callCapabilitiesServerXPCInterface_onceToken != -1) {
    dispatch_once(&callCapabilitiesServerXPCInterface_onceToken, &__block_literal_global_62);
  }
  v2 = (void *)callCapabilitiesServerXPCInterface_callCapabilitiesServerXPCInterface;

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)callCapabilitiesClientXPCInterface
{
  if (callCapabilitiesClientXPCInterface_onceToken != -1) {
    dispatch_once(&callCapabilitiesClientXPCInterface_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)callCapabilitiesClientXPCInterface_callCapabilitiesClientXPCInterface;

  return (NSXPCInterface *)v2;
}

void __36__TUCallCapabilitiesXPCClient_state__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    [v2 _retrieveState];
    v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

- (TUCallCapabilitiesState)state
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  uint64_t v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__TUCallCapabilitiesXPCClient_state__block_invoke;
  v6[3] = &unk_1E58E6E90;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUCallCapabilitiesState *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __35__TUCallCapabilitiesXPCClient_init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(int **)(a1 + 32);
  v3 = [v2 queue];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __35__TUCallCapabilitiesXPCClient_init__block_invoke_2;
  id v8 = &unk_1E58E5F18;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", v2 + 2, v3, &v5);

  objc_msgSend(*(id *)(a1 + 32), "_retrieveState", v5, v6, v7, v8);
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  [WeakRetained registerClient:*(void *)(a1 + 32)];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (TUCallCapabilitiesXPCClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)TUCallCapabilitiesXPCClient;
  v2 = [(TUCallCapabilitiesXPCClient *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callcapabilitiesxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v2->_delegateToQueue;
    v2->_delegateToQueue = (NSMapTable *)v5;

    uint64_t v7 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__TUCallCapabilitiesXPCClient_init__block_invoke;
    block[3] = &unk_1E58E5BE0;
    v10 = v2;
    dispatch_async(v7, block);
  }
  return v2;
}

uint64_t __65__TUCallCapabilitiesXPCClient_callCapabilitiesServerXPCInterface__block_invoke()
{
  callCapabilitiesServerXPCInterface_callCapabilitiesServerXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED619C8];

  return MEMORY[0x1F41817F8]();
}

uint64_t __65__TUCallCapabilitiesXPCClient_callCapabilitiesClientXPCInterface__block_invoke()
{
  callCapabilitiesClientXPCInterface_callCapabilitiesClientXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED331C0];

  return MEMORY[0x1F41817F8]();
}

void __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Received initial call capabilities state: %p", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _updateState:v3];
}

- (void)_updateState:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [(TUCallCapabilitiesXPCClient *)self queue];
  dispatch_assert_queue_V2(v6);

  if (self->_state)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__TUCallCapabilitiesXPCClient__updateState___block_invoke;
    v8[3] = &unk_1E58E5C08;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  else
  {
    objc_storeStrong((id *)&self->_state, a3);
    id v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Updated to newState: %@", buf, 0xCu);
    }
  }
}

+ (TUCallCapabilitiesXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);

  return (TUCallCapabilitiesXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUCallCapabilitiesXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_1);

  return (TUCallCapabilitiesXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

void __35__TUCallCapabilitiesXPCClient_init__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _retrieveState];
}

- (void)dealloc
{
  notify_cancel(self->_token);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUCallCapabilitiesXPCClient;
  [(TUCallCapabilitiesXPCClient *)&v3 dealloc];
}

- (void)handleServerDisconnect
{
  objc_super v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  int v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Server did disconnect", v6, 2u);
  }

  state = self->_state;
  self->_state = 0;
}

void __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v6, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  return [*(id *)(a1 + 32) handleServerDisconnect];
}

void __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2_9;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __44__TUCallCapabilitiesXPCClient_xpcConnection__block_invoke_2_9(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  return [*(id *)(a1 + 32) handleServerDisconnect];
}

- (id)asynchronousServer
{
  uint64_t v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else
  {
    id v7 = [(TUCallCapabilitiesXPCClient *)self xpcConnection];
    id v6 = [v7 remoteObjectProxy];
  }

  return v6;
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUCallCapabilitiesXPCClient *)self xpcConnection];
    id v8 = [v9 remoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__TUCallCapabilitiesXPCClient_addDelegate_queue___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __49__TUCallCapabilitiesXPCClient_addDelegate_queue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__TUCallCapabilitiesXPCClient_removeDelegate___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__TUCallCapabilitiesXPCClient_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)performDelegateCallbackBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * v5);
        id v7 = [*(id *)(a1 + 32) delegateToQueue];
        id v8 = [v7 objectForKey:v6];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke_2;
        block[3] = &unk_1E58E6760;
        id v9 = *(id *)(a1 + 40);
        void block[4] = v6;
        id v12 = v9;
        dispatch_async(v8, block);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

uint64_t __60__TUCallCapabilitiesXPCClient_performDelegateCallbackBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setRelayCallingEnabled:(BOOL)a3
{
  uint64_t v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TUCallCapabilitiesXPCClient_setRelayCallingEnabled___block_invoke;
  v6[3] = &unk_1E58E6280;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __54__TUCallCapabilitiesXPCClient_setRelayCallingEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setRelayCallingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__TUCallCapabilitiesXPCClient_setRelayCallingEnabled_forDeviceWithID___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __70__TUCallCapabilitiesXPCClient_setRelayCallingEnabled_forDeviceWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setRelayCallingEnabled:*(unsigned __int8 *)(a1 + 48) forDeviceWithID:*(void *)(a1 + 40)];
}

- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__TUCallCapabilitiesXPCClient_setWiFiCallingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __79__TUCallCapabilitiesXPCClient_setWiFiCallingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setWiFiCallingEnabled:*(unsigned __int8 *)(a1 + 48) forSenderIdentityWithUUID:*(void *)(a1 + 40)];
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__TUCallCapabilitiesXPCClient_setWiFiCallingRoamingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __86__TUCallCapabilitiesXPCClient_setWiFiCallingRoamingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setWiFiCallingRoamingEnabled:*(unsigned __int8 *)(a1 + 48) forSenderIdentityWithUUID:*(void *)(a1 + 40)];
}

- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TUCallCapabilitiesXPCClient_setVoLTECallingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __80__TUCallCapabilitiesXPCClient_setVoLTECallingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setVoLTECallingEnabled:*(unsigned __int8 *)(a1 + 48) forSenderIdentityWithUUID:*(void *)(a1 + 40)];
}

- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__TUCallCapabilitiesXPCClient_setThumperCallingEnabled_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __82__TUCallCapabilitiesXPCClient_setThumperCallingEnabled_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setThumperCallingEnabled:*(unsigned __int8 *)(a1 + 48) forSenderIdentityWithUUID:*(void *)(a1 + 40)];
}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(TUCallCapabilitiesXPCClient *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__TUCallCapabilitiesXPCClient_setThumperCallingAllowed_onSecondaryDeviceWithID_forSenderIdentityWithUUID___block_invoke;
  v13[3] = &unk_1E58E6EB8;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __106__TUCallCapabilitiesXPCClient_setThumperCallingAllowed_onSecondaryDeviceWithID_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setThumperCallingAllowed:*(unsigned __int8 *)(a1 + 56) onSecondaryDeviceWithID:*(void *)(a1 + 40) forSenderIdentityWithUUID:*(void *)(a1 + 48)];
}

- (void)setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__TUCallCapabilitiesXPCClient_setThumperCallingAllowedOnDefaultPairedDevice_forSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E58E6DB0;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __103__TUCallCapabilitiesXPCClient_setThumperCallingAllowedOnDefaultPairedDevice_forSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 setThumperCallingAllowedOnDefaultPairedDevice:*(unsigned __int8 *)(a1 + 48) forSenderIdentityWithUUID:*(void *)(a1 + 40)];
}

- (void)endEmergencyCallbackMode
{
  uint64_t v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TUCallCapabilitiesXPCClient_endEmergencyCallbackMode__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __55__TUCallCapabilitiesXPCClient_endEmergencyCallbackMode__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) asynchronousServer];
  [v1 endEmergencyCallbackMode];
}

- (void)invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E58E5C08;
  void block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(v5, block);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  +[TUCallCapabilities _sendNotificationsAndCallbacksAfterRunningBlock:v8];
}

void __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:*(void *)(a1 + 40)];
}

void __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3;
  v4[3] = &unk_1E58E5C08;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __103__TUCallCapabilitiesXPCClient_invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) senderIdentityCapabilitiesStateByUUID];
  id v2 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 wiFiCallingCapabilitiesState];
  [v3 invalidateProvisioningURL];
}

- (void)invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke;
  block[3] = &unk_1E58E5C08;
  void block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(v5, block);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  +[TUCallCapabilities _sendNotificationsAndCallbacksAfterRunningBlock:v8];
}

void __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asynchronousServer];
  [v2 invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:*(void *)(a1 + 40)];
}

void __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3;
  v4[3] = &unk_1E58E5C08;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __106__TUCallCapabilitiesXPCClient_invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) senderIdentityCapabilitiesStateByUUID];
  id v2 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 thumperCallingCapabilitiesState];
  [v3 invalidateProvisioningURL];
}

- (void)requestPinFromPrimaryDevice
{
  uint64_t v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__TUCallCapabilitiesXPCClient_requestPinFromPrimaryDevice__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __58__TUCallCapabilitiesXPCClient_requestPinFromPrimaryDevice__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) asynchronousServer];
  [v1 requestPinFromPrimaryDevice];
}

- (void)cancelPinRequestFromPrimaryDevice
{
  uint64_t v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__TUCallCapabilitiesXPCClient_cancelPinRequestFromPrimaryDevice__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __64__TUCallCapabilitiesXPCClient_cancelPinRequestFromPrimaryDevice__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) asynchronousServer];
  [v1 cancelPinRequestFromPrimaryDevice];
}

- (void)invalidate
{
  uint64_t v3 = [(TUCallCapabilitiesXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__TUCallCapabilitiesXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __41__TUCallCapabilitiesXPCClient_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_1);
  [WeakRetained unregisterClient:*(void *)(a1 + 32)];
}

- (void)capabilityStateUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallCapabilitiesXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__TUCallCapabilitiesXPCClient_capabilityStateUpdated___block_invoke;
  v7[3] = &unk_1E58E5C08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__TUCallCapabilitiesXPCClient_capabilityStateUpdated___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "TUCallCapabilitiesXPCClient - capabilityStateUpdated: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _updateState:*(void *)(a1 + 32)];
}

void __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __44__TUCallCapabilitiesXPCClient__updateState___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_2;
  v2[3] = &unk_1E58E5C08;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  +[TUCallCapabilities _sendNotificationsAndCallbacksAfterRunningBlock:v2];
}

void __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_3;
  v4[3] = &unk_1E58E5C08;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __44__TUCallCapabilitiesXPCClient__updateState___block_invoke_3(uint64_t a1)
{
}

- (void)setState:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

void __45__TUCallCapabilitiesXPCClient__retrieveState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Error grabbing remote object proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end