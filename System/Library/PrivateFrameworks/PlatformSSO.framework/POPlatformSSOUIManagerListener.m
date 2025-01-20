@interface POPlatformSSOUIManagerListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (POAgentAuthenticationProcess)process;
- (POPlatformSSOUIManagerListener)initWithAuthenticationProcess:(id)a3;
- (void)setProcess:(id)a3;
@end

@implementation POPlatformSSOUIManagerListener

- (POPlatformSSOUIManagerListener)initWithAuthenticationProcess:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POPlatformSSOUIManagerListener;
  v6 = [(POAgentListener *)&v9 initWithMachServiceName:@"com.apple.PlatformSSO.settings.service-xpc"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_process, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PO_LOG_POAgentListener();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POPlatformSSOListener listener:shouldAcceptNewConnection:]();
  }

  objc_super v9 = [POUIAgentProcess alloc];
  v10 = [(POPlatformSSOUIManagerListener *)self process];
  v11 = [(POUIAgentProcess *)v9 initWithXPCConnection:v7 authenticationProcess:v10];

  v12 = [MEMORY[0x263F5E618] interfaceWithInternalProtocol:&unk_26E5DC288];
  [v7 setExportedInterface:v12];

  [v7 setExportedObject:v11];
  [v7 resume];
  objc_initWeak(&location, v11);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __69__POPlatformSSOUIManagerListener_listener_shouldAcceptNewConnection___block_invoke;
  v18 = &unk_264BBECF8;
  objc_copyWeak(&v19, &location);
  [(POUIAgentProcess *)v11 setInvalidationHandler:&v15];
  v13 = [(POUIAgentProcess *)v11 invalidationHandler];
  [v7 setInvalidationHandler:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return 1;
}

void __69__POPlatformSSOUIManagerListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
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

@end