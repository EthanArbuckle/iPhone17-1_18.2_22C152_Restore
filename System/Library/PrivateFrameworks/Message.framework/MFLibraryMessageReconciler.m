@interface MFLibraryMessageReconciler
+ (uint64_t)numberOfUnreconciledMessagesWithMessagePersistence:(uint64_t)a1;
+ (unint64_t)numberOfUnreconciledMessagesWithLibrary:(id)a3;
- (BOOL)_performReconciliationBatchForQuery:(void *)a3 window:(uint64_t *)a4 reconciledMessageCount:(void *)a5 reconciledConversations:;
- (BOOL)_performReconciliationForQuery:(void *)a3 window:(void *)a4 reconciledMessageCount:(void *)a5 reconciledConversations:;
- (MFLibraryMessageReconciler)initWithLibrary:(id)a3 accountsProvider:(id)a4;
- (id)reconcileInboxMessagesWithWindow:(id)a3;
- (id)reconcileWithMessageReconciliationQueries:(id)a3 window:(id)a4;
- (id)reconcileWithThreadReconciliationQueries:(id)a3 window:(id)a4;
- (uint64_t)_reconcileMessagesWithQueries:(void *)a3 window:(os_signpost_id_t)a4 signpostID:(void *)a5 reconciledConversations:;
- (unint64_t)numberOfUnreconciledMessages;
- (void)_cleanup;
- (void)reconcileAllObjectsWithWindow:(id)a3;
@end

@implementation MFLibraryMessageReconciler

- (MFLibraryMessageReconciler)initWithLibrary:(id)a3 accountsProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MFLibraryMessageReconciler;
  v8 = [(MFLibraryMessageReconciler *)&v21 init];
  if (v8)
  {
    v9 = [v6 persistence];
    v10 = [v9 messagePersistence];
    objc_storeWeak((id *)&v8->_messagePersistence, v10);

    objc_storeStrong((id *)&v8->_accountsProvider, a4);
    v11 = [v6 persistence];
    v12 = [MFMailMessageLibraryQueryTransformer alloc];
    v13 = [v11 messagePersistence];
    uint64_t v14 = [(MFMailMessageLibraryQueryTransformer *)v12 initWithMessagePersistence:v13];
    transformer = v8->_transformer;
    v8->_transformer = (MFMailMessageLibraryQueryTransformer *)v14;

    uint64_t v16 = [v11 database];
    database = v8->_database;
    v8->_database = (EDPersistenceDatabase *)v16;

    uint64_t v18 = [v11 hookRegistry];
    hookRegistry = v8->_hookRegistry;
    v8->_hookRegistry = (EDPersistenceHookRegistry *)v18;
  }
  return v8;
}

+ (unint64_t)numberOfUnreconciledMessagesWithLibrary:(id)a3
{
  v4 = [a3 persistence];
  v5 = [v4 messagePersistence];
  unint64_t v6 = +[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithMessagePersistence:]((uint64_t)a1, v5);

  return v6;
}

+ (uint64_t)numberOfUnreconciledMessagesWithMessagePersistence:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
  unint64_t v6 = (void *)[v3 initWithTargetClass:v4 predicate:v5 sortDescriptors:MEMORY[0x1E4F1CBF0] queryOptions:256 label:0];

  uint64_t v7 = [v2 countOfJournaledMessagesMatchingQuery:v6];
  return v7;
}

- (unint64_t)numberOfUnreconciledMessages
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messagePersistence);
  }
  else {
    id WeakRetained = 0;
  }
  unint64_t v3 = +[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithMessagePersistence:]((uint64_t)MFLibraryMessageReconciler, WeakRetained);

  return v3;
}

