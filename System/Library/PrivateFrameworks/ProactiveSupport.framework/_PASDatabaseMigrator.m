@interface _PASDatabaseMigrator
- (BOOL)_allContextsAtVersionZeroWithContexts:(id)a3;
- (BOOL)_anyContextHasFutureVersionWithContexts:(id)a3;
- (BOOL)_anyContextHasMismatchedVersionWithContexts:(id)a3;
- (BOOL)_canContinueMigratingWithContexts:(id)a3;
- (BOOL)_migrationNeededWithContexts:(id)a3 toVersion:(unsigned int)a4;
- (BOOL)migrationNeeded;
- (_PASDatabaseMigrator)initWithMigrationObjects:(id)a3;
- (id)_contextForMigrationObject:(id)a3;
- (id)description;
- (unsigned)_clearDatabase:(id)a3;
- (unsigned)_migrateDatabasesWithContexts:(id)a3 toVersion:(unsigned int)a4;
- (unsigned)_migrateOneStepToVersion:(unsigned int)a3 contexts:(id)a4;
- (unsigned)_runQueries:(id)a3 nextVersion:(unsigned int)a4 context:(id)a5;
- (unsigned)_runQuery:(id)a3 context:(id)a4 database:(id)a5;
- (unsigned)_skipFromZeroSchemaWithContexts:(id)a3;
- (unsigned)_unmigrateDatabasesWithContexts:(id)a3;
- (unsigned)migrateDatabases;
- (unsigned)migrateDatabasesToVersion:(unsigned int)a3;
- (unsigned)unmigrateDatabases;
- (void)_prepareContexts:(id)a3;
@end

@implementation _PASDatabaseMigrator

- (void).cxx_destruct
{
}

- (unsigned)_clearDatabase:(id)a3
{
  id v5 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39___PASDatabaseMigrator__clearDatabase___block_invoke;
  v8[3] = &unk_1E5AEAF08;
  id v6 = v5;
  v11 = &v13;
  SEL v12 = a2;
  id v9 = v6;
  v10 = self;
  [v6 writeTransaction:v8];
  LOBYTE(a2) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return a2;
}

- (void)_prepareContexts:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1A62450A0](v4);
        *(_DWORD *)(v8 + 24) = objc_msgSend(*(id *)(v8 + 16), "userVersion", (void)v10);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

- (unsigned)_runQuery:(id)a3 context:(id)a4 database:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSString *)a3;
  uint64_t v8 = (id *)a4;
  id v9 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 4;
  long long v10 = MEMORY[0x1E4F14500];
  id v11 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = [v9 filename];
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "migrator for %@ running query: %@", buf, 0x16u);
  }
  SEL v12 = NSSelectorFromString(v7);
  if (v12)
  {
    if (objc_opt_respondsToSelector())
    {
      LOBYTE(v12) = ((uint64_t (*)(id, SEL))[v8[1] methodForSelector:v12])(v8[1], v12);
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51___PASDatabaseMigrator__runQuery_context_database___block_invoke;
      v15[3] = &unk_1E5AEAC60;
      id v16 = v9;
      v17 = v7;
      v18 = &v19;
      [v16 prepAndRunQuery:v17 onPrep:0 onRow:0 onError:v15];
      LOBYTE(v12) = *((unsigned char *)v20 + 24);
    }
  }
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (unsigned)_runQueries:(id)a3 nextVersion:(unsigned int)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = (void *)v9[2];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56___PASDatabaseMigrator__runQueries_nextVersion_context___block_invoke;
  v14[3] = &unk_1E5AEAC38;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  unsigned int v18 = a4;
  id v11 = v9;
  id v12 = v8;
  LODWORD(v10) = [v10 frailWriteTransaction:v14];

  if (v10) {
    return 4;
  }
  else {
    return 2;
  }
}

