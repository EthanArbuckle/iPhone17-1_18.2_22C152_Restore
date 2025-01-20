@interface SADaemonXPC
+ (id)newWithInvalidationHandler:(id)a3;
- (NSXPCConnection)xpcConnection;
- (NSXPCInterface)remoteInterface;
- (SADaemonXPC)init;
- (SADaemonXPC)initWithInvalidationHandler:(id)a3;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
- (void)setRemoteInterface:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SADaemonXPC

- (SADaemonXPC)init
{
  v12.receiver = self;
  v12.super_class = (Class)SADaemonXPC;
  v2 = [(SADaemonXPC *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B0D5D0];
    remoteInterface = v2->remoteInterface;
    v2->remoteInterface = (NSXPCInterface *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B0B7B0];
    [(NSXPCInterface *)v2->remoteInterface setInterface:v5 forSelector:sel_addAppSizerHandler_reply_ argumentIndex:0 ofReply:0];
    [(NSXPCInterface *)v2->remoteInterface setInterface:v5 forSelector:sel_addURLSizerHandler_withURLs_reply_ argumentIndex:0 ofReply:0];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    [(NSXPCInterface *)v2->remoteInterface setClasses:v8 forSelector:sel_addURLSizerHandler_withURLs_reply_ argumentIndex:1 ofReply:0];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.spaceattributiond" options:0];
    xpcConnection = v2->xpcConnection;
    v2->xpcConnection = (NSXPCConnection *)v9;

    [(NSXPCConnection *)v2->xpcConnection setRemoteObjectInterface:v2->remoteInterface];
    [(NSXPCConnection *)v2->xpcConnection resume];
  }
  return v2;
}

- (SADaemonXPC)initWithInvalidationHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SADaemonXPC *)self init];
  v6 = v5;
  if (v5) {
    [(SADaemonXPC *)v5 setInvalidationHandler:v4];
  }

  return v6;
}

+ (id)newWithInvalidationHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithInvalidationHandler:v4];

  return v5;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    xpcConnection = self->xpcConnection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__SADaemonXPC_setInvalidationHandler___block_invoke;
    v11[3] = &unk_26551E710;
    id v7 = v4;
    id v12 = v7;
    [(NSXPCConnection *)xpcConnection setInvalidationHandler:v11];
    v8 = self->xpcConnection;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__SADaemonXPC_setInvalidationHandler___block_invoke_100;
    v9[3] = &unk_26551E710;
    id v10 = v7;
    [(NSXPCConnection *)v8 setInterruptionHandler:v9];
  }
}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke(uint64_t a1)
{
  v2 = SALog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38__SADaemonXPC_setInvalidationHandler___block_invoke_cold_1(v2);
  }

  uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke_100(uint64_t a1)
{
  v2 = SALog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38__SADaemonXPC_setInvalidationHandler___block_invoke_100_cold_1(v2);
  }

  uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SADaemonXPC invalidate]";
  _os_log_debug_impl(&dword_25E2BB000, log, OS_LOG_TYPE_DEBUG, "%s: start", (uint8_t *)&v1, 0xCu);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  xpcConnection = self->xpcConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_26551E738;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  xpcConnection = self->xpcConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_26551E738;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCInterface)remoteInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemoteInterface:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->xpcConnection, 0);
  objc_storeStrong((id *)&self->remoteInterface, 0);
}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "Connection (framework->daemon) Invalidated", v1, 2u);
}

void __38__SADaemonXPC_setInvalidationHandler___block_invoke_100_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "Connection (framework->daemon) Terminated", v1, 2u);
}

void __49__SADaemonXPC_remoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25E2BB000, a2, OS_LOG_TYPE_ERROR, "remoteObjectProxyWithErrorHandler: failed with %@", (uint8_t *)&v2, 0xCu);
}

void __60__SADaemonXPC_synchronousRemoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25E2BB000, a2, OS_LOG_TYPE_ERROR, "synchronousRemoteObjectProxyWithErrorHandler: failed with %@", (uint8_t *)&v2, 0xCu);
}

@end