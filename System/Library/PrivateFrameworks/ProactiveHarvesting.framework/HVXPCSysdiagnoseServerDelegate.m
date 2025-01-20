@interface HVXPCSysdiagnoseServerDelegate
+ (id)server;
+ (void)start;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation HVXPCSysdiagnoseServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x263F08D80];
  id v5 = a4;
  v6 = [v4 interfaceWithProtocol:&unk_26DAD0E50];
  v7 = (void *)MEMORY[0x263F61EC0];
  v8 = objc_opt_new();
  v9 = hv_default_log_handle();
  LOBYTE(v7) = [v7 shouldAcceptConnection:v5 serviceName:@"com.apple.proactive.ProactiveHarvesting.Sysdiagnose" whitelistedServerInterface:v6 whitelistedClientInterface:0 requestHandler:v8 validateConnection:&__block_literal_global_11 setupClientProxy:0 interruptionHandler:&__block_literal_global_16 invalidationHandler:&__block_literal_global_19 logHandle:v9];

  return (char)v7;
}

void __69__HVXPCSysdiagnoseServerDelegate_listener_shouldAcceptNewConnection___block_invoke_17()
{
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseService: invalidated.", v1, 2u);
  }
}

void __69__HVXPCSysdiagnoseServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2()
{
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseService: interrupted.", v1, 2u);
  }
}

uint64_t __69__HVXPCSysdiagnoseServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F61EC0];
  id v3 = a2;
  v4 = hv_default_log_handle();
  uint64_t v5 = [v2 checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.ProactiveHarvesting.Sysdiagnose" connection:v3 serviceName:@"com.apple.proactive.ProactiveHarvesting.Sysdiagnose" logHandle:v4];

  return v5;
}

+ (void)start
{
  v2 = hv_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_226C41000, v2, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseServerDelegate: start", v5, 2u);
  }

  id v3 = (void *)MEMORY[0x263F61EB8];
  v4 = +[HVXPCSysdiagnoseServerDelegate server];
  [v3 registerForService:@"com.apple.proactive.ProactiveHarvesting.Sysdiagnose" delegate:v4];
}

+ (id)server
{
  if (server__pasOnceToken4 != -1) {
    dispatch_once(&server__pasOnceToken4, &__block_literal_global_73);
  }
  v2 = (void *)server__pasExprOnceResult;

  return v2;
}

void __40__HVXPCSysdiagnoseServerDelegate_server__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)server__pasExprOnceResult;
  server__pasExprOnceResult = v1;
}

@end