@interface PPTopicReadOnlyServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPTopicReadOnlyServerDelegate)init;
@end

@implementation PPTopicReadOnlyServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F29280];
  id v5 = a4;
  v6 = [v4 interfaceWithProtocol:&unk_1F2584BF8];
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F259E448];
  v8 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E65DA398;
  id v9 = v8;
  id v21 = v9;
  v10 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v18[3] = &unk_1E65DA3C0;
  id v19 = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v16[3] = &unk_1E65DBE30;
  id v17 = v19;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4;
  v14[3] = &unk_1E65DBE30;
  id v15 = v17;
  id v11 = v17;
  BOOL v12 = +[PPXPCServerHelper shouldAcceptConnection:v5 serviceName:@"com.apple.proactive.PersonalizationPortrait.Topic.readOnly" allowedServerInterface:v6 allowedClientInterface:v7 requestHandler:v11 validateConnection:v10 setupClientProxy:v18 interruptionHandler:v16 invalidationHandler:v14];

  return v12;
}

BOOL __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setClientProcessName:a3];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93AC0]), "initWithProcessIdentifier:", objc_msgSend(v6, "processIdentifier"));
  [*(id *)(a1 + 32) setBundleIdResolver:v7];

  BOOL v8 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.Topic.readOnly" connection:v6 serviceName:@"com.apple.proactive.PersonalizationPortrait.Topic.readOnly"];
  return v8;
}

uint64_t __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setRemoteObjectProxy:a2];
}

uint64_t __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

uint64_t __68__PPTopicReadOnlyServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

- (PPTopicReadOnlyServerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPTopicReadOnlyServerDelegate;
  return [(PPTopicReadOnlyServerDelegate *)&v3 init];
}

@end