@interface SKAStatusPublishingServiceClientConnection
+ (BOOL)_connection:(id)a3 isEntitledForPublishingWithStatusTypeIdentifier:(id)a4;
+ (BOOL)clientIsEntitledForAtLeastOnePublishingServiceType:(id)a3;
+ (id)logger;
- (BOOL)clientIsEntitledForPublishingWithStatusTypeIdentifier:(id)a3;
- (NSXPCConnection)xpcConnection;
- (SKAStatusPublishingServiceClientConnection)initWithXPCConnection:(id)a3 queue:(id)a4 daemonProtocolDelegate:(id)a5 connectionLifecycleDelegate:(id)a6;
- (SKAStatusPublishingServiceClientConnectionLifecycleDelegate)connectionLifecycleDelegate;
- (id)asynchronousRemoteDaemonDelegateWithErrorHandler:(id)a3;
- (id)description;
- (id)synchronousRemoteDaemonDelegateWithErrorHandler:(id)a3;
- (int)processIdentifier;
- (void)dealloc;
- (void)setConnectionLifecycleDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SKAStatusPublishingServiceClientConnection

- (SKAStatusPublishingServiceClientConnection)initWithXPCConnection:(id)a3 queue:(id)a4 daemonProtocolDelegate:(id)a5 connectionLifecycleDelegate:(id)a6
{
  id v11 = a3;
  v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_assert_queue_V2(v12);
  v31.receiver = self;
  v31.super_class = (Class)SKAStatusPublishingServiceClientConnection;
  v15 = [(SKAStatusPublishingServiceClientConnection *)&v31 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_connectionLifecycleDelegate, v14);
    objc_storeStrong((id *)&v16->_xpcConnection, a3);
    v17 = [MEMORY[0x263F79830] daemonXPCInterface];
    [v11 setExportedInterface:v17];

    [v11 setExportedObject:v13];
    v18 = [MEMORY[0x263F79830] daemonDelegateXPCInterface];
    [v11 setRemoteObjectInterface:v18];

    [v11 _setQueue:v12];
    objc_initWeak(&location, v11);
    objc_initWeak(&from, v16);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __125__SKAStatusPublishingServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke;
    v26[3] = &unk_2646E0DC8;
    objc_copyWeak(&v27, &from);
    objc_copyWeak(&v28, &location);
    [v11 setInterruptionHandler:v26];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __125__SKAStatusPublishingServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke_2;
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

void __125__SKAStatusPublishingServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = +[SKAStatusPublishingServiceClientConnection logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134217984;
    uint64_t v7 = (int)[v4 processIdentifier];
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld interrupted", (uint8_t *)&v6, 0xCu);
  }
  v5 = [WeakRetained connectionLifecycleDelegate];
  [v5 publishingServiceClientConnectionWasInterrupted:WeakRetained];
}

void __125__SKAStatusPublishingServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = +[SKAStatusPublishingServiceClientConnection logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134217984;
    uint64_t v7 = (int)[v4 processIdentifier];
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld invalidated", (uint8_t *)&v6, 0xCu);
  }
  v5 = [WeakRetained connectionLifecycleDelegate];
  [v5 publishingServiceClientConnectionWasInvalidated:WeakRetained];
}

- (id)asynchronousRemoteDaemonDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKAStatusPublishingServiceClientConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __95__SKAStatusPublishingServiceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke;
  v9[3] = &unk_2646E0DF0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __95__SKAStatusPublishingServiceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKAStatusPublishingServiceClientConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __95__SKAStatusPublishingServiceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteDaemonDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKAStatusPublishingServiceClientConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__SKAStatusPublishingServiceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke;
  v9[3] = &unk_2646E0DF0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __94__SKAStatusPublishingServiceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKAStatusPublishingServiceClientConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __94__SKAStatusPublishingServiceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = +[SKAStatusPublishingServiceClientConnection logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing {pointer: %p}", buf, 0xCu);
  }

  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SKAStatusPublishingServiceClientConnection;
  [(SKAStatusPublishingServiceClientConnection *)&v4 dealloc];
}

+ (BOOL)clientIsEntitledForAtLeastOnePublishingServiceType:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_msgSend(v3, "sk_stringArrayValueForEntitlement:", @"com.apple.StatusKit.publish.types");
  if ([v4 count]
    || (objc_msgSend(v3, "sk_BOOLeanValueForEntitlement:", @"com.apple.StatusKit.publish.allTypes") & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v7 = +[SKAStatusPublishingServiceClientConnection logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SKAStatusPublishingServiceClientConnection clientIsEntitledForAtLeastOnePublishingServiceType:](v7);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)clientIsEntitledForPublishingWithStatusTypeIdentifier:(id)a3
{
  return +[SKAStatusPublishingServiceClientConnection _connection:self->_xpcConnection isEntitledForPublishingWithStatusTypeIdentifier:a3];
}

+ (BOOL)_connection:(id)a3 isEntitledForPublishingWithStatusTypeIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length]
    && (objc_msgSend(v5, "sk_stringArrayValueForEntitlement:", @"com.apple.StatusKit.publish.types"),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsObject:v6],
        v7,
        (v8 & 1) != 0)
    || [v6 length]
    && (objc_msgSend(v5, "sk_BOOLeanValueForEntitlement:", @"com.apple.StatusKit.publish.allTypes") & 1) != 0)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = +[SKAStatusPublishingServiceClientConnection logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SKAStatusPublishingServiceClientConnection _connection:isEntitledForPublishingWithStatusTypeIdentifier:]((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  id v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ PID=%ld>", v5, -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier")];

  return v6;
}

- (int)processIdentifier
{
  return [(NSXPCConnection *)self->_xpcConnection processIdentifier];
}

+ (id)logger
{
  if (logger_onceToken_3 != -1) {
    dispatch_once(&logger_onceToken_3, &__block_literal_global_3);
  }
  v2 = (void *)logger__logger_3;
  return v2;
}

uint64_t __52__SKAStatusPublishingServiceClientConnection_logger__block_invoke()
{
  logger__logger_3 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusPublishingServiceClientConnection");
  return MEMORY[0x270F9A758]();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (SKAStatusPublishingServiceClientConnectionLifecycleDelegate)connectionLifecycleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionLifecycleDelegate);
  return (SKAStatusPublishingServiceClientConnectionLifecycleDelegate *)WeakRetained;
}

- (void)setConnectionLifecycleDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionLifecycleDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __95__SKAStatusPublishingServiceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __94__SKAStatusPublishingServiceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)clientIsEntitledForAtLeastOnePublishingServiceType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Client is not entitled for any status types", v1, 2u);
}

+ (void)_connection:(uint64_t)a3 isEntitledForPublishingWithStatusTypeIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end