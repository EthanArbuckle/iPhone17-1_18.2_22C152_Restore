@interface PLArchiveManager
+ (id)allArchivePaths;
+ (id)archiveEntriesFinished;
+ (id)archiveEntriesUnfinished;
+ (id)archiveEntriesWithComparisons:(id)a3;
+ (id)archiveForDate:(id)a3;
+ (id)lastArchivePath;
+ (id)sharedInstance;
+ (id)storageQueue;
+ (id)workQueue;
+ (void)systemTimeChangedByOffset:(double)a3;
- (BOOL)eliglibleToVacuumEPSQLForDate:(id)a3;
- (BOOL)enabled;
- (BOOL)interrupted;
- (BOOL)isInterrupted;
- (BOOL)monotonicResetOccurred;
- (NSDate)lastEPSQLVacuumDate;
- (NSMutableArray)archiveJobs;
- (NSMutableArray)notificationBlocks;
- (PLArchiveManager)init;
- (double)BGSQLDBDuration;
- (double)CESQLDBDuration;
- (double)EPSQLDBDuration;
- (double)EPSQLVacuumInterval;
- (double)PLSQLDBDuration;
- (double)XCSQLDBDuration;
- (double)archiveRetention;
- (double)interval;
- (double)mustRunInterval;
- (id)getArchivingCriteria;
- (void)cleanup;
- (void)dealloc;
- (void)deprecateTables;
- (void)deprecateTablesBGSQL;
- (void)deprecateTablesCESQL;
- (void)deprecateTablesEPSQL;
- (void)disable;
- (void)enable;
- (void)handleFailure:(int64_t)a3 forArchiveEntry:(id)a4;
- (void)migrate;
- (void)migrateArchive:(id)a3;
- (void)recover;
- (void)registerForArchivingNotificationUsingBlock:(id)a3;
- (void)runActivityWithLastCompletedDate:(id)a3;
- (void)runArchiveJobs;
- (void)runInitialActivity;
- (void)scheduleArchiveJobs;
- (void)setArchiveJobs:(id)a3;
- (void)setArchiveRetention:(double)a3;
- (void)setBGSQLDBDuration:(double)a3;
- (void)setCESQLDBDuration:(double)a3;
- (void)setEPSQLDBDuration:(double)a3;
- (void)setEPSQLVacuumInterval:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setLastEPSQLVacuumDate:(id)a3;
- (void)setMonotonicResetOccurred:(BOOL)a3;
- (void)setMustRunInterval:(double)a3;
- (void)setNotificationBlocks:(id)a3;
- (void)setPLSQLDBDuration:(double)a3;
- (void)setXCSQLDBDuration:(double)a3;
- (void)trimBackgroundProcessingLog;
- (void)trimCleanEnergyLog;
- (void)trimExtendedPersistenceLog;
@end

@implementation PLArchiveManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __34__PLArchiveManager_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(PLArchiveManager);
  return MEMORY[0x1F41817F8]();
}

- (PLArchiveManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)PLArchiveManager;
  v2 = [(PLArchiveManager *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    archiveJobs = v3->_archiveJobs;
    v3->_archiveJobs = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    notificationBlocks = v3->_notificationBlocks;
    v3->_notificationBlocks = (NSMutableArray *)v6;

    +[PLDefaults doubleForKey:@"PLArchiveManager_interval" ifNotSet:86400.0];
    v3->_interval = v8;
    +[PLDefaults doubleForKey:@"PLArchiveManager_mustRunInterval" ifNotSet:259200.0];
    v3->_mustRunInterval = v9;
    +[PLDefaults doubleForKey:@"PLArchiveManager_EPSQLVacuumInterval" ifNotSet:2592000.0];
    v3->_EPSQLVacuumInterval = v10;
    +[PLDefaults doubleForKey:@"PLArchiveManager_mainDBDuration" ifNotSet:86400.0];
    v3->_PLSQLDBDuration = v11;
    +[PLDefaults doubleForKey:@"PLArchiveManager_EPSQLDBDuration" ifNotSet:2592000.0];
    v3->_EPSQLDBDuration = v12;
    +[PLDefaults doubleForKey:@"PLArchiveManager_CESQLDBDuration" ifNotSet:604800.0];
    v3->_CESQLDBDuration = v13;
    +[PLDefaults doubleForKey:@"PLArchiveManager_BGSQLDBDuration" ifNotSet:2592000.0];
    v3->_BGSQLDBDuration = v14;
    +[PLDefaults doubleForKey:@"PLArchiveManager_XCSQLDBDuration" ifNotSet:31449600.0];
    v3->_XCSQLDBDuration = v15;
    +[PLDefaults doubleForKey:@"PLArchiveManager_allDBDuration" ifNotSet:604800.0];
    v3->_archiveRetention = v16;
    v3->_monotonicResetOccurred = +[PLDefaults longForKey:@"PLExitReasonKey" ifNotSet:-1] == 1006;
    v17 = +[PLTimeManager sharedInstance];
    [v17 registerForTimeChangedCallbackWithIdentifier:@"com.apple.powerlogd.archiver" forTimeReference:1 usingBlock:&__block_literal_global_50];

    [(PLArchiveManager *)v3 runInitialActivity];
  }
  return v3;
}

