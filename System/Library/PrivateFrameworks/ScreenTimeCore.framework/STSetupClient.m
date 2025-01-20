@interface STSetupClient
+ (id)_newConnection;
- (BOOL)applyUpdatedConfiguration:(id)a3 error:(id *)a4;
- (NSXPCConnection)connection;
- (STSetupClient)init;
- (STSetupServiceClient)setupServiceClient;
- (id)currentConfigurationForUser:(id)a3 error:(id *)a4;
- (void)collectPasscodeFromUserWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)setSetupServiceClient:(id)a3;
@end

@implementation STSetupClient

- (STSetupClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)STSetupClient;
  v2 = [(STSetupClient *)&v8 init];
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(STSetupServiceClient);
    setupServiceClient = v2->_setupServiceClient;
    v2->_setupServiceClient = v3;
  }
  else
  {
    v5 = +[STSetupClient _newConnection];
    connection = v2->_connection;
    v2->_connection = v5;

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STSetupClient;
  [(STSetupClient *)&v3 dealloc];
}

+ (id)_newConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.setup" options:4096];
  objc_super v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B5048];
  [v2 setRemoteObjectInterface:v3];

  return v2;
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
  v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  id v31 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16;
  v21 = __Block_byref_object_dispose__16;
  id v22 = 0;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(STSetupServiceClient *)self->_setupServiceClient currentConfigurationForUser:v6 error:a4];
  }
  else
  {
    v9 = [(STSetupClient *)self connection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__STSetupClient_currentConfigurationForUser_error___block_invoke;
    v16[3] = &unk_1E6BC6F68;
    v16[4] = &buf;
    v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__STSetupClient_currentConfigurationForUser_error___block_invoke_2;
    v15[3] = &unk_1E6BC7F28;
    v15[4] = &v17;
    v15[5] = &buf;
    [v10 currentConfigurationForUser:v6 completionHandler:v15];
    v11 = +[STLog setupClient];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v18[5];
      uint64_t v13 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1DA519000, v11, OS_LOG_TYPE_DEFAULT, "Got current configuration: %{public}@ - Error: %{public}@", v23, 0x16u);
    }

    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
    id v8 = (id)v18[5];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __51__STSetupClient_currentConfigurationForUser_error___block_invoke(uint64_t a1, void *a2)
{
}

void __51__STSetupClient_currentConfigurationForUser_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
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
  id v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  id v24 = 0;
  if (_os_feature_enabled_impl())
  {
    BOOL v8 = [(STSetupServiceClient *)self->_setupServiceClient applyUpdatedConfiguration:v6 error:a4];
  }
  else
  {
    uint64_t v9 = [(STSetupClient *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke;
    v15[3] = &unk_1E6BC6F68;
    v15[4] = &buf;
    v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v15];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke_2;
    v14[3] = &unk_1E6BC6F68;
    v14[4] = &buf;
    [v10 applyUpdatedConfiguration:v6 completionHandler:v14];
    id v11 = +[STLog setupClient];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v16 = 138543618;
      id v17 = v6;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1DA519000, v11, OS_LOG_TYPE_DEFAULT, "Applied configuration: %{public}@ - Error: %{public}@", v16, 0x16u);
    }

    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v8 = *(void *)(*((void *)&buf + 1) + 40) == 0;
  }
  _Block_object_dispose(&buf, 8);

  return v8;
}

void __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
}

void __49__STSetupClient_applyUpdatedConfiguration_error___block_invoke_2(uint64_t a1, void *a2)
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
  v17[0] = buf;
  v17[1] = 0x3032000000;
  v17[2] = __Block_byref_object_copy__16;
  v17[3] = __Block_byref_object_dispose__16;
  id v18 = 0;
  if (_os_feature_enabled_impl())
  {
    [(STSetupServiceClient *)self->_setupServiceClient collectPasscodeFromUserWithCompletionHandler:v4];
  }
  else
  {
    id v6 = [(STSetupClient *)self connection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E6BC6F68;
    v15[4] = buf;
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];

    if (*(void *)(v17[0] + 40))
    {
      BOOL v8 = +[STLog setupClient];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[STSetupServiceClient collectPasscodeFromUserWithCompletionHandler:]((uint64_t)v17, v8);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(v17[0] + 40));
    }
    else
    {
      uint64_t v9 = objc_opt_new();
      v10 = [v9 providePasscodeProviderService];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17;
      v12[3] = &unk_1E6BC7F78;
      id v14 = v4;
      id v11 = v9;
      id v13 = v11;
      [v10 collectPasscodeWithSetupServiceProxy:v7 completionHandler:v12];
    }
  }
  _Block_object_dispose(buf, 8);
}

void __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[STLog setupClient];
  BOOL v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_DEFAULT, "Successfully collected passcode", v10, 2u);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17_cold_1((uint64_t)v6, v8);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (STSetupServiceClient)setupServiceClient
{
  return self->_setupServiceClient;
}

- (void)setSetupServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __62__STSetupClient_collectPasscodeFromUserWithCompletionHandler___block_invoke_17_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to collect passcode: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end