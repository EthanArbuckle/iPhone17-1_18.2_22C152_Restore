@interface PowerUISmartChargeClient
+ (id)remoteInterface;
- (BOOL)disableCEC:(id *)a3;
- (BOOL)disableDEoC:(id *)a3;
- (BOOL)disableMCL:(id *)a3;
- (BOOL)disableMCM:(id *)a3;
- (BOOL)disableSmartCharging:(id *)a3;
- (BOOL)enableCEC:(id *)a3;
- (BOOL)enableDEoC:(id *)a3;
- (BOOL)enableMCL:(id *)a3;
- (BOOL)enableMCM:(id *)a3;
- (BOOL)enableSmartCharging:(id *)a3;
- (BOOL)isCECSupported;
- (BOOL)isDEoCSupported;
- (BOOL)isMCLSupported;
- (BOOL)isOBCEngaged:(BOOL *)a3 chargeLimit:(unint64_t *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6;
- (BOOL)isOBCEngaged:(BOOL *)a3 isMaxChargeLimited:(BOOL *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6;
- (BOOL)isOBCEngaged:(id *)a3;
- (BOOL)isOBCEngagedAsDesktopDevice:(BOOL *)a3 chargingOverrideAllowed:(BOOL *)a4 withError:(id *)a5;
- (BOOL)isOBCSupported;
- (BOOL)setCECState:(unint64_t)a3 error:(id *)a4;
- (BOOL)setDEoCState:(unint64_t)a3 error:(id *)a4;
- (BOOL)setMCLLimit:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)setMCMState:(unint64_t)a3 error:(id *)a4;
- (BOOL)setState:(unint64_t)a3 error:(id *)a4;
- (BOOL)shouldMCMBeDisplayed:(id *)a3;
- (BOOL)smartChargingUIState:(unint64_t *)a3 chargeLimit:(unint64_t *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6;
- (BOOL)temporarilyDisableCEC:(id *)a3;
- (BOOL)temporarilyDisableMCL:(id *)a3;
- (BOOL)temporarilyDisableMCM:(id *)a3;
- (BOOL)temporarilyDisableSmartCharging:(id *)a3;
- (BOOL)temporarilyEnableCharging:(id *)a3;
- (NSString)clientName;
- (NSXPCConnection)connection;
- (OS_os_log)log;
- (PowerUISmartChargeClient)initWithClientName:(id)a3;
- (id)cecFullChargeDeadline:(id *)a3;
- (id)fullChargeDeadline:(id *)a3;
- (id)getDEoCPredictions:(id *)a3;
- (id)lastUsedLeewayWithError:(id *)a3;
- (id)powerLogStatus;
- (id)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withError:(id *)a5;
- (id)status;
- (unint64_t)currentChargeLimit:(id *)a3;
- (unint64_t)currentRecommendedChargeLimitWithError:(id *)a3;
- (unint64_t)isCECCurrentlyEnabled:(id *)a3;
- (unint64_t)isDEoCCurrentlyEnabled:(id *)a3;
- (unint64_t)isMCLCurrentlyEnabled:(id *)a3;
- (unint64_t)isMCMCurrentlyEnabled:(id *)a3;
- (unint64_t)isSmartChargingCurrentlyEnabled:(id *)a3;
- (unsigned)getMCLLimitWithError:(id *)a3;
- (void)cecFullChargeDeadlineWithHandler:(id)a3;
- (void)currentRecommendedChargeLimitWithHandler:(id)a3;
- (void)dealloc;
- (void)disableCECWithHandler:(id)a3;
- (void)disableDEoCWithHandler:(id)a3;
- (void)disableMCLWithHandler:(id)a3;
- (void)disableMCMWithHandler:(id)a3;
- (void)disableSmartChargingWithHandler:(id)a3;
- (void)enableCECWithHandler:(id)a3;
- (void)enableDEoCWithHandler:(id)a3;
- (void)enableMCLWithHandler:(id)a3;
- (void)enableMCMWithHandler:(id)a3;
- (void)enableSmartChargingWithHandler:(id)a3;
- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6;
- (void)enterDevelopmentMode;
- (void)fullChargeDeadlineWithHandler:(id)a3;
- (void)getMCLLimitWithHandler:(id)a3;
- (void)isCECCurrentlyEnabledWithHandler:(id)a3;
- (void)isCECSupportedWithHandler:(id)a3;
- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3;
- (void)isDEoCSupportedWithHandler:(id)a3;
- (void)isMCLCurrentlyEnabledWithHandler:(id)a3;
- (void)isMCLSupportedWithHandler:(id)a3;
- (void)isMCMCurrentlyEnabledWithHandler:(id)a3;
- (void)isOBCEngagedAsDesktopDeviceWithHandler:(id)a3;
- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3;
- (void)isOBCSupportedWithHandler:(id)a3;
- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3;
- (void)legacy_client_isOBCEngagedWithHandler:(id)a3;
- (void)listMonitorSignals;
- (void)resetDevelopmentMode;
- (void)resetEngagementOverride;
- (void)setClientName:(id)a3;
- (void)setConnection:(id)a3;
- (void)setLog:(id)a3;
- (void)setMCLLimit:(unsigned __int8)a3 withHandler:(id)a4;
- (void)shouldMCMBeDisplayedWithHandler:(id)a3;
- (void)temporarilyDisableCECWithHandler:(id)a3;
- (void)temporarilyDisableMCLWithHandler:(id)a3;
- (void)temporarilyDisableMCMWithHandler:(id)a3;
- (void)temporarilyDisableSmartChargingWithHandler:(id)a3;
- (void)temporarilyEnableChargingWithHandler:(id)a3;
@end

@implementation PowerUISmartChargeClient

+ (id)remoteInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D38F4E0];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_statusWithHandler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  [v2 setClasses:v16 forSelector:sel_powerLogStatusWithHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

- (PowerUISmartChargeClient)initWithClientName:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PowerUISmartChargeClient;
  uint64_t v6 = [(PowerUISmartChargeClient *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientName, a3);
    os_log_t v8 = os_log_create("com.apple.powerui.smartcharging", (const char *)[v5 UTF8String]);
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.powerui.smartChargeManager" options:4096];
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v10;

    uint64_t v12 = v7->_connection;
    uint64_t v13 = [(id)objc_opt_class() remoteInterface];
    [(NSXPCConnection *)v12 setRemoteObjectInterface:v13];

    [(NSXPCConnection *)v7->_connection resume];
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PowerUISmartChargeClient;
  [(PowerUISmartChargeClient *)&v3 dealloc];
}

- (BOOL)isOBCSupported
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  objc_super v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2;
  v5[3] = &unk_2645A6288;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 isOBCSupportedWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)isOBCSupportedWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isOBCSupportedWithHandler:v4];
}

