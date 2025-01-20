@interface WLDaemonConnection
- (WLDaemonConnection)init;
- (id)daemonConnection;
- (id)daemonWithErrorHandler:(id)a3;
- (id)interruptionHandler;
- (void)invalidateDaemonConnection;
- (void)setInterruptionHandler:(id)a3;
@end

@implementation WLDaemonConnection

- (WLDaemonConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLDaemonConnection;
  v2 = [(WLDaemonConnection *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    daemonLock = v2->_daemonLock;
    v2->_daemonLock = v3;
  }
  return v2;
}

- (id)daemonConnection
{
  [(NSLock *)self->_daemonLock lock];
  daemonConn = self->_daemonConn;
  if (!daemonConn)
  {
    objc_initWeak(&location, self);
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.matd" options:0];
    v5 = self->_daemonConn;
    self->_daemonConn = v4;

    objc_super v6 = self->_daemonConn;
    v7 = WLDaemonExportedInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    v8 = self->_daemonConn;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __38__WLDaemonConnection_daemonConnection__block_invoke;
    v14[3] = &unk_264C65E28;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v8 setInvalidationHandler:v14];
    v9 = self->_daemonConn;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__WLDaemonConnection_daemonConnection__block_invoke_2;
    v12[3] = &unk_264C65E28;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v9 setInterruptionHandler:v12];
    [(NSXPCConnection *)self->_daemonConn resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    daemonConn = self->_daemonConn;
  }
  v10 = daemonConn;
  [(NSLock *)self->_daemonLock unlock];

  return v10;
}

void __38__WLDaemonConnection_daemonConnection__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[1] lock];
    id v2 = v3[2];
    v3[2] = 0;

    [v3[1] unlock];
    WeakRetained = v3;
  }
}

uint64_t __38__WLDaemonConnection_daemonConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog(v1, 0, @"WLDaemonConnection XPC connection interrupted for weak instance %@", v2, v3, v4, v5, v6, (uint64_t)WeakRetained);
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 1) lock];
    v8 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = 0;

    [*((id *)WeakRetained + 1) unlock];
    uint64_t v7 = *((void *)WeakRetained + 3);
    if (v7) {
      uint64_t v7 = (*(uint64_t (**)(void))(v7 + 16))();
    }
  }

  return MEMORY[0x270F9A758](v7);
}

- (id)daemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WLDaemonConnection *)self daemonConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)invalidateDaemonConnection
{
  id v2 = [(WLDaemonConnection *)self daemonConnection];
  [v2 invalidate];
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_daemonConn, 0);

  objc_storeStrong((id *)&self->_daemonLock, 0);
}

@end