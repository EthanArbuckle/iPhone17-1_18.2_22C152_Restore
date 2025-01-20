@interface TVRCTimedMetadataManager
- (NSXPCConnection)connection;
- (TVRCTimedMetadata)currentTimedMetadata;
- (TVRCTimedMetadataUpdating)proxy;
- (void)updateTimedMetadata:(id)a3;
@end

@implementation TVRCTimedMetadataManager

- (void)updateTimedMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRCTimedMetadataManager *)self proxy];
  [v5 updateTimedMetadata:v4];
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.tvremotecore.xpc" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA70CF8];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_13];
    objc_initWeak(&location, self);
    v7 = self->_connection;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __38__TVRCTimedMetadataManager_connection__block_invoke_46;
    v12 = &unk_2647AEB88;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v7 setInvalidationHandler:&v9];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }

  return connection;
}

void __38__TVRCTimedMetadataManager_connection__block_invoke()
{
  v0 = _TVRCXPCLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __38__TVRCTimedMetadataManager_connection__block_invoke_cold_1(v0);
  }
}

void __38__TVRCTimedMetadataManager_connection__block_invoke_46(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _TVRCXPCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __38__TVRCTimedMetadataManager_connection__block_invoke_46_cold_1(v2);
    }

    v3 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (TVRCTimedMetadataUpdating)proxy
{
  v2 = [(TVRCTimedMetadataManager *)self connection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_49];

  return (TVRCTimedMetadataUpdating *)v3;
}

void __33__TVRCTimedMetadataManager_proxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _TVRCXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __33__TVRCTimedMetadataManager_proxy__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (TVRCTimedMetadata)currentTimedMetadata
{
  return self->_currentTimedMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimedMetadata, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__TVRCTimedMetadataManager_connection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "TVRCTimedMetadataUpdating connection encountered an interruption.", v1, 2u);
}

void __38__TVRCTimedMetadataManager_connection__block_invoke_46_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "TVRCTimedMetadataUpdating connection was invalidated.", v1, 2u);
}

void __33__TVRCTimedMetadataManager_proxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Proxy creation error (TVRCTimedMetadataUpdating): %{public}@", (uint8_t *)&v2, 0xCu);
}

@end