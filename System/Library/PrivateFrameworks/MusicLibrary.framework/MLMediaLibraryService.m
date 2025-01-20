@interface MLMediaLibraryService
+ (id)sharedMediaLibraryService;
+ (void)_setDaemonProcessInfo:(id)a3;
- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5;
- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6;
- (BOOL)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)validateDatabaseAtPath:(id)a3 error:(id *)a4;
- (MLMediaLibraryService)init;
- (id)_serviceConnection;
- (id)beginTransactionForDatabaseWithContext:(id)a3 error:(id *)a4;
- (id)clientImportServiceListenerEndpointWithError:(id *)a3;
- (id)mediaLibraryResourcesServiceListenerEndpointWithError:(id *)a3;
- (id)securityScopedURLForItemPID:(unint64_t)a3 withDatabasePath:(id)a4;
- (void)attemptDatabaseFileRecoveryAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)beginTransactionForDatabaseWithContext:(id)a3 completionHandler:(id)a4;
- (void)cancelImportOperation:(unint64_t)a3 completionHandler:(id)a4;
- (void)checkIntegrityOfDatabaseAtPath:(id)a3 repairFaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)endTransaction:(id)a3 shouldCommit:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 withCompletionHandler:(id)a7;
- (void)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 withCompletionHandler:(id)a6;
- (void)getLanguageResourcesWithCompletion:(id)a3;
- (void)importOperationWithIdentifier:(id)a3 didUpdateWithProgress:(float)a4;
- (void)lockDatabaseForReason:(int64_t)a3 withCompletion:(id)a4;
- (void)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)performDiagnosticWithCompletionHandler:(id)a3;
- (void)performImport:(id)a3 fromSource:(unint64_t)a4 withProgressBlock:(id)a5 completionHandler:(id)a6;
- (void)performMaintenanceTasksForDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)recreateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)serviceTerminatedTransactionWithIdentifier:(id)a3 error:(id)a4;
- (void)setOptions:(id)a3 withCompletionHandler:(id)a4;
- (void)unlockDatabaseWithCompletion:(id)a3;
- (void)updateSiriIndexMetadataForAllLibrariesWithCompletion:(id)a3;
- (void)updateSpotlightIndexForBundleID:(id)a3 withCompletion:(id)a4;
- (void)updateSpotlightIndexMetadataForItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5;
@end

@implementation MLMediaLibraryService

void __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

+ (id)sharedMediaLibraryService
{
  if (sharedMediaLibraryService___once != -1) {
    dispatch_once(&sharedMediaLibraryService___once, &__block_literal_global_20388);
  }
  v2 = (void *)sharedMediaLibraryService___service;

  return v2;
}

- (void)getLanguageResourcesWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  if (v4)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__20278;
    v19 = __Block_byref_object_dispose__20279;
    id v20 = 0;
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__20278;
    v13 = __Block_byref_object_dispose__20279;
    id v14 = 0;
    v5 = [(MLMediaLibraryService *)self _serviceConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke;
    v8[3] = &unk_1E5FB7040;
    v8[4] = &v9;
    v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke_2;
    v7[3] = &unk_1E5FB7068;
    v7[4] = &v15;
    v7[5] = &v9;
    [v6 getLanguageResourcesWithCompletion:v7];

    v4[2](v4, v16[5], v10[5]);
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
  }
}

- (BOOL)validateDatabaseAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__20278;
  id v20 = __Block_byref_object_dispose__20279;
  id v21 = 0;
  v7 = [(MLMediaLibraryService *)self _serviceConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke;
  v13[3] = &unk_1E5FB6E10;
  id v8 = v6;
  id v14 = v8;
  uint64_t v15 = &v16;
  uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke_2;
  v12[3] = &unk_1E5FB6E38;
  v12[4] = &v22;
  v12[5] = &v16;
  [v9 validateDatabaseAtPath:v8 withCompletionHandler:v12];

  if (a4) {
    *a4 = (id) v17[5];
  }
  char v10 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)_serviceConnection
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MLMediaLibraryService__serviceConnection__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  return self->_serviceConnection;
}

