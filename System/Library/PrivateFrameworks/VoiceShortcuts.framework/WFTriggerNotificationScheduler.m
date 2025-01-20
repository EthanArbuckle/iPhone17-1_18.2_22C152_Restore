@interface WFTriggerNotificationScheduler
+ (BOOL)shortenTimeIntervalsForTesting;
- (OS_dispatch_queue)queue;
- (WFDatabaseProvider)databaseProvider;
- (WFTriggerNotificationScheduler)initWithUserNotificationManager:(id)a3 databaseProvider:(id)a4;
- (WFTriggerUserNotificationManager)userNotificationManager;
- (id)initialRunDateForConfiguredTrigger:(id)a3;
- (int)updateTriggerNotificationLevels:(id)a3 database:(id)a4;
- (void)cancelActivitiesFromTrigger:(id)a3;
- (void)cancelActivitiesFromTriggerIdentifier:(id)a3;
- (void)cancelAllActivitiesFromTriggers:(id)a3;
- (void)migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:(id)a3;
- (void)postBackgroundRunningNotificationForTrigger:(id)a3;
- (void)registerConfiguredTrigger:(id)a3 delay:(id)a4;
- (void)registerWithDatabaseProvider:(id)a3;
- (void)scheduleTriggerForNotifications:(id)a3;
@end

@implementation WFTriggerNotificationScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFTriggerUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void)migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFTriggerNotificationScheduler *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  v7 = v6;
  if (v6)
  {
    int v8 = [v6 BOOLForKey:@"WFTriggerNotificationLevelMigrationPerformed"];
    v9 = getWFTriggerNotificationsLogObject();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]";
        v11 = "%s Migration has already occured not doing anything.";
        v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl(&dword_1C7D7E000, v12, v13, v11, buf, 0xCu);
      }
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]";
        _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Migrating old triggers.", buf, 0xCu);
      }

      v14 = [v4 allConfiguredTriggers];
      v9 = [v14 descriptors];

      v15 = (void *)[objc_alloc(MEMORY[0x1E4FB7360]) initWithDatabase:v4];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __95__WFTriggerNotificationScheduler_migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase___block_invoke;
      v17[3] = &unk_1E653FF50;
      id v18 = v15;
      id v16 = v15;
      [v9 enumerateObjectsUsingBlock:v17];
      [v7 setBool:1 forKey:@"WFTriggerNotificationLevelMigrationPerformed"];
    }
  }
  else
  {
    v9 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]";
      v11 = "%s Could not get system shortcut user defaults not migrating.";
      v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }
}

void __95__WFTriggerNotificationScheduler_migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  char v3 = [v2 updateNotificationLevel:2 forConfiguredTrigger:a2 error:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    v5 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v8 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]_block_invoke";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Could not migrate trigger to WFTriggerNotificationLevelMonth with error: %{public}@", buf, 0x16u);
    }
  }
}

- (id)initialRunDateForConfiguredTrigger:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFTriggerNotificationScheduler *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(WFTriggerNotificationScheduler *)self databaseProvider];
  id v20 = 0;
  v7 = [v6 databaseWithError:&v20];
  id v8 = v20;

  if (!v7)
  {
    v12 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFTriggerNotificationScheduler initialRunDateForConfiguredTrigger:]";
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Failed to get initial run date for configured trigger because database is not available: %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  __int16 v9 = [v4 identifier];
  id v10 = [v7 sortedRunEventsForTriggerID:v9];
  uint64_t v11 = [v10 descriptors];
  v12 = [v11 lastObject];

  os_log_type_t v13 = getWFTriggerNotificationsLogObject();
  v14 = v13;
  if (!v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v4 identifier];
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFTriggerNotificationScheduler initialRunDateForConfiguredTrigger:]";
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s No run events found for trigger with id: %@", buf, 0x16u);
    }
    v12 = 0;
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v4 identifier];
    id v16 = [v12 date];
    *(_DWORD *)buf = 136315650;
    v22 = "-[WFTriggerNotificationScheduler initialRunDateForConfiguredTrigger:]";
    __int16 v23 = 2112;
    id v24 = v15;
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s initial run event date for trigger: %@ - %@", buf, 0x20u);
  }
  v17 = [v12 date];
LABEL_12:

  return v17;
}

- (void)cancelActivitiesFromTriggerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(WFTriggerNotificationScheduler *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WFTriggerNotificationScheduler_cancelActivitiesFromTriggerIdentifier___block_invoke;
  block[3] = &unk_1E65420F0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __72__WFTriggerNotificationScheduler_cancelActivitiesFromTriggerIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [NSString stringWithFormat:@"com.apple.siriactionsd.TriggerNotification.%@", *(void *)(a1 + 32)];
  v2 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "-[WFTriggerNotificationScheduler cancelActivitiesFromTriggerIdentifier:]_block_invoke";
    __int16 v6 = 2114;
    v7 = v1;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Unregistering trigger notification activities for identifier: %{public}@", buf, 0x16u);
  }

  id v3 = v1;
  xpc_activity_unregister((const char *)[v3 UTF8String]);
}

- (void)cancelActivitiesFromTrigger:(id)a3
{
  id v4 = a3;
  v5 = [(WFTriggerNotificationScheduler *)self queue];
  dispatch_assert_queue_V2(v5);

  __int16 v6 = [v4 identifier];

  v7 = [NSString stringWithFormat:@"com.apple.siriactionsd.TriggerNotification.%@", v6];

  id v8 = v7;
  xpc_activity_unregister((const char *)[v8 UTF8String]);
}

- (void)cancelAllActivitiesFromTriggers:(id)a3
{
  id v4 = a3;
  v5 = [(WFTriggerNotificationScheduler *)self queue];
  dispatch_assert_queue_V2(v5);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__WFTriggerNotificationScheduler_cancelAllActivitiesFromTriggers___block_invoke;
  v6[3] = &unk_1E653FF50;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
}

uint64_t __66__WFTriggerNotificationScheduler_cancelAllActivitiesFromTriggers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelActivitiesFromTrigger:a2];
}

- (int)updateTriggerNotificationLevels:(id)a3 database:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFTriggerNotificationScheduler *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke;
  v18[3] = &unk_1E6540760;
  v18[4] = &v19;
  [v6 enumerateObjectsUsingBlock:v18];
  __int16 v9 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = WFReadableTriggerNotificationLevel();
    *(_DWORD *)buf = 136315394;
    id v24 = "-[WFTriggerNotificationScheduler updateTriggerNotificationLevels:database:]";
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Updating scheduled trigger notifications for runs in the last 7 days to level: %@", buf, 0x16u);
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB7360]) initWithDatabase:v7];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke_187;
  v15[3] = &unk_1E6540058;
  id v12 = v11;
  id v16 = v12;
  v17 = &v19;
  [v6 enumerateObjectsUsingBlock:v15];
  int v13 = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (![v6 shouldPrompt] || (objc_msgSend(v6, "shouldNotify") & 1) == 0)
  {
    int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v4 = [v6 notificationLevel];
    if (v3 <= v4 + 1) {
      int v5 = v4 + 1;
    }
    else {
      int v5 = v3;
    }
    if (v5 >= 3) {
      int v5 = 3;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
}

void __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke_187(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v9 = 0;
  char v5 = [v3 updateNotificationLevel:v4 forConfiguredTrigger:a2 error:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    id v7 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = WFReadableTriggerNotificationLevel();
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "-[WFTriggerNotificationScheduler updateTriggerNotificationLevels:database:]_block_invoke";
      __int16 v12 = 2112;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Could not increment trigger to level: %@ due to error: %@", buf, 0x20u);
    }
  }
}