- (unint64_t)isSmartChargingCurrentlyEnabled:(id *)a3
{
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 1;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke;
  v9[3] = &unk_2645A5EE8;
  v9[4] = &v14;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke_2;
  v8[3] = &unk_2645A62B0;
  v8[4] = &v14;
  v8[5] = &v10;
  [v5 isSmartChargingCurrentlyEnabledWithHandler:v8];

  if (a3) {
    *a3 = (id) v15[5];
  }
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
}

void __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isSmartChargingCurrentlyEnabledWithHandler:v4];
}

- (BOOL)setState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  connection = self->_connection;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__PowerUISmartChargeClient_setState_error___block_invoke;
  v18[3] = &unk_2645A62D8;
  v18[4] = &v23;
  v18[5] = &v19;
  v18[6] = &v29;
  uint64_t v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
  clientName = self->_clientName;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__PowerUISmartChargeClient_setState_error___block_invoke_2;
  v17[3] = &unk_2645A6300;
  v17[4] = &v23;
  v17[5] = &v19;
  v17[6] = &v29;
  [v8 client:clientName setState:a3 withHandler:v17];

  uint64_t v10 = v30[5];
  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    uint64_t v12 = [(PowerUISmartChargeClient *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[PowerUISmartChargeClient setState:error:](v12);
    }

    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:5 userInfo:0];
    uint64_t v14 = (void *)v24[5];
    v24[5] = v13;

    *((unsigned char *)v20 + 24) = 0;
  }
  if (a4) {
    *a4 = (id) v24[5];
  }
  char v15 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

void __43__PowerUISmartChargeClient_setState_error___block_invoke(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void __43__PowerUISmartChargeClient_setState_error___block_invoke_2(void *a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

- (BOOL)disableSmartCharging:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setState:0 error:a3];
}

- (void)disableSmartChargingWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setState:0 withHandler:v5];
}