uint64_t __24__PLArchiveManager_init__block_invoke()
{
  return +[PLArchiveManager systemTimeChangedByOffset:](PLArchiveManager, "systemTimeChangedByOffset:");
}

- (void)dealloc
{
  [(PLArchiveManager *)self disable];
  v3.receiver = self;
  v3.super_class = (Class)PLArchiveManager;
  [(PLArchiveManager *)&v3 dealloc];
}

+ (id)workQueue
{
  uint64_t v2 = objc_opt_class();
  return +[PLUtilities workQueueForClass:v2];
}

+ (id)storageQueue
{
  uint64_t v2 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
  objc_super v3 = +[PLUtilities workQueueForKey:v2];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_enabled == v3)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_enabled = v3;
    objc_sync_exit(obj);

    if (v3)
    {
      [(PLArchiveManager *)obj enable];
    }
    else
    {
      [(PLArchiveManager *)obj disable];
    }
  }
}

- (void)setInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_interrupted != v3) {
    obj->_interrupted = v3;
  }
  objc_sync_exit(obj);
}

- (void)runInitialActivity
{
  [(PLArchiveManager *)self recover];
  [(PLArchiveManager *)self migrate];
  [(PLArchiveManager *)self cleanup];
}

- (id)getArchivingCriteria
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = +[PLActivityCriterionTime timeCriterionWithInterval:self->_interval];
  [v3 addObject:v4];

  v5 = +[PLActivityCriterionEntry audioOffCriterion];
  [v3 addObject:v5];

  if (+[PLUtilities hasBattery])
  {
    uint64_t v6 = +[PLActivityCriterionEntry displayOffCriterion];
    [v3 addObject:v6];

    v7 = +[PLActivityCriterionEntry pluggedInCriterion];
    [v3 addObject:v7];
  }
  return v3;
}

- (void)enable
{
  BOOL v3 = +[PowerlogCore sharedCore];
  uint64_t v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if ((v5 & 1) == 0)
  {
    [(PLArchiveManager *)self setInterrupted:0];
    uint64_t v6 = [(PLArchiveManager *)self getArchivingCriteria];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __26__PLArchiveManager_enable__block_invoke;
    v12[3] = &unk_1E62554A8;
    v12[4] = self;
    v7 = (void *)MEMORY[0x1C1869370](v12);
    double v8 = +[PLActivityScheduler sharedInstance];
    [(PLArchiveManager *)self mustRunInterval];
    double v9 = +[PLActivityCriterionTime timeCriterionWithInterval:](PLActivityCriterionTime, "timeCriterionWithInterval:");
    double v10 = +[PLArchiveManager workQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__PLArchiveManager_enable__block_invoke_2;
    v11[3] = &unk_1E62554D0;
    v11[4] = self;
    [v8 scheduleActivityWithIdentifier:@"com.apple.powerlogd.archiver" withCriteria:v6 withMustRunCriterion:v9 withQueue:v10 withInterruptBlock:v7 withActivityBlock:v11];
  }
}

uint64_t __26__PLArchiveManager_enable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInterrupted:1];
}

void __26__PLArchiveManager_enable__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setInterrupted:0];
  [*(id *)(a1 + 32) runActivityWithLastCompletedDate:v4];
}

- (void)disable
{
  BOOL v3 = +[PowerlogCore sharedCore];
  id v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if ((v5 & 1) == 0)
  {
    [(PLArchiveManager *)self setInterrupted:0];
    id v6 = +[PLActivityScheduler sharedInstance];
    [v6 cancelActivityWithIdentifier:@"com.apple.powerlogd.archiver"];
  }
}

- (void)runActivityWithLastCompletedDate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = PLLogArchiving();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::runActivity", buf, 2u);
  }

  id v6 = (void *)os_transaction_create();
  v7 = (void *)MEMORY[0x1C1869120]();
  [(PLArchiveManager *)self deprecateTables];
  [(PLArchiveManager *)self scheduleArchiveJobs];
  [(PLArchiveManager *)self runArchiveJobs];
  [(PLArchiveManager *)self trimCleanEnergyLog];
  [(PLArchiveManager *)self trimExtendedPersistenceLog];
  [(PLArchiveManager *)self trimXcodeOrganizerLog];
  [(PLArchiveManager *)self trimBackgroundProcessingLog];
  [(PLArchiveManager *)self cleanup];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  double v9 = +[PLUtilities transactionWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PLArchiveManager_runActivityWithLastCompletedDate___block_invoke;
  block[3] = &unk_1E62538C8;
  id v10 = v6;
  id v24 = v10;
  dispatch_after(v8, v9, block);

  if (v4)
  {
    if (![(PLArchiveManager *)self interrupted])
    {
      double v11 = PLLogArchiving();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::runArchiveJobs: notifying clients", buf, 2u);
      }

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      double v12 = [(PLArchiveManager *)self notificationBlocks];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
            if (v17) {
              (*(void (**)(void))(v17 + 16))();
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
        }
        while (v14);
      }
    }
    v18 = PLLogArchiving();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEFAULT, "Cleanly restarting powerlog to reduce memory fragmentation", buf, 2u);
    }

    +[PLUtilities exitWithReason:4];
  }
}