void __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __43__MLMediaLibraryService__serviceConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.medialibraryd.xpc" options:0];
    v3 = +[MLMediaLibraryServiceInterface serviceInterface];
    [v2 setRemoteObjectInterface:v3];

    v4 = +[MLMediaLibraryServiceInterface clientInterface];
    [v2 setExportedInterface:v4];

    [v2 setExportedObject:*(void *)(a1 + 32)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v2);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__MLMediaLibraryService__serviceConnection__block_invoke_2;
    v10[3] = &unk_1E5FB7150;
    objc_copyWeak(&v11, &from);
    [v2 setInterruptionHandler:v10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__MLMediaLibraryService__serviceConnection__block_invoke_274;
    v7[3] = &unk_1E5FB7178;
    objc_copyWeak(&v8, &from);
    objc_copyWeak(&v9, &location);
    [v2 setInvalidationHandler:v7];
    [v2 resume];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v2;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__20278;
  v32 = __Block_byref_object_dispose__20279;
  id v33 = 0;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  v13 = [(MLMediaLibraryService *)self _serviceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke;
  v20[3] = &unk_1E5FB6F78;
  id v14 = v12;
  id v21 = v14;
  uint64_t v22 = &v28;
  v23 = &v24;
  uint64_t v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v20];

  uint64_t v16 = (void *)v29[5];
  if (v16)
  {
    BOOL v17 = 0;
    if (a6) {
      *a6 = v16;
    }
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke_2;
    v19[3] = &unk_1E5FB6E38;
    v19[4] = &v24;
    v19[5] = &v28;
    [v15 executeUpdate:v10 withParameters:v11 onTransaction:v14 withCompletionHandler:v19];
    if (a6) {
      *a6 = (id) v29[5];
    }
    BOOL v17 = *((unsigned char *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

- (id)beginTransactionForDatabaseWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__20278;
  char v27 = __Block_byref_object_dispose__20279;
  id v28 = 0;
  v7 = [(MLMediaLibraryService *)self _serviceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke;
  v20[3] = &unk_1E5FB6E10;
  id v8 = v6;
  id v21 = v8;
  uint64_t v22 = &v23;
  id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v20];

  id v10 = (void *)v24[5];
  if (v10)
  {
    id v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    BOOL v17 = __Block_byref_object_copy__20278;
    uint64_t v18 = __Block_byref_object_dispose__20279;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke_2;
    v13[3] = &unk_1E5FB6F50;
    void v13[4] = &v14;
    v13[5] = &v23;
    [v9 beginTransactionForDatabaseWithContext:v8 completionHandler:v13];
    if (a4) {
      *a4 = (id) v24[5];
    }
    id v11 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__20278;
  uint64_t v24 = __Block_byref_object_dispose__20279;
  id v25 = 0;
  id v9 = [(MLMediaLibraryService *)self _serviceConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke;
  v16[3] = &unk_1E5FB6F78;
  id v10 = v8;
  id v17 = v10;
  uint64_t v18 = &v20;
  id v19 = &v26;
  id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];

  id v12 = (void *)v21[5];
  if (v12)
  {
    BOOL v13 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke_2;
    v15[3] = &unk_1E5FB6E38;
    v15[4] = &v26;
    v15[5] = &v20;
    [v11 endTransaction:v10 shouldCommit:v6 withCompletionHandler:v15];
    if (a5) {
      *a5 = (id) v21[5];
    }
    BOOL v13 = *((unsigned char *)v27 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

uint64_t __50__MLMediaLibraryService_sharedMediaLibraryService__block_invoke()
{
  sharedMediaLibraryService___service = objc_alloc_init(MLMediaLibraryService);

  return MEMORY[0x1F41817F8]();
}

- (MLMediaLibraryService)init
{
  v11.receiver = self;
  v11.super_class = (Class)MLMediaLibraryService;
  v2 = [(MLMediaLibraryService *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryService", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryServiceReplyQueue", v5);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    progressBlocksByUUID = v2->_progressBlocksByUUID;
    v2->_progressBlocksByUUID = v8;
  }
  return v2;
}

void __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBlocksByUUID, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __43__MLMediaLibraryService__serviceConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "Media library service %{public}@ closed.", (uint8_t *)&v3, 0xCu);
  }
}

void __43__MLMediaLibraryService__serviceConnection__block_invoke_274(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Media library service %{public}@ invalidated.", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (void *)v4[3];
  v4[3] = 0;

  id v6 = (void *)v4[4];
  v4[4] = 0;
}

- (void)importOperationWithIdentifier:(id)a3 didUpdateWithProgress:(float)a4
{
  id v6 = [(NSMutableDictionary *)self->_progressBlocksByUUID objectForKey:a3];
  int v7 = v6;
  if (v6)
  {
    replyQueue = self->_replyQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__MLMediaLibraryService_importOperationWithIdentifier_didUpdateWithProgress___block_invoke;
    v9[3] = &unk_1E5FB7128;
    id v10 = v6;
    float v11 = a4;
    dispatch_async(replyQueue, v9);
  }
}

uint64_t __77__MLMediaLibraryService_importOperationWithIdentifier_didUpdateWithProgress___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40));
}

- (void)serviceTerminatedTransactionWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MLMediaLibraryService_serviceTerminatedTransactionWithIdentifier_error___block_invoke;
  block[3] = &unk_1E5FB7F48;
  id v11 = v7;
  id v12 = v6;
  BOOL v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__MLMediaLibraryService_serviceTerminatedTransactionWithIdentifier_error___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = *MEMORY[0x1E4F28A50];
  v5[1] = @"MLTerminatedTransactionIdentifierKey";
  uint64_t v2 = a1[5];
  v6[0] = a1[4];
  v6[1] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MLMediaLibraryServiceDidTerminateTransactionNotification" object:a1[6] userInfo:v3];
}