- (BOOL)temporarilyDisableSmartCharging:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setState:3 error:a3];
}

- (void)temporarilyDisableSmartChargingWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setState:3 withHandler:v5];
}

- (BOOL)enableSmartCharging:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setState:1 error:a3];
}

- (void)enableSmartChargingWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setState:1 withHandler:v5];
}

- (BOOL)temporarilyEnableCharging:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setState:2 error:a3];
}

- (void)temporarilyEnableChargingWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setState:2 withHandler:v5];
}

- (id)status
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  dispatch_time_t v11 = __Block_byref_object_copy__3;
  uint64_t v12 = __Block_byref_object_dispose__3;
  id v13 = (id)MEMORY[0x263EFFA78];
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__PowerUISmartChargeClient_status__block_invoke;
  v7[3] = &unk_2645A6328;
  v7[4] = self;
  v7[5] = a2;
  objc_super v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__PowerUISmartChargeClient_status__block_invoke_134;
  v6[3] = &unk_2645A6350;
  v6[4] = &v8;
  [v3 statusWithHandler:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __34__PowerUISmartChargeClient_status__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v7, 0x20u);
  }
}

void __34__PowerUISmartChargeClient_status__block_invoke_134(uint64_t a1, void *a2)
{
}

- (id)powerLogStatus
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = __Block_byref_object_copy__3;
  id v12 = __Block_byref_object_dispose__3;
  id v13 = (id)MEMORY[0x263EFFA78];
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__PowerUISmartChargeClient_powerLogStatus__block_invoke;
  v7[3] = &unk_2645A6328;
  v7[4] = self;
  v7[5] = a2;
  id v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__PowerUISmartChargeClient_powerLogStatus__block_invoke_136;
  v6[3] = &unk_2645A6350;
  v6[4] = &v8;
  [v3 powerLogStatusWithHandler:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __42__PowerUISmartChargeClient_powerLogStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) clientName];
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Client %@ received error (%@): %@", (uint8_t *)&v7, 0x20u);
  }
}

void __42__PowerUISmartChargeClient_powerLogStatus__block_invoke_136(uint64_t a1, void *a2)
{
}

- (id)fullChargeDeadline:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke;
  v12[3] = &unk_2645A6378;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a2;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_137;
  v11[3] = &unk_2645A63A0;
  v11[4] = &v19;
  v11[5] = &v13;
  [v5 fullChargeDeadlineWithHandler:v11];

  id v6 = (void *)v14[5];
  if (v6)
  {
    int v7 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    uint64_t v8 = (void *)v20[5];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v9 = [MEMORY[0x263EFF910] distantPast];
    }
    int v7 = v9;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v7;
}

void __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);
  }
}

void __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)fullChargeDeadlineWithHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__PowerUISmartChargeClient_fullChargeDeadlineWithHandler___block_invoke;
  v8[3] = &unk_2645A63C8;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 fullChargeDeadlineWithHandler:v6];
}

uint64_t __58__PowerUISmartChargeClient_fullChargeDeadlineWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)smartChargingUIState:(unint64_t *)a3 chargeLimit:(unint64_t *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 100;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  char v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke;
  v17[3] = &unk_2645A6378;
  v17[4] = self;
  v17[5] = &v18;
  v17[6] = a2;
  uint64_t v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_139;
  v16[3] = &unk_2645A63F0;
  v16[6] = &v28;
  v16[7] = &v24;
  v16[4] = self;
  v16[5] = &v32;
  v16[8] = &v18;
  v16[9] = a2;
  [v13 smartChargingUIStateWithHandler:v16];

  *a3 = v33[3];
  if (a4) {
    *a4 = v29[3];
  }
  if (a5) {
    *a5 = *((unsigned char *)v25 + 24);
  }
  uint64_t v14 = (void *)v19[5];
  if (a6 && v14) {
    *a6 = v14;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v14 == 0;
}

void __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);
  }
}

void __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_139(void *a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  id v9 = a5;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a4;
  if (v9)
  {
    uint64_t v10 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_139_cold_1((uint64_t)a1, v10);
    }
  }
  uint64_t v11 = *(void *)(a1[8] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
}