- (void)deprecateTables
{
  BOOL v3 = +[PowerlogCore sharedCore];
  id v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if ((v5 & 1) == 0)
  {
    [&unk_1F1585B80 enumerateObjectsUsingBlock:&__block_literal_global_388];
    [(PLArchiveManager *)self deprecateTablesEPSQL];
    [(PLArchiveManager *)self deprecateTablesCESQL];
    [(PLArchiveManager *)self deprecateTablesXCSQL];
    [(PLArchiveManager *)self deprecateTablesBGSQL];
  }
}

void __35__PLArchiveManager_deprecateTables__block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [NSString stringWithFormat:@"DROP TABLE '%@';", a2];
  uint64_t v2 = +[PowerlogCore sharedCore];
  BOOL v3 = [v2 storage];
  id v4 = [v3 connection];
  id v5 = (id)[v4 performQuery:v6];
}

- (void)deprecateTablesEPSQL
{
  uint64_t v2 = +[PowerlogCore sharedCore];
  BOOL v3 = [v2 storage];
  char v4 = [v3 storageLocked];

  if ((v4 & 1) == 0)
  {
    id v5 = +[PPSCoreStorage sharedSQLStorage];
    id v6 = [v5 EPSQLConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PLArchiveManager_deprecateTablesEPSQL__block_invoke;
    v8[3] = &unk_1E6255518;
    id v9 = v6;
    id v7 = v6;
    [&unk_1F1585B98 enumerateObjectsUsingBlock:v8];
  }
}

void __40__PLArchiveManager_deprecateTablesEPSQL__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [NSString stringWithFormat:@"DROP TABLE '%@';", a2];
  id v3 = (id)[*(id *)(a1 + 32) performQuery:v4];
}

- (void)deprecateTablesCESQL
{
  uint64_t v2 = +[PowerlogCore sharedCore];
  id v3 = [v2 storage];
  char v4 = [v3 storageLocked];

  if ((v4 & 1) == 0)
  {
    id v5 = +[PPSCoreStorage sharedSQLStorage];
    id v6 = [v5 CESQLConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PLArchiveManager_deprecateTablesCESQL__block_invoke;
    v8[3] = &unk_1E6255518;
    id v9 = v6;
    id v7 = v6;
    [&unk_1F1585BB0 enumerateObjectsUsingBlock:v8];
  }
}

void __40__PLArchiveManager_deprecateTablesCESQL__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [NSString stringWithFormat:@"DROP TABLE '%@';", a2];
  id v3 = (id)[*(id *)(a1 + 32) performQuery:v4];
}

- (void)deprecateTablesBGSQL
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::trimBGSQL: disabled", v2, v3, v4, v5, v6);
}

void __40__PLArchiveManager_deprecateTablesBGSQL__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [NSString stringWithFormat:@"DROP TABLE '%@';", a2];
  id v3 = (id)[*(id *)(a1 + 32) performQuery:v4];
}

- (BOOL)isInterrupted
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL interrupted = v2->_interrupted;
  objc_sync_exit(v2);

  return interrupted;
}

- (void)handleFailure:(int64_t)a3 forArchiveEntry:(id)a4
{
  id v5 = a4;
  uint8_t v6 = PLLogArchiving();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[PLArchiveManager handleFailure:forArchiveEntry:](a3, v5, v6);
  }

  id v7 = +[PowerlogCore sharedCore];
  dispatch_time_t v8 = [v7 storage];
  id v9 = [v8 connection];

  if (a3 == 1) {
    unsigned int v10 = 1004;
  }
  else {
    unsigned int v10 = 1001;
  }
  if (a3) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 1003;
  }
  +[PLUtilities exitWithReason:v11 connection:v9];
}

- (void)scheduleArchiveJobs
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(a1, a2), "name");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_0(&dword_1BBD2F000, v5, v6, "PLArchiveManager::scheduleArchiveJobs: scheduled archiveEntry=%@");
}

- (void)runArchiveJobs
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::runJobs: vacuuming", v2, v3, v4, v5, v6);
}

void __34__PLArchiveManager_runArchiveJobs__block_invoke()
{
  id v2 = +[PowerlogCore sharedCore];
  v0 = [v2 storage];
  uint64_t v1 = [v0 connection];
  [v1 vacuum];
}

