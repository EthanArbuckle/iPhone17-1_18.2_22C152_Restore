@interface PODaemonConnection
+ (id)xpcQueue;
- (BOOL)_connectToService;
- (NSXPCConnection)xpcConnection;
- (PODaemonConnection)init;
- (void)addLocalUser:(id)a3 toLocalGroup:(id)a4 completion:(id)a5;
- (void)addPlatformSSOToSearchPolicyWithCompletion:(id)a3;
- (void)bindTokenForUsername:(id)a3 hash:(id)a4 wrapHash:(id)a5 tokenId:(id)a6 passwordContext:(id)a7 completion:(id)a8;
- (void)changePasswordForUser:(id)a3 passwordContext:(id)a4 secureToken:(id)a5 secureTokenPasswordContext:(id)a6 completion:(id)a7;
- (void)changePasswordUsingBootstrapTokenForUser:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)createAppSSOCachePathWithCompletion:(id)a3;
- (void)createOrUpdateAdminGroups:(id)a3 authorizationGroups:(id)a4 previousAuthorizationGroups:(id)a5 otherGroups:(id)a6 completion:(id)a7;
- (void)createOrUpdateUser:(id)a3 completion:(id)a4;
- (void)createPlatformSSOAdminGroupWithCompletion:(id)a3;
- (void)createUser:(id)a3 passwordContext:(id)a4 name:(id)a5 loginUserName:(id)a6 idpIdentifier:(id)a7 isAdmin:(BOOL)a8 groupMembership:(id)a9 completion:(id)a10;
- (void)dealloc;
- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)disablePlatformSSORules:(id)a3;
- (void)enablePlatformSSORules:(id)a3;
- (void)findUserWithName:(id)a3 completion:(id)a4;
- (void)getAllUsersWithCompletion:(id)a3;
- (void)init;
- (void)loginConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)migrateConfiguration:(BOOL)a3 completion:(id)a4;
- (void)removeDeviceConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)removeLocalUser:(id)a3 fromLocalGroup:(id)a4 completion:(id)a5;
- (void)removeLoginConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)removePlatformSSOAdminGroupWithCompletion:(id)a3;
- (void)removePlatformSSOFromSearchPolicyWithCompletion:(id)a3;
- (void)removePlatformSSOUser:(id)a3 completion:(id)a4;
- (void)removeUserConfigurationForIdentifier:(id)a3 completion:(id)a4;
- (void)removeUserWithName:(id)a3 completion:(id)a4;
- (void)resetStoredConfigurationWithCompletion:(id)a3;
- (void)retrievePendingSSOTokenForIdentifer:(id)a3 completion:(id)a4;
- (void)retrieveStashedDecryptionContextForIdentifer:(id)a3 completion:(id)a4;
- (void)retrieveStashedSSOTokenForIdentifer:(id)a3 completion:(id)a4;
- (void)saveAppSSOConfiguration:(id)a3 completion:(id)a4;
- (void)saveCachedContextsToDiskWithCompletion:(id)a3;
- (void)saveDeviceConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveDeviceConfigurationSyncAllConfigToPreboot:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveLoginConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)savePendingSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)savePlatformSSOUniqueIdentifier:(id)a3 forUser:(id)a4 completion:(id)a5;
- (void)saveStashedDecryptionContext:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveStashedSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveUserConfiguration:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6;
- (void)saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6;
- (void)setGroups:(id)a3 forLocalUser:(id)a4 completion:(id)a5;
- (void)setGroups:(id)a3 forPlatformSSOUser:(id)a4 completion:(id)a5;
- (void)setXpcConnection:(id)a3;
- (void)unbindTokenForAllUsersWithCompletion:(id)a3;
- (void)unbindTokenForUsername:(id)a3 hash:(id)a4 completion:(id)a5;
- (void)updateLoginStateForIdentifier:(id)a3 state:(id)a4 loginDate:(id)a5 loginType:(id)a6 completion:(id)a7;
- (void)useVolume:(id)a3 completion:(id)a4;
- (void)userConfigurationForIdentifier:(id)a3 completion:(id)a4;
- (void)userLoginStateForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PODaemonConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_1 != -1) {
    dispatch_once(&xpcQueue_onceToken_1, &__block_literal_global_6);
  }
  v2 = (void *)xpcQueue_queue_1;

  return v2;
}