- (unsigned)_migrateOneStepToVersion:(unsigned int)a3 contexts:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v38;
    uint64_t v10 = v4;
    int v11 = v4 - 1;
    while (2)
    {
      id v12 = v5;
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v12);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v15 = (void *)MEMORY[0x1A62450A0]();
        int v16 = *(_DWORD *)(v14 + 24);
        if (v16 != v11)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v43 = v14;
            __int16 v44 = 1024;
            int v45 = v16;
            __int16 v46 = 1024;
            int v47 = v10;
            _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "attempt to skip or repeat migration: %@ (%u != %u - 1)", buf, 0x18u);
          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
            abort();
          }
          id v5 = v12;
          unsigned __int8 v20 = 3;
LABEL_16:
          goto LABEL_17;
        }
        id v17 = *(void **)(v14 + 32);
        unsigned int v18 = [NSNumber numberWithUnsignedInt:v10];
        uint64_t v19 = [v17 objectForKeyedSubscript:v18];

        if (!v19) {
          ++v8;
        }
      }
      id v5 = v12;
      uint64_t v7 = [v12 countByEnumeratingWithState:&v37 objects:v48 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = v4;
    uint64_t v8 = 0;
  }

  if (v8 == [v5 count])
  {
    unsigned __int8 v20 = 1;
  }
  else if (v8)
  {
    unsigned __int8 v20 = 5;
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v5;
    uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          id v15 = (void *)MEMORY[0x1A62450A0]();
          uint64_t v27 = *(void **)(v26 + 32);
          v28 = [NSNumber numberWithUnsignedInt:v10];
          v29 = [v27 objectForKeyedSubscript:v28];
          int v30 = [(_PASDatabaseMigrator *)self _runQueries:v29 nextVersion:v10 context:v26];

          if (v30 != 4)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = v26;
              _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to migrate context %@", buf, 0xCu);
            }
            unsigned __int8 v20 = 2;
            goto LABEL_16;
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        unsigned __int8 v20 = 4;
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      unsigned __int8 v20 = 4;
    }
LABEL_17:
  }
  return v20;
}

- (BOOL)_allContextsAtVersionZeroWithContexts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1A62450A0](v4);
        LODWORD(v8) = *(_DWORD *)(v8 + 24);
        if (v8)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)_anyContextHasMismatchedVersionWithContexts:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  int v5 = v4[6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        long long v12 = (void *)MEMORY[0x1A62450A0](v7);
        long long v13 = v12;
        int v14 = *(_DWORD *)(v11 + 24);
        if (v14 != v5)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = *(void *)(v11 + 16);
            *(_DWORD *)buf = 67109634;
            int v22 = v5;
            __int16 v23 = 1024;
            int v24 = v14;
            __int16 v25 = 2112;
            uint64_t v26 = v15;
            _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "mismatched version (%u != %u) detected on %@", buf, 0x18u);
          }
          LOBYTE(v8) = 1;
          goto LABEL_13;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v8;
}

- (BOOL)_anyContextHasFutureVersionWithContexts:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1A62450A0](v4);
        unint64_t v10 = *(unsigned int *)(v8 + 24);
        if (objc_msgSend(*(id *)(v8 + 32), "count", (void)v14) < v10)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v11 = *(_DWORD *)(v8 + 24);
            uint64_t v12 = *(void *)(v8 + 16);
            *(_DWORD *)buf = 67109378;
            int v19 = v11;
            __int16 v20 = 2112;
            uint64_t v21 = v12;
            _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "future version (%u) detected on %@", buf, 0x12u);
          }
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

