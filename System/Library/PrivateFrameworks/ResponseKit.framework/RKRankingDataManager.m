@interface RKRankingDataManager
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStore)persistentStore;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (RKRankingDataManager)initWithDatabaseFilename:(id)a3;
- (RKRankingDataManager)initWithLanguageID:(id)a3;
- (id)fetchRankingInfoForCategory:(id)a3;
- (id)fetchRankingInfoFromDB;
- (unint64_t)getNumberOfEntriesInDB;
- (void)fetchRankingInfoFromDB;
- (void)flushRankingData;
- (void)insertRankingInfoFromDictionary:(id)a3;
- (void)insertRankingInfoFromDictionary:(id)a3 withDate:(id)a4;
- (void)pruneUserDatabase;
- (void)resetRankingData;
- (void)setManagedObjectContext:(id)a3;
- (void)setPersistentStore:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
@end

@implementation RKRankingDataManager

- (RKRankingDataManager)initWithLanguageID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RKRankingDataManager;
  v5 = [(RKRankingDataManager *)&v10 init];
  if (v5)
  {
    v6 = [NSURL fileURLWithPath:@"/var/mobile/Library/ResponseKit/"];
    v7 = [v4 stringByAppendingString:@"-learned.db"];
    v8 = [v6 URLByAppendingPathComponent:v7];
    v5 = [(RKRankingDataManager *)v5 initWithDatabaseFilename:v8];
  }
  return v5;
}

- (RKRankingDataManager)initWithDatabaseFilename:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RKRankingDataManager;
  v5 = [(RKRankingDataManager *)&v22 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:2];
  managedObjectContext = v5->_managedObjectContext;
  v5->_managedObjectContext = (NSManagedObjectContext *)v6;

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 URLForResource:@"RankingModel" withExtension:@"momd"];

  if (!v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RKRankingDataManager initWithDatabaseFilename:]();
    }
    goto LABEL_14;
  }
  objc_super v10 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v9];
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[RKRankingDataManager initWithDatabaseFilename:]((uint64_t)v9);
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v10];
  persistentStoreCoordinator = v5->_persistentStoreCoordinator;
  v5->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v11;

  [(NSManagedObjectContext *)v5->_managedObjectContext setPersistentStoreCoordinator:v5->_persistentStoreCoordinator];
  v13 = v5->_persistentStoreCoordinator;
  uint64_t v14 = *MEMORY[0x263EFF168];
  uint64_t v23 = *MEMORY[0x263EFF138];
  v24[0] = MEMORY[0x263EFFA80];
  v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  id v21 = 0;
  uint64_t v16 = [(NSPersistentStoreCoordinator *)v13 addPersistentStoreWithType:v14 configuration:0 URL:v4 options:v15 error:&v21];
  id v17 = v21;
  persistentStore = v5->_persistentStore;
  v5->_persistentStore = (NSPersistentStore *)v16;

  if (!v5->_persistentStore)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RKRankingDataManager initWithDatabaseFilename:](v17);
    }

LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }

LABEL_8:
  v19 = v5;
LABEL_15:

  return v19;
}

- (void)insertRankingInfoFromDictionary:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  [(RKRankingDataManager *)self insertRankingInfoFromDictionary:v5 withDate:v6];
}

- (void)insertRankingInfoFromDictionary:(id)a3 withDate:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF240];
  id v7 = a4;
  id v8 = a3;
  v9 = [(RKRankingDataManager *)self managedObjectContext];
  id v17 = [v6 insertNewObjectForEntityForName:@"RankingInfo" inManagedObjectContext:v9];

  objc_super v10 = [v8 objectForKeyedSubscript:@"message"];
  [v17 setMessage:v10];

  uint64_t v11 = [v8 objectForKeyedSubscript:@"response"];
  [v17 setResponse:v11];

  v12 = [v8 objectForKeyedSubscript:@"source"];
  objc_msgSend(v17, "setSource:", objc_msgSend(v12, "integerValue"));

  v13 = [v8 objectForKeyedSubscript:@"recipient"];
  [v17 setRecipientId:v13];

  uint64_t v14 = [v8 objectForKeyedSubscript:@"inputmethod"];
  objc_msgSend(v17, "setInputMethod:", objc_msgSend(v14, "integerValue"));

  v15 = [v8 objectForKeyedSubscript:@"rankedlist"];
  [v17 setRankedList:v15];

  uint64_t v16 = [v8 objectForKeyedSubscript:@"category"];

  [v17 setCategory:v16];
  [v17 setTimestamp:v7];

  [(RKRankingDataManager *)self flushRankingData];
}