- (id)securityScopedURLForItemPID:(unint64_t)a3 withDatabasePath:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__20278;
  id v17 = __Block_byref_object_dispose__20279;
  id v18 = 0;
  id v7 = [(MLMediaLibraryService *)self _serviceConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke;
  v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v12[4] = a3;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke_2;
  v11[3] = &unk_1E5FB7100;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = a3;
  [v8 securityScopedURLWrapperForItemPid:a3 withDatabasePath:v6 completionHandler:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v9;
}

void __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__MLMediaLibraryService_securityScopedURLForItemPID_withDatabasePath___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 url];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
  id v11 = os_log_create("com.apple.amp.medialibrary", "Service");
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = a1[4];
      uint64_t v14 = a1[6];
      int v20 = 138543875;
      uint64_t v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2113;
      id v25 = v5;
      uint64_t v15 = "%{public}@ Succesfully fetched url wrapper for item pid %llu. wrapper=%{private}@";
      uint64_t v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1B022D000, v16, v17, v15, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = a1[4];
    uint64_t v19 = a1[6];
    int v20 = 138543874;
    uint64_t v21 = v18;
    __int16 v22 = 2048;
    uint64_t v23 = v19;
    __int16 v24 = 2114;
    id v25 = v6;
    uint64_t v15 = "%{public}@ Failed to fetch url wrapper for item pid %llu. error=%{public}@";
    uint64_t v16 = v12;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (id)clientImportServiceListenerEndpointWithError:(id *)a3
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  char v27 = __Block_byref_object_copy__20278;
  uint64_t v28 = __Block_byref_object_dispose__20279;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__20278;
  __int16 v22 = __Block_byref_object_dispose__20279;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  while (1)
  {
    int v3 = [(MLMediaLibraryService *)self _serviceConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke;
    v13[3] = &unk_1E5FB7090;
    v13[5] = &v18;
    void v13[6] = 10;
    void v13[4] = &v14;
    id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke_2;
    v12[3] = &unk_1E5FB70B8;
    v12[4] = &v24;
    void v12[5] = &v18;
    [v4 getClientImportServiceListenerEndpointWithCompletion:v12];

    id v5 = (void *)v25[5];
    if (v5) {
      break;
    }
    if (v15[3] >= 10)
    {
      id v5 = 0;
      break;
    }
  }
  if (a3)
  {
    *a3 = (id) v19[5];
    id v5 = (void *)v25[5];
  }
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MLMediaLibraryService.m", 656, @"Unable to retrieve XPC listener endpoint for MediaLibraryResourcesService [fatal error after %ld retries] - error=%@", v15[3], v19[5] object file lineNumber description];

    id v5 = (void *)v25[5];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v6;
}

