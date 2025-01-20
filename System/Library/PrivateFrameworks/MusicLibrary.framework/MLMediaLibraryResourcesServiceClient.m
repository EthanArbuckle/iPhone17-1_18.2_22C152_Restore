@interface MLMediaLibraryResourcesServiceClient
+ (MLMediaLibraryResourcesServiceClient)sharedService;
- (MLMediaLibraryAccountChangeObserver)accountChangeObserver;
- (NSOperationQueue)accountChangeOperationQueue;
- (NSXPCConnection)xpcClientConnection;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)serialQueue;
- (id)_initWithAccountChangeObserver:(id)a3;
- (id)_libraryContainerPathWithError:(id *)a3;
- (id)_musicContainerPathWithError:(id *)a3;
- (id)connectionWithListenerEndpoint:(id)a3;
- (id)libraryContainerPathWithError:(id *)a3;
- (id)musicContainerPathWithError:(id *)a3;
- (void)_performOnServerObjectWithMaxRetries:(int64_t)a3 error:(id *)a4 remoteObjectBlock:(id)a5;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)setAccountChangeObserver:(id)a3;
- (void)setAccountChangeOperationQueue:(id)a3;
- (void)setXpcClientConnection:(id)a3;
- (void)terminateForFailureToPerformDatabasePathChange;
@end

@implementation MLMediaLibraryResourcesServiceClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChangeOperationQueue, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)setAccountChangeOperationQueue:(id)a3
{
}

- (NSOperationQueue)accountChangeOperationQueue
{
  return self->_accountChangeOperationQueue;
}

- (void)setAccountChangeObserver:(id)a3
{
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void)setXpcClientConnection:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (id)connectionWithListenerEndpoint:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    [v5 setExportedObject:self];
    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F092A6B0];
    [v5 setRemoteObjectInterface:v6];
    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0922FC8];
    [v5 setExportedInterface:v7];
    [v5 setExportedObject:self];
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke;
    v13[3] = &unk_1E5FB4EA0;
    objc_copyWeak(&v15, location);
    v13[4] = self;
    id v8 = v5;
    id v14 = v8;
    [v8 setInterruptionHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_3;
    v11[3] = &unk_1E5FB5030;
    objc_copyWeak(&v12, location);
    v11[4] = self;
    [v8 setInvalidationHandler:v11];
    [v8 resume];
    id v9 = v8;
    objc_destroyWeak(&v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = self;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Unable to create XPC Connection [no listener endpoint]", (uint8_t *)location, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      v5 = [WeakRetained accountChangeObserver];
      *(_DWORD *)buf = 134218240;
      id v18 = WeakRetained;
      __int16 v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - XPC Connection interrupted [Processing] - accountChangeObserver=%p", buf, 0x16u);
    }
    v6 = [a1[4] serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_91;
    block[3] = &unk_1E5FB7F48;
    v7 = WeakRetained;
    id v14 = v7;
    id v8 = a1[5];
    id v9 = a1[4];
    id v15 = v8;
    id v16 = v9;
    dispatch_sync(v6, block);

    v10 = [a1[4] calloutQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_92;
    v11[3] = &unk_1E5FB8298;
    id v12 = v7;
    dispatch_async(v10, v11);

    v3 = v14;
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient - XPC Connection interrupted [Unable to process ]", buf, 2u);
  }
}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v11 = WeakRetained;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Connection to media library resources service invalidated", buf, 0xCu);
  }

  BOOL v4 = [*(id *)(a1 + 32) serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_93;
  v7[3] = &unk_1E5FB83D0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = WeakRetained;
  uint64_t v9 = v5;
  id v6 = WeakRetained;
  dispatch_sync(v4, v7);
}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_93(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_91(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = (void *)a1[5];
  uint64_t v5 = a1[6];
  if (v4 == *(void **)(v5 + 24))
  {
    *(void *)(v5 + 24) = 0;
  }
}

void __71__MLMediaLibraryResourcesServiceClient_connectionWithListenerEndpoint___block_invoke_92(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) accountChangeObserver];
  [v1 emergencyDisconnectWithCompletion:&__block_literal_global_8745];
}

