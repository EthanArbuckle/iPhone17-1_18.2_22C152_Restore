@interface PLPhotoAnalysisPhotoLibraryService
+ (void)notifyComputeCacheDidLoadForLibrary:(id)a3 reply:(id)a4;
- (PLPhotoAnalysisPhotoLibraryService)initWithServiceProvider:(id)a3;
- (id)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(id)a3 candidateAssetUUIDs:(id)a4 operationID:(id)a5 error:(id *)a6;
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)computeCacheDidLoad:(id)a3;
- (void)curatedAssetsFromAssetUUIDs:(id)a3 options:(id)a4 operationID:(id)a5 reply:(id)a6;
- (void)extendedCuratedAssetsFromAssetUUIDs:(id)a3 options:(id)a4 operationID:(id)a5 reply:(id)a6;
- (void)keyAssetFromAssetUUIDs:(id)a3 inAllAssets:(id)a4 operationID:(id)a5 reply:(id)a6;
- (void)requestPersonalizedSensingRefreshWithReply:(id)a3;
- (void)updateKeyAssetOfSocialGroupsWithUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5;
@end

@implementation PLPhotoAnalysisPhotoLibraryService

- (void).cxx_destruct
{
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider photoLibraryService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PLPhotoAnalysisPhotoLibraryService_cancelOperationsWithIdentifiers_reply___block_invoke;
  v15[3] = &unk_1E58734E8;
  id v16 = v6;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  v11 = [v8 remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PLPhotoAnalysisPhotoLibraryService_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v13[3] = &unk_1E586F9A0;
  id v14 = v9;
  id v12 = v9;
  [v11 cancelOperationsWithIdentifiers:v10 reply:v13];
}

void __76__PLPhotoAnalysisPhotoLibraryService_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
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

uint64_t __76__PLPhotoAnalysisPhotoLibraryService_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPersonalizedSensingRefreshWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider photoLibraryService];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PLPhotoAnalysisPhotoLibraryService_requestPersonalizedSensingRefreshWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PLPhotoAnalysisPhotoLibraryService_requestPersonalizedSensingRefreshWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DE8;
  id v10 = v6;
  id v8 = v6;
  [v7 requestPersonalizedSensingRefreshWithReply:v9];
}

uint64_t __81__PLPhotoAnalysisPhotoLibraryService_requestPersonalizedSensingRefreshWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__PLPhotoAnalysisPhotoLibraryService_requestPersonalizedSensingRefreshWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)computeCacheDidLoad:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider photoLibraryService];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke_2;
  v9[3] = &unk_1E5874D70;
  id v10 = v6;
  id v8 = v6;
  [v7 computeCacheDidLoad:v9];
}

uint64_t __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__PLPhotoAnalysisPhotoLibraryService_computeCacheDidLoad___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)extendedCuratedAssetsFromAssetUUIDs:(id)a3 options:(id)a4 operationID:(id)a5 reply:(id)a6
{
  id v10 = a6;
  serviceProvider = self->_serviceProvider;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(PLPhotoAnalysisServiceProvider *)serviceProvider photoLibraryService];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke;
  v21[3] = &unk_1E5874D70;
  id v16 = v10;
  id v22 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke_2;
  v19[3] = &unk_1E5869480;
  id v20 = v16;
  id v18 = v16;
  [v17 extendedCuratedAssetsFromAssetUUIDs:v14 options:v13 operationID:v12 reply:v19];
}

uint64_t __100__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__PLPhotoAnalysisPhotoLibraryService_extendedCuratedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)curatedAssetsFromAssetUUIDs:(id)a3 options:(id)a4 operationID:(id)a5 reply:(id)a6
{
  id v10 = a6;
  serviceProvider = self->_serviceProvider;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(PLPhotoAnalysisServiceProvider *)serviceProvider photoLibraryService];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke;
  v21[3] = &unk_1E5874D70;
  id v16 = v10;
  id v22 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke_2;
  v19[3] = &unk_1E5869480;
  id v20 = v16;
  id v18 = v16;
  [v17 curatedAssetsFromAssetUUIDs:v14 options:v13 operationID:v12 reply:v19];
}

