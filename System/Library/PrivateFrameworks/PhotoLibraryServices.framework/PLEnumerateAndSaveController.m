@interface PLEnumerateAndSaveController
+ (BOOL)_concurrencyLimiterEnabledForContext:(id)a3;
+ (void)disableConcurrencyLimiterForContext:(id)a3;
- (BOOL)concurrent;
- (BOOL)isCancelled;
- (BOOL)processObjectsWithError:(id *)a3;
- (BOOL)refreshesAllAfterSave;
- (BOOL)succeeded;
- (NSError)firstError;
- (NSFetchRequest)originalFetchRequest;
- (NSManagedObjectContext)originalContext;
- (NSOperationQueue)operationQueue;
- (NSString)operationName;
- (PLEnumerateAndSaveController)initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultBlock:(id)a11;
- (PLEnumerateAndSaveController)initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultsBlock:(id)a11;
- (PLPhotoLibraryPathManager)pathManager;
- (id)_initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultBlock:(id)a11 processResultsBlock:(id)a12;
- (id)didFetchObjectIDsBlock;
- (id)generateContextBlock;
- (id)processResultBlock;
- (id)processResultsBlock;
- (int64_t)itemsPerBatch;
- (void)_inq_runOperationWithObjectIDs:(id)a3 onContext:(id)a4;
- (void)setConcurrent:(BOOL)a3;
- (void)setDidFetchObjectIDsBlock:(id)a3;
- (void)setFirstError:(id)a3;
- (void)setGenerateContextBlock:(id)a3;
- (void)setItemsPerBatch:(int64_t)a3;
- (void)setOperationName:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOriginalContext:(id)a3;
- (void)setOriginalFetchRequest:(id)a3;
- (void)setPathManager:(id)a3;
- (void)setProcessResultBlock:(id)a3;
- (void)setProcessResultsBlock:(id)a3;
- (void)setRefreshesAllAfterSave:(BOOL)a3;
- (void)setSucceeded:(BOOL)a3;
@end

@implementation PLEnumerateAndSaveController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong(&self->_didFetchObjectIDsBlock, 0);
  objc_storeStrong(&self->_generateContextBlock, 0);
  objc_storeStrong(&self->_processResultsBlock, 0);
  objc_storeStrong(&self->_processResultBlock, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_originalFetchRequest, 0);
  objc_storeStrong((id *)&self->_originalContext, 0);
  objc_storeStrong((id *)&self->_operationName, 0);
}

- (void)setFirstError:(id)a3
{
}