- (void)reconcileAllObjectsWithWindow:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  unint64_t v6 = MFReconciliationSignpostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = MFReconciliationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Starting message reconciliation for all messages", buf, 2u);
  }

  v9 = MFReconciliationSignpostLog();
  v10 = v9;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFLibraryMessageAllMessageReconciliation", "Starting all message reconciliation enableTelemetry=YES ", buf, 2u);
  }

  v11 = MFReconciliationLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Reconciling all journaled messages", buf, 2u);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
  v15 = (void *)[v12 initWithTargetClass:v13 predicate:v14 sortDescriptors:MEMORY[0x1E4F1CBF0] queryOptions:256 label:0];

  uint64_t v20 = 0;
  -[MFLibraryMessageReconciler _performReconciliationForQuery:window:reconciledMessageCount:reconciledConversations:]((uint64_t)self, v15, v4, &v20, 0);
  -[MFLibraryMessageReconciler _cleanup]((uint64_t)self);
  uint64_t v16 = MFReconciliationLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v20;
    _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "Finished message reconciliation for all messages. Reconciled %lu messages", buf, 0xCu);
  }

  v17 = MFReconciliationSignpostLog();
  uint64_t v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v22 = v20;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v18, OS_SIGNPOST_INTERVAL_END, v7, "MFLibraryMessageAllMessageReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  [v5 timeIntervalSinceNow];
  if (v19 < -10.0) {
    EFSaveTailspin();
  }
}

- (BOOL)_performReconciliationForQuery:(void *)a3 window:(void *)a4 reconciledMessageCount:(void *)a5 reconciledConversations:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = 0;
    unint64_t v17 = 0;
    do
    {
      BOOL v13 = -[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:](a1, v9, v10, (uint64_t *)&v17, v11);
      BOOL v14 = v13;
      v12 += v17;
    }
    while (v17 > 0x63 && v13);
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_cleanup
{
  if (a1)
  {
    id v2 = MFReconciliationLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "Reconciled all messages. Cleaning up...", buf, 2u);
    }

    id v3 = *(id *)(a1 + 16);
    id v4 = [NSString stringWithUTF8String:"-[MFLibraryMessageReconciler _cleanup]"];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__MFLibraryMessageReconciler__cleanup__block_invoke;
    v5[3] = &unk_1E5D3D068;
    v5[4] = a1;
    objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v5);
  }
}

- (id)reconcileWithMessageReconciliationQueries:(id)a3 window:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v9 = MFReconciliationSignpostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v12 = MFReconciliationLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "Starting context based message reconciliation batch", (uint8_t *)&v22, 2u);
  }

  BOOL v13 = MFReconciliationSignpostLog();
  BOOL v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MFLibraryMessageContextBasedReconciliation", "Starting context based reconciliation enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

  uint64_t v15 = -[MFLibraryMessageReconciler _reconcileMessagesWithQueries:window:signpostID:reconciledConversations:]((uint64_t)self, v6, v7, v10, v11);
  uint64_t v16 = MFReconciliationSignpostLog();
  unint64_t v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v22 = 134349056;
    uint64_t v23 = v15;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v17, OS_SIGNPOST_INTERVAL_END, v10, "MFLibraryMessageContextBasedReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v22, 0xCu);
  }

  [v8 timeIntervalSinceNow];
  double v19 = v18;
  uint64_t v20 = MFReconciliationLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v22 = 134217984;
    uint64_t v23 = v15;
    _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_INFO, "Reconciled batch of %lu messages using message query", (uint8_t *)&v22, 0xCu);
  }

  if (v19 < -10.0) {
    EFSaveTailspin();
  }

  return v11;
}

