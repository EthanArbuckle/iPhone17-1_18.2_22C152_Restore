@interface STContactsServiceClient
- (NSXPCConnection)connection;
- (STContactsServiceClient)init;
- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3;
- (void)presentRemotePINControllerWithCompletionHandler:(id)a3;
- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation STContactsServiceClient

- (STContactsServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STContactsServiceClient;
  v2 = [(STContactsServiceClient *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4E08];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.Contacts" options:4096];
    [v4 setRemoteObjectInterface:v3];
    [v4 setInterruptionHandler:&__block_literal_global_5];
    [v4 setInvalidationHandler:&__block_literal_global_15];
    [v4 resume];
    [(STContactsServiceClient *)v2 setConnection:v4];
  }
  return v2;
}

void __31__STContactsServiceClient_init__block_invoke()
{
  v0 = +[STLog contactsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __31__STContactsServiceClient_init__block_invoke_cold_1(v0);
  }
}

void __31__STContactsServiceClient_init__block_invoke_13()
{
  v0 = +[STLog contactsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __31__STContactsServiceClient_init__block_invoke_13_cold_1(v0);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STContactsServiceClient;
  [(STContactsServiceClient *)&v4 dealloc];
}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:(id)a3
{
  objc_super v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v5 = [(STContactsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6BC7560;
  v9[4] = &v10;
  v9[5] = &v16;
  objc_super v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v10;
  v8[5] = &v16;
  [v6 isRestrictionsPasscodeSetWithCompletionHandler:v8];
  if (v11[5])
  {
    v7 = +[STLog contactsService];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STContactsServiceClient isRestrictionsPasscodeSetWithCompletionHandler:]();
    }
  }
  if (v4) {
    v4[2](v4, *((unsigned __int8 *)v17 + 24), v11[5]);
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __74__STContactsServiceClient_isRestrictionsPasscodeSetWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
    a2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)authenticateRestrictionsPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  v8 = [(STContactsServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__STContactsServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC6F68;
  v11[4] = &v12;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v11];

  if (v13[5])
  {
    uint64_t v10 = +[STLog contactsService];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STContactsServiceClient authenticateRestrictionsPasscode:completionHandler:]();
    }

    if (v7) {
      v7[2](v7, v13[5]);
    }
  }
  [v9 authenticateRestrictionsPasscode:v6 completionHandler:v7];

  _Block_object_dispose(&v12, 8);
}

void __78__STContactsServiceClient_authenticateRestrictionsPasscode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  v5 = [(STContactsServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__STContactsServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BC6F68;
  v8[4] = &v9;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v8];

  if (v10[5])
  {
    id v7 = +[STLog contactsService];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STContactsServiceClient restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:]();
    }

    if (v4) {
      (*((void (**)(id, void, void, uint64_t))v4 + 2))(v4, 0, 0, v10[5]);
    }
  }
  else
  {
    [v6 restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:v4];
  }

  _Block_object_dispose(&v9, 8);
}

void __100__STContactsServiceClient_restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
}

- (void)presentRemotePINControllerWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  v5 = [(STContactsServiceClient *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__STContactsServiceClient_presentRemotePINControllerWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BC6F68;
  v8[4] = &v9;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v8];

  if (v10[5])
  {
    id v7 = +[STLog contactsService];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[STContactsServiceClient restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:]();
    }

    if (v4) {
      v4[2](v4, v10[5]);
    }
  }
  else
  {
    [v6 presentRemotePINControllerWithCompletionHandler:v4];
  }

  _Block_object_dispose(&v9, 8);
}

void __75__STContactsServiceClient_presentRemotePINControllerWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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

void __31__STContactsServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "contactsService connection interrupted", v1, 2u);
}

void __31__STContactsServiceClient_init__block_invoke_13_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "contactsService connection invalidated", v1, 2u);
}

- (void)isRestrictionsPasscodeSetWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed checking restrictions passcode with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)authenticateRestrictionsPasscode:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to authenticate passcode with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)restrictionsPasscodeEntryAttemptCountAndTimeoutDateWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch private service proxy with error: %{public}@", v2, v3, v4, v5, v6);
}

@end