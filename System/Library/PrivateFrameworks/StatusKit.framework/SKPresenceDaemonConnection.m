@interface SKPresenceDaemonConnection
+ (NSXPCInterface)daemonDelegateXPCInterface;
+ (NSXPCInterface)daemonXPCInterface;
+ (id)logger;
- (NSXPCConnection)xpcConnection;
- (SKPresenceConnectionDelegateProtocol)connectionDelegate;
- (SKPresenceDaemonConnection)initWithPresenceDaemonDelegate:(id)a3 connectionDelegate:(id)a4;
- (SKPresenceDaemonDelegateProtocol)presenceDaemonDelegate;
- (id)asynchronousRemoteDaemonWithErrorHandler:(id)a3;
- (id)synchronousRemoteDaemonWithErrorHandler:(id)a3;
- (os_unfair_lock_s)lock;
- (unint64_t)_xpcConnectionOptions;
- (void)_resetConnectionHandlers;
- (void)invalidate;
- (void)setConnectionDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPresenceDaemonDelegate:(id)a3;
- (void)setXPCConnection:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SKPresenceDaemonConnection

- (SKPresenceDaemonConnection)initWithPresenceDaemonDelegate:(id)a3 connectionDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKPresenceDaemonConnection;
  v8 = [(SKPresenceDaemonConnection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presenceDaemonDelegate, v6);
    objc_storeWeak((id *)&v9->_connectionDelegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)asynchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKPresenceDaemonConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_2644B63B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresenceDaemonConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKPresenceDaemonConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_2644B63B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresenceDaemonConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(SKPresenceDaemonConnection *)self _resetConnectionHandlers];
  os_unfair_lock_unlock(p_lock);
}

- (void)_resetConnectionHandlers
{
  os_unfair_lock_assert_owner(&self->_lock);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_xpcConnection setExportedObject:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

+ (id)logger
{
  if (logger_onceToken_1 != -1) {
    dispatch_once(&logger_onceToken_1, &__block_literal_global_1);
  }
  v2 = (void *)logger__logger_1;
  return v2;
}

uint64_t __36__SKPresenceDaemonConnection_logger__block_invoke()
{
  logger__logger_1 = (uint64_t)os_log_create("com.apple.StatusKit", "PresenceDaemonConnection");
  return MEMORY[0x270F9A758]();
}

- (NSXPCConnection)xpcConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    unint64_t v5 = [(SKPresenceDaemonConnection *)self _xpcConnectionOptions];
    id v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.StatusKit.presence" options:v5];
    id v7 = self->_xpcConnection;
    self->_xpcConnection = v6;

    v8 = +[SKPresenceDaemonConnection daemonXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v8];

    v9 = +[SKPresenceDaemonConnection daemonDelegateXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v9];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenceDaemonDelegate);
    [(NSXPCConnection *)self->_xpcConnection setExportedObject:WeakRetained];

    objc_initWeak(&location, self);
    id from = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __43__SKPresenceDaemonConnection_xpcConnection__block_invoke;
    v19[3] = &unk_2644B63E0;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v19];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __43__SKPresenceDaemonConnection_xpcConnection__block_invoke_9;
    v16 = &unk_2644B63E0;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&v13];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  objc_super v11 = xpcConnection;
  os_unfair_lock_unlock(p_lock);
  return v11;
}

void __43__SKPresenceDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = +[SKPresenceDaemonConnection logger];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      int v6 = 134217984;
      uint64_t v7 = (int)[v5 processIdentifier];
      _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld invalidated", (uint8_t *)&v6, 0xCu);
    }
    os_unfair_lock_lock(WeakRetained + 2);
    [(os_unfair_lock_s *)WeakRetained _resetConnectionHandlers];
    os_unfair_lock_unlock(WeakRetained + 2);
    id v3 = [(os_unfair_lock_s *)WeakRetained connectionDelegate];
    [v3 presenceDaemonConnectionDidDisconnect:WeakRetained];
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "_xpcConnection.invalidationHandler: The SKPresenceDaemonConnection has been deallocated, returning early...", (uint8_t *)&v6, 2u);
  }
}

void __43__SKPresenceDaemonConnection_xpcConnection__block_invoke_9(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = +[SKPresenceDaemonConnection logger];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      int v6 = 134217984;
      uint64_t v7 = (int)[v5 processIdentifier];
      _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld interrupted", (uint8_t *)&v6, 0xCu);
    }
    os_unfair_lock_lock(WeakRetained + 2);
    [(os_unfair_lock_s *)WeakRetained _resetConnectionHandlers];
    os_unfair_lock_unlock(WeakRetained + 2);
    id v3 = [(os_unfair_lock_s *)WeakRetained connectionDelegate];
    [v3 presenceDaemonConnectionDidDisconnect:WeakRetained];
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "_xpcConnection.interruptionHandler: The SKPresenceDaemonConnection has been deallocated, returning early...", (uint8_t *)&v6, 2u);
  }
}

- (void)setXPCConnection:(id)a3
{
  BOOL v4 = (NSXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)_xpcConnectionOptions
{
  return 4096;
}

+ (NSXPCInterface)daemonXPCInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF9B0B8];
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_presentDevicesForPresenceIdentifier_completion_ argumentIndex:0 ofReply:1];

  int v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_inviteHandles_fromSenderHandle_presenceIdentifier_completion_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_removeInvitedHandles_presenceIdentifier_completion_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_invitedHandlesForPresenceIdentifier_completion_ argumentIndex:0 ofReply:1];

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonDelegateXPCInterface
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF99000];
}

- (void)setXpcConnection:(id)a3
{
}

- (SKPresenceDaemonDelegateProtocol)presenceDaemonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenceDaemonDelegate);
  return (SKPresenceDaemonDelegateProtocol *)WeakRetained;
}

- (void)setPresenceDaemonDelegate:(id)a3
{
}

- (SKPresenceConnectionDelegateProtocol)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  return (SKPresenceConnectionDelegateProtocol *)WeakRetained;
}

- (void)setConnectionDelegate:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_destroyWeak((id *)&self->_presenceDaemonDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E62A000, a2, OS_LOG_TYPE_ERROR, "XPC Error (async): %{public}@", (uint8_t *)&v2, 0xCu);
}

void __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E62A000, a2, OS_LOG_TYPE_ERROR, "XPC Error (synchronous): %{public}@", (uint8_t *)&v2, 0xCu);
}

@end