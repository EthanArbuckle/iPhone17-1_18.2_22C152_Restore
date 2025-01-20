@interface PPLocationReadWriteServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPLocationReadWriteServerDelegate)init;
@end

@implementation PPLocationReadWriteServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2582D08];
  v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  [v7 setClasses:v11 forSelector:sel_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_decayRate_completion_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x1CB79D060]();
  id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
  [v7 setClasses:v15 forSelector:sel_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_decayRate_completion_ argumentIndex:2 ofReply:0];

  v16 = objc_opt_new();
  LOBYTE(v8) = +[PPXPCServerHelper shouldAcceptConnection:v6 serviceName:@"com.apple.proactive.PersonalizationPortrait.Location.readWrite" allowedServerInterface:v7 allowedClientInterface:0 requestHandler:v16 validateConnection:&__block_literal_global_11137 setupClientProxy:0 interruptionHandler:&__block_literal_global_72 invalidationHandler:&__block_literal_global_74];

  return (char)v8;
}

BOOL __72__PPLocationReadWriteServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.Location.readWrite" connection:a2 serviceName:@"com.apple.proactive.PersonalizationPortrait.Location.readWrite"];
}

- (PPLocationReadWriteServerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPLocationReadWriteServerDelegate;
  return [(PPLocationReadWriteServerDelegate *)&v3 init];
}

@end