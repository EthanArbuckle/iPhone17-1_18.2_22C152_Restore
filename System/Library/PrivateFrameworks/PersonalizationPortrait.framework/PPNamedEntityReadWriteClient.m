@interface PPNamedEntityReadWriteClient
+ (id)sharedInstance;
- (BOOL)_doDeletionSyncCallWithError:(id *)a3 deletedCount:(unint64_t *)a4 syncCall:(id)a5;
- (BOOL)_doSyncCallWithError:(id *)a3 syncCall:(id)a4;
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)cloudSyncWithError:(id *)a3;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6;
- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5;
- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8;
- (BOOL)flushDonationsWithError:(id *)a3;
- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4;
- (BOOL)removeMapItemsBeforeDate:(id)a3 error:(id *)a4;
- (PPNamedEntityReadWriteClient)init;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
@end

@implementation PPNamedEntityReadWriteClient

- (void).cxx_destruct
{
}

- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__PPNamedEntityReadWriteClient_donateLocationNamedEntities_bundleId_groupId_error___block_invoke;
  v17[3] = &unk_1E550EC08;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  LOBYTE(a6) = [(PPNamedEntityReadWriteClient *)self _doSyncCallWithError:a6 syncCall:v17];

  return (char)a6;
}

uint64_t __83__PPNamedEntityReadWriteClient_donateLocationNamedEntities_bundleId_groupId_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  return [a2 donateLocationNamedEntities:a1[4] bundleId:a1[5] groupId:a1[6] completion:a3];
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return [(PPNamedEntityReadWriteClient *)self _doDeletionSyncCallWithError:a3 deletedCount:a4 syncCall:&__block_literal_global_97];
}

uint64_t __60__PPNamedEntityReadWriteClient_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearWithCompletion:");
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  return [(PPNamedEntityReadWriteClient *)self _doSyncCallWithError:a3 syncCall:&__block_literal_global_95];
}

uint64_t __51__PPNamedEntityReadWriteClient_cloudSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncWithCompletion:");
}

- (BOOL)removeMapItemsBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PPNamedEntityReadWriteClient_removeMapItemsBeforeDate_error___block_invoke;
  v9[3] = &unk_1E550EBA0;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(PPNamedEntityReadWriteClient *)self _doSyncCallWithError:a4 syncCall:v9];

  return (char)a4;
}

uint64_t __63__PPNamedEntityReadWriteClient_removeMapItemsBeforeDate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 removeMapItemsBeforeCutoffDate:*(void *)(a1 + 32) completion:a3];
}

- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PPNamedEntityReadWriteClient_removeMapItemForPlaceName_error___block_invoke;
  v9[3] = &unk_1E550EBA0;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(PPNamedEntityReadWriteClient *)self _doSyncCallWithError:a4 syncCall:v9];

  return (char)a4;
}

uint64_t __64__PPNamedEntityReadWriteClient_removeMapItemForPlaceName_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 removeMapItemForPlaceName:*(void *)(a1 + 32) completion:a3];
}

- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PPNamedEntityReadWriteClient_donateMapItem_forPlaceName_error___block_invoke;
  v13[3] = &unk_1E550EB78;
  id v14 = v8;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  LOBYTE(a5) = [(PPNamedEntityReadWriteClient *)self _doSyncCallWithError:a5 syncCall:v13];

  return (char)a5;
}

uint64_t __65__PPNamedEntityReadWriteClient_donateMapItem_forPlaceName_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 donateMapItem:*(void *)(a1 + 32) forPlaceName:*(void *)(a1 + 40) completion:a3];
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __119__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_groupId_olderThanDate_deletedCount_error___block_invoke;
  v19[3] = &unk_1E550EB50;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  LOBYTE(a7) = [(PPNamedEntityReadWriteClient *)self _doDeletionSyncCallWithError:a7 deletedCount:a6 syncCall:v19];

  return (char)a7;
}

uint64_t __119__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_groupId_olderThanDate_deletedCount_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  return [a2 deleteAllNamedEntitiesFromSourcesWithBundleId:a1[4] groupId:a1[5] olderThanDate:a1[6] completion:a3];
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_deletedCount_error___block_invoke;
  v11[3] = &unk_1E550EB28;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a5) = [(PPNamedEntityReadWriteClient *)self _doDeletionSyncCallWithError:a5 deletedCount:a4 syncCall:v11];

  return (char)a5;
}

uint64_t __97__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_deletedCount_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 deleteAllNamedEntitiesFromSourcesWithBundleId:*(void *)(a1 + 32) completion:a3];
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_deletedCount_error___block_invoke;
  v15[3] = &unk_1E550EB00;
  id v16 = v10;
  id v17 = v11;
  id v12 = v11;
  id v13 = v10;
  LOBYTE(a6) = [(PPNamedEntityReadWriteClient *)self _doDeletionSyncCallWithError:a6 deletedCount:a5 syncCall:v15];

  return (char)a6;
}

uint64_t __106__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_deletedCount_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 deleteAllNamedEntitiesFromSourcesWithBundleId:*(void *)(a1 + 32) groupIds:*(void *)(a1 + 40) completion:a3];
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_deletedCount_error___block_invoke;
  v15[3] = &unk_1E550EB00;
  id v16 = v10;
  id v17 = v11;
  id v12 = v11;
  id v13 = v10;
  LOBYTE(a6) = [(PPNamedEntityReadWriteClient *)self _doDeletionSyncCallWithError:a6 deletedCount:a5 syncCall:v15];

  return (char)a6;
}

