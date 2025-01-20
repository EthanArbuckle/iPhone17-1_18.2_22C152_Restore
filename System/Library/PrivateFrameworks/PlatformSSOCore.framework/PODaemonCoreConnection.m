@interface PODaemonCoreConnection
+ (id)xpcQueue;
- (BOOL)_connectToService;
- (NSString)volume;
- (NSXPCConnection)xpcConnection;
- (PODaemonCoreConnection)initWithVolume:(id)a3;
- (void)_connectToService;
- (void)dealloc;
- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)insertTokenForUserName:(id)a3 completion:(id)a4;
- (void)loginConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)retrievePendingSSOTokenForIdentifer:(id)a3 completion:(id)a4;
- (void)retrieveStashedDecryptionContextForIdentifer:(id)a3 completion:(id)a4;
- (void)retrieveStashedSSOTokenForIdentifer:(id)a3 completion:(id)a4;
- (void)saveCachedContextsToDiskWithCompletion:(id)a3;
- (void)savePendingSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveStashedDecryptionContext:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveStashedSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)setVolume:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)updateLoginStateForIdentifier:(id)a3 state:(id)a4 loginDate:(id)a5 loginType:(id)a6 completion:(id)a7;
- (void)useVolume:(id)a3 completion:(id)a4;
- (void)userConfigurationForIdentifier:(id)a3 completion:(id)a4;
- (void)userLoginStateForIdentifier:(id)a3 completion:(id)a4;
- (void)verifyTokenForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5;
@end

@implementation PODaemonCoreConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken != -1) {
    dispatch_once(&xpcQueue_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)xpcQueue_queue;
  return v2;
}

uint64_t __34__PODaemonCoreConnection_xpcQueue__block_invoke()
{
  xpcQueue_queue = (uint64_t)dispatch_queue_create("com.apple.PlatformPSSO.daemon-queue", 0);
  return MEMORY[0x270F9A758]();
}

- (PODaemonCoreConnection)initWithVolume:(id)a3
{
  id v5 = a3;
  v6 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreConnection initWithVolume:]();
  }

  v10.receiver = self;
  v10.super_class = (Class)PODaemonCoreConnection;
  v7 = [(PODaemonCoreConnection *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_volume, a3);
    [(PODaemonCoreConnection *)v8 _connectToService];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_259DFE000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    objc_super v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 deviceConfigurationForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)loginConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__PODaemonCoreConnection_loginConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    objc_super v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 loginConfigurationForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __68__PODaemonCoreConnection_loginConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)userConfigurationForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__PODaemonCoreConnection_userConfigurationForIdentifier_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    objc_super v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 userConfigurationForIdentifier:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __68__PODaemonCoreConnection_userConfigurationForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)userLoginStateForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__PODaemonCoreConnection_userLoginStateForIdentifier_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    objc_super v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 userLoginStateForIdentifier:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __65__PODaemonCoreConnection_userLoginStateForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)updateLoginStateForIdentifier:(id)a3 state:(id)a4 loginDate:(id)a5 loginType:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v17 = [(PODaemonCoreConnection *)self xpcConnection];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __93__PODaemonCoreConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke;
    v21[3] = &unk_265464030;
    id v18 = v16;
    id v22 = v18;
    v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v19 updateLoginStateForIdentifier:v12 state:v13 loginDate:v14 loginType:v15 completion:v18];
  }
  else if (v16)
  {
    v20 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v20);
  }
}

