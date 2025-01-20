@interface PREResponsesServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation PREResponsesServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E8AF9F8];
  v7 = (void *)MEMORY[0x237DE1ED0]();
  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  [v6 setClasses:v10 forSelector:sel_preResponseItemsForMessage_maximumResponses_conversationTurns_context_time_language_recipientHandles_modelFilePath_modelConfigPath_espressoBinFilePath_vocabFilePath_registerDisplayed_includeCustomResponses_includeResponsesToRobots_completion_ argumentIndex:2 ofReply:0];

  v11 = (void *)MEMORY[0x237DE1ED0]();
  id v12 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  [v6 setClasses:v14 forSelector:sel_preResponseItemsForMessage_maximumResponses_conversationTurns_context_time_language_recipientHandles_modelFilePath_modelConfigPath_espressoBinFilePath_vocabFilePath_registerDisplayed_includeCustomResponses_includeResponsesToRobots_completion_ argumentIndex:6 ofReply:0];

  v15 = (void *)MEMORY[0x237DE1ED0]();
  id v16 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  [v6 setClasses:v18 forSelector:sel_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion_ argumentIndex:1 ofReply:0];

  v19 = (void *)MEMORY[0x237DE1ED0]();
  id v20 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  [v6 setClasses:v22 forSelector:sel_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion_ argumentIndex:6 ofReply:0];

  v23 = objc_opt_new();
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v31[3] = &unk_264C5C6B0;
  id v24 = v23;
  id v32 = v24;
  v25 = (void *)MEMORY[0x237DE2090](v31);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke_32;
  v29[3] = &unk_264C5C6D8;
  id v30 = v24;
  id v26 = v24;
  LOBYTE(v22) = +[PREXPCServerHelper shouldAcceptConnection:v5 serviceName:@"com.apple.proactive.experiments.responses" whitelistedServerInterface:v6 requestHandler:v26 validateConnection:v25 setupClientProxy:v29 interruptionHandler:&__block_literal_global invalidationHandler:&__block_literal_global_36];

  return (char)v22;
}

BOOL __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setClientProcessName:v6];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263F61E10]), "initWithProcessIdentifier:", objc_msgSend(v5, "processIdentifier"));
  [*(id *)(a1 + 32) setBundleIdResolver:v7];

  BOOL v8 = +[PREXPCServerHelper hasTrueBooleanEntitlement:@"com.apple.proactive.experiments.responses" connection:v5];
  if (!v8)
  {
    uint64_t v9 = [v6 length];
    v10 = pre_sv_xpc_handle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v11)
      {
        int v19 = 138412546;
        *(void *)id v20 = v6;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = @"com.apple.proactive.experiments.responses";
        id v12 = "Rejecting connection from %@ to %@ due to missing entitlement";
        uint64_t v13 = v10;
        uint32_t v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_235566000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v19, v14);
      }
    }
    else if (v11)
    {
      int v16 = [v5 processIdentifier];
      uint64_t v17 = __error();
      v18 = strerror(*v17);
      int v19 = 67109634;
      *(_DWORD *)id v20 = v16;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = @"com.apple.proactive.experiments.responses";
      *(_WORD *)&v20[14] = 2080;
      *(void *)&v20[16] = v18;
      id v12 = "Rejecting connection from %d to %@ due to failed entitlement check (error: %s)";
      uint64_t v13 = v10;
      uint32_t v14 = 28;
      goto LABEL_9;
    }
  }
  return v8;
}

uint64_t __65__PREResponsesServerDelegate_listener_shouldAcceptNewConnection___block_invoke_32(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setRemoteObjectProxy:a2];
}

@end