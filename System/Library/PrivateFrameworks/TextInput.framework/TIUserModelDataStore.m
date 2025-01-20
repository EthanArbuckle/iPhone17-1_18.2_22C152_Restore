@interface TIUserModelDataStore
+ (id)initializeDataStoreAtPath:(id)a3;
- (BOOL)_updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5 withUpdateQuery:(const char *)a6;
- (BOOL)addValue:(id)a3 andSecondaryValue:(id)a4 andRealValue:(id)a5 andProperties:(id)a6 forKey:(id)a7 forInputMode:(id)a8 forDate:(id)a9;
- (BOOL)closeDatabase;
- (BOOL)createOrOpenDatabase;
- (BOOL)isDatabaseValid;
- (BOOL)isValid;
- (BOOL)purgeDataForKey:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5;
- (BOOL)purgeDataForKeyPrefix:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5;
- (BOOL)purgeDurableDataForKeyPrefix:(id)a3;
- (BOOL)setDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5;
- (BOOL)updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5;
- (NSDate)durableLastMigrationDate;
- (NSDate)propertiesLastMigrationDate;
- (NSDate)transientLastMigrationDate;
- (TIUserModelDataStore)initWithPath:(id)a3;
- (id)durableCreationSchema;
- (id)durableLastMigrationDateFromDatabase:(sqlite3 *)a3;
- (id)durableMigrationFromV2Schema;
- (id)durableMigrationFromV3Schema;
- (id)durableMigrationSchemaForDatabase:(sqlite3 *)a3;
- (id)durableResetSchema;
- (id)getAllKnownInputModes;
- (id)getAllKnownInputModesSinceDate:(id)a3;
- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 fromDate:(id)a5 toDate:(id)a6;
- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5;
- (id)getAllValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5;
- (id)getDailyAndWeeklyValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6;
- (id)getDurableValueForKey:(id)a3;
- (id)getInputModesForKey:(id)a3;
- (id)lastMigrationDateForKey:(id)a3 fromDatabase:(sqlite3 *)a4;
- (id)propertiesCreationSchema;
- (id)propertiesLastMigrationDateFromDatabase:(sqlite3 *)a3;
- (id)propertiesMigrationFromV1Schema;
- (id)propertiesMigrationSchemaForDatabase:(sqlite3 *)a3;
- (id)transientCreationSchema;
- (id)transientLastMigrationDateFromDatabase:(sqlite3 *)a3;
- (id)transientMigrationSchemaForDatabase:(sqlite3 *)a3;
- (id)transientResetSchema;
- (int)durableVersion;
- (int)durableVersionFromDatabase:(sqlite3 *)a3;
- (int)propertiesVersion;
- (int)propertiesVersionFromDatabase:(sqlite3 *)a3;
- (int)transientVersion;
- (int)transientVersionFromDatabase:(sqlite3 *)a3;
- (int)versionForKey:(id)a3 fromDatabase:(sqlite3 *)a4;
- (void)dealloc;
@end

@implementation TIUserModelDataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database_queue, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (BOOL)purgeDataForKeyPrefix:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__12623;
  v20[4] = __Block_byref_object_dispose__12624;
  id v21 = a5;
  id v9 = v21;
  v10 = [a3 stringByAppendingString:@"%"];
  database_queue = self->_database_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__TIUserModelDataStore_purgeDataForKeyPrefix_forInputMode_beforeDate___block_invoke;
  v15[3] = &unk_1E555A6A0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  v18 = v20;
  v19 = &v22;
  id v12 = v10;
  id v13 = v8;
  TIDispatchSync(database_queue, v15);
  LOBYTE(database_queue) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  return (char)database_queue;
}

void __70__TIUserModelDataStore_purgeDataForKeyPrefix_forInputMode_beforeDate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 40)) {
      v6 = "DELETE FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date < ?";
    }
    else {
      v6 = "DELETE FROM usermodeltransientrecords WHERE key LIKE ?  AND last_update_date < ?";
    }
    *(void *)ppStmt = 0;
    int v7 = sqlite3_prepare_v2(*(sqlite3 **)(v5 + 16), v6, -1, (sqlite3_stmt **)ppStmt, 0);
    if (!*(void *)ppStmt || v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    else
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
      id v8 = *(void **)(a1 + 40);
      if (v8)
      {
        sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)[v8 UTF8String], -1, 0);
        int v9 = 3;
      }
      else
      {
        int v9 = 2;
      }
      v11 = *(sqlite3_stmt **)ppStmt;
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v11, v9, v12);
      int v13 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
      BOOL v15 = v13 == 101 || v13 == 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v15;
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    v10 = IXADefaultLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't purge data because the database is invalid.", "-[TIUserModelDataStore purgeDataForKeyPrefix:forInputMode:beforeDate:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v16;
      _os_log_error_impl(&dword_18D240000, v10, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (BOOL)purgeDataForKey:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__12623;
  v21[4] = __Block_byref_object_dispose__12624;
  id v22 = v10;
  database_queue = self->_database_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__TIUserModelDataStore_purgeDataForKey_forInputMode_beforeDate___block_invoke;
  v16[3] = &unk_1E555A6A0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  v19 = v21;
  v20 = &v23;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  TIDispatchSync(database_queue, v16);
  LOBYTE(self) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);
  return (char)self;
}

