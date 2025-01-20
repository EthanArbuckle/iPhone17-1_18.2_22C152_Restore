@interface PPSocialHighlightServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPSocialHighlightServerDelegate)init;
@end

@implementation PPSocialHighlightServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v26 = a3;
  id v5 = a4;
  BOOL v6 = +[PPXPCServerHelper hasTrueBooleanEntitlement:@"com.apple.private.sociallayer.highlights" connection:v5];
  BOOL v25 = +[PPXPCServerHelper hasTrueBooleanEntitlement:@"com.apple.developer.shared-with-you" connection:v5];
  BOOL v7 = +[PPXPCServerHelper hasTrueBooleanEntitlement:@"com.apple.developer.shared-with-you.collaboration" connection:v5];
  v8 = &protocolRef_PPSocialHighlightInternalServerProtocol;
  if (!v6) {
    v8 = &protocolRef_PPSocialHighlightServerProtocol;
  }
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:*v8];
  v10 = (void *)MEMORY[0x1CB79D060]();
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  [v9 setClasses:v13 forSelector:sel_rankedHighlightsWithLimit_client_variant_queryId_ argumentIndex:0 ofReply:0];

  v14 = (void *)MEMORY[0x1CB79D060]();
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  [v9 setClasses:v17 forSelector:sel_rankedHighlightsForSyncedItems_client_variant_queryId_ argumentIndex:0 ofReply:0];

  v18 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F259E260];
  v19 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E65D41A0;
  id v20 = v19;
  id v34 = v20;
  BOOL v35 = v6;
  BOOL v36 = v25;
  BOOL v37 = v7;
  v21 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_147;
  v31[3] = &unk_1E65DA3C0;
  id v32 = v20;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v29[3] = &unk_1E65DBE30;
  id v30 = v32;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v27[3] = &unk_1E65DBE30;
  id v28 = v30;
  id v22 = v30;
  BOOL v23 = +[PPXPCServerHelper shouldAcceptConnection:v5 serviceName:@"com.apple.proactive.PersonalizationPortrait.SocialHighlight" allowedServerInterface:v9 allowedClientInterface:v18 requestHandler:v22 validateConnection:v21 setupClientProxy:v31 interruptionHandler:v29 invalidationHandler:v27];

  return v23;
}

BOOL __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [*(id *)(a1 + 32) setClientProcessName:a3];
  BOOL v6 = objc_opt_new();
  BOOL v7 = (void *)MEMORY[0x1E4F223F8];
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  v8 = [v7 bundleRecordForAuditToken:&v18 error:0];
  v9 = [v8 applicationIdentifier];

  if (v9)
  {
    v10 = [v8 applicationIdentifier];
    [v6 addObject:v10];
  }
  id v11 = objc_msgSend(v5, "valueForEntitlement:", @"com.apple.private.interstellar.data-access", v18, v19);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 addObject:v11];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 addObjectsFromArray:v11];
    }
  }
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v12 = @"com.apple.private.sociallayer.highlights";
    [v6 addObject:@"com.apple.private.sociallayer.highlights"];
    BOOL v13 = 0;
  }
  else if (*(unsigned char *)(a1 + 41))
  {
    BOOL v13 = 0;
    uint64_t v12 = @"com.apple.developer.shared-with-you";
  }
  else
  {
    BOOL v13 = *(unsigned char *)(a1 + 42) == 0;
    if (*(unsigned char *)(a1 + 42)) {
      uint64_t v12 = @"com.apple.developer.shared-with-you.collaboration";
    }
    else {
      uint64_t v12 = 0;
    }
  }
  [*(id *)(a1 + 32) setApplicationIdentifiers:v6];
  v14 = pp_xpc_server_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [*(id *)(a1 + 32) applicationIdentifiers];
    *(_DWORD *)buf = 138412290;
    v21 = v15;
    _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_INFO, "PPSocialHighlightServer: validateConnection applicationIdentifiers: %@", buf, 0xCu);
  }
  BOOL v16 = !v13
     && +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:v12 connection:v5 serviceName:@"com.apple.proactive.PersonalizationPortrait.SocialHighlight"];

  return v16;
}

uint64_t __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_147(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setRemoteObjectProxy:a2];
}

uint64_t __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

uint64_t __70__PPSocialHighlightServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

- (PPSocialHighlightServerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPSocialHighlightServerDelegate;
  return [(PPSocialHighlightServerDelegate *)&v3 init];
}

@end