- (NSError)firstError
{
  return self->_firstError;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setDidFetchObjectIDsBlock:(id)a3
{
}

- (id)didFetchObjectIDsBlock
{
  return self->_didFetchObjectIDsBlock;
}

- (void)setGenerateContextBlock:(id)a3
{
}

- (id)generateContextBlock
{
  return self->_generateContextBlock;
}

- (void)setProcessResultsBlock:(id)a3
{
}

- (id)processResultsBlock
{
  return self->_processResultsBlock;
}

- (void)setProcessResultBlock:(id)a3
{
}

- (id)processResultBlock
{
  return self->_processResultBlock;
}

- (void)setRefreshesAllAfterSave:(BOOL)a3
{
  self->_refreshesAllAfterSave = a3;
}

- (BOOL)refreshesAllAfterSave
{
  return self->_refreshesAllAfterSave;
}

- (void)setPathManager:(id)a3
{
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOriginalFetchRequest:(id)a3
{
}

- (NSFetchRequest)originalFetchRequest
{
  return self->_originalFetchRequest;
}

- (void)setOriginalContext:(id)a3
{
}

- (NSManagedObjectContext)originalContext
{
  return self->_originalContext;
}

- (void)setOperationName:(id)a3
{
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setConcurrent:(BOOL)a3
{
  self->_concurrent = a3;
}

- (BOOL)concurrent
{
  return self->_concurrent;
}

- (void)setItemsPerBatch:(int64_t)a3
{
  self->_itemsPerBatch = a3;
}

- (int64_t)itemsPerBatch
{
  return self->_itemsPerBatch;
}

- (BOOL)processObjectsWithError:(id *)a3
{
  atomic_store(0, (unsigned __int8 *)&self->_cancelled);
  v5 = [(PLEnumerateAndSaveController *)self originalFetchRequest];
  v6 = (void *)[v5 copy];

  [v6 setResultType:1];
  [v6 setIncludesPropertyValues:0];
  [v6 setIncludesPendingChanges:0];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__99668;
  v61 = __Block_byref_object_dispose__99669;
  id v62 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__99668;
  v55 = __Block_byref_object_dispose__99669;
  id v56 = 0;
  v7 = [(PLEnumerateAndSaveController *)self originalContext];
  int v34 = [(id)objc_opt_class() _concurrencyLimiterEnabledForContext:v7];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke;
  v46[3] = &unk_1E5874900;
  v49 = &v57;
  id v8 = v7;
  id v47 = v8;
  id v9 = v6;
  id v48 = v9;
  v50 = &v51;
  v10 = (void (**)(void))MEMORY[0x19F38D650](v46);
  uint64_t v11 = [v8 concurrencyType];
  if (*MEMORY[0x1E4F1C1C0] == v11 || !v11)
  {
    v10[2](v10);
  }
  else
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_2;
    v43[3] = &unk_1E58742F0;
    id v12 = v8;
    id v44 = v12;
    v13 = v10;
    id v45 = v13;
    uint64_t v14 = MEMORY[0x19F38D650](v43);
    v15 = (void *)v14;
    if (v34)
    {
      v16 = +[PLConcurrencyLimiter sharedLimiter];
      v17 = [v12 photoLibrary];
      [v16 sync:v15 identifyingBlock:v13 library:v17];
    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
  }
  if (!v58[5])
  {
    [(PLEnumerateAndSaveController *)self setSucceeded:0];
    [(PLEnumerateAndSaveController *)self setFirstError:v52[5]];
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v18 = [(PLEnumerateAndSaveController *)self didFetchObjectIDsBlock];

  if (v18)
  {
    v19 = [(PLEnumerateAndSaveController *)self didFetchObjectIDsBlock];
    v19[2](v19, v58[5]);
  }
  int64_t v20 = [(PLEnumerateAndSaveController *)self itemsPerBatch];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v20];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23 = (void *)v58[5];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_3;
  v38[3] = &unk_1E5872438;
  id v24 = v21;
  id v39 = v24;
  v41 = &v57;
  int64_t v42 = v20;
  id v25 = v22;
  id v40 = v25;
  [v23 enumerateObjectsUsingBlock:v38];
  if (self->_concurrent)
  {
    v26 = 0;
  }
  else
  {
    id v27 = [(PLEnumerateAndSaveController *)self operationName];
    v28 = (const char *)[v27 UTF8String];
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = dispatch_queue_create(v28, v29);
  }
  size_t v30 = [v25 count];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_4;
  block[3] = &unk_1E5872460;
  block[4] = self;
  id v36 = v25;
  char v37 = v34;
  id v31 = v25;
  dispatch_apply(v30, v26, block);

  if (a3)
  {
LABEL_17:
    *a3 = [(PLEnumerateAndSaveController *)self firstError];
  }
LABEL_18:
  BOOL v32 = [(PLEnumerateAndSaveController *)self succeeded];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v32;
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBlockAndWait:*(void *)(a1 + 40)];
}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result == *(void *)(a1 + 56) || v5 - 1 == a3)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = (void *)[*(id *)(a1 + 32) copy];
    [v8 addObject:v9];

    v10 = *(void **)(a1 + 32);
    return [v10 removeAllObjects];
  }
  return result;
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 8));
  if ((v2 & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    v7 = [*(id *)(a1 + 32) generateContextBlock];
    id v8 = v7[2]();

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_5;
    v18[3] = &unk_1E5873A50;
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 32);
    id v19 = v9;
    uint64_t v20 = v10;
    id v11 = v6;
    id v21 = v11;
    uint64_t v12 = MEMORY[0x19F38D650](v18);
    v13 = (void *)v12;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 9) || !*(unsigned char *)(a1 + 48))
    {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    }
    else
    {
      uint64_t v14 = +[PLConcurrencyLimiter sharedLimiter];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      id v17 = v13;
      v15 = objc_msgSend(v9, "photoLibrary", v16, 3221225472, __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_8, &unk_1E5875198);
      [v14 sync:&v16 identifyingBlock:0 library:v15];
    }
  }
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_5(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_6;
  v5[3] = &unk_1E5873A50;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v8 = v4;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v5];
}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_6(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_7;
  v4[3] = &unk_1E5873A50;
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "pl_performBlockAndWait:", v4);
}