void __64__TIUserModelDataStore_purgeDataForKey_forInputMode_beforeDate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    *(void *)ppStmt = 0;
    int v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "DELETE FROM usermodeltransientrecords WHERE key = ? AND input_mode = ? AND last_update_date < ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (!*(void *)ppStmt || v5)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    else
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
      v6 = *(sqlite3_stmt **)ppStmt;
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v6, 3, v7);
      int v8 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
      BOOL v10 = v8 == 101 || v8 == 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    v11 = IXADefaultLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't purge data because the database is invalid.", "-[TIUserModelDataStore purgeDataForKey:forInputMode:beforeDate:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v12;
      _os_log_error_impl(&dword_18D240000, v11, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (id)getAllKnownInputModesSinceDate:(id)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__12623;
  id v16 = __Block_byref_object_dispose__12624;
  id v17 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__12623;
  v10[4] = __Block_byref_object_dispose__12624;
  id v4 = a3;
  id v11 = v4;
  database_queue = self->_database_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__TIUserModelDataStore_getAllKnownInputModesSinceDate___block_invoke;
  v9[3] = &unk_1E555A678;
  v9[4] = self;
  v9[5] = v10;
  v9[6] = &v12;
  TIDispatchSync(database_queue, v9);
  if ([(id)v13[5] count]) {
    v6 = (void *)v13[5];
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__TIUserModelDataStore_getAllKnownInputModesSinceDate___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
      id v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    *(void *)ppStmt = 0;
    int v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), " SELECT DISTINCT input_mode FROM usermodeltransientrecords WHERE last_update_date > ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt && !v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v9 = *(sqlite3_stmt **)ppStmt;
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v9, 1, v10);
      while (1)
      {
        int v11 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v11 != 100) {
          break;
        }
        uint64_t v12 = sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0);
        id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v14 = [NSString stringWithUTF8String:v12];
        [v13 addObject:v14];
      }
      if (v11 != 101)
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    BOOL v15 = IXADefaultLogFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get all known input modes because the database is invalid.", "-[TIUserModelDataStore getAllKnownInputModesSinceDate:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v18;
      _os_log_error_impl(&dword_18D240000, v15, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (id)getAllKnownInputModes
{
  return [(TIUserModelDataStore *)self getAllKnownInputModesSinceDate:0];
}

- (id)getInputModesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__12623;
  id v17 = __Block_byref_object_dispose__12624;
  id v18 = 0;
  database_queue = self->_database_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__TIUserModelDataStore_getInputModesForKey___block_invoke;
  v10[3] = &unk_1E555A650;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = &v13;
  TIDispatchSync(database_queue, v10);
  if ([(id)v14[5] count]) {
    uint64_t v7 = (void *)v14[5];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __44__TIUserModelDataStore_getInputModesForKey___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(void *)ppStmt = 0;
    int v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), " SELECT DISTINCT input_mode FROM usermodeltransientrecords WHERE key = ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 0;
    }
    if (v3)
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
      while (1)
      {

        int v7 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v7 != 100) {
          break;
        }
        id v8 = sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0);
        id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v6 = [NSString stringWithUTF8String:v8];
        [v9 addObject:v6];
      }
      if (v7 != 101)
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    double v10 = IXADefaultLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get input modes because the database is invalid.", "-[TIUserModelDataStore getInputModesForKey:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v13;
      _os_log_error_impl(&dword_18D240000, v10, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (id)getDurableValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12623;
  uint64_t v16 = __Block_byref_object_dispose__12624;
  id v17 = 0;
  database_queue = self->_database_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__TIUserModelDataStore_getDurableValueForKey___block_invoke;
  v9[3] = &unk_1E555A650;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  TIDispatchSync(database_queue, v9);
  if ([(id)v13[5] count])
  {
    int v7 = [(id)v13[5] objectAtIndex:0];
  }
  else
  {
    int v7 = 0;
  }

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__TIUserModelDataStore_getDurableValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(void *)ppStmt = 0;
    int v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "SELECT value, creation_date, last_update_date FROM usermodeldurablerecords WHERE key = ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 0;
    }
    if (v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      while (1)
      {
        int v7 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v7 != 100) {
          break;
        }
        id v8 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 0));
        id v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 1));
        id v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 2));
        uint64_t v11 = [[TIUserModelDataStoreDurableEntry alloc] initWithCreationDate:v9 withLastUpdateDate:v10 withKey:*(void *)(a1 + 40) withValue:v8];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v11];
      }
      if (v7 != 101)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    uint64_t v12 = IXADefaultLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get durable value because the database is invalid.", "-[TIUserModelDataStore getDurableValueForKey:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v15;
      _os_log_error_impl(&dword_18D240000, v12, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 fromDate:(id)a5 toDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__12623;
  v40 = __Block_byref_object_dispose__12624;
  id v41 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__12623;
  v34[4] = __Block_byref_object_dispose__12624;
  id v14 = v12;
  id v35 = v14;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__12623;
  v32[4] = __Block_byref_object_dispose__12624;
  id v15 = v13;
  id v33 = v15;
  database_queue = self->_database_queue;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __72__TIUserModelDataStore_getAllValuesForKey_forInputMode_fromDate_toDate___block_invoke;
  uint64_t v25 = &unk_1E555A628;
  char v26 = self;
  v29 = v34;
  v30 = v32;
  v31 = &v36;
  id v17 = v10;
  id v27 = v17;
  id v18 = v11;
  id v28 = v18;
  TIDispatchSync(database_queue, &v22);
  if (objc_msgSend((id)v37[5], "count", v22, v23, v24, v25, v26)) {
    v19 = (void *)v37[5];
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);

  return v20;
}

void __72__TIUserModelDataStore_getAllValuesForKey_forInputMode_fromDate_toDate___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      int v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    *(void *)ppStmt = 0;
    int v8 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key = ? AND input_mode = ? AND last_update_date > ? AND last_update_date <= ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt && !v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
      id v12 = *(sqlite3_stmt **)ppStmt;
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v12, 3, v13);
      id v14 = *(sqlite3_stmt **)ppStmt;
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v14, 4, v15);
      while (1)
      {
        int v16 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v16 != 100) {
          break;
        }
        id v17 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0));
        id v18 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 1));
        v19 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 2));
        id v20 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 3));
        int v21 = sqlite3_column_bytes(*(sqlite3_stmt **)ppStmt, 4);
        uint64_t v22 = sqlite3_column_blob(*(sqlite3_stmt **)ppStmt, 4);
        if (v21)
        {
          uint64_t v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:v21];
        }
        else
        {
          uint64_t v23 = 0;
        }
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 5));
        uint64_t v25 = [[TIUserModelDataStoreEntry alloc] initWithTimestamp:v24 withKey:v17 withInputMode:*(void *)(a1 + 48) withValue:v18 withSecondaryValue:v19 withRealValue:v20 withProperties:v23];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v25];
      }
      if (v16 != 101)
      {
        uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
        id v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    char v26 = IXADefaultLogFacility();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get values because the database is invalid.", "-[TIUserModelDataStore getAllValuesForKey:forInputMode:fromDate:toDate:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v29;
      _os_log_error_impl(&dword_18D240000, v26, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (id)getDailyAndWeeklyValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6
{
  id v10 = a3;
  id v22 = a4;
  id v11 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__12623;
  v42 = __Block_byref_object_dispose__12624;
  id v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__12623;
  v36[4] = __Block_byref_object_dispose__12624;
  id v12 = a6;
  id v37 = v12;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__12623;
  v34[4] = __Block_byref_object_dispose__12624;
  id v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v12 sinceDate:(double)(unint64_t)kCommonMetricQueryTimeFrame * -86400.0];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__12623;
  v32[4] = __Block_byref_object_dispose__12624;
  id v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v12 sinceDate:(double)(unint64_t)kFeatureUsageQueryTimeFrame * -86400.0];
  double v13 = [v10 stringByAppendingString:@"%"];
  database_queue = self->_database_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__TIUserModelDataStore_getDailyAndWeeklyValuesForKeyPrefix_forInputMode_weeklyKeySuffixes_endDate___block_invoke;
  v23[3] = &unk_1E555A600;
  v23[4] = self;
  id v15 = v11;
  id v24 = v15;
  id v16 = v10;
  id v25 = v16;
  id v28 = &v38;
  id v17 = v13;
  id v26 = v17;
  id v18 = v22;
  id v27 = v18;
  v29 = v36;
  v30 = v34;
  uint64_t v31 = v32;
  TIDispatchSync(database_queue, v23);
  if ([(id)v39[5] count]) {
    v19 = (void *)v39[5];
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  return v20;
}

void __99__TIUserModelDataStore_getDailyAndWeeklyValuesForKeyPrefix_forInputMode_weeklyKeySuffixes_endDate___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v49;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v49 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(a1 + 48) stringByAppendingString:*(void *)(*((void *)&v48 + 1) + 8 * v8)];
          [v2 addObject:v9];

          [v3 addObject:@"?"];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v6);
    }

    if ([v2 count])
    {
      id v10 = NSString;
      id v11 = [v3 componentsJoinedByString:@", "];
      id v12 = [v10 stringWithFormat:@"(last_update_date > ? OR (last_update_date > ? AND key IN (%@)))", v11];
      double v13 = objc_msgSend(@"SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date <= ? AND ", "stringByAppendingString:", v12);
    }
    else
    {
      double v13 = objc_msgSend(@"SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date <= ? AND ", "stringByAppendingString:", @"last_update_date > ?");
    }
    *(void *)buf = 0;
    id v15 = *(sqlite3 **)(*(void *)(a1 + 32) + 16);
    id v43 = v13;
    int v16 = sqlite3_prepare_v2(v15, (const char *)[v43 UTF8String], -1, (sqlite3_stmt **)buf, 0);
    if (*(void *)buf && !v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      sqlite3_bind_text(*(sqlite3_stmt **)buf, 1, (const char *)[*(id *)(a1 + 56) UTF8String], -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)buf, 2, (const char *)[*(id *)(a1 + 64) UTF8String], -1, 0);
      id v20 = *(sqlite3_stmt **)buf;
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v20, 3, v21);
      id v22 = *(sqlite3_stmt **)buf;
      [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v22, 4, v23);
      if (![v2 count]) {
        goto LABEL_25;
      }
      id v24 = *(sqlite3_stmt **)buf;
      [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v24, 5, v25);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v26 = v2;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v45;
        int v30 = 6;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v26);
            }
            sqlite3_bind_text(*(sqlite3_stmt **)buf, v30 + v31, (const char *)[*(id *)(*((void *)&v44 + 1) + 8 * v31) UTF8String], -1, 0);
            ++v31;
          }
          while (v28 != v31);
          v30 += v31;
          uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v28);
      }
      while (1)
      {

LABEL_25:
        int v32 = sqlite3_step(*(sqlite3_stmt **)buf);
        if (v32 != 100) {
          break;
        }
        id v26 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)buf, 0));
        id v33 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)buf, 1));
        v34 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)buf, 2));
        id v35 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)buf, 3));
        int v36 = sqlite3_column_bytes(*(sqlite3_stmt **)buf, 4);
        id v37 = sqlite3_column_blob(*(sqlite3_stmt **)buf, 4);
        uint64_t v38 = 0;
        if (v36)
        {
          uint64_t v38 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v37 length:v36];
        }
        v39 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)buf, 5));
        uint64_t v40 = [[TIUserModelDataStoreEntry alloc] initWithTimestamp:v39 withKey:v26 withInputMode:*(void *)(a1 + 64) withValue:v33 withSecondaryValue:v34 withRealValue:v35 withProperties:v38];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v40];
      }
      if (v32 != 101)
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
        v42 = *(void **)(v41 + 40);
        *(void *)(v41 + 40) = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
  }
  else
  {
    uint64_t v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get values because the database is invalid.", "-[TIUserModelDataStore getDailyAndWeeklyValuesForKeyPrefix:forInputMode:weeklyKeySuffixes:endDate:]_block_invoke");
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v14;
      _os_log_error_impl(&dword_18D240000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (id)getAllValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8 = a4;
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__12623;
  uint64_t v28 = __Block_byref_object_dispose__12624;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__12623;
  v22[4] = __Block_byref_object_dispose__12624;
  id v9 = a5;
  id v23 = v9;
  id v10 = [a3 stringByAppendingString:@"%"];
  database_queue = self->_database_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__TIUserModelDataStore_getAllValuesForKeyPrefix_forInputMode_sinceDate___block_invoke;
  v17[3] = &unk_1E555A6A0;
  v17[4] = self;
  id v20 = v22;
  double v21 = &v24;
  id v12 = v10;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  TIDispatchSync(database_queue, v17);
  if ([(id)v25[5] count]) {
    id v14 = (void *)v25[5];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __72__TIUserModelDataStore_getAllValuesForKeyPrefix_forInputMode_sinceDate___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      id v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    *(void *)ppStmt = 0;
    int v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "SELECT key, value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key LIKE ? AND input_mode = ? AND last_update_date > ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt && !v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
      id v9 = *(sqlite3_stmt **)ppStmt;
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v9, 3, v10);
      while (1)
      {
        int v11 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v11 != 100) {
          break;
        }
        id v12 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)ppStmt, 0));
        id v13 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 1));
        id v14 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 2));
        id v15 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 3));
        int v16 = sqlite3_column_bytes(*(sqlite3_stmt **)ppStmt, 4);
        uint64_t v17 = sqlite3_column_blob(*(sqlite3_stmt **)ppStmt, 4);
        if (v16)
        {
          id v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:v16];
        }
        else
        {
          id v18 = 0;
        }
        id v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 5));
        id v20 = [[TIUserModelDataStoreEntry alloc] initWithTimestamp:v19 withKey:v12 withInputMode:*(void *)(a1 + 48) withValue:v13 withSecondaryValue:v14 withRealValue:v15 withProperties:v18];
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v20];
      }
      if (v11 != 101)
      {
        uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
        id v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    double v21 = IXADefaultLogFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get values because the database is invalid.", "-[TIUserModelDataStore getAllValuesForKeyPrefix:forInputMode:sinceDate:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v24;
      _os_log_error_impl(&dword_18D240000, v21, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__12623;
  uint64_t v28 = __Block_byref_object_dispose__12624;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__12623;
  v22[4] = __Block_byref_object_dispose__12624;
  id v10 = a5;
  id v23 = v10;
  database_queue = self->_database_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__TIUserModelDataStore_getAllValuesForKey_forInputMode_sinceDate___block_invoke;
  v17[3] = &unk_1E555A6A0;
  v17[4] = self;
  id v20 = v22;
  double v21 = &v24;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  TIDispatchSync(database_queue, v17);
  if ([(id)v25[5] count]) {
    id v14 = (void *)v25[5];
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __66__TIUserModelDataStore_getAllValuesForKey_forInputMode_sinceDate___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v2 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      id v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    *(void *)ppStmt = 0;
    int v5 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "SELECT value, secondary_value, real_value, properties, last_update_date FROM usermodeltransientrecords WHERE key = ? AND input_mode = ? AND last_update_date > ? ORDER BY last_update_date ASC", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt && !v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 2, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
      id v9 = *(sqlite3_stmt **)ppStmt;
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSince1970];
      sqlite3_bind_double(v9, 3, v10);
      while (1)
      {
        int v11 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        if (v11 != 100) {
          break;
        }
        id v12 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 0));
        id v13 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(*(sqlite3_stmt **)ppStmt, 1));
        id v14 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 2));
        int v15 = sqlite3_column_bytes(*(sqlite3_stmt **)ppStmt, 3);
        int v16 = sqlite3_column_blob(*(sqlite3_stmt **)ppStmt, 3);
        if (v15)
        {
          uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 length:v15];
        }
        else
        {
          uint64_t v17 = 0;
        }
        id v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)ppStmt, 4));
        id v19 = [[TIUserModelDataStoreEntry alloc] initWithTimestamp:v18 withKey:*(void *)(a1 + 40) withInputMode:*(void *)(a1 + 48) withValue:v12 withSecondaryValue:v13 withRealValue:v14 withProperties:v17];
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v19];
      }
      if (v11 != 101)
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = 0;
      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
  }
  else
  {
    id v20 = IXADefaultLogFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get values because the database is invalid.", "-[TIUserModelDataStore getAllValuesForKey:forInputMode:sinceDate:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v23;
      _os_log_error_impl(&dword_18D240000, v20, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (BOOL)_updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5 withUpdateQuery:(const char *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  database_queue = self->_database_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__TIUserModelDataStore__updateDurableValue_forKey_forDate_withUpdateQuery___block_invoke;
  v18[3] = &unk_1E555A5D8;
  v18[4] = self;
  id v19 = v11;
  uint64_t v22 = &v24;
  id v23 = a6;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  TIDispatchSync(database_queue, v18);
  LOBYTE(database_queue) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)database_queue;
}

void __75__TIUserModelDataStore__updateDurableValue_forKey_forDate_withUpdateQuery___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(void *)ppStmt = 0;
    int v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "SELECT value FROM usermodeldurablerecords WHERE key = ? ", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 0;
    }
    if (v3)
    {
      char v4 = 1;
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      do
      {
        char v5 = v4;
        int v6 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
        char v4 = 0;
      }
      while (v6 == 100);
      if (v6 == 101) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v7 = (v5 & 1) != 0
           ? "INSERT INTO usermodeldurablerecords (key,  value,  creation_date, last_update_date) VALUES (:key, :value, :"
             "creation_date, :last_update_date)"
           : *(const char **)(a1 + 72);
        pStmt = 0;
        int v9 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), v7, -1, &pStmt, 0);
        id v10 = pStmt;
        if (pStmt)
        {
          if (!v9)
          {
            int v11 = sqlite3_bind_parameter_index(pStmt, ":key");
            sqlite3_bind_text(v10, v11, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
            id v12 = pStmt;
            int v13 = sqlite3_bind_parameter_index(pStmt, ":value");
            sqlite3_bind_int(v12, v13, [*(id *)(a1 + 48) intValue]);
            if (v5)
            {
              id v14 = pStmt;
              int v15 = sqlite3_bind_parameter_index(pStmt, ":creation_date");
              [*(id *)(a1 + 56) timeIntervalSince1970];
              sqlite3_bind_double(v14, v15, v16);
            }
            uint64_t v17 = pStmt;
            int v18 = sqlite3_bind_parameter_index(pStmt, ":last_update_date");
            [*(id *)(a1 + 56) timeIntervalSince1970];
            sqlite3_bind_double(v17, v18, v19);
            int v20 = sqlite3_step(pStmt);
            BOOL v22 = v20 == 101 || v20 == 0;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v22;
            sqlite3_finalize(pStmt);
          }
        }
      }
    }
  }
  else
  {
    id v8 = IXADefaultLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't update durable value because the database is invalid.", "-[TIUserModelDataStore _updateDurableValue:forKey:forDate:withUpdateQuery:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v23;
      _os_log_error_impl(&dword_18D240000, v8, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

- (BOOL)updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  return -[TIUserModelDataStore _updateDurableValue:forKey:forDate:withUpdateQuery:](self, "_updateDurableValue:forKey:forDate:withUpdateQuery:", a3, a4, a5, "UPDATE usermodeldurablerecords SET value = value + :value, last_update_date = :last_update_date WHERE key = :key");
}

- (BOOL)setDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  return -[TIUserModelDataStore _updateDurableValue:forKey:forDate:withUpdateQuery:](self, "_updateDurableValue:forKey:forDate:withUpdateQuery:", a3, a4, a5, "UPDATE usermodeldurablerecords SET value = :value, last_update_date = :last_update_date WHERE key = :key");
}

