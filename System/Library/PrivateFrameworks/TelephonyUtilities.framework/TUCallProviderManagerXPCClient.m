@interface TUCallProviderManagerXPCClient
+ (NSXPCInterface)callProviderManagerClientXPCInterface;
+ (NSXPCInterface)callProviderManagerServerXPCInterface;
+ (TUCallProviderManagerXPCServer)asynchronousServer;
+ (TUCallProviderManagerXPCServer)synchronousServer;
+ (id)callProviderManagerAllowedClasses;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (BOOL)currentProcessCanAccessInitialState;
- (BOOL)openURL:(id)a3 isSensitive:(BOOL)a4 error:(id *)a5;
- (BOOL)requestedInitialState;
- (NSArray)sortedProviders;
- (NSDictionary)localProvidersByIdentifier;
- (NSDictionary)pairedHostDeviceProvidersByIdentifier;
- (NSDictionary)providersByIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUCallProvider)defaultAppProvider;
- (TUCallProviderManagerDataSourceDelegate)delegate;
- (TUCallProviderManagerXPCClient)init;
- (id)server;
- (id)serverWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int)token;
- (void)_requestInitialState;
- (void)_updateProvidersByIdentifier:(id)a3 localProvidersByIdentifier:(id)a4 pairedHostDeviceProvidersByIdentifier:(id)a5;
- (void)blockUntilInitialStateReceived;
- (void)dealloc;
- (void)donateUserIntentForProviderWithIdentifier:(id)a3;
- (void)invalidate;
- (void)launchAppForDialRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLocalProvidersByIdentifier:(id)a3;
- (void)setPairedHostDeviceProvidersByIdentifier:(id)a3;
- (void)setProvidersByIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestedInitialState:(BOOL)a3;
- (void)setToken:(int)a3;
- (void)setXpcConnection:(id)a3;
- (void)updateProvidersByIdentifier:(id)a3 localProvidersByIdentifier:(id)a4 pairedHostDeviceProvidersByIdentifier:(id)a5;
@end

@implementation TUCallProviderManagerXPCClient

- (void)_requestInitialState
{
  v3 = [(TUCallProviderManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  [(TUCallProviderManagerXPCClient *)self setRequestedInitialState:1];
  v4 = [(TUCallProviderManagerXPCClient *)self synchronousServerWithErrorHandler:&__block_literal_global_28_0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_29;
  v5[3] = &unk_1E58E7190;
  v5[4] = self;
  [v4 providersByIdentifier:v5];
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_2);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    v8 = [(TUCallProviderManagerXPCClient *)self xpcConnection];
    id v7 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (void)setRequestedInitialState:(BOOL)a3
{
  self->_requestedInitialState = a3;
}

- (NSXPCConnection)xpcConnection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.callprovidermanager" options:0];
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    v6 = [(id)objc_opt_class() callProviderManagerServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

    id v7 = [(id)objc_opt_class() callProviderManagerClientXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke;
    v11[3] = &unk_1E58E5C50;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_23;
    v9[3] = &unk_1E58E5C50;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v9];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

+ (NSXPCInterface)callProviderManagerServerXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUCallProviderManagerXPCClient_callProviderManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (callProviderManagerServerXPCInterface_onceToken != -1) {
    dispatch_once(&callProviderManagerServerXPCInterface_onceToken, block);
  }
  v2 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)callProviderManagerClientXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TUCallProviderManagerXPCClient_callProviderManagerClientXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (callProviderManagerClientXPCInterface_onceToken != -1) {
    dispatch_once(&callProviderManagerClientXPCInterface_onceToken, block);
  }
  v2 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;

  return (NSXPCInterface *)v2;
}

void __55__TUCallProviderManagerXPCClient_providersByIdentifier__block_invoke(uint64_t a1)
{
}

uint64_t __64__TUCallProviderManagerXPCClient_blockUntilInitialStateReceived__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) requestedInitialState];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _requestInitialState];
  }
  return result;
}

- (BOOL)requestedInitialState
{
  return self->_requestedInitialState;
}