- (void)postBackgroundRunningNotificationForTrigger:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(WFTriggerNotificationScheduler *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Posting background notification", buf, 0xCu);
  }

  id v7 = [(WFTriggerNotificationScheduler *)self databaseProvider];
  id v38 = 0;
  id v8 = [v7 databaseWithError:&v38];
  id v9 = v38;

  if (v8)
  {
    if ((int)[v4 notificationLevel] < 3)
    {
      __int16 v12 = (void *)MEMORY[0x1E4F1CAD0];
      int v13 = [v8 triggerRunEventsInTheLastWeek];
      __int16 v14 = [v13 descriptors];
      id v15 = objc_msgSend(v14, "if_compactMap:", &__block_literal_global_78);
      uint64_t v16 = [v12 setWithArray:v15];
      v17 = [v4 identifier];
      id v18 = [v16 setByAddingObject:v17];

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_2;
      v36[3] = &unk_1E653FFE0;
      id v19 = v8;
      id v37 = v19;
      id v20 = objc_msgSend(v18, "if_compactMap:", v36);
      uint64_t v21 = [v20 allObjects];

      if ([v21 count])
      {
        [(WFTriggerNotificationScheduler *)self cancelAllActivitiesFromTriggers:v21];
        int v22 = os_transaction_create();
        __int16 v23 = WFTriggerIDsToDisableNotificationUserInfoFromTriggers();
        id v24 = [(WFTriggerNotificationScheduler *)self userNotificationManager];
        id v35 = v9;
        [v24 postBackgroundRunningNotificationWithConfiguredTriggers:v21 userInfo:v23 error:&v35];
        id v30 = v35;

        int v25 = [(WFTriggerNotificationScheduler *)self updateTriggerNotificationLevels:v21 database:v19];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_183;
        v33[3] = &unk_1E6540008;
        id v34 = v19;
        v26 = objc_msgSend(v21, "if_compactMap:", v33);

        uint64_t v27 = getWFTriggerNotificationsLogObject();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        if (v25 > 2)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136315138;
            v40 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
            _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_DEFAULT, "%s Level is at WFTriggerNotificationLevelNever not rescheduling triggers", buf, 0xCu);
          }
        }
        else
        {
          if (v28)
          {
            v29 = WFReadableTriggerNotificationLevel();
            *(_DWORD *)buf = 136315394;
            v40 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
            __int16 v41 = 2112;
            id v42 = v29;
            _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_DEFAULT, "%s Re-registering triggers to level: %@", buf, 0x16u);
          }
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_185;
          v31[3] = &unk_1E6540030;
          v31[4] = self;
          int v32 = v25;
          [v26 enumerateObjectsUsingBlock:v31];
        }

        id v9 = v30;
      }
      else
      {
        int v22 = getWFTriggerNotificationsLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v40 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
          _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to post background running notification due to no configured triggers being recently ran", buf, 0xCu);
        }
        v26 = v21;
      }
    }
    else
    {
      id v10 = getWFTriggerNotificationsLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Attempted to post background running notification but trigger was in WFTriggerNotificationLevelNever, cancelling all activities", buf, 0xCu);
      }

      [(WFTriggerNotificationScheduler *)self cancelActivitiesFromTrigger:v4];
    }
  }
  else
  {
    uint64_t v11 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to post background notification because database is not available: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configuredTriggerForTriggerID:a2];
}

id __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_183(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  int v3 = [a2 identifier];
  id v4 = [v2 configuredTriggerForTriggerID:v3];

  return v4;
}

void __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_185(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) initialRunDateForConfiguredTrigger:v3];
  if (v4)
  {
    char v5 = WFTimeIntervalForNotificationLevelFromDate(*(_DWORD *)(a1 + 40), v4);
    [*(id *)(a1 + 32) registerConfiguredTrigger:v3 delay:v5];
  }
  else
  {
    id v6 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Skipping rescheduling of trigger due to initial run date not being found", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke(uint64_t a1, void *a2)
{
  return [a2 triggerID];
}

- (void)registerConfiguredTrigger:(id)a3 delay:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFTriggerNotificationScheduler *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 identifier];
  id v10 = [NSString stringWithFormat:@"com.apple.siriactionsd.TriggerNotification.%@", v9];

  uint64_t v11 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]";
    __int16 v21 = 1024;
    int v22 = [v7 intValue];
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Registering trigger - creating activity with delay: %i for identifier: %{public}@", buf, 0x1Cu);
  }

  __int16 v12 = [[WFXPCActivityScheduler alloc] initWithActivityIdentifier:v10];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke;
  v17[3] = &unk_1E653FF98;
  id v18 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_177;
  v15[3] = &unk_1E6540DE8;
  void v15[4] = self;
  id v16 = v6;
  id v13 = v6;
  id v14 = v7;
  [(WFXPCActivityScheduler *)v12 scheduleWithCheckInHandler:v17 runHandler:v15];
}

void __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F14170], (int)[*(id *)(a1 + 32) intValue]);
  xpc_object_t v5 = xpc_activity_copy_criteria(v3);
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = xpc_equal(v5, v4);
    uint64_t v8 = MEMORY[0x1C87C5650](v6);
    uint64_t v9 = MEMORY[0x1C87C5650](v4);
    id v10 = getWFTriggerNotificationsLogObject();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315650;
        id v30 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke";
        __int16 v31 = 2082;
        uint64_t v32 = v8;
        __int16 v33 = 2082;
        uint64_t v34 = v9;
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s and it is equal to new criteria: %{public}s doing nothing", buf, 0x20u);
      }

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_173;
      v28[3] = &__block_descriptor_48_e5_v8__0l;
      v28[4] = v8;
      v28[5] = v9;
      __int16 v12 = v28;
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315650;
        id v30 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke_2";
        __int16 v31 = 2082;
        uint64_t v32 = v8;
        __int16 v33 = 2082;
        uint64_t v34 = v9;
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s but it is NOT equal: %{public}s setting", buf, 0x20u);
      }

      xpc_activity_set_criteria(v3, v4);
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_175;
      uint64_t v25 = &__block_descriptor_48_e5_v8__0l;
      uint64_t v26 = v8;
      uint64_t v27 = v9;
      __int16 v12 = &v22;
    }
    id v14 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), void *))_Block_copy(v12);
    v14[2](v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    id v13 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v30 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke_2";
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_DEFAULT, "%s Criteria does not exist, setting a new one", buf, 0xCu);
    }

    xpc_activity_set_criteria(v3, v4);
  }
}

