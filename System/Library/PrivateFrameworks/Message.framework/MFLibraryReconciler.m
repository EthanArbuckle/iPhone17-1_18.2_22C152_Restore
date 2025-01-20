@interface MFLibraryReconciler
- (BOOL)_shouldUseContextBasedReconciliationWithMessageReconciliationQueries:(unint64_t)a3 unreconciledMessages:;
- (BOOL)_shouldUseContextBasedReconciliationWithThreadReconciliationQueries:(unint64_t)a3 unreconciledMessages:;
- (MFLibraryReconciler)initWithLibrary:(id)a3 queryProvider:(id)a4 accountsProvider:(id)a5;
- (void)_reconcileInboxThreadsAndMessages;
- (void)_reconcileRemainingEntries;
- (void)_reconcileUsingMessageReconciliationQueries:(uint64_t)a1;
- (void)_reconcileUsingThreadReconciliationQueries:(uint64_t)a1;
- (void)persistenceDidReconcileProtectedData;
@end

@implementation MFLibraryReconciler

- (MFLibraryReconciler)initWithLibrary:(id)a3 queryProvider:(id)a4 accountsProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MFLibraryReconciler;
  v11 = [(MFLibraryReconciler *)&v22 init];
  if (v11)
  {
    v12 = [v8 persistence];
    objc_storeWeak((id *)&v11->_queryProvider, v9);
    uint64_t v13 = [v12 hookRegistry];
    hookRegistry = v11->_hookRegistry;
    v11->_hookRegistry = (EDPersistenceHookRegistry *)v13;

    objc_storeStrong((id *)&v11->_accountsProvider, a5);
    v15 = [[MFLibraryMessageReconciler alloc] initWithLibrary:v8 accountsProvider:v10];
    messageReconciler = v11->_messageReconciler;
    v11->_messageReconciler = v15;

    v17 = [[MFLibraryThreadReconciler alloc] initWithHookRegistry:v11->_hookRegistry persistence:v12];
    threadReconciler = v11->_threadReconciler;
    v11->_threadReconciler = v17;

    uint64_t v19 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.message.library.reconciliationcleanup" qualityOfService:25];
    reconciliationCleanupScheduler = v11->_reconciliationCleanupScheduler;
    v11->_reconciliationCleanupScheduler = (EFScheduler *)v19;

    [(EDPersistenceHookRegistry *)v11->_hookRegistry registerProtectedDataReconciliationHookResponder:v11];
    [(EDPersistenceHookRegistry *)v11->_hookRegistry registerDatabaseChangeHookResponder:v11];
  }
  return v11;
}

- (void)persistenceDidReconcileProtectedData
{
  v3 = MFReconciliationSignpostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = MFReconciliationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Starting library reconciliation", buf, 2u);
  }

  v6 = MFReconciliationSignpostLog();
  v7 = v6;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MFLibraryReconciliation", "Starting library reconciliation", buf, 2u);
  }

  id v8 = [MEMORY[0x1E4F60E10] transactionWithDescription:@"Reconciling threads"];
  if (self) {
    reconciliationCleanupScheduler = self->_reconciliationCleanupScheduler;
  }
  else {
    reconciliationCleanupScheduler = 0;
  }
  id v10 = reconciliationCleanupScheduler;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__MFLibraryReconciler_persistenceDidReconcileProtectedData__block_invoke;
  v12[3] = &unk_1E5D3D240;
  id v13 = v8;
  os_signpost_id_t v14 = v4;
  v12[4] = self;
  id v11 = v8;
  [(EFScheduler *)v10 performBlock:v12];
}

