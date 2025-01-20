@interface TUConversationProviderManagerXPCClient
+ (NSSet)conversationProviderManagerAllowedClasses;
+ (NSXPCInterface)conversationProviderManagerClientXPCInterface;
+ (NSXPCInterface)conversationProviderManagerServerXPCInterface;
+ (TUConversationProviderManagerXPCServer)asynchronousServer;
+ (TUConversationProviderManagerXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (BOOL)hasInitialState;
- (BOOL)hasRequestedInitialState;
- (BOOL)shouldConnectToHost;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUConversationProviderManagerXPCClient)init;
- (id)asynchronousServerWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int)shouldConnectToken;
- (void)_invokeCompletionHandler:(id)a3;
- (void)_requestInitialStateIfNecessary;
- (void)_requestInitialStateWithCompletionHandler:(id)a3;
- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6;
- (void)init;
- (void)invalidate;
- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4;
- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4;
- (void)registerWithCompletionHandler:(id)a3;
- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6;
- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)setHasInitialState:(BOOL)a3;
- (void)setHasRequestedInitialState:(BOOL)a3;
- (void)setShouldConnectToHost:(BOOL)a3;
- (void)setShouldConnectToken:(int)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation TUConversationProviderManagerXPCClient

+ (TUConversationProviderManagerXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_4);

  return (TUConversationProviderManagerXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUConversationProviderManagerXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_4);

  return (TUConversationProviderManagerXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

- (TUConversationProviderManagerXPCClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)TUConversationProviderManagerXPCClient;
  v2 = [(TUConversationProviderManagerXPCClient *)&v13 init];
  if (v2)
  {
    v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Initializing TUConversationProviderManagerXPCClient", (uint8_t *)buf, 2u);
    }

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.telephonyutilities.conversationprovidermanagerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak(buf, v2);
    v6 = v2->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__TUConversationProviderManagerXPCClient_init__block_invoke;
    handler[3] = &unk_1E58E5F18;
    objc_copyWeak(&v11, buf);
    notify_register_dispatch("CSDConversationProviderManagerClientsShouldConnectNotification", &v2->_shouldConnectToken, v6, handler);
    id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_4);
    v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(TUConversationProviderManagerXPCClient *)(uint64_t)v2 init];
    }

    [WeakRetained registerClient:v2];
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __46__TUConversationProviderManagerXPCClient_init__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "CSDConversationProviderManagerClientsShouldConnectNotification";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection for ProviderManager1", buf, 0xCu);
  }

  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__TUConversationProviderManagerXPCClient_init__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __46__TUConversationProviderManagerXPCClient_init__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "CSDConversationProviderManagerClientsShouldConnectNotification";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection for ProviderManager2", (uint8_t *)&v4, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
  return [*(id *)(a1 + 32) _requestInitialStateWithCompletionHandler:0];
}

- (void)dealloc
{
  notify_cancel(self->_shouldConnectToken);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUConversationProviderManagerXPCClient;
  [(TUConversationProviderManagerXPCClient *)&v3 dealloc];
}

- (void)registerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationProviderManagerXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__TUConversationProviderManagerXPCClient_registerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __72__TUConversationProviderManagerXPCClient_registerWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) hasRequestedInitialState];
  objc_super v3 = *(void **)(a1 + 32);
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

- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __94__TUConversationProviderManagerXPCClient_conversationProviderForIdentifier_completionHandler___block_invoke;
  v14 = &unk_1E58E7648;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = [(TUConversationProviderManagerXPCClient *)self asynchronousServerWithErrorHandler:&v11];
  objc_msgSend(v10, "conversationProviderForIdentifier:completionHandler:", v9, v8, v11, v12, v13, v14);
}

void __94__TUConversationProviderManagerXPCClient_conversationProviderForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error getting conversation provider with identifier: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __92__TUConversationProviderManagerXPCClient_registerForCallbacksForProvider_completionHandler___block_invoke;
  v14 = &unk_1E58E7648;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(TUConversationProviderManagerXPCClient *)self asynchronousServerWithErrorHandler:&v11];
  objc_msgSend(v10, "registerForCallbacksForProvider:completionHandler:", v9, v8, v11, v12, v13, v14);
}

