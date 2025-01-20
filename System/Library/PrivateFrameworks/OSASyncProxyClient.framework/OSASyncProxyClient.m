void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x270ED8090](dso, log, type, format, buf, *(void *)&size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

n OSASyncProxyClient

- (OSASyncProxyClient)initWithErrorHandler:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSASyncProxyClient;
  v5 = [(OSASyncProxyClient *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.OSASyncProxy.client" options:4096];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CE49918];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_connection resume];
    uint64_t v9 = [(NSXPCConnection *)v5->_connection synchronousRemoteObjectProxyWithErrorHandler:v4];
    synchRemoteObjectProxy = v5->_synchRemoteObjectProxy;
    v5->_synchRemoteObjectProxy = (OSASyncProxyServices *)v9;
  }
  return v5;
}

- (OSASyncProxyClient)init
{
  return [(OSASyncProxyClient *)self initWithErrorHandler:&__block_literal_global];
}

void __26__OSASyncProxyClient_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    uint64_t v4 = a2;
    _os_log_impl(&dword_21D96B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Connection error to ProxiedCrashCopier. Error: %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)OSASyncProxyClient;
  [(OSASyncProxyClient *)&v3 dealloc];
}

- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)[&unk_26CE48310 mutableCopy];
  [v11 addEntriesFromDictionary:v9];

  [(OSASyncProxyServices *)self->_synchRemoteObjectProxy request:v10 transferGroupWithOptions:v11 onComplete:v8];
}

- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)[&unk_26CE48338 mutableCopy];
  v14 = v13;
  if (v11) {
    [v13 addEntriesFromDictionary:v11];
  }
  [(OSASyncProxyServices *)self->_synchRemoteObjectProxy request:v15 transferLog:v10 withOptions:v14 onComplete:v12];
}

- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5
{
}

- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5
{
}

- (void)request:(id)a3 logList:(id)a4
{
}

- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4
{
}

- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6
{
}

- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5
{
}

- (void)listDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchRemoteObjectProxy, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end