@interface PPNamedEntityReadWriteServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPNamedEntityReadWriteServerDelegate)init;
@end

@implementation PPNamedEntityReadWriteServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F258CD50];
  v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  [v7 setClasses:v11 forSelector:sel_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_completion_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x1CB79D060]();
  id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
  [v7 setClasses:v15 forSelector:sel_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_completion_ argumentIndex:1 ofReply:0];

  v16 = (void *)MEMORY[0x1CB79D060]();
  id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
  [v7 setClasses:v19 forSelector:sel_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_completion_ argumentIndex:1 ofReply:0];

  v20 = (void *)MEMORY[0x1CB79D060]();
  id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
  [v7 setClasses:v23 forSelector:sel_donateLocationNamedEntities_bundleId_groupId_completion_ argumentIndex:0 ofReply:0];

  v24 = objc_opt_new();
  LOBYTE(v20) = +[PPXPCServerHelper shouldAcceptConnection:v6 serviceName:@"com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite" allowedServerInterface:v7 allowedClientInterface:0 requestHandler:v24 validateConnection:&__block_literal_global_24795 setupClientProxy:0 interruptionHandler:&__block_literal_global_96 invalidationHandler:&__block_literal_global_98_24806];

  return (char)v20;
}

BOOL __75__PPNamedEntityReadWriteServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite" connection:a2 serviceName:@"com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite"];
}

- (PPNamedEntityReadWriteServerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityReadWriteServerDelegate;
  return [(PPNamedEntityReadWriteServerDelegate *)&v3 init];
}

@end