- (void)trimCleanEnergyLog
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLLogArchiving();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: start", buf, 2u);
  }

  if ([(PLArchiveManager *)self isInterrupted])
  {
    uint64_t v4 = PLLogArchiving();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: interrupted", buf, 2u);
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLArchiveManager *)self CESQLDBDuration];
    uint8_t v6 = [v4 dateByAddingTimeInterval:-v5];
    id v7 = [MEMORY[0x1E4F1C9C8] nearestMidnightBeforeDate:v6];
    dispatch_time_t v8 = PLLogArchiving();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v22 = v7;
      _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: trimDate=%@", buf, 0xCu);
    }

    id v9 = +[PPSCoreStorage sharedSQLStorage];
    unsigned int v10 = +[PLArchiveJob storageQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__PLArchiveManager_trimCleanEnergyLog__block_invoke;
    v18[3] = &unk_1E62539B8;
    id v11 = v9;
    id v19 = v11;
    id v20 = v7;
    id v12 = v7;
    +[PLUtilities dispatchSyncIfNotCallerQueue:v10 withBlock:v18];

    uint64_t v13 = PLLogArchiving();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: vacuum", buf, 2u);
    }

    uint64_t v14 = +[PLArchiveManager storageQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__PLArchiveManager_trimCleanEnergyLog__block_invoke_438;
    v16[3] = &unk_1E62538C8;
    id v17 = v11;
    id v15 = v11;
    +[PLUtilities dispatchSyncIfNotCallerQueue:v14 withBlock:v16];
  }
}

void __38__PLArchiveManager_trimCleanEnergyLog__block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() trimConditionsForCESQLWithTrimDate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) CESQLConnection];
  [v2 trimAllTablesFromDate:*(void *)(a1 + 40) toDate:0 withTableFilters:v3];
}

void __38__PLArchiveManager_trimCleanEnergyLog__block_invoke_438(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) CESQLConnection];
  [v1 vacuum];
}

- (void)trimExtendedPersistenceLog
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = PLLogArchiving();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: start", buf, 2u);
  }

  if ([(PLArchiveManager *)self isInterrupted])
  {
    uint64_t v4 = PLLogArchiving();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: interrupted", buf, 2u);
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLArchiveManager *)self EPSQLDBDuration];
    uint8_t v6 = [v4 dateByAddingTimeInterval:-v5];
    id v7 = PLLogArchiving();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: trimDate=%@", buf, 0xCu);
    }

    dispatch_time_t v8 = +[PPSCoreStorage sharedSQLStorage];
    id v9 = +[PLArchiveJob storageQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke;
    v16[3] = &unk_1E62539B8;
    id v10 = v8;
    id v17 = v10;
    id v11 = v6;
    id v18 = v11;
    +[PLUtilities dispatchSyncIfNotCallerQueue:v9 withBlock:v16];

    if ([(PLArchiveManager *)self eliglibleToVacuumEPSQLForDate:v4]
      && ![(PLArchiveManager *)self isInterrupted])
    {
      id v12 = PLLogArchiving();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v12, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: vacuum", buf, 2u);
      }

      uint64_t v13 = +[PLArchiveManager storageQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke_439;
      v14[3] = &unk_1E62538C8;
      id v15 = v10;
      +[PLUtilities dispatchSyncIfNotCallerQueue:v13 withBlock:v14];

      [(PLArchiveManager *)self setLastEPSQLVacuumDate:v4];
    }
  }
}

void __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() trimConditionsForEPSQLWithTrimDate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) EPSQLConnection];
  [v2 trimAllTablesFromDate:*(void *)(a1 + 40) toDate:0 withTableFilters:v3];
}

void __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke_439(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) EPSQLConnection];
  [v1 vacuum];
}

- (void)trimBackgroundProcessingLog
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = _os_feature_enabled_impl();
  uint64_t v4 = PLLogArchiving();
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: start", buf, 2u);
    }

    if ([(PLArchiveManager *)self isInterrupted])
    {
      double v5 = PLLogArchiving();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: interrupted", buf, 2u);
      }
    }
    else
    {
      double v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [(PLArchiveManager *)self BGSQLDBDuration];
      id v7 = [v5 dateByAddingTimeInterval:-v6];
      dispatch_time_t v8 = PLLogArchiving();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v22 = v7;
        _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: trimDate=%@", buf, 0xCu);
      }

      id v9 = +[PPSCoreStorage sharedSQLStorage];
      id v10 = +[PLArchiveJob storageQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke;
      v18[3] = &unk_1E62539B8;
      id v11 = v9;
      id v19 = v11;
      id v20 = v7;
      id v12 = v7;
      +[PLUtilities dispatchSyncIfNotCallerQueue:v10 withBlock:v18];

      uint64_t v13 = PLLogArchiving();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: vacuum", buf, 2u);
      }

      uint64_t v14 = +[PLArchiveManager storageQueue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke_440;
      v16[3] = &unk_1E62538C8;
      id v17 = v11;
      id v15 = v11;
      +[PLUtilities dispatchSyncIfNotCallerQueue:v14 withBlock:v16];
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[PLArchiveManager deprecateTablesBGSQL]();
  }
}

void __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() trimConditionsForBGSQLWithTrimDate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) BGSQLConnection];
  [v2 trimAllTablesFromDate:*(void *)(a1 + 40) toDate:0 withTableFilters:v3];
}

