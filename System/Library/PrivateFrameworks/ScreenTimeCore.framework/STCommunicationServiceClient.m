@interface STCommunicationServiceClient
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)connection;
- (NSXPCInterface)providedServiceInterface;
- (NSXPCListener)activeListener;
- (NSXPCListenerEndpoint)clientListenerEndpoint;
- (STCommunicationServiceClient)init;
- (id)currentConfigurationWithError:(id *)a3;
- (id)pendingAuthenticationCompletionHandler;
- (id)providedService;
- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)receivePasscodeAuthenticationResult:(id)a3 completionHandler:(id)a4;
- (void)setActiveListener:(id)a3;
- (void)setConnection:(id)a3;
- (void)setPendingAuthenticationCompletionHandler:(id)a3;
- (void)setProvidedService:(id)a3;
- (void)setProvidedServiceInterface:(id)a3;
@end

@implementation STCommunicationServiceClient

- (STCommunicationServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STCommunicationServiceClient;
  v2 = [(STCommunicationServiceClient *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4FE8];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.communication" options:4096];
    [v4 setRemoteObjectInterface:v3];
    [v4 setInterruptionHandler:&__block_literal_global_19];
    [v4 setInvalidationHandler:&__block_literal_global_14];
    [v4 resume];
    [(STCommunicationServiceClient *)v2 setConnection:v4];
  }
  return v2;
}

void __36__STCommunicationServiceClient_init__block_invoke()
{
  v0 = +[STLog communicationClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __36__STCommunicationServiceClient_init__block_invoke_cold_1();
  }
}

void __36__STCommunicationServiceClient_init__block_invoke_12()
{
  v0 = +[STLog communicationClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __36__STCommunicationServiceClient_init__block_invoke_12_cold_1();
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STCommunicationServiceClient;
  [(STCommunicationServiceClient *)&v4 dealloc];
}

- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[STLog communicationClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Authenticating for communication configuration override", buf, 2u);
  }

  *(void *)buf = 0;
  v14[0] = buf;
  v14[1] = 0x3032000000;
  v14[2] = __Block_byref_object_copy__15;
  v14[3] = __Block_byref_object_dispose__15;
  id v15 = 0;
  objc_super v6 = [(STCommunicationServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__STCommunicationServiceClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6BC6F68;
  v12[4] = buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  if (*(void *)(v14[0] + 40))
  {
    v8 = +[STLog communicationClient];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STCommunicationClient authenticateForCommunicationConfigurationOverrideWithCompletionHandler:]((uint64_t)v14, v8);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(v14[0] + 40));
  }
  else
  {
    v9 = [MEMORY[0x1E4F29290] anonymousListener];
    [(STCommunicationServiceClient *)self setActiveListener:v9];
    [v9 setDelegate:self];
    [(STCommunicationServiceClient *)self setProvidedService:self];
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34AC110];
    [(STCommunicationServiceClient *)self setProvidedServiceInterface:v10];

    v11 = [v9 endpoint];
    objc_storeStrong((id *)&self->_clientListenerEndpoint, v11);
    [v9 resume];
    [(STCommunicationServiceClient *)self setPendingAuthenticationCompletionHandler:v4];
    [v7 authenticatePasscodeForUserWithEndpoint:v11 completionHandler:&__block_literal_global_24_0];
  }
  _Block_object_dispose(buf, 8);
}

void __103__STCommunicationServiceClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __103__STCommunicationServiceClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_22()
{
  v0 = +[STLog communicationClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEFAULT, "Prompted for passcode authentication", v1, 2u);
  }
}

- (id)currentConfigurationWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = +[STLog communicationClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Requesting current communication configuration", buf, 2u);
  }

  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  id v20 = 0;
  objc_super v6 = [(STCommunicationServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke;
  v14[3] = &unk_1E6BC6F68;
  void v14[4] = buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke_2;
  v13[3] = &unk_1E6BC7508;
  v13[4] = &v15;
  v13[5] = buf;
  [v7 currentCommunicationConfigurationWithCompletionHandler:v13];
  v8 = +[STLog communicationClient];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v16[5];
    uint64_t v10 = *((void *)v22 + 5);
    *(_DWORD *)v27 = 138543618;
    uint64_t v28 = v9;
    __int16 v29 = 2114;
    uint64_t v30 = v10;
    _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_DEFAULT, "Got current communication configuration: %{public}@ - Error: %{public}@", v27, 0x16u);
  }

  if (a3) {
    *a3 = *((id *)v22 + 5);
  }
  id v11 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(buf, 8);

  return v11;
}

void __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __62__STCommunicationServiceClient_currentConfigurationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)receivePasscodeAuthenticationResult:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  v8 = [(STCommunicationServiceClient *)self pendingAuthenticationCompletionHandler];
  if (v8)
  {
    uint64_t v9 = +[STLog communicationClient];
    uint64_t v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Resolving pending completion with authentication result", v14, 2u);
      }

      ((void (**)(void, id, void))v8)[2](v8, v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[STSetupServiceClient receivePasscode:completionHandler:]();
      }

      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:51 userInfo:0];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v13);
    }
    [(STCommunicationServiceClient *)self setPendingAuthenticationCompletionHandler:0];
    v7[2](v7, 0);
  }
  else
  {
    id v11 = +[STLog communicationClient];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STCommunicationServiceClient receivePasscodeAuthenticationResult:completionHandler:]();
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
  id v8 = [(STCommunicationServiceClient *)self activeListener];

  if (v8 == v7)
  {
    uint64_t v9 = [(STCommunicationServiceClient *)self providedServiceInterface];
    if (v9)
    {
      [v6 setExportedInterface:v9];
      [v6 setExportedObject:self];
      [v6 setInterruptionHandler:&__block_literal_global_28];
      [v6 setInvalidationHandler:&__block_literal_global_31];
      [v6 resume];
      BOOL v10 = 1;
      goto LABEL_7;
    }
    uint64_t v12 = +[STLog communicationClient];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STSetupServiceClient listener:shouldAcceptNewConnection:]();
    }
  }
  else
  {
    uint64_t v9 = +[STLog communicationClient];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STSetupServiceClient listener:shouldAcceptNewConnection:]();
    }
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = +[STLog communicationClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_29()
{
  v0 = +[STLog communicationClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_29_cold_1();
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCListener)activeListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActiveListener:(id)a3
{
}

- (NSXPCListenerEndpoint)clientListenerEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 24, 1);
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

- (id)pendingAuthenticationCompletionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPendingAuthenticationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_providedServiceInterface, 0);
  objc_storeStrong(&self->_providedService, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_activeListener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __36__STCommunicationServiceClient_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "communicationService connection interrupted", v2, v3, v4, v5, v6);
}

void __36__STCommunicationServiceClient_init__block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEBUG, "communicationService connection invalidated", v1, 2u);
}

- (void)receivePasscodeAuthenticationResult:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "No pending completion handler to resolve with authentication result", v2, v3, v4, v5, v6);
}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "STPasscodeAuthenticationResultReceiverProtocol connection interrupted", v2, v3, v4, v5, v6);
}

void __67__STCommunicationServiceClient_listener_shouldAcceptNewConnection___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1DA519000, v0, v1, "STPasscodeAuthenticationResultReceiverProtocol connection invalidated", v2, v3, v4, v5, v6);
}

@end