@interface PLAssetAnalysisState
+ (BOOL)_bulkUpdateAnalysisStatesTo:(int)a3 predicate:(id)a4 library:(id)a5 error:(id *)a6;
+ (BOOL)cleanupInvalidIgnoreUntilDatesInLibraryAtURL:(id)a3 error:(id *)a4;
+ (BOOL)clearIgnoreUntilDatesInLibraryAtURL:(id)a3 error:(id *)a4;
+ (BOOL)isUnitTestWorker:(signed __int16)a3;
+ (BOOL)markStatesProcessedForWorkerType:(signed __int16)a3 library:(id)a4 error:(id *)a5;
+ (BOOL)resetFaceCropAnalysisStateInLibraryAtURL:(id)a3 error:(id *)a4;
+ (BOOL)resetPendingStatesInLibraryAtURL:(id)a3 error:(id *)a4;
+ (id)_batchOperationQueue;
+ (id)_countOfAnalysisStatesByWorkerTypeWithPredicate:(id)a3 analysisState:(int)a4 forDeletedAssets:(BOOL)a5 inContext:(id)a6 error:(id *)a7;
+ (id)_managedObjectContextForStateChangesWithLibraryURL:(id)a3;
+ (id)_managedObjectContextForStateChangesWithPersistentStoreCoordinator:(id)a3;
+ (id)_sanitizeChanges:(id)a3;
+ (id)_subArrayOfChanges:(id)a3 toRetryWithConflicts:(id)a4;
+ (id)analysisCountsForWorkerType:(signed __int16)a3 library:(id)a4;
+ (id)assetUUIDsFromAssetObjectIDs:(id)a3 library:(id)a4 whereAllWorkerTypes:(id)a5 matchState:(id)a6;
+ (id)deletedAssetUUIDsForAnalysisByWorkerType:(signed __int16)a3 fetchLimit:(unint64_t)a4 inLibrary:(id)a5 error:(id *)a6;
+ (id)entityName;
+ (id)keyPathDictionaryWithWorkerType:(signed __int16)a3 workerFlags:(int)a4 analysisState:(int)a5 lastIgnoredDate:(id)a6 ignoreUntilDate:(id)a7;
+ (id)workerTypesPersistingAnalysisState;
+ (int)defaultWorkerFlagsForWorkerType:(signed __int16)a3;
+ (unint64_t)_countOfAssetsAllowedForProcessingInLibrary:(id)a3 error:(id *)a4;
+ (void)_removeAnalysisRecordsWithPredicate:(id)a3 library:(id)a4;
+ (void)removeAnalysisRecordsForDeletedAssetUUIDs:(id)a3 forWorkerType:(signed __int16)a4 library:(id)a5;
+ (void)removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode:(BOOL)a3 library:(id)a4;
+ (void)requestAnalysisCountsInLibrary:(id)a3 completion:(id)a4;
+ (void)requestCountOfAnalysisRecordsForDeletedAssetsInLibrary:(id)a3 completion:(id)a4;
- (id)debugLogDescription;
- (id)mutableKeyPathDictionary;
- (void)unionWorkerFlags:(int)a3;
@end

@implementation PLAssetAnalysisState

+ (id)entityName
{
  return @"AssetAnalysisState";
}

- (void)unionWorkerFlags:(int)a3
{
  uint64_t v4 = [(PLAssetAnalysisState *)self workerFlags] | a3;
  [(PLAssetAnalysisState *)self setWorkerFlags:v4];
}

- (id)mutableKeyPathDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(PLAssetAnalysisState *)self assetUUID];

  if (v4)
  {
    v5 = [(PLAssetAnalysisState *)self assetUUID];
    [v3 setObject:v5 forKeyedSubscript:@"assetUUID"];
  }
  v6 = objc_msgSend(NSNumber, "numberWithShort:", -[PLAssetAnalysisState workerType](self, "workerType"));
  [v3 setObject:v6 forKeyedSubscript:@"workerType"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[PLAssetAnalysisState analysisState](self, "analysisState"));
  [v3 setObject:v7 forKeyedSubscript:@"analysisState"];

  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[PLAssetAnalysisState workerFlags](self, "workerFlags"));
  [v3 setObject:v8 forKeyedSubscript:@"workerFlags"];

  v9 = [(PLAssetAnalysisState *)self ignoreUntilDate];

  if (v9)
  {
    v10 = [(PLAssetAnalysisState *)self ignoreUntilDate];
    [v3 setObject:v10 forKeyedSubscript:@"ignoreUntilDate"];
  }
  v11 = [(PLAssetAnalysisState *)self lastIgnoredDate];

  if (v11)
  {
    v12 = [(PLAssetAnalysisState *)self lastIgnoredDate];
    [v3 setObject:v12 forKeyedSubscript:@"lastIgnoredDate"];
  }
  return v3;
}