void __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke_440(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) BGSQLConnection];
  [v1 vacuum];
}

- (BOOL)eliglibleToVacuumEPSQLForDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PLArchiveManager *)self lastEPSQLVacuumDate];
  if (!v5)
  {
    double v6 = PLLogArchiving();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLArchiveManager eliglibleToVacuumEPSQLForDate:]();
    }
    goto LABEL_7;
  }
  if ([(PLArchiveManager *)self monotonicResetOccurred])
  {
    double v6 = PLLogArchiving();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_INFO, "PLArchiveManager::trimEPSQL: Restarting after monotonic reset %@", (uint8_t *)&v13, 0xCu);
    }
LABEL_7:

    [(PLArchiveManager *)self setLastEPSQLVacuumDate:v4];
    goto LABEL_8;
  }
  [v4 timeIntervalSinceDate:v5];
  double v10 = v9;
  [(PLArchiveManager *)self EPSQLVacuumInterval];
  if (v10 >= v11)
  {
    BOOL v7 = 1;
    goto LABEL_9;
  }
  id v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLArchiveManager eliglibleToVacuumEPSQLForDate:]();
  }

LABEL_8:
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (void)cleanup
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = +[PowerlogCore sharedCore];
  id v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if ((v5 & 1) == 0)
  {
    double v6 = PLLogArchiving();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::cleanup: start", buf, 2u);
    }

    BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    dispatch_time_t v8 = +[PLUtilities containerPath];
    double v9 = [v8 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
    v39 = [v7 contentsOfDirectoryAtPath:v9 error:0];

    double v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = +[PLArchiveManager archiveEntriesFinished];
    uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v50;
      v37 = v10;
      v38 = self;
      uint64_t v36 = *(void *)v50;
      do
      {
        uint64_t v14 = 0;
        uint64_t v40 = v12;
        do
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * v14);
          uint64_t v16 = [v15 startDate];
          [v10 timeIntervalSinceDate:v16];
          double v18 = v17;
          [(PLArchiveManager *)self archiveRetention];
          double v20 = v19;

          if (v18 > v20)
          {
            uint64_t v44 = v14;
            uint64_t v21 = PLLogArchiving();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v15 uuid];
              *(_DWORD *)buf = 138412290;
              v55 = v22;
              _os_log_impl(&dword_1BBD2F000, v21, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::cleanup: removing archiveEntry=%@", buf, 0xCu);
            }
            uint64_t v23 = (void *)MEMORY[0x1E4F28F60];
            v43 = v15;
            id v24 = [v15 uuid];
            uint64_t v25 = [v23 predicateWithFormat:@"SELF CONTAINS %@", v24];

            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            v42 = (void *)v25;
            v26 = [v39 filteredArrayUsingPredicate:v25];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v46 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v45 + 1) + 8 * i);
                  v32 = +[PLUtilities containerPath];
                  v33 = [v32 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
                  v34 = [v33 stringByAppendingPathComponent:v31];
                  [v7 removeItemAtPath:v34 error:0];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
              }
              while (v28);
            }

            double v10 = v37;
            [v43 setRemovedDate:v37];

            self = v38;
            uint64_t v13 = v36;
            uint64_t v12 = v40;
            uint64_t v14 = v44;
          }
          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v12);
    }

    v35 = PLLogArchiving();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v35, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::cleanup: done", buf, 2u);
    }
  }
}

- (void)recover
{
  id v3 = +[PowerlogCore sharedCore];
  id v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if ((v5 & 1) == 0)
  {
    double v6 = +[PLArchiveManager workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__PLArchiveManager_recover__block_invoke;
    block[3] = &unk_1E62538C8;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

void __27__PLArchiveManager_recover__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = PLLogArchiving();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __27__PLArchiveManager_recover__block_invoke_cold_3();
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = +[PLArchiveManager archiveEntriesUnfinished];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        dispatch_time_t v8 = PLLogArchiving();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __27__PLArchiveManager_recover__block_invoke_cold_2((uint64_t)v17, v7);
        }

        double v9 = [*(id *)(a1 + 32) archiveJobs];
        objc_sync_enter(v9);
        double v10 = [*(id *)(a1 + 32) archiveJobs];
        uint64_t v11 = [[PLArchiveJob alloc] initWithManager:*(void *)(a1 + 32) andArchiveEntry:v7];
        [v10 addObject:v11];

        objc_sync_exit(v9);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v12 = PLLogArchiving();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __27__PLArchiveManager_recover__block_invoke_cold_1();
  }
}

