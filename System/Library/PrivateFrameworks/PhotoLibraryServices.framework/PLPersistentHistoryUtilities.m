@interface PLPersistentHistoryUtilities
+ (BOOL)deleteHistoryBeforeDate:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4 withContext:(id)a5 error:(id *)a6;
+ (BOOL)deleteHistoryBeforeDate:(id)a3 withContext:(id)a4 error:(id *)a5;
+ (BOOL)deleteHistoryBeforeToken:(id)a3 withContext:(id)a4 error:(id *)a5;
+ (id)_executePersistentHistoryChangeRequest:(id)a3 withContext:(id)a4;
+ (id)_fetchSingleTransactionWithContext:(id)a3 sortAscending:(BOOL)a4;
+ (id)archivedDataWithToken:(id)a3;
+ (id)fetchTransactionCountSinceToken:(id)a3 withContext:(id)a4 error:(id *)a5;
+ (id)fetchTransactionsSinceMarker:(id)a3 withFetchRequest:(id)a4 batchSize:(unint64_t)a5 context:(id)a6 error:(id *)a7;
+ (id)newestTransactionWithContext:(id)a3;
+ (id)oldestTransactionWithContext:(id)a3;
+ (id)transactionNumberFromToken:(id)a3;
+ (id)unarchiveTokenWithData:(id)a3;
+ (int64_t)fetchApproximateHistoryRecordCountInLibrary:(id)a3 error:(id *)a4;
@end

@implementation PLPersistentHistoryUtilities

+ (id)transactionNumberFromToken:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 storeTokens];
    if ([v5 count] == 1)
    {
      v6 = [v5 allValues];
      v7 = [v6 firstObject];
    }
    else
    {
      v8 = PLPersistentHistoryGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_FAULT, "unexpected number of stores in token: %@", (uint8_t *)&v10, 0xCu);
      }

      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)unarchiveTokenWithData:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v7 = v3;
    v5 = pl_result_with_autoreleasepool();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __55__PLPersistentHistoryUtilities_unarchiveTokenWithData___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = 0;
  v5 = [v2 unarchivedObjectOfClass:v3 fromData:v4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unable to unarchive token data: %@", buf, 0xCu);
    }
  }
  return v5;
}

+ (id)archivedDataWithToken:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v7 = v3;
    v5 = pl_result_with_autoreleasepool();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __54__PLPersistentHistoryUtilities_archivedDataWithToken___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (!v2)
  {
    uint64_t v4 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Unable to archive token: %@", buf, 0xCu);
    }
  }
  return v2;
}

+ (int64_t)fetchApproximateHistoryRecordCountInLibrary:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 159, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v9 = [v7 pathManager];
  int v10 = [v9 photosDatabasePath];
  id v11 = [v8 fileURLWithPath:v10 isDirectory:0];

  uint64_t v12 = (void *)MEMORY[0x1E4F8B9C0];
  v13 = [v11 path];
  v14 = [v7 pathManager];
  v15 = [v14 capabilities];
  v16 = [v12 openDatabaseAtPath:v13 capabilities:v15];

  if (!v16)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36 = @"Failed to load database";
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v17 = [v21 errorWithDomain:*MEMORY[0x1E4F8C500] code:45001 userInfo:v22];

    int64_t v18 = -1;
    if (!a4) {
      goto LABEL_12;
    }
LABEL_11:
    *a4 = v17;
    goto LABEL_12;
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke;
  v26[3] = &unk_1E586FA90;
  v26[4] = &v31;
  if ([v16 prepareStatement:@"SELECT min(Z_PK) FROM ACHANGE" andStepThroughResultsWithBlock:v26]&& (v25[0] = MEMORY[0x1E4F143A8], v25[1] = 3221225472, v25[2] = __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke_2, v25[3] = &unk_1E586FA90, v25[4] = &v27, objc_msgSend(v16, "prepareStatement:andStepThroughResultsWithBlock:", @"SELECT max(Z_PK) FROM ACHANGE", v25)))
  {
    v17 = 0;
    int64_t v18 = v28[3] - v32[3];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = @"Failed to execute statement";
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    v17 = [v19 errorWithDomain:*MEMORY[0x1E4F8C500] code:45001 userInfo:v20];

    int64_t v18 = -1;
  }
  [v16 close];
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  if (a4) {
    goto LABEL_11;
  }
