@interface POUIServiceConnection
+ (id)xpcQueue;
- (BOOL)_connectToService;
- (BOOL)forLogin;
- (NSXPCConnection)xpcConnection;
- (POUIServiceConnection)init;
- (unsigned)uid;
- (void)dealloc;
- (void)deviceStatusWithCompletion:(id)a3;
- (void)init;
- (void)setForLogin:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
- (void)setXpcConnection:(id)a3;
- (void)startAction:(int64_t)a3 forUserName:(id)a4 completion:(id)a5;
- (void)startDeviceAction:(int64_t)a3 completion:(id)a4;
- (void)statusForUser:(id)a3 completion:(id)a4;
@end

@implementation POUIServiceConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_2 != -1) {
    dispatch_once(&xpcQueue_onceToken_2, &__block_literal_global_9);
  }
  v2 = (void *)xpcQueue_queue_2;

  return v2;
}

uint64_t __33__POUIServiceConnection_xpcQueue__block_invoke()
{
  xpcQueue_queue_2 = (uint64_t)dispatch_queue_create("com.apple.PlatformPSSO.ui-settings-queue", 0);

  return MEMORY[0x270F9A758]();
}

- (POUIServiceConnection)init
{
  v3 = PO_LOG_POUIServiceConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[POUIServiceConnection init]();
  }

  v7.receiver = self;
  v7.super_class = (Class)POUIServiceConnection;
  v4 = [(POUIServiceConnection *)&v7 init];
  v5 = v4;
  if (v4) {
    [(POUIServiceConnection *)v4 _connectToService];
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

- (void)deviceStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POUIServiceConnection *)self _connectToService])
  {
    v5 = [(POUIServiceConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__POUIServiceConnection_deviceStatusWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    objc_super v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 deviceStatusWithCompletion:v6];
  }
  else if (v4)
  {
    v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __52__POUIServiceConnection_deviceStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POUIServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)statusForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POUIServiceConnection *)self _connectToService])
  {
    v8 = [(POUIServiceConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__POUIServiceConnection_statusForUser_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 statusForUser:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __50__POUIServiceConnection_statusForUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POUIServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)startAction:(int64_t)a3 forUserName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(POUIServiceConnection *)self _connectToService])
  {
    id v10 = [(POUIServiceConnection *)self xpcConnection];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__POUIServiceConnection_startAction_forUserName_completion___block_invoke;
    v14[3] = &unk_264BBECD0;
    id v11 = v9;
    id v15 = v11;
    v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v12 startAction:a3 forUserName:v8 completion:v11];
  }
  else if (v9)
  {
    id v13 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

void __60__POUIServiceConnection_startAction_forUserName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POUIServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)startDeviceAction:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(POUIServiceConnection *)self _connectToService])
  {
    id v7 = [(POUIServiceConnection *)self xpcConnection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__POUIServiceConnection_startDeviceAction_completion___block_invoke;
    v11[3] = &unk_264BBECD0;
    id v8 = v6;
    id v12 = v8;
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
    [v9 startDeviceAction:a3 completion:v8];
  }
  else if (v6)
  {
    id v10 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __54__POUIServiceConnection_startDeviceAction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POUIServiceConnection();
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
    id v3 = PO_LOG_POUIServiceConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

    return 1;
  }
  id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.PlatformSSO.settings.service-xpc" options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  if (self->_xpcConnection)
  {
    if ([(POUIServiceConnection *)self uid]) {
      [(NSXPCConnection *)self->_xpcConnection _setTargetUserIdentifier:[(POUIServiceConnection *)self uid]];
    }
    id v6 = [MEMORY[0x263F5E618] interfaceWithInternalProtocol:&unk_26E5DC288];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__POUIServiceConnection__connectToService__block_invoke;
    v14[3] = &unk_264BBECF8;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__POUIServiceConnection__connectToService__block_invoke_64;
    v12[3] = &unk_264BBECF8;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v12];
    id v7 = self->_xpcConnection;
    id v8 = +[POUIServiceConnection xpcQueue];
    [(NSXPCConnection *)v7 _setQueue:v8];

    [(NSXPCConnection *)self->_xpcConnection resume];
    id v9 = PO_LOG_POUIServiceConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    return 1;
  }
  id v11 = PO_LOG_POUIServiceConnection();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[POServiceConnection _connectToService]();
  }

  return 0;
}

void __42__POUIServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    id v3 = PO_LOG_POUIServiceConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__POServiceConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __42__POUIServiceConnection__connectToService__block_invoke_64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = PO_LOG_POUIServiceConnection();
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

- (void)init
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

@end