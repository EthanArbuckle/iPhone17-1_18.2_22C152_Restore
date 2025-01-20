@interface PLManagedObjectPagingIterator
+ (id)_nextBatchOfResultsWithManagedObjectContext:(id)a3 entityName:(id)a4 resultType:(unint64_t)a5 resumeObjectID:(id)a6 additionalPredicate:(id)a7 batchSize:(unint64_t)a8 propertiesToFetch:(id)a9 relationshipKeyPathsToPrefetch:(id)a10;
- (BOOL)_lock_shouldFetchCountRemaining;
- (NSArray)propertiesToFetch;
- (NSArray)relationshipKeyPathsToPrefetch;
- (NSManagedObjectID)resumeObjectID;
- (NSPredicate)additionalPredicate;
- (NSString)entityName;
- (PLManagedObjectPagingIterator)initWithEntityName:(id)a3 resultType:(unint64_t)a4 resumeObjectID:(id)a5 additionalPredicate:(id)a6;
- (PLManagedObjectPagingIterator)initWithEntityName:(id)a3 resultType:(unint64_t)a4 resumeObjectID:(id)a5 additionalPredicate:(id)a6 batchSize:(unint64_t)a7 propertiesToFetch:(id)a8 relationshipKeyPathsToPrefetch:(id)a9;
- (id)_neverCallWithLock_refillResultQueueWithManagedObjectContext:(id)a3;
- (id)countRemainingWithManagedObjectContext:(id)a3 logger:(id)a4;
- (id)nextBatchWithManagedObjectContext:(id)a3;
- (id)nextObjectWithManagedObjectContext:(id)a3;
- (unint64_t)batchSize;
- (unint64_t)resultType;
- (void)_updateResumeObjectIDWithObject:(id)a3 progressCount:(unint64_t)a4;
- (void)reset;
@end

@implementation PLManagedObjectPagingIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipKeyPathsToPrefetch, 0);
  objc_storeStrong((id *)&self->_propertiesToFetch, 0);
  objc_storeStrong((id *)&self->_additionalPredicate, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_lock_resultQueue, 0);
  objc_storeStrong((id *)&self->_lock_lastFetchCountTime, 0);
  objc_storeStrong((id *)&self->_lock_resumeObjectID, 0);
}

- (NSArray)relationshipKeyPathsToPrefetch
{
  return self->_relationshipKeyPathsToPrefetch;
}

- (NSArray)propertiesToFetch
{
  return self->_propertiesToFetch;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSPredicate)additionalPredicate
{
  return self->_additionalPredicate;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)reset
{
}

uint64_t __38__PLManagedObjectPagingIterator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return result;
}

- (NSManagedObjectID)resumeObjectID
{
  uint64_t v2 = PLSafeResultWithUnfairLock();
  return (NSManagedObjectID *)v2;
}

