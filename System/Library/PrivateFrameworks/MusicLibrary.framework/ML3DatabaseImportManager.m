@interface ML3DatabaseImportManager
- (BOOL)isSuspended;
- (ML3DatabaseImportManager)init;
- (NSError)lastImportError;
- (float)currentOperationProgressWithError:(id *)a3;
- (id)_importOperations;
- (id)_suspendedImportOperations;
- (unint64_t)operationsCount;
- (unint64_t)suspendedOperationsCount;
- (void)_handleImportOperationCancelled:(id)a3;
- (void)_handleImportOperationCompleted:(id)a3;
- (void)cancelAllImportOperations;
- (void)cancelImportOperationsForSource:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)cancelImportOperationsOriginatingFromClient:(id)a3;
- (void)performImport:(id)a3 fromSource:(unint64_t)a4 progressBlock:(id)a5 withCompletionHandler:(id)a6;
- (void)resumeSuspendedImportOperations;
- (void)setLastImportError:(id)a3;
- (void)suspendImportOperations;
@end

@implementation ML3DatabaseImportManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastImportError, 0);
  objc_storeStrong((id *)&self->_suspendedImportOperations, 0);

  objc_storeStrong((id *)&self->_importOperationQueue, 0);
}

- (void)setLastImportError:(id)a3
{
}

- (NSError)lastImportError
{
  return self->_lastImportError;
}

- (void)_handleImportOperationCancelled:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_ERROR, "Operation %{public}@ cancelled.", (uint8_t *)&v9, 0xCu);
  }

  if ([v4 isSuspended])
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ suspended--adding to suspension queue.", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableArray *)self->_suspendedImportOperations addObject:v4];
  }
  else
  {
    v7 = [v4 _clientCompletionHandler];
    if (v7)
    {
      v8 = +[ML3MediaLibraryWriter writerErrorWithCode:400 description:@"Operation was cancelled by the media library service."];
      ((void (**)(void, void, void *, void))v7)[2](v7, 0, v8, 0);
    }
  }
}

- (void)_handleImportOperationCompleted:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 success];
  v6 = [v4 error];
  v7 = [v4 error];
  lastImportError = self->_lastImportError;
  self->_lastImportError = v7;

  int v9 = os_log_create("com.apple.amp.medialibrary", "Service");
  id v10 = v9;
  if (v5)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)v20 = 138543362;
    *(void *)&v20[4] = v4;
    uint64_t v11 = "Successfully executed import operation %{public}@";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)v20 = 138543362;
    *(void *)&v20[4] = v6;
    uint64_t v11 = "Import operation failed: %{public}@";
    v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B022D000, v12, v13, v11, v20, 0xCu);
LABEL_7:

  v14 = [v4 _clientCompletionHandler];
  if (v14)
  {
    uint64_t v15 = [v4 success];
    v16 = [v4 error];
    v17 = [v4 returnData];
    ((void (**)(void, uint64_t, void *, void *))v14)[2](v14, v15, v16, v17);
  }
  v18 = objc_msgSend(v4, "import", *(_OWORD *)v20);
  v19 = [v18 library];
  [v19 notifyLibraryImportDidFinish];
}

- (id)_suspendedImportOperations
{
  v2 = (void *)[(NSMutableArray *)self->_suspendedImportOperations copy];

  return v2;
}

- (id)_importOperations
{
  v2 = [(NSOperationQueue *)self->_importOperationQueue operations];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)resumeSuspendedImportOperations
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NSMutableArray *)self->_suspendedImportOperations count];
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v4;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Resuming %lu suspended import operation(s)", buf, 0xCu);
  }

  int v5 = (void *)[(NSMutableArray *)self->_suspendedImportOperations copy];
  [(NSMutableArray *)self->_suspendedImportOperations removeAllObjects];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = os_log_create("com.apple.amp.medialibrary", "Service");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v23 = (uint64_t)v10;
          _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Resuming import operation %{public}@", buf, 0xCu);
        }

        v12 = [v10 import];
        uint64_t v13 = [v10 importSource];
        v14 = [v10 _clientCompletionHandler];
        uint64_t v15 = [v10 progressBlock];
        [(ML3DatabaseImportManager *)self performImport:v12 fromSource:v13 progressBlock:v15 withCompletionHandler:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [(NSOperationQueue *)self->_importOperationQueue setSuspended:0];
}

