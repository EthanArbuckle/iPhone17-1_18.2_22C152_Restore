@interface STDowntimeClient
+ (id)_newConnection;
- (BOOL)isDowntimeEnabledForUserID:(id)a3;
- (NSXPCConnection)connection;
- (STDowntimeClient)init;
- (STDowntimeServiceClient)downtimeServiceClient;
- (void)dealloc;
- (void)setDowntimeServiceClient:(id)a3;
- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4;
@end

@implementation STDowntimeClient

- (STDowntimeClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)STDowntimeClient;
  v2 = [(STDowntimeClient *)&v8 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STDowntimeServiceClient);
      downtimeServiceClient = v2->_downtimeServiceClient;
      v2->_downtimeServiceClient = v3;
    }
    else
    {
      v5 = +[STDowntimeClient _newConnection];
      connection = v2->_connection;
      v2->_connection = v5;

      [(NSXPCConnection *)v2->_connection resume];
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STDowntimeClient;
  [(STDowntimeClient *)&v3 dealloc];
}

+ (id)_newConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.downtime" options:4096];
  objc_super v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4CE8];
  [v2 setRemoteObjectInterface:v3];

  return v2;
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
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (_os_feature_enabled_impl())
  {
    BOOL v6 = [(STDowntimeServiceClient *)self->_downtimeServiceClient isDowntimeEnabledForUserID:v4];
    *((unsigned char *)v16 + 24) = v6;
  }
  else
  {
    v7 = [(STDowntimeClient *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke;
    v14[3] = &unk_1E6BC6F68;
    v14[4] = &buf;
    objc_super v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke_2;
    v13[3] = &unk_1E6BC6F90;
    v13[4] = &buf;
    v13[5] = &v15;
    [v8 isDowntimeEnabledForUserID:v4 completionHandler:v13];
    v9 = +[STLog downtimeClient];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)v16 + 24);
      uint64_t v11 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v19 = 67109378;
      int v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_DEFAULT, "Got downtime state: %d - Error: %{public}@", v19, 0x12u);
    }

    BOOL v6 = *((unsigned char *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);

  return v6;
}

void __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke(uint64_t a1, void *a2)
{
}

void __47__STDowntimeClient_isDowntimeEnabledForUserID___block_invoke_2(uint64_t a1, char a2, id obj)
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
  objc_super v8 = +[STLog downtimeClient];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_DEFAULT, "Requesting current downtime state for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  int v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  if (_os_feature_enabled_impl())
  {
    [(STDowntimeServiceClient *)self->_downtimeServiceClient toggleOnDemandDowntimeForUserID:v6 completionHandler:v7];
  }
  else
  {
    v9 = [(STDowntimeClient *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke;
    v14[3] = &unk_1E6BC6F68;
    v14[4] = &buf;
    int v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6BC6F68;
    v13[4] = &buf;
    [v10 toggleOnDemandDowntimeForUserID:v6 completionHandler:v13];
    uint64_t v11 = +[STLog downtimeClient];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v15 = 138412290;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1DA519000, v11, OS_LOG_TYPE_DEFAULT, "Toggle On Demand Downtime with Error: %@", v15, 0xCu);
    }

    v7[2](v7, *(void *)(*((void *)&buf + 1) + 40));
  }
  _Block_object_dispose(&buf, 8);
}

void __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
}

void __70__STDowntimeClient_toggleOnDemandDowntimeForUserID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (STDowntimeServiceClient)downtimeServiceClient
{
  return self->_downtimeServiceClient;
}

- (void)setDowntimeServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end