uint64_t __30__PODaemonConnection_xpcQueue__block_invoke()
{
  xpcQueue_queue_1 = (uint64_t)dispatch_queue_create("com.apple.PlatformPSSO.daemon-queue", 0);

  return MEMORY[0x270F9A758]();
}

- (PODaemonConnection)init
{
  v3 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonConnection init]();
  }

  v7.receiver = self;
  v7.super_class = (Class)PODaemonConnection;
  v4 = [(PODaemonConnection *)&v7 init];
  v5 = v4;
  if (v4) {
    [(PODaemonConnection *)v4 _connectToService];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__PODaemonConnection_deviceConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 deviceConfigurationForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __65__PODaemonConnection_deviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__PODaemonConnection_loginConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 loginConfigurationForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __64__PODaemonConnection_loginConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removeDeviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__PODaemonConnection_removeDeviceConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 removeDeviceConfigurationForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __71__PODaemonConnection_removeDeviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removeLoginConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__PODaemonConnection_removeLoginConfigurationForIdentifer_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 removeLoginConfigurationForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __70__PODaemonConnection_removeLoginConfigurationForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removeUserConfigurationForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__PODaemonConnection_removeUserConfigurationForIdentifier_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 removeUserConfigurationForIdentifier:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __70__PODaemonConnection_removeUserConfigurationForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveDeviceConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__PODaemonConnection_saveDeviceConfiguration_identifer_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveDeviceConfiguration:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __67__PODaemonConnection_saveDeviceConfiguration_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveDeviceConfigurationSyncAllConfigToPreboot:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __89__PODaemonConnection_saveDeviceConfigurationSyncAllConfigToPreboot_identifer_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveDeviceConfigurationSyncAllConfigToPreboot:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __89__PODaemonConnection_saveDeviceConfigurationSyncAllConfigToPreboot_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveLoginConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __66__PODaemonConnection_saveLoginConfiguration_identifer_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveLoginConfiguration:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __66__PODaemonConnection_saveLoginConfiguration_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveUserConfiguration:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v13 = [(PODaemonConnection *)self xpcConnection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __83__PODaemonConnection_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke;
    v17[3] = &unk_264BBECD0;
    id v14 = v12;
    id v18 = v14;
    v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v17];
    [v15 saveUserConfiguration:v10 forIdentifier:v11 syncToPreboot:v7 completion:v14];
  }
  else if (v12)
  {
    id v16 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v16);
  }
}

void __83__PODaemonConnection_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v13 = [(PODaemonConnection *)self xpcConnection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __87__PODaemonConnection_saveUserConfigurationData_forIdentifier_syncToPreboot_completion___block_invoke;
    v17[3] = &unk_264BBECD0;
    id v14 = v12;
    id v18 = v14;
    v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v17];
    [v15 saveUserConfigurationData:v10 forIdentifier:v11 syncToPreboot:v7 completion:v14];
  }
  else if (v12)
  {
    id v16 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v16);
  }
}

void __87__PODaemonConnection_saveUserConfigurationData_forIdentifier_syncToPreboot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__PODaemonConnection_userConfigurationForIdentifier_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 userConfigurationForIdentifier:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __64__PODaemonConnection_userConfigurationForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__PODaemonConnection_userLoginStateForIdentifier_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 userLoginStateForIdentifier:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __61__PODaemonConnection_userLoginStateForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    v17 = [(PODaemonConnection *)self xpcConnection];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __89__PODaemonConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke;
    v21[3] = &unk_264BBECD0;
    id v18 = v16;
    id v22 = v18;
    v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v19 updateLoginStateForIdentifier:v12 state:v13 loginDate:v14 loginType:v15 completion:v18];
  }
  else if (v16)
  {
    v20 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v20);
  }
}

