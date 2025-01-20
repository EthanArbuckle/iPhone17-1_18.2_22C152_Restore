@interface STSettingsServiceClient
- (BOOL)isCloudSyncEnabled:(id *)a3;
- (BOOL)isRestrictAdultContentEnabled:(id *)a3;
- (BOOL)requestLegacyUsageForUser:(id)a3 withError:(id *)a4;
- (BOOL)updateLegacyUsageWithError:(id *)a3;
- (NSXPCConnection)connection;
- (STSettingsServiceClient)init;
- (id)startCoreDataServerWithError:(id *)a3;
- (void)dealloc;
- (void)processSettingsChangesSinceHistoryToken:(id)a3 withCompletion:(id)a4;
- (void)setCloudSync:(BOOL)a3 withCompletion:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation STSettingsServiceClient

- (STSettingsServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSettingsServiceClient;
  v2 = [(STSettingsServiceClient *)&v6 init];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4EC8];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.settings" options:4096];
  [v4 setRemoteObjectInterface:v3];
  [v4 setInterruptionHandler:&__block_literal_global_13];
  [v4 setInvalidationHandler:&__block_literal_global_20];
  [v4 activate];
  [(STSettingsServiceClient *)v2 setConnection:v4];

  return v2;
}

void __31__STSettingsServiceClient_init__block_invoke()
{
  v0 = +[STLog settingsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __31__STSettingsServiceClient_init__block_invoke_cold_1(v0);
  }
}

void __31__STSettingsServiceClient_init__block_invoke_18()
{
  v0 = +[STLog settingsService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __31__STSettingsServiceClient_init__block_invoke_18_cold_1(v0);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)STSettingsServiceClient;
  [(STSettingsServiceClient *)&v4 dealloc];
}

- (id)startCoreDataServerWithError:(id *)a3
{
  v5 = _os_activity_create(&dword_1DA519000, "STSettingsServiceClient.startCoreDataServer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  objc_super v6 = [(STSettingsServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke;
  v12[3] = &unk_1E6BC6F68;
  v12[4] = &v13;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_24;
  v11[3] = &unk_1E6BC7A58;
  v11[4] = &v19;
  v11[5] = &v13;
  [v7 startCoreDataServerWithCompletionHandler:v11];
  if (a3)
  {
    v8 = (void *)v14[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  os_activity_scope_leave(&state);
  return v9;
}

void __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog settingsService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    v8 = +[STLog settingsService];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_24_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)processSettingsChangesSinceHistoryToken:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1DA519000, "STSettingsServiceClient.processSettingsChangesSinceHistoryToken", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = [(STSettingsServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__STSettingsServiceClient_processSettingsChangesSinceHistoryToken_withCompletion___block_invoke;
  v12[3] = &unk_1E6BC7058;
  id v10 = v7;
  id v13 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v12];

  [v11 processSettingsChangesSinceHistoryToken:v6 completionHandler:v10];
  os_activity_scope_leave(&state);
}

void __82__STSettingsServiceClient_processSettingsChangesSinceHistoryToken_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog settingsService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (BOOL)updateLegacyUsageWithError:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_1DA519000, "STSettingsServiceClient.updateLegacyUsage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  id v6 = [(STSettingsServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke;
  v12[3] = &unk_1E6BC7560;
  void v12[4] = &v13;
  void v12[5] = &v19;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_26;
  v11[3] = &unk_1E6BC6F90;
  v11[4] = &v13;
  v11[5] = &v19;
  [v7 updateLegacyUsageWithCompletionHandler:v11];
  if (a3)
  {
    v8 = (void *)v14[5];
    if (v8) {
      *a3 = v8;
    }
  }
  char v9 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog settingsService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_26(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = +[STLog settingsService];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_26_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)requestLegacyUsageForUser:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DA519000, "STSettingsServiceClient.updateLegacyUsage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__10;
  uint64_t v19 = __Block_byref_object_dispose__10;
  id v20 = 0;
  v8 = [(STSettingsServiceClient *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke;
  v14[3] = &unk_1E6BC7560;
  v14[4] = &v15;
  v14[5] = &v21;
  char v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke_28;
  v13[3] = &unk_1E6BC6F90;
  v13[4] = &v15;
  v13[5] = &v21;
  [v9 requestLegacyUsageForUser:v6 withCompletionHandler:v13];
  if (a4)
  {
    id v10 = (void *)v16[5];
    if (v10) {
      *a4 = v10;
    }
  }
  char v11 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = +[STLog settingsService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __63__STSettingsServiceClient_requestLegacyUsageForUser_withError___block_invoke_28(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = +[STLog settingsService];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_26_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)setCloudSync:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 1;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__10;
  v10[4] = __Block_byref_object_dispose__10;
  id v11 = 0;
  id v7 = [(STSettingsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__STSettingsServiceClient_setCloudSync_withCompletion___block_invoke;
  v9[3] = &unk_1E6BC7560;
  v9[4] = v10;
  v9[5] = v12;
  v8 = [v7 remoteObjectProxyWithErrorHandler:v9];

  [v8 setCloudSync:v4 withCompletion:v6];
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(v12, 8);
}

void __55__STSettingsServiceClient_setCloudSync_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[STLog settingsService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

- (BOOL)isCloudSyncEnabled:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  uint64_t v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  BOOL v4 = [(STSettingsServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke;
  v10[3] = &unk_1E6BC7560;
  v10[4] = &v11;
  void v10[5] = &v17;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke_29;
  v9[3] = &unk_1E6BC6F90;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 isCloudSyncEnabled:v9];
  if (a3)
  {
    id v6 = (void *)v12[5];
    if (v6) {
      *a3 = v6;
    }
  }
  char v7 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[STLog settingsService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __46__STSettingsServiceClient_isCloudSyncEnabled___block_invoke_29(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)isRestrictAdultContentEnabled:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  uint64_t v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  BOOL v4 = [(STSettingsServiceClient *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke;
  v10[3] = &unk_1E6BC7560;
  v10[4] = &v11;
  void v10[5] = &v17;
  uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke_30;
  v9[3] = &unk_1E6BC6F90;
  v9[4] = &v11;
  v9[5] = &v17;
  [v5 isRestrictAdultContentEnabled:v9];
  if (a3)
  {
    id v6 = (void *)v12[5];
    if (v6) {
      *a3 = v6;
    }
  }
  char v7 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[STLog settingsService];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__STAskServiceClient_sendAskForTimeRequest_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __57__STSettingsServiceClient_isRestrictAdultContentEnabled___block_invoke_30(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
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

void __31__STSettingsServiceClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "settingsService connection interrupted", v1, 2u);
}

void __31__STSettingsServiceClient_init__block_invoke_18_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "settingsService connection invalidated", v1, 2u);
}

void __56__STSettingsServiceClient_startCoreDataServerWithError___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Error starting core data server : %{public}@", v2, v3, v4, v5, v6);
}

void __54__STSettingsServiceClient_updateLegacyUsageWithError___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Error processing changes : %{public}@", v2, v3, v4, v5, v6);
}

@end