void __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not retrieve XPC listener endpoint for ClientImportService - Try %ld of %ld", v4, v5, v6, v7, v8, v9, ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v3;
}

void __70__MLMediaLibraryService_clientImportServiceListenerEndpointWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)mediaLibraryResourcesServiceListenerEndpointWithError:(id *)a3
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__20278;
  v40 = __Block_byref_object_dispose__20279;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__20278;
  v34 = __Block_byref_object_dispose__20279;
  id v35 = 0;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  while (1)
  {
    id v3 = [(MLMediaLibraryService *)self _serviceConnection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke;
    v25[3] = &unk_1E5FB7090;
    v25[5] = &v30;
    v25[6] = 10;
    v25[4] = &v26;
    uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v25];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_2;
    v24[3] = &unk_1E5FB70B8;
    v24[4] = &v36;
    v24[5] = &v30;
    [v4 getMediaLibraryResourcesServiceListenerEndpointWithCompletion:v24];

    id v5 = (void *)v37[5];
    if (v5) {
      break;
    }
    if (v27[3] >= 10)
    {
      id v5 = 0;
      break;
    }
  }
  if (a3)
  {
    *a3 = (id) v31[5];
    id v5 = (void *)v37[5];
  }
  if (!v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v7 = (void *)MEMORY[0x1E4F77950];
    uint64_t v8 = NSString;
    uint64_t v9 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v10 = [v9 description];
    id v11 = (void *)v10;
    id v12 = a3 ? *a3 : 0;
    uint64_t v13 = [v8 stringWithFormat:@"currentThread=%@ last connection error=%@", v10, v12];
    uint64_t v14 = *MEMORY[0x1E4F778C0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_3;
    v22[3] = &unk_1E5FB8298;
    uint64_t v15 = v6;
    id v23 = v15;
    [v7 snapshotWithDomain:v14 type:@"Bug" subType:@"ML3ServiceConnectionBug" context:v13 triggerThresholdValues:&stru_1F08D4D70 events:0 completion:v22];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    id v5 = (void *)v37[5];
    if (!v5)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"MLMediaLibraryService.m", 627, @"Unable to retrieve XPC listener endpoint for MediaLibraryResourcesService [fatal error after %ld retries] - error=%@", v27[3], v31[5] object file lineNumber description];

      id v5 = (void *)v37[5];
    }
  }
  id v16 = v5;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);

  return v16;
}

void __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not retrieve XPC listener endpoint for MediaLibraryResourcesService - Try %ld of %ld", v4, v5, v6, v7, v8, v9, ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v3;
}

void __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

intptr_t __79__MLMediaLibraryService_mediaLibraryResourcesServiceListenerEndpointWithError___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)performMaintenanceTasksForDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MLMediaLibraryService *)self _serviceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5FB6E88;
  id v16 = v6;
  id v9 = v7;
  uint64_t v17 = self;
  id v18 = v9;
  id v10 = v6;
  id v11 = [v8 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E5FB7390;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 performMaintenanceTasksForDatabaseAtPath:v10 withCompletionHandler:v13];
}

void __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not perform maintenance task for database at path %@", v4, v5, v6, v7, v8, v9, a1[4]);
  id v10 = (void *)a1[6];
  if (v10)
  {
    id v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, block);
  }
}

void __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __88__MLMediaLibraryService_performMaintenanceTasksForDatabaseAtPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)updateSiriIndexMetadataForAllLibrariesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MLMediaLibraryService *)self _serviceConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke;
  v11[3] = &unk_1E5FB6ED8;
  id v6 = v4;
  v11[4] = self;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_3;
  v9[3] = &unk_1E5FB7390;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 updateSiriIndexMetadataForAllLibrariesWithCompletion:v9];
}

void __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not update siri index for all libraries", v4, v5, v6, v7, v8, v9, v12[0]);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    char v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

void __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __78__MLMediaLibraryService_updateSiriIndexMetadataForAllLibrariesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)updateSpotlightIndexMetadataForItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  char v11 = [(MLMediaLibraryService *)self _serviceConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke;
  v18[3] = &unk_1E5FB6E88;
  id v19 = v8;
  id v12 = v9;
  uint64_t v20 = self;
  id v21 = v12;
  id v13 = v8;
  id v14 = [v11 remoteObjectProxyWithErrorHandler:v18];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_3;
  v16[3] = &unk_1E5FB7390;
  void v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v14 updateSpotlightIndexMetadataForItemsWithIdentifiers:v13 bundleID:v10 withCompletion:v16];
}

