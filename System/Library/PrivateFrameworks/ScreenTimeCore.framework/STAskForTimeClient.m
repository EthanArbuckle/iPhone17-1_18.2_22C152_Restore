@interface STAskForTimeClient
- (NSXPCConnection)xpcConnection;
- (STAskForTimeClient)init;
- (STAskServiceClient)askServiceClient;
- (void)_asynchronousProxyWithHandler:(id)a3;
- (void)_synchronousProxyWithHandler:(id)a3;
- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)fetchLastResponseForRequestedResourceIdentifier:(id)a3 usageType:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6;
- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4;
- (void)setAskServiceClient:(id)a3;
@end

@implementation STAskForTimeClient

- (STAskForTimeClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)STAskForTimeClient;
  v2 = [(STAskForTimeClient *)&v9 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_alloc_init(STAskServiceClient);
      askServiceClient = v2->_askServiceClient;
      v2->_askServiceClient = v3;
    }
    else
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.ask-for-time" options:4096];
      xpcConnection = v2->_xpcConnection;
      v2->_xpcConnection = (NSXPCConnection *)v5;

      v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A0A48];
      [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v7];

      [(NSXPCConnection *)v2->_xpcConnection resume];
    }
  }
  return v2;
}

- (void)dealloc
{
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(NSXPCConnection *)self->_xpcConnection invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)STAskForTimeClient;
  [(STAskForTimeClient *)&v3 dealloc];
}

- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v8 = [(STAskForTimeClient *)self askServiceClient];
    [v8 sendAskForTimeRequest:v6 completionHandler:v7];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke;
    v9[3] = &unk_1E6BC6FE0;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    [(STAskForTimeClient *)self _asynchronousProxyWithHandler:v9];
  }
}

void __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6BC6FB8;
    uint64_t v7 = a1[4];
    v8 = (void *)a1[6];
    v10[4] = a1[5];
    id v11 = v8;
    [v5 sendAskForTimeRequest:v7 completionHandler:v10];
  }
  else
  {
    uint64_t v9 = a1[6];
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    }
  }
}

uint64_t __62__STAskForTimeClient_sendAskForTimeRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v8 = [(STAskForTimeClient *)self askServiceClient];
    [v8 approveExceptionForRequest:v6 completionHandler:v7];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke;
    v9[3] = &unk_1E6BC6FE0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    [(STAskForTimeClient *)self _asynchronousProxyWithHandler:v9];
  }
}

void __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6BC6FB8;
    uint64_t v7 = a1[4];
    v8 = (void *)a1[6];
    v10[4] = a1[5];
    id v11 = v8;
    [v5 approveExceptionForRequest:v7 completionHandler:v10];
  }
  else
  {
    uint64_t v9 = a1[6];
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    }
  }
}

uint64_t __67__STAskForTimeClient_approveExceptionForRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchLastResponseForRequestedResourceIdentifier:(id)a3 usageType:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (_os_feature_enabled_impl())
  {
    if (v9) {
      (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 4, 0, 0);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E6BC7030;
    int64_t v14 = a4;
    id v11 = v8;
    id v12 = self;
    id v13 = v9;
    [(STAskForTimeClient *)self _asynchronousProxyWithHandler:v10];
  }
}

void __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E6BC7008;
    uint64_t v7 = a1[4];
    id v8 = (void *)a1[6];
    uint64_t v9 = a1[7];
    v11[4] = a1[5];
    id v12 = v8;
    [v5 fetchLastResponseForRequestedResourceIdentifier:v7 usageType:v9 withCompletionHandler:v11];
  }
  else
  {
    uint64_t v10 = a1[6];
    if (v10) {
      (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, 0, 0, v6);
    }
  }
}

uint64_t __102__STAskForTimeClient_fetchLastResponseForRequestedResourceIdentifier_usageType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (_os_feature_enabled_impl())
  {
    id v13 = [(STAskForTimeClient *)self askServiceClient];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke;
    v23[3] = &unk_1E6BC7058;
    int64_t v14 = &v24;
    id v24 = v12;
    id v15 = v12;
    [v13 handleAnswer:a3 requestIdentifier:v10 timeApproved:v11 completionHandler:v23];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_61;
    v17[3] = &unk_1E6BC70A8;
    int64_t v22 = a3;
    int64_t v14 = &v18;
    id v18 = v10;
    id v19 = v11;
    v20 = self;
    id v21 = v12;
    id v16 = v12;
    [(STAskForTimeClient *)self _asynchronousProxyWithHandler:v17];

    id v13 = v19;
  }
}

void __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_61(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6BC7080;
    uint64_t v9 = (void *)a1[7];
    uint64_t v10 = a1[8];
    v12[4] = a1[6];
    id v13 = v9;
    [v5 handleAnswer:v10 requestIdentifier:v7 timeApproved:v8 completionHandler:v12];
  }
  else
  {
    uint64_t v11 = a1[7];
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }
}

uint64_t __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_synchronousProxyWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAskForTimeClient *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke;
  v8[3] = &unk_1E6BC7058;
  id v9 = v4;
  id v6 = (void (**)(id, void *, void))v4;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v6[2](v6, v7, 0);
}

void __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_asynchronousProxyWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STAskForTimeClient *)self xpcConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__STAskForTimeClient__asynchronousProxyWithHandler___block_invoke;
  v8[3] = &unk_1E6BC7058;
  id v9 = v4;
  id v6 = (void (**)(id, void *, void))v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  v6[2](v6, v7, 0);
}

void __52__STAskForTimeClient__asynchronousProxyWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (STAskServiceClient)askServiceClient
{
  return self->_askServiceClient;
}

- (void)setAskServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_askServiceClient, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __84__STAskForTimeClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "handleAnswer failed with: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __51__STAskForTimeClient__synchronousProxyWithHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "Connection error from %{public}@: %{public}@", v1, 0x16u);
}

@end