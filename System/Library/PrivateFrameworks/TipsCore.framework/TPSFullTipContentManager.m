@interface TPSFullTipContentManager
- (OS_dispatch_queue)clientQueue;
- (TPSFullTipContentManager)init;
- (TPSServiceConnection)serviceProxy;
- (id)_objectCompletionOnClientQueue:(id)a3;
- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)contentForVariant:(id)a3 completionHandler:(id)a4;
- (void)contentWithCompletionHandler:(id)a3;
- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)markTipViewed:(id)a3;
- (void)removeNotificationForIdentifier:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)tipsAppActive;
- (void)userGuideMapWithCompletionHandler:(id)a3;
@end

@implementation TPSFullTipContentManager

- (TPSFullTipContentManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)TPSFullTipContentManager;
  v2 = [(TPSFullTipContentManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.tips.TPSFullTipContentManager", v3);
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

- (void)contentWithCompletionHandler:(id)a3
{
  dispatch_queue_t v4 = [(TPSFullTipContentManager *)self _objectCompletionOnClientQueue:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5907270;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5906978;
  id v7 = v9;
  id v5 = v9;
  [(TPSFullTipContentManager *)self _performWithProxyHandler:v8 errorHandler:v6];
}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  objc_super v10 = (void (**)(id, void *))a3;
  serviceProxy = self->_serviceProxy;
  id v7 = a4;
  v8 = [(TPSServiceConnection *)serviceProxy connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  if (v9) {
    v10[2](v10, v9);
  }
}

uint64_t __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentWithCompletionHandler:*(void *)(a1 + 32)];
}

uint64_t __41__TPSFullTipContentManager_tipsAppActive__block_invoke(uint64_t a1, void *a2)
{
  return [a2 tipsAppActive];
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E5907308;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)[v8 copy];

  return v6;
}

- (void)tipsAppActive
{
}

uint64_t __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E5906AD8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)invalidate
{
}

uint64_t __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contentForVariant:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = [(TPSFullTipContentManager *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke;
  v12[3] = &unk_1E5907298;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5906978;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(TPSFullTipContentManager *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentForVariant:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

uint64_t __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = [(TPSFullTipContentManager *)self _objectCompletionOnClientQueue:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_1E5907298;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5906978;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(TPSFullTipContentManager *)self _performWithProxyHandler:v12 errorHandler:v10];
}

uint64_t __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fetchAssetsWithAssetsConfiguration:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

uint64_t __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markTipViewed:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__TPSFullTipContentManager_markTipViewed___block_invoke;
    v6[3] = &unk_1E59072C0;
    id v7 = v4;
    [(TPSFullTipContentManager *)self _performWithProxyHandler:v6 errorHandler:&__block_literal_global_9];
  }
}

uint64_t __42__TPSFullTipContentManager_markTipViewed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentViewedForIdentifier:*(void *)(a1 + 32)];
}

void __42__TPSFullTipContentManager_markTipViewed___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "markTipViewed xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)removeNotificationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__TPSFullTipContentManager_removeNotificationForIdentifier___block_invoke;
    v6[3] = &unk_1E59072C0;
    id v7 = v4;
    [(TPSFullTipContentManager *)self _performWithProxyHandler:v6 errorHandler:&__block_literal_global_5];
  }
}

uint64_t __60__TPSFullTipContentManager_removeNotificationForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeNotificationForIdentifier:*(void *)(a1 + 32)];
}

void __60__TPSFullTipContentManager_removeNotificationForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "markTipViewed xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __41__TPSFullTipContentManager_tipsAppActive__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "tipsAppActive xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)userGuideMapWithCompletionHandler:(id)a3
{
  int v4 = [(TPSFullTipContentManager *)self _objectCompletionOnClientQueue:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5907270;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5906978;
  id v7 = v9;
  id v5 = v9;
  [(TPSFullTipContentManager *)self _performWithProxyHandler:v8 errorHandler:v6];
}

uint64_t __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userGuideMapWithCompletionHandler:*(void *)(a1 + 32)];
}

uint64_t __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (TPSServiceConnection)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
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