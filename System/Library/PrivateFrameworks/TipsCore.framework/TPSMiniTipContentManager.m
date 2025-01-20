@interface TPSMiniTipContentManager
- (OS_dispatch_queue)clientQueue;
- (TPSMiniTipContentManager)init;
- (TPSServiceConnection)serviceProxy;
- (id)_actionCompletionOnClientQueue:(id)a3;
- (id)_contentWithContentIDCompletionOnClientQueue:(id)a3;
- (void)_performSyncWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4;
- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6;
- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5;
- (void)invalidate;
- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5;
- (void)restartTrackingForContentIdentifiers:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 synchronous:(BOOL)a6 skipUsageCheck:(BOOL)a7 completionHandler:(id)a8;
@end

@implementation TPSMiniTipContentManager

- (TPSMiniTipContentManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)TPSMiniTipContentManager;
  v2 = [(TPSMiniTipContentManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.tips.TPSMiniTipContentManager", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TPSServiceConnection);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v6;

    v8 = TPSMiniTipContentManagerServiceInterfaceServerInterface();
    [(TPSServiceConnection *)v2->_serviceProxy setRemoteInterfaceInstance:v8];
  }
  return v2;
}

- (void)invalidate
{
}

- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(TPSMiniTipContentManager *)self _contentWithContentIDCompletionOnClientQueue:a6];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke;
  v20[3] = &unk_1E5906950;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5906978;
  id v19 = v24;
  id v14 = v24;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(TPSMiniTipContentManager *)self _performWithProxyHandler:v20 errorHandler:v18];
}

uint64_t __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke(void *a1, void *a2)
{
  return [a2 contentWithContentIdentifiers:a1[4] bundleID:a1[5] context:a1[6] completionHandler:a1[7]];
}

uint64_t __93__TPSMiniTipContentManager_contentWithContentIdentifiers_bundleID_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 synchronous:(BOOL)a6 skipUsageCheck:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke;
  aBlock[3] = &unk_1E59069A0;
  id v18 = v14;
  id v40 = v18;
  id v19 = v15;
  id v41 = v19;
  id v20 = v16;
  id v42 = v20;
  BOOL v44 = a7;
  id v21 = v17;
  id v43 = v21;
  id v22 = _Block_copy(aBlock);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_2;
  v37[3] = &unk_1E5906978;
  id v23 = v21;
  id v38 = v23;
  id v24 = _Block_copy(v37);
  if (v10)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_3;
    v35[3] = &unk_1E59069C8;
    v25 = &v36;
    id v36 = v22;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_4;
    v33[3] = &unk_1E5906978;
    v26 = &v34;
    v34 = v24;
    id v27 = v24;
    [(TPSMiniTipContentManager *)self _performSyncWithProxyHandler:v35 errorHandler:v33];
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_5;
    v31[3] = &unk_1E59069C8;
    v25 = &v32;
    id v32 = v22;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_6;
    v29[3] = &unk_1E5906978;
    v26 = &v30;
    v30 = v24;
    id v28 = v24;
    [(TPSMiniTipContentManager *)self _performWithProxyHandler:v31 errorHandler:v29];
  }
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 validateAndPrepareContentForDisplay:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40) context:*(void *)(a1 + 48) skipUsageCheck:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __126__TPSMiniTipContentManager_validateAndPrepareContentForDisplay_bundleID_context_synchronous_skipUsageCheck_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__TPSMiniTipContentManager_personalizationFailedForContentID_bundleID_context___block_invoke;
  v14[3] = &unk_1E59069F0;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(TPSMiniTipContentManager *)self _performWithProxyHandler:v14 errorHandler:&__block_literal_global_3];
}

uint64_t __79__TPSMiniTipContentManager_personalizationFailedForContentID_bundleID_context___block_invoke(void *a1, void *a2)
{
  return [a2 personalizationFailedForContentID:a1[4] bundleID:a1[5] context:a1[6]];
}

- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__TPSMiniTipContentManager_hintDisplayedForIdentifier_correlationID_context___block_invoke;
  v14[3] = &unk_1E59069F0;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(TPSMiniTipContentManager *)self _performWithProxyHandler:v14 errorHandler:&__block_literal_global_4];
}

uint64_t __77__TPSMiniTipContentManager_hintDisplayedForIdentifier_correlationID_context___block_invoke(void *a1, void *a2)
{
  return [a2 hintDisplayedForIdentifier:a1[4] correlationID:a1[5] context:a1[6]];
}

- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__TPSMiniTipContentManager_hintDismissedForIdentifier_bundleID_context_reason___block_invoke;
  v16[3] = &unk_1E5906A38;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  int64_t v20 = a6;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(TPSMiniTipContentManager *)self _performWithProxyHandler:v16 errorHandler:&__block_literal_global_6];
}

uint64_t __79__TPSMiniTipContentManager_hintDismissedForIdentifier_bundleID_context_reason___block_invoke(void *a1, void *a2)
{
  return [a2 hintDismissedForIdentifier:a1[4] bundleID:a1[5] context:a1[6] reason:a1[7]];
}

- (void)restartTrackingForContentIdentifiers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__TPSMiniTipContentManager_restartTrackingForContentIdentifiers___block_invoke;
  v6[3] = &unk_1E5906A60;
  id v7 = v4;
  id v5 = v4;
  [(TPSMiniTipContentManager *)self _performWithProxyHandler:v6 errorHandler:&__block_literal_global_8];
}

uint64_t __65__TPSMiniTipContentManager_restartTrackingForContentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 restartTrackingForContentIdentifiers:*(void *)(a1 + 32)];
}

- (void)_performSyncWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  id v10 = (void (**)(id, void *))a3;
  serviceProxy = self->_serviceProxy;
  id v7 = a4;
  id v8 = [(TPSServiceConnection *)serviceProxy connection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v7];

  if (v9) {
    v10[2](v10, v9);
  }
}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  id v10 = (void (**)(id, void *))a3;
  serviceProxy = self->_serviceProxy;
  id v7 = a4;
  id v8 = [(TPSServiceConnection *)serviceProxy connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v7];

  if (v9) {
    v10[2](v10, v9);
  }
}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E5906AB0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)[v8 copy];

  return v6;
}

void __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke_2;
  v13[3] = &unk_1E5906A88;
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v17 = a2;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __59__TPSMiniTipContentManager__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

- (id)_contentWithContentIDCompletionOnClientQueue:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E5906B00;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)[v8 copy];

  return v6;
}

void __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E5906AD8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__TPSMiniTipContentManager__contentWithContentIDCompletionOnClientQueue___block_invoke_2(void *a1)
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