id __47__PLManagedObjectPagingIterator_resumeObjectID__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (id)countRemainingWithManagedObjectContext:(id)a3 logger:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v44 = MEMORY[0x1E4F143A8];
  uint64_t v45 = 3221225472;
  v46 = __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke;
  v47 = &unk_1E58708B0;
  v48 = self;
  if (PLBoolResultWithUnfairLock())
  {
    v8 = [MEMORY[0x1E4F8B9B8] successWithResult:&unk_1EEBEF7B0];
  }
  else
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__75476;
    v38 = __Block_byref_object_dispose__75477;
    id v39 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    v9 = [(PLManagedObjectPagingIterator *)self resumeObjectID];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke_25;
    v24[3] = &unk_1E58737F8;
    v27 = &v30;
    v24[4] = self;
    id v10 = v9;
    id v25 = v10;
    v28 = &v40;
    id v26 = v6;
    v29 = &v34;
    [v26 performBlockAndWait:v24];
    if (*((unsigned char *)v31 + 24))
    {
      if (v41[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = PLSearchBackendIndexingEngineGetLog();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

        if (v12)
        {
          if (v7)
          {
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            memset(buf, 0, sizeof(buf));
            v13 = PLSearchBackendIndexingEngineGetLog();
            os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
            v14 = [(PLManagedObjectPagingIterator *)self entityName];
            uint64_t v15 = v41[3];
            int v49 = 138543618;
            v50 = v14;
            __int16 v51 = 2048;
            uint64_t v52 = v15;
            LODWORD(v23) = 22;
            v16 = (uint8_t *)_os_log_send_and_compose_impl();

            objc_msgSend(v7, "logWithMessage:fromCodeLocation:type:", v16, "PLManagedObjectPagingIterator.m", 206, 0, &v49, v23);
            if (v16 != buf) {
              free(v16);
            }
          }
          else
          {
            v17 = PLSearchBackendIndexingEngineGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = [(PLManagedObjectPagingIterator *)self entityName];
              uint64_t v19 = v41[3];
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v18;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v19;
              _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Remaining count for search indexing entity %{public}@: %tu", buf, 0x16u);
            }
          }
        }
      }
    }
    v20 = (void *)MEMORY[0x1E4F8B9B8];
    if (v41[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v35[5]];
    }
    else
    {
      v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      v8 = [v20 successWithResult:v21];
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }

  return v8;
}

uint64_t __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
}

void __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke_25(void *a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  obj[1] = (id)MEMORY[0x1E4F143A8];
  obj[2] = (id)3221225472;
  obj[3] = __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke_2;
  obj[4] = &unk_1E58708B0;
  obj[5] = v2;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = PLBoolResultWithUnfairLock();
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1[4] + 56)];
    uint64_t v4 = (void *)MEMORY[0x1E4F28BA0];
    v5 = *(void **)(a1[4] + 72);
    id v6 = v5;
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    v14[0] = v6;
    if (a1[5]) {
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"self < %@", a1[5]];
    }
    else {
    id v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    v14[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v9 = [v4 andPredicateWithSubpredicates:v8];
    [v3 setPredicate:v9];

    if (!v5) {
    id v10 = (void *)a1[6];
    }
    uint64_t v11 = *(void *)(a1[9] + 8);
    obj[0] = *(id *)(v11 + 40);
    uint64_t v12 = [v10 countForFetchRequest:v3 error:obj];
    objc_storeStrong((id *)(v11 + 40), obj[0]);
    *(void *)(*(void *)(a1[8] + 8) + 24) = v12;
    PLSafeRunWithUnfairLock();
  }
  else
  {
    PLSafeRunWithUnfairLock();
  }
}

uint64_t __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_shouldFetchCountRemaining");
}

void __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __79__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext_logger___block_invoke_4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (id)nextBatchWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  if (PLBoolResultWithUnfairLock())
  {
    v5 = 0;
    goto LABEL_12;
  }
  if (!PLBoolResultWithUnfairLock())
  {
LABEL_8:
    v9 = PLSafeResultWithUnfairLock();
    if ([v9 count])
    {
      v5 = [MEMORY[0x1E4F8B9B8] successWithResult:v9];
      id v10 = [v9 lastObject];
      -[PLManagedObjectPagingIterator _updateResumeObjectIDWithObject:progressCount:](self, "_updateResumeObjectIDWithObject:progressCount:", v10, [v9 count]);
    }
    else
    {
      v5 = 0;
    }

    goto LABEL_12;
  }
  id v6 = [(PLManagedObjectPagingIterator *)self _neverCallWithLock_refillResultQueueWithManagedObjectContext:v4];
  if (([v6 isFailure] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v7 = (void *)MEMORY[0x1E4F8B9B8];
  v8 = [v6 error];
  v5 = [v7 failureWithError:v8];

  if (!v5) {
    goto LABEL_8;
  }
LABEL_12:

  return v5;
}

uint64_t __67__PLManagedObjectPagingIterator_nextBatchWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
}