void __59__MFLibraryReconciler_persistenceDidReconcileProtectedData__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  os_signpost_id_t v4 = [WeakRetained messageReconciliationQueries];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id v6 = objc_loadWeakRetained((id *)(v5 + 24));
  }
  else {
    id v6 = 0;
  }
  v7 = [v6 threadReconciliationQueries];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 40);
  }
  else {
    id v9 = 0;
  }
  unint64_t v10 = [v9 numberOfUnreconciledMessages];
  if (-[MFLibraryReconciler _shouldUseContextBasedReconciliationWithMessageReconciliationQueries:unreconciledMessages:](*(void *)(a1 + 32), v4, v10))
  {
    -[MFLibraryReconciler _reconcileUsingMessageReconciliationQueries:](*(void *)(a1 + 32), v4);
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      v12 = *(void **)(v11 + 40);
    }
    else {
      v12 = 0;
    }
    unint64_t v10 = [v12 numberOfUnreconciledMessages];
  }
  if (-[MFLibraryReconciler _shouldUseContextBasedReconciliationWithThreadReconciliationQueries:unreconciledMessages:](*(void *)(a1 + 32), v7, v10))
  {
    -[MFLibraryReconciler _reconcileUsingThreadReconciliationQueries:](*(void *)(a1 + 32), v7);
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      os_signpost_id_t v14 = *(void **)(v13 + 40);
    }
    else {
      os_signpost_id_t v14 = 0;
    }
    unint64_t v10 = [v14 numberOfUnreconciledMessages];
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15 && v10 >= 0xA)
  {
    -[MFLibraryReconciler _reconcileInboxThreadsAndMessages](v15);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  -[MFLibraryReconciler _reconcileRemainingEntries](v15);
  v16 = MFReconciliationLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "Library reconciliation finished", buf, 2u);
  }

  v17 = MFReconciliationSignpostLog();
  v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 48);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v18, OS_SIGNPOST_INTERVAL_END, v19, "MFLibraryReconciliation", "", v20, 2u);
  }

  [*(id *)(a1 + 40) invalidate];
}

- (BOOL)_shouldUseContextBasedReconciliationWithMessageReconciliationQueries:(unint64_t)a3 unreconciledMessages:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 count];
    BOOL v9 = a3 > 9 && v7 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_reconcileUsingMessageReconciliationQueries:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_signpost_id_t v4 = MFReconciliationSignpostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v4);

    id v5 = MFReconciliationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Starting context based library message reconciliation", buf, 2u);
    }

    id v6 = MFReconciliationSignpostLog();
    uint64_t v7 = v6;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MFLibraryContextBasedReconciliation", "Starting context based library message reconciliation enableTelemetry=YES ", buf, 2u);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    uint64_t v9 = 0;
    do
    {
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 reconcileWithMessageReconciliationQueries:v3 window:v8];

      if ([v11 count])
      {
        id v12 = *(id *)(a1 + 48);
        [v12 reconcileWithThreadsWithConversationIDs:v11 window:v8];
      }
      uint64_t v13 = [v11 count];
      os_signpost_id_t v14 = MFReconciliationLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = v13;
        _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "Context based library message reconciliation finished batch. Reconciled %lu conversations", buf, 0xCu);
      }

      v9 += v13;
    }
    while (v13);
    uint64_t v15 = MFReconciliationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Context based library message reconciliation finished. Reconciled %lu conversations", buf, 0xCu);
    }

    v16 = MFReconciliationSignpostLog();
    v17 = v16;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 134349312;
      uint64_t v20 = 0;
      __int16 v21 = 2050;
      uint64_t v22 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v17, OS_SIGNPOST_INTERVAL_END, spid, "MFLibraryContextBasedReconciliation", "ContextType=%{public,signpost.telemetry:number1}ld Conversations=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
    }
  }
}