- (BOOL)isOBCEngaged:(BOOL *)a3 isMaxChargeLimited:(BOOL *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  id v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  connection = self->_connection;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke;
  v23[3] = &unk_2645A6378;
  v23[4] = self;
  v23[5] = &v32;
  v23[6] = a2;
  id v12 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v23];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke_141;
  v22[3] = &unk_2645A6418;
  v22[6] = &v28;
  v22[7] = &v24;
  v22[4] = self;
  v22[5] = &v38;
  v22[8] = &v32;
  v22[9] = a2;
  objc_msgSend(v12, "legacy_isOBCEngagedWithHandler:", v22);

  uint64_t v13 = a6;
  uint64_t v14 = [(PowerUISmartChargeClient *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [(PowerUISmartChargeClient *)self clientName];
    int v16 = *((unsigned __int8 *)v39 + 24);
    int v17 = *((unsigned __int8 *)v29 + 24);
    int v18 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)buf = 138413058;
    v43 = v15;
    __int16 v44 = 1024;
    int v45 = v16;
    __int16 v46 = 1024;
    int v47 = v17;
    __int16 v48 = 1024;
    int v49 = v18;
    _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_INFO, "Client %@ requested engagement state: %d - %d - %d", buf, 0x1Eu);
  }
  if (a3) {
    *a3 = *((unsigned char *)v39 + 24);
  }
  if (a4) {
    *a4 = *((unsigned char *)v29 + 24);
  }
  if (a5) {
    *a5 = *((unsigned char *)v25 + 24);
  }
  uint64_t v19 = (void *)v33[5];
  if (v13 && v19) {
    *uint64_t v13 = v19;
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v19 == 0;
}

void __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);
  }
}

void __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke_141(void *a1, char a2, char a3, char a4, void *a5)
{
  id v9 = a5;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a4;
  if (v9)
  {
    uint64_t v10 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_139_cold_1((uint64_t)a1, v10);
    }
  }
  uint64_t v11 = *(void *)(a1[8] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
}

- (BOOL)isOBCEngagedAsDesktopDevice:(BOOL *)a3 chargingOverrideAllowed:(BOOL *)a4 withError:(id *)a5
{
  BOOL v6 = 0;
  [(PowerUISmartChargeClient *)self isOBCEngaged:&v6 isMaxChargeLimited:a3 chargingOverrideAllowed:a4 withError:a5];
  return v6;
}

- (void)isOBCEngagedAsDesktopDeviceWithHandler:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__PowerUISmartChargeClient_isOBCEngagedAsDesktopDeviceWithHandler___block_invoke;
  v9[3] = &unk_2645A6440;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v7 = v5;
  uint64_t v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  [v8 isOBCEngagedAsDesktopDeviceWithHandler:v7];
}

void __67__PowerUISmartChargeClient_isOBCEngagedAsDesktopDeviceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isOBCEngaged:(id *)a3
{
  BOOL v4 = 0;
  [(PowerUISmartChargeClient *)self isOBCEngaged:&v4 isMaxChargeLimited:0 chargingOverrideAllowed:0 withError:a3];
  return v4;
}

- (void)legacy_client_isOBCEngagedWithHandler:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke;
  v12[3] = &unk_2645A6440;
  v12[4] = self;
  SEL v14 = a2;
  id v7 = v5;
  id v13 = v7;
  uint64_t v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke_143;
  v10[3] = &unk_2645A6468;
  id v11 = v7;
  id v9 = v7;
  objc_msgSend(v8, "legacy_isOBCEngagedWithHandler:", v10);
}

void __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setMCLLimit:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  char v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke;
  v13[3] = &unk_2645A6490;
  v13[4] = &v18;
  v13[5] = &v14;
  uint64_t v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  clientName = self->_clientName;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke_2;
  v12[3] = &unk_2645A64B8;
  v12[4] = &v18;
  void v12[5] = &v14;
  [v8 client:clientName setMCLLimit:v5 withHandler:v12];

  if (a4) {
    *a4 = (id) v19[5];
  }
  char v10 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)setMCLLimit:(unsigned __int8)a3 withHandler:(id)a4
{
  uint64_t v4 = a3;
  connection = self->_connection;
  id v7 = a4;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 client:self->_clientName setMCLLimit:v4 withHandler:v7];
}