BOOL __67__PLManagedObjectPagingIterator_nextBatchWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) count] == 0;
}

id __67__PLManagedObjectPagingIterator_nextBatchWithManagedObjectContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(*(void *)(a1 + 32) + 48)];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  return v2;
}

- (id)nextObjectWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  if (PLBoolResultWithUnfairLock())
  {
    v5 = 0;
    goto LABEL_12;
  }
  if (!PLBoolResultWithUnfairLock())
  {
LABEL_8:
    v9 = PLResultWithUnfairLock();
    if (v9)
    {
      v5 = [MEMORY[0x1E4F8B9B8] successWithResult:v9];
      [(PLManagedObjectPagingIterator *)self _updateResumeObjectIDWithObject:v9 progressCount:1];
    }
    else
    {
      v5 = 0;
    }

    goto LABEL_12;
  }
  id v6 = [(PLManagedObjectPagingIterator *)self _neverCallWithLock_refillResultQueueWithManagedObjectContext:v4];
  if (([v6 isFailure] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v7 = (void *)MEMORY[0x1E4F8B9B8];
  v8 = [v6 error];
  v5 = [v7 failureWithError:v8];

  if (!v5) {
    goto LABEL_8;
  }
LABEL_12:

  return v5;
}

uint64_t __68__PLManagedObjectPagingIterator_nextObjectWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
}

BOOL __68__PLManagedObjectPagingIterator_nextObjectWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) count] == 0;
}

id __68__PLManagedObjectPagingIterator_nextObjectWithManagedObjectContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) firstObject];
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 48) removeObjectAtIndex:0];
  }
  return v2;
}

- (void)_updateResumeObjectIDWithObject:(id)a3 progressCount:(unint64_t)a4
{
  id v5 = a3;
  id v4 = v5;
  PLSafeRunWithUnfairLock();
}

void __79__PLManagedObjectPagingIterator__updateResumeObjectIDWithObject_progressCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[8];
  if (v3 == 1)
  {
    id v7 = *(id *)(a1 + 40);
    id v6 = (void *)v2[2];
    v2[2] = v7;
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    uint64_t v4 = [*(id *)(a1 + 40) objectID];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }

  uint64_t v2 = *(void **)(a1 + 32);
