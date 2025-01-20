@interface PPRecordMonitoringHelper
- (BOOL)loadRecordsAndMonitorChangesWithDelegate:(id)a3 recordGenerator:(id)a4 notificationRegistrationBlock:(id)a5;
- (PPRecordMonitoringHelper)initWithName:(id)a3;
- (id)_handleRecentChangesWithDelegates:(id)a3 changeGenerator:(id)a4 recordGenerator:(id)a5;
- (id)_setupRecentChangesWithDelegates:(id)a3 recordGenerator:(id)a4;
- (void)handleChangeNotificationWithName:(id)a3 afterDelaySeconds:(double)a4 handler:(id)a5;
- (void)loadRecordsWithDelegate:(id)a3 recordGenerator:(id)a4;
- (void)resetWithDelegate:(id)a3 recentChangesInProgress:(BOOL)a4 recordGenerator:(id)a5;
- (void)sendChangesToDelegatesWithChangeGenerator:(id)a3 recordGenerator:(id)a4;
- (void)sendResetToAllDelegatesWithRecordGenerator:(id)a3;
- (void)unloadDelegate:(id)a3;
@end

@implementation PPRecordMonitoringHelper

- (PPRecordMonitoringHelper)initWithName:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PPRecordMonitoringHelper;
  v6 = [(PPRecordMonitoringHelper *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);

    id v12 = (id) [[NSString alloc] initWithFormat:@"com.apple.proactive.PersonalizationPortrait.monitorHelper.%@", v7->_name];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v7->_hasRegistered = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)unloadDelegate:(id)a3
{
  id v4 = a3;
  id v5 = self->_delegates;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PPRecordMonitoringHelper_unloadDelegate___block_invoke;
  v9[3] = &unk_1E550E9C8;
  v10 = v5;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(queue, v9);
}

uint64_t __43__PPRecordMonitoringHelper_unloadDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
}

- (id)_handleRecentChangesWithDelegates:(id)a3 changeGenerator:(id)a4 recordGenerator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke;
  v14[3] = &unk_1E550E5D0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v14);

  return v12;
}

uint64_t __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v3;
    _os_log_impl(&dword_18CAA6000, v4, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling recent record handler", buf, 0xCu);
  }

  char v28 = 0;
  id v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    *(_DWORD *)buf = 138412546;
    id v31 = v3;
    __int16 v32 = 2048;
    uint64_t v33 = v7;
    _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: handling %tu record changes", buf, 0x16u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = [v3 recentRecordLoadingHandler:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        if ((v13 - 3) >= 0xFFFFFFFE)
        {
          if (v13 == 1)
          {
            v19 = pp_default_log_handle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v31 = v3;
              _os_log_debug_impl(&dword_18CAA6000, v19, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to handler with stop", buf, 0xCu);
            }

            [v3 recentRecordLoadingCompletion];
          }
          else if (v13 == 2)
          {
            id v16 = pp_default_log_handle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v31 = v3;
              _os_log_debug_impl(&dword_18CAA6000, v16, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to handler with reset", buf, 0xCu);
            }

            uint64_t v17 = *(void *)(a1 + 32);
            v18 = *(NSObject **)(v17 + 16);
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke_10;
            v21[3] = &unk_1E550E580;
            v21[4] = v17;
            id v22 = v3;
            id v23 = *(id *)(a1 + 48);
            dispatch_async(v18, v21);
          }
          uint64_t v15 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v14 = pp_default_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v3;
    _os_log_debug_impl(&dword_18CAA6000, v14, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: done calling recentRecordLoadingHandlers", buf, 0xCu);
  }

  uint64_t v15 = 1;
LABEL_25:

  return v15;
}

uint64_t __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetWithDelegate:*(void *)(a1 + 40) recentChangesInProgress:1 recordGenerator:*(void *)(a1 + 48)];
}

uint64_t __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetWithDelegate:*(void *)(a1 + 40) recentChangesInProgress:1 recordGenerator:*(void *)(a1 + 48)];
}

- (id)_setupRecentChangesWithDelegates:(id)a3 recordGenerator:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke;
  v10[3] = &unk_1E550E5A8;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v10);

  return v8;
}

BOOL __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v3;
    _os_log_impl(&dword_18CAA6000, v4, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling recent setup", buf, 0xCu);
  }

  int v5 = [v3 recentRecordLoadingSetup];
  unsigned int v6 = v5 - 3;
  if ((v5 - 3) >= 0xFFFFFFFE)
  {
    if (v5 == 1)
    {
      uint64_t v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v3;
        _os_log_debug_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to setup with stop", buf, 0xCu);
      }

      [v3 recentRecordLoadingCompletion];
    }
    else if (v5 == 2)
    {
      id v7 = pp_default_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v3;
        _os_log_debug_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to setup with reset", buf, 0xCu);
      }

      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(NSObject **)(v8 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke_7;
      block[3] = &unk_1E550E580;
      block[4] = v8;
      id v13 = v3;
      id v14 = *(id *)(a1 + 40);
      dispatch_async(v9, block);
    }
  }

  return v6 < 0xFFFFFFFE;
}

