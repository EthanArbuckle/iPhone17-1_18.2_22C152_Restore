@interface PPTemporalClusterServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPTemporalClusterServerDelegate)init;
@end

@implementation PPTemporalClusterServerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v23 = a3;
  id v22 = a4;
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2584DC0];
  v6 = (void *)MEMORY[0x1CB79D060]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  [v5 setClasses:v15 forSelector:sel_rankedTemporalClustersForStartDate_endDate_queryId_ argumentIndex:0 ofReply:0];

  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F259E4E8];
  v17 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  aBlock[3] = &unk_1E65DA398;
  id v18 = v17;
  id v31 = v18;
  v19 = _Block_copy(aBlock);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v28[3] = &unk_1E65DA3C0;
  id v29 = v18;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v26[3] = &unk_1E65DBE30;
  id v27 = v29;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4;
  v24[3] = &unk_1E65DBE30;
  id v25 = v27;
  id v20 = v27;
  LOBYTE(v14) = +[PPXPCServerHelper shouldAcceptConnection:v22 serviceName:@"com.apple.proactive.PersonalizationPortrait.TemporalCluster" allowedServerInterface:v5 allowedClientInterface:v16 requestHandler:v20 validateConnection:v19 setupClientProxy:v28 interruptionHandler:v26 invalidationHandler:v24];

  return v14;
}

BOOL __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 setClientProcessName:a3];
  BOOL v6 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.TemporalCluster" connection:v5 serviceName:@"com.apple.proactive.PersonalizationPortrait.TemporalCluster"];

  return v6;
}

uint64_t __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setRemoteObjectProxy:a2];
}

uint64_t __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

uint64_t __70__PPTemporalClusterServerDelegate_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockPendingQueries];
}

- (PPTemporalClusterServerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPTemporalClusterServerDelegate;
  return [(PPTemporalClusterServerDelegate *)&v3 init];
}

@end