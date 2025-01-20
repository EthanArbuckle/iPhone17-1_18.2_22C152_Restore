@interface STSetupServiceClient
- (BOOL)applyUpdatedConfiguration:(id)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)connection;
- (NSXPCInterface)providedServiceInterface;
- (NSXPCListener)activeListener;
- (NSXPCListenerEndpoint)clientListenerEndpoint;
- (STSetupServiceClient)init;
- (id)currentConfigurationForUser:(id)a3 error:(id *)a4;
- (id)pendingProvidePasscodeCompletionHandler;
- (id)providedService;
- (void)collectPasscodeFromUserWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)receivePasscode:(id)a3 completionHandler:(id)a4;
- (void)setActiveListener:(id)a3;
- (void)setConnection:(id)a3;
- (void)setPendingProvidePasscodeCompletionHandler:(id)a3;
- (void)setProvidedService:(id)a3;
- (void)setProvidedServiceInterface:(id)a3;
@end

@implementation STSetupServiceClient

- (STSetupServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSetupServiceClient;
  v2 = [(STSetupServiceClient *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4F28];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.setup" options:4096];
    [v4 setRemoteObjectInterface:v3];
    [v4 setInterruptionHandler:&__block_literal_global_18];
    [v4 setInvalidationHandler:&__block_literal_global_15_0];
    [v4 resume];
    [(STSetupServiceClient *)v2 setConnection:v4];
  }
  return v2;
}

void __28__STSetupServiceClient_init__block_invoke()
{
  v0 = +[STLog communicationClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __28__STSetupServiceClient_init__block_invoke_cold_1();
  }
}

void __28__STSetupServiceClient_init__block_invoke_13()
{
  v0 = +[STLog communicationClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __28__STSetupServiceClient_init__block_invoke_13_cold_1();
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STSetupServiceClient;
  [(STSetupServiceClient *)&v3 dealloc];
}

- (id)currentConfigurationForUser:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[STLog setupClient];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1DA519000, v7, OS_LOG_TYPE_DEFAULT, "Requesting current configuration for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__14;
  v30 = __Block_byref_object_dispose__14;
  id v31 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  id v22 = 0;
  v8 = [(STSetupServiceClient *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke;
  v16[3] = &unk_1E6BC6F68;
  v16[4] = &buf;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke_2;
  v15[3] = &unk_1E6BC7F28;
  v15[4] = &v17;
  v15[5] = &buf;
  [v9 currentConfigurationForUser:v6 completionHandler:v15];
  v10 = +[STLog setupClient];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v18[5];
    uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v23 = 138543618;
    uint64_t v24 = v11;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Got current configuration: %{public}@ - Error: %{public}@", v23, 0x16u);
  }

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

void __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __58__STSetupServiceClient_currentConfigurationForUser_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)applyUpdatedConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[STLog setupClient];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1DA519000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to apply configuration: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__14;
  v23 = __Block_byref_object_dispose__14;
  id v24 = 0;
  v8 = [(STSetupServiceClient *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke;
  v15[3] = &unk_1E6BC6F68;
  v15[4] = &buf;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke_2;
  v14[3] = &unk_1E6BC6F68;
  v14[4] = &buf;
  [v9 applyUpdatedConfiguration:v6 completionHandler:v14];
  v10 = +[STLog setupClient];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v16 = 138543618;
    id v17 = v6;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Applied configuration: %{public}@ - Error: %{public}@", v16, 0x16u);
  }

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  BOOL v12 = *(void *)(*((void *)&buf + 1) + 40) == 0;

  _Block_object_dispose(&buf, 8);
  return v12;
}

void __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
}

