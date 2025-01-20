@interface PASDatabaseMigrator
@end

@implementation PASDatabaseMigrator

void __39___PASDatabaseMigrator__clearDatabase___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = *(void **)(a1 + 32);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_2;
  v42[3] = &unk_1E5AEAC88;
  id v4 = v2;
  id v43 = v4;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_48;
  v37[3] = &unk_1E5AEACB0;
  uint64_t v40 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  uint64_t v41 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v38 = v5;
  uint64_t v39 = v6;
  [v3 prepAndRunQuery:@"SELECT name FROM sqlite_schema WHERE type='table' AND NOT name LIKE 'sqlite_%'" onPrep:0 onRow:v42 onError:v37];
  v7 = *(void **)(a1 + 32);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_55;
  v35[3] = &unk_1E5AEAC88;
  id v8 = v4;
  id v36 = v8;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_60;
  v30[3] = &unk_1E5AEACB0;
  uint64_t v33 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  uint64_t v34 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 40);
  id v31 = v9;
  uint64_t v32 = v10;
  [v7 prepAndRunQuery:@"PRAGMA table_list" onPrep:0 onRow:v35 onError:v30];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v14);
        v16 = *(void **)(a1 + 32);
        v17 = (void *)[[NSString alloc] initWithFormat:@"DROP TABLE IF EXISTS %@", v15];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke_64;
        v21[3] = &unk_1E5AEACD8;
        uint64_t v24 = *(void *)(a1 + 48);
        v21[4] = v15;
        id v18 = *(id *)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 56);
        uint64_t v19 = *(void *)(a1 + 40);
        id v22 = v18;
        uint64_t v23 = v19;
        [v16 prepAndRunQuery:v17 onPrep:0 onRow:0 onError:v21];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v44 count:16];
    }
    while (v12);
  }

  [*(id *)(a1 + 32) setUserVersion:0];
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnName:"name" table:0];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "sqlite_schema had a table with a NULL name", v6, 2u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }

  return 0;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_48(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    uint64_t v6 = a1[4];
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to clear database: %@ error: %@", buf, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1[7], a1[5], @"_PASDatabaseMigrator.m", 432, @"failed to clear database: %@ error: %@", a1[4], v3 object file lineNumber description];

  return 1;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSStringForColumnAlias:"type"];
  int v5 = [@"shadow" isEqual:v4];

  if (v5)
  {
    uint64_t v6 = [v3 getNSStringForColumnAlias:"name"];
    if (v6)
    {
      [*(id *)(a1 + 32) removeObject:v6];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "shadow table has nil table name in PRAGMA table_list", v8, 2u);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
    }
  }
  return 0;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_60(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    uint64_t v6 = a1[4];
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to clear database: %@ error: %@", buf, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1[7], a1[5], @"_PASDatabaseMigrator.m", 451, @"failed to clear database: %@ error: %@", a1[4], v3 object file lineNumber description];

  return 1;
}

uint64_t __39___PASDatabaseMigrator__clearDatabase___block_invoke_64(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    *(_DWORD *)buf = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to drop table '%@' from database: %@ error: %@", buf, 0x20u);
  }
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1[8], a1[6], @"_PASDatabaseMigrator.m", 463, @"failed to drop table '%@' from database: %@ error: %@", a1[4], a1[5], v3 object file lineNumber description];

  return 1;
}

uint64_t __51___PASDatabaseMigrator__runQuery_context_database___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = [*(id *)(a1 + 32) filename];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseMigrator encountered error during migration of db: %@ query: %@ error: %@", (uint8_t *)&v7, 0x20u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;

  return 1;
}

uint64_t __56___PASDatabaseMigrator__runQueries_nextVersion_context___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = (void *)MEMORY[0x1A62450A0](v3);
        LODWORD(v7) = objc_msgSend(*(id *)(a1 + 40), "_runQuery:context:database:", v7, *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 48) + 16), (void)v10);
        if (v7 != 4)
        {

          return 0;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 48) + 16) setUserVersion:*(unsigned int *)(a1 + 56)];
  *(_DWORD *)(*(void *)(a1 + 48) + 24) = *(_DWORD *)(a1 + 56);
  return 1;
}

void __35___PASDatabaseMigrator_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        __int16 v9 = (void *)MEMORY[0x1A62450A0](v4);
        long long v10 = *(void **)(a1 + 32);
        long long v11 = objc_msgSend(v8, "description", (void)v12);
        [v10 appendString:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

uint64_t __39___PASDatabaseMigrator_migrationNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _migrationNeededWithContexts:a2 toVersion:0xFFFFFFFFLL];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __42___PASDatabaseMigrator_unmigrateDatabases__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _unmigrateDatabasesWithContexts:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __50___PASDatabaseMigrator_migrateDatabasesToVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _migrateDatabasesWithContexts:a2 toVersion:*(unsigned int *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end