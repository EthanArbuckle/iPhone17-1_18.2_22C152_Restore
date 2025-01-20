@interface MFCategorySubsystem
@end

@implementation MFCategorySubsystem

uint64_t __34__MFCategorySubsystem_iOS_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __54__MFCategorySubsystem_iOS_registerInboxMigrationTasks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Mail Categorization FastPass started.", v6, 2u);
    }

    [WeakRetained _startCategoryMigrationWithBGTask:v3 andReason:2];
  }
}

void __54__MFCategorySubsystem_iOS_registerInboxMigrationTasks__block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Mail Categorization started.", v6, 2u);
    }

    [WeakRetained _startCategoryMigrationWithBGTask:v3 andReason:1];
  }
}

void __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1[4] migrationTaskQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_2;
  block[3] = &unk_1E5D3E180;
  objc_copyWeak(&v8, a1 + 5);
  objc_copyWeak(&v9, a1 + 6);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    if (v3)
    {
      v4 = [WeakRetained migrationTask];
      id v5 = [v4 systemTask];
      int v6 = [v5 isEqual:v3];

      if (v6)
      {
        id v7 = [WeakRetained progressReportingQueue];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_3;
        v8[3] = &unk_1E5D3B6E0;
        id v9 = a1[4];
        id v10 = v3;
        dispatch_async(v7, v8);
      }
    }
  }
}

uint64_t __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F60AB0] log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_3_cold_1(v4, [*(id *)(a1 + 32) categorizedMessages], objc_msgSend(*(id *)(a1 + 32), "totalMessagesToCategorize"), v2);
  }

  return objc_msgSend(*(id *)(a1 + 40), "reportTaskWorkloadProgress:completed:category:subCategory:error:", objc_msgSend(*(id *)(a1 + 32), "totalMessagesToCategorize"), objc_msgSend(*(id *)(a1 + 32), "categorizedMessages"), 30, @"Message Categorization", 0);
}

void __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_35(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v5 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_35_cold_1((uint64_t)v3, v5);
      }
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Mail Categorization completed.", buf, 2u);
      }
    }

    int v6 = [a1[4] migrationTaskQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_36;
    v7[3] = &unk_1E5D3E1D0;
    objc_copyWeak(&v9, a1 + 6);
    id v8 = WeakRetained;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v9);
  }
}

void __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained setMigrationTask:0];
    [*(id *)(a1 + 32) setTaskExpiredWithRetryAfter:0 error:7200.0];
  }
}

void __58__MFCategorySubsystem_iOS__registerAuthStateMigrationTask__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _startNonInboxMessageAuthenticationnWithBGTask:v5];
  }
}

void __74__MFCategorySubsystem_iOS__startNonInboxMessageAuthenticationnWithBGTask___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) migrationTaskQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__MFCategorySubsystem_iOS__startNonInboxMessageAuthenticationnWithBGTask___block_invoke_2;
  v4[3] = &unk_1E5D3B6E0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __74__MFCategorySubsystem_iOS__startNonInboxMessageAuthenticationnWithBGTask___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMigrationTask:0];
  v2 = *(void **)(a1 + 40);
  return [v2 setTaskCompleted];
}

void __57__MFCategorySubsystem_iOS_registerBusinessesGroupingTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Starting Business Connect Grouping task.", v6, 2u);
    }

    [WeakRetained startBusinessConnectGroupingWithBGTask:v3];
  }
}

uint64_t __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = [MEMORY[0x1E4F60AB0] log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Businesses Connect grouping progress: %ld/%ld", (uint8_t *)&v8, 0x16u);
  }

  return [*(id *)(a1 + 32) reportTaskWorkloadProgress:a3 completed:a2 category:30 subCategory:@"Business Connect Grouping" error:0];
}

void __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_51(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_51_cold_1((uint64_t)v3, v4);
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4F60AB0] log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "Completed Businesses Connect grouping", buf, 2u);
    }
  }

  id v5 = [a1[4] migrationTaskQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_52;
  v6[3] = &unk_1E5D3E270;
  objc_copyWeak(&v7, a1 + 5);
  objc_copyWeak(&v8, a1 + 6);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      [v4 setMigrationTask:0];
      [v3 setTaskCompleted];
    }

    id WeakRetained = v4;
  }
}

void __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 56));
    if (v3) {
      [v4 _setMigrationTaskWithSystemTask:v3 migrator:*(void *)(a1 + 32) cancelable:*(void *)(a1 + 40)];
    }

    id WeakRetained = v4;
  }
}

void __79__MFCategorySubsystem_iOS__setMigrationTaskWithSystemTask_migrator_cancelable___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained migrationTaskQueue];
    if (v5)
    {
      int v6 = (id *)(a1 + 40);
      id v7 = objc_loadWeakRetained((id *)(a1 + 40));
      id v8 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v7;
        _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_INFO, "Queuing block to cancel migration for task: %{public}@", buf, 0xCu);
      }

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __79__MFCategorySubsystem_iOS__setMigrationTaskWithSystemTask_migrator_cancelable___block_invoke_54;
      v9[3] = &unk_1E5D3E270;
      objc_copyWeak(&v10, v2);
      objc_copyWeak(&v11, v6);
      dispatch_async(v5, v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
    }
  }
}

void __79__MFCategorySubsystem_iOS__setMigrationTaskWithSystemTask_migrator_cancelable___block_invoke_54(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      id v4 = [WeakRetained migrationTask];
      int v5 = [v4 isEqual:v3];

      if (v5)
      {
        int v6 = [MEMORY[0x1E4F60AB0] log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138543362;
          id v12 = v3;
          _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Task expired, canceling: %{public}@", (uint8_t *)&v11, 0xCu);
        }

        [WeakRetained setMigrationTask:0];
        goto LABEL_13;
      }
      id v7 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v3;
        id v8 = "Previous task expired: %{public}@";
        uint64_t v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_11;
      }
    }
    else
    {
      id v7 = [MEMORY[0x1E4F60AB0] log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        id v8 = "Previous task expired";
        uint64_t v9 = v7;
        uint32_t v10 = 2;
LABEL_11:
        _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
      }
    }

LABEL_13:
  }
}

void __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_3_cold_1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "Mail Categorization progress: %lu / %lu", buf, 0x16u);
}

void __71__MFCategorySubsystem_iOS__startCategoryMigrationWithBGTask_andReason___block_invoke_35_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Mail Categorization completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __66__MFCategorySubsystem_iOS_startBusinessConnectGroupingWithBGTask___block_invoke_51_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Completed Businesses Connect grouping with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end