- (id)debugLogDescription
{
  v3 = [(PLAssetAnalysisState *)self ignoreUntilDate];
  uint64_t v4 = (void *)MEMORY[0x1E4F28E78];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  int v7 = [(PLAssetAnalysisState *)self workerType];
  v8 = @"unknown";
  if (!v7) {
    v8 = @"graph";
  }
  if (v7 == 4) {
    v8 = @"face";
  }
  v9 = v8;
  v10 = PLShortDescriptionForAnalysisState([(PLAssetAnalysisState *)self analysisState]);
  v11 = [(PLAssetAnalysisState *)self lastIgnoredDate];
  v12 = [v4 stringWithFormat:@"<%@: %p> - type: %@, state: %@, last-ignored: %@, ignore-until: %@", v6, self, v9, v10, v11, v3];

  if (v3)
  {
    [v3 timeIntervalSinceNow];
    [v12 appendFormat:@" (%.2f seconds from now)", v13];
  }

  return v12;
}

+ (int)defaultWorkerFlagsForWorkerType:(signed __int16)a3
{
  return a3 == 4;
}

+ (void)removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode:(BOOL)a3 library:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  int v7 = [a1 _batchOperationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke;
  block[3] = &unk_1E5875A90;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  v14 = &v19;
  dispatch_sync(v7, block);

  if (*((unsigned char *)v16 + 24) && v4 && (unint64_t)v20[3] > 0xF4240)
  {
    v9 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v20[3];
      *(_DWORD *)buf = 134218240;
      uint64_t v24 = v10;
      __int16 v25 = 2048;
      uint64_t v26 = 1000000;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Too many orphaned asset analysis state records (%ld > %ld)", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke_2;
  v4[3] = &unk_1E5875A90;
  id v5 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  [v5 performBlockAndWait:v4];
}

void __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke_2(uint64_t a1)
{
  *(void *)&v26[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  BOOL v4 = +[PLAssetAnalysisState entityName];
  id v5 = (void *)[v3 initWithEntityName:v4];

  long long v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assetUUID == NULL OR asset == NULL"];
  [v5 setPredicate:v6];
  [v5 setFetchLimit:10000];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v5];
  [v7 setResultType:2];
  [v7 setShouldPerformSecureOperation:1];
  id v24 = 0;
  id v8 = [v2 executeRequest:v7 error:&v24];
  id v9 = v24;
  if (v8)
  {
    uint64_t v10 = [v8 result];
    uint64_t v11 = [v10 integerValue];

    if (v11 < 1)
    {
      v14 = PLAssetAnalysisGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "No analysis states deleted", buf, 2u);
      }
    }
    else
    {
      if ((unint64_t)v11 >> 4 < 0x271)
      {
        id v12 = @"done";
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        id v12 = @"deleted full batch";
      }
      uint64_t v15 = PLAssetAnalysisGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v26[0] = v11;
        LOWORD(v26[1]) = 2114;
        *(void *)((char *)&v26[1] + 2) = v12;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "deleted %d analysis states, %{public}@", buf, 0x12u);
      }
    }
  }
  else
  {
    uint64_t v13 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v26 = v9;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "error deleting orphaned states: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [v5 setFetchLimit:0];
    id v23 = v9;
    uint64_t v16 = [v2 countForFetchRequest:v5 error:&v23];
    id v17 = v23;

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v16;
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v19 = PLAssetAnalysisGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v26 = v17;
        uint64_t v21 = "Failed to fetch count of orphaned analysis state records %@";
LABEL_22:
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
    }
    else if (v20)
    {
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v26 = v22;
      uint64_t v21 = "Found %tu orphaned analysis state records";
      goto LABEL_22;
    }

    goto LABEL_24;
  }
  id v17 = v9;
LABEL_24:
}

+ (void)removeAnalysisRecordsForDeletedAssetUUIDs:(id)a3 forWorkerType:(signed __int16)a4 library:(id)a5
{
  int v6 = a4;
  id v14 = a3;
  id v9 = a5;
  id v10 = v14;
  id v11 = v9;
  if (!v14)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLAssetAnalysisState.m", 796, @"Invalid parameter not satisfying: %@", @"assetUUIDs" object file lineNumber description];

    id v10 = 0;
  }
  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"workerType = %d AND asset = NULL AND (assetUUID IN %@)", v6, v10];
  [a1 _removeAnalysisRecordsWithPredicate:v12 library:v11];
}

+ (void)_removeAnalysisRecordsWithPredicate:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _batchOperationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke;
  v11[3] = &unk_1E5875E18;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v11);
}

void __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke_2;
  v3[3] = &unk_1E5875E18;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 performBlockAndWait:v3];
}

void __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  id v4 = +[PLAssetAnalysisState entityName];
  id v5 = (void *)[v3 initWithEntityName:v4];

  [v5 setPredicate:*(void *)(a1 + 40)];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v5];
  id v14 = 0;
  id v7 = [v2 executeRequest:v6 error:&v14];
  id v8 = v14;
  id v9 = PLAssetAnalysisGetLog();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      id v11 = "error deleting orphaned states: %@";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v12, v13, v11, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    id v11 = "deleted orphaned states: %@";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }
}