- (BOOL)addValue:(id)a3 andSecondaryValue:(id)a4 andRealValue:(id)a5 andProperties:(id)a6 forKey:(id)a7 forInputMode:(id)a8 forDate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  database_queue = self->_database_queue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __106__TIUserModelDataStore_addValue_andSecondaryValue_andRealValue_andProperties_forKey_forInputMode_forDate___block_invoke;
  v31[3] = &unk_1E555A5B0;
  id v32 = v19;
  id v33 = v20;
  v34 = self;
  id v35 = v15;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  id v39 = v21;
  uint64_t v40 = &v41;
  id v23 = v21;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  id v28 = v20;
  id v29 = v19;
  TIDispatchSync(database_queue, v31);
  LOBYTE(v19) = *((unsigned char *)v42 + 24);

  _Block_object_dispose(&v41, 8);
  return (char)v19;
}

void __106__TIUserModelDataStore_addValue_andSecondaryValue_andRealValue_andProperties_forKey_forInputMode_forDate___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    id v17 = IXADefaultLogFacility();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Required field 'key' is nil. Ignoring value for key.", "-[TIUserModelDataStore addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:]_block_invoke");
    *(_DWORD *)ppStmt = 138412290;
    *(void *)&ppStmt[4] = v18;
LABEL_14:
    _os_log_error_impl(&dword_18D240000, v17, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);

    goto LABEL_15;
  }
  if (!*(void *)(a1 + 40))
  {
    id v17 = IXADefaultLogFacility();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Required field 'inputMode' is nil. Ignoring value for inputMode.", "-[TIUserModelDataStore addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:]_block_invoke");
    *(_DWORD *)ppStmt = 138412290;
    *(void *)&ppStmt[4] = v18;
    goto LABEL_14;
  }
  if (![*(id *)(a1 + 48) isDatabaseValid])
  {
    id v17 = IXADefaultLogFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't add value because the database is invalid.", "-[TIUserModelDataStore addValue:andSecondaryValue:andRealValue:andProperties:forKey:forInputMode:forDate:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v18;
      goto LABEL_14;
    }
