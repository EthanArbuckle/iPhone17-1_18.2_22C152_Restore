@interface NPKTransientAssertion
- (NPKTransientAssertion)initWithQueue:(id)a3;
- (NSXPCConnection)xpcConnection;
- (id)_remoteObjectProxy;
- (void)_resyncState;
- (void)didEnterFieldForPassesWithUniqueIDs:(id)a3;
- (void)handleDelegatedDoublePressEventWithSource:(unint64_t)a3;
- (void)handleTerminalAuthenticationRequestedForPassWithUniqueID:(id)a3;
- (void)invalidate;
- (void)setXpcConnection:(id)a3;
@end

@implementation NPKTransientAssertion

- (NPKTransientAssertion)initWithQueue:(id)a3
{
  dispatch_queue_t v4 = (dispatch_queue_t)a3;
  v21.receiver = self;
  v21.super_class = (Class)NPKTransientAssertion;
  v5 = [(NPKTransientAssertion *)&v21 init];
  if (v5)
  {
    v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.NPKTransientPassServer" options:4096];
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D09F8B8];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D060D58];
    [(NSXPCConnection *)v6 setExportedInterface:v8];
    [(NSXPCConnection *)v6 setExportedObject:v5];
    objc_initWeak(&location, v5);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__NPKTransientAssertion_initWithQueue___block_invoke;
    v17[3] = &unk_2644D4C40;
    v9 = v5;
    v18 = v9;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v6 setInterruptionHandler:v17];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __39__NPKTransientAssertion_initWithQueue___block_invoke_107;
    v14[3] = &unk_2644D4C40;
    v10 = v9;
    v15 = v10;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:v14];
    if (!v4) {
      dispatch_queue_t v4 = dispatch_queue_create("NPKTransientAssertionQueue", 0);
    }
    [(NSXPCConnection *)v6 _setQueue:v4];
    [(NSXPCConnection *)v6 resume];
    xpcConnection = v10->_xpcConnection;
    v10->_xpcConnection = v6;
    v12 = v6;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __39__NPKTransientAssertion_initWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    dispatch_queue_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@: Transient assertion connection interrupted", (uint8_t *)&v7, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resyncState];
}

void __39__NPKTransientAssertion_initWithQueue___block_invoke_107(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    dispatch_queue_t v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = (id)objc_opt_class();
      id v5 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@: Transient assertion connection invalidated", (uint8_t *)&v7, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setXpcConnection:0];
}

- (id)_remoteObjectProxy
{
  xpcConnection = self->_xpcConnection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__NPKTransientAssertion__remoteObjectProxy__block_invoke;
  v5[3] = &unk_2644D29D0;
  v5[4] = self;
  BOOL v3 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __43__NPKTransientAssertion__remoteObjectProxy__block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = pk_Payment_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    v2 = pk_Payment_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = (id)objc_opt_class();
      id v3 = v5;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_ERROR, "Error: %@: Couldn't get remote object proxy", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)handleDelegatedDoublePressEventWithSource:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[NPKTransientAssertion handleDelegatedDoublePressEventWithSource:]";
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)handleTerminalAuthenticationRequestedForPassWithUniqueID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[NPKTransientAssertion handleTerminalAuthenticationRequestedForPassWithUniqueID:]";
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)didEnterFieldForPassesWithUniqueIDs:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "-[NPKTransientAssertion didEnterFieldForPassesWithUniqueIDs:]";
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_resyncState
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      int v6 = "-[NPKTransientAssertion _resyncState]";
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Subclasses to implement %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end