+ (BOOL)resetFaceCropAnalysisStateInLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = __Block_byref_object_copy__2527;
  uint64_t v21 = __Block_byref_object_dispose__2528;
  id v22 = 0;
  id v7 = [a1 _managedObjectContextForStateChangesWithLibraryURL:v6];
  id v8 = [a1 _batchOperationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PLAssetAnalysisState_resetFaceCropAnalysisStateInLibraryAtURL_error___block_invoke;
  block[3] = &unk_1E5875A90;
  id v14 = v7;
  uint64_t v15 = &v23;
  id v16 = &v17;
  id v9 = v7;
  dispatch_sync(v8, block);

  int v10 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v10 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __71__PLAssetAnalysisState_resetFaceCropAnalysisStateInLibraryAtURL_error___block_invoke(void *a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C038];
  id v3 = +[PLFaceCrop entityName];
  id v4 = [v2 batchUpdateRequestWithEntityName:v3];

  uint64_t v17 = @"state";
  v18[0] = &unk_1EEBECF48;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [v4 setPropertiesToUpdate:v5];
  id v6 = (void *)a1[4];
  id v12 = 0;
  id v7 = [v6 executeRequest:v4 error:&v12];
  id v8 = v12;
  if (!v7)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    id v9 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
        int v10 = @"success";
      }
      else {
        int v10 = @"failure";
      }
      uint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Reset of face crop analysis state resulted in %{public}@. (error: %@)", buf, 0x16u);
    }
  }
}

+ (BOOL)clearIgnoreUntilDatesInLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2527;
  uint64_t v25 = __Block_byref_object_dispose__2528;
  id v26 = 0;
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ignoreUntilDate != nil or lastIgnoredDate != nil"];
  id v8 = [a1 _managedObjectContextForStateChangesWithLibraryURL:v6];
  id v9 = [a1 _batchOperationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke;
  block[3] = &unk_1E586C338;
  id v10 = v8;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  uint64_t v18 = &v27;
  uint64_t v19 = &v21;
  BOOL v20 = a4;
  dispatch_sync(v9, block);

  int v12 = *((unsigned __int8 *)v28 + 24);
  if (a4 && !*((unsigned char *)v28 + 24))
  {
    *a4 = (id) v22[5];
    int v12 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2;
  v3[3] = &unk_1E586C338;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  [v4 performBlockAndWait:v3];
}

void __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2(uint64_t a1)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) refreshAllObjects];
  id v2 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v3 = +[PLAssetAnalysisState entityName];
  id v4 = (void *)[v2 initWithEntityName:v3];

  [v4 setPredicate:*(void *)(a1 + 40)];
  v21[0] = @"ignoreUntilDate";
  id v5 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v21[1] = @"lastIgnoredDate";
  v22[0] = v5;
  long long v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v22[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v4 setPropertiesToUpdate:v7];

  [v4 setResultType:2];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v9 + 40);
  LOBYTE(v6) = objc_msgSend(v8, "pl_executeBatchUpdateRequest:withBatchSize:error:", v4, 1000, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)v6;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && *(void *)(a1 + 64))
  {
    uint64_t v10 = +[PLManagedObjectContext sanitizedErrorFromError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  BOOL v13 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v14 = @"success";
    }
    else {
      id v14 = @"failure";
    }
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Bulk clear of ignore-until resulted in %{public}@. (error: %@)", buf, 0x16u);
  }
}

+ (BOOL)cleanupInvalidIgnoreUntilDatesInLibraryAtURL:(id)a3 error:(id *)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2527;
  v36 = __Block_byref_object_dispose__2528;
  id v37 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:604800.0];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ignoreUntilDate > %@", v7];
  id v9 = objc_alloc(MEMORY[0x1E4F1C038]);
  uint64_t v10 = +[PLAssetAnalysisState entityName];
  uint64_t v11 = (void *)[v9 initWithEntityName:v10];

  [v11 setPredicate:v8];
  v44 = @"ignoreUntilDate";
  v45[0] = v7;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
  [v11 setPropertiesToUpdate:v12];

  [v11 setResultType:2];
  if (v6)
  {
    BOOL v13 = [a1 _managedObjectContextForStateChangesWithLibraryURL:v6];
    id v14 = [a1 _batchOperationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke;
    block[3] = &unk_1E58629D8;
    id v25 = v13;
    uint64_t v29 = &v38;
    id v26 = v11;
    char v30 = &v32;
    v31 = a4;
    id v27 = v8;
    id v28 = v7;
    uint64_t v15 = v13;
    dispatch_sync(v14, block);
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28588];
    v43 = @"libraryURL is nil";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v18 = [v16 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v17];
    __int16 v19 = (void *)v33[5];
    v33[5] = v18;

    uint64_t v15 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unable to cleanup invalid ignoreUntilDates because libraryURL is nil", buf, 2u);
    }
  }

  int v20 = *((unsigned __int8 *)v39 + 24);
  if (a4 && !*((unsigned char *)v39 + 24))
  {
    *a4 = (id) v33[5];
    int v20 = *((unsigned __int8 *)v39 + 24);
  }
  BOOL v21 = v20 != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v21;
}