LABEL_15:

    return;
  }
  *(void *)ppStmt = 0;
  int v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 48) + 16), "INSERT INTO usermodeltransientrecords (key, input_mode, value,  secondary_value, real_value, properties, last_update_date) VALUES (:key, :input_mode, :value, :secondary_value, :real_value, :properties, :last_update_date)", -1, (sqlite3_stmt **)ppStmt, 0);
  BOOL v3 = *(sqlite3_stmt **)ppStmt;
  if (!*(void *)ppStmt || v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
  }
  else
  {
    int v4 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":key");
    sqlite3_bind_text(v3, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
    char v5 = *(sqlite3_stmt **)ppStmt;
    int v6 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":input_mode");
    sqlite3_bind_text(v5, v6, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    uint64_t v7 = *(sqlite3_stmt **)ppStmt;
    int v8 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":value");
    sqlite3_bind_int(v7, v8, [*(id *)(a1 + 56) intValue]);
    int v9 = *(sqlite3_stmt **)ppStmt;
    int v10 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":secondary_value");
    sqlite3_bind_int(v9, v10, [*(id *)(a1 + 64) intValue]);
    int v11 = *(sqlite3_stmt **)ppStmt;
    int v12 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":real_value");
    [*(id *)(a1 + 72) doubleValue];
    sqlite3_bind_double(v11, v12, v13);
    uint64_t v14 = *(void *)(a1 + 80);
    id v15 = *(sqlite3_stmt **)ppStmt;
    int v16 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":properties");
    if (v14) {
      sqlite3_bind_blob(v15, v16, (const void *)[*(id *)(a1 + 80) bytes], objc_msgSend(*(id *)(a1 + 80), "length"), 0);
    }
    else {
      sqlite3_bind_null(v15, v16);
    }
    id v19 = *(sqlite3_stmt **)ppStmt;
    int v20 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)ppStmt, ":last_update_date");
    [*(id *)(a1 + 88) timeIntervalSince1970];
    sqlite3_bind_double(v19, v20, v21);
    int v22 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
    BOOL v24 = v22 == 101 || v22 == 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v24;
    sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
  }
}