id __46__TUCallProviderManagerXPCClient_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __71__TUCallProviderManagerXPCClient_callProviderManagerClientXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED369E0];
  v3 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface = v2;

  id v4 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  v5 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier_ argumentIndex:0 ofReply:0];

  v6 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  id v7 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v6 setClasses:v7 forSelector:sel_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier_ argumentIndex:1 ofReply:0];

  v8 = (void *)callProviderManagerClientXPCInterface_callProviderManagerClientXPCInterface;
  id v9 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v8 setClasses:v9 forSelector:sel_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier_ argumentIndex:2 ofReply:0];
}

+ (id)callProviderManagerAllowedClasses
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

void __38__TUCallProviderManagerXPCClient_init__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[TUCallProviderManager defaultProviders];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v9 = [v8 identifier];
        [v3 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [v3 copy];
  uint64_t v12 = a1 + 32;
  uint64_t v11 = *(void *)(a1 + 32);
  v13 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v14 = [v3 copy];
  v15 = *(void **)(*(void *)(a1 + 32) + 56);
  *(void *)(*(void *)v12 + 56) = v14;

  uint64_t v16 = [v3 copy];
  v17 = *(void **)(*(void *)(a1 + 32) + 48);
  *(void *)(*(void *)v12 + 48) = v16;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v18 = *(int **)(a1 + 32);
  v19 = [v18 queue];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __38__TUCallProviderManagerXPCClient_init__block_invoke_2;
  v24 = &unk_1E58E5F18;
  objc_copyWeak(&v25, &location);
  notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", v18 + 3, v19, &v21);

  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  objc_msgSend(WeakRetained, "registerClient:", *(void *)(a1 + 32), v21, v22, v23, v24);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_updateProvidersByIdentifier:(id)a3 localProvidersByIdentifier:(id)a4 pairedHostDeviceProvidersByIdentifier:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUCallProviderManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = TUDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "_updateProvidersByIdentifier providersByIdentifier,: %@", (uint8_t *)&v16, 0xCu);
  }

  v13 = TUDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "_updateProvidersByIdentifier localProvidersByIdentifier: %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v14 = TUDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl(&dword_19C496000, v14, OS_LOG_TYPE_DEFAULT, "_updateProvidersByIdentifier pairedHostDeviceProvidersByIdentifier: %@", (uint8_t *)&v16, 0xCu);
  }

  [(TUCallProviderManagerXPCClient *)self setProvidersByIdentifier:v8];
  [(TUCallProviderManagerXPCClient *)self setLocalProvidersByIdentifier:v9];
  [(TUCallProviderManagerXPCClient *)self setPairedHostDeviceProvidersByIdentifier:v10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained providersChangedForDataSource:self];
}

- (void)setProvidersByIdentifier:(id)a3
{
}

- (void)setPairedHostDeviceProvidersByIdentifier:(id)a3
{
}

- (void)setLocalProvidersByIdentifier:(id)a3
{
}