void __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2;
  v3[3] = &unk_1E58629D8;
  uint64_t v8 = *(void *)(a1 + 64);
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 72);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 performBlockAndWait:v3];
}

void __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = objc_msgSend(v2, "pl_executeBatchUpdateRequest:withBatchSize:error:", v3, 1000, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v5;
  if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24) && a1[10])
  {
    uint64_t v6 = +[PLManagedObjectContext sanitizedErrorFromError:*(void *)(*(void *)(a1[9] + 8) + 40)];
    uint64_t v7 = *(void *)(a1[9] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  long long v9 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24)) {
      int v12 = @"success";
    }
    else {
      int v12 = @"failure";
    }
    uint64_t v13 = *(void *)(*(void *)(a1[9] + 8) + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    int v20 = v12;
    __int16 v21 = 2114;
    uint64_t v22 = v13;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Cleanup invalid ignore dates analysis states matching: %{public}@ to value: %{public}@ resulted in %{public}@. (error: %{public}@)", buf, 0x2Au);
  }
}

+ (BOOL)markStatesProcessedForWorkerType:(signed __int16)a3 library:(id)a4 error:(id *)a5
{
  int v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a4;
  long long v9 = objc_msgSend(v7, "predicateWithFormat:", @"workerType = %d", v6);
  LOBYTE(a5) = [(id)objc_opt_class() _bulkUpdateAnalysisStatesTo:20 predicate:v9 library:v8 error:a5];

  return (char)a5;
}

+ (BOOL)resetPendingStatesInLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"analysisState = %d", 10);
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__2527;
  id v26 = __Block_byref_object_dispose__2528;
  id v27 = 0;
  id v8 = [a1 _managedObjectContextForStateChangesWithLibraryURL:v6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PLAssetAnalysisState_resetPendingStatesInLibraryAtURL_error___block_invoke;
  v14[3] = &unk_1E58629B0;
  uint64_t v15 = @"lastIgnoredDate";
  uint64_t v16 = @"ignoreUntilDate";
  __int16 v17 = @"analysisState";
  id v9 = v7;
  id v18 = v9;
  id v10 = v8;
  id v19 = v10;
  int v20 = &v22;
  __int16 v21 = &v28;
  [v10 performBlockAndWait:v14];
  int v11 = *((unsigned __int8 *)v29 + 24);
  if (a4 && !*((unsigned char *)v29 + 24))
  {
    *a4 = (id) v23[5];
    int v11 = *((unsigned __int8 *)v29 + 24);
  }
  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __63__PLAssetAnalysisState_resetPendingStatesInLibraryAtURL_error___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLAssetAnalysisState entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  long long v37 = *(_OWORD *)(a1 + 32);
  uint64_t v38 = *(void *)(a1 + 48);
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:3];
  [v4 setPropertiesToFetch:v5];

  [v4 setPredicate:*(void *)(a1 + 56)];
  [v4 setFetchBatchSize:100];
  id v6 = *(void **)(a1 + 64);
  uint64_t v28 = v4;
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v6 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v29 = v8;
  uint64_t v10 = [v29 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v29);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x19F38D3B0]();
        id v16 = [v14 lastIgnoredDate];
        if (!v16) {
          id v16 = v9;
        }
        [v9 timeIntervalSinceDate:v16];
        double v18 = v17 * 10.0;
        BOOL v19 = v17 < 6.0;
        double v20 = 60.0;
        if (!v19) {
          double v20 = v18;
        }
        __int16 v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v20];
        [v14 setIgnoreUntilDate:v21];
        [v14 setLastIgnoredDate:v9];
        [v14 setAnalysisState:4294967286];
      }
      uint64_t v11 = [v29 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    goto LABEL_17;
  }
  if ([v29 count])
  {
    uint64_t v22 = *(void **)(a1 + 64);
    uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
    id v30 = *(id *)(v23 + 40);
    char v24 = [v22 save:&v30];
    objc_storeStrong((id *)(v23 + 40), v30);
  }
  else
  {
    char v24 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v24;
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
LABEL_17:
    uint64_t v25 = +[PLManagedObjectContext sanitizedErrorFromError:](PLManagedObjectContext, "sanitizedErrorFromError:");
    uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
}