uint64_t __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetWithDelegate:*(void *)(a1 + 40) recentChangesInProgress:1 recordGenerator:*(void *)(a1 + 48)];
}

- (void)sendChangesToDelegatesWithChangeGenerator:(id)a3 recordGenerator:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20 = (void *)os_transaction_create();
  uint64_t v8 = [(NSHashTable *)self->_delegates allObjects];
  uint64_t v9 = pp_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412546;
    v29 = name;
    __int16 v30 = 2048;
    uint64_t v31 = [v8 count];
    _os_log_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: sending changes to %tu delegates", buf, 0x16u);
  }

  v19 = v8;
  id v11 = [(PPRecordMonitoringHelper *)self _setupRecentChangesWithDelegates:v8 recordGenerator:v7];
  v21 = v7;
  id v22 = v6;
  id v12 = [(PPRecordMonitoringHelper *)self _handleRecentChangesWithDelegates:v11 changeGenerator:v6 recordGenerator:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(NSString **)(*((void *)&v23 + 1) + 8 * v16);
        v18 = pp_default_log_handle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v17;
          _os_log_debug_impl(&dword_18CAA6000, v18, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recentRecordLoadingCompletion", buf, 0xCu);
        }

        [(NSString *)v17 recentRecordLoadingCompletion];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
}

- (void)resetWithDelegate:(id)a3 recentChangesInProgress:(BOOL)a4 recordGenerator:(id)a5
{
  BOOL v6 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    uint64_t v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling completion block in preparation for reset", (uint8_t *)&v12, 0xCu);
    }

    [v8 recentRecordLoadingCompletion];
  }
  id v11 = pp_default_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_18CAA6000, v11, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling resetRecordData", (uint8_t *)&v12, 0xCu);
  }

  [v8 resetRecordData];
  [(PPRecordMonitoringHelper *)self loadRecordsWithDelegate:v8 recordGenerator:v9];
}

- (void)sendResetToAllDelegatesWithRecordGenerator:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = (void *)os_transaction_create();
  int v5 = [(NSHashTable *)self->_delegates allObjects];
  BOOL v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v5 count];
    _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: sending reset to all %tu delegates", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        id v13 = pp_default_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v12;
          _os_log_debug_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling reset", buf, 0xCu);
        }

        [(PPRecordMonitoringHelper *)self resetWithDelegate:v12 recentChangesInProgress:0 recordGenerator:v4];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)handleChangeNotificationWithName:(id)a3 afterDelaySeconds:(double)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F93B18];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__PPRecordMonitoringHelper_handleChangeNotificationWithName_afterDelaySeconds_handler___block_invoke;
  v14[3] = &unk_1E550E580;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v10 runAsyncOnQueue:queue afterDelaySeconds:v14 block:a4];
}

uint64_t __87__PPRecordMonitoringHelper_handleChangeNotificationWithName_afterDelaySeconds_handler___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(a1[4] + 8);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: handleChangeNotification for %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)loadRecordsWithDelegate:(id)a3 recordGenerator:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = (void (**)(id, id))a4;
  uint64_t v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: loading records", buf, 0xCu);
  }

  __int16 v8 = (void *)os_transaction_create();
  uint64_t v9 = pp_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_debug_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recordLoadingSetup", buf, 0xCu);
  }

  int v10 = [v5 recordLoadingSetup];
  uint64_t v11 = pp_default_log_handle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10 == 1)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v5;
      _os_log_debug_impl(&dword_18CAA6000, v11, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied stop to setup, going to call completion", buf, 0xCu);
    }

    [v5 recordLoadingCompletion];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v5;
      _os_log_debug_impl(&dword_18CAA6000, v11, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recordGenerator", buf, 0xCu);
    }

    v6[2](v6, v5);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x192F97350](v14);
          if (objc_msgSend(v5, "recordLoadingHandler:", v18, (void)v22) == 1)
          {
            v20 = pp_default_log_handle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v28 = v5;
              _os_log_debug_impl(&dword_18CAA6000, v20, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied stop to record handler", buf, 0xCu);
            }

            goto LABEL_23;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        uint64_t v15 = v14;
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    uint64_t v21 = pp_default_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v5;
      _os_log_debug_impl(&dword_18CAA6000, v21, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recordLoadingCompletion", buf, 0xCu);
    }

    [v5 recordLoadingCompletion];
  }
}

- (BOOL)loadRecordsAndMonitorChangesWithDelegate:(id)a3 recordGenerator:(id)a4 notificationRegistrationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __115__PPRecordMonitoringHelper_loadRecordsAndMonitorChangesWithDelegate_recordGenerator_notificationRegistrationBlock___block_invoke;
  v16[3] = &unk_1E550E558;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  objc_copyWeak(&v21, &location);
  id v20 = v10;
  id v14 = v10;
  dispatch_async(queue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return 1;
}

void __115__PPRecordMonitoringHelper_loadRecordsAndMonitorChangesWithDelegate_recordGenerator_notificationRegistrationBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: loadRecordsAndMonitorChangesWithDelegate", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 40) loadRecordsWithDelegate:*(void *)(a1 + 32) recordGenerator:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 32)];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (WeakRetained && !WeakRetained[32])
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    v5[32] = 1;
  }
}

@end