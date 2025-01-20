@interface STDiagnosticsServiceClient
- (BOOL)postNotificationWithContext:(id)a3 error:(id *)a4;
- (BOOL)postWeeklyReportNotification:(id *)a3;
- (BOOL)removeNotificationWithContext:(id)a3 error:(id *)a4;
- (BOOL)repairBlueprintsWithError:(id *)a3;
- (BOOL)sendBlueprintChangesWithError:(id *)a3;
- (BOOL)sendBlueprintsWithError:(id *)a3;
- (BOOL)sendCheckInRequestOnV2WithError:(id *)a3;
- (BOOL)sendCheckInRequestWithError:(id *)a3;
- (BOOL)sendSettingsChangesWithError:(id *)a3;
- (BOOL)sendSettingsWithError:(id *)a3;
- (BOOL)sendUserDeviceStateWithError:(id *)a3;
- (BOOL)setLocalConfigurationVersion:(id)a3 error:(id *)a4;
- (NSXPCConnection)connection;
- (STDiagnosticsServiceClient)init;
- (STDiagnosticsServiceProtocol)remoteObject;
- (id)configurationVersionWithError:(id *)a3;
- (id)inboundMessageCallback;
- (id)localConfigurationVersionWithError:(id *)a3;
- (id)outboundMessageCallback;
- (void)didReceiveInboundMessage:(id)a3;
- (void)didReceiveOutboundMessage:(id)a3;
- (void)killScreenTimeAgent:(id)a3 completionHandler:(id)a4;
- (void)registerCallback:(id)a3 forInboundMessagesFromIDSInterfaces:(int64_t)a4;
- (void)registerCallback:(id)a3 forOutboundMessagesFromIDSInterfaces:(int64_t)a4;
- (void)setConnection:(id)a3;
- (void)setInboundMessageCallback:(id)a3;
- (void)setOutboundMessageCallback:(id)a3;
- (void)setRemoteObject:(id)a3;
@end

@implementation STDiagnosticsServiceClient

- (STDiagnosticsServiceClient)init
{
  v20.receiver = self;
  v20.super_class = (Class)STDiagnosticsServiceClient;
  v2 = [(STDiagnosticsServiceClient *)&v20 init];
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.command-line-tool" options:4096];
  connection = v2->_connection;
  v2->_connection = (NSXPCConnection *)v3;

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B4DA8];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  [v5 setClasses:v9 forSelector:sel_didReceiveInboundMessage_ argumentIndex:0 ofReply:0];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  [v5 setClasses:v13 forSelector:sel_didReceiveOutboundMessage_ argumentIndex:0 ofReply:0];

  [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];
  [(NSXPCConnection *)v2->_connection setExportedInterface:v5];
  [(NSXPCConnection *)v2->_connection setExportedObject:v2];
  uint64_t v14 = [(NSXPCConnection *)v2->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_4];
  remoteObject = v2->_remoteObject;
  v2->_remoteObject = (STDiagnosticsServiceProtocol *)v14;

  [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_40];
  [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_43];
  if (v2->_remoteObject)
  {
    [(NSXPCConnection *)v2->_connection resume];

LABEL_4:
    v16 = v2;
    goto LABEL_8;
  }
  v17 = +[STLog test];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA519000, v17, OS_LOG_TYPE_DEFAULT, "Failed to connect to ScreenTimeAgent", buf, 2u);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

void __34__STDiagnosticsServiceClient_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[STLog test];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1DA519000, v3, OS_LOG_TYPE_DEFAULT, "Failed to connect to ScreenTimeAgent: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __34__STDiagnosticsServiceClient_init__block_invoke_37()
{
  v0 = +[STLog test];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEFAULT, "ScreenTimeAgent connection interrupted", v1, 2u);
  }
}

void __34__STDiagnosticsServiceClient_init__block_invoke_41()
{
  v0 = +[STLog test];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEFAULT, "ScreenTimeAgent connection invalidated", v1, 2u);
  }
}

- (void)registerCallback:(id)a3 forInboundMessagesFromIDSInterfaces:(int64_t)a4
{
  id v7 = a3;
  if (v7) {
    [(STDiagnosticsServiceClient *)self setInboundMessageCallback:v7];
  }
  if ((unint64_t)a4 <= 1)
  {
    uint64_t v6 = [(STDiagnosticsServiceClient *)self remoteObject];
    [v6 registerForInboundMessages];
  }
  MEMORY[0x1F41817F8]();
}

- (void)registerCallback:(id)a3 forOutboundMessagesFromIDSInterfaces:(int64_t)a4
{
  id v7 = a3;
  if (v7) {
    [(STDiagnosticsServiceClient *)self setOutboundMessageCallback:v7];
  }
  if ((unint64_t)a4 <= 1)
  {
    uint64_t v6 = [(STDiagnosticsServiceClient *)self remoteObject];
    [v6 registerForOutboundMessages];
  }
  MEMORY[0x1F41817F8]();
}