uint64_t __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_177(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  xpc_object_t v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_2;
  block[3] = &unk_1E6541F40;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v4;
  id v8 = v4;
  dispatch_async(v5, block);

  return 0;
}

uint64_t __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) identifier];
    int v5 = 136315394;
    id v6 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Registering triggers - Run handler called: %@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 40) postBackgroundRunningNotificationForTrigger:*(void *)(a1 + 32)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_173(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    free(v2);
  }
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
  }
}

void __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_175(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    free(v2);
  }
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
  }
}

- (void)registerWithDatabaseProvider:(id)a3
{
  id v4 = a3;
  int v5 = [(WFTriggerNotificationScheduler *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke;
  v7[3] = &unk_1E6541F68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v9 = 0;
  id v3 = [v2 databaseWithError:&v9];
  id v4 = v9;
  if (v3)
  {
    [*(id *)(a1 + 40) migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:v3];
    int v5 = [v3 allConfiguredTriggersNeedingRunningNotifications];
    id v6 = [v5 descriptors];

    __int16 v7 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Possibly registering triggers: %@", buf, 0x16u);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke_171;
    v8[3] = &unk_1E653FF50;
    v8[4] = *(void *)(a1 + 40);
    [v6 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to schedule trigger notifications because database is not available: %{public}@", buf, 0x16u);
    }
  }
}

void __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke_171(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) initialRunDateForConfiguredTrigger:v3];
  int v5 = getWFTriggerNotificationsLogObject();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Registering triggers with initial run date - %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = WFTimeIntervalForNotificationLevelFromDate([v3 notificationLevel], v4);
    [*(id *)(a1 + 32) registerConfiguredTrigger:v3 delay:v6];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315138;
    id v8 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Skipping scheduling of trigger due to initial run date not being found", (uint8_t *)&v7, 0xCu);
  }
}

- (void)scheduleTriggerForNotifications:(id)a3
{
  id v4 = a3;
  int v5 = [(WFTriggerNotificationScheduler *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__WFTriggerNotificationScheduler_scheduleTriggerForNotifications___block_invoke;
  v7[3] = &unk_1E6541F68;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__WFTriggerNotificationScheduler_scheduleTriggerForNotifications___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)[*(id *)(a1 + 32) notificationLevel] < 3)
  {
    id v3 = [*(id *)(a1 + 40) databaseProvider];
    id v6 = 0;
    id v4 = [v3 databaseWithError:&v6];
    v2 = v6;

    if (v4)
    {
      [*(id *)(a1 + 40) migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:v4];
      int v5 = WFTimeIntervalForNotificationLevel([*(id *)(a1 + 32) notificationLevel]);
      [*(id *)(a1 + 40) registerConfiguredTrigger:*(void *)(a1 + 32) delay:v5];
    }
    else
    {
      int v5 = getWFTriggerNotificationsLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v8 = "-[WFTriggerNotificationScheduler scheduleTriggerForNotifications:]_block_invoke";
        __int16 v9 = 2114;
        id v10 = v2;
        _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to schedule trigger notifications because database is not available: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v2 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[WFTriggerNotificationScheduler scheduleTriggerForNotifications:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_ERROR, "%s Attempted to schedule trigger that was already in WFTriggerNotificationLevelNever state", buf, 0xCu);
    }
  }
}

- (WFTriggerNotificationScheduler)initWithUserNotificationManager:(id)a3 databaseProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFTriggerNotificationScheduler;
  __int16 v9 = [(WFTriggerNotificationScheduler *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userNotificationManager, a3);
    objc_storeStrong((id *)&v10->_databaseProvider, a4);
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int16 v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.siriactionsd.WFTriggerNotificationScheduler", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = v10;
  }

  return v10;
}

+ (BOOL)shortenTimeIntervalsForTesting
{
  v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  if ([v2 BOOLForKey:*MEMORY[0x1E4FB7468]]) {
    char v3 = VCIsInternalBuild();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

@end