@interface PerfPowerServicesReaderHelper
- (NSXPCConnection)connectionToServer;
- (id)createXPCConnection;
- (id)postDataRequest:(id)a3 outError:(id *)a4;
- (void)closeXPCConnection;
- (void)setConnectionToServer:(id)a3;
@end

@implementation PerfPowerServicesReaderHelper

- (id)postDataRequest:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(PerfPowerServicesReaderHelper *)self createXPCConnection];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    id v22 = 0;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__6;
    v15 = __Block_byref_object_dispose__6;
    id v16 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke;
    v10[3] = &unk_265443750;
    v10[4] = &v11;
    v10[5] = &v17;
    [v7 dataForRequest:v6 withReply:v10];
    *a4 = (id) v12[5];
    [(PerfPowerServicesReaderHelper *)self closeXPCConnection];
    id v8 = (id)v18[5];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v7 = logHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PerfPowerServicesReaderHelper postDataRequest:outError:](v7);
    }
    id v8 = 0;
  }

  return v8;
}

void __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = logHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke_cold_1(v6, v7);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)createXPCConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.PerfPowerTelemetryReaderService"];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v3;

  id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270724F18];
  [(NSXPCConnection *)self->_connectionToServer setRemoteObjectInterface:v5];

  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v12 = [(NSXPCConnection *)self->_connectionToServer remoteObjectInterface];
  [v12 setClasses:v10 forSelector:sel_dataForRequest_withReply_ argumentIndex:0 ofReply:1];

  uint64_t v13 = [(NSXPCConnection *)self->_connectionToServer remoteObjectInterface];
  [v13 setClasses:v11 forSelector:sel_dataForRequest_withReply_ argumentIndex:1 ofReply:1];

  [(NSXPCConnection *)self->_connectionToServer setInterruptionHandler:&__block_literal_global_9];
  [(NSXPCConnection *)self->_connectionToServer setInvalidationHandler:&__block_literal_global_16];
  [(NSXPCConnection *)self->_connectionToServer resume];
  v14 = logHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_258F16000, v14, OS_LOG_TYPE_INFO, "Spinning up XPC service", buf, 2u);
  }

  v15 = [(NSXPCConnection *)self->_connectionToServer synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_20];

  return v15;
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke()
{
  v0 = logHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_cold_1(v0);
  }
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_14()
{
  v0 = logHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_14_cold_1(v0);
  }
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = logHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_17_cold_1(v2, v3);
  }
}

- (void)closeXPCConnection
{
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)postDataRequest:(os_log_t)log outError:.cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  id v2 = "-[PerfPowerServicesReaderHelper postDataRequest:outError:]";
  __int16 v3 = 2112;
  v4 = @"Empty request";
  _os_log_debug_impl(&dword_258F16000, log, OS_LOG_TYPE_DEBUG, "(%s) %@", (uint8_t *)&v1, 0x16u);
}

void __58__PerfPowerServicesReaderHelper_postDataRequest_outError___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  __int16 v3 = [a1 localizedDescription];
  int v4 = 136315394;
  uint64_t v5 = "-[PerfPowerServicesReaderHelper postDataRequest:outError:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "(%s) Error while processing request: %@", (uint8_t *)&v4, 0x16u);
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_258F16000, log, OS_LOG_TYPE_ERROR, "Connection was interrupted.", v1, 2u);
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_14_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_258F16000, log, OS_LOG_TYPE_DEBUG, "Connection to handler is invalid.", v1, 2u);
}

void __52__PerfPowerServicesReaderHelper_createXPCConnection__block_invoke_17_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  __int16 v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_258F16000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v4, 0xCu);
}

@end