- (uint64_t)_reconcileMessagesWithQueries:(void *)a3 window:(os_signpost_id_t)a4 signpostID:(void *)a5 reconciledConversations:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v30 = a3;
  id v31 = a5;
  uint64_t v29 = a1;
  v25 = v8;
  if (a1)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v8;
    uint64_t v9 = 0;
    uint64_t v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16, v8);
    if (v10)
    {
      uint64_t v28 = *(void *)v35;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v34 + 1) + 8 * v11);
        if (([v12 queryOptions] & 0x100) == 0)
        {
          id v13 = objc_alloc(MEMORY[0x1E4F60418]);
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = [v12 predicate];
          uint64_t v16 = [v12 sortDescriptors];
          uint64_t v17 = [v12 queryOptions];
          double v18 = [v12 label];
          uint64_t v19 = [v13 initWithTargetClass:v14 predicate:v15 sortDescriptors:v16 queryOptions:v17 | 0x100 label:v18];

          id v12 = (id)v19;
        }
        uint64_t v33 = 0;
        uint64_t v20 = MFReconciliationSignpostLog();
        objc_super v21 = v20;
        if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v21, OS_SIGNPOST_EVENT, a4, "MFLibraryMessageContextBasedReconciliation", "Reconciling for query", buf, 2u);
        }

        BOOL v22 = -[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:](v29, v12, v30, &v33, v31);
        uint64_t v23 = v33;

        v9 += v23;
        if (!v22) {
          break;
        }
        if (v10 == ++v11)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)reconcileWithThreadReconciliationQueries:(id)a3 window:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v9 = MFReconciliationSignpostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = objc_msgSend(v6, "ef_map:", &__block_literal_global_38);
  id v13 = MFReconciliationLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_INFO, "Starting context based message reconciliation batch", (uint8_t *)&v23, 2u);
  }

  uint64_t v14 = MFReconciliationSignpostLog();
  uint64_t v15 = v14;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MFLibraryMessageContextBasedReconciliation", "Starting context based reconciliation enableTelemetry=YES ", (uint8_t *)&v23, 2u);
  }

  uint64_t v16 = -[MFLibraryMessageReconciler _reconcileMessagesWithQueries:window:signpostID:reconciledConversations:]((uint64_t)self, v12, v7, v10, v11);
  uint64_t v17 = MFReconciliationSignpostLog();
  double v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    int v23 = 134349056;
    uint64_t v24 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v18, OS_SIGNPOST_INTERVAL_END, v10, "MFLibraryMessageContextBasedReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", (uint8_t *)&v23, 0xCu);
  }

  [v8 timeIntervalSinceNow];
  double v20 = v19;
  objc_super v21 = MFReconciliationLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v23 = 134217984;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_INFO, "Reconciled batch of %lu messages using thread query", (uint8_t *)&v23, 0xCu);
  }

  if (v20 < -10.0) {
    EFSaveTailspin();
  }

  return v11;
}

id __78__MFLibraryMessageReconciler_reconcileWithThreadReconciliationQueries_window___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v4 = objc_opt_class();
  id v5 = [v2 predicate];
  id v6 = [v2 sortDescriptors];
  uint64_t v7 = [v2 queryOptions];
  id v8 = [v2 targetClassOptions];
  uint64_t v9 = (void *)[v3 initWithTargetClass:v4 predicate:v5 sortDescriptors:v6 limit:0 queryOptions:v7 targetClassOptions:v8 label:0];

  return v9;
}

- (id)reconcileInboxMessagesWithWindow:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v6 = MFReconciliationSignpostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v24 = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = MFReconciliationLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "Starting inbox reconciliation", buf, 2u);
  }

  os_signpost_id_t v10 = [MEMORY[0x1E4F60390] predicateForMessagesInMailboxWithType:7];
  id v11 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v12 = objc_opt_class();
  id v13 = [MEMORY[0x1E4F60390] sortDescriptorForDateAscending:0];
  v27[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v15 = (void *)[v11 initWithTargetClass:v12 predicate:v10 sortDescriptors:v14 queryOptions:256 label:0];

  uint64_t v16 = MFReconciliationSignpostLog();
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFLibraryMessageContextBasedReconciliation", "Starting inbox reconciliation enableTelemetry=YES ", buf, 2u);
  }

  -[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:]((uint64_t)self, v15, v4, &v24, v8);
  double v18 = MFReconciliationSignpostLog();
  double v19 = v18;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v26 = v24;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v19, OS_SIGNPOST_INTERVAL_END, v7, "MFLibraryMessageContextBasedReconciliation", "MessagesReconciled=%{public,signpost.telemetry:number1}lu enableTelemetry=YES ", buf, 0xCu);
  }

  [v5 timeIntervalSinceNow];
  double v21 = v20;
  BOOL v22 = MFReconciliationLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = v24;
    _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_INFO, "Finished inbox reconciliation. Reconciled %lu messages", buf, 0xCu);
  }

  if (v21 < -10.0) {
    EFSaveTailspin();
  }

  return v8;
}

