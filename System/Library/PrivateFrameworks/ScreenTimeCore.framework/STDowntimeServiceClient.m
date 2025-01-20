@interface STDowntimeServiceClient
- (BOOL)isDowntimeEnabledForUserID:(id)a3;
- (NSXPCConnection)connection;
- (STDowntimeServiceClient)init;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4;
@end

@implementation STDowntimeServiceClient

- (STDowntimeServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STDowntimeServiceClient;
  v2 = [(STDowntimeServiceClient *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B50A8];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.downtime" options:4096];
    [v4 setRemoteObjectInterface:v3];
    [v4 setInterruptionHandler:&__block_literal_global_20];
    [v4 setInvalidationHandler:&__block_literal_global_13];
    [v4 resume];
    [(STDowntimeServiceClient *)v2 setConnection:v4];
  }
  return v2;
}

void __31__STDowntimeServiceClient_init__block_invoke()
{
  v0 = +[STLog downtimeClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __31__STDowntimeServiceClient_init__block_invoke_cold_1(v0);
  }
}

void __31__STDowntimeServiceClient_init__block_invoke_11()
{
  v0 = +[STLog downtimeClient];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __31__STDowntimeServiceClient_init__block_invoke_11_cold_1(v0);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STDowntimeServiceClient;
  [(STDowntimeServiceClient *)&v4 dealloc];
}

- (BOOL)isDowntimeEnabledForUserID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[STLog downtimeClient];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Requesting current downtime state for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__17;
  v26 = __Block_byref_object_dispose__17;
  id v27 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  objc_super v6 = [(STDowntimeServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke;
  v14[3] = &unk_1E6BC6F68;
  v14[4] = &buf;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke_2;
  v13[3] = &unk_1E6BC6F90;
  v13[4] = &buf;
  v13[5] = &v15;
  [v7 isDowntimeEnabledForUserID:v4 completionHandler:v13];
  v8 = +[STLog downtimeClient];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *((unsigned __int8 *)v16 + 24);
    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v19 = 67109378;
    int v20 = v9;
    __int16 v21 = 2114;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_DEFAULT, "Got downtime state: %d - Error: %{public}@", v19, 0x12u);
  }

  BOOL v11 = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke(uint64_t a1, void *a2)
{
}

void __54__STDowntimeServiceClient_isDowntimeEnabledForUserID___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = +[STLog downtimeClient];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_DEFAULT, "Requesting current downtime state for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__17;
  int v20 = __Block_byref_object_dispose__17;
  id v21 = 0;
  int v9 = [(STDowntimeServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC6F68;
  v14[4] = &buf;
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2;
  v13[3] = &unk_1E6BC6F68;
  v13[4] = &buf;
  [v10 toggleOnDemandDowntimeForUserID:v6 completionHandler:v13];
  BOOL v11 = +[STLog downtimeClient];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v15 = 138412290;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1DA519000, v11, OS_LOG_TYPE_DEFAULT, "Toggle On Demand Downtime with Error: %@", v15, 0xCu);
  }

  v7[2](v7, *(void *)(*((void *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);
}

void __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __77__STDowntimeServiceClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __31__STDowntimeServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "downtimeService connection interrupted", v1, 2u);
}

void __31__STDowntimeServiceClient_init__block_invoke_11_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "downtimeService connection invalidated", v1, 2u);
}

@end