void __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not update spotlight index for identifiers: %@", v4, v5, v6, v7, v8, v9, a1[4]);
  id v10 = (void *)a1[6];
  if (v10)
  {
    char v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, block);
  }
}

void __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __101__MLMediaLibraryService_updateSpotlightIndexMetadataForItemsWithIdentifiers_bundleID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)updateSpotlightIndexForBundleID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MLMediaLibraryService *)self _serviceConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke;
  v14[3] = &unk_1E5FB6ED8;
  id v9 = v6;
  v14[4] = self;
  id v15 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_3;
  v12[3] = &unk_1E5FB7390;
  uint64_t v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 updateSpotlightIndexForBundleID:v7 withCompletion:v12];
}

void __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not update spotlight index.", v4, v5, v6, v7, v8, v9, v12[0]);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

void __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __72__MLMediaLibraryService_updateSpotlightIndexForBundleID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__MLMediaLibraryService_getLanguageResourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
}

- (void)unlockDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MLMediaLibraryService *)self _serviceConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke;
  v11[3] = &unk_1E5FB6ED8;
  id v6 = v4;
  v11[4] = self;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_3;
  v9[3] = &unk_1E5FB7390;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 unlockDatabaseWithCompletion:v9];
}

void __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not unlock database.", v4, v5, v6, v7, v8, v9, v12[0]);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    char v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

void __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __54__MLMediaLibraryService_unlockDatabaseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)lockDatabaseForReason:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MLMediaLibraryService *)self _serviceConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke;
  v13[3] = &unk_1E5FB6ED8;
  id v8 = v6;
  void v13[4] = self;
  id v14 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_3;
  v11[3] = &unk_1E5FB7390;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 lockDatabaseForReason:a3 withCompletion:v11];
}

void __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not lock database.", v4, v5, v6, v7, v8, v9, v12[0]);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    char v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

void __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __62__MLMediaLibraryService_lockDatabaseForReason_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)cancelImportOperation:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MLMediaLibraryService *)self _serviceConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke;
  v13[3] = &unk_1E5FB6ED8;
  id v8 = v6;
  void v13[4] = self;
  id v14 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5FB7390;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 cancelImportOperation:a3 completionHandler:v11];
}

void __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not cancel import operation.", v4, v5, v6, v7, v8, v9, v12[0]);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    char v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

void __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __65__MLMediaLibraryService_cancelImportOperation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)performImport:(id)a3 fromSource:(unint64_t)a4 withProgressBlock:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MLMediaLibraryService *)self _serviceConnection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke;
  v25[3] = &unk_1E5FB6E88;
  id v14 = v10;
  id v26 = v14;
  id v15 = v12;
  char v27 = self;
  id v28 = v15;
  id v16 = [v13 remoteObjectProxyWithErrorHandler:v25];

  id v17 = [MEMORY[0x1E4F29128] UUID];
  if (v11)
  {
    progressBlocksByUUID = self->_progressBlocksByUUID;
    id v19 = (void *)[v11 copy];
    [(NSMutableDictionary *)progressBlocksByUUID setObject:v19 forKey:v17];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_3;
  v22[3] = &unk_1E5FB7018;
  void v22[4] = self;
  id v23 = v17;
  id v24 = v15;
  id v20 = v15;
  id v21 = v17;
  [v16 performImport:v14 fromSource:a4 withUUID:v21 completionHandler:v22];
}

void __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) libraryPath];
  _ML3LogReplyError(v3, @"Could not perform import for database at path %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, block);
  }
}

void __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_3(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1[4] + 40) removeObjectForKey:a1[5]];
  uint64_t v9 = (void *)a1[6];
  if (v9)
  {
    uint64_t v10 = *(NSObject **)(a1[4] + 16);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_4;
    v11[3] = &unk_1E5FB6FF0;
    id v14 = v9;
    char v15 = a2;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v10, v11);
  }
}

