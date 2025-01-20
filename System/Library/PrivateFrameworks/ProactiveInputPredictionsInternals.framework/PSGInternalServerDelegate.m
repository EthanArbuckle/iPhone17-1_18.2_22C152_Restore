@interface PSGInternalServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation PSGInternalServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x263F08D80];
  id v5 = a4;
  v6 = [v4 interfaceWithProtocol:&unk_26F2437B0];
  v7 = (void *)MEMORY[0x263F61EC0];
  v8 = objc_opt_new();
  v9 = psg_default_log_handle();
  LOBYTE(v7) = [v7 shouldAcceptConnection:v5 serviceName:@"com.apple.private.psg.internal" whitelistedServerInterface:v6 whitelistedClientInterface:0 requestHandler:v8 validateConnection:&__block_literal_global_95 setupClientProxy:0 interruptionHandler:&__block_literal_global_7 invalidationHandler:&__block_literal_global_9 logHandle:v9];

  return (char)v7;
}

uint64_t __64__PSGInternalServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F61EC0];
  id v3 = a2;
  v4 = psg_default_log_handle();
  uint64_t v5 = [v2 checkForAndLogTrueBooleanEntitlement:@"com.apple.private.psg.internal" connection:v3 serviceName:@"com.apple.private.psg.internal" logHandle:v4];

  return v5;
}

@end