@interface PowerUISmartChargeManagerUnsupported
+ (id)manager;
- (BOOL)isMCLSupported;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (PowerUISmartChargeManagerUnsupported)init;
- (unint64_t)currentChargeLimit;
- (unint64_t)currentRecommendedChargeLimit;
- (void)client:(id)a3 getMCLLimitWithHandler:(id)a4;
- (void)client:(id)a3 setChargingStatus:(BOOL)a4 withHandler:(id)a5;
- (void)client:(id)a3 setDEoCState:(unint64_t)a4 withHandler:(id)a5;
- (void)client:(id)a3 setMCLLimit:(unsigned __int8)a4 withHandler:(id)a5;
- (void)client:(id)a3 setMCMState:(unint64_t)a4 withHandler:(id)a5;
- (void)client:(id)a3 setState:(unint64_t)a4 withHandler:(id)a5;
- (void)currentRecommendedChargeLimitWithHandler:(id)a3;
- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6 withHandler:(id)a7;
- (void)fullChargeDeadlineWithHandler:(id)a3;
- (void)isCECSupportedWithHandler:(id)a3;
- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3;
- (void)isDEoCSupportedWithHandler:(id)a3;
- (void)isMCLCurrentlyEnabledWithHandler:(id)a3;
- (void)isMCLSupportedWithHandler:(id)a3;
- (void)isMCMCurrentlyEnabledWithHandler:(id)a3;
- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3;
- (void)isOBCSupportedWithHandler:(id)a3;
- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3;
- (void)legacy_isOBCEngagedWithHandler:(id)a3;
- (void)powerLogStatusWithHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)shouldMCMBeDisplayedWithHandler:(id)a3;
- (void)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withHandler:(id)a5;
- (void)smartChargingUIStateWithHandler:(id)a3;
- (void)statusWithHandler:(id)a3;
- (void)tmpDisableMCLViaClient:(id)a3 withHandler:(id)a4;
@end

@implementation PowerUISmartChargeManagerUnsupported

- (PowerUISmartChargeManagerUnsupported)init
{
  v7.receiver = self;
  v7.super_class = (Class)PowerUISmartChargeManagerUnsupported;
  v2 = [(PowerUISmartChargeManagerUnsupported *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.powerui.smartChargeManager"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v5 = (void *)*MEMORY[0x263EF8188];
    xpc_activity_register("com.apple.poweruiagent.reportAnalyticsRepeating", (xpc_object_t)*MEMORY[0x263EF8188], &__block_literal_global_2288);
    xpc_activity_register("com.apple.poweruiagent.runOnBoot", v5, &__block_literal_global_2290);
  }
  return v2;
}

void __44__PowerUISmartChargeManagerUnsupported_init__block_invoke()
{
}

void __44__PowerUISmartChargeManagerUnsupported_init__block_invoke_2()
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x263F08D80];
  id v6 = a4;
  objc_super v7 = [v5 interfaceWithProtocol:&unk_26D38F4E0];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
  [v7 setClasses:v14 forSelector:sel_statusWithHandler_ argumentIndex:0 ofReply:1];

  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

+ (id)manager
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)isOBCSupportedWithHandler:(id)a3
{
}

- (void)client:(id)a3 setState:(unint64_t)a4 withHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x263F087E8];
  id v7 = a5;
  id v8 = [v6 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v7, 0, v8);
}

- (void)fullChargeDeadlineWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)legacy_isOBCEngagedWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, void, void, id))a3 + 2))(v5, 0, 0, 0, v6);
}

- (void)smartChargingUIStateWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, uint64_t, uint64_t, void, id))a3 + 2))(v5, 1, 100, 0, v6);
}

- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)powerLogStatusWithHandler:(id)a3
{
}

- (void)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a5;
  id v9 = [v6 distantPast];
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, id, void *))a5 + 2))(v7, v9, v8);
}

- (void)statusWithHandler:(id)a3
{
}

- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3
{
}

- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6 withHandler:(id)a7
{
}

- (void)client:(id)a3 setChargingStatus:(BOOL)a4 withHandler:(id)a5
{
}

- (void)isCECSupportedWithHandler:(id)a3
{
}

- (void)client:(id)a3 setMCMState:(unint64_t)a4 withHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x263F087E8];
  id v7 = a5;
  id v8 = [v6 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v7, 0, v8);
}

- (void)isMCMCurrentlyEnabledWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, uint64_t, id))a3 + 2))(v5, 3, v6);
}

- (void)shouldMCMBeDisplayedWithHandler:(id)a3
{
  v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)isDEoCSupportedWithHandler:(id)a3
{
}

- (void)client:(id)a3 setDEoCState:(unint64_t)a4 withHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x263F087E8];
  id v7 = a5;
  id v8 = [v6 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v7, 0, v8);
}

- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3
{
}

- (unint64_t)currentChargeLimit
{
  return 100;
}

- (void)isMCLSupportedWithHandler:(id)a3
{
}

- (BOOL)isMCLSupported
{
  return 0;
}

- (void)client:(id)a3 setMCLLimit:(unsigned __int8)a4 withHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x263F087E8];
  id v7 = a5;
  id v8 = [v6 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v7, 0, v8);
}

- (void)client:(id)a3 getMCLLimitWithHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)tmpDisableMCLViaClient:(id)a3 withHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 errorWithDomain:@"PowerUISmartChargingErrorDomain" code:4 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)isMCLCurrentlyEnabledWithHandler:(id)a3
{
}

- (unint64_t)currentRecommendedChargeLimit
{
  return 300;
}

- (void)currentRecommendedChargeLimitWithHandler:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end