- (unsigned)getMCLLimitWithError:(id *)a3
{
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke;
  v11[3] = &unk_2645A6490;
  v11[4] = &v16;
  v11[5] = &v12;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  clientName = self->_clientName;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke_2;
  v10[3] = &unk_2645A64E0;
  void v10[4] = &v16;
  v10[5] = &v12;
  [v6 client:clientName getMCLLimitWithHandler:v10];

  if (a3) {
    *a3 = (id) v17[5];
  }
  unsigned __int8 v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)getMCLLimitWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName getMCLLimitWithHandler:v5];
}

- (BOOL)disableMCL:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setMCLLimit:100 error:a3];
}

- (void)disableMCLWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setMCLLimit:100 withHandler:v5];
}

- (BOOL)enableMCL:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setMCLLimit:80 error:a3];
}

- (void)enableMCLWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setMCLLimit:80 withHandler:v5];
}

- (BOOL)temporarilyDisableMCL:(id *)a3
{
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke;
  v11[3] = &unk_2645A6490;
  v11[4] = &v16;
  v11[5] = &v12;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  clientName = self->_clientName;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke_2;
  v10[3] = &unk_2645A64B8;
  void v10[4] = &v16;
  v10[5] = &v12;
  [v6 tmpDisableMCLViaClient:clientName withHandler:v10];

  if (a3) {
    *a3 = (id) v17[5];
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)temporarilyDisableMCLWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 tmpDisableMCLViaClient:self->_clientName withHandler:v5];
}

- (unint64_t)isMCLCurrentlyEnabled:(id *)a3
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke;
  v9[3] = &unk_2645A5EE8;
  v9[4] = &v14;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke_2;
  v8[3] = &unk_2645A62B0;
  void v8[4] = &v14;
  v8[5] = &v10;
  [v5 isMCLCurrentlyEnabledWithHandler:v8];

  if (a3) {
    *a3 = (id) v15[5];
  }
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isMCLCurrentlyEnabledWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isMCLCurrentlyEnabledWithHandler:v4];
}

- (BOOL)isMCLSupported
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_146];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2;
  v5[3] = &unk_2645A6288;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 isMCLSupportedWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)isMCLSupportedWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isMCLSupportedWithHandler:v4];
}

- (unint64_t)currentRecommendedChargeLimitWithError:(id *)a3
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_148_0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2;
  v7[3] = &unk_2645A6508;
  v7[4] = self;
  v7[5] = &v8;
  [v4 currentRecommendedChargeLimitWithHandler:v7];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2_cold_1();
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)currentRecommendedChargeLimitWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 currentRecommendedChargeLimitWithHandler:v4];
}

- (BOOL)isDEoCSupported
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_150];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2;
  v5[3] = &unk_2645A6288;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 isDEoCSupportedWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)isDEoCSupportedWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isDEoCSupportedWithHandler:v4];
}

- (BOOL)setDEoCState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__3;
  char v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke;
  v13[3] = &unk_2645A6490;
  v13[4] = &v18;
  v13[5] = &v14;
  uint64_t v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  clientName = self->_clientName;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke_2;
  v12[3] = &unk_2645A64B8;
  v12[4] = &v18;
  void v12[5] = &v14;
  [v8 client:clientName setDEoCState:a3 withHandler:v12];

  if (a4) {
    *a4 = (id) v19[5];
  }
  char v10 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (unint64_t)isDEoCCurrentlyEnabled:(id *)a3
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke;
  v9[3] = &unk_2645A5EE8;
  v9[4] = &v14;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke_2;
  v8[3] = &unk_2645A62B0;
  void v8[4] = &v14;
  v8[5] = &v10;
  [v5 isDEoCCurrentlyEnabledWithHandler:v8];

  if (a3) {
    *a3 = (id) v15[5];
  }
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
}

void __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isDEoCCurrentlyEnabledWithHandler:v4];
}

- (BOOL)disableDEoC:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setDEoCState:0 error:a3];
}

- (void)disableDEoCWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setDEoCState:0 withHandler:v5];
}

- (BOOL)enableDEoC:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setDEoCState:1 error:a3];
}

- (void)enableDEoCWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setDEoCState:1 withHandler:v5];
}

- (unint64_t)currentChargeLimit:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke;
  v10[3] = &unk_2645A5EE8;
  void v10[4] = &v15;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2;
  v9[3] = &unk_2645A6530;
  v9[4] = self;
  void v9[5] = &v15;
  v9[6] = &v11;
  [v6 currentChargeLimitWithHandler:v9];

  if (a3) {
    *a3 = (id) v16[5];
  }
  unint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke(uint64_t a1, void *a2)
{
}

