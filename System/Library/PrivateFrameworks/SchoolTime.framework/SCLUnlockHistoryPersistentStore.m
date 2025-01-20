@interface SCLUnlockHistoryPersistentStore
- (BOOL)deleteHistory:(id *)a3;
- (BOOL)insertItem:(id)a3;
- (BOOL)purgeOldItems;
- (NSManagedObjectContext)storeContext;
- (NSPersistentContainer)persistentContainer;
- (NSURL)URL;
- (SCLUnlockHistoryPersistentStore)initWithURL:(id)a3;
- (id)recentHistoryItems;
- (id)recentItemsThresholdDate;
- (void)dealloc;
- (void)loadStore;
- (void)setStoreContext:(id)a3;
@end

@implementation SCLUnlockHistoryPersistentStore

- (SCLUnlockHistoryPersistentStore)initWithURL:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLUnlockHistoryPersistentStore;
  v6 = [(SCLUnlockHistoryPersistentStore *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 URLForResource:@"SchoolTime" withExtension:@"momd"];

    v10 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v9];
    uint64_t v11 = [objc_alloc(MEMORY[0x263EFF2E8]) initWithName:@"SchoolTime" managedObjectModel:v10];
    persistentContainer = v7->_persistentContainer;
    v7->_persistentContainer = (NSPersistentContainer *)v11;

    v13 = (void *)[objc_alloc(MEMORY[0x263EFF328]) initWithURL:v5];
    [v13 setType:*MEMORY[0x263EFF168]];
    v14 = v7->_persistentContainer;
    v18[0] = v13;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    [(NSPersistentContainer *)v14 setPersistentStoreDescriptions:v15];
  }
  return v7;
}

- (void)loadStore
{
  persistentContainer = self->_persistentContainer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke;
  v3[3] = &unk_2648ACB10;
  v3[4] = self;
  [(NSPersistentContainer *)persistentContainer loadPersistentStoresWithCompletionHandler:v3];
}

void __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = scl_persistence_log();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_22B7B4000, v8, OS_LOG_TYPE_DEFAULT, "Loaded description %@", (uint8_t *)&v10, 0xCu);
    }

    v9 = [*(id *)(a1 + 32) persistentContainer];
    v8 = [v9 newBackgroundContext];

    [v8 setName:@"SCLUnlockHistoryPersistentStore context"];
    [*(id *)(a1 + 32) setStoreContext:v8];
  }
}

- (void)dealloc
{
  [(NSManagedObjectContext *)self->_storeContext refreshAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)SCLUnlockHistoryPersistentStore;
  [(SCLUnlockHistoryPersistentStore *)&v3 dealloc];
}

- (BOOL)insertItem:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v5 = [(SCLUnlockHistoryPersistentStore *)self storeContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke;
  v10[3] = &unk_2648ACB38;
  id v6 = v5;
  id v11 = v6;
  id v7 = v4;
  id v12 = v7;
  v13 = &v14;
  [v6 performBlockAndWait:v10];
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke(uint64_t a1)
{
  v2 = [[SCLUnlockEvent alloc] initWithContext:*(void *)(a1 + 32)];
  objc_super v3 = (uint64_t *)(a1 + 40);
  id v4 = [*(id *)(a1 + 40) calendar];
  id v5 = [v4 calendarIdentifier];
  [(SCLUnlockEvent *)v2 setCalendarIdentifier:v5];

  id v6 = [*(id *)(a1 + 40) timeZone];
  id v7 = [v6 name];
  [(SCLUnlockEvent *)v2 setTimeZoneName:v7];

  char v8 = [MEMORY[0x263F08C38] UUID];
  [(SCLUnlockEvent *)v2 setIdentifier:v8];

  v9 = [*(id *)(a1 + 40) unlockedInterval];
  int v10 = [v9 startDate];
  [(SCLUnlockEvent *)v2 setStartDate:v10];

  id v11 = [*(id *)(a1 + 40) unlockedInterval];
  [v11 duration];
  [(SCLUnlockEvent *)v2 setDuration:(int)v12];

  v13 = [*(id *)(a1 + 40) scheduleStartTime];
  -[SCLUnlockEvent setScheduleStartHour:](v2, "setScheduleStartHour:", (__int16)[v13 hour]);

  uint64_t v14 = [*(id *)(a1 + 40) scheduleStartTime];
  -[SCLUnlockEvent setScheduleStartMinute:](v2, "setScheduleStartMinute:", (__int16)[v14 minute]);

  v15 = [*(id *)(a1 + 40) scheduleEndTime];
  -[SCLUnlockEvent setScheduleEndHour:](v2, "setScheduleEndHour:", (__int16)[v15 hour]);

  uint64_t v16 = [*(id *)(a1 + 40) scheduleEndTime];
  -[SCLUnlockEvent setScheduleEndMinute:](v2, "setScheduleEndMinute:", (__int16)[v16 minute]);

  char v17 = *(void **)(a1 + 32);
  id v20 = 0;
  LOBYTE(v16) = [v17 save:&v20];
  id v18 = v20;
  *(unsigned char *)(*(void *)(v3[1] + 8) + 24) = (_BYTE)v16;
  if (!*(unsigned char *)(*(void *)(v3[1] + 8) + 24))
  {
    v19 = scl_persistence_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke_cold_1(v3, (uint64_t)v18, v19);
    }
  }
}