- (void)suspendImportOperations
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSOperationQueue *)self->_importOperationQueue operationCount])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v16 = self;
    v3 = [(NSOperationQueue *)self->_importOperationQueue operations];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v3);
          }
          int v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v10 = [v9 import];
          int v11 = [v10 isSuspendable];

          v12 = os_log_create("com.apple.amp.medialibrary", "Service");
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v13)
            {
              *(_DWORD *)buf = 138543362;
              v22 = v9;
              _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Suspending import operation %{public}@", buf, 0xCu);
            }

            char v6 = 1;
            [v9 setSuspended:1];
            [v9 cancel];
          }
          else
          {
            if (v13)
            {
              *(_DWORD *)buf = 138543362;
              v22 = v9;
              _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Import operation %{public}@ is not suspendable - skipping", buf, 0xCu);
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v5);
    }
    else
    {
      char v6 = 0;
    }

    v14 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Waiting for suspended import operations to finish...", buf, 2u);
    }

    if ((v6 & 1) != 0 && ![(NSOperationQueue *)v16->_importOperationQueue isSuspended])
    {
      [(NSOperationQueue *)v16->_importOperationQueue waitUntilAllOperationsAreFinished];
      [(NSOperationQueue *)v16->_importOperationQueue setSuspended:1];
    }
    uint64_t v15 = os_log_create("com.apple.amp.medialibrary", "Service");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Suspended import operations finished.", buf, 2u);
    }
  }
}

- (void)cancelImportOperationsForSource:(unint64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v7 = [(NSOperationQueue *)self->_importOperationQueue operations];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 importSource] == a3) {
          [v12 cancel];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (void)cancelImportOperationsOriginatingFromClient:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 bundleID];
    *(_DWORD *)buf = 138543618;
    v38 = v6;
    __int16 v39 = 1024;
    int v40 = [v4 processID];
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling any active or suspended import operations in progress for process %{public}@ (process ID = %d)", buf, 0x12u);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [(NSOperationQueue *)self->_importOperationQueue operations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v13 = [v12 import];
        long long v14 = [v13 client];
        int v15 = [v14 isEqual:v4];

        if (v15) {
          [v12 cancel];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  long long v16 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v26 = self;
  long long v17 = self->_suspendedImportOperations;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        uint64_t v23 = [v22 import];
        uint64_t v24 = [v23 client];
        int v25 = [v24 isEqual:v4];

        if (v25) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  [(NSMutableArray *)v26->_suspendedImportOperations removeObjectsInArray:v16];
}

- (void)cancelAllImportOperations
{
  v3 = os_log_create("com.apple.amp.medialibrary", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all import operations.", v4, 2u);
  }

  [(NSOperationQueue *)self->_importOperationQueue setSuspended:0];
  [(NSOperationQueue *)self->_importOperationQueue cancelAllOperations];
  [(NSMutableArray *)self->_suspendedImportOperations removeAllObjects];
}

- (float)currentOperationProgressWithError:(id *)a3
{
  id v4 = [(NSOperationQueue *)self->_importOperationQueue operations];
  uint64_t v5 = [v4 firstObject];

  if (!v5)
  {
    uint64_t v8 = 0;
    float v7 = -1.0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [v5 progress];
  float v7 = v6;
  uint64_t v8 = [v5 error];
  if (a3) {
LABEL_3:
  }
    *a3 = v8;
LABEL_4:

  return v7;
}

- (void)performImport:(id)a3 fromSource:(unint64_t)a4 progressBlock:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v13 = +[ML3ImportOperation importOperationWithSourceType:a4 databaseImport:v10];
  [v13 _setClientCompletionHandler:v12];
  [v13 setProgressBlock:v11];
  objc_initWeak(&location, v13);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__ML3DatabaseImportManager_performImport_fromSource_progressBlock_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E5FB5030;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  [v13 setCompletionBlock:v14];
  [(NSOperationQueue *)self->_importOperationQueue addOperation:v13];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __89__ML3DatabaseImportManager_performImport_fromSource_progressBlock_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained isCancelled];
  v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _handleImportOperationCancelled:WeakRetained];
  }
  else {
    [v3 _handleImportOperationCompleted:WeakRetained];
  }
}

- (BOOL)isSuspended
{
  return [(NSOperationQueue *)self->_importOperationQueue isSuspended];
}

- (unint64_t)suspendedOperationsCount
{
  return [(NSMutableArray *)self->_suspendedImportOperations count];
}

- (unint64_t)operationsCount
{
  return [(NSOperationQueue *)self->_importOperationQueue operationCount];
}

- (ML3DatabaseImportManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ML3DatabaseImportManager;
  int v2 = [(ML3DatabaseImportManager *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    importOperationQueue = v2->_importOperationQueue;
    v2->_importOperationQueue = v3;

    [(NSOperationQueue *)v2->_importOperationQueue setName:@"com.apple.medialibraryd.importOperationQueue"];
    [(NSOperationQueue *)v2->_importOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_importOperationQueue setQualityOfService:-1];
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    suspendedImportOperations = v2->_suspendedImportOperations;
    v2->_suspendedImportOperations = v5;
  }
  return v2;
}

@end