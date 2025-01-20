@interface TUCallHistoryManagerXPCClient
+ (NSXPCInterface)callHistoryManagerClientXPCInterface;
+ (NSXPCInterface)callHistoryManagerServerXPCInterface;
+ (TUCallHistoryManagerXPCServer)asynchronousServer;
+ (TUCallHistoryManagerXPCServer)synchronousServer;
+ (id)callHistoryManagerAllowedClasses;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUCallHistoryManagerXPCClient)init;
- (id)serverWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)handleServerDisconnect;
- (void)invalidate;
- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5;
- (void)setQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4;
@end

@implementation TUCallHistoryManagerXPCClient

+ (TUCallHistoryManagerXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_6);

  return (TUCallHistoryManagerXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUCallHistoryManagerXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_6);

  return (TUCallHistoryManagerXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

+ (id)callHistoryManagerAllowedClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (NSXPCInterface)callHistoryManagerClientXPCInterface
{
  if (callHistoryManagerClientXPCInterface_onceToken != -1) {
    dispatch_once(&callHistoryManagerClientXPCInterface_onceToken, &__block_literal_global_55);
  }
  v2 = (void *)callHistoryManagerClientXPCInterface_callHistoryManagerClientXPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __69__TUCallHistoryManagerXPCClient_callHistoryManagerClientXPCInterface__block_invoke()
{
  callHistoryManagerClientXPCInterface_callHistoryManagerClientXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED4D208];

  return MEMORY[0x1F41817F8]();
}

+ (NSXPCInterface)callHistoryManagerServerXPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__TUCallHistoryManagerXPCClient_callHistoryManagerServerXPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (callHistoryManagerServerXPCInterface_onceToken != -1) {
    dispatch_once(&callHistoryManagerServerXPCInterface_onceToken, block);
  }
  v2 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;

  return (NSXPCInterface *)v2;
}

void __69__TUCallHistoryManagerXPCClient_callHistoryManagerServerXPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED61C08];
  uint64_t v3 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface = v2;

  uint64_t v4 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  v5 = [*(id *)(a1 + 32) callHistoryManagerAllowedClasses];
  [v4 setClasses:v5 forSelector:sel_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID_ argumentIndex:0 ofReply:0];

  v6 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  v7 = [*(id *)(a1 + 32) callHistoryManagerAllowedClasses];
  [v6 setClasses:v7 forSelector:sel_reportRecentCallForConversation_withStartDate_avMode_ argumentIndex:0 ofReply:0];

  v8 = (void *)callHistoryManagerServerXPCInterface_callHistoryManagerServerXPCInterface;
  id v9 = [*(id *)(a1 + 32) callHistoryManagerAllowedClasses];
  [v8 setClasses:v9 forSelector:sel_reportRecentCallForConversation_withStartDate_avMode_ argumentIndex:1 ofReply:0];
}

- (TUCallHistoryManagerXPCClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)TUCallHistoryManagerXPCClient;
  uint64_t v2 = [(TUCallHistoryManagerXPCClient *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callhistorymanagerxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__TUCallHistoryManagerXPCClient_init__block_invoke;
    block[3] = &unk_1E58E5BE0;
    v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

void __37__TUCallHistoryManagerXPCClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_6);
  [WeakRetained registerClient:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUCallHistoryManagerXPCClient;
  [(TUCallHistoryManagerXPCClient *)&v3 dealloc];
}

- (void)handleServerDisconnect
{
  uint64_t v2 = [(TUCallHistoryManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v2);

  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Server disconnected.", v4, 2u);
  }
}

- (void)invalidate
{
  objc_super v3 = [(TUCallHistoryManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TUCallHistoryManagerXPCClient_invalidate__block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __43__TUCallHistoryManagerXPCClient_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_6);
  [WeakRetained unregisterClient:*(void *)(a1 + 32)];
}

- (void)updateOutgoingLocalParticipantUUID:(id)a3 forCallsWithOutgoingLocalParticipantUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TUCallHistoryManagerXPCClient *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke;
  block[3] = &unk_1E58E6258;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) synchronousServerWithErrorHandler:&__block_literal_global_65_0];
  [v2 updateOutgoingLocalParticipantUUID:*(void *)(a1 + 40) forCallsWithOutgoingLocalParticipantUUID:*(void *)(a1 + 48)];
}

void __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (void)reportRecentCallForConversation:(id)a3 withStartDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(TUCallHistoryManagerXPCClient *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke;
  v13[3] = &unk_1E58E6008;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) synchronousServerWithErrorHandler:&__block_literal_global_67_0];
  [v2 reportRecentCallForConversation:*(void *)(a1 + 40) withStartDate:*(void *)(a1 + 48) avMode:*(void *)(a1 + 56)];
}

void __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (NSXPCConnection)xpcConnection
{
  objc_super v3 = [(TUCallHistoryManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.callhistorymanager" options:0];
    id v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    id v7 = [(id)objc_opt_class() callHistoryManagerServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v7];

    id v8 = [(id)objc_opt_class() callHistoryManagerClientXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v8];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke;
    v12[3] = &unk_1E58E5C50;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_70;
    v10[3] = &unk_1E58E5C50;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v10];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", v6, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  return [*(id *)(a1 + 32) handleServerDisconnect];
}

void __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2_71;
    block[3] = &unk_1E58E5BE0;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __46__TUCallHistoryManagerXPCClient_xpcConnection__block_invoke_2_71(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  return [*(id *)(a1 + 32) handleServerDisconnect];
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_6);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
  }
  else
  {
    id v8 = [(TUCallHistoryManagerXPCClient *)self xpcConnection];
    id v7 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUCallHistoryManagerXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_6);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUCallHistoryManagerXPCClient *)self xpcConnection];
    id v8 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __109__TUCallHistoryManagerXPCClient_updateOutgoingLocalParticipantUUID_forCallsWithOutgoingLocalParticipantUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Error updating outgoing local participant UUID: %@", (uint8_t *)&v2, 0xCu);
}

void __86__TUCallHistoryManagerXPCClient_reportRecentCallForConversation_withStartDate_avMode___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Error reporting recent call for conversation: %@", (uint8_t *)&v2, 0xCu);
}

@end