uint64_t __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __86__MLMediaLibraryService_performImport_fromSource_withProgressBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0);
}

- (void)setOptions:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MLMediaLibraryService *)self _serviceConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E5FB6ED8;
  id v9 = v6;
  v14[4] = self;
  id v15 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E5FB7390;
  uint64_t v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 setOptions:v7 withCompletionHandler:v12];
}

void __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not set options on media library service.", v4, v5, v6, v7, v8, v9, v12[0]);
  uint64_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

void __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __58__MLMediaLibraryService_setOptions_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (BOOL)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__20278;
  __int16 v22 = __Block_byref_object_dispose__20279;
  id v23 = 0;
  id v12 = [(MLMediaLibraryService *)self _serviceConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke;
  v17[3] = &unk_1E5FB6FC8;
  v17[4] = &v24;
  v17[5] = &v18;
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v17];

  if (*((unsigned char *)v25 + 24))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke_2;
    v16[3] = &unk_1E5FB6E38;
    void v16[4] = &v24;
    void v16[5] = &v18;
    [v13 performDatabaseOperation:a3 withAttributes:v10 options:v11 completionHandler:v16];
  }
  if (a6) {
    *a6 = (id) v19[5];
  }
  char v14 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void __79__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(MLMediaLibraryService *)self _serviceConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke;
  v20[3] = &unk_1E5FB6E88;
  id v21 = v10;
  id v14 = v11;
  __int16 v22 = self;
  id v23 = v14;
  id v15 = v10;
  id v16 = [v13 remoteObjectProxyWithErrorHandler:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_3;
  v18[3] = &unk_1E5FB7390;
  void v18[4] = self;
  id v19 = v14;
  id v17 = v14;
  [v16 performDatabaseOperation:a3 withAttributes:v12 options:v15 completionHandler:v18];
}

void __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:@"MLDatabaseOperationOptionDatabasePathKey"];
  _ML3LogReplyError(v3, @"Could not execute database operation on database at path %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, block);
  }
}

void __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __91__MLMediaLibraryService_performDatabaseOperation_withAttributes_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __59__MLMediaLibraryService_endTransaction_shouldCommit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) UUIDString];
  _ML3LogReplyError(v3, @"Could not end transaction %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
  id v13 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

- (void)endTransaction:(id)a3 shouldCommit:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(MLMediaLibraryService *)self _serviceConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E5FB6E88;
  id v18 = v8;
  id v11 = v9;
  id v19 = self;
  id v20 = v11;
  id v12 = v8;
  id v13 = [v10 remoteObjectProxyWithErrorHandler:v17];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E5FB7390;
  void v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [v13 endTransaction:v12 shouldCommit:v6 withCompletionHandler:v15];
}

void __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) UUIDString];
  _ML3LogReplyError(v3, @"Could not end transaction %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, block);
  }
}

void __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __75__MLMediaLibraryService_endTransaction_shouldCommit_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 withCompletionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(MLMediaLibraryService *)self _serviceConnection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke;
  v24[3] = &unk_1E5FB6E88;
  id v25 = v12;
  id v18 = v13;
  uint64_t v26 = self;
  id v27 = v18;
  id v19 = v12;
  id v20 = [v17 remoteObjectProxyWithErrorHandler:v24];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E5FB6FA0;
  void v22[4] = self;
  id v23 = v18;
  id v21 = v18;
  [v20 executeQuery:v16 withParameters:v15 options:v14 onTransaction:v19 withCompletionHandler:v22];
}

void __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) UUIDString];
  _ML3LogReplyError(v3, @"Could not execute query on transaction %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  char v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, block);
  }
}

void __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB7BD8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__MLMediaLibraryService_executeQuery_withParameters_options_onTransaction_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __74__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) UUIDString];
  _ML3LogReplyError(v3, @"Could not execute update on transaction %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
  id v13 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

- (void)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(MLMediaLibraryService *)self _serviceConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E5FB6E88;
  id v22 = v10;
  id v15 = v11;
  id v23 = self;
  id v24 = v15;
  id v16 = v10;
  id v17 = [v14 remoteObjectProxyWithErrorHandler:v21];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_3;
  v19[3] = &unk_1E5FB7390;
  v19[4] = self;
  id v20 = v15;
  id v18 = v15;
  [v17 executeUpdate:v13 withParameters:v12 onTransaction:v16 withCompletionHandler:v19];
}

