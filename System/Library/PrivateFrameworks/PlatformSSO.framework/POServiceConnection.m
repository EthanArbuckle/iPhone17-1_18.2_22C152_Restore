@interface POServiceConnection
+ (id)xpcQueue;
- (BOOL)_connectToService;
- (BOOL)forLogin;
- (NSXPCConnection)xpcConnection;
- (POServiceConnection)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4;
- (unsigned)uid;
- (void)_connectToService;
- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4 completion:(id)a5;
- (void)createUserAccount:(id)a3 passwordContext:(id)a4 smartCardContext:(id)a5 tokenId:(id)a6 completion:(id)a7;
- (void)dealloc;
- (void)getLoginTypeForUser:(id)a3 completion:(id)a4;
- (void)passwordDidChangeForUsername:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5 completion:(id)a6;
- (void)retainContextForUserName:(id)a3 context:(id)a4 completion:(id)a5;
- (void)saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8 completion:(id)a9;
- (void)setForLogin:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setXpcConnection:(id)a3;
- (void)updateLocalAccountPassword:(id)a3 passwordContextData:(id)a4 completion:(id)a5;
- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5;
@end

@implementation POServiceConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken != -1) {
    dispatch_once(&xpcQueue_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)xpcQueue_queue;

  return v2;
}

uint64_t __31__POServiceConnection_xpcQueue__block_invoke()
{
  xpcQueue_queue = (uint64_t)dispatch_queue_create("com.apple.PlatformPSSO.auth-plugin-queue", 0);

  return MEMORY[0x270F9A758]();
}

- (POServiceConnection)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = [NSNumber numberWithUnsignedInt:v5];
    v12 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 136315906;
    v15 = "-[POServiceConnection initWithUid:forLogin:]";
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 2114;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = self;
    _os_log_debug_impl(&dword_230E51000, v7, OS_LOG_TYPE_DEBUG, "%s userID = %{public}@, login = %{public}@ on %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)POServiceConnection;
  v8 = [(POServiceConnection *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_uid = v5;
    v8->_forLogin = v4;
    [(POServiceConnection *)v8 _connectToService];
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[POServiceConnection dealloc]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_230E51000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)getLoginTypeForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POServiceConnection *)self _connectToService])
  {
    v8 = [(POServiceConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 getLoginTypeForUser:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(POServiceConnection *)self _connectToService])
  {
    id v13 = [(POServiceConnection *)self xpcConnection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __98__POServiceConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke;
    v17[3] = &unk_264BBECD0;
    id v14 = v12;
    id v18 = v14;
    v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v17];
    [v15 performPasswordLogin:v10 passwordContext:v11 updateLocalAccountPassword:v7 completion:v14];
  }
  else if (v12)
  {
    __int16 v16 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, uint64_t, void *))v12 + 2))(v12, 2, v16);
  }
}

void __98__POServiceConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 2, v3);
  }
}

- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(POServiceConnection *)self _connectToService])
  {
    id v11 = [(POServiceConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__POServiceConnection_verifyPasswordLogin_passwordContext_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 verifyPasswordLogin:v8 passwordContext:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v14);
  }
}

void __70__POServiceConnection_verifyPasswordLogin_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 2, v3);
  }
}

- (void)createUserAccount:(id)a3 passwordContext:(id)a4 smartCardContext:(id)a5 tokenId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(POServiceConnection *)self _connectToService])
  {
    v17 = [(POServiceConnection *)self xpcConnection];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __93__POServiceConnection_createUserAccount_passwordContext_smartCardContext_tokenId_completion___block_invoke;
    v21[3] = &unk_264BBECD0;
    id v18 = v16;
    id v22 = v18;
    v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v21];
    [v19 createUserAccount:v12 passwordContext:v13 smartCardContext:v14 tokenId:v15 completion:v18];
  }
  else if (v16)
  {
    __int16 v20 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, uint64_t, void, void *))v16 + 2))(v16, 2, 0, v20);
  }
}

void __93__POServiceConnection_createUserAccount_passwordContext_smartCardContext_tokenId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void, id))(v5 + 16))(v5, 2, 0, v3);
  }
}

