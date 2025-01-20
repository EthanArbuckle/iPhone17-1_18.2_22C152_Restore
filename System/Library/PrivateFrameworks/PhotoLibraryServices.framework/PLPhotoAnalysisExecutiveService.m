@interface PLPhotoAnalysisExecutiveService
- (PLPhotoAnalysisExecutiveService)initWithServiceProvider:(id)a3;
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)performOnDemandTaskWithName:(id)a3 reply:(id)a4;
- (void)performOnDemandTasksForScenario:(id)a3 reply:(id)a4;
- (void)requestActivityStatusWithReply:(id)a3;
- (void)requestAnalysisStatusWithReply:(id)a3;
@end

@implementation PLPhotoAnalysisExecutiveService

- (void).cxx_destruct
{
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider executiveService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke;
  v15[3] = &unk_1E58734E8;
  id v16 = v6;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  v11 = [v8 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v13[3] = &unk_1E586F9A0;
  id v14 = v9;
  id v12 = v9;
  [v11 cancelOperationsWithIdentifiers:v10 reply:v13];
}

void __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__PLPhotoAnalysisExecutiveService_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestActivityStatusWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider executiveService];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke_2;
  v9[3] = &unk_1E5874D98;
  id v10 = v6;
  id v8 = v6;
  [v7 requestActivityStatusWithReply:v9];
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestActivityStatusWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestAnalysisStatusWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider executiveService];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke_2;
  v9[3] = &unk_1E5874D98;
  id v10 = v6;
  id v8 = v6;
  [v7 requestAnalysisStatusWithReply:v9];
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__PLPhotoAnalysisExecutiveService_requestAnalysisStatusWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performOnDemandTasksForScenario:(id)a3 reply:(id)a4
{
  id v6 = a4;
  serviceProvider = self->_serviceProvider;
  id v8 = a3;
  uint64_t v9 = [(PLPhotoAnalysisServiceProvider *)serviceProvider executiveService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke;
  v15[3] = &unk_1E5874D70;
  id v10 = v6;
  id v16 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke_2;
  v13[3] = &unk_1E5874D70;
  id v14 = v10;
  id v12 = v10;
  [v11 performOnDemandTasksForScenario:v8 reply:v13];
}

uint64_t __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisExecutiveService_performOnDemandTasksForScenario_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performOnDemandTaskWithName:(id)a3 reply:(id)a4
{
  id v6 = a4;
  serviceProvider = self->_serviceProvider;
  id v8 = a3;
  uint64_t v9 = [(PLPhotoAnalysisServiceProvider *)serviceProvider executiveService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke;
  v15[3] = &unk_1E5874D70;
  id v10 = v6;
  id v16 = v10;
  long long v11 = [v9 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke_2;
  v13[3] = &unk_1E5874D70;
  id v14 = v10;
  id v12 = v10;
  [v11 performOnDemandTaskWithName:v8 reply:v13];
}

uint64_t __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__PLPhotoAnalysisExecutiveService_performOnDemandTaskWithName_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PLPhotoAnalysisExecutiveService)initWithServiceProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisExecutiveService;
  id v6 = [(PLPhotoAnalysisExecutiveService *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceProvider, a3);
    atomic_store(0, &v7->_operationID);
  }

  return v7;
}

@end