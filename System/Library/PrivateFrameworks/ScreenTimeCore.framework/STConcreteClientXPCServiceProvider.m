@interface STConcreteClientXPCServiceProvider
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCInterface)providedServiceInterface;
- (NSXPCListener)activeListener;
- (id)providePasscodeAuthenticationProviderService;
- (id)providePasscodeProviderService;
- (id)providedService;
- (void)setActiveListener:(id)a3;
- (void)setProvidedService:(id)a3;
- (void)setProvidedServiceInterface:(id)a3;
@end

@implementation STConcreteClientXPCServiceProvider

- (id)providePasscodeAuthenticationProviderService
{
  v3 = [MEMORY[0x1E4F29290] anonymousListener];
  [(STConcreteClientXPCServiceProvider *)self setActiveListener:v3];
  [v3 setDelegate:self];
  v4 = [STConcretePasscodeAuthenticationProviderService alloc];
  v5 = [v3 endpoint];
  v6 = [(STConcretePasscodeAuthenticationProviderService *)v4 initWithClientListenerEndpoint:v5];

  [(STConcreteClientXPCServiceProvider *)self setProvidedService:v6];
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A51E8];
  [(STConcreteClientXPCServiceProvider *)self setProvidedServiceInterface:v7];

  [v3 resume];
  return v6;
}

- (id)providePasscodeProviderService
{
  v3 = [MEMORY[0x1E4F29290] anonymousListener];
  [(STConcreteClientXPCServiceProvider *)self setActiveListener:v3];
  [v3 setDelegate:self];
  v4 = [STConcretePasscodeProviderService alloc];
  v5 = [v3 endpoint];
  v6 = [(STConcretePasscodeProviderService *)v4 initWithClientListenerEndpoint:v5];

  [(STConcreteClientXPCServiceProvider *)self setProvidedService:v6];
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A53D8];
  [(STConcreteClientXPCServiceProvider *)self setProvidedServiceInterface:v7];

  [v3 resume];
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteClientXPCServiceProvider *)self activeListener];

  if (v8 == v7)
  {
    v9 = [(STConcreteClientXPCServiceProvider *)self providedService];
    if (v9)
    {
      v18 = [(STConcreteClientXPCServiceProvider *)self providedServiceInterface];
      BOOL v17 = v18 != 0;
      if (v18)
      {
        [v6 setExportedInterface:v18];
        [v6 setExportedObject:v9];
        [v6 resume];
        v19 = +[STLog xpcServiceProvider];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [(STConcreteClientXPCServiceProvider *)self providedService];
          int v36 = 138543362;
          v37 = v20;
          _os_log_impl(&dword_1DA519000, v19, OS_LOG_TYPE_DEFAULT, "Accepted connection for service: %{public}@", (uint8_t *)&v36, 0xCu);
        }
      }
      else
      {
        v19 = +[STLog xpcServiceProvider];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[STConcreteClientXPCServiceProvider listener:shouldAcceptNewConnection:](v19, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
    else
    {
      v18 = +[STLog xpcServiceProvider];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[STConcreteClientXPCServiceProvider listener:shouldAcceptNewConnection:](v18, v21, v22, v23, v24, v25, v26, v27);
      }
      BOOL v17 = 0;
    }
  }
  else
  {
    v9 = +[STLog xpcServiceProvider];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STConcreteClientXPCServiceProvider listener:shouldAcceptNewConnection:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (NSXPCListener)activeListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActiveListener:(id)a3
{
}

- (id)providedService
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setProvidedService:(id)a3
{
}

- (NSXPCInterface)providedServiceInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProvidedServiceInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providedServiceInterface, 0);
  objc_storeStrong(&self->_providedService, 0);
  objc_storeStrong((id *)&self->_activeListener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end