void __92__TUConversationProviderManagerXPCClient_registerForCallbacksForProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error registering callbacks for conversation provider: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __89__TUConversationProviderManagerXPCClient_registerConversationProvider_completionHandler___block_invoke;
  v14 = &unk_1E58E7648;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = [(TUConversationProviderManagerXPCClient *)self asynchronousServerWithErrorHandler:&v11];
  objc_msgSend(v10, "registerConversationProvider:completionHandler:", v9, v8, v11, v12, v13, v14);
}

void __89__TUConversationProviderManagerXPCClient_registerConversationProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error registering conversation provider: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __126__TUConversationProviderManagerXPCClient_generatePseudonymHandleForConversationProvider_expiryDuration_URI_completionHandler___block_invoke;
  v19 = &unk_1E58E7648;
  id v20 = v10;
  id v21 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = a5;
  id v15 = [(TUConversationProviderManagerXPCClient *)self asynchronousServerWithErrorHandler:&v16];
  objc_msgSend(v15, "generatePseudonymHandleForConversationProvider:expiryDuration:URI:completionHandler:", v13, v14, v12, a4, v16, v17, v18, v19);
}

void __126__TUConversationProviderManagerXPCClient_generatePseudonymHandleForConversationProvider_expiryDuration_URI_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error generating pseudonym handle for conversation provider: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void, id))(v6 + 16))(v6, 0, 0, v3);
  }
}

- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __120__TUConversationProviderManagerXPCClient_renewPseudonymHandle_forConversationProvider_expirationDate_completionHandler___block_invoke;
  v18[3] = &unk_1E58E68C8;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = a5;
  uint64_t v17 = [(TUConversationProviderManagerXPCClient *)self asynchronousServerWithErrorHandler:v18];
  [v17 renewPseudonymHandle:v15 forConversationProvider:v14 expirationDate:v16 completionHandler:v13];
}

void __120__TUConversationProviderManagerXPCClient_renewPseudonymHandle_forConversationProvider_expirationDate_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error renewing pseudonym handle: %@ for conversation provider: %@ error: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, void, void, id))(v7 + 16))(v7, 0, 0, v3);
  }
}

- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__TUConversationProviderManagerXPCClient_revokePseudonymHandle_forConversationProvider_completionHandler___block_invoke;
  v15[3] = &unk_1E58E68C8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = [(TUConversationProviderManagerXPCClient *)self asynchronousServerWithErrorHandler:v15];
  [v14 revokePseudonymHandle:v13 forConversationProvider:v12 completionHandler:v11];
}

void __106__TUConversationProviderManagerXPCClient_revokePseudonymHandle_forConversationProvider_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error revoking pseudonym handle: %@ for conversation provider: %@ error: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v3);
  }
}

- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__TUConversationProviderManagerXPCClient_doesHandle_correspondToConversationProvider_completionHandler___block_invoke;
  v15[3] = &unk_1E58E68C8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = [(TUConversationProviderManagerXPCClient *)self asynchronousServerWithErrorHandler:v15];
  [v14 doesHandle:v13 correspondToConversationProvider:v12 completionHandler:v11];
}

void __104__TUConversationProviderManagerXPCClient_doesHandle_correspondToConversationProvider_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error when checking if pseudonym handle: %@ corresponds to conversation provider: %@ error: %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v3);
  }
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  id v3 = [(TUConversationProviderManagerXPCClient *)self queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__TUConversationProviderManagerXPCClient_invalidate__block_invoke;
  v4[3] = &unk_1E58E5C50;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __52__TUConversationProviderManagerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained[2] invalidate];
    id v2 = objc_loadWeakRetained(&sAsynchronousServer_4);
    [v2 unregisterClient:v5];

    id v3 = objc_loadWeakRetained(&sSynchronousServer_4);
    [v3 unregisterClient:v5];
  }

  return MEMORY[0x1F41817F8]();
}

- (void)_requestInitialStateIfNecessary
{
  id v3 = [(TUConversationProviderManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(TUConversationProviderManagerXPCClient *)self hasRequestedInitialState])
  {
    [(TUConversationProviderManagerXPCClient *)self _requestInitialStateWithCompletionHandler:0];
  }
}