- (unsigned)_skipFromZeroSchemaWithContexts:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    SEL v18 = a2;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = MEMORY[0x1E4F14500];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1A62450A0]();
        int v19 = 0;
        long long v13 = [*(id *)(v11 + 8) queriesToSkipFromEmptyToVersion:&v19];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v13 count];
          *(_DWORD *)buf = 134218498;
          uint64_t v25 = v14;
          __int16 v26 = 2112;
          uint64_t v27 = v11;
          __int16 v28 = 1024;
          int v29 = v19;
          _os_log_impl(&dword_1A32C4000, v9, OS_LOG_TYPE_INFO, "%tu skip queries for %@ jump to version %u", buf, 0x1Cu);
        }
        if (v19
          && -[_PASDatabaseMigrator _runQueries:nextVersion:context:](self, "_runQueries:nextVersion:context:", v13) == 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v11;
            _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to migrate using skip queries: %@", buf, 0xCu);
          }
          long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:v18, self, @"_PASDatabaseMigrator.m", 275, @"failed to migrate using skip queries: %@", v11 object file lineNumber description];

          unsigned __int8 v15 = 2;
          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v15 = 4;
LABEL_16:

  return v15;
}

- (BOOL)_canContinueMigratingWithContexts:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!+[_PASDeviceState isUnlocked])
  {
    if (+[_PASDeviceState isClassCLocked])
    {
      long long v24 = 0uLL;
      long long v25 = 0uLL;
      long long v22 = 0uLL;
      long long v23 = 0uLL;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v23;
LABEL_6:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
          if (+[_PASSqliteDatabase contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:](_PASSqliteDatabase, "contentProtectionTypeRequiresDeviceToHaveBeenUnlockedOnce:", objc_msgSend(*(id *)(v10 + 16), "contentProtectionType", (void)v22)))
          {
            break;
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
            BOOL v4 = 1;
            if (v7) {
              goto LABEL_6;
            }
            goto LABEL_28;
          }
        }
        BOOL v4 = 0;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        uint64_t v17 = *(void *)(v10 + 16);
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v17;
        SEL v18 = MEMORY[0x1E4F14500];
        int v19 = "Migrations cannot continue due to content protection of %@ and device having never been unlocked.";
LABEL_27:
        _os_log_impl(&dword_1A32C4000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
        BOOL v4 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      long long v28 = 0uLL;
      long long v29 = 0uLL;
      long long v26 = 0uLL;
      long long v27 = 0uLL;
      id v11 = v3;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
LABEL_15:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
          if (+[_PASSqliteDatabase contentProtectionTypeRequiresDeviceToBeUnlocked:](_PASSqliteDatabase, "contentProtectionTypeRequiresDeviceToBeUnlocked:", [*(id *)(v16 + 16) contentProtectionType]))
          {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
            BOOL v4 = 1;
            if (v13) {
              goto LABEL_15;
            }
            goto LABEL_28;
          }
        }
        BOOL v4 = 0;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        uint64_t v20 = *(void *)(v16 + 16);
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v20;
        SEL v18 = MEMORY[0x1E4F14500];
        int v19 = "Migrations cannot continue due to content protection of %@ and device being locked.";
        goto LABEL_27;
      }
    }
    BOOL v4 = 1;
LABEL_28:

    goto LABEL_29;
  }
  BOOL v4 = 1;
LABEL_29:

  return v4;
}

- (BOOL)_migrationNeededWithContexts:(id)a3 toVersion:(unsigned int)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(_PASDatabaseMigrator *)self _prepareContexts:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1A62450A0](v8);
        uint64_t v14 = *(unsigned int *)(v12 + 24);
        uint64_t v15 = a4;
        if (a4 == -1) {
          uint64_t v15 = objc_msgSend(*(id *)(v12 + 32), "count", (void)v18);
        }
        if (v15 != v14)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v12;
            _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "migration needed: %@", buf, 0xCu);
          }
          BOOL v16 = 1;
          goto LABEL_15;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (unsigned)_unmigrateDatabasesWithContexts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_PASDatabaseMigrator *)self _prepareContexts:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1A62450A0](v6);
        if (-[_PASDatabaseMigrator _clearDatabase:](self, "_clearDatabase:", *(void *)(v10 + 16), (void)v14) == 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v10;
            _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to clear db: %@", buf, 0xCu);
          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
            abort();
          }
          unsigned __int8 v12 = 2;
          goto LABEL_14;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v12 = 1;
