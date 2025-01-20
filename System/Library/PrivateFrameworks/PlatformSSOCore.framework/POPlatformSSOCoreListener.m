@interface POPlatformSSOCoreListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (POJWKSStorageProvider)jwksStorageProvider;
- (POUserIdentifierProvider)userIdentifierProvider;
- (id)initForLogin:(BOOL)a3 identifierProvider:(id)a4 jwksStroageProvider:(id)a5;
- (void)setJwksStorageProvider:(id)a3;
- (void)setUserIdentifierProvider:(id)a3;
@end

@implementation POPlatformSSOCoreListener

- (id)initForLogin:(BOOL)a3 identifierProvider:(id)a4 jwksStroageProvider:(id)a5
{
  BOOL v7 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v7) {
    v11 = @"com.apple.PlatformSSO.login.service-xpc";
  }
  else {
    v11 = @"com.apple.PlatformSSO.service-xpc";
  }
  v15.receiver = self;
  v15.super_class = (Class)POPlatformSSOCoreListener;
  v12 = [(POAgentListener *)&v15 initWithMachServiceName:v11];
  p_isa = (id *)&v12->super.super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userIdentifierProvider, a4);
    objc_storeStrong(p_isa + 8, a5);
  }

  return p_isa;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PO_LOG_POAgentListener_once != -1) {
    dispatch_once(&PO_LOG_POAgentListener_once, &__block_literal_global_9);
  }
  v8 = PO_LOG_POAgentListener_log;
  if (os_log_type_enabled((os_log_t)PO_LOG_POAgentListener_log, OS_LOG_TYPE_DEBUG)) {
    -[POPlatformSSOCoreListener listener:shouldAcceptNewConnection:]((uint64_t)v6, (uint64_t)v7, v8);
  }
  id v9 = [POAgentCoreProcess alloc];
  id v10 = [(POPlatformSSOCoreListener *)self userIdentifierProvider];
  v11 = [(POPlatformSSOCoreListener *)self jwksStorageProvider];
  v12 = [(POAgentCoreProcess *)v9 initWithXPCConnection:v7 identifierProvider:v10 jwksStroageProvider:v11];

  v13 = +[POInternalProtocols interfaceWithInternalProtocol:&unk_2707E3078];
  [v7 setExportedInterface:v13];

  [v7 setExportedObject:v12];
  [v7 resume];
  objc_initWeak(&location, v12);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __64__POPlatformSSOCoreListener_listener_shouldAcceptNewConnection___block_invoke;
  v19 = &unk_265464058;
  objc_copyWeak(&v20, &location);
  [(POAgentCoreProcess *)v12 setInvalidationHandler:&v16];
  v14 = [(POAgentCoreProcess *)v12 invalidationHandler];
  [v7 setInvalidationHandler:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

void __64__POPlatformSSOCoreListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return (POJWKSStorageProvider *)objc_getProperty(self, a2, 64, 1);
}

- (void)setJwksStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "%{public}@, %{public}@", (uint8_t *)&v3, 0x16u);
}

@end