- (void)_requestInitialStateWithCompletionHandler:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(TUConversationProviderManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v4);

  [(TUConversationProviderManagerXPCClient *)self setHasRequestedInitialState:1];
  [(TUConversationProviderManagerXPCClient *)self _invokeCompletionHandler:v5];
}

- (void)_invokeCompletionHandler:(id)a3
{
  if (a3)
  {
    uint64_t v4 = dispatch_get_global_queue(21, 0);
    dispatch_async(v4, a3);
  }
}

- (NSXPCConnection)xpcConnection
{
  id v3 = [(TUConversationProviderManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_sync(v3, block);

  return self->_xpcConnection;
}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Starting XPC Connection.", (uint8_t *)buf, 2u);
    }

    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.conversationprovidermanager" options:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v6 = [(id)objc_opt_class() conversationProviderManagerServerXPCInterface];
    [*(id *)(*(void *)(a1 + 32) + 16) setRemoteObjectInterface:v6];

    uint64_t v7 = [(id)objc_opt_class() conversationProviderManagerClientXPCInterface];
    [*(id *)(*(void *)(a1 + 32) + 16) setExportedInterface:v7];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setExportedObject:");
    objc_initWeak(buf, *(id *)(a1 + 32));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_9;
    v13[3] = &unk_1E58E5C50;
    objc_copyWeak(&v14, buf);
    [*(id *)(*(void *)(a1 + 32) + 16) setInvalidationHandler:v13];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    __int16 v10 = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_10;
    uint64_t v11 = &unk_1E58E5C50;
    objc_copyWeak(&v12, buf);
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:&v8];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;
}

void __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2_11;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __55__TUConversationProviderManagerXPCClient_xpcConnection__block_invoke_2_11(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_4);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    uint64_t v8 = [(TUConversationProviderManagerXPCClient *)self xpcConnection];
    id v7 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_4);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    uint64_t v8 = [(TUConversationProviderManagerXPCClient *)self xpcConnection];
    id v7 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

+ (NSSet)conversationProviderManagerAllowedClasses
{
  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  return (NSSet *)objc_msgSend(v16, "setWithObjects:", v15, v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
}

+ (NSXPCInterface)conversationProviderManagerClientXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__TUConversationProviderManagerXPCClient_conversationProviderManagerClientXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (conversationProviderManagerClientXPCInterface_onceToken != -1) {
    dispatch_once(&conversationProviderManagerClientXPCInterface_onceToken, block);
  }
  uint64_t v2 = (void *)conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface;

  return (NSXPCInterface *)v2;
}

void __87__TUConversationProviderManagerXPCClient_conversationProviderManagerClientXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED4B168];
  uint64_t v3 = (void *)conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface;
  conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface = v2;

  uint64_t v4 = (void *)conversationProviderManagerClientXPCInterface_conversationProviderManagerClientXPCInterface;
  id v5 = [*(id *)(a1 + 32) conversationProviderManagerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_updateConversationProviders_ argumentIndex:0 ofReply:0];
}

+ (NSXPCInterface)conversationProviderManagerServerXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__TUConversationProviderManagerXPCClient_conversationProviderManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (conversationProviderManagerServerXPCInterface_onceToken != -1) {
    dispatch_once(&conversationProviderManagerServerXPCInterface_onceToken, block);
  }
  uint64_t v2 = (void *)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;

  return (NSXPCInterface *)v2;
}

void __87__TUConversationProviderManagerXPCClient_conversationProviderManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61B48];
  uint64_t v3 = (void *)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;
  conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface = v2;

  uint64_t v4 = (void *)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;
  id v5 = [*(id *)(a1 + 32) conversationProviderManagerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_conversationProviders_ argumentIndex:0 ofReply:0];

  uint64_t v6 = (void *)conversationProviderManagerServerXPCInterface_conversationProviderManagerXPCInterface;
  id v7 = [*(id *)(a1 + 32) conversationProviderManagerAllowedClasses];
  [v6 setClasses:v7 forSelector:sel_registerConversationProvider_completionHandler_ argumentIndex:0 ofReply:0];
}

- (void)setXpcConnection:(id)a3
{
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
  _os_log_debug_impl(&dword_19C496000, log, OS_LOG_TYPE_DEBUG, "Registering TUConversationProviderManagerXPCClient %p with async server %p", (uint8_t *)&v3, 0x16u);
}

@end