void __56__STSetupServiceClient_applyUpdatedConfiguration_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)collectPasscodeFromUserWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog setupClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Requesting user passcode collection", buf, 2u);
  }

  *(void *)long long buf = 0;
  v14[0] = buf;
  v14[1] = 0x3032000000;
  v14[2] = __Block_byref_object_copy__14;
  v14[3] = __Block_byref_object_dispose__14;
  id v15 = 0;
  id v6 = [(STSetupServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__STSetupServiceClient_collectPasscodeFromUserWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6BC6F68;
  v12[4] = buf;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  if (*(void *)(v14[0] + 40))
  {
    v8 = +[STLog setupClient];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STSetupServiceClient collectPasscodeFromUserWithCompletionHandler:]((uint64_t)v14, v8);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(v14[0] + 40));
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F29290] anonymousListener];
    [(STSetupServiceClient *)self setActiveListener:v9];
    [v9 setDelegate:self];
    [(STSetupServiceClient *)self setProvidedService:self];
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34ABDA0];
    [(STSetupServiceClient *)self setProvidedServiceInterface:v10];

    uint64_t v11 = [v9 endpoint];
    objc_storeStrong((id *)&self->_clientListenerEndpoint, v11);
    [v9 resume];
    [(STSetupServiceClient *)self setPendingProvidePasscodeCompletionHandler:v4];
    [v7 promptForPasscodeFromUserWithEndpoint:v11 completionHandler:&__block_literal_global_26_0];
  }
  _Block_object_dispose(buf, 8);
}

void __69__STSetupServiceClient_collectPasscodeFromUserWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __69__STSetupServiceClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_24()
{
  v0 = +[STLog setupClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEFAULT, "Prompted for passcode collection", v1, 2u);
  }
}

- (void)receivePasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  v8 = [(STSetupServiceClient *)self pendingProvidePasscodeCompletionHandler];
  if (v8)
  {
    uint64_t v9 = +[STLog setupClient];
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Resolving pending completion with passcode", v14, 2u);
      }

      ((void (**)(void, id, void))v8)[2](v8, v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[STSetupServiceClient receivePasscode:completionHandler:]();
      }

      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:48 userInfo:0];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v13);
    }
    [(STSetupServiceClient *)self setPendingProvidePasscodeCompletionHandler:0];
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v11 = +[STLog setupClient];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STSetupServiceClient receivePasscode:completionHandler:]();
    }

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:1 userInfo:0];
    v7[2](v7, v12);

    uint64_t v7 = (void (**)(id, void))v12;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STSetupServiceClient *)self activeListener];

  if (v8 == v7)
  {
    uint64_t v9 = [(STSetupServiceClient *)self providedServiceInterface];
    if (v9)
    {
      [v6 setExportedInterface:v9];
      [v6 setExportedObject:self];
      [v6 setInterruptionHandler:&__block_literal_global_29_0];
      [v6 setInvalidationHandler:&__block_literal_global_32_0];
      [v6 resume];
      BOOL v10 = 1;
      goto LABEL_7;
    }
    uint64_t v12 = +[STLog setupClient];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STSetupServiceClient listener:shouldAcceptNewConnection:]();
    }
  }
  else
  {
    uint64_t v9 = +[STLog setupClient];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STSetupServiceClient listener:shouldAcceptNewConnection:]();
    }
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = +[STLog setupClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_30()
{
  v0 = +[STLog setupClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_30_cold_1();
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)clientListenerEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (NSXPCListener)activeListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActiveListener:(id)a3
{
}

- (id)providedService
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setProvidedService:(id)a3
{
}

- (NSXPCInterface)providedServiceInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProvidedServiceInterface:(id)a3
{
}

- (id)pendingProvidePasscodeCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingProvidePasscodeCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingProvidePasscodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_providedServiceInterface, 0);
  objc_storeStrong(&self->_providedService, 0);
  objc_storeStrong((id *)&self->_activeListener, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __28__STSetupServiceClient_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "setupService connection interrupted", v2, v3, v4, v5, v6);
}

void __28__STSetupServiceClient_init__block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEBUG, "setupService connection invalidated", v1, 2u);
}

- (void)collectPasscodeFromUserWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to collect passcode: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)receivePasscode:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "No pending completion handler to resolve with passcode", v2, v3, v4, v5, v6);
}

- (void)receivePasscode:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "Resolving pending completion with error", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "Rejecting connection: Unable to find provided service interface.", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "Rejecting connection: Listener did not match active listener", v2, v3, v4, v5, v6);
}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "STPasscodeReceiverProtocol connection interrupted", v2, v3, v4, v5, v6);
}

void __59__STSetupServiceClient_listener_shouldAcceptNewConnection___block_invoke_30_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "STPasscodeReceiverProtocol connection invalidated", v2, v3, v4, v5, v6);
}

@end