@interface PPLocationReadWriteClient
+ (id)sharedInstance;
- (BOOL)_doDeletionSyncCallWithError:(id *)a3 deletedCount:(unint64_t *)a4 syncCall:(id)a5;
- (BOOL)_doSyncCallWithError:(id *)a3 syncCall:(id)a4;
- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4;
- (BOOL)cloudSyncWithError:(id *)a3;
- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 error:(id *)a9;
- (PPLocationReadWriteClient)init;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
@end

@implementation PPLocationReadWriteClient

- (void).cxx_destruct
{
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  return [(PPLocationReadWriteClient *)self _doDeletionSyncCallWithError:a3 deletedCount:a4 syncCall:&__block_literal_global_75];
}

uint64_t __57__PPLocationReadWriteClient_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearWithCompletion:");
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  return [(PPLocationReadWriteClient *)self _doSyncCallWithError:a3 syncCall:&__block_literal_global_72];
}

uint64_t __48__PPLocationReadWriteClient_cloudSyncWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncWithCompletion:");
}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __112__PPLocationReadWriteClient_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_decayRate_error___block_invoke;
  v23[3] = &unk_1E550F6B0;
  id v24 = v16;
  id v25 = v17;
  id v26 = v18;
  unsigned __int16 v28 = a6;
  BOOL v29 = a7;
  double v27 = a8;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  LOBYTE(a9) = [(PPLocationReadWriteClient *)self _doSyncCallWithError:a9 syncCall:v23];

  return (char)a9;
}

uint64_t __112__PPLocationReadWriteClient_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_decayRate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 donateLocations:*(void *)(a1 + 32) source:*(void *)(a1 + 40) contextualNamedEntities:*(void *)(a1 + 48) algorithm:*(unsigned __int16 *)(a1 + 64) cloudSync:*(unsigned __int8 *)(a1 + 66) decayRate:a3 completion:*(double *)(a1 + 56)];
}

- (BOOL)_doDeletionSyncCallWithError:(id *)a3 deletedCount:(unint64_t *)a4 syncCall:(id)a5
{
  v8 = (void (**)(id, void *, void *))a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__7525;
  v35 = __Block_byref_object_dispose__7526;
  id v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke;
  v30[3] = &unk_1E550F638;
  v30[4] = &v31;
  v9 = (void *)MEMORY[0x192F975A0](v30);
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7525;
  id v24 = __Block_byref_object_dispose__7526;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2;
  v15[3] = &unk_1E550F688;
  v15[4] = &v26;
  v15[5] = &v20;
  v15[6] = &v16;
  v10 = (void *)MEMORY[0x192F975A0](v15);
  v11 = [(PPLocationReadWriteClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[2](v8, v11, v10);

  if (a4) {
    *a4 = v17[3];
  }
  v12 = (void *)v32[5];
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

void __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke(uint64_t a1, void *a2)
{
}

void __80__PPLocationReadWriteClient__doDeletionSyncCallWithError_deletedCount_syncCall___block_invoke_2(void *a1, char a2, uint64_t a3, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v7 = obj;
  *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
}

- (BOOL)_doSyncCallWithError:(id *)a3 syncCall:(id)a4
{
  v6 = (void (**)(id, void *, void *))a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__7525;
  char v29 = __Block_byref_object_dispose__7526;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke;
  v24[3] = &unk_1E550F638;
  v24[4] = &v25;
  id v7 = (void *)MEMORY[0x192F975A0](v24);
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7525;
  uint64_t v18 = __Block_byref_object_dispose__7526;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2;
  v13[3] = &unk_1E550F660;
  v13[4] = &v20;
  v13[5] = &v14;
  v8 = (void *)MEMORY[0x192F975A0](v13);
  v9 = [(PPLocationReadWriteClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[2](v6, v9, v8);

  v10 = (void *)v26[5];
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

void __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke(uint64_t a1, void *a2)
{
}

void __59__PPLocationReadWriteClient__doSyncCallWithError_syncCall___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (PPLocationReadWriteClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPLocationReadWriteClient;
  v2 = [(PPLocationReadWriteClient *)&v8 init];
  if (v2)
  {
    v3 = [PPXPCClientHelper alloc];
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AD68];
    uint64_t v5 = [(PPXPCClientHelper *)v3 initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Location.readWrite" allowedServerInterface:v4 allowedClientInterface:0 clientExportedObject:0 interruptionHandler:&__block_literal_global_7532 invalidationHandler:&__block_literal_global_65_7533];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (PPXPCClientHelper *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PPLocationReadWriteClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_7550 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_7550, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_7551;
  return v2;
}

void __43__PPLocationReadWriteClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_7551;
  sharedInstance__pasExprOnceResult_7551 = v1;
}

@end