void __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  unint64_t v7 = [*(id *)(a1 + 32) log];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      char v9 = [*(id *)(a1 + 32) clientName];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2048;
      uint64_t v13 = a2;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_INFO, "Client %@ requested DEoC limit: %lu", (uint8_t *)&v10, 0x16u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
}

- (id)getDEoCPredictions:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3;
  id v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke;
  v10[3] = &unk_2645A5EE8;
  void v10[4] = &v17;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2;
  v9[3] = &unk_2645A6558;
  v9[4] = self;
  void v9[5] = &v17;
  v9[6] = &v11;
  [v6 getDEoCPredictionsWithHandler:v9];

  if (a3) {
    *a3 = (id) v18[5];
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke(uint64_t a1, void *a2)
{
}

void __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (BOOL)isOBCEngaged:(BOOL *)a3 chargeLimit:(unint64_t *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__3;
  uint64_t v30 = __Block_byref_object_dispose__3;
  id v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 100;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke;
  v17[3] = &unk_2645A6378;
  v17[4] = self;
  v17[5] = &v26;
  v17[6] = a2;
  uint64_t v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke_152;
  v16[3] = &unk_2645A6580;
  v16[6] = &v22;
  v16[7] = &v18;
  v16[4] = self;
  v16[5] = &v32;
  v16[8] = &v26;
  v16[9] = a2;
  [v13 isOBCEngagedOrChargeLimitedWithHandler:v16];

  if (a3) {
    *a3 = *((unsigned char *)v33 + 24);
  }
  if (a4) {
    *a4 = v23[3];
  }
  if (a5) {
    *a5 = *((unsigned char *)v19 + 24);
  }
  uint64_t v14 = (void *)v27[5];
  if (a6 && v14) {
    *a6 = v14;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v14 == 0;
}

void __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);
  }
}

void __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke_152(void *a1, char a2, uint64_t a3, char a4, void *a5)
{
  id v9 = a5;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a4;
  if (v9)
  {
    int v10 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_139_cold_1((uint64_t)a1, v10);
    }
  }
  uint64_t v11 = *(void *)(a1[8] + 8);
  __int16 v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
}

- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isOBCEngagedOrChargeLimitedWithHandler:v4];
}

- (BOOL)setCECState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__PowerUISmartChargeClient_setCECState_error___block_invoke;
  v15[3] = &unk_2645A6490;
  v15[4] = &v20;
  v15[5] = &v16;
  uint64_t v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  clientName = self->_clientName;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__PowerUISmartChargeClient_setCECState_error___block_invoke_2;
  v14[3] = &unk_2645A64B8;
  v14[4] = &v20;
  v14[5] = &v16;
  [v8 client:clientName setCECState:a3 withHandler:v14];

  if (a4) {
    *a4 = (id) v21[5];
  }
  int v10 = [(PowerUISmartChargeClient *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *((unsigned __int8 *)v17 + 24);
    *(_DWORD *)buf = 67109120;
    int v27 = v11;
    _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "Returning %d", buf, 8u);
  }

  BOOL v12 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __46__PowerUISmartChargeClient_setCECState_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __46__PowerUISmartChargeClient_setCECState_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)isCECSupported
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_155];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__PowerUISmartChargeClient_isCECSupported__block_invoke_2;
  v5[3] = &unk_2645A6288;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 isCECSupportedWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__PowerUISmartChargeClient_isCECSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (unint64_t)isCECCurrentlyEnabled:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke;
  v9[3] = &unk_2645A5EE8;
  v9[4] = &v14;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke_2;
  v8[3] = &unk_2645A62B0;
  void v8[4] = &v14;
  v8[5] = &v10;
  [v5 isCECCurrentlyEnabledWithHandler:v8];

  if (a3) {
    *a3 = (id) v15[5];
  }
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isCECCurrentlyEnabledWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isCECCurrentlyEnabledWithHandler:v4];
}

- (void)isCECSupportedWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isCECSupportedWithHandler:v4];
}

- (BOOL)disableCEC:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setCECState:0 error:a3];
}

- (void)disableCECWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setCECState:0 withHandler:v5];
}

- (BOOL)temporarilyDisableCEC:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setCECState:3 error:a3];
}

