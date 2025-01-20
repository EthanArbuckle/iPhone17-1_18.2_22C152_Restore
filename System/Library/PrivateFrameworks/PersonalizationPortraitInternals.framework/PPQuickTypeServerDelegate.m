@interface PPQuickTypeServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPQuickTypeServerDelegate)init;
@end

@implementation PPQuickTypeServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v21 = a3;
  id v20 = a4;
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2585938];
  context = (void *)MEMORY[0x1CB79D060]();
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v18, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  [v5 setClasses:v15 forSelector:sel_quickTypeItemsWithLanguageModelingTokens_localeIdentifier_recipients_bundleIdentifier_limit_completion_ argumentIndex:0 ofReply:0];

  v16 = objc_opt_new();
  LOBYTE(v15) = +[PPXPCServerHelper shouldAcceptConnection:v20 serviceName:@"com.apple.proactive.PersonalizationPortrait.QuickType" allowedServerInterface:v5 allowedClientInterface:0 requestHandler:v16 validateConnection:&__block_literal_global_16090 setupClientProxy:0 interruptionHandler:&__block_literal_global_86_16106 invalidationHandler:&__block_literal_global_88_16107];

  return (char)v15;
}

BOOL __64__PPQuickTypeServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.QuickType" connection:a2 serviceName:@"com.apple.proactive.PersonalizationPortrait.QuickType"];
}

- (PPQuickTypeServerDelegate)init
{
  v3 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "instantiating PPQuickTypeServerDelegate", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)PPQuickTypeServerDelegate;
  return [(PPQuickTypeServerDelegate *)&v5 init];
}

@end