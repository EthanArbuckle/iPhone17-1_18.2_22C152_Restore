@interface PSGInputSuggesterServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation PSGInputSuggesterServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F242A00];
  v8 = (void *)MEMORY[0x23ED0AB80]();
  id v9 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  [v7 setClasses:v11 forSelector:sel_logImpression_request_ argumentIndex:0 ofReply:0];

  v12 = (void *)MEMORY[0x23ED0AB80]();
  v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v7 setClasses:v13 forSelector:sel_logImpression_request_ argumentIndex:1 ofReply:0];

  v14 = (void *)MEMORY[0x23ED0AB80]();
  id v15 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  [v7 setClasses:v17 forSelector:sel_logEngagement_request_position_ argumentIndex:0 ofReply:0];

  v18 = (void *)MEMORY[0x23ED0AB80]();
  v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v7 setClasses:v19 forSelector:sel_logEngagement_request_position_ argumentIndex:1 ofReply:0];

  v20 = (void *)MEMORY[0x263F61EC0];
  v21 = objc_opt_new();
  v22 = psg_default_log_handle();
  LOBYTE(v20) = [v20 shouldAcceptConnection:v6 serviceName:@"com.apple.proactive.input.suggester" whitelistedServerInterface:v7 whitelistedClientInterface:0 requestHandler:v21 validateConnection:&__block_literal_global setupClientProxy:0 interruptionHandler:&__block_literal_global_35 invalidationHandler:&__block_literal_global_37 logHandle:v22];

  return (char)v20;
}

uint64_t __70__PSGInputSuggesterServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F61EC0];
  id v3 = a2;
  v4 = psg_default_log_handle();
  uint64_t v5 = [v2 checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.input.suggester" connection:v3 serviceName:@"com.apple.proactive.input.suggester" logHandle:v4];

  return v5;
}

@end