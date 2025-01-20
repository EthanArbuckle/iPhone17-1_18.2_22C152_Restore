@interface TailspinSymbolicationClient
- (NSXPCConnection)connection;
- (id)symbolicateUUID:(id)a3 pid:(int)a4 path:(id)a5 offsets:(id)a6 options:(id)a7;
- (void)_initConnection;
- (void)invalidateConnection;
- (void)setConnection:(id)a3;
@end

@implementation TailspinSymbolicationClient

- (id)symbolicateUUID:(id)a3 pid:(int)a4 path:(id)a5 offsets:(id)a6 options:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!self->_connection) {
    [(TailspinSymbolicationClient *)self _initConnection];
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v16 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1;
  v19[3] = &unk_265531BC8;
  v19[4] = &v20;
  [v16 symbolicateUUID:v12 pid:v10 path:v13 offsets:v14 options:v15 completionBlock:v19];

  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_cold_1(a2);
  }
}

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1_cold_1(v3);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_initConnection
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.tailspin.symbolicationserver"];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B6E828];
  [v5 setRemoteObjectInterface:v3];
  [v5 setInvalidationHandler:&__block_literal_global_8];
  [v5 setInterruptionHandler:&__block_literal_global_11];
  [(TailspinSymbolicationClient *)self setConnection:v5];
  uint64_t v4 = [(TailspinSymbolicationClient *)self connection];
  [v4 resume];
}

void __46__TailspinSymbolicationClient__initConnection__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_25E9E7000, &_os_log_internal, OS_LOG_TYPE_INFO, "XPC connection invalidated.", v0, 2u);
  }
}

void __46__TailspinSymbolicationClient__initConnection__block_invoke_9()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __46__TailspinSymbolicationClient__initConnection__block_invoke_9_cold_1();
  }
}

- (void)invalidateConnection
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
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

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [a1 description];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_error_impl(&dword_25E9E7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Received error from call to symbolication server: %@", (uint8_t *)&v2, 0xCu);
}

void __72__TailspinSymbolicationClient_symbolicateUUID_pid_path_offsets_options___block_invoke_1_cold_1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = [a1 length];
  _os_log_debug_impl(&dword_25E9E7000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Received reply from symbolication server with data of size %zu bytes", (uint8_t *)&v1, 0xCu);
}

void __46__TailspinSymbolicationClient__initConnection__block_invoke_9_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_25E9E7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "XPC connection interrupted.", v0, 2u);
}

@end