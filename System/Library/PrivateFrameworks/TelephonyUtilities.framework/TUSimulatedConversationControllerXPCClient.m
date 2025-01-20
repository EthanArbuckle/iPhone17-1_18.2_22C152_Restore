@interface TUSimulatedConversationControllerXPCClient
+ (NSXPCInterface)simulatedConversationControllerClientXPCInterface;
+ (NSXPCInterface)simulatedConversationControllerServerXPCInterface;
+ (id)simulatedConversationControllerAllowedClasses;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUSimulatedConversationControllerXPCClient)init;
- (id)asynchronousServerWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversation:(id)a5;
- (void)createIncomingConversationWithHandles:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeRemoteParticipant:(id)a3 fromConversation:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversation:(id)a5;
@end

@implementation TUSimulatedConversationControllerXPCClient

- (TUSimulatedConversationControllerXPCClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUSimulatedConversationControllerXPCClient;
  v2 = [(TUSimulatedConversationControllerXPCClient *)&v8 init];
  if (v2)
  {
    v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Initializing TUSimulatedConversationControllerXPCClient", v7, 2u);
    }

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.telephonyutilities.simulatedconversationcontrollerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUSimulatedConversationControllerXPCClient;
  [(TUSimulatedConversationControllerXPCClient *)&v3 dealloc];
}

- (void)updateParticipant:(id)a3 withUpdate:(id)a4 onConversation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(TUSimulatedConversationControllerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_12];
  v11 = [v8 groupUUID];

  [v12 updateParticipant:v10 withUpdate:v9 onConversationWithGroupUUID:v11];
}

void __90__TUSimulatedConversationControllerXPCClient_updateParticipant_withUpdate_onConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Updating simulated participant failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)addRemoteParticipantWithHandle:(id)a3 update:(id)a4 toConversation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(TUSimulatedConversationControllerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_5];
  v11 = [v8 groupUUID];

  [v12 addRemoteParticipantWithHandle:v10 update:v9 toConversationWithGroupUUID:v11];
}

void __99__TUSimulatedConversationControllerXPCClient_addRemoteParticipantWithHandle_update_toConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Adding remote participant failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)removeRemoteParticipant:(id)a3 fromConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUSimulatedConversationControllerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_7];
  id v8 = [v6 groupUUID];

  [v9 removeRemoteParticipant:v7 fromConversationWithGroupUUID:v8];
}

void __87__TUSimulatedConversationControllerXPCClient_removeRemoteParticipant_fromConversation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Remove remote participant failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)createIncomingConversationWithHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(TUSimulatedConversationControllerXPCClient *)self asynchronousServerWithErrorHandler:&__block_literal_global_9];
  [v5 createIncomingConversationWithHandles:v4];
}

void __84__TUSimulatedConversationControllerXPCClient_createIncomingConversationWithHandles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Creating incoming simulated conversation failed with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  objc_super v3 = [(TUSimulatedConversationControllerXPCClient *)self queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__TUSimulatedConversationControllerXPCClient_invalidate__block_invoke;
  v4[3] = &unk_1E58E5C50;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__TUSimulatedConversationControllerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[1] invalidate];
    WeakRetained = v2;
  }
}

- (NSXPCConnection)xpcConnection
{
  objc_super v3 = [(TUSimulatedConversationControllerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_xpcConnection;
}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Starting XPC Connection.", (uint8_t *)buf, 2u);
    }

    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.simulatedconversationcontroller" options:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    uint64_t v6 = [(id)objc_opt_class() simulatedConversationControllerServerXPCInterface];
    [*(id *)(*(void *)(a1 + 32) + 8) setRemoteObjectInterface:v6];

    id v7 = [(id)objc_opt_class() simulatedConversationControllerClientXPCInterface];
    [*(id *)(*(void *)(a1 + 32) + 8) setExportedInterface:v7];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setExportedObject:");
    objc_initWeak(buf, *(id *)(a1 + 32));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_12;
    v13[3] = &unk_1E58E5C50;
    objc_copyWeak(&v14, buf);
    [*(id *)(*(void *)(a1 + 32) + 8) setInvalidationHandler:v13];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_13;
    v11 = &unk_1E58E5C50;
    objc_copyWeak(&v12, buf);
    [*(id *)(*(void *)(a1 + 32) + 8) setInterruptionHandler:&v8];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

void __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2_14;
    block[3] = &unk_1E58E5BE0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __59__TUSimulatedConversationControllerXPCClient_xpcConnection__block_invoke_2_14(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUSimulatedConversationControllerXPCClient *)self xpcConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUSimulatedConversationControllerXPCClient *)self xpcConnection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

+ (id)simulatedConversationControllerAllowedClasses
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

+ (NSXPCInterface)simulatedConversationControllerClientXPCInterface
{
  if (simulatedConversationControllerClientXPCInterface_onceToken != -1) {
    dispatch_once(&simulatedConversationControllerClientXPCInterface_onceToken, &__block_literal_global_24);
  }
  id v2 = (void *)simulatedConversationControllerClientXPCInterface_conversationProviderManagerClientXPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __95__TUSimulatedConversationControllerXPCClient_simulatedConversationControllerClientXPCInterface__block_invoke()
{
  simulatedConversationControllerClientXPCInterface_conversationProviderManagerClientXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED2CD50];

  return MEMORY[0x1F41817F8]();
}

+ (NSXPCInterface)simulatedConversationControllerServerXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__TUSimulatedConversationControllerXPCClient_simulatedConversationControllerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (simulatedConversationControllerServerXPCInterface_onceToken != -1) {
    dispatch_once(&simulatedConversationControllerServerXPCInterface_onceToken, block);
  }
  id v2 = (void *)simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface;

  return (NSXPCInterface *)v2;
}

void __95__TUSimulatedConversationControllerXPCClient_simulatedConversationControllerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61968];
  uint64_t v3 = (void *)simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface;
  simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface = v2;

  uint64_t v4 = (void *)simulatedConversationControllerServerXPCInterface_conversationProviderManagerXPCInterface;
  id v5 = [*(id *)(a1 + 32) simulatedConversationControllerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_createIncomingConversationWithHandles_ argumentIndex:0 ofReply:0];
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end