- (id)fetchRankingInfoFromDB
{
  v3 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RankingInfo"];
  id v4 = [(RKRankingDataManager *)self managedObjectContext];
  id v9 = 0;
  id v5 = [v4 executeFetchRequest:v3 error:&v9];
  id v6 = v9;

  if (v5)
  {
    id v7 = v5;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RKRankingDataManager fetchRankingInfoFromDB](v6);
  }

  return v5;
}

- (id)fetchRankingInfoForCategory:(id)a3
{
  v11[4] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"Unknown"])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[RKRankingDataManager fetchRankingInfoForCategory:]();
    }
    id v5 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RankingInfo"];
    id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"category == %@", v4];
    [v6 setPredicate:v7];

    id v8 = [(RKRankingDataManager *)self managedObjectContext];
    v11[0] = 0;
    id v5 = [v8 executeFetchRequest:v6 error:v11];
    id v9 = v11[0];

    if (!v5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[RKRankingDataManager fetchRankingInfoForCategory:](v9);
      }
      id v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)getNumberOfEntriesInDB
{
  v3 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RankingInfo"];
  id v4 = [(RKRankingDataManager *)self managedObjectContext];
  id v8 = 0;
  unint64_t v5 = [v4 countForFetchRequest:v3 error:&v8];
  id v6 = v8;

  if (v5 == 0x7FFFFFFFFFFFFFFFLL && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[RKRankingDataManager fetchRankingInfoFromDB](v6);
  }

  return v5;
}

- (void)pruneUserDatabase
{
  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 dateByAddingTimeInterval:-7776000.0];

  unint64_t v5 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RankingInfo"];
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"timestamp < %@", v4];
  [v5 setPredicate:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v5];
  id v8 = [(RKRankingDataManager *)self managedObjectContext];
  id v9 = [v8 persistentStoreCoordinator];
  objc_super v10 = [(RKRankingDataManager *)self managedObjectContext];
  id v13 = 0;
  id v11 = (id)[v9 executeRequest:v7 withContext:v10 error:&v13];
  id v12 = v13;

  if (v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[RKRankingDataManager fetchRankingInfoFromDB](v12);
  }
}

- (void)resetRankingData
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"RankingInfo"];
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v3];
  unint64_t v5 = [(RKRankingDataManager *)self managedObjectContext];
  id v6 = [v5 persistentStoreCoordinator];
  id v7 = [(RKRankingDataManager *)self managedObjectContext];
  id v10 = 0;
  id v8 = (id)[v6 executeRequest:v4 withContext:v7 error:&v10];
  id v9 = v10;

  if (v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[RKRankingDataManager fetchRankingInfoFromDB](v9);
  }
}

- (void)flushRankingData
{
  v2 = [(RKRankingDataManager *)self managedObjectContext];
  uint64_t v3 = 0;
  [v2 save:&v3];
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (NSPersistentStore)persistentStore
{
  return self->_persistentStore;
}

- (void)setPersistentStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);

  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (void)initWithDatabaseFilename:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 138412290;
  uint64_t v1 = 0;
  _os_log_error_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to locate momd bundle in application : %@", (uint8_t *)&v0, 0xCu);
}

- (void)initWithDatabaseFilename:(void *)a1 .cold.2(void *a1)
{
  [a1 localizedDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_2() userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217E21000, &_os_log_internal, v3, "Failed to initalize persistent store: %@\n%@", v4, v5, v6, v7, v8);
}

- (void)initWithDatabaseFilename:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to initialize mom from URL: %@", (uint8_t *)&v1, 0xCu);
}

- (void)fetchRankingInfoFromDB
{
  [a1 localizedDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_2() userInfo];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217E21000, &_os_log_internal, v3, "Error fetching RankingInfo objects: %@\n%@", v4, v5, v6, v7, v8);
}

- (void)fetchRankingInfoForCategory:.cold.1()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Category is marked as Unknown, cannot fetch messages", v0, 2u);
}

- (void)fetchRankingInfoForCategory:(void *)a1 .cold.2(void *a1)
{
  uint64_t v2 = [a1 localizedDescription];
  uint8_t v8 = [a1 userInfo];
  OUTLINED_FUNCTION_1(&dword_217E21000, &_os_log_internal, v3, "Error fetching RankingInfo objects: %@\n%@", v4, v5, v6, v7, 2u);
}

- (void)fetchRankingInfoForCategory:(void *)a1 .cold.3(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Exception on fetching RankingInfo objects: %@\n", buf, 0xCu);
}

@end