- (void)migrateArchive:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[PLUtilities extractDateStringAndUUIDStringFromFilePath:v3];
  uint64_t v5 = v4;
  if (!v4 || [v4 count] != 2)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid archivePath=%@", v3];
    double v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m"];
    uint64_t v21 = [v20 lastPathComponent];
    long long v22 = [NSString stringWithUTF8String:"-[PLArchiveManager migrateArchive:]"];
    +[PLCoreStorage logMessage:v11 fromFile:v21 fromFunction:v22 fromLineNumber:881];

    PLLogCommon();
    uint64_t v19 = (PLArchiveEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
    goto LABEL_34;
  }
  uint64_t v6 = NSString;
  uint64_t v7 = +[PLUtilities containerPath];
  dispatch_time_t v8 = [v7 stringByAppendingString:@"Library/BatteryLife/Archives/powerlog_metadata_%@_%@.txt"];
  double v9 = [v5 firstObject];
  double v10 = [v5 lastObject];
  uint64_t v11 = objc_msgSend(v6, "stringWithFormat:", v8, v9, v10);

  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v8) = [v12 fileExistsAtPath:v11];

  if (v8)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__PLArchiveManager_migrateArchive___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v13;
      if (migrateArchive__defaultOnce != -1) {
        dispatch_once(&migrateArchive__defaultOnce, block);
      }
      if (migrateArchive__classDebugEnabled)
      {
        long long v14 = [NSString stringWithFormat:@"PLArchiveManager::migrateArchive: archive with metadata:%@", v3];
        long long v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m"];
        long long v16 = [v15 lastPathComponent];
        double v17 = [NSString stringWithUTF8String:"-[PLArchiveManager migrateArchive:]"];
        +[PLCoreStorage logMessage:v14 fromFile:v16 fromFunction:v17 fromLineNumber:890];

        double v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    uint64_t v19 = [[PLArchiveEntry alloc] initWithMetadata:v11];
    goto LABEL_33;
  }
  uint64_t v23 = [PLValueComparison alloc];
  id v24 = [v5 lastObject];
  uint64_t v25 = [(PLValueComparison *)v23 initWithKey:@"UUID" withValue:v24 withComparisonOperation:0];

  v56[0] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
  uint64_t v27 = +[PLArchiveManager archiveEntriesWithComparisons:v26];

  if (v27 && [v27 count])
  {

    uint64_t v19 = 0;
    goto LABEL_34;
  }
  v53 = v25;
  long long v52 = v27;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v28 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __35__PLArchiveManager_migrateArchive___block_invoke_462;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v28;
    if (migrateArchive__defaultOnce_460 != -1) {
      dispatch_once(&migrateArchive__defaultOnce_460, v54);
    }
    if (migrateArchive__classDebugEnabled_461)
    {
      uint64_t v29 = [NSString stringWithFormat:@"PLArchiveManager::migrateArchive: archive without metadata:%@", v3];
      v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m"];
      uint64_t v31 = [v30 lastPathComponent];
      v32 = [NSString stringWithUTF8String:"-[PLArchiveManager migrateArchive:]"];
      +[PLCoreStorage logMessage:v29 fromFile:v31 fromFunction:v32 fromLineNumber:904];

      v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v34 = [v5 firstObject];
  unint64_t v35 = [v34 length];
  unint64_t v36 = [@"yyyy-MM-dd" length];

  if (v35 >= v36)
  {
    long long v46 = [MEMORY[0x1E4F1C9C8] defaultDateFormatter];
    long long v47 = [v5 firstObject];
    long long v48 = [v47 substringToIndex:objc_msgSend(@"yyyy-MM-dd", "length")];
    v38 = [v46 dateFromString:v48];

    uint64_t v49 = [v38 dateByAddingTimeInterval:86400.0];
    v37 = (void *)v49;
    if (v38 && v49)
    {
      long long v50 = [PLArchiveEntry alloc];
      v39 = [v38 convertFromSystemToMonotonic];
      v43 = [v37 convertFromSystemToMonotonic];
      long long v51 = [v5 lastObject];
      uint64_t v19 = [(PLArchiveEntry *)v50 initWithStartDate:v39 endDate:v43 andUUID:v51];

      long long v45 = v52;
      int v44 = 1;
      goto LABEL_32;
    }
  }
  else
  {
    v37 = 0;
    v38 = 0;
  }
  v39 = [NSString stringWithFormat:@"Invalid startDate=%@, endDate=%@", v38, v37];
  uint64_t v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m"];
  v41 = [v40 lastPathComponent];
  v42 = [NSString stringWithUTF8String:"-[PLArchiveManager migrateArchive:]"];
  +[PLCoreStorage logMessage:v39 fromFile:v41 fromFunction:v42 fromLineNumber:913];

  v43 = PLLogCommon();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
  }
  uint64_t v19 = 0;
  int v44 = 0;
  long long v45 = v52;
LABEL_32:

  if (v44) {
LABEL_33:
  }
    [(PLArchiveEntry *)v19 setStage:5];
LABEL_34:
}

BOOL __35__PLArchiveManager_migrateArchive___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  migrateArchive__classDebugEnabled = result;
  return result;
}

BOOL __35__PLArchiveManager_migrateArchive___block_invoke_462(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  migrateArchive__classDebugEnabled_461 = result;
  return result;
}

