@interface SKStatusPublishingDaemonConnection
+ (NSXPCInterface)daemonDelegateXPCInterface;
+ (NSXPCInterface)daemonXPCInterface;
+ (id)logger;
- (NSXPCConnection)xpcConnection;
- (SKStatusPublishingConnectionDelegateProtocol)connectionDelegate;
- (SKStatusPublishingDaemonConnection)initWithPublishingDaemonDelegate:(id)a3 connectionDelegate:(id)a4;
- (SKStatusPublishingDaemonDelegateProtocol)publishingDaemonDelegate;
- (id)asynchronousRemoteDaemonWithErrorHandler:(id)a3;
- (id)synchronousRemoteDaemonWithErrorHandler:(id)a3;
- (unint64_t)_xpcConnectionOptions;
- (void)setConnectionDelegate:(id)a3;
- (void)setPublishingDaemonDelegate:(id)a3;
- (void)setXPCConnection:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SKStatusPublishingDaemonConnection

- (SKStatusPublishingDaemonConnection)initWithPublishingDaemonDelegate:(id)a3 connectionDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKStatusPublishingDaemonConnection;
  v8 = [(SKStatusPublishingDaemonConnection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_publishingDaemonDelegate, v6);
    objc_storeWeak((id *)&v9->_connectionDelegate, v7);
  }

  return v9;
}

- (id)asynchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKStatusPublishingDaemonConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__SKStatusPublishingDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_2644B63B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __79__SKStatusPublishingDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingDaemonConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__SKPresenceDaemonConnection_asynchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SKStatusPublishingDaemonConnection *)self xpcConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__SKStatusPublishingDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_2644B63B8;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __78__SKStatusPublishingDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusPublishingDaemonConnection logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__SKPresenceDaemonConnection_synchronousRemoteDaemonWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)logger
{
  if (logger_onceToken_3 != -1) {
    dispatch_once(&logger_onceToken_3, &__block_literal_global_3);
  }
  v2 = (void *)logger__logger_3;
  return v2;
}

uint64_t __44__SKStatusPublishingDaemonConnection_logger__block_invoke()
{
  logger__logger_3 = (uint64_t)os_log_create("com.apple.StatusKit", "PublishingDaemonConnection");
  return MEMORY[0x270F9A758]();
}

- (NSXPCConnection)xpcConnection
{
  v2 = self;
  objc_sync_enter(v2);
  xpcConnection = v2->_xpcConnection;
  if (!xpcConnection)
  {
    uint64_t v4 = [(SKStatusPublishingDaemonConnection *)v2 _xpcConnectionOptions];
    uint64_t v5 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.StatusKit.publish" options:v4];
    id v6 = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v5;

    id v7 = +[SKStatusPublishingDaemonConnection daemonXPCInterface];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v7];

    v8 = +[SKStatusPublishingDaemonConnection daemonDelegateXPCInterface];
    [(NSXPCConnection *)v2->_xpcConnection setExportedInterface:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&v2->_publishingDaemonDelegate);
    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:WeakRetained];

    objc_initWeak(&location, v2);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke;
    v14[3] = &unk_2644B6690;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke_6;
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
  objc_sync_exit(v2);

  return v10;
}

void __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[SKStatusPublishingDaemonConnection logger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E62A000, v2, OS_LOG_TYPE_DEFAULT, "XPC Connection Invalidation Handled", v4, 2u);
  }

  [WeakRetained setXpcConnection:0];
  id v3 = [WeakRetained connectionDelegate];
  [v3 publishingDaemonConnectionDidDisconnect:WeakRetained];
}

void __51__SKStatusPublishingDaemonConnection_xpcConnection__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[SKStatusPublishingDaemonConnection logger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21E62A000, v2, OS_LOG_TYPE_DEFAULT, "XPC Connection Interruption Handled", v4, 2u);
  }

  [WeakRetained setXpcConnection:0];
  id v3 = [WeakRetained connectionDelegate];
  [v3 publishingDaemonConnectionDidDisconnect:WeakRetained];
}

- (void)setXPCConnection:(id)a3
{
  uint64_t v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = v4;

  objc_sync_exit(obj);
}

- (unint64_t)_xpcConnectionOptions
{
  return 4096;
}

+ (NSXPCInterface)daemonXPCInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF9B118];
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion_ argumentIndex:0 ofReply:0];

  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_provisionPayloads_statusTypeIdentifier_completion_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
  [v2 setClasses:v17 forSelector:sel_provisionPayloads_statusTypeIdentifier_completion_ argumentIndex:0 ofReply:1];

  v18 = (void *)MEMORY[0x263EFFA08];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:sel_removeInvitedHandles_statusTypeIdentifier_completion_ argumentIndex:0 ofReply:0];

  v21 = (void *)MEMORY[0x263EFFA08];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_invitedHandlesForStatusTypeIdentifier_completion_ argumentIndex:0 ofReply:1];

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)daemonDelegateXPCInterface
{
  return (NSXPCInterface *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CF981C8];
}

- (void)setXpcConnection:(id)a3
{
}

- (SKStatusPublishingDaemonDelegateProtocol)publishingDaemonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publishingDaemonDelegate);
  return (SKStatusPublishingDaemonDelegateProtocol *)WeakRetained;
}

- (void)setPublishingDaemonDelegate:(id)a3
{
}

- (SKStatusPublishingConnectionDelegateProtocol)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  return (SKStatusPublishingConnectionDelegateProtocol *)WeakRetained;
}

- (void)setConnectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_destroyWeak((id *)&self->_publishingDaemonDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end