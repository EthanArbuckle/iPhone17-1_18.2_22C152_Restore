@interface TPSSearchQueryClient
- (OS_dispatch_queue)clientQueue;
- (TPSSearchQueryClient)init;
- (TPSServiceConnection)serviceProxy;
- (id)_objectCompletionOnClientQueue:(id)a3;
- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)cancelQueryWithIdentifier:(id)a3;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)performQuery:(id)a3 completion:(id)a4;
- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setClientQueue:(id)a3;
- (void)setServiceProxy:(id)a3;
@end

@implementation TPSSearchQueryClient

- (TPSSearchQueryClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)TPSSearchQueryClient;
  v2 = [(TPSSearchQueryClient *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.tips.SearchQueryManager", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TPSServiceConnection);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v6;

    v8 = TPSXPCServerInterface();
    [(TPSServiceConnection *)v2->_serviceProxy setRemoteInterfaceInstance:v8];
  }
  return v2;
}

- (void)performQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(TPSSearchQueryClient *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__TPSSearchQueryClient_performQuery_completion___block_invoke;
  v12[3] = &unk_1E5907298;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__TPSSearchQueryClient_performQuery_completion___block_invoke_2;
  v10[3] = &unk_1E5906978;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(TPSSearchQueryClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __48__TPSSearchQueryClient_performQuery_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 performQuery:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t __48__TPSSearchQueryClient_performQuery_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__TPSSearchQueryClient_cancelQueryWithIdentifier___block_invoke;
  v8[3] = &unk_1E59072C0;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__TPSSearchQueryClient_cancelQueryWithIdentifier___block_invoke_2;
  v6[3] = &unk_1E59077B0;
  id v7 = v9;
  id v5 = v9;
  [(TPSSearchQueryClient *)self _performWithProxyHandler:v8 errorHandler:v6];
}

uint64_t __50__TPSSearchQueryClient_cancelQueryWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelQueryWithIdentifier:*(void *)(a1 + 32)];
}

void __50__TPSSearchQueryClient_cancelQueryWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[TPSLogger search];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19C8DC000, v4, OS_LOG_TYPE_DEFAULT, "cancelQueryWithIdentifier(%@) xpc connection failed: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__TPSSearchQueryClient_reindexAllSearchableItemsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5907270;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__TPSSearchQueryClient_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5906978;
  id v7 = v9;
  id v5 = v9;
  [(TPSSearchQueryClient *)self _performWithProxyHandler:v8 errorHandler:v6];
}

uint64_t __71__TPSSearchQueryClient_reindexAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reindexAllSearchableItemsWithCompletionHandler:*(void *)(a1 + 32)];
}

uint64_t __71__TPSSearchQueryClient_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__TPSSearchQueryClient_reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke;
  v12[3] = &unk_1E5907298;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__TPSSearchQueryClient_reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5906978;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(TPSSearchQueryClient *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __80__TPSSearchQueryClient_reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reindexSearchableItemsWithIdentifiers:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

uint64_t __80__TPSSearchQueryClient_reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__TPSSearchQueryClient_deleteAllSearchableItemsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5907270;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__TPSSearchQueryClient_deleteAllSearchableItemsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5906978;
  id v7 = v9;
  id v5 = v9;
  [(TPSSearchQueryClient *)self _performWithProxyHandler:v8 errorHandler:v6];
}

uint64_t __70__TPSSearchQueryClient_deleteAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deleteAllSearchableItemsWithCompletionHandler:*(void *)(a1 + 32)];
}

uint64_t __70__TPSSearchQueryClient_deleteAllSearchableItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  uint64_t v10 = (void (**)(id, void *))a3;
  serviceProxy = self->_serviceProxy;
  id v7 = a4;
  id v8 = [(TPSServiceConnection *)serviceProxy connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  if (v9) {
    v10[2](v10, v9);
  }
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__TPSSearchQueryClient__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E5907308;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = (void *)[v8 copy];

  return v6;
}

void __55__TPSSearchQueryClient__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TPSSearchQueryClient__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E5906AD8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __55__TPSSearchQueryClient__objectCompletionOnClientQueue___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (TPSServiceConnection)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end