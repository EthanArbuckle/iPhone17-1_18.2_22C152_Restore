@interface PowerModeConnection
- (BOOL)disablePowerMode:(id)a3;
- (BOOL)enablePowerMode:(id)a3;
- (BOOL)updateAllowOnCharger:(id)a3 withState:(BOOL)a4;
- (BOOL)updateEntryDelay:(id)a3 withDelay:(double)a4;
- (BOOL)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4;
- (BOOL)updatePowerMode:(id)a3 withState:(BOOL)a4;
- (NSXPCConnection)connection;
- (PowerModeConnection)init;
- (void)init;
- (void)setConnection:(id)a3;
@end

@implementation PowerModeConnection

- (PowerModeConnection)init
{
  os_log_t v3 = os_log_create("com.apple.PowerExperienceFramework", "PowerModeConnection");
  v4 = (void *)_log_0;
  _log_0 = (uint64_t)v3;

  v5 = _log_0;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_25A13D000, v5, OS_LOG_TYPE_INFO, "PowerModeConnection init", (uint8_t *)buf, 2u);
  }
  v30.receiver = self;
  v30.super_class = (Class)PowerModeConnection;
  v6 = [(PowerModeConnection *)&v30 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.powerexperienced.powermodes" options:4096];
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v7;

    v9 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_25A13D000, v9, OS_LOG_TYPE_INFO, "established connection to powerexperienced", (uint8_t *)buf, 2u);
    }
    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27081E068];
    [(NSXPCConnection *)v6->_connection setRemoteObjectInterface:v10];

    [(NSXPCConnection *)v6->_connection setExportedObject:v6];
    objc_initWeak(buf, v6);
    v11 = v6->_connection;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __27__PowerModeConnection_init__block_invoke;
    v27[3] = &unk_2654767A8;
    objc_copyWeak(&v28, buf);
    [(NSXPCConnection *)v11 setInterruptionHandler:v27];
    v12 = v6->_connection;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __27__PowerModeConnection_init__block_invoke_16;
    v25 = &unk_2654767A8;
    objc_copyWeak(&v26, buf);
    [(NSXPCConnection *)v12 setInvalidationHandler:&v22];
    [(NSXPCConnection *)v6->_connection resume];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
  }
  else
  {
    v13 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
      [(PowerModeConnection *)v13 init];
    }
  }
  return v6;
}

void __27__PowerModeConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
      __27__PowerModeConnection_init__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __27__PowerModeConnection_init__block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
      __27__PowerModeConnection_init__block_invoke_16_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)enablePowerMode:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__PowerModeConnection_enablePowerMode___block_invoke_18;
  v7[3] = &unk_2654767F0;
  v7[4] = &v8;
  [v5 enablePowerMode:v4 withReply:v7];

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

void __39__PowerModeConnection_enablePowerMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();
  }
}

uint64_t __39__PowerModeConnection_enablePowerMode___block_invoke_18(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)disablePowerMode:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_21];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__PowerModeConnection_disablePowerMode___block_invoke_22;
  v7[3] = &unk_2654767F0;
  v7[4] = &v8;
  [v5 disablePowerMode:v4 withReply:v7];

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

void __40__PowerModeConnection_disablePowerMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();
  }
}

uint64_t __40__PowerModeConnection_disablePowerMode___block_invoke_22(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updatePowerMode:(id)a3 withState:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_24];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__PowerModeConnection_updatePowerMode_withState___block_invoke_25;
  v9[3] = &unk_2654767F0;
  v9[4] = &v10;
  [v7 updatePowerMode:v6 withState:v4 andReply:v9];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v4;
}

void __49__PowerModeConnection_updatePowerMode_withState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();
  }
}

uint64_t __49__PowerModeConnection_updatePowerMode_withState___block_invoke_25(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateAllowOnCharger:(id)a3 withState:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__PowerModeConnection_updateAllowOnCharger_withState___block_invoke_28;
  v9[3] = &unk_2654767F0;
  v9[4] = &v10;
  [v7 updateAllowOnCharger:v6 withState:v4 andReply:v9];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v4;
}

void __54__PowerModeConnection_updateAllowOnCharger_withState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();
  }
}

uint64_t __54__PowerModeConnection_updateAllowOnCharger_withState___block_invoke_28(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateEntryDelay:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__PowerModeConnection_updateEntryDelay_withDelay___block_invoke_31;
  v9[3] = &unk_2654767F0;
  v9[4] = &v10;
  [v7 updateEntryDelay:v6 withDelay:v9 andReply:a4];

  LOBYTE(v7) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v7;
}

void __50__PowerModeConnection_updateEntryDelay_withDelay___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();
  }
}

uint64_t __50__PowerModeConnection_updateEntryDelay_withDelay___block_invoke_31(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_33];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__PowerModeConnection_updateMaxEngagementDuration_withDuration___block_invoke_34;
  v9[3] = &unk_2654767F0;
  v9[4] = &v10;
  [v7 updateMaxEngagementDuration:v6 withDuration:v9 andReply:a4];

  LOBYTE(v7) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v7;
}

void __64__PowerModeConnection_updateMaxEngagementDuration_withDuration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR)) {
    __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1();
  }
}

uint64_t __64__PowerModeConnection_updateMaxEngagementDuration_withDuration___block_invoke_34(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
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

- (void)init
{
}

void __27__PowerModeConnection_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __27__PowerModeConnection_init__block_invoke_16_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__PowerModeConnection_enablePowerMode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_25A13D000, v0, v1, "Connection error %@", v2, v3, v4, v5, v6);
}

@end