- (NSXPCConnection)xpcClientConnection
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8751;
  id v11 = __Block_byref_object_dispose__8752;
  id v12 = 0;
  uint64_t v3 = [(MLMediaLibraryResourcesServiceClient *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__MLMediaLibraryResourcesServiceClient_xpcClientConnection__block_invoke;
  v6[3] = &unk_1E5FB8360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

void __59__MLMediaLibraryResourcesServiceClient_xpcClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Creating XPC Client Connection [started]", buf, 0xCu);
    }

    uint64_t v5 = +[MLMediaLibraryService sharedMediaLibraryService];
    id v16 = 0;
    int v6 = [v5 mediaLibraryResourcesServiceListenerEndpointWithError:&v16];
    id v7 = v16;

    if (v7 || !v6)
    {
      uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v18 = v9;
        __int16 v19 = 2114;
        id v20 = v7;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Creating XPC Client Connection [failed] - error=%{public}@", buf, 0x16u);
      }
    }
    uint64_t v10 = [*(id *)(a1 + 32) connectionWithListenerEndpoint:v6];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    v13 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 24);
      *(_DWORD *)buf = 134218242;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v15;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Creating XPC Client Connection [ended] - connection=%{public}@", buf, 0x16u);
    }

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (void)terminateForFailureToPerformDatabasePathChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    int v6 = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - terminateForFailureToPrepareForAccountChange:", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeObserver];
  [v4 terminateForFailureToPerformDatabasePathChange];
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeObserver];
  [v5 emergencyDisconnectWithCompletion:v4];
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218243;
    uint64_t v18 = self;
    __int16 v19 = 2113;
    id v20 = v6;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - performDatabasePathChange: - newPath=%{private}@", buf, 0x16u);
  }

  uint64_t v9 = [_ML3MultiUserAccountChangeOperation alloc];
  uint64_t v10 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeObserver];
  uint64_t v11 = [(_ML3MultiUserAccountChangeOperation *)v9 initWithDatabasePath:v6 accountChangeObserver:v10];

  objc_initWeak((id *)buf, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke;
  v14[3] = &unk_1E5FB4E78;
  objc_copyWeak(&v16, (id *)buf);
  id v12 = v7;
  v14[4] = self;
  id v15 = v12;
  [(_ML3MultiUserAccountChangeOperation *)v11 setCompletionBlock:v14];
  v13 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeOperationQueue];
  [v13 addOperation:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained error];

  (*(void (**)(void, BOOL, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 != 0, v3);
  id v4 = [*(id *)(a1 + 32) calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke_2;
  block[3] = &unk_1E5FB8298;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

void __77__MLMediaLibraryResourcesServiceClient_performDatabasePathChange_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - Database path change completed [posting path change notification]", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MLUserDatabasePathDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_performOnServerObjectWithMaxRetries:(int64_t)a3 error:(id *)a4 remoteObjectBlock:(id)a5
{
  id v15 = a4;
  uint64_t v7 = (uint64_t (**)(id, void *))a5;
  uint64_t v8 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8751;
  v25 = __Block_byref_object_dispose__8752;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v9 = *MEMORY[0x1E4F281F8];
  while (1)
  {
    uint64_t v10 = [(MLMediaLibraryResourcesServiceClient *)self xpcClientConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke;
    v16[3] = &unk_1E5FB4E50;
    v16[4] = self;
    v16[5] = &v17;
    v16[6] = &v21;
    v16[7] = a3;
    uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

    if (v11)
    {
      if (v7[2](v7, v11)) {
        break;
      }
    }
    id v12 = (void *)v22[5];
    if (!v12) {
      goto LABEL_10;
    }
    v13 = [v12 domain];
    if (![v13 isEqualToString:v9] || objc_msgSend((id)v22[5], "code") != 4097)
    {

LABEL_10:
      if (v15) {
        *id v15 = (id) v22[5];
      }
      break;
    }
    int64_t v14 = v18[3];

    uint64_t v8 = v11;
    if (v14 >= a3) {
      goto LABEL_10;
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

void __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 4097)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        uint64_t v9 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134218496;
        uint64_t v17 = v7;
        __int16 v18 = 2048;
        id v19 = v8;
        __int16 v20 = 2048;
        uint64_t v21 = v9;
        _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Unable to retrieve path [XPC connection interrupted] - Recreating the connection - Attempt %ld of %ld", buf, 0x20u);
      }

      uint64_t v10 = [*(id *)(a1 + 32) serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke_30;
      block[3] = &unk_1E5FB8298;
      void block[4] = *(void *)(a1 + 32);
      dispatch_sync(v10, block);
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    id v19 = v3;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "MLMediaLibraryResourcesServiceClient %p - Unable to retrieve path - error=%{public}@", buf, 0x16u);
  }
LABEL_9:

  uint64_t v12 = [v3 copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  int64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __101__MLMediaLibraryResourcesServiceClient__performOnServerObjectWithMaxRetries_error_remoteObjectBlock___block_invoke_30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (id)_libraryContainerPathWithError:(id *)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8751;
  uint64_t v10 = __Block_byref_object_dispose__8752;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke;
  v5[3] = &unk_1E5FB4E28;
  v5[4] = &v6;
  [(MLMediaLibraryResourcesServiceClient *)self _performOnServerObjectWithMaxRetries:10 error:a3 remoteObjectBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

BOOL __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke_2;
  v4[3] = &unk_1E5FB4E00;
  v4[4] = *(void *)(a1 + 32);
  [a2 libraryContainerPathWithCompletion:v4];
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

uint64_t __71__MLMediaLibraryResourcesServiceClient__libraryContainerPathWithError___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return MEMORY[0x1F41817F8]();
}

- (id)_musicContainerPathWithError:(id *)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8751;
  uint64_t v10 = __Block_byref_object_dispose__8752;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke;
  v5[3] = &unk_1E5FB4E28;
  v5[4] = &v6;
  [(MLMediaLibraryResourcesServiceClient *)self _performOnServerObjectWithMaxRetries:10 error:a3 remoteObjectBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

BOOL __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke_2;
  v4[3] = &unk_1E5FB4E00;
  v4[4] = *(void *)(a1 + 32);
  [a2 musicContainerPathWithCompletion:v4];
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

void __69__MLMediaLibraryResourcesServiceClient__musicContainerPathWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)_initWithAccountChangeObserver:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v20 = self;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - _initWithXPCListenerEndpoint:", buf, 0xCu);
  }

  v18.receiver = self;
  v18.super_class = (Class)MLMediaLibraryResourcesServiceClient;
  uint64_t v7 = [(MLMediaLibraryResourcesServiceClient *)&v18 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_accountChangeObserver, a3);
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryResourceServiceClient.serial.queue", v9);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MusicLibrary.MLMediaLibraryResourceServiceClient.callout.queue", v12);
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v13;

    id v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    accountChangeOperationQueue = v8->_accountChangeOperationQueue;
    v8->_accountChangeOperationQueue = v15;

    [(NSOperationQueue *)v8->_accountChangeOperationQueue setName:@"com.apple.MusicLibrary.MLMediaLibraryResourceServiceClient.path.change.queue"];
    [(NSOperationQueue *)v8->_accountChangeOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v8->_accountChangeOperationQueue setQualityOfService:25];
  }

  return v8;
}

- (id)musicContainerPathWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeOperationQueue];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - BLOCKING - Retrieving musicContainerPath on serial queue: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__8751;
  v24 = __Block_byref_object_dispose__8752;
  id v25 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__8751;
  v14[4] = __Block_byref_object_dispose__8752;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MLMediaLibraryResourcesServiceClient_musicContainerPathWithError___block_invoke;
  v13[3] = &unk_1E5FB7FF0;
  v13[4] = self;
  void v13[5] = buf;
  v13[6] = v14;
  uint64_t v6 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v13];
  uint64_t v7 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeOperationQueue];
  [v7 addOperation:v6];

  [v6 waitUntilFinished];
  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeOperationQueue];
    uint64_t v10 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)id v16 = 134218498;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - UNBLOCKED - Retrieved musicContainerPath on serial queue: %@ - %@", v16, 0x20u);
  }
  id v11 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(buf, 8);

  return v11;
}