- (void)migrate
{
  id v3 = +[PowerlogCore sharedCore];
  uint64_t v4 = [v3 storage];
  char v5 = [v4 storageLocked];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = +[PLArchiveManager workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__PLArchiveManager_migrate__block_invoke;
    block[3] = &unk_1E62538C8;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

void __27__PLArchiveManager_migrate__block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v1 = PLLogArchiving();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __27__PLArchiveManager_migrate__block_invoke_cold_2();
  }

  unint64_t v36 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = +[PLUtilities containerPath];
  uint64_t v4 = [v3 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
  char v5 = [v2 contentsOfDirectoryAtPath:v4 error:0];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v11 = +[PLUtilities containerPath];
        uint64_t v12 = [v11 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
        uint64_t v13 = [v12 stringByAppendingString:v10];

        if (([v10 hasSuffix:@".PLSQL"] & 1) != 0
          || ([@".PLSQL" stringByAppendingString:@".gz"],
              long long v14 = objc_claimAutoreleasedReturnValue(),
              int v15 = [v10 hasSuffix:v14],
              v14,
              v15))
        {
          [*(id *)(a1 + 32) migrateArchive:v13];
        }
        else
        {
          [v36 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v7);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v36;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
  unint64_t v18 = 0x1E4F28000;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v40;
    unint64_t v21 = 0x1E6253000uLL;
    do
    {
      uint64_t v22 = 0;
      uint64_t v35 = v19;
      do
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * v22);
        if ([*(id *)(v21 + 936) debugEnabled])
        {
          uint64_t v24 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __27__PLArchiveManager_migrate__block_invoke_478;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v24;
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_4 != -1) {
            dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_4, block);
          }
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_4)
          {
            uint64_t v25 = v20;
            unint64_t v26 = v21;
            id v27 = v16;
            uint64_t v28 = [NSString stringWithFormat:@"PLArchiveManager::migrate: removing filepath:%@", v23];
            uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m"];
            v30 = [v29 lastPathComponent];
            uint64_t v31 = [NSString stringWithUTF8String:"-[PLArchiveManager migrate]_block_invoke_2"];
            +[PLCoreStorage logMessage:v28 fromFile:v30 fromFunction:v31 fromLineNumber:946];

            v32 = PLLogCommon();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v48 = v28;
              _os_log_debug_impl(&dword_1BBD2F000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v18 = 0x1E4F28000uLL;
            id v16 = v27;
            unint64_t v21 = v26;
            uint64_t v20 = v25;
            uint64_t v19 = v35;
          }
        }
        v33 = [*(id *)(v18 + 3256) defaultManager];
        [v33 removeItemAtPath:v23 error:0];

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v19);
  }

  v34 = PLLogArchiving();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    __27__PLArchiveManager_migrate__block_invoke_cold_1();
  }
}

BOOL __27__PLArchiveManager_migrate__block_invoke_478(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_4 = result;
  return result;
}

+ (void)systemTimeChangedByOffset:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[PowerlogCore sharedCore];
  char v5 = [v4 storage];
  char v6 = [v5 storageLocked];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = PLLogArchiving();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[PLArchiveManager systemTimeChangedByOffset:]();
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = +[PLArchiveManager archiveEntriesFinished];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v13 systemTimeOffset];
          [v13 setSystemTimeOffset:v14 + a3];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    int v15 = PLLogArchiving();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[PLArchiveManager systemTimeChangedByOffset:]();
    }
  }
}

+ (id)lastArchivePath
{
  id v2 = [a1 archiveEntriesFinished];
  id v3 = v2;
  if (v2 && [v2 count])
  {
    uint64_t v4 = [v3 lastObject];
    char v5 = [v4 compressedPath];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)allArchivePaths
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(a1, "archiveEntriesFinished", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) compressedPath];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)archiveEntriesUnfinished
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = [[PLValueComparison alloc] initWithKey:@"Stage" withValue:&unk_1F1580CD8 withComparisonOperation:4];
  id v3 = [[PLValueComparison alloc] initWithKey:@"RemovedDate" withValue:&unk_1F1580CF0 withComparisonOperation:0];
  v7[0] = v2;
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = +[PLArchiveManager archiveEntriesWithComparisons:v4];

  return v5;
}

+ (id)archiveEntriesFinished
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = [[PLValueComparison alloc] initWithKey:@"Stage" withValue:&unk_1F1580CD8 withComparisonOperation:0];
  id v3 = [[PLValueComparison alloc] initWithKey:@"RemovedDate" withValue:&unk_1F1580CF0 withComparisonOperation:0];
  v7[0] = v2;
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = +[PLArchiveManager archiveEntriesWithComparisons:v4];

  return v5;
}

+ (id)archiveForDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = +[PLArchiveManager archiveEntriesFinished];
  id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v10 = [v8 startDate];
        long long v11 = [v8 endDate];
        long long v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

        if ([v12 containsDate:v3])
        {
          id v5 = v8;

          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)archiveEntriesWithComparisons:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PowerlogCore sharedCore];
  id v5 = [v4 storage];
  uint64_t v6 = +[PLArchiveEntry entryKey];
  uint64_t v7 = [v5 entriesForKey:v6 withComparisons:v3];

  return v7;
}

