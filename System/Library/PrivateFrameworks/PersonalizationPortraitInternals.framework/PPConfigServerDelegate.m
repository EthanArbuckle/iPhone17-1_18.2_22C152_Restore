@interface PPConfigServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation PPConfigServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F29280];
  id v5 = a4;
  v6 = [v4 interfaceWithProtocol:&unk_1F25712A0];
  v7 = objc_opt_new();
  BOOL v8 = +[PPXPCServerHelper shouldAcceptConnection:v5 serviceName:@"com.apple.proactive.PersonalizationPortrait.Config" allowedServerInterface:v6 allowedClientInterface:0 requestHandler:v7 validateConnection:&__block_literal_global_2624 setupClientProxy:0 interruptionHandler:&__block_literal_global_69 invalidationHandler:&__block_literal_global_71_2626];

  return v8;
}

BOOL __61__PPConfigServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.Config" connection:a2 serviceName:@"com.apple.proactive.PersonalizationPortrait.Config"];
}

@end