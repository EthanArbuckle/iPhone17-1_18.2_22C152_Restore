@interface STCommunicationClient
+ (id)_newConnection;
- (NSXPCConnection)connection;
- (STCommunicationClient)init;
- (STCommunicationServiceClient)communicationServiceClient;
- (id)currentConfigurationWithError:(id *)a3;
- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)setCommunicationServiceClient:(id)a3;
@end

@implementation STCommunicationClient

- (id)currentConfigurationWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = +[STLog communicationClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Requesting current communication configuration", buf, 2u);
  }

  *(void *)buf = 0;
  v23 = buf;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [(STCommunicationServiceClient *)self->_communicationServiceClient currentConfigurationWithError:a3];
    v7 = (void *)v17[5];
    v17[5] = v6;
  }
  else
  {
    v8 = [(STCommunicationClient *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__STCommunicationClient_currentConfigurationWithError___block_invoke;
    v15[3] = &unk_1E6BC6F68;
    v15[4] = buf;
    v7 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__STCommunicationClient_currentConfigurationWithError___block_invoke_2;
    v14[3] = &unk_1E6BC7508;
    v14[4] = &v16;
    v14[5] = buf;
    [v7 currentCommunicationConfigurationWithCompletionHandler:v14];
  }

  v9 = +[STLog communicationClient];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v17[5];
    uint64_t v11 = *((void *)v23 + 5);
    *(_DWORD *)v28 = 138543618;
    uint64_t v29 = v10;
    __int16 v30 = 2114;
    uint64_t v31 = v11;
    _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_DEFAULT, "Got current communication configuration: %{public}@ - Error: %{public}@", v28, 0x16u);
  }

  if (a3) {
    *a3 = *((id *)v23 + 5);
  }
  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (STCommunicationClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)STCommunicationClient;
  v2 = [(STCommunicationClient *)&v8 init];
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(STCommunicationServiceClient);
    communicationServiceClient = v2->_communicationServiceClient;
    v2->_communicationServiceClient = v3;
  }
  else
  {
    v5 = +[STCommunicationClient _newConnection];
    connection = v2->_connection;
    v2->_connection = v5;

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

+ (id)_newConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.communication" options:4096];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4D48];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationClient;
  [(STCommunicationClient *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __55__STCommunicationClient_currentConfigurationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[STLog communicationClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Authenticating for communication configuration override", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    [(STCommunicationServiceClient *)self->_communicationServiceClient authenticateForCommunicationConfigurationOverrideWithCompletionHandler:v4];
  }
  else
  {
    *(void *)buf = 0;
    v17[0] = buf;
    v17[1] = 0x3032000000;
    v17[2] = __Block_byref_object_copy__2;
    v17[3] = __Block_byref_object_dispose__2;
    id v18 = 0;
    id v6 = [(STCommunicationClient *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E6BC6F68;
    v15[4] = buf;
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];

    if (*(void *)(v17[0] + 40))
    {
      objc_super v8 = +[STLog communicationClient];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[STCommunicationClient authenticateForCommunicationConfigurationOverrideWithCompletionHandler:]((uint64_t)v17, v8);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(v17[0] + 40));
    }
    else
    {
      uint64_t v9 = objc_opt_new();
      uint64_t v10 = [v9 providePasscodeAuthenticationProviderService];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15;
      v12[3] = &unk_1E6BC74E0;
      id v14 = v4;
      id v11 = v9;
      id v13 = v11;
      [v10 authenticatePasscodeWithCommunicationServiceProxy:v7 completionHandler:v12];
    }
    _Block_object_dispose(buf, 8);
  }
}

void __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[STLog communicationClient];
  objc_super v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_DEFAULT, "Successfully authenticated passcode", v10, 2u);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15_cold_1((uint64_t)v6, v8);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void __55__STCommunicationClient_currentConfigurationWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (STCommunicationServiceClient)communicationServiceClient
{
  return self->_communicationServiceClient;
}

- (void)setCommunicationServiceClient:(id)a3
{
}

- (void)authenticateForCommunicationConfigurationOverrideWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to authenticate for communication configuration override: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __96__STCommunicationClient_authenticateForCommunicationConfigurationOverrideWithCompletionHandler___block_invoke_15_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to authenticate passcode: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end