- (id)transientMigrationSchemaForDatabase:(sqlite3 *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(TIUserModelDataStore *)self transientVersionFromDatabase:a3];
  if (v4 == 7)
  {
    uint64_t v7 = &stru_1EDBDCE38;
  }
  else
  {
    uint64_t v5 = v4;
    if (v4)
    {
      int v8 = IXADefaultLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Transient table to be reset from version %d to %d", "-[TIUserModelDataStore transientMigrationSchemaForDatabase:]", v5, 7);
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_18D240000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      int v10 = [(TIUserModelDataStore *)self transientResetSchema];
      int v11 = [(TIUserModelDataStore *)self transientCreationSchema];
      uint64_t v7 = [v10 stringByAppendingString:v11];
    }
    else
    {
      int v6 = IXADefaultLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        double v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Transient table to be created with version %d", "-[TIUserModelDataStore transientMigrationSchemaForDatabase:]", 7);
        *(_DWORD *)buf = 138412290;
        id v15 = v13;
        _os_log_debug_impl(&dword_18D240000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      uint64_t v7 = [(TIUserModelDataStore *)self transientCreationSchema];
    }
  }

  return v7;
}

- (id)durableMigrationSchemaForDatabase:(sqlite3 *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch([(TIUserModelDataStore *)self durableVersionFromDatabase:a3])
  {
    case 0:
      uint64_t v4 = IXADefaultLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Durable table to be created with version %d", "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 4);
        *(_DWORD *)buf = 138412290;
        id v18 = v16;
        _os_log_debug_impl(&dword_18D240000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      uint64_t v5 = [(TIUserModelDataStore *)self durableCreationSchema];
      goto LABEL_15;
    case 1:
      uint64_t v7 = IXADefaultLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Durable table to be reset from version %d to %d", "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 1, 4);
        *(_DWORD *)buf = 138412290;
        id v18 = v8;
        _os_log_impl(&dword_18D240000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      int v9 = [(TIUserModelDataStore *)self durableResetSchema];
      int v10 = [(TIUserModelDataStore *)self durableCreationSchema];
      int v6 = [v9 stringByAppendingString:v10];

      break;
    case 2:
      int v11 = IXADefaultLogFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Durable table to be migrated from version %d to %d", "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 2, 4);
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl(&dword_18D240000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      uint64_t v5 = [(TIUserModelDataStore *)self durableMigrationFromV2Schema];
      goto LABEL_15;
    case 3:
      double v13 = IXADefaultLogFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Durable table to be migrated from version %d to %d", "-[TIUserModelDataStore durableMigrationSchemaForDatabase:]", 3, 4);
        *(_DWORD *)buf = 138412290;
        id v18 = v14;
        _os_log_impl(&dword_18D240000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      uint64_t v5 = [(TIUserModelDataStore *)self durableMigrationFromV3Schema];
LABEL_15:
      int v6 = (__CFString *)v5;
      break;
    default:
      int v6 = &stru_1EDBDCE38;
      break;
  }

  return v6;
}

- (id)propertiesMigrationSchemaForDatabase:(sqlite3 *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = [(TIUserModelDataStore *)self propertiesVersionFromDatabase:a3];
  if (v4 == 1)
  {
    uint64_t v7 = IXADefaultLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Properties table to be migrated from version %d to %d", "-[TIUserModelDataStore propertiesMigrationSchemaForDatabase:]", 1, 4);
      *(_DWORD *)buf = 138412290;
      int v12 = v8;
      _os_log_impl(&dword_18D240000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    int v6 = [(TIUserModelDataStore *)self propertiesMigrationFromV1Schema];
  }
  else if (v4)
  {
    int v6 = &stru_1EDBDCE38;
  }
  else
  {
    uint64_t v5 = IXADefaultLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Properties table to be created with version %d", "-[TIUserModelDataStore propertiesMigrationSchemaForDatabase:]", 2);
      *(_DWORD *)buf = 138412290;
      int v12 = v10;
      _os_log_debug_impl(&dword_18D240000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    int v6 = [(TIUserModelDataStore *)self propertiesCreationSchema];
  }

  return v6;
}

- (id)lastMigrationDateForKey:(id)a3 fromDatabase:(sqlite3 *)a4
{
  id v5 = a3;
  if (a4)
  {
    ppStmt = 0;
    int v6 = sqlite3_prepare_v2(a4, "SELECT value FROM properties WHERE key = ?", -1, &ppStmt, 0);
    a4 = 0;
    if (ppStmt && v6 == 0)
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v5 UTF8String], -1, 0);
      a4 = 0;
      if (sqlite3_step(ppStmt) == 100)
      {
        objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(ppStmt, 0));
        a4 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
      }
      sqlite3_finalize(ppStmt);
    }
  }

  return a4;
}