void __89__PODaemonConnection_updateLoginStateForIdentifier_state_loginDate_loginType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__PODaemonConnection_savePendingSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 savePendingSSOTokens:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __64__PODaemonConnection_savePendingSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__PODaemonConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 retrievePendingSSOTokenForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __69__PODaemonConnection_retrievePendingSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__PODaemonConnection_saveStashedSSOTokens_identifer_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveStashedSSOTokens:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __64__PODaemonConnection_saveStashedSSOTokens_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__PODaemonConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 retrieveStashedSSOTokenForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __69__PODaemonConnection_retrieveStashedSSOTokenForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__PODaemonConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 retrieveStashedDecryptionContextForIdentifer:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __78__PODaemonConnection_retrieveStashedDecryptionContextForIdentifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__PODaemonConnection_useVolume_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 useVolume:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __43__PODaemonConnection_useVolume_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveCachedContextsToDiskWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__PODaemonConnection_saveCachedContextsToDiskWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 saveCachedContextsToDiskWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __61__PODaemonConnection_saveCachedContextsToDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)resetStoredConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__PODaemonConnection_resetStoredConfigurationWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 resetStoredConfigurationWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __61__PODaemonConnection_resetStoredConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)disablePlatformSSORules:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__PODaemonConnection_disablePlatformSSORules___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 disablePlatformSSORules:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __46__PODaemonConnection_disablePlatformSSORules___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)enablePlatformSSORules:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__PODaemonConnection_enablePlatformSSORules___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 enablePlatformSSORules:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __45__PODaemonConnection_enablePlatformSSORules___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)migrateConfiguration:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v7 = [(PODaemonConnection *)self xpcConnection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__PODaemonConnection_migrateConfiguration_completion___block_invoke;
    v11[3] = &unk_264BBECD0;
    id v8 = v6;
    id v12 = v8;
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
    [v9 migrateConfiguration:v4 completion:v8];
  }
  else if (v6)
  {
    id v10 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __54__PODaemonConnection_migrateConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)savePlatformSSOUniqueIdentifier:(id)a3 forUser:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__PODaemonConnection_savePlatformSSOUniqueIdentifier_forUser_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 savePlatformSSOUniqueIdentifier:v8 forUser:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __73__PODaemonConnection_savePlatformSSOUniqueIdentifier_forUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)bindTokenForUsername:(id)a3 hash:(id)a4 wrapHash:(id)a5 tokenId:(id)a6 passwordContext:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v20 = [(PODaemonConnection *)self xpcConnection];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __92__PODaemonConnection_bindTokenForUsername_hash_wrapHash_tokenId_passwordContext_completion___block_invoke;
    v24[3] = &unk_264BBECD0;
    id v21 = v19;
    id v25 = v21;
    id v22 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v24];
    [v22 bindTokenForUsername:v14 hash:v15 wrapHash:v16 tokenId:v17 passwordContext:v18 completion:v21];
  }
  else if (v19)
  {
    v23 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v23);
  }
}