void __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) UUIDString];
  _ML3LogReplyError(v3, @"Could not execute update on transaction %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, block);
  }
}

void __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __90__MLMediaLibraryService_executeUpdate_withParameters_onTransaction_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __70__MLMediaLibraryService_beginTransactionForDatabaseWithContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) path];
  _ML3LogReplyError(v3, @"Could not begin transaction for database at path %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

- (void)beginTransactionForDatabaseWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MLMediaLibraryService *)self _serviceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke;
  v15[3] = &unk_1E5FB6E88;
  id v16 = v6;
  id v9 = v7;
  id v17 = self;
  id v18 = v9;
  id v10 = v6;
  uint64_t v11 = [v8 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_3;
  v13[3] = &unk_1E5FB6F28;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 beginTransactionForDatabaseWithContext:v10 completionHandler:v13];
}

void __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) path];
  _ML3LogReplyError(v3, @"Could not begin transaction for database at path %@.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  uint64_t v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, block);
  }
}

void __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_4;
    block[3] = &unk_1E5FB7BD8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

void __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "msv_errorByRemovingUnsafeUserInfo");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

uint64_t __82__MLMediaLibraryService_beginTransactionForDatabaseWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)recreateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MLMediaLibraryService *)self _serviceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5FB6E88;
  id v16 = v6;
  id v9 = v7;
  id v17 = self;
  id v18 = v9;
  id v10 = v6;
  id v11 = [v8 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E5FB7390;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 recreateDatabaseAtPath:v10 withCompletionHandler:v13];
}

void __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not recreate database at path %@.", v4, v5, v6, v7, v8, v9, a1[4]);
  id v10 = (void *)a1[6];
  if (v10)
  {
    id v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, block);
  }
}

void __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __70__MLMediaLibraryService_recreateDatabaseAtPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)performDiagnosticWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MLMediaLibraryService *)self _serviceConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5FB6ED8;
  id v6 = v4;
  void v11[4] = self;
  id v12 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E5FB6F00;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performDiagnosticWithCompletionHandler:v9];
}

void __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not perform diagnostic", v4, v5, v6, v7, v8, v9, v12[0]);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    char v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = (uint64_t)__64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_2;
    v12[3] = (uint64_t)&unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, v12);
  }
}

void __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB7BD8;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__MLMediaLibraryService_performDiagnosticWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)checkIntegrityOfDatabaseAtPath:(id)a3 repairFaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MLMediaLibraryService *)self _serviceConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5FB6ED8;
  id v11 = v8;
  void v16[4] = self;
  id v17 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5FB7390;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 checkIntegrityOfDatabaseAtPath:v9 repairFaults:v5 withCompletionHandler:v14];
}

void __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Failed to obtain service proxy to perform integrity check. err=%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, block);
  }
}

void __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __91__MLMediaLibraryService_checkIntegrityOfDatabaseAtPath_repairFaults_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)attemptDatabaseFileRecoveryAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MLMediaLibraryService *)self _serviceConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5FB6E88;
  id v16 = v6;
  id v9 = v7;
  id v17 = self;
  id v18 = v9;
  id v10 = v6;
  char v11 = [v8 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E5FB7390;
  void v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [v11 attemptDatabaseFileRecoveryAtPath:v10 withCompletionHandler:v13];
}

void __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not attempt recovery at path: %@", v4, v5, v6, v7, v8, v9, a1[4]);
  id v10 = (void *)a1[6];
  if (v10)
  {
    char v11 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5FB6E60;
    id v14 = v10;
    id v13 = v3;
    dispatch_async(v11, block);
  }
}

void __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5FB6EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __81__MLMediaLibraryService_attemptDatabaseFileRecoveryAtPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __54__MLMediaLibraryService_validateDatabaseAtPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _ML3LogReplyError(v3, @"Could not validate database at path %@.", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  char v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_serviceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MLMediaLibraryService;
  [(MLMediaLibraryService *)&v3 dealloc];
}

+ (void)_setDaemonProcessInfo:(id)a3
{
}

@end