- (BOOL)deleteHistory:(id *)a3
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v4 = [(SCLUnlockHistoryPersistentStore *)self storeContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SCLUnlockHistoryPersistentStore_deleteHistory___block_invoke;
  v7[3] = &unk_2648ACB60;
  id v5 = v4;
  v9 = &v11;
  int v10 = a3;
  id v8 = v5;
  [v5 performBlockAndWait:v7];
  LOBYTE(a3) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __49__SCLUnlockHistoryPersistentStore_deleteHistory___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF1D0]);
  objc_super v3 = +[SCLUnlockEvent fetchRequest];
  id v6 = (id)[v2 initWithFetchRequest:v3];

  id v4 = (id)[*(id *)(a1 + 32) executeRequest:v6 error:*(void *)(a1 + 48)];
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *v5 == 0;
  }
}

- (id)recentHistoryItems
{
  v23[1] = *MEMORY[0x263EF8340];
  objc_super v3 = +[SCLUnlockEvent fetchRequest];
  id v4 = [(SCLUnlockHistoryPersistentStore *)self persistentContainer];
  id v5 = [v4 persistentStoreCoordinator];
  id v6 = [v5 persistentStores];
  [v3 setAffectedStores:v6];

  id v7 = [(SCLUnlockHistoryPersistentStore *)self recentItemsThresholdDate];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"startDate >= %@", v7];
  [v3 setPredicate:v8];
  v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
  v23[0] = v9;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v3 setSortDescriptors:v10];

  uint64_t v11 = [(SCLUnlockHistoryPersistentStore *)self storeContext];
  double v12 = [MEMORY[0x263EFF980] array];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke;
  v19[3] = &unk_2648ACB88;
  id v20 = v11;
  id v21 = v3;
  id v13 = v12;
  id v22 = v13;
  id v14 = v3;
  id v15 = v11;
  [v15 performBlockAndWait:v19];
  uint64_t v16 = v22;
  id v17 = v13;

  return v17;
}

void __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v30 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v30];
  id v5 = v30;
  if (v5)
  {
    obj = scl_persistence_log();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke_cold_1();
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v22 = 0;
      v23 = v4;
      uint64_t v25 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v25) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v10 = (void *)MEMORY[0x263EFF8F0];
          uint64_t v11 = objc_msgSend(v9, "calendarIdentifier", v22, v23);
          double v12 = [v10 calendarWithIdentifier:v11];

          id v13 = (void *)MEMORY[0x263EFFA18];
          id v14 = [v9 timeZoneName];
          id v15 = [v13 timeZoneWithName:v14];

          id v16 = objc_alloc(MEMORY[0x263F08798]);
          id v17 = [v9 startDate];
          id v18 = objc_msgSend(v16, "initWithStartDate:duration:", v17, (double)(int)objc_msgSend(v9, "duration"));

          v19 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", (int)[v9 scheduleStartHour], (int)objc_msgSend(v9, "scheduleStartMinute"));
          id v20 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", (int)[v9 scheduleEndHour], (int)objc_msgSend(v9, "scheduleEndMinute"));
          id v21 = [[SCLUnlockHistoryItem alloc] initWithInterval:v18 calendar:v12 timeZone:v15 startTime:v19 endTime:v20];
          [*(id *)(a1 + 48) addObject:v21];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
      id v5 = v22;
      id v4 = v23;
    }
  }
}

- (BOOL)purgeOldItems
{
  uint64_t v3 = +[SCLUnlockEvent fetchRequest];
  id v4 = [(SCLUnlockHistoryPersistentStore *)self persistentContainer];
  id v5 = [v4 persistentStoreCoordinator];
  uint64_t v6 = [v5 persistentStores];
  [v3 setAffectedStores:v6];

  uint64_t v7 = [(SCLUnlockHistoryPersistentStore *)self recentItemsThresholdDate];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"startDate < %@", v7];
  [v3 setPredicate:v8];
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v3];
  [v9 setResultType:2];
  int v10 = [(SCLUnlockHistoryPersistentStore *)self storeContext];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke;
  v15[3] = &unk_2648ACB38;
  id v11 = v10;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v18 = &v19;
  [v11 performBlockAndWait:v15];
  char v13 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v8 = 0;
  id v4 = [v2 executeRequest:v3 error:&v8];
  id v5 = v8;
  if (v5)
  {
    uint64_t v6 = scl_persistence_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v6 = [v4 result];
    uint64_t v7 = scl_persistence_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (id)recentItemsThresholdDate
{
  id v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v2 dateByAddingUnit:16 value:-7 toDate:v3 options:0];
  id v5 = [v2 startOfDayForDate:v4];

  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSManagedObjectContext)storeContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStoreContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

void __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Couldn't load description %@", v2, v3, v4, v5, v6);
}

void __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Failed to save item %@: %@", (uint8_t *)&v4, 0x16u);
}

void __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Could not retrieve recent history items: %@", v2, v3, v4, v5, v6);
}

void __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_22B7B4000, v0, OS_LOG_TYPE_DEBUG, "Deleted %@ items", v1, 0xCu);
}

void __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to purge old items: %@", v2, v3, v4, v5, v6);
}

@end