- (NSDictionary)providersByIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  uint64_t v3 = [(TUCallProviderManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__TUCallProviderManagerXPCClient_providersByIdentifier__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (BOOL)currentProcessCanAccessInitialState
{
  if (currentProcessCanAccessInitialState_onceToken != -1) {
    dispatch_once(&currentProcessCanAccessInitialState_onceToken, &__block_literal_global_26);
  }
  if (currentProcessCanAccessInitialState_isCurrentProcessEntitled) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  BOOL v2 = WeakRetained != 0;

  return v2;
}

- (void)blockUntilInitialStateReceived
{
  uint64_t v3 = [(TUCallProviderManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__TUCallProviderManagerXPCClient_blockUntilInitialStateReceived__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __69__TUCallProviderManagerXPCClient_currentProcessCanAccessInitialState__block_invoke()
{
  uint64_t result = TUCurrentProcessHasEntitlementCapability(@"access-call-providers");
  currentProcessCanAccessInitialState_isCurrentProcessEntitled = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCallProviderManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__TUCallProviderManagerXPCClient_setDelegate___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (TUCallProviderManagerXPCClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)TUCallProviderManagerXPCClient;
  BOOL v2 = [(TUCallProviderManagerXPCClient *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callprovidermanagerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__TUCallProviderManagerXPCClient_init__block_invoke;
    block[3] = &unk_1E58E5BE0;
    id v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

void __71__TUCallProviderManagerXPCClient_callProviderManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61A28];
  dispatch_queue_t v3 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface = v2;

  id v4 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  uint64_t v5 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_providersByIdentifier_ argumentIndex:0 ofReply:1];

  id v6 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  uint64_t v7 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v6 setClasses:v7 forSelector:sel_providersByIdentifier_ argumentIndex:1 ofReply:1];

  id v8 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  objc_super v9 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v8 setClasses:v9 forSelector:sel_providersByIdentifier_ argumentIndex:2 ofReply:1];

  id v10 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  uint64_t v11 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v10 setClasses:v11 forSelector:sel_sortedProviders_ argumentIndex:0 ofReply:1];

  id v12 = (void *)callProviderManagerServerXPCInterface_callProviderManagerServerXPCInterface;
  id v13 = [*(id *)(a1 + 32) callProviderManagerAllowedClasses];
  [v12 setClasses:v13 forSelector:sel_defaultAppProvider_ argumentIndex:0 ofReply:1];
}

+ (TUCallProviderManagerXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);

  return (TUCallProviderManagerXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUCallProviderManagerXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_2);

  return (TUCallProviderManagerXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

void __38__TUCallProviderManagerXPCClient_init__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && [WeakRetained requestedInitialState])
  {
    dispatch_queue_t v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      uint64_t v5 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v4, 0xCu);
    }

    [v2 _requestInitialState];
  }
}

- (void)dealloc
{
  notify_cancel(self->_token);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUCallProviderManagerXPCClient;
  [(TUCallProviderManagerXPCClient *)&v3 dealloc];
}

- (TUCallProviderManagerDataSourceDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  objc_super v3 = [(TUCallProviderManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TUCallProviderManagerXPCClient_delegate__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUCallProviderManagerDataSourceDelegate *)v4;
}

uint64_t __42__TUCallProviderManagerXPCClient_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x1F41817F8]();
}

- (NSDictionary)localProvidersByIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  objc_super v3 = [(TUCallProviderManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__TUCallProviderManagerXPCClient_localProvidersByIdentifier__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __60__TUCallProviderManagerXPCClient_localProvidersByIdentifier__block_invoke(uint64_t a1)
{
}

- (NSDictionary)pairedHostDeviceProvidersByIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  objc_super v3 = [(TUCallProviderManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__TUCallProviderManagerXPCClient_pairedHostDeviceProvidersByIdentifier__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __71__TUCallProviderManagerXPCClient_pairedHostDeviceProvidersByIdentifier__block_invoke(uint64_t a1)
{
}

- (BOOL)openURL:(id)a3 isSensitive:(BOOL)a4 error:(id *)a5
{
  return TUOpenURLWithError(a3, a4, 0, a5);
}

- (void)donateUserIntentForProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCallProviderManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E58E6A70;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_super v3 = [v2 synchronousServerWithErrorHandler:v4];
  [v3 donateUserIntentForProviderWithIdentifier:*(void *)(a1 + 40)];
}

void __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)launchAppForDialRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUCallProviderManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2;
  v4[3] = &unk_1E58E5CC8;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 serverWithErrorHandler:v4];
  [v3 launchAppForDialRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2_cold_1();
  }

  uint64_t v5 = *MEMORY[0x1E4F28A50];
  v9[0] = *MEMORY[0x1E4F28568];
  v9[1] = v5;
  v10[0] = @"Error communicating with callservicesd";
  v10[1] = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.TelephonyUtilities" code:1 userInfo:v6];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

- (TUCallProvider)defaultAppProvider
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  id v3 = [(TUCallProviderManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__TUCallProviderManagerXPCClient_defaultAppProvider__block_invoke;
  v6[3] = &unk_1E58E6E90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUCallProvider *)v4;
}

void __52__TUCallProviderManagerXPCClient_defaultAppProvider__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) synchronousServerWithErrorHandler:&__block_literal_global_12_0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__TUCallProviderManagerXPCClient_defaultAppProvider__block_invoke_13;
  v3[3] = &unk_1E58E7168;
  v3[4] = *(void *)(a1 + 40);
  [v2 defaultAppProvider:v3];
}