LABEL_14:

  return v12;
}

- (unsigned)_migrateDatabasesWithContexts:(id)a3 toVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_1A32C4000, "_PASDatabaseMigrator migrateDatabases", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASDatabaseMigrator migrateDatabases called", buf, 2u);
  }
  [(_PASDatabaseMigrator *)self _prepareContexts:v6];
  if ([(_PASDatabaseMigrator *)self _anyContextHasFutureVersionWithContexts:v6])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Future database version detected. Giving up on migration.", buf, 2u);
    }
    LOBYTE(v8) = 3;
    goto LABEL_41;
  }
  if ([(_PASDatabaseMigrator *)self _anyContextHasMismatchedVersionWithContexts:v6])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Mismatched database versions detected. Giving up on migration.", buf, 2u);
    }
    LOBYTE(v8) = 5;
    goto LABEL_41;
  }
  if (v4 != -1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (!v10) {
      goto LABEL_21;
    }
    uint64_t v11 = *(void *)v30;
LABEL_14:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
      if ([*(id *)(v13 + 32) count] < (unint64_t)v4) {
        break;
      }
      if (*(_DWORD *)(v13 + 24) > v4)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_WORD *)buf = 0;
        uint64_t v23 = MEMORY[0x1E4F14500];
        long long v24 = "Requested migration to a specific version which is less than the current version";
        goto LABEL_43;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v40 count:16];
        if (v10) {
          goto LABEL_14;
        }
LABEL_21:

LABEL_24:
        long long v15 = MEMORY[0x1E4F14500];
        *(void *)&long long v14 = 138412802;
        long long v28 = v14;
        while (1)
        {
          if (!-[_PASDatabaseMigrator _migrationNeededWithContexts:toVersion:](self, "_migrationNeededWithContexts:toVersion:", v6, v4, v28, (void)v29))
          {
            LOBYTE(v8) = 1;
            goto LABEL_36;
          }
          BOOL v16 = [(_PASDatabaseMigrator *)self _canContinueMigratingWithContexts:v6];
          long long v17 = v15;
          if (!v16) {
            break;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            long long v18 = [v6 objectAtIndexedSubscript:0];
            int v19 = v18[6];
            long long v20 = [v6 objectAtIndexedSubscript:0];
            int v21 = v20[6] + 1;
            *(_DWORD *)buf = v28;
            long long v35 = self;
            __int16 v36 = 1024;
            int v37 = v19;
            __int16 v38 = 1024;
            int v39 = v21;
            _os_log_impl(&dword_1A32C4000, v15, OS_LOG_TYPE_INFO, "_PASDatabaseMigrator: %@ migrating %u -> %u", buf, 0x18u);
          }
          long long v22 = [v6 objectAtIndexedSubscript:0];
          int v8 = [(_PASDatabaseMigrator *)self _migrateOneStepToVersion:(v22[6] + 1) contexts:v6];

          if (v8 != 4) {
            goto LABEL_36;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [v6 objectAtIndexedSubscript:0];
          int v26 = v25[6];
          *(_DWORD *)buf = 67109120;
          LODWORD(v35) = v26;
          _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "database migration bailing out at version %u.", buf, 8u);
        }
        LOBYTE(v8) = 0;
        goto LABEL_41;
      }
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      LOBYTE(v8) = 2;
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = MEMORY[0x1E4F14500];
    long long v24 = "Requested migration to a specific version which exceeds the migration step count";
LABEL_43:
    _os_log_error_impl(&dword_1A32C4000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_34;
  }
  if (![(_PASDatabaseMigrator *)self _allContextsAtVersionZeroWithContexts:v6])goto LABEL_24; {
  int v8 = [(_PASDatabaseMigrator *)self _skipFromZeroSchemaWithContexts:v6];
  }
  if (v8 == 4) {
    goto LABEL_24;
  }