void __93__PODaemonCoreConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)savePendingSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v11 = [(PODaemonCoreConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__PODaemonCoreConnection_savePendingSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_265464030;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 savePendingSSOTokens:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __68__PODaemonCoreConnection_savePendingSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)retrievePendingSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    id v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__PODaemonCoreConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 retrievePendingSSOTokenForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __73__PODaemonCoreConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveStashedSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v11 = [(PODaemonCoreConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__PODaemonCoreConnection_saveStashedSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_265464030;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveStashedSSOTokens:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __68__PODaemonCoreConnection_saveStashedSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)retrieveStashedSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    id v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__PODaemonCoreConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 retrieveStashedSSOTokenForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __73__PODaemonCoreConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveStashedDecryptionContext:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v11 = [(PODaemonCoreConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__PODaemonCoreConnection_saveStashedDecryptionContext_identifer_completion___block_invoke;
    v15[3] = &unk_265464030;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveStashedDecryptionContext:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __76__PODaemonCoreConnection_saveStashedDecryptionContext_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)retrieveStashedDecryptionContextForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    id v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__PODaemonCoreConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 retrieveStashedDecryptionContextForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __82__PODaemonCoreConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveCachedContextsToDiskWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonCoreConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__PODaemonCoreConnection_saveCachedContextsToDiskWithCompletion___block_invoke;
    v9[3] = &unk_265464030;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 saveCachedContextsToDiskWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __65__PODaemonCoreConnection_saveCachedContextsToDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)insertTokenForUserName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    id v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__PODaemonCoreConnection_insertTokenForUserName_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 insertTokenForUserName:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

void __60__PODaemonCoreConnection_insertTokenForUserName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)verifyTokenForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    v11 = [(PODaemonCoreConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__PODaemonCoreConnection_verifyTokenForUserName_passwordContext_completion___block_invoke;
    v15[3] = &unk_265464030;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 verifyTokenForUserName:v8 passwordContext:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __76__PODaemonCoreConnection_verifyTokenForUserName_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)useVolume:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonCoreConnection *)self _connectToService])
  {
    id v8 = [(PODaemonCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__PODaemonCoreConnection_useVolume_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 useVolume:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __47__PODaemonCoreConnection_useVolume_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (BOOL)_connectToService
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_xpcConnection)
  {
    id v3 = PO_LOG_PODaemonCoreConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreConnection _connectToService]();
    }

LABEL_11:
    BOOL v17 = 1;
    goto LABEL_12;
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.PlatformSSO.daemon-xpc" options:4096];
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = (NSXPCConnection *)v4;

  if (v2->_xpcConnection)
  {
    id v6 = +[POInternalProtocols interfaceWithInternalProtocol:&unk_2707DEC88];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v6];

    id v7 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    [v7 setClass:objc_opt_class() forSelector:sel_userLoginStateForIdentifier_completion_ argumentIndex:0 ofReply:1];

    id v8 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    [v8 setClass:objc_opt_class() forSelector:sel_updateLoginStateForIdentifier_state_loginDate_loginType_completion_ argumentIndex:1 ofReply:0];

    id v9 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    [v9 setClass:objc_opt_class() forSelector:sel_updateLoginStateForIdentifier_state_loginDate_loginType_completion_ argumentIndex:3 ofReply:0];

    id v10 = [(NSXPCConnection *)v2->_xpcConnection remoteObjectInterface];
    [v10 setClass:objc_opt_class() forSelector:sel_updateLoginStateForIdentifier_state_loginDate_loginType_completion_ argumentIndex:2 ofReply:0];

    objc_initWeak(&location, v2);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __43__PODaemonCoreConnection__connectToService__block_invoke;
    v23[3] = &unk_265464058;
    objc_copyWeak(&v24, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:v23];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __43__PODaemonCoreConnection__connectToService__block_invoke_88;
    v21[3] = &unk_265464058;
    objc_copyWeak(&v22, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:v21];
    v11 = v2->_xpcConnection;
    id v12 = +[PODaemonCoreConnection xpcQueue];
    [(NSXPCConnection *)v11 _setQueue:v12];

    [(NSXPCConnection *)v2->_xpcConnection resume];
    id v13 = PO_LOG_PODaemonCoreConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreConnection _connectToService]();
    }

    if (v2->_volume)
    {
      id v14 = [(PODaemonCoreConnection *)v2 xpcConnection];
      id v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_92];
      volume = v2->_volume;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __43__PODaemonCoreConnection__connectToService__block_invoke_93;
      v20[3] = &unk_2654640A0;
      v20[4] = v2;
      [v15 useVolume:volume completion:v20];
    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  v19 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[PODaemonCoreConnection _connectToService]();
  }

  BOOL v17 = 0;
LABEL_12:
  objc_sync_exit(v2);

  return v17;
}

void __43__PODaemonCoreConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    id v3 = PO_LOG_PODaemonCoreConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43__PODaemonCoreConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = PO_LOG_PODaemonCoreConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __43__PODaemonCoreConnection__connectToService__block_invoke_88_cold_1();
    }
  }
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_90(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_93(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = PO_LOG_PODaemonCoreConnection();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_259DFE000, v2, OS_LOG_TYPE_INFO, "%{public}@: volume UUID set", (uint8_t *)&v4, 0xCu);
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)volume
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVolume:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithVolume:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_259DFE000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

void __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259DFE000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_connectToService
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
}

void __43__PODaemonCoreConnection__connectToService__block_invoke_88_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_259DFE000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
}

@end