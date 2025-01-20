@interface TPSDataMigrator
+ (void)_performDesiredOutcomeMigration;
+ (void)_performSavedTipsMigration;
+ (void)performMigrationIfNeeded;
+ (void)revertTipStatusArchivalIfNeeded;
@end

@implementation TPSDataMigrator

+ (void)performMigrationIfNeeded
{
  [a1 _performDesiredOutcomeMigration];

  [a1 _performSavedTipsMigration];
}

+ (void)_performDesiredOutcomeMigration
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v2 BOOLForKey:@"TPSDidMigrateDesiredOutcomePerformed"] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4492000, v3, OS_LOG_TYPE_DEFAULT, "Should perform desired outcome migration.", buf, 2u);
    }

    v4 = [MEMORY[0x1E4FAF3F8] sharedInstance];
    v5 = [v4 tipStatusController];

    v6 = [v5 tipStatusMap];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke;
    v8[3] = &unk_1E6E6CA68;
    id v9 = v5;
    id v7 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
    [v2 setBool:1 forKey:@"TPSDidMigrateDesiredOutcomePerformed"];
    [v2 synchronize];
  }
}

void __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [a3 desiredOutcomePerformedDates];
  id v7 = [v6 firstObject];

  if (v7)
  {
    [*(id *)(a1 + 32) donateDesiredOutcomePerformedForIdentifier:v5 date:v7];
    v8 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke_cold_1();
    }
  }
}

+ (void)_performSavedTipsMigration
{
  v2 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4492000, v2, OS_LOG_TYPE_DEFAULT, "Should migrate saved tips and dates with correlation id.", buf, 2u);
  }

  v3 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  v4 = [v3 tipStatusController];

  id v5 = [v4 tipStatusMap];
  v6 = [MEMORY[0x1E4FAF4A8] sharedInstance];
  id v7 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  v8 = [v7 majorVersion];
  uint64_t v9 = [v8 integerValue];

  [v6 removeInvalidEntries];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__TPSDataMigrator__performSavedTipsMigration__block_invoke;
  v12[3] = &unk_1E6E6CA90;
  id v14 = v4;
  uint64_t v15 = v9;
  id v13 = v6;
  id v10 = v4;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];
}

void __45__TPSDataMigrator__performSavedTipsMigration__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 savedDate];
  v8 = [v6 lastUsedVersion];
  uint64_t v9 = [v8 integerValue];

  if (v7 && v9 >= a1[6] - 2)
  {
    id v10 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __45__TPSDataMigrator__performSavedTipsMigration__block_invoke_cold_1();
    }

    id v11 = (void *)a1[4];
    v12 = [v6 correlationIdentifier];
    id v13 = [v6 identifier];
    id v14 = [v6 lastUsedVersion];
    [v11 updateSavedTipsWithCorrelationId:v12 tipIdentifier:v13 savedDate:v7 lastUsedVersion:v14];

    uint64_t v15 = (void *)a1[5];
    v16 = [v6 identifier];
    [v15 clearSavedDateForIdentifier:v16];
  }
}

+ (void)revertTipStatusArchivalIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v2 BOOLForKey:@"TPSDidRevertArchivedTipStatuses"] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1E4492000, v3, OS_LOG_TYPE_DEFAULT, "Should revert tip status archival.", (uint8_t *)&v13, 2u);
    }

    v4 = [MEMORY[0x1E4FAF3F8] sharedInstance];
    id v5 = [v4 archivedTipStatuses];

    if ([v5 count])
    {
      id v6 = [MEMORY[0x1E4FAF3F8] sharedInstance];
      id v7 = [v6 tipStatusController];

      v8 = [MEMORY[0x1E4FAF480] daemon];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "tipStatusCount"));
        int v13 = 138412290;
        id v14 = v9;
        _os_log_impl(&dword_1E4492000, v8, OS_LOG_TYPE_DEFAULT, "Pre-unarchival tip status count: %@", (uint8_t *)&v13, 0xCu);
      }
      [v7 addTipStatuses:v5];
      id v10 = [MEMORY[0x1E4FAF480] daemon];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "tipStatusCount"));
        int v13 = 138412290;
        id v14 = v11;
        _os_log_impl(&dword_1E4492000, v10, OS_LOG_TYPE_DEFAULT, "Post-unarchival tip status count: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    v12 = [MEMORY[0x1E4FAF3F8] sharedInstance];
    [v12 deleteTipStatusArchivalDirectory];

    [v2 setBool:1 forKey:@"TPSDidRevertArchivedTipStatuses"];
    [v2 removeObjectForKey:@"TPSLastTipStatusArchivalMajorVersion"];
    [v2 removeObjectForKey:@"TPSDidResetTipStatusDataProtectionLevel"];
    [v2 synchronize];
  }
}

void __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6(&dword_1E4492000, v0, v1, "Migrate desiredOutomePerformed for identifier: %@, date: %@");
}

void __45__TPSDataMigrator__performSavedTipsMigration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6(&dword_1E4492000, v0, v1, "Migrate savedTip to defaults for identifier: %@, date: %@");
}

@end