- (int)versionForKey:(id)a3 fromDatabase:(sqlite3 *)a4
{
  id v5 = a3;
  if (a4)
  {
    ppStmt = 0;
    int v6 = sqlite3_prepare_v2(a4, "SELECT value FROM properties WHERE key = ?", -1, &ppStmt, 0);
    if (ppStmt) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v5 UTF8String], -1, 0);
      if (sqlite3_step(ppStmt) == 100) {
        LODWORD(a4) = sqlite3_column_int(ppStmt, 0);
      }
      else {
        LODWORD(a4) = 0;
      }
      sqlite3_finalize(ppStmt);
    }
    else
    {
      LODWORD(a4) = 0;
    }
  }

  return (int)a4;
}

- (NSDate)transientLastMigrationDate
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__12623;
  int v10 = __Block_byref_object_dispose__12624;
  id v11 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__TIUserModelDataStore_transientLastMigrationDate__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __50__TIUserModelDataStore_transientLastMigrationDate__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) transientLastMigrationDateFromDatabase:*(void *)(*(void *)(a1 + 32) + 16)];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    int v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get transient last migration date because the database is invalid.", "-[TIUserModelDataStore transientLastMigrationDate]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v5 = v3;
      _os_log_error_impl(&dword_18D240000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (id)transientLastMigrationDateFromDatabase:(sqlite3 *)a3
{
  return [(TIUserModelDataStore *)self lastMigrationDateForKey:@"transient_last_migration_date" fromDatabase:a3];
}

- (int)transientVersion
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__TIUserModelDataStore_transientVersion__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __40__TIUserModelDataStore_transientVersion__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) transientVersionFromDatabase:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else
  {
    int v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get transient version because the database is invalid.", "-[TIUserModelDataStore transientVersion]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v5 = v3;
      _os_log_error_impl(&dword_18D240000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (int)transientVersionFromDatabase:(sqlite3 *)a3
{
  int result = [(TIUserModelDataStore *)self versionForKey:@"transient_version" fromDatabase:a3];
  if (!result)
  {
    return [(TIUserModelDataStore *)self versionForKey:@"version" fromDatabase:a3];
  }
  return result;
}

- (NSDate)durableLastMigrationDate
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__12623;
  int v10 = __Block_byref_object_dispose__12624;
  id v11 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__TIUserModelDataStore_durableLastMigrationDate__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __48__TIUserModelDataStore_durableLastMigrationDate__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) durableLastMigrationDateFromDatabase:*(void *)(*(void *)(a1 + 32) + 16)];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    int v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get durable last migration date because the database is invalid.", "-[TIUserModelDataStore durableLastMigrationDate]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v5 = v3;
      _os_log_error_impl(&dword_18D240000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (id)durableLastMigrationDateFromDatabase:(sqlite3 *)a3
{
  return [(TIUserModelDataStore *)self lastMigrationDateForKey:@"durable_last_migration_date" fromDatabase:a3];
}

- (int)durableVersion
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__TIUserModelDataStore_durableVersion__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__TIUserModelDataStore_durableVersion__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) durableVersionFromDatabase:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else
  {
    int v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get durable version because the database is invalid.", "-[TIUserModelDataStore durableVersion]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v5 = v3;
      _os_log_error_impl(&dword_18D240000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (int)durableVersionFromDatabase:(sqlite3 *)a3
{
  int result = [(TIUserModelDataStore *)self versionForKey:@"durable_version" fromDatabase:a3];
  if (!result)
  {
    int result = [(TIUserModelDataStore *)self versionForKey:@"version" fromDatabase:a3];
    if (result >= 2) {
      return 2;
    }
  }
  return result;
}

- (NSDate)propertiesLastMigrationDate
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__12623;
  int v10 = __Block_byref_object_dispose__12624;
  id v11 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__TIUserModelDataStore_propertiesLastMigrationDate__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __51__TIUserModelDataStore_propertiesLastMigrationDate__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) propertiesLastMigrationDateFromDatabase:*(void *)(*(void *)(a1 + 32) + 16)];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    int v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get properties last migration date because the database is invalid.", "-[TIUserModelDataStore propertiesLastMigrationDate]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v5 = v3;
      _os_log_error_impl(&dword_18D240000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (id)propertiesLastMigrationDateFromDatabase:(sqlite3 *)a3
{
  return [(TIUserModelDataStore *)self lastMigrationDateForKey:@"properties_last_migration_date" fromDatabase:a3];
}

- (int)propertiesVersion
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__TIUserModelDataStore_propertiesVersion__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__TIUserModelDataStore_propertiesVersion__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) propertiesVersionFromDatabase:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else
  {
    int v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't get properties version because the database is invalid.", "-[TIUserModelDataStore propertiesVersion]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v5 = v3;
      _os_log_error_impl(&dword_18D240000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
}

- (int)propertiesVersionFromDatabase:(sqlite3 *)a3
{
  int result = [(TIUserModelDataStore *)self versionForKey:@"properties_version" fromDatabase:a3];
  if (!result) {
    return [(TIUserModelDataStore *)self versionForKey:@"version" fromDatabase:a3] > 0|| [(TIUserModelDataStore *)self versionForKey:@"durable_version" fromDatabase:a3] >= 1;
  }
  return result;
}

- (id)transientCreationSchema
{
  int v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSince1970];
  uint64_t v4 = v3;

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE usermodeltransientrecords(   ROWID INTEGER PRIMARY KEY AUTOINCREMENT,   key    TEXT  NOT NULL,   input_mode      TEXT NOT NULL,   value           INTEGER DEFAULT 0,   secondary_value INTEGER DEFAULT 0,   real_value       REAL DEFAULT 0,   properties            BLOB,   last_update_date       REAL DEFAULT 0,   journaled);CREATE INDEX transient_key_index ON usermodeltransientrecords(key);CREATE INDEX transient_input_mode_index ON usermodeltransientrecords(input_mode);CREATE INDEX transient_last_update_date_index ON usermodeltransientrecords(last_update_date);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);",
               @"transient_version",
               7,
               @"transient_last_migration_date",
               v4);
}