+ (id)deletedAssetUUIDsForAnalysisByWorkerType:(signed __int16)a3 fetchLimit:(unint64_t)a4 inLibrary:(id)a5 error:(id *)a6
{
  id v9 = a5;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__2527;
  long long v31 = __Block_byref_object_dispose__2528;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = __Block_byref_object_copy__2527;
  uint64_t v25 = __Block_byref_object_dispose__2528;
  id v26 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__PLAssetAnalysisState_deletedAssetUUIDsForAnalysisByWorkerType_fetchLimit_inLibrary_error___block_invoke;
  v14[3] = &unk_1E5862988;
  id v10 = v9;
  id v15 = v10;
  id v16 = @"assetUUID";
  double v18 = &v27;
  unint64_t v19 = a4;
  signed __int16 v20 = a3;
  double v17 = &v21;
  [v10 performBlockAndWait:v14 completionHandler:0];
  if (a6)
  {
    uint64_t v11 = (void *)v22[5];
    if (v11) {
      *a6 = v11;
    }
  }
  id v12 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

void __92__PLAssetAnalysisState_deletedAssetUUIDsForAnalysisByWorkerType_fetchLimit_inLibrary_error___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v4 = +[PLAssetAnalysisState entityName];
  char v5 = [v3 fetchRequestWithEntityName:v4];

  v28[0] = *(void *)(a1 + 40);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v5 setPropertiesToFetch:v6];

  [v5 setFetchLimit:*(void *)(a1 + 64)];
  [v5 setFetchBatchSize:100];
  [v5 setResultType:2];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex(workerType) = %d AND asset = NULL", *(__int16 *)(a1 + 72));
  [v5 setPredicate:v7];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  signed __int16 v20 = v2;
  id v9 = [v2 executeFetchRequest:v5 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKeyedSubscript:*(void *)(a1 + 40)];
        if (v18)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v18];
        }
        else
        {
          unint64_t v19 = PLBackendGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Found orphaned analysis state record with no asset UUID", buf, 2u);
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }
}

+ (void)requestCountOfAnalysisRecordsForDeletedAssetsInLibrary:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__PLAssetAnalysisState_requestCountOfAnalysisRecordsForDeletedAssetsInLibrary_completion___block_invoke;
    v13[3] = &unk_1E5873370;
    id v14 = v6;
    id v16 = a1;
    uint64_t v15 = v8;
    [v14 performBlock:v13 withPriority:0];

    id v9 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"requestCountOfAnalysisRecordsForDeletedAssetsInLibrary: null";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v12 = [v10 errorWithDomain:v11 code:41012 userInfo:v9];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v12);

    goto LABEL_5;
  }
LABEL_6:
}

void __90__PLAssetAnalysisState_requestCountOfAnalysisRecordsForDeletedAssetsInLibrary_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"asset == NULL"];
  id v8 = 0;
  char v5 = [v3 _countOfAnalysisStatesByWorkerTypeWithPredicate:v4 analysisState:0 forDeletedAssets:1 inContext:v2 error:&v8];
  id v6 = v8;

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, v6);
  }
}

+ (id)analysisCountsForWorkerType:(signed __int16)a3 library:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    *(void *)buf = 0;
    uint64_t v17 = buf;
    uint64_t v18 = 0x3032000000;
    unint64_t v19 = __Block_byref_object_copy__2527;
    signed __int16 v20 = __Block_byref_object_dispose__2528;
    id v21 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PLAssetAnalysisState_analysisCountsForWorkerType_library___block_invoke;
    v11[3] = &unk_1E586AFC0;
    id v13 = buf;
    id v14 = a1;
    signed __int16 v15 = a3;
    id v12 = v6;
    [v12 performBlockAndWait:v11];
    id v8 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v9 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "analysisCountsForWorkerType: library is null", buf, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

void __60__PLAssetAnalysisState_analysisCountsForWorkerType_library___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  id v31 = 0;
  uint64_t v5 = [v3 _countOfAssetsAllowedForProcessingInLibrary:v4 error:&v31];
  id v6 = v31;
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    id v9 = 0;
LABEL_5:
    id v12 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"analysisState = %d AND asset != NULL AND workerType = %d", 20, *(__int16 *)(a1 + 56));
  id v30 = 0;
  id v9 = [v10 _countOfAnalysisStatesByWorkerTypeWithPredicate:v11 analysisState:20 forDeletedAssets:0 inContext:v2 error:&v30];
  id v7 = v30;

  if (v7)
  {
    id v8 = 0;
    goto LABEL_5;
  }
  id v13 = *(void **)(a1 + 48);
  id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"analysisState = %d AND asset != NULL AND workerType = %d", 4294967266, *(__int16 *)(a1 + 56));
  id v29 = 0;
  id v12 = [v13 _countOfAnalysisStatesByWorkerTypeWithPredicate:v14 analysisState:4294967266 forDeletedAssets:0 inContext:v2 error:&v29];
  id v7 = v29;

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    signed __int16 v15 = *(void **)(a1 + 48);
    id v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"analysisState = %d AND asset != NULL AND workerType = %d", 4294967256, *(__int16 *)(a1 + 56));
    id v28 = 0;
    id v8 = [v15 _countOfAnalysisStatesByWorkerTypeWithPredicate:v16 analysisState:4294967256 forDeletedAssets:0 inContext:v2 error:&v28];
    id v7 = v28;

    if (!v7)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      signed __int16 v20 = [NSNumber numberWithShort:*(__int16 *)(a1 + 56)];
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v22 = [v9 objectForKeyedSubscript:v20];

      if (v22)
      {
        long long v23 = [v9 objectForKeyedSubscript:v20];
        [v21 setObject:v23 forKeyedSubscript:@"processed"];
      }
      long long v24 = [v12 objectForKeyedSubscript:v20];

      if (v24)
      {
        long long v25 = [v12 objectForKeyedSubscript:v20];
        [v21 setObject:v25 forKeyedSubscript:@"failed-no-resources"];
      }
      if (v8)
      {
        id v26 = [v8 objectForKeyedSubscript:v20];
        [v21 setObject:v26 forKeyedSubscript:@"failed"];
      }
      uint64_t v27 = [NSNumber numberWithUnsignedInteger:v5];
      [v21 setObject:v27 forKeyedSubscript:@"total-allowed"];

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v21 forKeyedSubscript:v20];
      id v7 = 0;
    }
  }
