@interface POPlatformSSOListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (POAgentAuthenticationProcess)process;
- (id)initForLogin:(BOOL)a3 authenticationProcess:(id)a4;
- (void)setProcess:(id)a3;
@end

@implementation POPlatformSSOListener

- (id)initForLogin:(BOOL)a3 authenticationProcess:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  if (v5) {
    v8 = @"com.apple.PlatformSSO.login.service-xpc";
  }
  else {
    v8 = @"com.apple.PlatformSSO.service-xpc";
  }
  v12.receiver = self;
  v12.super_class = (Class)POPlatformSSOListener;
  v9 = [(POAgentListener *)&v12 initWithMachServiceName:v8];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_process, a4);
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PO_LOG_POAgentListener();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POPlatformSSOListener listener:shouldAcceptNewConnection:]();
  }

  v9 = [POAgentProcess alloc];
  v10 = [(POPlatformSSOListener *)self process];
  v11 = [(POAgentProcess *)v9 initWithXPCConnection:v7 authenticationProcess:v10];

  objc_super v12 = [MEMORY[0x263F5E618] interfaceWithInternalProtocol:&unk_26E5D50B0];
  [v7 setExportedInterface:v12];

  [v7 setExportedObject:v11];
  [v7 resume];
  objc_initWeak(&location, v11);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __60__POPlatformSSOListener_listener_shouldAcceptNewConnection___block_invoke;
  v18 = &unk_264BBECF8;
  objc_copyWeak(&v19, &location);
  [(POAgentCoreProcess *)v11 setInvalidationHandler:&v15];
  v13 = [(POAgentCoreProcess *)v11 invalidationHandler];
  [v7 setInvalidationHandler:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return 1;
}

void __60__POPlatformSSOListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

- (POAgentAuthenticationProcess)process
{
  return (POAgentAuthenticationProcess *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcess:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_230E51000, v0, v1, "%{public}@, %{public}@");
}

@end