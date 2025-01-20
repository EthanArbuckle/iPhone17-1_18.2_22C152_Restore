@interface PPInternalServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation PPInternalServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F29280];
  id v5 = a4;
  v6 = [v4 interfaceWithProtocol:&unk_1F25883B0];
  v7 = objc_opt_new();
  BOOL v8 = +[PPXPCServerHelper shouldAcceptConnection:v5 serviceName:@"com.apple.proactive.PersonalizationPortrait.Internal" allowedServerInterface:v6 allowedClientInterface:0 requestHandler:v7 validateConnection:&__block_literal_global_19646 setupClientProxy:0 interruptionHandler:&__block_literal_global_85 invalidationHandler:&__block_literal_global_87_19650];

  return v8;
}

BOOL __63__PPInternalServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.Internal" connection:a2 serviceName:@"com.apple.proactive.PersonalizationPortrait.Internal"];
}

@end