LABEL_6:
  unint64_t v8 = *(void *)(a1 + 48);
  unint64_t v9 = v2[3];
  BOOL v10 = v9 >= v8;
  unint64_t v11 = v9 - v8;
  if (v10)
  {
    v2[3] = v11;
  }
  else
  {
    uint64_t v12 = (void *)v2[4];
    v2[4] = 0;

    *(void *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

- (id)_neverCallWithLock_refillResultQueueWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__75476;
  uint64_t v15 = __Block_byref_object_dispose__75477;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke;
  v8[3] = &unk_1E5875340;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke(void *a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = v3[7];
  uint64_t v6 = v3[8];
  id v7 = [v3 resumeObjectID];
  unint64_t v8 = [v2 _nextBatchOfResultsWithManagedObjectContext:v4 entityName:v5 resultType:v6 resumeObjectID:v7 additionalPredicate:*(void *)(a1[4] + 72) batchSize:*(void *)(a1[4] + 80) propertiesToFetch:*(void *)(a1[4] + 88) relationshipKeyPathsToPrefetch:*(void *)(a1[4] + 96)];

  if ([v8 isFailure])
  {
    id v9 = (void *)MEMORY[0x1E4F8B9B8];
    BOOL v10 = [v8 error];
    uint64_t v11 = [v9 failureWithError:v10];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    v14 = [v8 result];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      id v21 = v8;
      PLSafeRunWithUnfairLock();
    }
    else
    {
      PLSafeRunWithUnfairLock();
    }
    id v16 = (void *)MEMORY[0x1E4F8B9B8];
    v17 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v18 = [v16 successWithResult:v17];

    uint64_t v19 = *(void *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

uint64_t __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  return result;
}

void __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(a1 + 40) result];
  [v1 addObjectsFromArray:v2];
}

- (BOOL)_lock_shouldFetchCountRemaining
{
  BOOL result = !self->_lock_lastFetchCountTime
        || ([MEMORY[0x1E4F1C9C8] date],
            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
            [v3 timeIntervalSinceDate:self->_lock_lastFetchCountTime],
            double v5 = v4,
            v3,
            v5 > 300.0)
        || self->_lock_countRemaining == 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (PLManagedObjectPagingIterator)initWithEntityName:(id)a3 resultType:(unint64_t)a4 resumeObjectID:(id)a5 additionalPredicate:(id)a6 batchSize:(unint64_t)a7 propertiesToFetch:(id)a8 relationshipKeyPathsToPrefetch:(id)a9
{
  id v27 = a3;
  id v26 = a5;
  id v25 = a6;
  id v16 = a8;
  id v17 = a9;
  if (a4 >= 2)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLManagedObjectPagingIterator.m", 38, @"Invalid parameter not satisfying: %@", @"resultType == NSManagedObjectResultType || resultType == NSManagedObjectIDResultType" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)PLManagedObjectPagingIterator;
  uint64_t v18 = [(PLManagedObjectPagingIterator *)&v28 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityName, a3);
    v19->_resultType = a4;
    objc_storeStrong((id *)&v19->_lock_resumeObjectID, a5);
    objc_storeStrong((id *)&v19->_additionalPredicate, a6);
    v19->_batchSize = a7;
    objc_storeStrong((id *)&v19->_propertiesToFetch, a8);
    objc_storeStrong((id *)&v19->_relationshipKeyPathsToPrefetch, a9);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_resultQueue = v19->_lock_resultQueue;
    v19->_lock_resultQueue = v20;

    v19->_lock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

- (PLManagedObjectPagingIterator)initWithEntityName:(id)a3 resultType:(unint64_t)a4 resumeObjectID:(id)a5 additionalPredicate:(id)a6
{
  return [(PLManagedObjectPagingIterator *)self initWithEntityName:a3 resultType:a4 resumeObjectID:a5 additionalPredicate:a6 batchSize:100 propertiesToFetch:0 relationshipKeyPathsToPrefetch:0];
}

+ (id)_nextBatchOfResultsWithManagedObjectContext:(id)a3 entityName:(id)a4 resultType:(unint64_t)a5 resumeObjectID:(id)a6 additionalPredicate:(id)a7 batchSize:(unint64_t)a8 propertiesToFetch:(id)a9 relationshipKeyPathsToPrefetch:(id)a10
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = (void *)MEMORY[0x1E4F1C0D0];
  id v16 = a10;
  id v17 = a9;
  id v18 = a3;
  uint64_t v19 = [v15 fetchRequestWithEntityName:a4];
  v20 = (void *)MEMORY[0x1E4F28BA0];
  id v21 = v14;
  if (!v14)
  {
    id v21 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v36[0] = v21;
  char v33 = v13;
  if (v13) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"self < %@", v13];
  }
  else {
  v22 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v36[1] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v24 = [v20 andPredicateWithSubpredicates:v23];
  [v19 setPredicate:v24];

  if (!v14) {
  id v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  }
  v35 = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  [v19 setSortDescriptors:v26];

  [v19 setFetchLimit:a8];
  [v19 setResultType:a5];
  [v19 setIncludesPendingChanges:0];
  [v19 setPropertiesToFetch:v17];

  [v19 setRelationshipKeyPathsForPrefetching:v16];
  id v34 = 0;
  id v27 = [v18 executeFetchRequest:v19 error:&v34];

  id v28 = v34;
  if (v27) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v27];
  }
  else {
  v29 = [MEMORY[0x1E4F8B9B8] failureWithError:v28];
  }

  return v29;
}

@end