LABEL_12:

  return v18;
}

sqlite3_int64 __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

sqlite3_int64 __82__PLPersistentHistoryUtilities_fetchApproximateHistoryRecordCountInLibrary_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)_executePersistentHistoryChangeRequest:(id)a3 withContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v15 = 0;
  id v7 = [v6 executeRequest:v5 error:&v15];
  id v8 = v15;
  uint64_t v9 = v8;
  if (v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F8B9B8] successWithResult:v7];
  }
  else
  {
    if (!v8)
    {
      id v11 = PLChangeHandlingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        uint64_t v12 = [v6 persistentStoreCoordinator];
        *(_DWORD *)buf = 138543874;
        id v17 = v6;
        __int16 v18 = 2114;
        v19 = v12;
        __int16 v20 = 2112;
        id v21 = v5;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_FAULT, "Unexepcted nil error when feching persistent history, context: %{public}@, PSC: %{public}@, changeRequest: %{pubic}@", buf, 0x20u);
      }
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134301 userInfo:0];
    }
    uint64_t v10 = [MEMORY[0x1E4F8B9B8] failureWithError:v9];
  }
  v13 = (void *)v10;

  return v13;
}

+ (BOOL)deleteHistoryBeforeDate:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4 withContext:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  v13 = v12;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 124, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 125, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __116__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_whenHistoryPercentageOfStoreIsGreaterThan_withContext_error___block_invoke;
  v21[3] = &unk_1E586FA68;
  unint64_t v24 = a4;
  id v25 = a1;
  id v22 = v11;
  id v23 = v13;
  id v14 = v13;
  id v15 = v11;
  v16 = objc_msgSend(v14, "pl_resultWithError:block:", a6, v21);
  BOOL v17 = v16 != 0;

  return v17;
}

id __116__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_whenHistoryPercentageOfStoreIsGreaterThan_withContext_error___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C160] deleteHistoryBeforeDate:*(void *)(a1 + 32) whenHistoryPercentageOfStoreIsGreaterThan:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 56) _executePersistentHistoryChangeRequest:v2 withContext:*(void *)(a1 + 40)];

  return v3;
}

+ (BOOL)deleteHistoryBeforeDate:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 111, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 112, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_withContext_error___block_invoke;
  v19[3] = &unk_1E586FA18;
  id v21 = v11;
  id v22 = a1;
  id v20 = v9;
  id v12 = v11;
  id v13 = v9;
  id v14 = objc_msgSend(v12, "pl_resultWithError:block:", a5, v19);
  BOOL v15 = v14 != 0;

  return v15;
}

id __74__PLPersistentHistoryUtilities_deleteHistoryBeforeDate_withContext_error___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C160] deleteHistoryBeforeDate:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 48) _executePersistentHistoryChangeRequest:v2 withContext:*(void *)(a1 + 40)];

  return v3;
}

+ (BOOL)deleteHistoryBeforeToken:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 99, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PLPersistentHistoryUtilities_deleteHistoryBeforeToken_withContext_error___block_invoke;
  v17[3] = &unk_1E586FA18;
  id v19 = v10;
  id v20 = a1;
  id v18 = v9;
  id v11 = v10;
  id v12 = v9;
  id v13 = objc_msgSend(v11, "pl_resultWithError:block:", a5, v17);
  BOOL v14 = v13 != 0;

  return v14;
}

id __75__PLPersistentHistoryUtilities_deleteHistoryBeforeToken_withContext_error___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C160] deleteHistoryBeforeToken:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 48) _executePersistentHistoryChangeRequest:v2 withContext:*(void *)(a1 + 40)];

  return v3;
}

