@interface SKStatusSubscriptionDaemonConnection
+ (NSXPCInterface)daemonDelegateXPCInterface;
+ (NSXPCInterface)daemonXPCInterface;
+ (id)logger;
- (NSXPCConnection)xpcConnection;
- (SKStatusSubscriptionConnectionDelegateProtocol)connectionDelegate;
- (SKStatusSubscriptionDaemonConnection)initWithSubscriptionDaemonDelegate:(id)a3 connectionDelegate:(id)a4;
- (SKStatusSubscriptionDaemonDelegateProtocol)subscriptionDaemonDelegate;
- (id)asynchronousRemoteDaemonWithErrorHandler:(id)a3;
- (id)synchronousRemoteDaemonWithErrorHandler:(id)a3;
- (os_unfair_lock_s)lock;
- (unint64_t)_xpcConnectionOptions;
- (void)setConnectionDelegate:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setSubscriptionDaemonDelegate:(id)a3;
- (void)setXPCConnection:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SKStatusSubscriptionDaemonConnection

- (SKStatusSubscriptionDaemonConnection)initWithSubscriptionDaemonDelegate:(id)a3 connectionDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKStatusSubscriptionDaemonConnection;
  v8 = [(SKStatusSubscriptionDaemonConnection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_subscriptionDaemonDelegate, v6);
    objc_storeWeak((id *)&v9->_connectionDelegate, v7);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)asynchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKStatusSubscriptionDaemonConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__SKStatusSubscriptionDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_2644B63B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __81__SKStatusSubscriptionDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionDaemonConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKStatusSubscriptionDaemonConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__SKStatusSubscriptionDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_2644B63B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __80__SKStatusSubscriptionDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionDaemonConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)logger
{
  if (logger_onceToken_10 != -1) {
    dispatch_once(&logger_onceToken_10, &__block_literal_global_11);
  }
  v2 = (void *)logger__logger_10;
  return v2;
}

uint64_t __46__SKStatusSubscriptionDaemonConnection_logger__block_invoke()
{
  logger__logger_10 = (uint64_t)os_log_create("com.apple.StatusKit", "StatusSubscriptionDaemonConnection");
  return MEMORY[0x270F9A758]();
}

- (NSXPCConnection)xpcConnection
{
  v2 = self;
  objc_sync_enter(v2);
  os_unfair_lock_lock(&v2->_lock);
  xpcConnection = v2->_xpcConnection;
  if (!xpcConnection)
  {
    uint64_t v4 = [(SKStatusSubscriptionDaemonConnection *)v2 _xpcConnectionOptions];
    uint64_t v5 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.StatusKit.subscribe" options:v4];
    id v6 = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v5;

    id v7 = +[SKStatusSubscriptionDaemonConnection daemonXPCInterface];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v7];

    v8 = +[SKStatusSubscriptionDaemonConnection daemonDelegateXPCInterface];
    [(NSXPCConnection *)v2->_xpcConnection setExportedInterface:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&v2->_subscriptionDaemonDelegate);
    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:WeakRetained];

    objc_initWeak(&location, v2);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke;
    v14[3] = &unk_2644B6690;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke_6;
    v12[3] = &unk_2644B6690;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:v12];
    [(NSXPCConnection *)v2->_xpcConnection resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    xpcConnection = v2->_xpcConnection;
  }
  id v10 = xpcConnection;
  os_unfair_lock_unlock(&v2->_lock);
  objc_sync_exit(v2);

  return v10;
}

void __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[SKStatusSubscriptionDaemonConnection logger];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [(os_unfair_lock_s *)WeakRetained xpcConnection];
      int v5 = 134217984;
      uint64_t v6 = (int)[v3 processIdentifier];
      _os_log_impl(&dword_21E62A000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld invalidated", (uint8_t *)&v5, 0xCu);
    }
    os_unfair_lock_lock(WeakRetained + 2);
    [(os_unfair_lock_s *)WeakRetained setXpcConnection:0];
    os_unfair_lock_unlock(WeakRetained + 2);
    uint64_t v4 = [(os_unfair_lock_s *)WeakRetained connectionDelegate];
    [v4 subscriptionDaemonConnectionDidDisconnect:WeakRetained];
  }
}

void __53__SKStatusSubscriptionDaemonConnection_xpcConnection__block_invoke_6(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[SKStatusSubscriptionDaemonConnection logger];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [(os_unfair_lock_s *)WeakRetained xpcConnection];
      int v5 = 134217984;
      uint64_t v6 = (int)[v3 processIdentifier];
      _os_log_impl(&dword_21E62A000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld interrupted", (uint8_t *)&v5, 0xCu);
    }
    os_unfair_lock_lock(WeakRetained + 2);
    [(os_unfair_lock_s *)WeakRetained setXpcConnection:0];
    os_unfair_lock_unlock(WeakRetained + 2);
    uint64_t v4 = [(os_unfair_lock_s *)WeakRetained connectionDelegate];
    [v4 subscriptionDaemonConnectionDidDisconnect:WeakRetained];
  }
}

- (void)setXPCConnection:(id)a3
{
  uint64_t v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  os_unfair_lock_lock(&obj->_lock);
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = v4;

  os_unfair_lock_unlock(&obj->_lock);
  objc_sync_exit(obj);
}

- (unint64_t)_xpcConnectionOptions
{
  return 4096;
}

+ (NSXPCInterface)daemonXPCInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF9B178];
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  int v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_allSubscriptionMetadatasForStatusTypeIdentifier_includingPersonalSubscription_completion_ argumentIndex:0 ofReply:1];

  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_statusTypeIdentifier_completion_ argumentIndex:0 ofReply:1];

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonDelegateXPCInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF997F0];
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  int v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_subscriptionStateChangedForSubscriptions_completion_ argumentIndex:0 ofReply:0];

  return (NSXPCInterface *)v2;
}

- (void)setXpcConnection:(id)a3
{
}

- (SKStatusSubscriptionDaemonDelegateProtocol)subscriptionDaemonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subscriptionDaemonDelegate);
  return (SKStatusSubscriptionDaemonDelegateProtocol *)WeakRetained;
}

- (void)setSubscriptionDaemonDelegate:(id)a3
{
}

- (SKStatusSubscriptionConnectionDelegateProtocol)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  return (SKStatusSubscriptionConnectionDelegateProtocol *)WeakRetained;
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
  objc_destroyWeak((id *)&self->_subscriptionDaemonDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end