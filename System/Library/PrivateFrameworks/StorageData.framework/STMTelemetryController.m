@interface STMTelemetryController
- (NSXPCConnection)connection;
- (void)getTelemetry:(id)a3;
- (void)retrieveTelemetryWithCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)stopService;
@end

@implementation STMTelemetryController

- (void)getTelemetry:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__STMTelemetryController_getTelemetry___block_invoke;
  v6[3] = &unk_264305518;
  id v7 = v4;
  id v5 = v4;
  [(STMTelemetryController *)self retrieveTelemetryWithCompletionHandler:v6];
}

void __39__STMTelemetryController_getTelemetry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    id v8 = v5;
    if (!v5)
    {
      v9 = STStorageLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __39__STMTelemetryController_getTelemetry___block_invoke_cold_1((uint64_t)v6, v9);
      }

      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = (id)MEMORY[0x263EFFA78];
    }
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (void)retrieveTelemetryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STMTelemetryController *)self connection];

  if (!v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.storagedatad" options:0];
    uint64_t v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C932AC0];
    [v6 setRemoteObjectInterface:v7];

    [v6 resume];
    [(STMTelemetryController *)self setConnection:v6];
  }
  id v8 = STStorageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218150000, v8, OS_LOG_TYPE_INFO, "Connecting to StorageDataService", buf, 2u);
  }

  v9 = [(STMTelemetryController *)self connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke;
  v15[3] = &unk_264305540;
  id v10 = v4;
  id v16 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_5;
  v13[3] = &unk_264305568;
  id v14 = v10;
  id v12 = v10;
  [v11 storageInfoDict:v13];
}

void __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = STStorageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopService
{
  id v3 = [(STMTelemetryController *)self connection];
  [v3 invalidate];

  [(STMTelemetryController *)self setConnection:0];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __39__STMTelemetryController_getTelemetry___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218150000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve storage telemetry: %@", (uint8_t *)&v2, 0xCu);
}

void __65__STMTelemetryController_retrieveTelemetryWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218150000, a2, OS_LOG_TYPE_ERROR, "Error connecting to StorageDataService: %@", (uint8_t *)&v2, 0xCu);
}

@end