- (void)didReceiveInboundMessage:(id)a3
{
  id v6 = a3;
  int v4 = [(STDiagnosticsServiceClient *)self inboundMessageCallback];

  if (v4)
  {
    id v5 = [(STDiagnosticsServiceClient *)self inboundMessageCallback];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)didReceiveOutboundMessage:(id)a3
{
  id v6 = a3;
  int v4 = [(STDiagnosticsServiceClient *)self outboundMessageCallback];

  if (v4)
  {
    id v5 = [(STDiagnosticsServiceClient *)self outboundMessageCallback];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)localConfigurationVersionWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  objc_super v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  int v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke_2;
  v8[3] = &unk_1E6BC7538;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 localConfigurationVersionWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  id v6 = (id)v17[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __65__STDiagnosticsServiceClient_localConfigurationVersionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (BOOL)setLocalConfigurationVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v7 = [(STDiagnosticsServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke;
  v12[3] = &unk_1E6BC7560;
  v12[4] = &v13;
  v12[5] = &v19;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke_2;
  v11[3] = &unk_1E6BC7560;
  v11[4] = &v13;
  v11[5] = &v19;
  [v8 setLocalConfigurationVersion:v6 completionHandler:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  char v9 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __65__STDiagnosticsServiceClient_setLocalConfigurationVersion_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (id)configurationVersionWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  objc_super v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke_2;
  v8[3] = &unk_1E6BC7538;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 configurationVersionWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  id v6 = (id)v17[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __60__STDiagnosticsServiceClient_configurationVersionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (BOOL)repairBlueprintsWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 repairBlueprintsWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __56__STDiagnosticsServiceClient_repairBlueprintsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendCheckInRequestWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 sendCheckInRequestWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __58__STDiagnosticsServiceClient_sendCheckInRequestWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendCheckInRequestOnV2WithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 sendCheckInRequestOnV2WithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke(uint64_t a1, void *a2)
{
}

void __62__STDiagnosticsServiceClient_sendCheckInRequestOnV2WithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendBlueprintsWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 sendBlueprintsWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __54__STDiagnosticsServiceClient_sendBlueprintsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendBlueprintChangesWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 sendBlueprintChangesWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __60__STDiagnosticsServiceClient_sendBlueprintChangesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendSettingsWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 sendSettingsWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __52__STDiagnosticsServiceClient_sendSettingsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendSettingsChangesWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 sendSettingsChangesWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __59__STDiagnosticsServiceClient_sendSettingsChangesWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)sendUserDeviceStateWithError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke;
  v9[3] = &unk_1E6BC6F68;
  v9[4] = &v10;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 sendUserDeviceStateWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __59__STDiagnosticsServiceClient_sendUserDeviceStateWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)postWeeklyReportNotification:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v4 = [(STDiagnosticsServiceClient *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke;
  v9[3] = &unk_1E6BC7560;
  v9[4] = &v10;
  void v9[5] = &v16;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke_2;
  v8[3] = &unk_1E6BC6F90;
  v8[4] = &v10;
  v8[5] = &v16;
  [v5 postWeeklyReportNotificationWithCompletionHandler:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v6 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __59__STDiagnosticsServiceClient_postWeeklyReportNotification___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)postNotificationWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v7 = [(STDiagnosticsServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke;
  v12[3] = &unk_1E6BC7560;
  v12[4] = &v13;
  v12[5] = &v19;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke_2;
  v11[3] = &unk_1E6BC6F90;
  v11[4] = &v13;
  v11[5] = &v19;
  [v8 postNotificationWithContext:v6 completionHandler:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  char v9 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __64__STDiagnosticsServiceClient_postNotificationWithContext_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)removeNotificationWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v7 = [(STDiagnosticsServiceClient *)self connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke;
  v12[3] = &unk_1E6BC7560;
  v12[4] = &v13;
  v12[5] = &v19;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke_2;
  v11[3] = &unk_1E6BC6F90;
  v11[4] = &v13;
  v11[5] = &v19;
  [v8 removeNotificationWithContext:v6 completionHandler:v11];
  if (a4) {
    *a4 = (id) v14[5];
  }
  char v9 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __66__STDiagnosticsServiceClient_removeNotificationWithContext_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)killScreenTimeAgent:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(STDiagnosticsServiceClient *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__STDiagnosticsServiceClient_killScreenTimeAgent_completionHandler___block_invoke;
  v11[3] = &unk_1E6BC7058;
  id v12 = v6;
  id v9 = v6;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v11];

  [v10 killScreenTimeAgent:v7 completionHandler:v9];
}

void __68__STDiagnosticsServiceClient_killScreenTimeAgent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog screentime];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__STDiagnosticsServiceClient_killScreenTimeAgent_completionHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)inboundMessageCallback
{
  return self->_inboundMessageCallback;
}

- (void)setInboundMessageCallback:(id)a3
{
}

- (id)outboundMessageCallback
{
  return self->_outboundMessageCallback;
}

- (void)setOutboundMessageCallback:(id)a3
{
}

- (STDiagnosticsServiceProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
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
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong(&self->_outboundMessageCallback, 0);
  objc_storeStrong(&self->_inboundMessageCallback, 0);
}

void __68__STDiagnosticsServiceClient_killScreenTimeAgent_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to communicate with ScreenTimeAgent %@", (uint8_t *)&v2, 0xCu);
}

@end