LABEL_36:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v35 = self;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASDatabaseMigrator: %@: done migrating", buf, 0xCu);
  }
LABEL_41:
  os_activity_scope_leave(&state);

  return v8;
}

- (id)_contextForMigrationObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  objc_storeStrong((id *)(v7 + 8), a3);
  uint64_t v8 = [v6 databaseHandle];
  id v9 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v8;

  if (!*(void *)(v7 + 16))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to get database handle from %@", buf, 0xCu);
      if (*(void *)(v7 + 16)) {
        goto LABEL_9;
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASDatabaseMigrator.m", 126, @"failed to get database handle from %@", v6 object file lineNumber description];
    goto LABEL_8;
  }
  uint64_t v10 = [v6 migrations];
  uint64_t v11 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v10;

  if (*(void *)(v7 + 32))
  {
    *(_DWORD *)(v7 + 24) = [*(id *)(v7 + 16) userVersion];
    id v12 = (id)v7;
    goto LABEL_10;
  }
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
    || (*(_DWORD *)buf = 138412290,
        id v16 = v6,
        _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to get migrations from %@", buf, 0xCu), !*(void *)(v7 + 32)))
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASDatabaseMigrator.m", 133, @"failed to get migrations from %@", v6 object file lineNumber description];
LABEL_8:
  }
LABEL_9:
  id v12 = 0;
LABEL_10:

  return v12;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithString:@"<_PASDatabaseMigrator: "];
  contexts = self->_contexts;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35___PASDatabaseMigrator_description__block_invoke;
  v8[3] = &unk_1E5AEAC10;
  id v9 = v3;
  id v5 = v3;
  [(_PASLock *)contexts runWithLockAcquired:v8];
  id v6 = [v5 stringByAppendingString:@">"];

  return v6;
}

- (BOOL)migrationNeeded
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  contexts = self->_contexts;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39___PASDatabaseMigrator_migrationNeeded__block_invoke;
  v5[3] = &unk_1E5AEABE8;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)contexts runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)unmigrateDatabases
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  contexts = self->_contexts;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___PASDatabaseMigrator_unmigrateDatabases__block_invoke;
  v5[3] = &unk_1E5AEABE8;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)contexts runWithLockAcquired:v5];
  unsigned __int8 v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)migrateDatabasesToVersion:(unsigned int)a3
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  contexts = self->_contexts;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50___PASDatabaseMigrator_migrateDatabasesToVersion___block_invoke;
  v6[3] = &unk_1E5AEABC0;
  v6[4] = self;
  v6[5] = &v8;
  unsigned int v7 = a3;
  [(_PASLock *)contexts runWithLockAcquired:v6];
  unsigned __int8 v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unsigned)migrateDatabases
{
  return [(_PASDatabaseMigrator *)self migrateDatabasesToVersion:0xFFFFFFFFLL];
}

- (_PASDatabaseMigrator)initWithMigrationObjects:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_PASDatabaseMigrator;
  id v5 = [(_PASDatabaseMigrator *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
          uint64_t v13 = (void *)MEMORY[0x1A62450A0](v8);
          uint64_t v14 = -[_PASDatabaseMigrator _contextForMigrationObject:](v5, "_contextForMigrationObject:", v12, (void)v20);
          if (!v14)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v12;
              _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "could not create context for migration %@", buf, 0xCu);
            }

            long long v18 = 0;
            goto LABEL_15;
          }
          long long v15 = (void *)v14;
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
        uint64_t v9 = v8;
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v16 = [[_PASLock alloc] initWithGuardedData:v6];
    contexts = v5->_contexts;
    v5->_contexts = v16;
  }
  long long v18 = v5;
LABEL_15:

  return v18;
}

@end