LABEL_6:
}

+ (id)assetUUIDsFromAssetObjectIDs:(id)a3 library:(id)a4 whereAllWorkerTypes:(id)a5 matchState:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    *(void *)buf = 0;
    long long v23 = buf;
    uint64_t v24 = 0x3032000000;
    long long v25 = __Block_byref_object_copy__2527;
    id v26 = __Block_byref_object_dispose__2528;
    id v27 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__PLAssetAnalysisState_assetUUIDsFromAssetObjectIDs_library_whereAllWorkerTypes_matchState___block_invoke;
    v16[3] = &unk_1E5875BD0;
    id v17 = v10;
    id v18 = v12;
    id v19 = v9;
    id v20 = v11;
    id v21 = buf;
    [v17 performBlockAndWait:v16];
    id v13 = *((id *)v23 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v14 = PLAssetAnalysisGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "assetUUIDsFromAssetObjectIDs: library is null", buf, 2u);
    }

    id v13 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v13;
}

void __92__PLAssetAnalysisState_assetUUIDsFromAssetObjectIDs_library_whereAllWorkerTypes_matchState___block_invoke(uint64_t a1)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"analysisState == %@ AND asset IN %@ AND workerType IN %@", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56)];
  uint64_t v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = +[PLAssetAnalysisState entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  id v27 = (void *)v4;
  [v7 setPredicate:v4];
  v40[0] = @"assetUUID";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  [v7 setPropertiesToFetch:v8];

  [v7 setResultType:2];
  id v37 = 0;
  id v28 = v2;
  id v9 = [v2 executeFetchRequest:v7 error:&v37];
  id v26 = v37;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        signed __int16 v15 = [*(id *)(*((void *)&v33 + 1) + 8 * i) objectForKeyedSubscript:@"assetUUID"];
        if (v15) {
          [v3 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v12);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        unint64_t v23 = [v17 countForObject:v22];
        if (v23 >= [*(id *)(a1 + 56) count]) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v19);
  }

  uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v16;
}

+ (void)requestAnalysisCountsInLibrary:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke;
    v13[3] = &unk_1E5873370;
    id v14 = v6;
    id v16 = a1;
    signed __int16 v15 = v8;
    [v14 performBlock:v13 withPriority:0];

    id v9 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"requestAnalysisCountsInLibrary: null";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v12 = [v10 errorWithDomain:v11 code:41012 userInfo:v9];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v12);

    goto LABEL_5;
  }
LABEL_6:
}

void __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  id v31 = 0;
  uint64_t v5 = [v3 _countOfAssetsAllowedForProcessingInLibrary:v4 error:&v31];
  id v6 = v31;
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    id v9 = 0;
LABEL_5:
    id v12 = 0;
LABEL_6:
    id v13 = 0;
    goto LABEL_7;
  }
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"analysisState = %d AND asset != NULL", 20);
  id v30 = 0;
  id v9 = [v10 _countOfAnalysisStatesByWorkerTypeWithPredicate:v11 analysisState:20 forDeletedAssets:0 inContext:v2 error:&v30];
  id v7 = v30;

  if (v7)
  {
    id v8 = 0;
    goto LABEL_5;
  }
  signed __int16 v15 = *(void **)(a1 + 48);
  id v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"analysisState = %d AND asset != NULL", 4294967266);
  id v29 = 0;
  id v12 = [v15 _countOfAnalysisStatesByWorkerTypeWithPredicate:v16 analysisState:4294967266 forDeletedAssets:0 inContext:v2 error:&v29];
  id v7 = v29;

  if (v7)
  {
    id v8 = 0;
    goto LABEL_6;
  }
  uint64_t v17 = *(void **)(a1 + 48);
  uint64_t v18 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v20 = [v18 predicateWithFormat:@"(analysisState = %d OR ignoreUntilDate > %@) AND (asset != NULL)", 10, v19];
  id v28 = 0;
  id v8 = [v17 _countOfAnalysisStatesByWorkerTypeWithPredicate:v20 analysisState:10 forDeletedAssets:0 inContext:v2 error:&v28];
  id v7 = v28;

  if (v7) {
    goto LABEL_6;
  }
  id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke_2;
  void v22[3] = &unk_1E5862960;
  id v8 = v8;
  id v23 = v8;
  id v9 = v9;
  id v24 = v9;
  id v12 = v12;
  id v25 = v12;
  uint64_t v27 = v5;
  id v13 = v21;
  id v26 = v13;
  PLEnumerateAnalysisWorkerType(0, v22);

  id v7 = 0;
