@interface POServiceCoreConnection
+ (id)xpcQueue;
- (BOOL)_connectToService;
- (BOOL)forLogin;
- (NSXPCConnection)xpcConnection;
- (POServiceCoreConnection)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4;
- (unsigned)uid;
- (void)dealloc;
- (void)getLoginTypeForUser:(id)a3 completion:(id)a4;
- (void)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5 completion:(id)a6;
- (void)setForLogin:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setXpcConnection:(id)a3;
- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5;
- (void)verifyPasswordUser:(id)a3 passwordContext:(id)a4 completion:(id)a5;
@end

@implementation POServiceCoreConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_0 != -1) {
    dispatch_once(&xpcQueue_onceToken_0, &__block_literal_global_15);
  }
  v2 = (void *)xpcQueue_queue_0;
  return v2;
}

uint64_t __35__POServiceCoreConnection_xpcQueue__block_invoke()
{
  xpcQueue_queue_0 = (uint64_t)dispatch_queue_create("com.apple.PlatformPSSO.auth-plugin-queue", 0);
  return MEMORY[0x270F9A758]();
}

- (POServiceCoreConnection)initWithUid:(unsigned int)a3 forLogin:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = PO_LOG_POServiceCoreConnection();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = [NSNumber numberWithUnsignedInt:v5];
    v12 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 136315906;
    v15 = "-[POServiceCoreConnection initWithUid:forLogin:]";
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 2114;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = self;
    _os_log_debug_impl(&dword_259DFE000, v7, OS_LOG_TYPE_DEBUG, "%s userID = %{public}@, login = %{public}@ on %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)POServiceCoreConnection;
  v8 = [(POServiceCoreConnection *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_uid = v5;
    v8->_forLogin = v4;
    [(POServiceCoreConnection *)v8 _connectToService];
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[POServiceCoreConnection dealloc]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)getLoginTypeForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POServiceCoreConnection *)self _connectToService])
  {
    v8 = [(POServiceCoreConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__POServiceCoreConnection_getLoginTypeForUser_completion___block_invoke;
    v12[3] = &unk_265464030;
    id v9 = v7;
    id v13 = v9;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 getLoginTypeForUser:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __58__POServiceCoreConnection_getLoginTypeForUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
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
  if ([(POServiceCoreConnection *)self _connectToService])
  {
    id v13 = [(POServiceCoreConnection *)self xpcConnection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __102__POServiceCoreConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke;
    v17[3] = &unk_265464030;
    id v14 = v12;
    id v18 = v14;
    v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v17];
    [v15 performPasswordLogin:v10 passwordContext:v11 updateLocalAccountPassword:v7 completion:v14];
  }
  else if (v12)
  {
    __int16 v16 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, uint64_t, void *))v12 + 2))(v12, 2, v16);
  }
}

void __102__POServiceCoreConnection_performPasswordLogin_passwordContext_updateLocalAccountPassword_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
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
  if ([(POServiceCoreConnection *)self _connectToService])
  {
    id v11 = [(POServiceCoreConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __74__POServiceCoreConnection_verifyPasswordLogin_passwordContext_completion___block_invoke;
    v15[3] = &unk_265464030;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 verifyPasswordLogin:v8 passwordContext:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v14);
  }
}

void __74__POServiceCoreConnection_verifyPasswordLogin_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 2, v3);
  }
}

- (void)verifyPasswordUser:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(POServiceCoreConnection *)self _connectToService])
  {
    id v11 = [(POServiceCoreConnection *)self xpcConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__POServiceCoreConnection_verifyPasswordUser_passwordContext_completion___block_invoke;
    v15[3] = &unk_265464030;
    id v12 = v10;
    id v16 = v12;
    id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v15];
    [v13 verifyPasswordUser:v8 passwordContext:v9 completion:v12];
  }
  else if (v10)
  {
    id v14 = +[POError internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, uint64_t, void, void, void, void, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v14);
  }
}

void __73__POServiceCoreConnection_verifyPasswordUser_passwordContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = PO_LOG_POServiceCoreConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__PODaemonCoreConnection_deviceConfigurationForIdentifer_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, void, void, void, void, id))(v5 + 16))(v5, 2, 0, 0, 0, 0, v3);
  }
}

- (BOOL)_connectToService
{
  if (self->_xpcConnection)
  {
    id v3 = PO_LOG_POServiceCoreConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreConnection _connectToService]();
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
  id v6 = (NSXPCConnection *)[v4 initWithMachServiceName:v5 options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v6;

  if (self->_xpcConnection)
  {
    if ([(POServiceCoreConnection *)self uid] >= 0x1F5) {
      [(NSXPCConnection *)self->_xpcConnection _setTargetUserIdentifier:[(POServiceCoreConnection *)self uid]];
    }
    id v8 = +[POInternalProtocols interfaceWithInternalProtocol:&unk_2707E3078];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__POServiceCoreConnection__connectToService__block_invoke;
    v16[3] = &unk_265464058;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v16];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __44__POServiceCoreConnection__connectToService__block_invoke_64;
    v14[3] = &unk_265464058;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v14];
    id v9 = self->_xpcConnection;
    id v10 = +[POServiceCoreConnection xpcQueue];
    [(NSXPCConnection *)v9 _setQueue:v10];

    [(NSXPCConnection *)self->_xpcConnection resume];
    id v11 = PO_LOG_POServiceCoreConnection();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreConnection _connectToService]();
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    return 1;
  }
  id v13 = PO_LOG_POServiceCoreConnection();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[PODaemonCoreConnection _connectToService]();
  }

  return 0;
}

void __44__POServiceCoreConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    id v3 = PO_LOG_POServiceCoreConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43__PODaemonCoreConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __44__POServiceCoreConnection__connectToService__block_invoke_64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = PO_LOG_POServiceCoreConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __43__PODaemonCoreConnection__connectToService__block_invoke_88_cold_1();
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

@end