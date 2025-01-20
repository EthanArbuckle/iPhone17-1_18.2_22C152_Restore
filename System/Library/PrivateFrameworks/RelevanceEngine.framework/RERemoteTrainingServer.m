@interface RERemoteTrainingServer
- (RERemoteTrainingServer)initWithTargetProcessName:(id)a3;
- (void)_clearConnection;
- (void)_queue_setupConnectionIfNeeded;
- (void)performTrainingWithElements:(id)a3 events:(id)a4 interactions:(id)a5 completion:(id)a6;
- (void)updateRemoteAttribute:(id)a3 forKey:(id)a4 completion:(id)a5;
@end

@implementation RERemoteTrainingServer

- (RERemoteTrainingServer)initWithTargetProcessName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RERemoteTrainingServer;
  v5 = [(RERemoteTrainingServer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    processName = v5->_processName;
    v5->_processName = (NSString *)v6;
  }
  return v5;
}

- (void)_queue_setupConnectionIfNeeded
{
  if (!self->_connection)
  {
    v3 = RERemoteTrainingMachServiceForProcessName((__CFString *)self->_processName);
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v3 options:4096];
    connection = self->_connection;
    self->_connection = v4;

    uint64_t v6 = self->_connection;
    v7 = RERemoteTrainingServerInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    v8 = self->_connection;
    objc_super v9 = RERemoteTrainingClientInterface();
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    v10 = self->_connection;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __56__RERemoteTrainingServer__queue_setupConnectionIfNeeded__block_invoke;
    v14 = &unk_2644BC638;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v10 setInterruptionHandler:&v11];
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_61, v11, v12, v13, v14);
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __56__RERemoteTrainingServer__queue_setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = RELogForDomain(17);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

void __56__RERemoteTrainingServer__queue_setupConnectionIfNeeded__block_invoke_1()
{
  v0 = RELogForDomain(17);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_DEFAULT, "REPredictedActionServer XPC connection invalidated.", v1, 2u);
  }
}

- (void)_clearConnection
{
  self->_connection = 0;
  MEMORY[0x270F9A758]();
}

- (void)updateRemoteAttribute:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(RERemoteTrainingServer *)self _queue_setupConnectionIfNeeded];
  id v11 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4_1];
  [v11 updateRemoteAttribute:v10 forKey:v9 completion:v8];
}

void __66__RERemoteTrainingServer_updateRemoteAttribute_forKey_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = RELogForDomain(17);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 localizedDescription];
    int v5 = 136315138;
    uint64_t v6 = [v4 UTF8String];
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void)performTrainingWithElements:(id)a3 events:(id)a4 interactions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(RERemoteTrainingServer *)self _queue_setupConnectionIfNeeded];
  id v14 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6_0];
  [v14 performTrainingWithElements:v13 events:v12 interactions:v11 completion:v10];
}

void __85__RERemoteTrainingServer_performTrainingWithElements_events_interactions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = RELogForDomain(17);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 localizedDescription];
    int v5 = 136315138;
    uint64_t v6 = [v4 UTF8String];
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get server proxy: %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end