void __92__PODaemonConnection_bindTokenForUsername_hash_wrapHash_tokenId_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)unbindTokenForUsername:(id)a3 hash:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__PODaemonConnection_unbindTokenForUsername_hash_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 unbindTokenForUsername:v8 hash:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __61__PODaemonConnection_unbindTokenForUsername_hash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)unbindTokenForAllUsersWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__PODaemonConnection_unbindTokenForAllUsersWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 unbindTokenForAllUsersWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __59__PODaemonConnection_unbindTokenForAllUsersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)createUser:(id)a3 passwordContext:(id)a4 name:(id)a5 loginUserName:(id)a6 idpIdentifier:(id)a7 isAdmin:(BOOL)a8 groupMembership:(id)a9 completion:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  if ([(PODaemonConnection *)self _connectToService])
  {
    v27 = [(PODaemonConnection *)self xpcConnection];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __117__PODaemonConnection_createUser_passwordContext_name_loginUserName_idpIdentifier_isAdmin_groupMembership_completion___block_invoke;
    v28[3] = &unk_264BBECD0;
    BOOL v23 = v10;
    id v24 = v22;
    id v29 = v24;
    id v25 = [v27 synchronousRemoteObjectProxyWithErrorHandler:v28];
    [v25 createUser:v16 passwordContext:v17 name:v18 loginUserName:v19 idpIdentifier:v20 isAdmin:v23 groupMembership:v21 completion:v24];
  }
  else if (v22)
  {
    v26 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v26);
  }
}

void __117__PODaemonConnection_createUser_passwordContext_name_loginUserName_idpIdentifier_isAdmin_groupMembership_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

- (void)changePasswordForUser:(id)a3 passwordContext:(id)a4 secureToken:(id)a5 secureTokenPasswordContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v17 = [(PODaemonConnection *)self xpcConnection];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __110__PODaemonConnection_changePasswordForUser_passwordContext_secureToken_secureTokenPasswordContext_completion___block_invoke;
    v21[3] = &unk_264BBECD0;
    id v18 = v16;
    id v22 = v18;
    id v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v19 changePasswordForUser:v12 passwordContext:v13 secureToken:v14 secureTokenPasswordContext:v15 completion:v18];
  }
  else if (v16)
  {
    id v20 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v20);
  }
}

void __110__PODaemonConnection_changePasswordForUser_passwordContext_secureToken_secureTokenPasswordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)changePasswordUsingBootstrapTokenForUser:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __90__PODaemonConnection_changePasswordUsingBootstrapTokenForUser_passwordContext_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 changePasswordUsingBootstrapTokenForUser:v8 passwordContext:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __90__PODaemonConnection_changePasswordUsingBootstrapTokenForUser_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)createPlatformSSOAdminGroupWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__PODaemonConnection_createPlatformSSOAdminGroupWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 createPlatformSSOAdminGroupWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __64__PODaemonConnection_createPlatformSSOAdminGroupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removePlatformSSOAdminGroupWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__PODaemonConnection_removePlatformSSOAdminGroupWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 removePlatformSSOAdminGroupWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __64__PODaemonConnection_removePlatformSSOAdminGroupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)addPlatformSSOToSearchPolicyWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__PODaemonConnection_addPlatformSSOToSearchPolicyWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 addPlatformSSOToSearchPolicyWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __65__PODaemonConnection_addPlatformSSOToSearchPolicyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removePlatformSSOFromSearchPolicyWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__PODaemonConnection_removePlatformSSOFromSearchPolicyWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 removePlatformSSOFromSearchPolicyWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __70__PODaemonConnection_removePlatformSSOFromSearchPolicyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)createOrUpdateAdminGroups:(id)a3 authorizationGroups:(id)a4 previousAuthorizationGroups:(id)a5 otherGroups:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v17 = [(PODaemonConnection *)self xpcConnection];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __119__PODaemonConnection_createOrUpdateAdminGroups_authorizationGroups_previousAuthorizationGroups_otherGroups_completion___block_invoke;
    v21[3] = &unk_264BBECD0;
    id v18 = v16;
    id v22 = v18;
    id v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v19 createOrUpdateAdminGroups:v12 authorizationGroups:v13 previousAuthorizationGroups:v14 otherGroups:v15 completion:v18];
  }
  else if (v16)
  {
    id v20 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v20);
  }
}

