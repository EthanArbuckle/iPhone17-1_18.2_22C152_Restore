@interface MFLibraryThreadReconciler
- (MFLibraryThreadReconciler)initWithHookRegistry:(id)a3 persistence:(id)a4;
- (id)_expressionForConversationIDs:(uint64_t)a1;
- (id)_journaledExpression;
- (uint64_t)_performReconciliationWithExpression:(void *)a3 window:;
- (void)reconcileAllObjectsWithWindow:(id)a3;
- (void)reconcileWithThreadsWithConversationIDs:(id)a3 window:(id)a4;
@end

@implementation MFLibraryThreadReconciler

- (MFLibraryThreadReconciler)initWithHookRegistry:(id)a3 persistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFLibraryThreadReconciler;
  v9 = [(MFLibraryThreadReconciler *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hookRegistry, a3);
    uint64_t v11 = [v8 threadPersistence];
    threadPersistence = v10->_threadPersistence;
    v10->_threadPersistence = (EDThreadPersistence *)v11;

    uint64_t v13 = [v8 database];
    database = v10->_database;
    v10->_database = (EDPersistenceDatabase *)v13;
  }
  return v10;
}

- (id)_journaledExpression
{
  if (a1)
  {
    v1 = [MEMORY[0x1E4F60E78] column:@"journaled"];
    v2 = [v1 equalTo:&unk_1EFF50D90];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_expressionForConversationIDs:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [MEMORY[0x1E4F60E78] column:@"conversation"];
    v5 = [v4 in:v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)reconcileAllObjectsWithWindow:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MFReconciliationSignpostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = MFReconciliationLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Starting thread reconciliation for all threads", (uint8_t *)&v17, 2u);
  }

  id v8 = MFReconciliationSignpostLog();
  v9 = v8;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MFLibraryThreadReconciliation", "Starting reconciliation of all threads enableTelemetry=YES ", (uint8_t *)&v17, 2u);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v11 = -[MFLibraryThreadReconciler _journaledExpression]((uint64_t)self);
  uint64_t v12 = -[MFLibraryThreadReconciler _performReconciliationWithExpression:window:]((uint64_t)self, v11, v4);
  uint64_t v13 = MFReconciliationLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Finished thread reconciliation for all threads. Reconciled %lu threads", (uint8_t *)&v17, 0xCu);
  }

  v14 = MFReconciliationSignpostLog();
  v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    int v17 = 134349056;
    uint64_t v18 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v15, OS_SIGNPOST_INTERVAL_END, v6, "MFLibraryThreadReconciliation", "ThreadsReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v17, 0xCu);
  }

  [v10 timeIntervalSinceNow];
  if (v16 < -10.0) {
    EFSaveTailspin();
  }
}

- (uint64_t)_performReconciliationWithExpression:(void *)a3 window:
{
  id v5 = a2;
  id v11 = a3;
  if (a1)
  {
    os_signpost_id_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"conversation" table:@"threads"];
    [v6 addResultColumn:@"scope"];
    [v6 addResultColumn:*MEMORY[0x1E4F60D08]];
    [v6 setWhere:v5];
    [v6 setLimit:25];
    [v6 orderByColumn:@"date" ascending:0];
    [v6 orderByColumn:@"conversation" ascending:1];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    uint64_t v19 = 0;
    v20 = &v19;
    do
    {
      if (!*((unsigned char *)v20 + 24)) {
        break;
      }
      id v7 = *(id *)(a1 + 16);
      id v8 = [NSString stringWithUTF8String:"-[MFLibraryThreadReconciler _performReconciliationWithExpression:window:]"];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke;
      v12[3] = &unk_1E5D3F140;
      double v16 = &v23;
      id v13 = v11;
      uint64_t v14 = a1;
      id v15 = v6;
      int v17 = &v27;
      uint64_t v18 = &v19;
      objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v12);

      id v9 = *(id *)(a1 + 8);
      [v9 persistenceDidFinishThreadUpdates];
    }
    while (*((unsigned char *)v24 + 24));
    a1 = v28[3];
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
  return a1;
}