LABEL_7:
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v13, v7);
  }
}

void __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v11 = [NSNumber numberWithShort:a2];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
    [v3 setObject:v5 forKeyedSubscript:@"unavailable"];
  }
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
    [v3 setObject:v7 forKeyedSubscript:@"processed"];
  }
  id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
    [v3 setObject:v9 forKeyedSubscript:@"failed-no-resources"];
  }
  id v10 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  [v3 setObject:v10 forKeyedSubscript:@"total-allowed"];

  [*(id *)(a1 + 56) setObject:v3 forKeyedSubscript:v11];
}

+ (BOOL)isUnitTestWorker:(signed __int16)a3
{
  return a3 == -1000;
}

+ (id)workerTypesPersistingAnalysisState
{
  return &unk_1EEBF1508;
}

+ (id)keyPathDictionaryWithWorkerType:(signed __int16)a3 workerFlags:(int)a4 analysisState:(int)a5 lastIgnoredDate:(id)a6 ignoreUntilDate:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = [NSNumber numberWithShort:v10];
  [v13 setObject:v14 forKeyedSubscript:@"workerType"];

  signed __int16 v15 = [NSNumber numberWithInt:v8];
  [v13 setObject:v15 forKeyedSubscript:@"analysisState"];

  id v16 = [NSNumber numberWithInt:v9];
  [v13 setObject:v16 forKeyedSubscript:@"workerFlags"];

  if (v12) {
    [v13 setObject:v12 forKeyedSubscript:@"ignoreUntilDate"];
  }
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:@"lastIgnoredDate"];
  }

  return v13;
}

+ (id)_sanitizeChanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "mutableCopy", (void)v17);
        id v12 = [v10 objectForKeyedSubscript:@"analysisState"];
        int v13 = [v12 integerValue];

        if (v13 == 20)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
          [v11 setObject:v14 forKeyedSubscript:@"lastIgnoredDate"];

          signed __int16 v15 = [MEMORY[0x1E4F1CA98] null];
          [v11 setObject:v15 forKeyedSubscript:@"ignoreUntilDate"];

          [v11 setObject:&unk_1EEBECF18 forKeyedSubscript:@"workerFlags"];
        }
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_subArrayOfChanges:(id)a3 toRetryWithConflicts:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        int v13 = [v12 sourceObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          signed __int16 v15 = [v12 sourceObject];
          id v16 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v15, "workerType"));
          [v7 addObject:v16];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v9);
  }

  id v28 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v29 = v5;
  uint64_t v17 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v29);
        }
        id v21 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        uint64_t v22 = [v21 objectForKeyedSubscript:@"analysisState"];
        int v23 = [v22 integerValue];

        id v24 = [v21 objectForKeyedSubscript:@"workerType"];
        int v25 = [v7 containsObject:v24];

        if (v25) {
          BOOL v26 = v23 >= 0;
        }
        else {
          BOOL v26 = 0;
        }
        if (!v26) {
          [v28 addObject:v21];
        }
      }
      uint64_t v18 = [v29 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v18);
  }

  return v28;
}

+ (id)_managedObjectContextForStateChangesWithLibraryURL:(id)a3
{
  id v4 = a3;
  id v5 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v6 = [v5 lookupOrCreateBundleForLibraryURL:v4];

  uint64_t v7 = [v6 persistentContainer];
  uint64_t v8 = [v7 sharedPersistentStoreCoordinator];

  uint64_t v9 = [a1 _managedObjectContextForStateChangesWithPersistentStoreCoordinator:v8];

  return v9;
}

+ (id)_managedObjectContextForStateChangesWithPersistentStoreCoordinator:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C110];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithConcurrencyType:1];
  [v5 setPersistentStoreCoordinator:v4];

  [v5 setName:@"com.apple.assetAnalysisState.managedObjectContext"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C130]) initWithMergeType:0];
  [v5 setMergePolicy:v6];

  return v5;
}

