@interface TILinguisticAssetDownloadClient
+ (id)_dispatchQueue;
+ (id)_internalAssertionRequestHandlerForHandler:(id)a3 connection:(id)a4;
+ (id)_internalFetchAssetUpdateStatusRequestHandler:(id)a3 connection:(id)a4;
+ (id)_internalHandlerForHandler:(id)a3 connection:(id)a4;
+ (id)_internalUpdateAssetRequestHandler:(id)a3 connection:(id)a4;
- (id)_newXPCConnection;
- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7;
- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5;
- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4;
@end

@implementation TILinguisticAssetDownloadClient

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[TILinguisticAssetDownloadClient _dispatchQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke;
  v11[3] = &unk_1E5559920;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  TIDispatchAsync(v8, v11);
}

void __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _newXPCConnection];
  v3 = +[TILinguisticAssetDownloadClient _internalUpdateAssetRequestHandler:*(void *)(a1 + 48) connection:v2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke_2;
  v7[3] = &unk_1E55599D8;
  id v4 = v3;
  id v8 = v4;
  v5 = [v2 remoteObjectProxyWithErrorHandler:v7];
  id v6 = v5;
  if (v5) {
    [v5 updateAssetForInputModeIdentifier:*(void *)(a1 + 40) callback:v4];
  }
}

uint64_t __78__TILinguisticAssetDownloadClient_updateAssetForInputModeIdentifier_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TILinguisticAssetDownloadClient _dispatchQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke;
  v11[3] = &unk_1E5559920;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  TIDispatchAsync(v8, v11);
}

void __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _newXPCConnection];
  v3 = +[TILinguisticAssetDownloadClient _internalFetchAssetUpdateStatusRequestHandler:*(void *)(a1 + 48) connection:v2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2;
  v7[3] = &unk_1E55599D8;
  id v4 = v3;
  id v8 = v4;
  v5 = [v2 remoteObjectProxyWithErrorHandler:v7];
  id v6 = v5;
  if (v5) {
    [v5 fetchAssetUpdateStatusForInputModeIdentifier:*(void *)(a1 + 40) callback:v4];
  }
}

uint64_t __89__TILinguisticAssetDownloadClient_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[TILinguisticAssetDownloadClient _dispatchQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke;
  v15[3] = &unk_1E5559708;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  TIDispatchAsync(v11, v15);
}

void __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _newXPCConnection];
  v3 = +[TILinguisticAssetDownloadClient _internalAssertionRequestHandlerForHandler:*(void *)(a1 + 56) connection:v2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke_2;
  v7[3] = &unk_1E55599D8;
  id v4 = v3;
  id v8 = v4;
  v5 = [v2 remoteObjectProxyWithErrorHandler:v7];
  id v6 = v5;
  if (v5) {
    [v5 removeLinguisticAssetsAssertionWithIdentifier:*(void *)(a1 + 40) forClientID:*(void *)(a1 + 48) withHandler:v4];
  }
  else {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __105__TILinguisticAssetDownloadClient_removeLinguisticAssetsAssertionWithIdentifier_forClientID_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[TILinguisticAssetDownloadClient _dispatchQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke;
  v23[3] = &unk_1E55596E0;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v16;
  TIDispatchAsync(v17, v23);
}

void __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _newXPCConnection];
  v3 = +[TILinguisticAssetDownloadClient _internalAssertionRequestHandlerForHandler:*(void *)(a1 + 72) connection:v2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke_2;
  v7[3] = &unk_1E55599D8;
  id v4 = v3;
  id v8 = v4;
  v5 = [v2 remoteObjectProxyWithErrorHandler:v7];
  id v6 = v5;
  if (v5) {
    [v5 addLinguisticAssetsAssertionForLanguage:*(void *)(a1 + 40) assertionID:*(void *)(a1 + 48) region:*(void *)(a1 + 56) clientID:*(void *)(a1 + 64) withHandler:v4];
  }
  else {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __115__TILinguisticAssetDownloadClient_addLinguisticAssetsAssertionForLanguage_assertionID_region_clientID_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[TILinguisticAssetDownloadClient _dispatchQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke;
    v9[3] = &unk_1E5559920;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    TIDispatchAsync(v8, v9);
  }
}

void __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _newXPCConnection];
  v3 = +[TILinguisticAssetDownloadClient _internalHandlerForHandler:*(void *)(a1 + 48) connection:v2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_2;
  v9[3] = &unk_1E55599D8;
  id v4 = v3;
  id v10 = v4;
  v5 = [v2 remoteObjectProxyWithErrorHandler:v9];
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_3;
    v7[3] = &unk_1E55596B8;
    id v8 = v4;
    [v5 requestLinguisticAssetsForLanguage:v6 completion:v7];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, -1, 0);
  }
}