- (BOOL)_shouldUseContextBasedReconciliationWithThreadReconciliationQueries:(unint64_t)a3 unreconciledMessages:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 count];
    BOOL v9 = a3 > 9 && v7 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_reconcileUsingThreadReconciliationQueries:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    os_signpost_id_t v4 = MFReconciliationSignpostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v4);

    id v5 = MFReconciliationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Starting context based library thread reconciliation", buf, 2u);
    }

    id v6 = MFReconciliationSignpostLog();
    uint64_t v7 = v6;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MFLibraryContextBasedReconciliation", "Starting context based library thread reconciliation", buf, 2u);
    }

    id v8 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    uint64_t v9 = 0;
    do
    {
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 reconcileWithThreadReconciliationQueries:v3 window:v8];

      if ([v11 count])
      {
        id v12 = *(id *)(a1 + 48);
        [v12 reconcileWithThreadsWithConversationIDs:v11 window:v8];
      }
      uint64_t v13 = [v11 count];
      os_signpost_id_t v14 = MFReconciliationLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = v13;
        _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "Context based library thread reconciliation finished batch. Reconciled %lu conversations", buf, 0xCu);
      }

      v9 += v13;
    }
    while (v13);
    uint64_t v15 = MFReconciliationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "Context based library thread reconciliation finished. Reconciled %lu conversations", buf, 0xCu);
    }

    v16 = MFReconciliationSignpostLog();
    v17 = v16;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 134349312;
      uint64_t v20 = 1;
      __int16 v21 = 2050;
      uint64_t v22 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v17, OS_SIGNPOST_INTERVAL_END, spid, "MFLibraryContextBasedReconciliation", "ContextType=%{public,signpost.telemetry:number1}ld Conversations=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
    }
  }
}

- (void)_reconcileInboxThreadsAndMessages
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = MFReconciliationSignpostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v2);

    id v3 = MFReconciliationSignpostLog();
    os_signpost_id_t v4 = v3;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MFLibraryContextBasedReconciliation", "Starting context based library inbox reconciliation", buf, 2u);
    }

    id v5 = MFReconciliationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Starting inbox library reconciliation", buf, 2u);
    }

    uint64_t v6 = 0;
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F60B88]);
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = [v8 reconcileInboxMessagesWithWindow:v7];

      if ([v9 count])
      {
        id v10 = *(id *)(a1 + 48);
        [v10 reconcileWithThreadsWithConversationIDs:v9 window:v7];
      }
      uint64_t v11 = [v9 count];
      id v12 = MFReconciliationLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = v11;
        _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_DEFAULT, "Inbox library reconciliation finished batch. Reconciled %lu conversations", buf, 0xCu);
      }

      v6 += v11;
    }
    while (v11);
    uint64_t v13 = MFReconciliationLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Inbox library reconciliation finished. Reconciled %lu conversations", buf, 0xCu);
    }

    os_signpost_id_t v14 = MFReconciliationSignpostLog();
    uint64_t v15 = v14;
    if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 134349312;
      uint64_t v18 = 2;
      __int16 v19 = 2050;
      uint64_t v20 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v15, OS_SIGNPOST_INTERVAL_END, spid, "MFLibraryContextBasedReconciliation", "ContextType=%{public,signpost.telemetry:number1}ld Conversations=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x16u);
    }
  }
}

- (void)_reconcileRemainingEntries
{
  if (a1)
  {
    uint64_t v2 = MFReconciliationSignpostLog();
    os_signpost_id_t v3 = os_signpost_id_generate(v2);

    os_signpost_id_t v4 = MFReconciliationLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "Starting library reconciliation for remaining entries", buf, 2u);
    }

    id v5 = MFReconciliationSignpostLog();
    uint64_t v6 = v5;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MFLibraryAllRemainingReconciliation", "Starting library all remaining entries reconciliation enableTelemetry=YES ", v13, 2u);
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F60B88]);
    [*(id *)(a1 + 48) reconcileAllObjectsWithWindow:v7];
    [*(id *)(a1 + 40) reconcileAllObjectsWithWindow:v7];
    id v8 = MFReconciliationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "Finished library reconciliation for remaining entries", v12, 2u);
    }

    uint64_t v9 = MFReconciliationSignpostLog();
    id v10 = v9;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v10, OS_SIGNPOST_INTERVAL_END, v3, "MFLibraryAllRemainingReconciliation", "", v11, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadReconciler, 0);
  objc_storeStrong((id *)&self->_messageReconciler, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_destroyWeak((id *)&self->_queryProvider);
  objc_storeStrong((id *)&self->_reconciliationCleanupScheduler, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
}

@end