- (id)transientResetSchema
{
  return @"DROP INDEX IF EXISTS transient_key_index;DROP INDEX IF EXISTS transient_input_mode_index;DROP INDEX IF EXISTS transient_last_update_date_index;DROP INDEX IF EXISTS feature_type_index;DROP TABLE IF EXISTS usermodelrecords;DROP TABLE IF EXISTS usermodeltransientrecords;";
}

- (id)durableMigrationFromV3Schema
{
  int v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSince1970];
  uint64_t v4 = v3;

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);",
               @"durable_version",
               4,
               @"durable_last_migration_date",
               v4);
}

- (id)durableMigrationFromV2Schema
{
  int v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSince1970];
  uint64_t v4 = v3;

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);",
               @"durable_version",
               4,
               @"durable_last_migration_date",
               v4);
}

- (id)durableCreationSchema
{
  int v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSince1970];
  uint64_t v4 = v3;

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE usermodeldurablerecords(   ROWID INTEGER PRIMARY KEY AUTOINCREMENT,   key    TEXT  NOT NULL,   value           INTEGER DEFAULT 0,   creation_date       REAL DEFAULT 0,   last_update_date       REAL DEFAULT 0,   journaled);CREATE INDEX durable_key_index ON usermodeldurablerecords(key);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);",
               @"durable_version",
               4,
               @"durable_last_migration_date",
               v4);
}

- (id)durableResetSchema
{
  return @"DROP INDEX IF EXISTS durable_key_index;DROP INDEX IF EXISTS durable_input_mode_index;DROP TABLE IF EXISTS usermodeldurablerecords;";
}

- (id)propertiesMigrationFromV1Schema
{
  int v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSince1970];
  uint64_t v4 = v3;

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM properties WHERE key = '%@';INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %d);INSERT OR REPLACE INTO properties (key, value) VALUES ('%@', %f);",
               @"version",
               @"properties_version",
               2,
               @"properties_last_migration_date",
               v4);
}

- (id)propertiesCreationSchema
{
  int v2 = [MEMORY[0x1E4F1C9C8] now];
  [v2 timeIntervalSince1970];
  uint64_t v4 = v3;

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE properties( ROWID INTEGER PRIMARY KEY,  key,  value,  UNIQUE (key));INSERT INTO properties (key, value) VALUES ('%@', %d);INSERT INTO properties (key, value) VALUES ('%@', %f);",
               @"properties_version",
               2,
               @"properties_last_migration_date",
               v4);
}