void __52__TUCallProviderManagerXPCClient_defaultAppProvider__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __52__TUCallProviderManagerXPCClient_defaultAppProvider__block_invoke_2_cold_1();
  }
}

void __52__TUCallProviderManagerXPCClient_defaultAppProvider__block_invoke_13(uint64_t a1, void *a2)
{
}

- (NSArray)sortedProviders
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = (id)MEMORY[0x1E4F1CBF0];
  id v3 = [(TUCallProviderManagerXPCClient *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__TUCallProviderManagerXPCClient_sortedProviders__block_invoke;
  v6[3] = &unk_1E58E6E90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __49__TUCallProviderManagerXPCClient_sortedProviders__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) synchronousServerWithErrorHandler:&__block_literal_global_16_0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__TUCallProviderManagerXPCClient_sortedProviders__block_invoke_17;
  v3[3] = &unk_1E58E6E00;
  v3[4] = *(void *)(a1 + 40);
  [v2 sortedProviders:v3];
}

void __49__TUCallProviderManagerXPCClient_sortedProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__TUCallProviderManagerXPCClient_sortedProviders__block_invoke_2_cold_1();
  }
}

void __49__TUCallProviderManagerXPCClient_sortedProviders__block_invoke_17(uint64_t a1, void *a2)
{
}

- (void)invalidate
{
  id v3 = [(TUCallProviderManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__TUCallProviderManagerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __44__TUCallProviderManagerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  [WeakRetained unregisterClient:*(void *)(a1 + 32)];
}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;
}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained queue];
    dispatch_async(v2, &__block_literal_global_26);

    id WeakRetained = v3;
  }
}

void __47__TUCallProviderManagerXPCClient_xpcConnection__block_invoke_2_24()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v1, 2u);
  }
}

- (id)server
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v6 = [(TUCallProviderManagerXPCClient *)self xpcConnection];
    id v5 = [v6 remoteObjectProxy];
  }

  return v5;
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_2);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    uint64_t v8 = [(TUCallProviderManagerXPCClient *)self xpcConnection];
    id v7 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

void __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_cold_1();
  }
}

uint64_t __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _updateProvidersByIdentifier:a2 localProvidersByIdentifier:a3 pairedHostDeviceProvidersByIdentifier:a4];
}

- (void)updateProvidersByIdentifier:(id)a3 localProvidersByIdentifier:(id)a4 pairedHostDeviceProvidersByIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUCallProviderManagerXPCClient *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __127__TUCallProviderManagerXPCClient_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier___block_invoke;
  v15[3] = &unk_1E58E63D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __127__TUCallProviderManagerXPCClient_updateProvidersByIdentifier_localProvidersByIdentifier_pairedHostDeviceProvidersByIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProvidersByIdentifier:*(void *)(a1 + 40) localProvidersByIdentifier:*(void *)(a1 + 48) pairedHostDeviceProvidersByIdentifier:*(void *)(a1 + 56)];
}

- (void)setQueue:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedHostDeviceProvidersByIdentifier, 0);
  objc_storeStrong((id *)&self->_localProvidersByIdentifier, 0);
  objc_storeStrong((id *)&self->_providersByIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __76__TUCallProviderManagerXPCClient_donateUserIntentForProviderWithIdentifier___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__TUCallProviderManagerXPCClient_launchAppForDialRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error requesting app launch: %@", v2, v3, v4, v5, v6);
}

void __52__TUCallProviderManagerXPCClient_defaultAppProvider__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error requesting defaultAppProvider: %@", v2, v3, v4, v5, v6);
}

void __49__TUCallProviderManagerXPCClient_sortedProviders__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error requesting sortedProviders: %@", v2, v3, v4, v5, v6);
}

void __54__TUCallProviderManagerXPCClient__requestInitialState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error requesting initial state: %@", v2, v3, v4, v5, v6);
}

@end