- (BOOL)_performReconciliationBatchForQuery:(void *)a3 window:(uint64_t *)a4 reconciledMessageCount:(void *)a5 reconciledConversations:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = a2;
  id v23 = a3;
  id v9 = a5;
  if (a1)
  {
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    id v11 = [WeakRetained persistedMessagesMatchingQuery:v24 limit:100 requireProtectedData:1];

    if (v9)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = v11;
      uint64_t v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16, v23);
      if (v13)
      {
        uint64_t v14 = *(void *)v31;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v15), "conversationID"));
            [v9 addObject:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v13);
      }
    }
    if (objc_msgSend(v11, "count", v23))
    {
      id v17 = *(id *)(a1 + 16);
      double v18 = [NSString stringWithUTF8String:"-[MFLibraryMessageReconciler _performReconciliationBatchForQuery:window:reconciledMessageCount:reconciledConversations:]"];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __120__MFLibraryMessageReconciler__performReconciliationBatchForQuery_window_reconciledMessageCount_reconciledConversations___block_invoke;
      v25[3] = &unk_1E5D3CD60;
      id v26 = v23;
      uint64_t v29 = &v34;
      id v27 = v11;
      uint64_t v28 = a1;
      objc_msgSend(v17, "__performWriteWithCaller:usingBlock:", v18, v25);
    }
    double v19 = v35;
    if (a4)
    {
      if (*((unsigned char *)v35 + 24))
      {
        uint64_t v20 = [v11 count];
        double v19 = v35;
      }
      else
      {
        uint64_t v20 = 0;
      }
      *a4 = v20;
    }
    BOOL v21 = *((unsigned __int8 *)v19 + 24) != 0;

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

BOOL __120__MFLibraryMessageReconciler__performReconciliationBatchForQuery_window_reconciledMessageCount_reconciledConversations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if ([v3 protectedDatabaseAttached])
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ef_map:", &__block_literal_global_29);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"messages"];
    [v5 setObject:&unk_1EFF50D78 forKeyedSubscript:@"journaled"];
    id v6 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
    os_signpost_id_t v7 = [v6 in:v4];
    [v5 setWhereClause:v7];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 executeUpdateStatement:v5 error:0];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && [*(id *)(a1 + 40) count])
    {
      id v8 = MFReconciliationLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 40) count];
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = v9;
        _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "reconciled %llu messages", buf, 0xCu);
      }

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "setIsJournaled:", 0, (void)v18);
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      uint64_t v14 = *(void *)(a1 + 48);
      if (v14) {
        uint64_t v15 = *(void **)(v14 + 8);
      }
      else {
        uint64_t v15 = 0;
      }
      objc_msgSend(v15, "persistenceDidReconcileJournaledMessages:generationWindow:", *(void *)(a1 + 40), *(void *)(a1 + 32), (void)v18);
    }
    BOOL v16 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    BOOL v16 = 1;
  }

  return v16;
}

id __120__MFLibraryMessageReconciler__performReconciliationBatchForQuery_window_reconciledMessageCount_reconciledConversations___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "libraryID"));

  return v3;
}

uint64_t __38__MFLibraryMessageReconciler__cleanup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 protectedDatabaseAttached])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F60418]);
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
    os_signpost_id_t v7 = (void *)[v4 initWithTargetClass:v5 predicate:v6 sortDescriptors:MEMORY[0x1E4F1CBF0] queryOptions:256 label:0];

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      id WeakRetained = objc_loadWeakRetained((id *)(v8 + 24));
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v10 = [WeakRetained countOfJournaledMessagesMatchingQuery:v7];

    if (v10)
    {
      uint64_t v11 = 1;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v12 = [v3 sqlConnection];
    id v20 = 0;
    int v13 = [v12 executeStatementString:@"DELETE FROM protected_message_data WHERE ROWID IN (SELECT message_data_id FROM message_data_deleted)" error:&v20];
    id v14 = v20;

    if (v13)
    {
      uint64_t v15 = [v3 sqlConnection];
      id v19 = v14;
      char v16 = [v15 executeStatementString:@"DELETE FROM message_data_deleted" error:&v19];
      id v17 = v19;

      if (v16)
      {
        uint64_t v11 = 1;
LABEL_12:

        goto LABEL_13;
      }
      id v14 = v17;
    }
    [v3 handleError:v14 message:@"Cleaning up messages after reconciliation"];
    uint64_t v11 = 0;
    id v17 = v14;
    goto LABEL_12;
  }
  uint64_t v11 = 1;
LABEL_14:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_destroyWeak((id *)&self->_messagePersistence);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
}

@end