- (void)registerForArchivingNotificationUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = PLLogArchiving();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLArchiveManager registerForArchivingNotificationUsingBlock:]();
    }

    uint64_t v6 = +[PLArchiveManager workQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PLArchiveManager_registerForArchivingNotificationUsingBlock___block_invoke;
    void v7[3] = &unk_1E6253C90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async_and_wait(v6, v7);
  }
}

void __63__PLArchiveManager_registerForArchivingNotificationUsingBlock___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) notificationBlocks];
  id v2 = (void *)MEMORY[0x1C1869370](*(void *)(a1 + 40));
  [v3 addObject:v2];
}

- (NSDate)lastEPSQLVacuumDate
{
  +[PLDefaults doubleForKey:@"LastEPSQLVacuumDate"];
  if (v2 == 0.0)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
  return (NSDate *)v3;
}

- (void)setLastEPSQLVacuumDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSince1970];
    id v4 = objc_msgSend(NSNumber, "numberWithDouble:");
    +[PLDefaults setObject:v4 forKey:@"LastEPSQLVacuumDate" saveToDisk:1];
  }
  else
  {
    +[PLDefaults setObject:0 forKey:@"LastEPSQLVacuumDate" saveToDisk:1];
  }
  self->_monotonicResetOccurred = 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)mustRunInterval
{
  return self->_mustRunInterval;
}

- (void)setMustRunInterval:(double)a3
{
  self->_mustRunInterval = a3;
}

- (double)archiveRetention
{
  return self->_archiveRetention;
}

- (void)setArchiveRetention:(double)a3
{
  self->_archiveRetention = a3;
}

- (double)PLSQLDBDuration
{
  return self->_PLSQLDBDuration;
}

- (void)setPLSQLDBDuration:(double)a3
{
  self->_PLSQLDBDuration = a3;
}

- (double)CESQLDBDuration
{
  return self->_CESQLDBDuration;
}

- (void)setCESQLDBDuration:(double)a3
{
  self->_CESQLDBDuration = a3;
}

- (double)EPSQLDBDuration
{
  return self->_EPSQLDBDuration;
}

- (void)setEPSQLDBDuration:(double)a3
{
  self->_EPSQLDBDuration = a3;
}

- (double)EPSQLVacuumInterval
{
  return self->_EPSQLVacuumInterval;
}

- (void)setEPSQLVacuumInterval:(double)a3
{
  self->_EPSQLVacuumInterval = a3;
}

- (double)XCSQLDBDuration
{
  return self->_XCSQLDBDuration;
}

- (void)setXCSQLDBDuration:(double)a3
{
  self->_XCSQLDBDuration = a3;
}

- (double)BGSQLDBDuration
{
  return self->_BGSQLDBDuration;
}

- (void)setBGSQLDBDuration:(double)a3
{
  self->_BGSQLDBDuration = a3;
}

- (NSMutableArray)archiveJobs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setArchiveJobs:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (NSMutableArray)notificationBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNotificationBlocks:(id)a3
{
}

- (BOOL)monotonicResetOccurred
{
  return self->_monotonicResetOccurred;
}

- (void)setMonotonicResetOccurred:(BOOL)a3
{
  self->_monotonicResetOccurred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationBlocks, 0);
  objc_storeStrong((id *)&self->_archiveJobs, 0);
}

- (void)handleFailure:(NSObject *)a3 forArchiveEntry:.cold.1(int a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 name];
  v6[0] = 67109378;
  v6[1] = a1;
  __int16 v7 = 2112;
  id v8 = v5;
  _os_log_error_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_ERROR, "PLArchiveManager::handleFailure:forArchive: failureType=%i, archiveEntry=%@", (uint8_t *)v6, 0x12u);
}

- (void)eliglibleToVacuumEPSQLForDate:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::trimEPSQL: No preset last vacuum date", v2, v3, v4, v5, v6);
}

- (void)eliglibleToVacuumEPSQLForDate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::trimEPSQL: Insufficient time for vacuum since %@", v2, v3, v4, v5, v6);
}

void __27__PLArchiveManager_recover__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::recover: done", v2, v3, v4, v5, v6);
}

void __27__PLArchiveManager_recover__block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(a1, a2), "name");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_5_0(&dword_1BBD2F000, v5, v6, "PLArchiveManager::recover unfinishedArchiveEntry=%@");
}

void __27__PLArchiveManager_recover__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::recover: start", v2, v3, v4, v5, v6);
}

void __27__PLArchiveManager_migrate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::migrate: done", v2, v3, v4, v5, v6);
}

void __27__PLArchiveManager_migrate__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::migrate: start", v2, v3, v4, v5, v6);
}

+ (void)systemTimeChangedByOffset:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::systemTimeChangedByOffset: done", v2, v3, v4, v5, v6);
}

+ (void)systemTimeChangedByOffset:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "PLArchiveManager::systemTimeChangedByOffset: start", v2, v3, v4, v5, v6);
}

- (void)registerForArchivingNotificationUsingBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "registered", v2, v3, v4, v5, v6);
}

@end