@interface PLPhotoAnalysisTestService
- (PLPhotoAnalysisTestService)initWithServiceProvider:(id)a3;
- (id)performGetString;
- (unint64_t)performAsyncLongOperationWithReply:(id)a3;
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
@end

@implementation PLPhotoAnalysisTestService

- (void).cxx_destruct
{
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider testService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke;
  v15[3] = &unk_1E58734E8;
  id v16 = v6;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  v11 = [v8 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v13[3] = &unk_1E586F9A0;
  id v14 = v9;
  id v12 = v9;
  [v11 cancelOperationsWithIdentifiers:v10 reply:v13];
}

void __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
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

uint64_t __68__PLPhotoAnalysisTestService_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)performAsyncLongOperationWithReply:(id)a3
{
  id v4 = a3;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&self->_operationID, 1uLL);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", add);
  uint64_t v7 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider testService];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v8 = v4;
  id v15 = v8;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke_2;
  v12[3] = &unk_1E5861D80;
  id v13 = v8;
  id v10 = v8;
  [v9 performLongOperationWithOperationID:v6 reply:v12];

  return add;
}

uint64_t __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__PLPhotoAnalysisTestService_performAsyncLongOperationWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)performGetString
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__194;
  id v14 = __Block_byref_object_dispose__195;
  id v15 = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&self->_operationID, 1uLL);
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", add);
  id v5 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider testService];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_219];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PLPhotoAnalysisTestService_performGetString__block_invoke_2;
  v9[3] = &unk_1E5861DE8;
  v9[4] = &v10;
  [v6 performGetStringWithOperationID:v4 reply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __46__PLPhotoAnalysisTestService_performGetString__block_invoke_2(uint64_t a1, void *a2)
{
}

- (PLPhotoAnalysisTestService)initWithServiceProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisTestService;
  uint64_t v6 = [(PLPhotoAnalysisTestService *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceProvider, a3);
    atomic_store(0, &v7->_operationID);
  }

  return v7;
}

@end