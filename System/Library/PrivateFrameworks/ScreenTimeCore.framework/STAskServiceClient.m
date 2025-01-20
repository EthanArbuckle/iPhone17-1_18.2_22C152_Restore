@interface STAskServiceClient
- (BOOL)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (STAskServiceClient)init;
- (STAskServiceClient)initWithAlternateMachService;
- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6;
- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation STAskServiceClient

- (STAskServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STAskServiceClient;
  v2 = [(STAskServiceClient *)&v6 init];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4E68];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.ask-for-time" options:4096];
  [v4 setRemoteObjectInterface:v3];
  [v4 setInterruptionHandler:&__block_literal_global_12];
  [v4 setInvalidationHandler:&__block_literal_global_24];
  [v4 activate];
  [(STAskServiceClient *)v2 setConnection:v4];

  return v2;
}

void __26__STAskServiceClient_init__block_invoke()
{
  v0 = +[STLog settingsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __26__STAskServiceClient_init__block_invoke_cold_1();
  }
}

void __26__STAskServiceClient_init__block_invoke_22()
{
  v0 = +[STLog settingsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __26__STAskServiceClient_init__block_invoke_22_cold_1();
  }
}

- (STAskServiceClient)initWithAlternateMachService
{
  v6.receiver = self;
  v6.super_class = (Class)STAskServiceClient;
  v2 = [(STAskServiceClient *)&v6 init];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4E68];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.ask" options:4096];
  [v4 setRemoteObjectInterface:v3];
  [v4 setInterruptionHandler:&__block_literal_global_26];
  [v4 setInvalidationHandler:&__block_literal_global_29];
  [v4 activate];
  [(STAskServiceClient *)v2 setConnection:v4];

  return v2;
}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke()
{
  v0 = +[STLog settingsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __50__STAskServiceClient_initWithAlternateMachService__block_invoke_cold_1();
  }
}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke_27()
{
  v0 = +[STLog settingsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __50__STAskServiceClient_initWithAlternateMachService__block_invoke_27_cold_1();
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STAskServiceClient;
  [(STAskServiceClient *)&v4 dealloc];
}

- (void)sendAskForTimeRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = _os_activity_create(&dword_1DA519000, "STAskServiceClient.sendAskForTimeRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v9 = [(STAskServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke;
  v14[3] = &unk_1E6BC6F68;
  v14[4] = &v15;
  v10 = [v9 remoteObjectProxyWithErrorHandler:v14];

  if (v16[5])
  {
    v11 = +[STLog privateService];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STAskServiceClient sendAskForTimeRequest:completionHandler:]();
    }

    if (v7) {
      v7[2](v7, v16[5]);
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_33;
    v12[3] = &unk_1E6BC6FB8;
    v12[4] = self;
    v13 = v7;
    [v10 sendAskForTimeRequest:v6 completionHandler:v12];
  }
  _Block_object_dispose(&v15, 8);

  os_activity_scope_leave(&state);
}

void __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog askClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)approveExceptionForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = _os_activity_create(&dword_1DA519000, "STAskServiceClient.approveExceptionForRequest", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  uint64_t v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  v9 = [(STAskServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__STAskServiceClient_approveExceptionForRequest_completionHandler___block_invoke;
  v12[3] = &unk_1E6BC6F68;
  v12[4] = &v13;
  v10 = [v9 remoteObjectProxyWithErrorHandler:v12];

  if (v14[5])
  {
    v11 = +[STLog privateService];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STAskServiceClient approveExceptionForRequest:completionHandler:]();
    }

    if (v7) {
      v7[2](v7, v14[5]);
    }
  }
  else
  {
    [v10 approveExceptionForRequest:v6 completionHandler:v7];
  }

  _Block_object_dispose(&v13, 8);
  os_activity_scope_leave(&state);
}

void __67__STAskServiceClient_approveExceptionForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog askClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)handleAnswer:(int64_t)a3 requestIdentifier:(id)a4 timeApproved:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  uint64_t v13 = _os_activity_create(&dword_1DA519000, "STAskServiceClient.handleAnswer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  v14 = [(STAskServiceClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__STAskServiceClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke;
  v17[3] = &unk_1E6BC6F68;
  v17[4] = &v18;
  uint64_t v15 = [v14 remoteObjectProxyWithErrorHandler:v17];

  if (v19[5])
  {
    v16 = +[STLog privateService];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[STAskServiceClient handleAnswer:requestIdentifier:timeApproved:completionHandler:]();
    }

    if (v12) {
      v12[2](v12, v19[5]);
    }
  }
  else
  {
    [v15 handleAnswer:a3 requestIdentifier:v10 timeApproved:v11 completionHandler:v12];
  }

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);
}

void __84__STAskServiceClient_handleAnswer_requestIdentifier_timeApproved_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog askClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = _os_activity_create(&dword_1DA519000, "STAskServiceClient.respondToAskForTimeRequestWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  id v22 = 0;
  id v10 = [(STAskServiceClient *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke;
  v16[3] = &unk_1E6BC7560;
  v16[4] = &v17;
  v16[5] = &v23;
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_34;
  v15[3] = &unk_1E6BC7560;
  v15[4] = &v17;
  v15[5] = &v23;
  [v11 respondToAskForTimeRequestWithIdentifier:v8 answer:a4 completionHandler:v15];
  if (a5)
  {
    v12 = (void *)v18[5];
    if (v12) {
      *a5 = v12;
    }
  }
  char v13 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v13;
}

void __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog askClient];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_34(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = +[STLog askClient];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_34_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __26__STAskServiceClient_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "askService connection interrupted", v1, 2u);
}

void __26__STAskServiceClient_init__block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEBUG, "askService connection invalidated", v1, 2u);
}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "alternate askService connection interrupted", v1, 2u);
}

void __50__STAskServiceClient_initWithAlternateMachService__block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEBUG, "alternate askService connection invalidated", v1, 2u);
}

- (void)sendAskForTimeRequest:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "sendAskForTimeRequest failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)approveExceptionForRequest:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "approveExceptionForRequest failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)handleAnswer:requestIdentifier:timeApproved:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "handleAnswer failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __76__STAskServiceClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Error handling answer for ask for more request : %{public}@", v2, v3, v4, v5, v6);
}

@end