- (BOOL)closeDatabase
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__TIUserModelDataStore_closeDatabase__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__TIUserModelDataStore_closeDatabase__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    int v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Closing database.", "-[TIUserModelDataStore closeDatabase]_block_invoke");
      *(_DWORD *)buf = 138412290;
      int v10 = v6;
      _os_log_debug_impl(&dword_18D240000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    uint64_t v3 = sqlite3_close(*(sqlite3 **)(*(void *)(a1 + 32) + 16));
    uint64_t v4 = IXADefaultLogFacility();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Error closing database: %d %s", "-[TIUserModelDataStore closeDatabase]_block_invoke", v3, sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 16)));
        *(_DWORD *)buf = 138412290;
        int v10 = v7;
        _os_log_error_impl(&dword_18D240000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Database closed.", "-[TIUserModelDataStore closeDatabase]_block_invoke");
        *(_DWORD *)buf = 138412290;
        int v10 = v8;
        _os_log_debug_impl(&dword_18D240000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  *(void *)(*(void *)(a1 + 32) + 16) = 0;
}

- (BOOL)createOrOpenDatabase
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = IXADefaultLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Opening database.", "-[TIUserModelDataStore createOrOpenDatabase]");
    *(_DWORD *)buf = 138412290;
    id v33 = v24;
    _os_log_debug_impl(&dword_18D240000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  uint64_t v4 = [(NSString *)self->_path UTF8String];
  ppDb = 0;
  if (sqlite3_open_v2(v4, &ppDb, 3145734, 0))
  {
    uint64_t v5 = sqlite3_extended_errcode(ppDb);
    uint64_t v6 = IXADefaultLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v25 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Couldn't open or create database at path %s: %d %s", "-[TIUserModelDataStore createOrOpenDatabase]", v4, v5, sqlite3_errmsg(ppDb));
      *(_DWORD *)buf = 138412290;
      id v33 = v25;
      _os_log_error_impl(&dword_18D240000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if ((TI_IS_FILE_CLASS_C((uint64_t)v4) & 1) == 0 && !TI_SET_PROTECTION_CLASS_C((uint64_t)v4))
  {
LABEL_7:
    sqlite3_close(ppDb);
    BOOL v7 = 0;
    self->_user_model_db_failed = 1;
    return v7;
  }
  uint64_t v8 = sqlite3_extended_result_codes(ppDb, 1);
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = IXADefaultLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Couldn't enable the extended result codes: %d %s", "-[TIUserModelDataStore createOrOpenDatabase]", v9, sqlite3_errmsg(ppDb));
      *(_DWORD *)buf = 138412290;
      id v33 = v26;
      _os_log_error_impl(&dword_18D240000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  errmsg = 0;
  uint64_t v11 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL", 0, 0, &errmsg);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = IXADefaultLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Couldn't switch database to wal mode: %s %d %s", "-[TIUserModelDataStore createOrOpenDatabase]", errmsg, v12, sqlite3_errmsg(ppDb));
      *(_DWORD *)buf = 138412290;
      id v33 = v27;
      _os_log_error_impl(&dword_18D240000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  sqlite3_free(errmsg);
  uint64_t v14 = [(TIUserModelDataStore *)self propertiesMigrationSchemaForDatabase:ppDb];
  id v15 = [(TIUserModelDataStore *)self durableMigrationSchemaForDatabase:ppDb];
  uint64_t v16 = [(TIUserModelDataStore *)self transientMigrationSchemaForDatabase:ppDb];
  id v17 = [NSString stringWithFormat:@"%@%@%@", v14, v15, v16];
  if ([v17 length]
    && ((uint64_t v18 = sqlite3_exec(ppDb, "BEGIN", 0, 0, 0), v19 = v18, v20 = v18, v18)
     || (uint64_t v20 = sqlite3_exec(ppDb, (const char *)[v17 UTF8String], 0, 0, 0),
         v20)
     || (uint64_t v20 = sqlite3_exec(ppDb, "COMMIT", 0, 0, 0), v20)))
  {
    double v21 = IXADefaultLogFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: The schema migration failed: %d %s", "-[TIUserModelDataStore createOrOpenDatabase]", v20, sqlite3_errmsg(ppDb));
      *(_DWORD *)buf = 138412290;
      id v33 = v28;
      _os_log_error_impl(&dword_18D240000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    if (!v19) {
      sqlite3_exec(ppDb, "ROLLBACK", 0, 0, 0);
    }
    sqlite3_close(ppDb);
    BOOL v7 = 0;
    self->_user_model_db_failed = 1;
  }
  else
  {
    int v22 = IXADefaultLogFacility();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Database opened.", "-[TIUserModelDataStore createOrOpenDatabase]");
      *(_DWORD *)buf = 138412290;
      id v33 = v29;
      _os_log_debug_impl(&dword_18D240000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    self->_user_model_db = ppDb;
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)isDatabaseValid
{
  if (self->_user_model_db) {
    return 1;
  }
  if (self->_user_model_db_failed) {
    return 0;
  }
  return [(TIUserModelDataStore *)self createOrOpenDatabase];
}

- (BOOL)isValid
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  database_queue = self->_database_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__TIUserModelDataStore_isValid__block_invoke;
  v5[3] = &unk_1E555A588;
  v5[4] = self;
  v5[5] = &v6;
  TIDispatchSync(database_queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__TIUserModelDataStore_isValid__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDatabaseValid];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  [(TIUserModelDataStore *)self closeDatabase];
  v3.receiver = self;
  v3.super_class = (Class)TIUserModelDataStore;
  [(TIUserModelDataStore *)&v3 dealloc];
}

- (TIUserModelDataStore)initWithPath:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIUserModelDataStore;
  uint64_t v6 = [(TIUserModelDataStore *)&v13 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v7->_user_model_db = 0;
    v7->_user_model_db_failed = 0;
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    char v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.textInput.usermodeldatastorequeue", v9);
    database_queue = v7->_database_queue;
    v7->_database_queue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

+ (id)initializeDataStoreAtPath:(id)a3
{
  id v3 = a3;
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT()) {
    uint64_t v4 = [[TIUserModelDataStore alloc] initWithPath:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)purgeDurableDataForKeyPrefix:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = [a3 stringByAppendingString:@"%"];
  database_queue = self->_database_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__TIUserModelDataStore_TestingSupport__purgeDurableDataForKeyPrefix___block_invoke;
  v8[3] = &unk_1E555A650;
  v8[4] = self;
  id v9 = v4;
  dispatch_queue_t v10 = &v11;
  id v6 = v4;
  TIDispatchSync(database_queue, v8);
  LOBYTE(database_queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)database_queue;
}

void __69__TIUserModelDataStore_TestingSupport__purgeDurableDataForKeyPrefix___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isDatabaseValid])
  {
    *(void *)ppStmt = 0;
    int v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "DELETE FROM usermodeldurablerecords WHERE key LIKE ?", -1, (sqlite3_stmt **)ppStmt, 0);
    if (*(void *)ppStmt) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 0;
    }
    if (v3)
    {
      sqlite3_bind_text(*(sqlite3_stmt **)ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      int v5 = sqlite3_step(*(sqlite3_stmt **)ppStmt);
      BOOL v7 = v5 == 101 || v5 == 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
      sqlite3_finalize(*(sqlite3_stmt **)ppStmt);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v4 = IXADefaultLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIUserModelDataStore: Can't purge durable data because the database is invalid.", "-[TIUserModelDataStore(TestingSupport) purgeDurableDataForKeyPrefix:]_block_invoke");
      *(_DWORD *)ppStmt = 138412290;
      *(void *)&ppStmt[4] = v8;
      _os_log_error_impl(&dword_18D240000, v4, OS_LOG_TYPE_ERROR, "%@", ppStmt, 0xCu);
    }
  }
}

@end