uint64_t __56__PLEnumerateAndSaveController_processObjectsWithError___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inq_runOperationWithObjectIDs:onContext:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (void)_inq_runOperationWithObjectIDs:(id)a3 onContext:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v7 = a4;
  if (!v7)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 115, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v8 = [(PLEnumerateAndSaveController *)self originalFetchRequest];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v30];
  [v9 setPredicate:v10];

  id v36 = 0;
  id v11 = [v7 executeFetchRequest:v9 error:&v36];
  id v29 = v36;
  if (v11)
  {
    uint64_t v12 = [(PLEnumerateAndSaveController *)self processResultsBlock];

    if (v12)
    {
      buf[0] = 0;
      v13 = [(PLEnumerateAndSaveController *)self processResultsBlock];
      ((void (**)(void, id, void *, uint8_t *))v13)[2](v13, v7, v11, buf);

      if (buf[0]) {
        atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
      }
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = v11;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            buf[0] = 0;
            id v22 = [(PLEnumerateAndSaveController *)self processResultBlock];
            ((void (**)(void, id, uint64_t, uint8_t *))v22)[2](v22, v7, v21, buf);

            if (buf[0])
            {
              atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
              goto LABEL_22;
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_22:
    }
    if ([v7 hasChanges])
    {
      id v31 = 0;
      char v23 = [v7 save:&v31];
      id v24 = v31;
      if ((v23 & 1) == 0)
      {
        id v25 = PLMigrationGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = [(PLEnumerateAndSaveController *)self operationName];
          *(_DWORD *)buf = 138412546;
          v38 = v26;
          __int16 v39 = 2112;
          id v40 = v24;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "PLMigrationEnumerateAndSave (%@) error saving changes from batch: %@, cancelling remaining operations.", buf, 0x16u);
        }
        id v27 = self;
        objc_sync_enter(v27);
        if ([(PLEnumerateAndSaveController *)v27 succeeded])
        {
          [(PLEnumerateAndSaveController *)v27 setSucceeded:0];
          [(PLEnumerateAndSaveController *)v27 setFirstError:v24];
        }
        objc_sync_exit(v27);

        atomic_store(1u, (unsigned __int8 *)&v27->_cancelled);
      }
      if ([(PLEnumerateAndSaveController *)self refreshesAllAfterSave]) {
        [v7 refreshAllObjects];
      }
    }
  }
  else
  {
    uint64_t v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [(PLEnumerateAndSaveController *)self operationName];
      *(_DWORD *)buf = 138412546;
      v38 = v15;
      __int16 v39 = 2112;
      id v40 = v29;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "PLMigrationEnumerateAndSave (%@) error fetching batch: %@, cancelling remaining operations.", buf, 0x16u);
    }
    uint64_t v16 = self;
    objc_sync_enter(v16);
    if ([(PLEnumerateAndSaveController *)v16 succeeded])
    {
      [(PLEnumerateAndSaveController *)v16 setSucceeded:0];
      [(PLEnumerateAndSaveController *)v16 setFirstError:v29];
    }
    objc_sync_exit(v16);

    atomic_store(1u, (unsigned __int8 *)&v16->_cancelled);
  }
}

- (id)_initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultBlock:(id)a11 processResultsBlock:(id)a12
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  id v18 = a5;
  id v48 = a6;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v49 = v16;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 88, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  id v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 89, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

