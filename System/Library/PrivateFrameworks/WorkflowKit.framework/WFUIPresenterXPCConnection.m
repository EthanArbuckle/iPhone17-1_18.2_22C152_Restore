@interface WFUIPresenterXPCConnection
- (BOOL)connected;
- (NSXPCConnection)connection;
- (WFUIPresenterHostInterface)host;
- (WFUIPresenterXPCConnection)initWithConnection:(id)a3;
- (WFUIPresenterXPCConnection)initWithEndpoint:(id)a3;
- (WFUIPresenterXPCConnection)initWithMachServiceName:(id)a3;
- (WFUIPresenterXPCConnection)initWithServiceName:(id)a3;
- (id)errorHandler;
- (id)presenterWithErrorHandler:(id)a3;
- (id)synchronousPresenterWithErrorHandler:(id)a3;
- (os_unfair_lock_s)lock;
- (void)resumeConnectionIfNecessary;
- (void)setConnected:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setHost:(id)a3;
@end

@implementation WFUIPresenterXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (WFUIPresenterHostInterface)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  v4 = (WFUIPresenterHostInterface *)a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFUIPresenterXPCConnection_setHost___block_invoke;
  aBlock[3] = &unk_1E6558B28;
  aBlock[4] = self;
  v5 = (void (**)(void))_Block_copy(aBlock);
  self->_host = v4;
  [(NSXPCConnection *)self->_connection setExportedObject:v4];
  id v6 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2328A40];
  [(NSXPCConnection *)self->_connection setExportedInterface:v6];

  v5[2](v5);
}

void __38__WFUIPresenterXPCConnection_setHost___block_invoke(uint64_t a1)
{
}

- (id)synchronousPresenterWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(WFUIPresenterXPCConnection *)self resumeConnectionIfNecessary];
  [(WFUIPresenterXPCConnection *)self setErrorHandler:v4];
  v5 = [(WFUIPresenterXPCConnection *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)presenterWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(WFUIPresenterXPCConnection *)self resumeConnectionIfNecessary];
  [(WFUIPresenterXPCConnection *)self setErrorHandler:v4];
  v5 = [(WFUIPresenterXPCConnection *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)resumeConnectionIfNecessary
{
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__WFUIPresenterXPCConnection_resumeConnectionIfNecessary__block_invoke;
  aBlock[3] = &unk_1E6558B28;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  if (![(WFUIPresenterXPCConnection *)self connected])
  {
    id v4 = [(WFUIPresenterXPCConnection *)self connection];
    [v4 resume];

    [(WFUIPresenterXPCConnection *)self setConnected:1];
  }
  v3[2](v3);
}

void __57__WFUIPresenterXPCConnection_resumeConnectionIfNecessary__block_invoke(uint64_t a1)
{
}

- (WFUIPresenterXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFUIPresenterXPCConnection;
  id v6 = [(WFUIPresenterXPCConnection *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_connection, a3);
    [(NSXPCConnection *)v7->_connection setInvalidationHandler:&__block_literal_global_169_22262];
    objc_initWeak(&location, v7);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __49__WFUIPresenterXPCConnection_initWithConnection___block_invoke_170;
    v14 = &unk_1E6555640;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v7->_connection setInterruptionHandler:&v11];
    v8 = WFUIPresenterXPCInterface();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v8, v11, v12, v13, v14);

    v9 = v7;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __49__WFUIPresenterXPCConnection_initWithConnection___block_invoke_170(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained errorHandler];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 errorHandler];
    id v6 = WFRunnerFailureErrorMessage(0);
    ((void (**)(void, void *))v5)[2](v5, v6);

    id v7 = objc_loadWeakRetained(v1);
    [v7 setErrorHandler:0];
  }
}

void __49__WFUIPresenterXPCConnection_initWithConnection___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = getWFDialogLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    v2 = "-[WFUIPresenterXPCConnection initWithConnection:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v0, OS_LOG_TYPE_ERROR, "%s Connection to remote UI presenter was invalidated.", (uint8_t *)&v1, 0xCu);
  }
}

- (WFUIPresenterXPCConnection)initWithServiceName:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithServiceName:v5 options:0];

  id v7 = [(WFUIPresenterXPCConnection *)self initWithConnection:v6];
  return v7;
}

- (WFUIPresenterXPCConnection)initWithEndpoint:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithListenerEndpoint:v5];

  id v7 = [(WFUIPresenterXPCConnection *)self initWithConnection:v6];
  return v7;
}

- (WFUIPresenterXPCConnection)initWithMachServiceName:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithMachServiceName:v5 options:0];

  id v7 = [(WFUIPresenterXPCConnection *)self initWithConnection:v6];
  return v7;
}

@end