void __119__PODaemonConnection_createOrUpdateAdminGroups_authorizationGroups_previousAuthorizationGroups_otherGroups_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removePlatformSSOUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__PODaemonConnection_removePlatformSSOUser_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 removePlatformSSOUser:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __55__PODaemonConnection_removePlatformSSOUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setGroups:(id)a3 forLocalUser:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __56__PODaemonConnection_setGroups_forLocalUser_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 setGroups:v8 forLocalUser:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __56__PODaemonConnection_setGroups_forLocalUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setGroups:(id)a3 forPlatformSSOUser:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__PODaemonConnection_setGroups_forPlatformSSOUser_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 setGroups:v8 forPlatformSSOUser:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __62__PODaemonConnection_setGroups_forPlatformSSOUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)getAllUsersWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__PODaemonConnection_getAllUsersWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 getAllUsersWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __48__PODaemonConnection_getAllUsersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)findUserWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__PODaemonConnection_findUserWithName_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 findUserWithName:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __50__PODaemonConnection_findUserWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)createOrUpdateUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__PODaemonConnection_createOrUpdateUser_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 createOrUpdateUser:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __52__PODaemonConnection_createOrUpdateUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removeUserWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__PODaemonConnection_removeUserWithName_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 removeUserWithName:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __52__PODaemonConnection_removeUserWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)addLocalUser:(id)a3 toLocalGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__PODaemonConnection_addLocalUser_toLocalGroup_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 addLocalUser:v8 toLocalGroup:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __59__PODaemonConnection_addLocalUser_toLocalGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)removeLocalUser:(id)a3 fromLocalGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__PODaemonConnection_removeLocalUser_fromLocalGroup_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 removeLocalUser:v8 fromLocalGroup:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __64__PODaemonConnection_removeLocalUser_fromLocalGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)saveAppSSOConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v8 = [(PODaemonConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __57__PODaemonConnection_saveAppSSOConfiguration_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 saveAppSSOConfiguration:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __57__PODaemonConnection_saveAppSSOConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
  if ([(PODaemonConnection *)self _connectToService])
  {
    id v11 = [(PODaemonConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__PODaemonConnection_saveStashedDecryptionContext_identifer_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveStashedDecryptionContext:v8 identifer:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __72__PODaemonConnection_saveStashedDecryptionContext_identifer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)createAppSSOCachePathWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PODaemonConnection *)self _connectToService])
  {
    uint64_t v5 = [(PODaemonConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__PODaemonConnection_createAppSSOCachePathWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 createAppSSOCachePathWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO daemon"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __58__PODaemonConnection_createAppSSOCachePathWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
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
    id v3 = PO_LOG_PODaemonConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

LABEL_9:
    BOOL v10 = 1;
    goto LABEL_10;
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.PlatformSSO.daemon-xpc" options:4096];
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = (NSXPCConnection *)v4;

  if (v2->_xpcConnection)
  {
    id v6 = [MEMORY[0x263F5E618] interfaceWithInternalProtocol:&unk_26E5DB168];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v6];

    objc_initWeak(&location, v2);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__PODaemonConnection__connectToService__block_invoke;
    v15[3] = &unk_264BBECF8;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:v15];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __39__PODaemonConnection__connectToService__block_invoke_98;
    v13[3] = &unk_264BBECF8;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:v13];
    id v7 = v2->_xpcConnection;
    id v8 = +[PODaemonConnection xpcQueue];
    [(NSXPCConnection *)v7 _setQueue:v8];

    [(NSXPCConnection *)v2->_xpcConnection resume];
    id v9 = PO_LOG_PODaemonConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  id v12 = PO_LOG_PODaemonConnection();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[POServiceConnection _connectToService]();
  }

  BOOL v10 = 0;
LABEL_10:
  objc_sync_exit(v2);

  return v10;
}

void __39__PODaemonConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    id v3 = PO_LOG_PODaemonConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__POServiceConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __39__PODaemonConnection__connectToService__block_invoke_98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = PO_LOG_PODaemonConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__POServiceConnection__connectToService__block_invoke_80_cold_1();
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

@end