- (void)reconcileWithThreadsWithConversationIDs:(id)a3 window:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MFReconciliationSignpostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = MFReconciliationLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Starting context based thread reconciliation for threads", (uint8_t *)&v24, 2u);
  }

  id v11 = MFReconciliationSignpostLog();
  uint64_t v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MFLibraryThreadContextBasedReconciliation", "Starting context based reconciliation enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v14 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v15 = -[MFLibraryThreadReconciler _journaledExpression]((uint64_t)self);
  v26[0] = v15;
  double v16 = -[MFLibraryThreadReconciler _expressionForConversationIDs:]((uint64_t)self, v6);
  v26[1] = v16;
  int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  uint64_t v18 = (void *)[v14 initWithExpressions:v17];

  uint64_t v19 = -[MFLibraryThreadReconciler _performReconciliationWithExpression:window:]((uint64_t)self, v18, v7);
  v20 = MFReconciliationLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134217984;
    uint64_t v25 = v19;
    _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "Finished context based thread reconciliation for threads. Reconciled %lu threads", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v21 = MFReconciliationSignpostLog();
  char v22 = v21;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    int v24 = 134349056;
    uint64_t v25 = v19;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v22, OS_SIGNPOST_INTERVAL_END, v9, "MFLibraryThreadContextBasedReconciliation", "ThreadsReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v24, 0xCu);
  }

  [v13 timeIntervalSinceNow];
  if (v23 < -10.0) {
    EFSaveTailspin();
  }
}

uint64_t __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 protectedDatabaseAttached])
  {
    objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
    char v26 = [*(id *)(*(void *)(a1 + 40) + 24) threadScopesByDatabaseID];
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = *(void *)(a1 + 48);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_2;
    v35[3] = &unk_1E5D3F118;
    id v29 = v26;
    id v36 = v29;
    id v6 = v27;
    id v37 = v6;
    id v7 = v4;
    id v38 = v7;
    if ([v3 executeSelectStatement:v5 withBlock:v35 error:0])
    {
      unint64_t v8 = [v7 count];
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v8;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8 > 0x18;
      os_signpost_id_t v9 = MFReconciliationLog();
      uint64_t v28 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_3(v8, v9);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = *(void **)(a1 + 40);
            if (v14) {
              id v14 = (void *)v14[3];
            }
            uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            double v16 = v14;
            [v16 setPriorityForDisplayMessageSenderForThreadObjectID:v15];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v11);
      }

      int v17 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
      uint64_t v18 = [v17 in:v7];

      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"threads"];
      [v19 setObject:&unk_1EFF50DA8 forKeyedSubscript:@"journaled"];
      [v19 setWhereClause:v18];
      uint64_t v30 = 0;
      uint64_t v20 = [v3 executeUpdateStatement:v19 rowsChanged:&v30];
      if (v20)
      {
        uint64_t v21 = MFReconciliationLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_2(&v30, v21);
        }

        if (v30 != v28)
        {
          char v22 = MFReconciliationLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_1(&v30, v28, v22);
          }
        }
        uint64_t v23 = *(void *)(a1 + 40);
        if (v23) {
          int v24 = *(void **)(v23 + 8);
        }
        else {
          int v24 = 0;
        }
        [v24 persistenceIsReconcilingJournaledThreadsWithObjectIDs:v10 generationWindow:*(void *)(a1 + 32)];
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v20 = 1;
  }

  return v20;
}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_2(id *a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 databaseIDValue];

  uint64_t v5 = [v11 objectAtIndexedSubscript:1];
  id v6 = [v5 numberValue];

  id v7 = [v11 objectAtIndexedSubscript:2];
  unint64_t v8 = [v7 numberValue];

  os_signpost_id_t v9 = [a1[4] objectForKeyedSubscript:v6];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F604E0]) initWithConversationID:v4 threadScope:v9];
  [a1[5] addObject:v10];
  [a1[6] addObject:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_FAULT, "Reconciled %lu threads in batch, but marked %lu threads as reconciled", (uint8_t *)&v4, 0x16u);
}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "Marked %lu threads as reconciled", (uint8_t *)&v3, 0xCu);
}

void __73__MFLibraryThreadReconciler__performReconciliationWithExpression_window___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_DEBUG, "Reconciling %lu threads in batch", (uint8_t *)&v2, 0xCu);
}

@end