- (void)temporarilyDisableCECWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setCECState:3 withHandler:v5];
}

- (BOOL)enableCEC:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setCECState:1 error:a3];
}

- (void)enableCECWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setCECState:1 withHandler:v5];
}

- (id)cecFullChargeDeadline:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  id v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke;
  v12[3] = &unk_2645A6378;
  v12[4] = self;
  void v12[5] = &v13;
  void v12[6] = a2;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke_156;
  v11[3] = &unk_2645A63A0;
  v11[4] = &v19;
  v11[5] = &v13;
  [v5 cecFullChargeDeadlineWithHandler:v11];

  id v6 = (void *)v14[5];
  if (v6)
  {
    id v7 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    uint64_t v8 = (void *)v20[5];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v9 = [MEMORY[0x263EFF910] distantPast];
    }
    id v7 = v9;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v7;
}

void __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);
  }
}

void __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke_156(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)cecFullChargeDeadlineWithHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__PowerUISmartChargeClient_cecFullChargeDeadlineWithHandler___block_invoke;
  v8[3] = &unk_2645A63C8;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 cecFullChargeDeadlineWithHandler:v6];
}

uint64_t __61__PowerUISmartChargeClient_cecFullChargeDeadlineWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setMCMState:(unint64_t)a3 error:(id *)a4
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[PowerUISmartChargeClient setMCMState:error:](log, a3);
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  id v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__PowerUISmartChargeClient_setMCMState_error___block_invoke;
  v14[3] = &unk_2645A6490;
  v14[4] = &v19;
  v14[5] = &v15;
  id v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  clientName = self->_clientName;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__PowerUISmartChargeClient_setMCMState_error___block_invoke_2;
  v13[3] = &unk_2645A64B8;
  v13[4] = &v19;
  v13[5] = &v15;
  [v9 client:clientName setMCMState:a3 withHandler:v13];

  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __46__PowerUISmartChargeClient_setMCMState_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __46__PowerUISmartChargeClient_setMCMState_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)shouldMCMBeDisplayed:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  char v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke;
  v9[3] = &unk_2645A5EE8;
  v9[4] = &v14;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke_2;
  v8[3] = &unk_2645A64B8;
  void v8[4] = &v14;
  v8[5] = &v10;
  [v5 shouldMCMBeDisplayedWithHandler:v8];

  if (a3) {
    *a3 = (id) v15[5];
  }
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke(uint64_t a1, void *a2)
{
}

void __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)shouldMCMBeDisplayedWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 shouldMCMBeDisplayedWithHandler:v4];
}

- (unint64_t)isMCMCurrentlyEnabled:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  char v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 1;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke;
  v9[3] = &unk_2645A5EE8;
  v9[4] = &v14;
  id v5 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke_2;
  v8[3] = &unk_2645A62B0;
  void v8[4] = &v14;
  v8[5] = &v10;
  [v5 isMCMCurrentlyEnabledWithHandler:v8];

  if (a3) {
    *a3 = (id) v15[5];
  }
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)isMCMCurrentlyEnabledWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 isMCMCurrentlyEnabledWithHandler:v4];
}

- (BOOL)disableMCM:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setMCMState:0 error:a3];
}

- (void)disableMCMWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setMCMState:0 withHandler:v5];
}

- (BOOL)temporarilyDisableMCM:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setMCMState:2 error:a3];
}

- (void)temporarilyDisableMCMWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setMCMState:2 withHandler:v5];
}

- (BOOL)enableMCM:(id *)a3
{
  return [(PowerUISmartChargeClient *)self setMCMState:1 error:a3];
}

- (void)enableMCMWithHandler:(id)a3
{
  connection = self->_connection;
  id v5 = a3;
  id v6 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v6 client:self->_clientName setMCMState:1 withHandler:v5];
}

- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6
{
  BOOL v6 = a6;
  connection = self->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke;
  v16[3] = &unk_2645A6328;
  v16[4] = self;
  v16[5] = a2;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_157;
  v15[3] = &unk_2645A65A8;
  v15[4] = self;
  [v14 engageFrom:v13 until:v12 repeatUntil:v11 overrideAllSignals:v6 withHandler:v15];
}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);
  }
}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_157(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_157_cold_1(v2);
    }
  }
}