uint64_t __109__PPNamedEntityReadWriteClient_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_deletedCount_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 deleteAllNamedEntitiesFromSourcesWithBundleId:*(void *)(a1 + 32) documentIds:*(void *)(a1 + 40) completion:a3];
}

- (BOOL)flushDonationsWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__5445;
  id v14 = __Block_byref_object_dispose__5446;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PPNamedEntityReadWriteClient_flushDonationsWithError___block_invoke;
  v9[3] = &unk_1E550F638;
  void v9[4] = &v10;
  v5 = (void *)MEMORY[0x192F975A0](v9, a2);
  id v6 = [(PPNamedEntityReadWriteClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  [v6 flushDonationsWithCompletion:&__block_literal_global_92];

  id v7 = (void *)v11[5];
  if (a3 && v7) {
    *a3 = v7;
  }

  _Block_object_dispose(&v10, 8);
  return v7 == 0;
}

void __56__PPNamedEntityReadWriteClient_flushDonationsWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__PPNamedEntityReadWriteClient_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke;
  v19[3] = &unk_1E550EAD8;
  id v20 = v14;
  id v21 = v15;
  unint64_t v22 = a5;
  BOOL v24 = a6;
  double v23 = a7;
  id v16 = v15;
  id v17 = v14;
  LOBYTE(a8) = [(PPNamedEntityReadWriteClient *)self _doSyncCallWithError:a8 syncCall:v19];

  return (char)a8;
}

uint64_t __100__PPNamedEntityReadWriteClient_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 donateNamedEntities:*(void *)(a1 + 32) source:*(void *)(a1 + 40) algorithm:*(void *)(a1 + 48) cloudSync:*(unsigned __int8 *)(a1 + 64) sentimentScore:a3 completion:*(double *)(a1 + 56)];
}

- (BOOL)_doDeletionSyncCallWithError:(id *)a3 deletedCount:(unint64_t *)a4 syncCall:(id)a5
{
  id v8 = (void (**)(id, void *, void *))a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5445;
  v35 = __Block_byref_object_dispose__5446;
  id v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __83__PPNamedEntityReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke;
  v30[3] = &unk_1E550F638;
  v30[4] = &v31;
  id v9 = (void *)MEMORY[0x192F975A0](v30);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy__5445;
  BOOL v24 = __Block_byref_object_dispose__5446;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PPNamedEntityReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2;
  v15[3] = &unk_1E550F688;
  void v15[4] = &v26;
  v15[5] = &v20;
  v15[6] = &v16;
  uint64_t v10 = (void *)MEMORY[0x192F975A0](v15);
  id v11 = [(PPNamedEntityReadWriteClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[2](v8, v11, v10);

  if (a4) {
    *a4 = v17[3];
  }
  uint64_t v12 = (void *)v32[5];
  if (v12)
  {
    BOOL v13 = 0;
    if (a3) {
      *a3 = v12;
    }
  }
  else
  {
    if (a3) {
      *a3 = (id) v21[5];
    }
    BOOL v13 = *((unsigned char *)v27 + 24) != 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);

  return v13;
}

void __83__PPNamedEntityReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke(uint64_t a1, void *a2)
{
}

void __83__PPNamedEntityReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2(void *a1, char a2, uint64_t a3, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v7 = obj;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
}

- (BOOL)_doSyncCallWithError:(id *)a3 syncCall:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__5445;
  char v29 = __Block_byref_object_dispose__5446;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__PPNamedEntityReadWriteClient__doSyncCallWithError_syncCall___block_invoke;
  v24[3] = &unk_1E550F638;
  v24[4] = &v25;
  id v7 = (void *)MEMORY[0x192F975A0](v24);
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__5445;
  uint64_t v18 = __Block_byref_object_dispose__5446;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__PPNamedEntityReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2;
  v13[3] = &unk_1E550F660;
  void v13[4] = &v20;
  v13[5] = &v14;
  id v8 = (void *)MEMORY[0x192F975A0](v13);
  id v9 = [(PPNamedEntityReadWriteClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[2](v6, v9, v8);

  uint64_t v10 = (void *)v26[5];
  if (v10)
  {
    BOOL v11 = 0;
    if (a3) {
      *a3 = v10;
    }
  }
  else
  {
    if (a3) {
      *a3 = (id) v15[5];
    }
    BOOL v11 = *((unsigned char *)v21 + 24) != 0;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

void __62__PPNamedEntityReadWriteClient__doSyncCallWithError_syncCall___block_invoke(uint64_t a1, void *a2)
{
}

void __62__PPNamedEntityReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (PPNamedEntityReadWriteClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPNamedEntityReadWriteClient;
  v2 = [(PPNamedEntityReadWriteClient *)&v8 init];
  if (v2)
  {
    v3 = [PPXPCClientHelper alloc];
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AB88];
    uint64_t v5 = [(PPXPCClientHelper *)v3 initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite" allowedServerInterface:v4 allowedClientInterface:0 clientExportedObject:0 interruptionHandler:&__block_literal_global_5452 invalidationHandler:&__block_literal_global_85_5453];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (PPXPCClientHelper *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PPNamedEntityReadWriteClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_5489 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_5489, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_5490;
  return v2;
}

void __46__PPNamedEntityReadWriteClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5490;
  sharedInstance__pasExprOnceResult_5490 = v1;
}

@end