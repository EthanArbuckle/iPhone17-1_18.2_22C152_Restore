@interface TUUIXPCHostConnection
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (TUUIXPCHostConnection)init;
- (TUUIXPCHostConnection)initWithConnection:(id)a3 hostDelegate:(id)a4 connectionDelegate:(id)a5 queue:(id)a6;
- (TUUIXPCHostConnectionDelegate)connectionDelegate;
- (TUUIXPCHostDelegate)hostDelegate;
- (id)remoteObjectProxy;
- (void)dealloc;
- (void)fetchInCallUIState:(id)a3;
- (void)fetchRemoteControlStatus:(id)a3;
- (void)handleRedialCommandWhileScreening:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionDelegate:(id)a3;
- (void)setHostDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)shouldHostHandleMRCommand:(unsigned int)a3 completion:(id)a4;
- (void)shouldHostHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5;
@end

@implementation TUUIXPCHostConnection

- (TUUIXPCHostConnection)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUUIXPCHostConnection.m", 56, @"%s is unavailable. Use a designated initializer instead", "-[TUUIXPCHostConnection init]");

  return 0;
}

- (TUUIXPCHostConnection)initWithConnection:(id)a3 hostDelegate:(id)a4 connectionDelegate:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)TUUIXPCHostConnection;
  v15 = [(TUUIXPCHostConnection *)&v30 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a6);
    objc_storeStrong((id *)&v16->_connection, a3);
    v17 = [(TUUIXPCHostConnection *)v16 connection];
    [v17 setExportedObject:v16];

    v18 = [MEMORY[0x1E4F29280] hostConnectionInterface];
    v19 = [(TUUIXPCHostConnection *)v16 connection];
    [v19 setExportedInterface:v18];

    v20 = [MEMORY[0x1E4F29280] remoteObjectInterface];
    v21 = [(TUUIXPCHostConnection *)v16 connection];
    [v21 setRemoteObjectInterface:v20];

    [(TUUIXPCHostConnection *)v16 setHostDelegate:v12];
    [(TUUIXPCHostConnection *)v16 setConnectionDelegate:v13];
    objc_initWeak(&location, v16);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke;
    v27[3] = &unk_1E58E5C50;
    objc_copyWeak(&v28, &location);
    v22 = [(TUUIXPCHostConnection *)v16 connection];
    [v22 setInvalidationHandler:v27];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_77;
    v25[3] = &unk_1E58E5C50;
    objc_copyWeak(&v26, &location);
    v23 = [(TUUIXPCHostConnection *)v16 connection];
    [v23 setInterruptionHandler:v25];

    [(NSXPCConnection *)v16->_connection resume];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for TUUIXPCHostConnection: %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) connectionDelegate];
  [v4 connectionInvalidated:*(void *)(a1 + 32)];
}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_77(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2_78;
    block[3] = &unk_1E58E5BE0;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2_78(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for call TUUIXPCHostConnection: %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) connection];
  [v4 invalidate];
}

- (void)dealloc
{
  uint64_t v3 = [(TUUIXPCHostConnection *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)TUUIXPCHostConnection;
  [(TUUIXPCHostConnection *)&v4 dealloc];
}

- (id)remoteObjectProxy
{
  v2 = [(TUUIXPCHostConnection *)self connection];
  uint64_t v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(TUUIXPCHostConnection *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__TUUIXPCHostConnection_shouldHostHandleMRCommand_completion___block_invoke;
  block[3] = &unk_1E58E6088;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __62__TUUIXPCHostConnection_shouldHostHandleMRCommand_completion___block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Asked to handle MRcommand", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) hostDelegate];
  [v3 shouldHandleMRCommand:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(TUUIXPCHostConnection *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__TUUIXPCHostConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E58E60B0;
  unsigned int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __79__TUUIXPCHostConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Asked to handle MRcommand", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) hostDelegate];
  [v3 shouldHandleMRCommand:*(unsigned int *)(a1 + 56) sourceIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  id v4 = a3;
  int v5 = [(TUUIXPCHostConnection *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__TUUIXPCHostConnection_handleRedialCommandWhileScreening___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__TUUIXPCHostConnection_handleRedialCommandWhileScreening___block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Asked to redial while screening", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) hostDelegate];
  [v3 handleRedialCommandWhileScreening:*(void *)(a1 + 40)];
}

- (void)fetchInCallUIState:(id)a3
{
  id v4 = a3;
  int v5 = [(TUUIXPCHostConnection *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__TUUIXPCHostConnection_fetchInCallUIState___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__TUUIXPCHostConnection_fetchInCallUIState___block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Asked to fetch UI state", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) hostDelegate];
  [v3 fetchInCallUIState:*(void *)(a1 + 40)];
}

- (void)fetchRemoteControlStatus:(id)a3
{
  id v4 = a3;
  int v5 = [(TUUIXPCHostConnection *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__TUUIXPCHostConnection_fetchRemoteControlStatus___block_invoke;
  v7[3] = &unk_1E58E60D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__TUUIXPCHostConnection_fetchRemoteControlStatus___block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Asked to fetch remote control status", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) hostDelegate];
  [v3 fetchRemoteControlStatus:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (TUUIXPCHostConnectionDelegate)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);

  return (TUUIXPCHostConnectionDelegate *)WeakRetained;
}

- (void)setConnectionDelegate:(id)a3
{
}

- (TUUIXPCHostDelegate)hostDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostDelegate);

  return (TUUIXPCHostDelegate *)WeakRetained;
}

- (void)setHostDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostDelegate);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end