+ (BOOL)_bulkUpdateAnalysisStatesTo:(int)a3 predicate:(id)a4 library:(id)a5 error:(id *)a6
{
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLAssetAnalysisState.m", 188, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__2527;
  long long v31 = __Block_byref_object_dispose__2528;
  id v32 = 0;
  int v13 = [a1 _batchOperationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke;
  block[3] = &unk_1E5862938;
  id v14 = v12;
  id v21 = v14;
  id v15 = v11;
  int v26 = a3;
  id v22 = v15;
  int v23 = &v33;
  id v24 = &v27;
  int v25 = a6;
  dispatch_sync(v13, block);

  int v16 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((unsigned char *)v34 + 24))
  {
    *a6 = (id) v28[5];
    int v16 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke_2;
  v3[3] = &unk_1E5862938;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  int v8 = *(_DWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  [v4 performBlockAndWait:v3];
}

void __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke_2(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = objc_alloc(MEMORY[0x1E4F1C038]);
  id v4 = +[PLAssetAnalysisState entityName];
  id v5 = (void *)[v3 initWithEntityName:v4];

  [v5 setPredicate:*(void *)(a1 + 40)];
  int v26 = @"analysisState";
  long long v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  v27[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [v5 setPropertiesToUpdate:v7];

  [v5 setResultType:2];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v8 + 40);
  LOBYTE(v7) = objc_msgSend(v2, "pl_executeBatchUpdateRequest:withBatchSize:error:", v5, 1000, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)v7;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && *(void *)(a1 + 64))
  {
    uint64_t v9 = +[PLManagedObjectContext sanitizedErrorFromError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  id v12 = PLAssetAnalysisGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(int *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      id v15 = @"success";
    }
    else {
      id v15 = @"failure";
    }
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v19 = v14;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    int v23 = v15;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Bulk updated analysis states matching: %{public}@ to value: %ld resulted in %{public}@. (error: %{public}@)", buf, 0x2Au);
  }
}

+ (unint64_t)_countOfAssetsAllowedForProcessingInLibrary:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    long long v6 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v7 = +[PLAdditionalAssetAttributes entityName];
    uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"allowedForAnalysis = YES"];
    [v8 setPredicate:v9];

    uint64_t v10 = [v5 managedObjectContext];
    id v17 = 0;
    unint64_t v11 = [v10 countForFetchRequest:v8 error:&v17];
    id v12 = v17;
    uint64_t v13 = v12;
    if (a4 && v12) {
      *a4 = v12;
    }
  }
  else
  {
    if (!a4)
    {
      unint64_t v11 = 0;
      goto LABEL_9;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"_countOfAssetsAllowedForProcessingInLibrary: null";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v14 errorWithDomain:v15 code:41012 userInfo:v8];
    unint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v11;
}

+ (id)_countOfAnalysisStatesByWorkerTypeWithPredicate:(id)a3 analysisState:(int)a4 forDeletedAssets:(BOOL)a5 inContext:(id)a6 error:(id *)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (!v12)
  {
    uint64_t v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"PLAssetAnalysisState.m", 102, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  uint64_t v13 = +[PLAssetAnalysisState entityName];
  id v55 = 0;
  uint64_t v14 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v13, (uint64_t)v12, &v55);
  id v15 = v55;
  uint64_t v16 = v15;
  if (v14)
  {
    id v48 = v15;
    [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v13];
    id v17 = v49 = a7;
    uint64_t v18 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"analysisState"];
    uint64_t v19 = (void *)MEMORY[0x1E4F28C68];
    v52 = (void *)v18;
    __int16 v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
    uint64_t v21 = [v19 expressionForFunction:@"count:" arguments:v20];

    id v22 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v22 setName:@"count"];
    v51 = (void *)v21;
    [v22 setExpression:v21];
    [v22 setExpressionResultType:200];
    int v23 = [v14 attributesByName];
    __int16 v24 = [v23 objectForKeyedSubscript:@"workerType"];

    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v24, v22, 0);
    [v17 setPropertiesToFetch:v25];

    int v26 = [MEMORY[0x1E4F1C978] arrayWithObject:v24];
    [v17 setPropertiesToGroupBy:v26];

    [v17 setResultType:2];
    [v17 setPredicate:v11];
    v53 = v17;
    id v54 = 0;
    uint64_t v27 = [v12 executeFetchRequest:v17 error:&v54];
    id v28 = v54;
    if (v49 && v28)
    {
      uint64_t v29 = v28;
      id v30 = 0;
      id *v49 = v28;
      uint64_t v16 = v48;
    }
    else
    {
      id v42 = v28;
      v43 = v27;
      v44 = v24;
      v45 = v14;
      v46 = v13;
      id v47 = v12;
      id v50 = v11;
      id v31 = v27;
      id v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v57 != v35) {
              objc_enumerationMutation(v32);
            }
            long long v37 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            long long v38 = [v37 objectForKeyedSubscript:@"count"];
            uint64_t v39 = [v37 objectForKeyedSubscript:@"workerType"];
            [v30 setObject:v38 forKeyedSubscript:v39];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v56 objects:v60 count:16];
        }
        while (v34);
      }

      uint64_t v16 = v48;
      id v11 = v50;
      uint64_t v13 = v46;
      id v12 = v47;
      __int16 v24 = v44;
      uint64_t v14 = v45;
      uint64_t v29 = v42;
      uint64_t v27 = v43;
    }
  }
  else
  {
    id v30 = 0;
    if (a7) {
      *a7 = v15;
    }
  }

  return v30;
}

+ (id)_batchOperationQueue
{
  if (_batchOperationQueue_onceToken != -1) {
    dispatch_once(&_batchOperationQueue_onceToken, &__block_literal_global_2613);
  }
  id v2 = (void *)_batchOperationQueue_queue;
  return v2;
}

void __44__PLAssetAnalysisState__batchOperationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AssetAnalysisBatchOperationQueue", 0);
  v1 = (void *)_batchOperationQueue_queue;
  _batchOperationQueue_queue = (uint64_t)v0;
}

@end