- (void)saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(POServiceConnection *)self _connectToService])
  {
    id v11 = [(POServiceConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__POServiceConnection_saveCredentialForUserName_passwordContext_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 saveCredentialForUserName:v8 passwordContext:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __76__POServiceConnection_saveCredentialForUserName_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)passwordDidChangeForUsername:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(POServiceConnection *)self _connectToService])
  {
    id v11 = [(POServiceConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__POServiceConnection_passwordDidChangeForUsername_passwordContext_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 passwordDidChangeForUsername:v8 passwordContext:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __79__POServiceConnection_passwordDidChangeForUsername_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if ([(POServiceConnection *)self _connectToService])
  {
    __int16 v20 = [(POServiceConnection *)self xpcConnection];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __133__POServiceConnection_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock_completion___block_invoke;
    v27 = &unk_264BBECD0;
    id v21 = v19;
    id v28 = v21;
    id v22 = [v20 synchronousRemoteObjectProxyWithErrorHandler:&v24];
    objc_msgSend(v22, "screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:", v15, v16, v17, v18, v10, v9, v21, v24, v25, v26, v27);
  }
  else if (v19)
  {
    v23 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void *))v19 + 2))(v19, v23);
  }
}

void __133__POServiceConnection_screenDidUnlockWithCredentialContext_smartCardContext_biometricContext_tokenId_atLogin_tokenUnlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)retainContextForUserName:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(POServiceConnection *)self _connectToService])
  {
    id v11 = [(POServiceConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__POServiceConnection_retainContextForUserName_context_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 retainContextForUserName:v8 context:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

void __67__POServiceConnection_retainContextForUserName_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)updateLocalAccountPassword:(id)a3 passwordContextData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(POServiceConnection *)self _connectToService])
  {
    id v11 = [(POServiceConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __81__POServiceConnection_updateLocalAccountPassword_passwordContextData_completion___block_invoke;
    v15[3] = &unk_264BBECD0;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 updateLocalAccountPassword:v8 passwordContextData:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 3, v14);
  }
}

void __81__POServiceConnection_updateLocalAccountPassword_passwordContextData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 3, v3);
  }
}

- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(POServiceConnection *)self _connectToService])
  {
    id v10 = [(POServiceConnection *)self xpcConnection];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __84__POServiceConnection_configurationDidChangeAndRemovedExtension_removed_completion___block_invoke;
    v14[3] = &unk_264BBECD0;
    id v11 = v9;
    id v15 = v11;
    id v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v12 configurationDidChangeAndRemovedExtension:v8 removed:v6 completion:v11];
  }
  else if (v9)
  {
    id v13 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

void __84__POServiceConnection_configurationDidChangeAndRemovedExtension_removed_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceConnection();
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
  if (self->_xpcConnection)
  {
    id v3 = PO_LOG_POServiceConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

    return 1;
  }
  id v4 = objc_alloc(MEMORY[0x263F08D68]);
  if (self->_forLogin) {
    uint64_t v5 = @"com.apple.PlatformSSO.login.service-xpc";
  }
  else {
    uint64_t v5 = @"com.apple.PlatformSSO.service-xpc";
  }
  BOOL v6 = (NSXPCConnection *)[v4 initWithMachServiceName:v5 options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v6;

  if (self->_xpcConnection)
  {
    if ([(POServiceConnection *)self uid] >= 0x1F5) {
      [(NSXPCConnection *)self->_xpcConnection _setTargetUserIdentifier:[(POServiceConnection *)self uid]];
    }
    id v8 = [MEMORY[0x263F5E618] interfaceWithInternalProtocol:&unk_26E5D50B0];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __40__POServiceConnection__connectToService__block_invoke;
    v16[3] = &unk_264BBECF8;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__POServiceConnection__connectToService__block_invoke_80;
    v14[3] = &unk_264BBECF8;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v14];
    id v9 = self->_xpcConnection;
    id v10 = +[POServiceConnection xpcQueue];
    [(NSXPCConnection *)v9 _setQueue:v10];

    [(NSXPCConnection *)self->_xpcConnection resume];
    id v11 = PO_LOG_POServiceConnection();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    return 1;
  }
  id v13 = PO_LOG_POServiceConnection();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[POServiceConnection _connectToService]();
  }

  return 0;
}

void __40__POServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    id v3 = PO_LOG_POServiceConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__POServiceConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __40__POServiceConnection__connectToService__block_invoke_80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = PO_LOG_POServiceConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__POServiceConnection__connectToService__block_invoke_80_cold_1();
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (BOOL)forLogin
{
  return self->_forLogin;
}

- (void)setForLogin:(BOOL)a3
{
  self->_forLogin = a3;
}

- (void).cxx_destruct
{
}

void __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_230E51000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_connectToService
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_230E51000, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
}

void __40__POServiceConnection__connectToService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_230E51000, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
}

void __40__POServiceConnection__connectToService__block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_230E51000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
}

@end