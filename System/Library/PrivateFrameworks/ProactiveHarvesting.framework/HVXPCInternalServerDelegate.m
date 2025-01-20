@interface HVXPCInternalServerDelegate
+ (id)server;
+ (void)start;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation HVXPCInternalServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x263F08D80];
  id v5 = a4;
  v6 = [v4 interfaceWithProtocol:&unk_26DADC298];
  v7 = (void *)MEMORY[0x263F61EC0];
  v8 = objc_opt_new();
  v9 = hv_default_log_handle();
  LOBYTE(v7) = [v7 shouldAcceptConnection:v5 serviceName:@"com.apple.proactive.ProactiveHarvesting.Internal" whitelistedServerInterface:v6 whitelistedClientInterface:0 requestHandler:v8 validateConnection:&__block_literal_global_42 setupClientProxy:0 interruptionHandler:&__block_literal_global_47 invalidationHandler:&__block_literal_global_50_2627 logHandle:v9];

  return (char)v7;
}

void __66__HVXPCInternalServerDelegate_listener_shouldAcceptNewConnection___block_invoke_48()
{
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: invalidated.", v1, 2u);
  }
}

void __66__HVXPCInternalServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2()
{
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "HVXPCInternalService: interrupted.", v1, 2u);
  }
}

uint64_t __66__HVXPCInternalServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F61EC0];
  id v3 = a2;
  v4 = hv_default_log_handle();
  uint64_t v5 = [v2 checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.ProactiveHarvesting.Internal" connection:v3 serviceName:@"com.apple.proactive.ProactiveHarvesting.Internal" logHandle:v4];

  return v5;
}

+ (void)start
{
  v2 = hv_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_226C41000, v2, OS_LOG_TYPE_DEFAULT, "HVXPCInternalServerDelegate: start", v5, 2u);
  }

  id v3 = (void *)MEMORY[0x263F61EB8];
  v4 = +[HVXPCInternalServerDelegate server];
  [v3 registerForService:@"com.apple.proactive.ProactiveHarvesting.Internal" delegate:v4];
}

+ (id)server
{
  if (server__pasOnceToken9 != -1) {
    dispatch_once(&server__pasOnceToken9, &__block_literal_global_37);
  }
  v2 = (void *)server__pasExprOnceResult_2639;

  return v2;
}

void __37__HVXPCInternalServerDelegate_server__block_invoke()
{
  v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)server__pasExprOnceResult_2639;
  server__pasExprOnceResult_2639 = v1;
}

@end