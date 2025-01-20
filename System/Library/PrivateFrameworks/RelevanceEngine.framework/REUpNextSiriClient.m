@interface REUpNextSiriClient
- (REUpNextSiriClient)init;
- (void)_performOnRemoteObject:(id)a3;
- (void)completedRequestWithDomain:(id)a3;
- (void)dealloc;
@end

@implementation REUpNextSiriClient

- (REUpNextSiriClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)REUpNextSiriClient;
  v2 = [(REUpNextSiriClient *)&v12 init];
  if (v2)
  {
    uint64_t v3 = RECreateSharedQueueWithQOS(@"upnext.siriclient", QOS_CLASS_UTILITY);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.NanoTimeKit.Siri" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;

    v7 = v2->_connection;
    v8 = REUpNextSiriServerInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    v9 = v2->_connection;
    v10 = REUpNextSiriClientInterface();
    [(NSXPCConnection *)v9 setExportedInterface:v10];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_8];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_4];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

void __26__REUpNextSiriClient_init__block_invoke()
{
  v0 = RELogForDomain(9);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __26__REUpNextSiriClient_init__block_invoke_cold_1(v0);
  }
}

void __26__REUpNextSiriClient_init__block_invoke_2()
{
  v0 = RELogForDomain(9);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __26__REUpNextSiriClient_init__block_invoke_2_cold_1(v0);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)REUpNextSiriClient;
  [(REUpNextSiriClient *)&v3 dealloc];
}

- (void)completedRequestWithDomain:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__REUpNextSiriClient_completedRequestWithDomain___block_invoke;
  v6[3] = &unk_2644BCF00;
  id v7 = v4;
  id v5 = v4;
  [(REUpNextSiriClient *)self _performOnRemoteObject:v6];
}

uint64_t __49__REUpNextSiriClient_completedRequestWithDomain___block_invoke(uint64_t a1, void *a2)
{
  return [a2 completedRequestWithDomain:*(void *)(a1 + 32)];
}

- (void)_performOnRemoteObject:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__REUpNextSiriClient__performOnRemoteObject___block_invoke;
  v7[3] = &unk_2644BC5E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__REUpNextSiriClient__performOnRemoteObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxyWithErrorHandler:&__block_literal_global_10_0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __45__REUpNextSiriClient__performOnRemoteObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = RELogForDomain(9);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__REUpNextSiriClient__performOnRemoteObject___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __26__REUpNextSiriClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "XPC Siri connection interruped", v1, 2u);
}

void __26__REUpNextSiriClient_init__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "XPC Siri connection invalidated", v1, 2u);
}

void __45__REUpNextSiriClient__performOnRemoteObject___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "XPC Siri connection error %@", (uint8_t *)&v2, 0xCu);
}

@end