uint64_t __92__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__PLPhotoAnalysisPhotoLibraryService_curatedAssetsFromAssetUUIDs_options_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)keyAssetFromAssetUUIDs:(id)a3 inAllAssets:(id)a4 operationID:(id)a5 reply:(id)a6
{
  id v10 = a6;
  serviceProvider = self->_serviceProvider;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(PLPhotoAnalysisServiceProvider *)serviceProvider photoLibraryService];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_operationID_reply___block_invoke;
  v21[3] = &unk_1E5874D70;
  id v16 = v10;
  id v22 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_operationID_reply___block_invoke_2;
  v19[3] = &unk_1E5861D80;
  id v20 = v16;
  id v18 = v16;
  [v17 keyAssetFromAssetUUIDs:v14 inAllAssets:v13 operationID:v12 reply:v19];
}

uint64_t __91__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__PLPhotoAnalysisPhotoLibraryService_keyAssetFromAssetUUIDs_inAllAssets_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(id)a3 candidateAssetUUIDs:(id)a4 operationID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__194;
  v29 = __Block_byref_object_dispose__195;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__194;
  v23 = __Block_byref_object_dispose__195;
  id v24 = 0;
  id v13 = [(PLPhotoAnalysisServiceProvider *)self->_serviceProvider photoLibraryService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __117__PLPhotoAnalysisPhotoLibraryService_keyAssetUUIDOfSocialGroupWithPersonUUIDs_candidateAssetUUIDs_operationID_error___block_invoke;
  v18[3] = &unk_1E5874CF8;
  v18[4] = &v19;
  id v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __117__PLPhotoAnalysisPhotoLibraryService_keyAssetUUIDOfSocialGroupWithPersonUUIDs_candidateAssetUUIDs_operationID_error___block_invoke_2;
  v17[3] = &unk_1E5874E10;
  v17[4] = &v25;
  v17[5] = &v19;
  [v14 keyAssetUUIDOfSocialGroupWithPersonUUIDs:v10 candidateAssetUUIDs:v11 operationID:v12 reply:v17];

  if (a6) {
    *a6 = (id) v20[5];
  }
  id v15 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __117__PLPhotoAnalysisPhotoLibraryService_keyAssetUUIDOfSocialGroupWithPersonUUIDs_candidateAssetUUIDs_operationID_error___block_invoke(uint64_t a1, void *a2)
{
}

void __117__PLPhotoAnalysisPhotoLibraryService_keyAssetUUIDOfSocialGroupWithPersonUUIDs_candidateAssetUUIDs_operationID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)updateKeyAssetOfSocialGroupsWithUUIDs:(id)a3 operationID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider photoLibraryService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_operationID_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_operationID_reply___block_invoke_2;
  v16[3] = &unk_1E5874D70;
  id v17 = v13;
  id v15 = v13;
  [v14 updateKeyAssetOfSocialGroupsWithUUIDs:v11 operationID:v10 reply:v16];
}

uint64_t __94__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_operationID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__PLPhotoAnalysisPhotoLibraryService_updateKeyAssetOfSocialGroupsWithUUIDs_operationID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PLPhotoAnalysisPhotoLibraryService)initWithServiceProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisPhotoLibraryService;
  id v6 = [(PLPhotoAnalysisPhotoLibraryService *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceProvider, a3);
  }

  return v7;
}

+ (void)notifyComputeCacheDidLoadForLibrary:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = [a3 photoAnalysisClient];
  uint64_t v7 = [[PLPhotoAnalysisPhotoLibraryService alloc] initWithServiceProvider:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PLPhotoAnalysisPhotoLibraryService_notifyComputeCacheDidLoadForLibrary_reply___block_invoke;
  v9[3] = &unk_1E5874D70;
  id v10 = v5;
  id v8 = v5;
  [(PLPhotoAnalysisPhotoLibraryService *)v7 computeCacheDidLoad:v9];
}

uint64_t __80__PLPhotoAnalysisPhotoLibraryService_notifyComputeCacheDidLoadForLibrary_reply___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

@end