@interface PASDatabaseJournal
@end

@implementation PASDatabaseJournal

uint64_t __37___PASDatabaseJournal_stopJournaling__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  *(unsigned char *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

uint64_t __38___PASDatabaseJournal_startJournaling__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40) ^ 1;
  *(unsigned char *)(*(void *)(result + 32) + 40) = 1;
  return result;
}

void __48___PASDatabaseJournal_deleteAllJournaledQueries__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v8 = *(void **)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Removing all journal files at %@", buf, 0xCu);
  }
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v10 = 0;
  [v2 removeItemAtPath:v3 error:&v10];
  id v4 = v10;

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to remove journal directory: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
  id v9 = v4;
  [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v7 = v9;

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to re-create directory for storing journals: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _closeCurrentFile];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [*(id *)(a1 + 40) filename];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Executing queries from journals to %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  sel_getName(*(SEL *)(a1 + 56));
  v2 = (void *)os_transaction_create();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke_61;
  v8[3] = &unk_1E5AEAEE0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v10 = &v19;
  v8[4] = v4;
  uint64_t v5 = *(void *)(a1 + 48);
  v11 = &v15;
  uint64_t v12 = v5;
  uint64_t v13 = &v23;
  id v9 = v3;
  p_long long buf = &buf;
  [v9 writeTransaction:v8];

  while (1)
  {
    int v7 = *((_DWORD *)v24 + 6) + 1;
    *((_DWORD *)v24 + 6) = v7;
    if (v7 >= *((_DWORD *)v20 + 6)) {
      break;
    }
    free(*(void **)(v16[3] + 8 * v7));
  }
  free((void *)v16[3]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);
}

void __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke_61(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (const char *)[*(id *)(*(void *)(a1 + 32) + 16) UTF8String];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = scandir(v2, (dirent ***)(*(void *)(*(void *)(a1 + 56) + 8)+ 24), 0, MEMORY[0x1E4F14610]);
  if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = *__error();
      v14 = __error();
      uint64_t v15 = strerror(*v14);
      *(_DWORD *)long long buf = 67109378;
      int v18 = v13;
      __int16 v19 = 2080;
      v20 = v15;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to open journal directory: errno(%i): %s", buf, 0x12u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v4 >= *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return;
  }
  uint64_t v5 = MEMORY[0x1E4F14500];
  *(void *)&long long v3 = 67109120;
  long long v16 = v3;
  while (1)
  {
    uint64_t v6 = *(unsigned char **)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 8 * v4);
    if (v6[20] != 8)
    {
      free(v6);
      goto LABEL_14;
    }
    int v7 = (void *)[[NSString alloc] initWithUTF8String:v6 + 21];
    free(v6);
    v8 = (void *)MEMORY[0x1A62450A0]();
    buf[0] = 0;
    if (([*(id *)(a1 + 32) _executeFile:v7 onDb:*(void *)(a1 + 40) becameLocked:buf] & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    if (buf[0])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_20;
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
    int v10 = *(_DWORD *)(v9 + 24) + 1;
    *(_DWORD *)(v9 + 24) = v10;
    if ((v10 & 1) == 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)long long buf = v16;
        int v18 = v11;
        _os_log_debug_impl(&dword_1A32C4000, v5, OS_LOG_TYPE_DEBUG, "journal execution checking lock state after %u files", buf, 8u);
      }
      if (!+[_PASDeviceState isUnlocked]) {
        break;
      }
    }

LABEL_14:
    int v4 = ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v4 >= *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      return;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    *(_DWORD *)long long buf = v16;
    int v18 = v12;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "journal execution exiting early after %u files because device is locked", buf, 8u);
  }
LABEL_20:
}

uint64_t __79___PASDatabaseJournal__executeNextRecordFromFile_onDb_becameLocked_deleteFile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"__query"];
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal error when replaying query: %@: %@", (uint8_t *)&v7, 0x16u);
  }
  if (_sqliteErrorIndicatesDeviceBecameLocked(v3))
  {
    **(unsigned char **)(a1 + 40) = 0;
    int v4 = *(unsigned char **)(a1 + 48);
    if (v4) {
      *int v4 = 1;
    }
  }

  return 0;
}

void __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) substringToIndex:6];
  id v3 = [v2 lowercaseString];
  int v4 = [v3 isEqualToString:@"select"];

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "skipping select query", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    uint64_t v6 = (void *)MEMORY[0x1A62450A0]([v5 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"__query"]);
    id v17 = 0;
    int v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v17];
    id v8 = v17;
    if (v7)
    {
      __int16 v9 = [*(id *)(a1 + 48) _getCurrentFile];
      [v9 write:v7];

      if (*(unsigned char *)(*(void *)(a1 + 48) + 40))
      {
        [*(id *)(a1 + 48) _addCurrentFileToLog];
      }
      else
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v19 = 0x2020000000;
        char v20 = 1;
        id v10 = *(void **)(a1 + 56);
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = +[_PASDatabaseJournal _binderForDictionary:*(void *)(a1 + 40)];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_30;
        v14[3] = &unk_1E5AEB758;
        id v15 = *(id *)(a1 + 32);
        p_long long buf = &buf;
        [v10 prepAndRunQuery:v11 onPrep:v12 onRow:0 onError:v14];

        int v13 = *(void **)(a1 + 48);
        if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
          [v13 _clearCurrentFile];
        }
        else {
          [v13 _addCurrentFileToLog];
        }

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error archiving: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

uint64_t __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_33(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

uint64_t __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal error when immediately running query: %@: %@", (uint8_t *)&v6, 0x16u);
  }
  if (_sqliteErrorIndicatesDeviceBecameLocked(v3)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }

  return 0;
}

void __44___PASDatabaseJournal__binderForDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44___PASDatabaseJournal__binderForDictionary___block_invoke_2;
  v6[3] = &unk_1E5AEAE68;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __44___PASDatabaseJournal__binderForDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 isEqualToString:@"__query"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"qmarksSeparatedByCommas"])
    {
      id v19 = v6;
      id v20 = v5;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v8) {
        goto LABEL_15;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      int v11 = 1;
      while (1)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          int v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v14 = v11 + 1;
            sqlite3_bind_int64((sqlite3_stmt *)[*(id *)(a1 + 32) stmt], v11, objc_msgSend(v13, "longLongValue"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            int v14 = v11 + 1;
            _PAS_sqlite3_bind_nsstring((sqlite3_stmt *)[*(id *)(a1 + 32) stmt], v11, v13);
          }
          int v11 = v14;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v9)
        {
LABEL_15:

          id v6 = v19;
          id v5 = v20;
          goto LABEL_21;
        }
      }
    }
    id v15 = [MEMORY[0x1E4F1CA98] null];

    if (v15 == v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "bindNamedParamToNull:", objc_msgSend(v5, "UTF8String"));
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v17 = *(void **)(a1 + 32);
      uint64_t v18 = [v5 UTF8String];
      if (isKindOfClass) {
        objc_msgSend(v17, "bindNamedParam:toInteger:", v18, objc_msgSend(v6, "longValue"));
      }
      else {
        [v17 bindNamedParam:v18 toNSString:v6];
      }
    }
  }
LABEL_21:
}

@end