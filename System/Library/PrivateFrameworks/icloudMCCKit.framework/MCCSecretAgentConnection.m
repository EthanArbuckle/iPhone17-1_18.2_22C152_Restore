@interface MCCSecretAgentConnection
- (MCCSecretAgentConnection)init;
- (MCCSecretAgentConnection)initWithListenerEndpoint:(id)a3;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (id)_connection;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_connectionInterruptionHandler;
- (void)_connectionInvalidationHandler;
- (void)dealloc;
@end

@implementation MCCSecretAgentConnection

- (MCCSecretAgentConnection)init
{
  return [(MCCSecretAgentConnection *)self initWithListenerEndpoint:0];
}

- (MCCSecretAgentConnection)initWithListenerEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCCSecretAgentConnection;
  v6 = [(MCCSecretAgentConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v7->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_262BBA000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MCCSecretAgentConnection *)self _connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MCCSecretAgentConnection *)self _connection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_connection
{
  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__MCCSecretAgentConnection__connection__block_invoke;
  v5[3] = &unk_2655BAB80;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  uint64_t v3 = __39__MCCSecretAgentConnection__connection__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_unfairLock);
  return v3;
}

id __39__MCCSecretAgentConnection__connection__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[2];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    id v4 = *(id *)(*(void *)(a1 + 32) + 24);
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    if (v4) {
      uint64_t v6 = [v5 initWithListenerEndpoint:v4];
    }
    else {
      uint64_t v6 = [v5 initWithMachServiceName:@"com.apple.icloudmailagent.secret.xpc" options:0];
    }
    uint64_t v7 = v6;

    uint64_t v8 = *(void *)(a1 + 32);
    objc_super v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;

    v10 = *(void **)(*(void *)(a1 + 32) + 16);
    v11 = +[MCCSecretAgentInterface XPCInterface];
    [v10 setRemoteObjectInterface:v11];

    v12 = *(void **)(*(void *)(a1 + 32) + 16);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__MCCSecretAgentConnection__connection__block_invoke_2;
    v17[3] = &unk_2655BA8E8;
    objc_copyWeak(&v18, &location);
    [v12 setInterruptionHandler:v17];
    v13 = *(void **)(*(void *)(a1 + 32) + 16);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__MCCSecretAgentConnection__connection__block_invoke_3;
    v15[3] = &unk_2655BA8E8;
    objc_copyWeak(&v16, &location);
    [v13 setInvalidationHandler:v15];
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  return v3;
}

void __39__MCCSecretAgentConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterruptionHandler];
}

void __39__MCCSecretAgentConnection__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidationHandler];
}

- (void)_connectionInterruptionHandler
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_262BBA000, log, OS_LOG_TYPE_DEBUG, "Connection to authorization service interrupted", v1, 2u);
}

- (void)_connectionInvalidationHandler
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_262BBA000, log, OS_LOG_TYPE_DEBUG, "Connection to authorization service invalidated", v1, 2u);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end