uint64_t __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__TILinguisticAssetDownloadClient_requestLinguisticAssetsForLanguage_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_newXPCConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput.rdt" options:4096];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC45A60];
  [v2 setRemoteObjectInterface:v3];

  id v4 = +[TILinguisticAssetDownloadClient _dispatchQueue];
  [v2 _setQueue:v4];

  [v2 resume];
  return v2;
}

+ (id)_internalUpdateAssetRequestHandler:(id)a3 connection:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__TILinguisticAssetDownloadClient__internalUpdateAssetRequestHandler_connection___block_invoke;
  v10[3] = &unk_1E5559690;
  id v11 = v5;
  id v6 = v5;
  objc_copyWeak(&v12, &location);
  id v7 = (void *)MEMORY[0x192F9B5E0](v10);
  id v8 = (void *)[v7 copy];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __81__TILinguisticAssetDownloadClient__internalUpdateAssetRequestHandler_connection___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

+ (id)_internalFetchAssetUpdateStatusRequestHandler:(id)a3 connection:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__TILinguisticAssetDownloadClient__internalFetchAssetUpdateStatusRequestHandler_connection___block_invoke;
  v10[3] = &unk_1E5559640;
  id v11 = v5;
  id v6 = v5;
  objc_copyWeak(&v12, &location);
  id v7 = (void *)MEMORY[0x192F9B5E0](v10);
  id v8 = (void *)[v7 copy];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __92__TILinguisticAssetDownloadClient__internalFetchAssetUpdateStatusRequestHandler_connection___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

+ (id)_internalAssertionRequestHandlerForHandler:(id)a3 connection:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__TILinguisticAssetDownloadClient__internalAssertionRequestHandlerForHandler_connection___block_invoke;
  v10[3] = &unk_1E5559668;
  id v11 = v5;
  id v6 = v5;
  objc_copyWeak(&v12, &location);
  id v7 = (void *)MEMORY[0x192F9B5E0](v10);
  id v8 = (void *)[v7 copy];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __89__TILinguisticAssetDownloadClient__internalAssertionRequestHandlerForHandler_connection___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

+ (id)_internalHandlerForHandler:(id)a3 connection:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, a4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__TILinguisticAssetDownloadClient__internalHandlerForHandler_connection___block_invoke;
  v10[3] = &unk_1E5559640;
  id v11 = v5;
  id v6 = v5;
  objc_copyWeak(&v12, &location);
  id v7 = (void *)MEMORY[0x192F9B5E0](v10);
  id v8 = (void *)[v7 copy];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __73__TILinguisticAssetDownloadClient__internalHandlerForHandler_connection___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

+ (id)_dispatchQueue
{
  if (_dispatchQueue_onceToken != -1) {
    dispatch_once(&_dispatchQueue_onceToken, &__block_literal_global_6558);
  }
  v2 = (void *)_dispatchQueue_queue;

  return v2;
}

void __49__TILinguisticAssetDownloadClient__dispatchQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.linguistic-asset-download-client", v2);
  v1 = (void *)_dispatchQueue_queue;
  _dispatchQueue_queue = (uint64_t)v0;
}

@end