LABEL_3:
  id v24 = v21;
  if (!v18)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 90, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v25 = v22;
  if (!v19)
  {
    uint64_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 91, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  v26 = v23;
  if (!v20)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 92, @"Invalid parameter not satisfying: %@", @"generateContextBlock" object file lineNumber description];
  }
  v51.receiver = self;
  v51.super_class = (Class)PLEnumerateAndSaveController;
  id v27 = [(PLEnumerateAndSaveController *)&v51 init];
  v28 = v27;
  if (v27)
  {
    v27->_concurrent = a7;
    v27->_refreshesAllAfterSave = a8;
    objc_storeStrong((id *)&v27->_operationName, a3);
    objc_storeStrong((id *)&v28->_originalContext, a5);
    objc_storeStrong((id *)&v28->_originalFetchRequest, obj);
    objc_storeStrong((id *)&v28->_pathManager, v48);
    uint64_t v29 = MEMORY[0x19F38D650](v25);
    id processResultBlock = v28->_processResultBlock;
    v28->_id processResultBlock = (id)v29;

    uint64_t v31 = MEMORY[0x19F38D650](v26);
    id processResultsBlock = v28->_processResultsBlock;
    v28->_id processResultsBlock = (id)v31;

    uint64_t v33 = MEMORY[0x19F38D650](v20);
    id generateContextBlock = v28->_generateContextBlock;
    v28->_id generateContextBlock = (id)v33;

    uint64_t v35 = MEMORY[0x19F38D650](v24);
    id didFetchObjectIDsBlock = v28->_didFetchObjectIDsBlock;
    v28->_id didFetchObjectIDsBlock = (id)v35;

    v28->_succeeded = 1;
    firstError = v28->_firstError;
    v28->_firstError = 0;

    v28->_itemsPerBatch = 200;
  }

  return v28;
}

- (PLEnumerateAndSaveController)initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultsBlock:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (!v23)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 74, @"Invalid parameter not satisfying: %@", @"processResultsBlock" object file lineNumber description];
  }
  id v24 = [(PLEnumerateAndSaveController *)self _initWithName:v17 fetchRequest:v18 context:v19 pathManager:v20 concurrent:v12 refreshAllAfterSave:v11 generateContextBlock:v21 didFetchObjectIDsBlock:v22 processResultBlock:0 processResultsBlock:v23];

  return v24;
}

- (PLEnumerateAndSaveController)initWithName:(id)a3 fetchRequest:(id)a4 context:(id)a5 pathManager:(id)a6 concurrent:(BOOL)a7 refreshAllAfterSave:(BOOL)a8 generateContextBlock:(id)a9 didFetchObjectIDsBlock:(id)a10 processResultBlock:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (!v23)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLEnumerateAndSaveController.m", 61, @"Invalid parameter not satisfying: %@", @"processResultBlock" object file lineNumber description];
  }
  id v24 = [(PLEnumerateAndSaveController *)self _initWithName:v17 fetchRequest:v18 context:v19 pathManager:v20 concurrent:v12 refreshAllAfterSave:v11 generateContextBlock:v21 didFetchObjectIDsBlock:v22 processResultBlock:v23 processResultsBlock:0];

  return v24;
}

+ (BOOL)_concurrencyLimiterEnabledForContext:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PLEnumerateAndSaveController__concurrencyLimiterEnabledForContext___block_invoke;
  v7[3] = &unk_1E5875E68;
  id v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  objc_msgSend(v4, "pl_performBlockAndWait:", v7);
  BOOL v5 = *((unsigned char *)v11 + 24) == 0;

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __69__PLEnumerateAndSaveController__concurrencyLimiterEnabledForContext___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userInfo];
  unsigned __int8 v2 = [v3 objectForKeyedSubscript:@"PLEnumerateAndSaveControllerDisableConcurrencyLimiter"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 BOOLValue];
}

+ (void)disableConcurrencyLimiterForContext:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PLEnumerateAndSaveController_disableConcurrencyLimiterForContext___block_invoke;
  v5[3] = &unk_1E5875CE0;
  id v6 = v3;
  id v4 = v3;
  objc_msgSend(v4, "pl_performBlockAndWait:", v5);
}

void __68__PLEnumerateAndSaveController_disableConcurrencyLimiterForContext___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userInfo];
  [v1 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PLEnumerateAndSaveControllerDisableConcurrencyLimiter"];
}

@end