void __68__MLMediaLibraryResourcesServiceClient_musicContainerPathWithError___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _musicContainerPathWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)libraryContainerPathWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - libraryContainerPathWithError:", buf, 0xCu);
  }

  uint64_t v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeOperationQueue];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - BLOCKING - Retrieving libraryContainerPath on serial queue: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__8751;
  v30 = __Block_byref_object_dispose__8752;
  id v31 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__8751;
  __int16 v20 = __Block_byref_object_dispose__8752;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__MLMediaLibraryResourcesServiceClient_libraryContainerPathWithError___block_invoke;
  v15[3] = &unk_1E5FB7FF0;
  v15[4] = self;
  v15[5] = buf;
  v15[6] = &v16;
  uint64_t v8 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v15];
  uint64_t v9 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeOperationQueue];
  [v9 addOperation:v8];

  [v8 waitUntilFinished];
  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(MLMediaLibraryResourcesServiceClient *)self accountChangeOperationQueue];
    uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)uint64_t v22 = 134218498;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "MLMediaLibraryResourcesServiceClient %p - UNBLOCKED - Retrieved mediaFolderPath on serial queue: %@ - %@", v22, 0x20u);
  }
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v13 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

void __70__MLMediaLibraryResourcesServiceClient_libraryContainerPathWithError___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _libraryContainerPathWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (MLMediaLibraryResourcesServiceClient)sharedService
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = objc_opt_class();
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEBUG, "MLMediaLibraryResourcesServiceClient %p - sharedService:", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MLMediaLibraryResourcesServiceClient_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedService_onceToken[0] != -1) {
    dispatch_once(sharedService_onceToken, block);
  }
  uint64_t v4 = (void *)sharedService___sharedService;

  return (MLMediaLibraryResourcesServiceClient *)v4;
}

void __53__MLMediaLibraryResourcesServiceClient_sharedService__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    uint64_t v6 = objc_opt_class();
    _os_log_impl(&dword_1B022D000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ - Initializing the shared service:", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v1 = [MLMediaLibraryResourcesServiceClient alloc];
  v2 = +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy];
  uint64_t v3 = [(MLMediaLibraryResourcesServiceClient *)v1 _initWithAccountChangeObserver:v2];
  uint64_t v4 = (void *)sharedService___sharedService;
  sharedService___sharedService = v3;
}

@end