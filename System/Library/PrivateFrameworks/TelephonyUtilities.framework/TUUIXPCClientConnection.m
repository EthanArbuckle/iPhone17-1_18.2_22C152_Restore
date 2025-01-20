@interface TUUIXPCClientConnection
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUUIXPCClientConnection)initWithListenerEndpoint:(id)a3 callCenter:(id)a4;
- (id)host;
- (id)hostWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)fetchInCallUIState:(id)a3;
- (void)fetchRemoteControlStatus:(id)a3;
- (void)handleRedialCommandWhileScreening:(id)a3;
- (void)ping;
- (void)setCallCenter:(id)a3;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)shouldHostHandleMRCommand:(unsigned int)a3 completion:(id)a4;
- (void)shouldHostHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5;
@end

@implementation TUUIXPCClientConnection

- (TUUIXPCClientConnection)initWithListenerEndpoint:(id)a3 callCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TUUIXPCClientConnection;
  v8 = [(TUUIXPCClientConnection *)&v21 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
    connection = v8->_connection;
    v8->_connection = (NSXPCConnection *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.telephonyutilities.tuuixpcclient", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeWeak((id *)&v8->_callCenter, v7);
    v13 = [MEMORY[0x1E4F29280] hostInterface];
    [(NSXPCConnection *)v8->_connection setRemoteObjectInterface:v13];

    v14 = [MEMORY[0x1E4F29280] clientInterface];
    [(NSXPCConnection *)v8->_connection setExportedInterface:v14];

    [(NSXPCConnection *)v8->_connection setExportedObject:v8];
    objc_initWeak(&location, v8);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke;
    v18[3] = &unk_1E58E5C50;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v8->_connection setInvalidationHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_70;
    v16[3] = &unk_1E58E5C50;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v8->_connection setInterruptionHandler:v16];
    [(NSXPCConnection *)v8->_connection resume];
    [(TUUIXPCClientConnection *)v8 ping];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)ping
{
  id v2 = [(TUUIXPCClientConnection *)self hostWithErrorHandler:&__block_literal_global_76_0];
  [v2 ping];
}

- (id)hostWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUUIXPCClientConnection *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for TUUIXPCClientConnection %@", (uint8_t *)&v4, 0xCu);
  }
}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2_71;
    block[3] = &unk_1E58E5BE0;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2_71(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for TUUIXPCClientConnection: %@", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [*(id *)(a1 + 32) connection];
  [v4 invalidate];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUUIXPCClientConnection;
  [(TUUIXPCClientConnection *)&v3 dealloc];
}

- (id)host
{
  id v2 = [(TUUIXPCClientConnection *)self connection];
  objc_super v3 = [v2 remoteObjectProxy];

  return v3;
}

void __31__TUUIXPCClientConnection_ping__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error while pinging host: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = v4;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "shouldHostHandleMRCommand: %u", buf, 8u);
  }

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __64__TUUIXPCClientConnection_shouldHostHandleMRCommand_completion___block_invoke;
  v13 = &unk_1E58E6A48;
  int v15 = v4;
  id v14 = v6;
  id v8 = v6;
  uint64_t v9 = [(TUUIXPCClientConnection *)self hostWithErrorHandler:&v10];
  objc_msgSend(v9, "shouldHostHandleMRCommand:completion:", v4, v8, v10, v11, v12, v13);
}

void __64__TUUIXPCClientConnection_shouldHostHandleMRCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host to handle media remote command: %u error: %@", (uint8_t *)v6, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v20 = v6;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "shouldHostHandleMRCommand1: %u sourceIdentifier: %@", buf, 0x12u);
  }

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __81__TUUIXPCClientConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke;
  v16 = &unk_1E58E6A48;
  int v18 = v6;
  id v17 = v9;
  id v11 = v9;
  v12 = [(TUUIXPCClientConnection *)self hostWithErrorHandler:&v13];
  objc_msgSend(v12, "shouldHostHandleMRCommand:sourceIdentifier:completion:", v6, v8, v11, v13, v14, v15, v16);
}

void __81__TUUIXPCClientConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host to handle media remote command: %u error: %@", (uint8_t *)v6, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "handleRedialCommandWhileScreening: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__TUUIXPCClientConnection_handleRedialCommandWhileScreening___block_invoke;
  v8[3] = &unk_1E58E6A70;
  id v9 = v4;
  id v6 = v4;
  __int16 v7 = [(TUUIXPCClientConnection *)self hostWithErrorHandler:v8];
  [v7 handleRedialCommandWhileScreening:v6];
}

void __61__TUUIXPCClientConnection_handleRedialCommandWhileScreening___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host to handle redial request: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)fetchInCallUIState:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[TUUIXPCClientConnection fetchInCallUIState:]";
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%s: ", buf, 0xCu);
  }

  int v6 = [(TUUIXPCClientConnection *)self callCenter];
  uint64_t v7 = [v6 queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__TUUIXPCClientConnection_fetchInCallUIState___block_invoke;
  v9[3] = &unk_1E58E60D8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __46__TUUIXPCClientConnection_fetchInCallUIState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callCenter];
  id v3 = [v2 _allCalls];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v8 = [*(id *)(a1 + 32) hostWithErrorHandler:&__block_literal_global_80];
    [v8 fetchInCallUIState:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "No calls on the system so early returning since ICS shouldn't show any UI", buf, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [[TUUIContext alloc] initWithState:0];
    (*(void (**)(uint64_t, TUUIContext *, void))(v6 + 16))(v6, v7, 0);
  }
}

void __46__TUUIXPCClientConnection_fetchInCallUIState___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Error while asking host for UI state: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)fetchRemoteControlStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[TUUIXPCClientConnection fetchRemoteControlStatus:]";
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%s: ", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__TUUIXPCClientConnection_fetchRemoteControlStatus___block_invoke;
  v8[3] = &unk_1E58E5CC8;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(TUUIXPCClientConnection *)self hostWithErrorHandler:v8];
  [v7 fetchRemoteControlStatus:v6];
}

void __52__TUUIXPCClientConnection_fetchRemoteControlStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host for UI state, InCallService isn't running: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (TUCallCenter)callCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callCenter);

  return (TUCallCenter *)WeakRetained;
}

- (void)setCallCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_callCenter);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end