+ (id)_fetchSingleTransactionWithContext:(id)a3 sortAscending:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  BOOL v17 = __81__PLPersistentHistoryUtilities__fetchSingleTransactionWithContext_sortAscending___block_invoke;
  id v18 = &unk_1E586FA40;
  BOOL v21 = a4;
  id v20 = a1;
  id v7 = v6;
  id v19 = v7;
  id v8 = objc_msgSend(v7, "pl_resultWithError:block:", &v22, &v15);
  id v9 = v22;
  if (v8)
  {
    id v10 = objc_msgSend(v8, "result", v15, v16, v17, v18);
    if (v10)
    {
      id v11 = v10;
      id v12 = [v10 firstObject];
      goto LABEL_10;
    }
    id v13 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Fetching single persistent history result is empty", buf, 2u);
    }

    id v11 = 0;
  }
  else
  {
    id v11 = PLPersistentHistoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to fetch single persistent history transaction: %@", buf, 0xCu);
    }
  }
  id v12 = 0;
LABEL_10:

  return v12;
}

id __81__PLPersistentHistoryUtilities__fetchSingleTransactionWithContext_sortAscending___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C178] fetchRequest];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:*(unsigned __int8 *)(a1 + 48)];
  v8[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v2 setSortDescriptors:v4];

  id v5 = [MEMORY[0x1E4F1C160] fetchHistoryWithFetchRequest:v2];
  [v5 setResultType:3];
  [v5 setFetchLimit:1];
  id v6 = [*(id *)(a1 + 40) _executePersistentHistoryChangeRequest:v5 withContext:*(void *)(a1 + 32)];

  return v6;
}

+ (id)newestTransactionWithContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 66, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v6 = [a1 _fetchSingleTransactionWithContext:v5 sortAscending:0];

  return v6;
}

+ (id)oldestTransactionWithContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 59, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v6 = [a1 _fetchSingleTransactionWithContext:v5 sortAscending:1];

  return v6;
}

+ (id)fetchTransactionCountSinceToken:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 46, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__PLPersistentHistoryUtilities_fetchTransactionCountSinceToken_withContext_error___block_invoke;
  v17[3] = &unk_1E586FA18;
  id v19 = v10;
  id v20 = a1;
  id v18 = v9;
  id v11 = v10;
  id v12 = v9;
  id v13 = objc_msgSend(v11, "pl_resultWithError:block:", a5, v17);
  BOOL v14 = [v13 result];

  return v14;
}

id __82__PLPersistentHistoryUtilities_fetchTransactionCountSinceToken_withContext_error___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C160] fetchHistoryAfterToken:*(void *)(a1 + 32)];
  [v2 setResultType:2];
  id v3 = [*(id *)(a1 + 48) _executePersistentHistoryChangeRequest:v2 withContext:*(void *)(a1 + 40)];

  return v3;
}

+ (id)fetchTransactionsSinceMarker:(id)a3 withFetchRequest:(id)a4 batchSize:(unint64_t)a5 context:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = v15;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 25, @"Invalid parameter not satisfying: %@", @"marker" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  id v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"PLPersistentHistoryUtilities.m", 26, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_3:
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __102__PLPersistentHistoryUtilities_fetchTransactionsSinceMarker_withFetchRequest_batchSize_context_error___block_invoke;
  v25[3] = &unk_1E586F9F0;
  id v26 = v13;
  id v27 = v14;
  unint64_t v29 = a5;
  id v30 = a1;
  id v28 = v16;
  id v17 = v16;
  id v18 = v14;
  id v19 = v13;
  id v20 = objc_msgSend(v17, "pl_resultWithError:block:", a7, v25);
  BOOL v21 = [v20 result];

  return v21;
}

id __102__PLPersistentHistoryUtilities_fetchTransactionsSinceMarker_withFetchRequest_batchSize_context_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) changeRequestForFetching];
  [v2 setResultType:5];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v2, "setFetchRequest:");
  }
  else {
    [v2 setFetchBatchSize:*(void *)(a1 + 56)];
  }
  id v3 = [*(id *)(a1 + 64) _executePersistentHistoryChangeRequest:v2 withContext:*(void *)(a1 + 48)];

  return v3;
}

@end