- (void)resetEngagementOverride
{
  connection = self->_connection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke;
  v6[3] = &unk_2645A6328;
  v6[4] = self;
  void v6[5] = a2;
  id v4 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke_159;
  v5[3] = &unk_2645A65A8;
  v5[4] = self;
  [v4 resetEngagementOverrideWithHandler:v5];
}

void __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(const char **)(a1 + 40);
    BOOL v6 = v4;
    uint64_t v7 = NSStringFromSelector(v5);
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Error: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke_159(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_22135E000, v2, OS_LOG_TYPE_DEFAULT, "Unable to reset override", v3, 2u);
    }
  }
}

- (id)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke;
  v15[3] = &unk_2645A6328;
  v15[4] = self;
  void v15[5] = a2;
  id v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_160;
  v14[3] = &unk_2645A65D0;
  v14[4] = self;
  v14[5] = &v22;
  void v14[6] = &v16;
  v14[7] = a2;
  [v11 simulateCurrentOutputAsOfDate:v9 overrideAllSignals:v6 withHandler:v14];

  if (a5) {
    *a5 = (id) v17[5];
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);
  }
}

void __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_160(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    int v8 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_160_cold_1((uint64_t)a1, v8);
    }
  }
}

- (void)enterDevelopmentMode
{
  connection = self->_connection;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__PowerUISmartChargeClient_enterDevelopmentMode__block_invoke;
  v4[3] = &unk_2645A6328;
  v4[4] = self;
  v4[5] = a2;
  id v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v4];
  [v3 enterDevelopmentMode];
}

void __48__PowerUISmartChargeClient_enterDevelopmentMode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);
  }
}

- (void)resetDevelopmentMode
{
  connection = self->_connection;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__PowerUISmartChargeClient_resetDevelopmentMode__block_invoke;
  v4[3] = &unk_2645A6328;
  v4[4] = self;
  v4[5] = a2;
  id v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v4];
  [v3 resetDevelopmentMode];
}

void __48__PowerUISmartChargeClient_resetDevelopmentMode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);
  }
}

- (id)lastUsedLeewayWithError:(id *)a3
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__3;
  uint64_t v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke;
  v11[3] = &unk_2645A6328;
  v11[4] = self;
  v11[5] = a2;
  id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke_161;
  v10[3] = &unk_2645A65F8;
  void v10[4] = self;
  void v10[5] = &v18;
  void v10[6] = &v12;
  v10[7] = a2;
  [v7 currentLeewayWithHandler:v10];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);
  }
}

void __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke_161(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v8 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_160_cold_1((uint64_t)a1, v8);
    }
  }
}

- (void)listMonitorSignals
{
  connection = self->_connection;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__PowerUISmartChargeClient_listMonitorSignals__block_invoke;
  v4[3] = &unk_2645A6328;
  v4[4] = self;
  v4[5] = a2;
  id v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v4];
  [v3 listMonitorSignals];
}

void __46__PowerUISmartChargeClient_listMonitorSignals__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);
  }
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

void __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error obtaining status: %@", v2, v3, v4, v5, v6);
}

- (void)setState:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_22135E000, log, OS_LOG_TYPE_FAULT, "SmartChargeClient setState timed out!", v1, 2u);
}

void __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_2_0();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_22135E000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);
}

void __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_139_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_2_0();
  uint64_t v5 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_22135E000, v6, v7, "%@ Error: %@", v8, v9, v10, v11, v12);
}

void __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error obtaining MCL status: %@", v2, v3, v4, v5, v6);
}

void __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error obtaining recommended limit: %@", v2, v3, v4, v5, v6);
}

void __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error obtaining DEoC status: %@", v2, v3, v4, v5, v6);
}

void __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error obtaining DEoC limit: %@", v2, v3, v4, v5, v6);
}

void __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error obtaining predictions: %@", v2, v3, v4, v5, v6);
}

- (void)setMCMState:(void *)a1 error:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  uint64_t v4 = a1;
  uint64_t v5 = [v3 numberWithUnsignedInteger:a2];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v4, OS_LOG_TYPE_ERROR, "trying to set MCM state: %@", v6, 0xCu);
}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = (const char *)OUTLINED_FUNCTION_2_0();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_22135E000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);
}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_157_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Unable to engage override", v1, 2u);
}

void __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_160_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_2_0();
  uint64_t v5 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_22135E000, v6, v7, "%@ Error: %@", v8, v9, v10, v11, v12);
}

@end