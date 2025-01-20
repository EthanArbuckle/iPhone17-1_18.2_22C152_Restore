@interface PPEventServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPEventServerDelegate)init;
@end

@implementation PPEventServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2588798];
  v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  [v7 setClasses:v11 forSelector:sel_resolveEventNameRecordChanges_client_queryId_ argumentIndex:0 ofReply:0];

  v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F259E888];
  v13 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E65DA398;
  id v14 = v13;
  id v26 = v14;
  v15 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v23[3] = &unk_1E65DA3C0;
  id v24 = v14;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v21[3] = &unk_1E65DBE30;
  id v22 = v24;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4;
  v19[3] = &unk_1E65DBE30;
  id v20 = v22;
  id v16 = v22;
  BOOL v17 = +[PPXPCServerHelper shouldAcceptConnection:v6 serviceName:@"com.apple.proactive.PersonalizationPortrait.Event" allowedServerInterface:v7 allowedClientInterface:v12 requestHandler:v16 validateConnection:v15 setupClientProxy:v23 interruptionHandler:v21 invalidationHandler:v19];

  return v17;
}

uint64_t __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setRemoteObjectProxy:a2];
}

BOOL __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 setClientProcessName:a3];
  BOOL v6 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.Event" connection:v5 serviceName:@"com.apple.proactive.PersonalizationPortrait.Event"];

  return v6;
}

uint64_t __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

uint64_t __60__PPEventServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

- (PPEventServerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPEventServerDelegate;
  return [(PPEventServerDelegate *)&v3 init];
}

@end