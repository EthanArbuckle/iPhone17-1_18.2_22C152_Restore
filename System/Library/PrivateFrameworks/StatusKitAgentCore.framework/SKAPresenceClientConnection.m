@interface SKAPresenceClientConnection
+ (id)_clientIDForConnection:(id)a3;
+ (id)logger;
- (NSString)clientID;
- (NSXPCConnection)xpcConnection;
- (SKAPresenceClientConnection)initWithXPCConnection:(id)a3 queue:(id)a4 daemonProtocolDelegate:(id)a5 connectionLifecycleDelegate:(id)a6;
- (SKAPresenceClientConnectionLifecycleDelegate)connectionLifecycleDelegate;
- (id)asynchronousRemoteDaemonDelegateWithErrorHandler:(id)a3;
- (id)description;
- (id)synchronousRemoteDaemonDelegateWithErrorHandler:(id)a3;
- (int)processIdentifier;
- (void)dealloc;
- (void)setConnectionLifecycleDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SKAPresenceClientConnection

- (SKAPresenceClientConnection)initWithXPCConnection:(id)a3 queue:(id)a4 daemonProtocolDelegate:(id)a5 connectionLifecycleDelegate:(id)a6
{
  id v11 = a3;
  v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_assert_queue_V2(v12);
  v31.receiver = self;
  v31.super_class = (Class)SKAPresenceClientConnection;
  v15 = [(SKAPresenceClientConnection *)&v31 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_connectionLifecycleDelegate, v14);
    objc_storeStrong((id *)&v16->_xpcConnection, a3);
    v17 = [MEMORY[0x263F797E8] daemonXPCInterface];
    [v11 setExportedInterface:v17];

    [v11 setExportedObject:v13];
    v18 = [MEMORY[0x263F797E8] daemonDelegateXPCInterface];
    [v11 setRemoteObjectInterface:v18];

    [v11 _setQueue:v12];
    objc_initWeak(&location, v11);
    objc_initWeak(&from, v16);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __110__SKAPresenceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke;
    v26[3] = &unk_2646E0DC8;
    objc_copyWeak(&v27, &from);
    objc_copyWeak(&v28, &location);
    [v11 setInterruptionHandler:v26];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __110__SKAPresenceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke_3;
    v23 = &unk_2646E0DC8;
    objc_copyWeak(&v24, &from);
    objc_copyWeak(&v25, &location);
    [v11 setInvalidationHandler:&v20];
    objc_msgSend(v11, "resume", v20, v21, v22, v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __110__SKAPresenceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = +[SKAPresenceClientConnection logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134217984;
    uint64_t v7 = (int)[v4 processIdentifier];
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld interrupted", (uint8_t *)&v6, 0xCu);
  }
  v5 = [WeakRetained connectionLifecycleDelegate];
  [v5 presenceClientConnectionWasInterrupted:WeakRetained];
}

void __110__SKAPresenceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = +[SKAPresenceClientConnection logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134217984;
    uint64_t v7 = (int)[v4 processIdentifier];
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld invalidated", (uint8_t *)&v6, 0xCu);
  }
  v5 = [WeakRetained connectionLifecycleDelegate];
  [v5 presenceClientConnectionWasInvalidated:WeakRetained];
}

- (id)asynchronousRemoteDaemonDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKAPresenceClientConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__SKAPresenceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke;
  v9[3] = &unk_2646E0DF0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __80__SKAPresenceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKAPresenceClientConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__SKAPresenceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteDaemonDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKAPresenceClientConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__SKAPresenceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke;
  v9[3] = &unk_2646E0DF0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __79__SKAPresenceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKAPresenceClientConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__SKAPresenceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = +[SKAPresenceClientConnection logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing {pointer: %p}", buf, 0xCu);
  }

  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SKAPresenceClientConnection;
  [(SKAPresenceClientConnection *)&v4 dealloc];
}

- (id)description
{
  id v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ PID=%ld>", v5, -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier")];

  return v6;
}

- (int)processIdentifier
{
  return [(NSXPCConnection *)self->_xpcConnection processIdentifier];
}

- (NSString)clientID
{
  return (NSString *)+[SKAPresenceClientConnection _clientIDForConnection:self->_xpcConnection];
}

+ (id)_clientIDForConnection:(id)a3
{
  id v3 = objc_msgSend(a3, "sk_stringValueForEntitlement:", @"com.apple.StatusKit.presence.clientID");
  if (!v3)
  {
    objc_super v4 = +[SKAPresenceClientConnection logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SKAPresenceClientConnection _clientIDForConnection:](v4);
    }
  }
  return v3;
}

+ (id)logger
{
  if (logger_onceToken_27 != -1) {
    dispatch_once(&logger_onceToken_27, &__block_literal_global_27);
  }
  v2 = (void *)logger__logger_27;
  return v2;
}

uint64_t __37__SKAPresenceClientConnection_logger__block_invoke()
{
  logger__logger_27 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAPresenceClientConnection");
  return MEMORY[0x270F9A758]();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (SKAPresenceClientConnectionLifecycleDelegate)connectionLifecycleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionLifecycleDelegate);
  return (SKAPresenceClientConnectionLifecycleDelegate *)WeakRetained;
}

- (void)setConnectionLifecycleDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionLifecycleDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __80__SKAPresenceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "XPC Error (async): %{public}@", (uint8_t *)&v2, 0xCu);
}

void __79__SKAPresenceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "XPC Error (synchronous): %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_clientIDForConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Client does not have a presence client ID", v1, 2u);
}

@end