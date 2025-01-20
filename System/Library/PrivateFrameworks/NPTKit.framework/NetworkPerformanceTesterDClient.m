@interface NetworkPerformanceTesterDClient
+ (id)sharedInstance;
- (NetworkPerformanceTesterDClient)init;
- (void)getPrivilegedFileHandleForPacketCapture:(id)a3;
- (void)getPrivilegedFileHandleForPath:(id)a3 completionHandler:(id)a4;
- (void)testServiceWithArguments:(id)a3 completionHandler:(id)a4;
@end

@implementation NetworkPerformanceTesterDClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance;

  return v2;
}

uint64_t __49__NetworkPerformanceTesterDClient_sharedInstance__block_invoke()
{
  sharedInstance = objc_alloc_init(NetworkPerformanceTesterDClient);

  return MEMORY[0x270F9A758]();
}

- (NetworkPerformanceTesterDClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)NetworkPerformanceTesterDClient;
  v2 = [(NetworkPerformanceTesterDClient *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CAD8C10];
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.internal.networkperformancetesterd" options:0];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v4;

    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:v3];
    [(NSXPCConnection *)v2->connection setInterruptionHandler:&__block_literal_global_12];
    [(NSXPCConnection *)v2->connection setInvalidationHandler:&__block_literal_global_17];
    uint64_t v6 = [(NSXPCConnection *)v2->connection remoteObjectProxyWithErrorHandler:&__block_literal_global_23];
    server = v2->server;
    v2->server = (NPTDServices *)v6;

    [(NSXPCConnection *)v2->connection resume];
    v8 = v2;
  }
  return v2;
}

void __39__NetworkPerformanceTesterDClient_init__block_invoke()
{
}

void __39__NetworkPerformanceTesterDClient_init__block_invoke_2()
{
}

void __39__NetworkPerformanceTesterDClient_init__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = +[NPTDLogger client];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 localizedDescription];
    v5 = [v2 localizedFailureReason];
    int v6 = 138412802;
    v7 = @"Error on remote object proxy";
    __int16 v8 = 2112;
    v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_219415000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);
  }
}

- (void)getPrivilegedFileHandleForPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  server = self->server;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPath_completionHandler___block_invoke;
  v9[3] = &unk_2643A1850;
  id v10 = v6;
  id v8 = v6;
  [(NPTDServices *)server getPrivilegedFileHandleForPath:a3 completionHandler:v9];
}

uint64_t __84__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPath_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getPrivilegedFileHandleForPacketCapture:(id)a3
{
  id v4 = a3;
  server = self->server;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPacketCapture___block_invoke;
  v7[3] = &unk_2643A1850;
  id v8 = v4;
  id v6 = v4;
  [(NPTDServices *)server getPrivilegedFileHandleForPacketCapture:v7];
}

uint64_t __75__NetworkPerformanceTesterDClient_getPrivilegedFileHandleForPacketCapture___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)testServiceWithArguments:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  server = self->server;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__NetworkPerformanceTesterDClient_testServiceWithArguments_completionHandler___block_invoke;
  v9[3] = &unk_2643A1878;
  id v10 = v6;
  id v8 = v6;
  [(NPTDServices *)server testServiceWithArguments:a3 completionHandler:v9];
}

uint64_t __78__NetworkPerformanceTesterDClient_testServiceWithArguments_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->server, 0);

  objc_storeStrong((id *)&self->connection, 0);
}

@end