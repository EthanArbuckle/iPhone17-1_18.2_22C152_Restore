@interface SCSharingReminderMaintenanceTask
- (BOOL)isRepeating;
- (id)identifier;
- (id)repeatingTaskHandler;
@end

@implementation SCSharingReminderMaintenanceTask

- (id)identifier
{
  return @"com.apple.sc_reminder_task_scheduler";
}

- (BOOL)isRepeating
{
  return 1;
}

- (id)repeatingTaskHandler
{
  return &__block_literal_global_4;
}

void __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_2;
  v13[3] = &unk_265497018;
  v13[4] = &v14;
  [v2 setExpirationHandler:v13];
  if (*((unsigned char *)v15 + 24))
  {
    id v12 = 0;
    char v3 = [v2 setTaskExpiredWithRetryAfter:&v12 error:300.0];
    id v4 = v12;
    if ((v3 & 1) == 0)
    {
      v5 = SCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        v6 = [v2 identifier];
        __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_cold_1(v6, (uint64_t)v4, v20, v5);
      }

      [v2 setTaskCompleted];
    }
  }
  v7 = SCLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v2;
    _os_log_impl(&dword_25B654000, v7, OS_LOG_TYPE_INFO, "\"SCSharingReminderMaintenanceTask handling underlying task: %@\"", buf, 0xCu);
  }

  v8 = objc_alloc_init(SCSharingReminderManager);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_3;
  v10[3] = &unk_265496CD8;
  id v9 = v2;
  id v11 = v9;
  [(SCSharingReminderManager *)v8 validateCacheWithCompletion:v10];

  _Block_object_dispose(&v14, 8);
}

uint64_t __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = SCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = @"Unknown";
      if (v5) {
        v8 = v5;
      }
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_error_impl(&dword_25B654000, v6, OS_LOG_TYPE_ERROR, "\"Error handling task %@, error: %@\"", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 32) setTaskCompleted];
}

@end