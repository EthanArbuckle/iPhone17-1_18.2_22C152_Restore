@interface PASSqliteDatabase
@end

@implementation PASSqliteDatabase

void __45___PASSqliteDatabase_runQuery_onRow_onError___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  char v3 = 0;
  int v4 = 50;
  do
  {
    while (1)
    {
      while (1)
      {
        uint64_t v5 = sqlite3_step((sqlite3_stmt *)[*(id *)(a1 + 32) stmt]);
        if ((v3 & 1) == 0) {
          [*(id *)(a1 + 32) prepareToRunQuery];
        }
        int v6 = v5;
        if (v5 > 0x63u) {
          break;
        }
        if (v5 == 5)
        {
          if ((v4 & 0x80000000) == 0) {
            goto LABEL_21;
          }
        }
        else
        {
          if (v5 != 6) {
            goto LABEL_14;
          }
          if (v4 >= 1)
          {
            usleep(0x186A0u);
            goto LABEL_21;
          }
        }
        v10 = *(void **)(a1 + 40);
        v11 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_sql((sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "stmt")));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v10 handleError:4 sqliteError:v5 forQuery:v11 onError:0];

LABEL_21:
        --v4;
        char v3 = 1;
      }
      if (v5 != 100) {
        break;
      }
      char v3 = 1;
      if (*(void *)(a1 + 48))
      {
        v7 = (void *)MEMORY[0x1A62450A0]();
        [*(id *)(a1 + 32) prepareForRowDeserialization];
        if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))())
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          goto LABEL_28;
        }
      }
    }
    if (v5 == 101) {
      break;
    }
LABEL_14:
    v8 = (char *)sqlite3_sql((sqlite3_stmt *)[*(id *)(a1 + 32) stmt]);
    if (v8) {
      v8 = (char *)[[NSString alloc] initWithUTF8String:v8];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) handleError:4 sqliteError:v5 forQuery:v8 onError:*(void *)(a1 + 56)];
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

    if (!v9) {
      goto LABEL_28;
    }
    char v3 = 1;
  }
  while ((v6 - 5) < 2);
  [v2 timeIntervalSinceNow];
  double v13 = v12;
  if (v12 < -0.5 && os_variant_has_internal_diagnostics())
  {
    v14 = sqlite3_sql((sqlite3_stmt *)[*(id *)(a1 + 32) stmt]);
    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v15)
      {
        v16 = *(sqlite3 **)(*(void *)(a1 + 40) + 8);
        v17 = [NSString stringWithUTF8String:v14];
        v18 = getQueryPlan(v16, v17);
        int v19 = 134218498;
        double v20 = v13 * -1000.0;
        __int16 v21 = 2080;
        v22 = v14;
        __int16 v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Slow query (%0.2f ms): %s\n%@", (uint8_t *)&v19, 0x20u);
      }
    }
    else if (v15)
    {
      int v19 = 134217984;
      double v20 = v13 * -1000.0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Slow query (%0.2f ms) -- unknown SQL", (uint8_t *)&v19, 0xCu);
    }
  }
LABEL_28:
}

void __47___PASSqliteDatabase_prepQuery_onPrep_onError___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _prepareForFirstQuery];
  [*(id *)(a1 + 32) _logQueryPlanForQuery:*(void *)(a1 + 40)];
  id v42 = 0;
  ppStmt = 0;
  v2 = (const char *)[*(id *)(a1 + 40) UTF8String];
  if (!v2)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"_PASSqliteDatabase.m", 1211, @"query string %@ is not Unicode", *(void *)(a1 + 40) object file lineNumber description];

    goto LABEL_3;
  }
  if ((-[_PASSqliteStatementCache checkOutStatement:associatedObject:withSQL:](*(void *)(*(void *)(a1 + 32) + 144), &ppStmt, &v42, v2) & 1) == 0)
  {
LABEL_3:
    *(void *)pzTail = 0;
    char v3 = *(sqlite3 **)(*(void *)(a1 + 32) + 8);
    if (!v3)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      v38 = objc_msgSend(NSString, "stringWithUTF8String:", "int sqlite3_prepare_v2_nolock(sqlite3 *, const char *, int, sqlite3_stmt **, const char **)");
      [v37 handleFailureInFunction:v38, @"_PASSqliteDatabase.m", 1148, @"Invalid parameter not satisfying: %@", @"db" file lineNumber description];
    }
    uint32_t v4 = 10;
    uint64_t v5 = MEMORY[0x1E4F14500];
    while (1)
    {
      uint64_t v6 = sqlite3_prepare_v2(v3, v2, -1, &ppStmt, (const char **)pzTail);
      if (v6 != 6) {
        break;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1A32C4000, v5, OS_LOG_TYPE_DEBUG, "Sqlite database locked. Backing off and retrying prepare statement.", buf, 2u);
      }
      useconds_t v7 = arc4random_uniform(v4);
      usleep(v7);
      v4 <<= v4 >> 5 < 0x271;
    }
    v8 = *(void **)(a1 + 32);
    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v8 handleError:3 sqliteError:v6 forQuery:*(void *)(a1 + 40) onError:*(void *)(a1 + 48)];
    }
    else if ([v8 _isLikelySQLStatementContainedInString:*(void *)pzTail])
    {
      if (ppStmt)
      {
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
      }
      int v9 = (void *)[[NSString alloc] initWithFormat:@"_PASSqliteDatabase rejected query containing multiple statements: %@", *(void *)(a1 + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) handleError:3 sqliteError:21 forQuery:v9 onError:*(void *)(a1 + 48)];
    }
  }
  if (!ppStmt)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = *(void *)(a1 + 40);
      v40 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      *(_DWORD *)pzTail = 138412546;
      *(void *)&pzTail[4] = v39;
      __int16 v46 = 2080;
      v47 = v40;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to prepare sql statement '%@': %s", pzTail, 0x16u);
    }
    v11 = 0;
    goto LABEL_43;
  }
  v10 = [_PASSqliteStatement alloc];
  v11 = [(_PASSqliteStatement *)v10 initWithStatementPointer:ppStmt columnMapping:v42];
  double v12 = (void *)MEMORY[0x1A62450A0]();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 144);
  v14 = ppStmt;
  id v41 = [(_PASSqliteStatement *)v11 columnMapping];
  if (!v13) {
    goto LABEL_42;
  }
  int v15 = -[_PASSqliteStatementCache crc32ForStatement:](v14);
  v16 = v11;
  uint64_t v17 = 0;
  int v18 = 0;
  uint64_t v19 = v13 + 8;
  double v20 = (char *)(v13 + 12);
  int v21 = -1;
  do
  {
    unsigned int v22 = *v20;
    if (*((_DWORD *)v20 - 1) == v15)
    {
      if (v22 <= 0xF7) {
        char v23 = -9;
      }
      else {
        char v23 = *v20;
      }
      *double v20 = v22 + ~v23;
      int v21 = v17;
    }
    else
    {
      if (*v20)
      {
        if (v22 == 9)
        {
          -[_PASSqliteStatementCache evictCachedStatementForScoreSlot:](v13, v17);
          LOBYTE(v22) = *v20;
        }
        LOBYTE(v22) = v22 - 1;
        *double v20 = v22;
      }
      if (*(unsigned __int8 *)(v19 + 8 * v18 + 4) > v22) {
        int v18 = v17;
      }
    }
    ++v17;
    v20 += 8;
  }
  while (v17 != 32);
  if (v21 == -1)
  {
    -[_PASSqliteStatementCache evictCachedStatementForScoreSlot:](v13, v18);
    v11 = v16;
    uint64_t v29 = v19 + 8 * v18;
    *(_DWORD *)uint64_t v29 = v15;
    *(unsigned char *)(v29 + 4) = 8;
    goto LABEL_42;
  }
  v11 = v16;
  if (*(unsigned __int8 *)(v19 + 8 * v21 + 4) < 9u)
  {
LABEL_42:

    sqlite3_finalize(ppStmt);
    goto LABEL_43;
  }
  uint64_t v24 = 0;
  int v25 = *(_DWORD *)(v19 + 8 * v21);
  uint64_t v26 = v13 + 264;
  while (1)
  {
    v27 = *(sqlite3_stmt **)(v26 + 8 * v24);
    if (v27)
    {
      if (-[_PASSqliteStatementCache crc32ForStatement:](v27) == v25) {
        break;
      }
    }
    if (++v24 == 8) {
      goto LABEL_37;
    }
  }
  if (v24 != -1)
  {
    sqlite3_finalize(*(sqlite3_stmt **)(v26 + 8 * (int)v24));
    uint64_t v30 = v13 + 8 * (int)v24;
    v31 = *(const void **)(v30 + 328);
    if (v31) {
      CFRelease(v31);
    }
    sqlite3_reset(v14);
    sqlite3_clear_bindings(v14);
    v32 = (void *)(v30 + 328);
    *(void *)(v26 + 8 * (int)v24) = v14;
    v33 = v41;
    id v34 = v41;
    goto LABEL_49;
  }
LABEL_37:
  uint64_t v28 = 0;
  while (*(void *)(v26 + 8 * v28))
  {
    if (++v28 == 8) {
      goto LABEL_42;
    }
  }
  sqlite3_reset(v14);
  sqlite3_clear_bindings(v14);
  *(void *)(v26 + 8 * v28) = v14;
  v33 = v41;
  id v35 = v41;
  v32 = (void *)(v13 + 8 * v28 + 328);
LABEL_49:
  void *v32 = v33;

LABEL_43:
}

void __44___PASSqliteDatabase__logQueryPlanForQuery___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 136))
  {
    char v3 = [*(id *)(v1 + 128) objectForKey:*(void *)(a1 + 40)];

    if (!v3)
    {
      [*(id *)(*(void *)(a1 + 32) + 128) setObject:MEMORY[0x1E4F1CC38] forKey:*(void *)(a1 + 40)];
      getQueryPlan(*(sqlite3 **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint32_t v4 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:v9];

      if (!v4)
      {
        [*(id *)(*(void *)(a1 + 32) + 120) setObject:*(void *)(a1 + 40) forKeyedSubscript:v9];
        fprintf(*(FILE **)(*(void *)(a1 + 32) + 136), "EXPLAIN QUERY PLAN\n%s\n\n%s\n\n", (const char *)[*(id *)(a1 + 40) UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
        uint64_t v5 = [MEMORY[0x1E4F29060] callStackSymbols];
        if ([v5 count])
        {
          unint64_t v6 = 0;
          do
          {
            useconds_t v7 = *(FILE **)(*(void *)(a1 + 32) + 136);
            id v8 = [v5 objectAtIndexedSubscript:v6];
            fprintf(v7, "%s\n", (const char *)[v8 UTF8String]);

            ++v6;
          }
          while ([v5 count] > v6);
        }
        fwrite("\n\n----------\n\n", 0xEuLL, 1uLL, *(FILE **)(*(void *)(a1 + 32) + 136));
      }
      MEMORY[0x1F41817F8]();
    }
  }
}

void __59___PASSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    id v3 = v5;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) runQuery:v3 onRow:*(void *)(a1 + 48) onError:*(void *)(a1 + 56)];
}

void __62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 16);
  if (v3 <= 0)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      [(id)v2 _txnBeginExclusive];
      char v5 = 1;
    }
    else
    {
      [(id)v2 _txnBegin];
      char v5 = 0;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 112) = v5;
    *(unsigned char *)(*(void *)(a1 + 32) + 20) = 0;
  }
  else if (*(unsigned char *)(a1 + 64) && !*(unsigned char *)(v2 + 112))
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"_PASSqliteDatabase.m" lineNumber:1483 description:@"Read transaction now wants to write"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke_2;
  v10[3] = &unk_1E5AEBE98;
  v10[4] = *(void *)(a1 + 32);
  unint64_t v6 = (void (**)(void))MEMORY[0x1A6245320](v10);
  ++*(_DWORD *)(*(void *)(a1 + 32) + 16);
  useconds_t v7 = (void *)MEMORY[0x1A62450A0]();
  char v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)) {
    v6[2](v6);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v3 <= 0 && !*(unsigned char *)(v9 + 20))
  {
    [(id)v9 _txnEnd];
    uint64_t v9 = *(void *)(a1 + 32);
  }
  --*(_DWORD *)(v9 + 16);
}

uint64_t __43___PASSqliteDatabase_frailReadTransaction___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __38___PASSqliteDatabase_readTransaction___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __44___PASSqliteDatabase_frailWriteTransaction___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __39___PASSqliteDatabase_writeTransaction___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __45___PASSqliteDatabase_disableQueryPlanLogging__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 136))
  {
    uint64_t v2 = result;
    int v3 = *(void **)(v1 + 120);
    *(void *)(v1 + 120) = 0;

    uint64_t v4 = *(void *)(v2 + 32);
    char v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;

    result = fclose(*(FILE **)(*(void *)(v2 + 32) + 136));
    *(void *)(*(void *)(v2 + 32) + 136) = 0;
  }
  return result;
}

void __53___PASSqliteDatabase_enableQueryPlanLoggingWithPath___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) disableQueryPlanLogging];
  uint64_t v2 = *(void **)(a1 + 40);
  int v3 = objc_opt_new();
  uint64_t v4 = [v3 UUIDString];
  char v5 = [v2 stringByAppendingPathExtension:v4];

  unint64_t v6 = (const std::__fs::filesystem::path *)[*(id *)(a1 + 40) fileSystemRepresentation];
  id v7 = v5;
  char v8 = (const std::__fs::filesystem::path *)[v7 fileSystemRepresentation];
  rename(v6, v8, v9);
  if (v10)
  {
    if (*__error() != 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      double v12 = __error();
      uint64_t v13 = strerror(*v12);
      int v14 = *__error();
      int v28 = 138413058;
      uint64_t v29 = v11;
      __int16 v30 = 2112;
      v31 = (char *)v7;
      __int16 v32 = 2080;
      v33 = v13;
      __int16 v34 = 1024;
      int v35 = v14;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to rename stale EXPLAIN QUERY PLAN logfile \"%@\" --> \"%@\": %s (%d)", (uint8_t *)&v28, 0x26u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 40);
    int v28 = 138412546;
    uint64_t v29 = v15;
    __int16 v30 = 2112;
    v31 = (char *)v7;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "To avoid overwrite, renaming stale EXPLAIN QUERY PLAN logfile \"%@\" --> \"%@\"", (uint8_t *)&v28, 0x16u);
  }
  *(void *)(*(void *)(a1 + 32) + 136) = fopen((const char *)[*(id *)(a1 + 40) fileSystemRepresentation], "w");
  v16 = *(FILE **)(*(void *)(a1 + 32) + 136);
  if (v16)
  {
    setlinebuf(v16);
    uint64_t v17 = objc_opt_new();
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(v18 + 120);
    *(void *)(v18 + 120) = v17;

    uint64_t v20 = objc_opt_new();
    uint64_t v21 = *(void *)(a1 + 32);
    unsigned int v22 = *(void **)(v21 + 128);
    *(void *)(v21 + 128) = v20;

    [*(id *)(*(void *)(a1 + 32) + 128) setCountLimit:100];
    char v23 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      int v25 = __error();
      uint64_t v26 = strerror(*v25);
      int v27 = *__error();
      int v28 = 138412802;
      uint64_t v29 = v24;
      __int16 v30 = 2080;
      v31 = v26;
      __int16 v32 = 1024;
      LODWORD(v33) = v27;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to open EXPLAIN QUERY PLAN logfile \"%@\": %s (%d)", (uint8_t *)&v28, 0x1Cu);
    }
    char v23 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23;
}

uint64_t __42___PASSqliteDatabase_languageForFTSTable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":table" toNSString:*(void *)(a1 + 32)];
}

uint64_t __42___PASSqliteDatabase_languageForFTSTable___block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = _PAS_sqlite3_column_nsstring((sqlite3_stmt *)[a2 stmt], 0);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    v16 = v3;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "languageForFTSTable: sql: %@", (uint8_t *)&v15, 0xCu);
  }
  id v4 = v3;
  uint64_t v5 = [v4 rangeOfString:@"language=\"" options:2];
  if (v6
    && (uint64_t v7 = v5 + v6,
        uint64_t v8 = objc_msgSend(v4, "rangeOfString:options:range:", @"\", 2, v7, objc_msgSend(v4, "length"") - v7),
        v9))
  {
    uint64_t v10 = objc_msgSend(v4, "substringWithRange:", v7, v8 - v7);
  }
  else
  {
    uint64_t v10 = 0;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v15 = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "languageForFTSTable: language: %@", (uint8_t *)&v15, 0xCu);
  }

  return 1;
}

uint64_t __42___PASSqliteDatabase_languageForFTSTable___block_invoke_269(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error during languageForFTSTable: %@", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

uint64_t __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke(uint64_t a1, id a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64((sqlite3_stmt *)[a2 stmt], 0);
  return 1;
}

uint64_t __42___PASSqliteDatabase_numberOfRowsInTable___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase unable to count rows in table %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return 1;
}

uint64_t __36___PASSqliteDatabase_hasIndexNamed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNonnullNSString:*(void *)(a1 + 32)];
}

uint64_t __36___PASSqliteDatabase_hasIndexNamed___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

uint64_t __45___PASSqliteDatabase_hasColumnOnTable_named___block_invoke(uint64_t a1, id a2)
{
  uint64_t v3 = 1;
  int v4 = _PAS_sqlite3_column_nsstring((sqlite3_stmt *)[a2 stmt], 1);
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke(uint64_t a1, id a2)
{
  id v3 = a2;
  int v4 = (sqlite3_stmt *)[v3 stmt];
  uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%%(%@ %%"), *(void *)(a1 + 32);
  _PAS_sqlite3_bind_nsstring(v4, 1, v5);

  id v6 = v3;
  uint64_t v7 = (sqlite3_stmt *)[v6 stmt];

  id v8 = (id)[[NSString alloc] initWithFormat:@"%%,%@ %%", *(void *)(a1 + 32)];
  _PAS_sqlite3_bind_nsstring(v7, 2, v8);
}

uint64_t __44___PASSqliteDatabase_tablesWithColumnNamed___block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = _PAS_sqlite3_column_nsstring((sqlite3_stmt *)[a2 stmt], 0);
  if (v3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get table name containing column '%@'", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

uint64_t __36___PASSqliteDatabase_hasTableNamed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNonnullNSString:*(void *)(a1 + 32)];
}

uint64_t __36___PASSqliteDatabase_hasTableNamed___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

uint64_t __37___PASSqliteDatabase_setUserVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase unable to set pragma user_version to %u: %@", (uint8_t *)v6, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;

  return 1;
}

uint64_t __33___PASSqliteDatabase_userVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = sqlite3_column_int((sqlite3_stmt *)[v3 stmt], 0);
  if (v4 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "_PASSqliteDatabase read negative pragma user_version: %d", (uint8_t *)v6, 8u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;

  return 1;
}

uint64_t __33___PASSqliteDatabase_userVersion__block_invoke_232(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase unable to read pragma user_version: %@", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

void __37___PASSqliteDatabase_createSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sqlite3_backup_init(*(sqlite3 **)(a1 + 64), "main", *(sqlite3 **)(*(void *)(a1 + 32) + 8), "main");
  if (v2)
  {
    id v3 = v2;
    do
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_backup_step(v3, -1);
      unsigned int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    while (v4 <= 6 && ((1 << v4) & 0x61) != 0);
    if (v4 != 101)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Sqlite3 backup failed.", (uint8_t *)&v8, 2u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_backup_finish(v3);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      char v6 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Sqlite3 backup finish failed.", (uint8_t *)&v8, 2u);
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = 138412290;
        uint64_t v9 = v7;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Sqlite3 backup saved to \"%@\".", (uint8_t *)&v8, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to initialize sqlite3 backup.", (uint8_t *)&v8, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

unsigned char *__62___PASSqliteDatabase__transactionWithExclusivity_transaction___block_invoke_2(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[20])
  {
    result = (unsigned char *)[result _txnRollback];
    *(unsigned char *)(*(void *)(a1 + 32) + 20) = 1;
  }
  return result;
}

uint64_t __73___PASSqliteDatabase_selectColumns_fromTable_whereClause_onPrep_onError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned int v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v21;
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        id v11 = v3;
        switch(sqlite3_column_type((sqlite3_stmt *)[v11 stmt], v7 + v9))
        {
          case 1:
            uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + (int)v9));
            goto LABEL_12;
          case 2:
            uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v11), "stmt"), v7 + (int)v9));
            goto LABEL_12;
          case 3:
            uint64_t v12 = _PAS_sqlite3_column_nsstring((sqlite3_stmt *)[v11 stmt], v7 + v9);
            goto LABEL_12;
          case 4:
            uint64_t v12 = _PAS_sqlite3_column_nsdata((sqlite3_stmt *)[v11 stmt], v7 + v9);
            goto LABEL_12;
          case 5:
            uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
LABEL_12:
            uint64_t v13 = (void *)v12;
            [v4 setObject:v12 forKeyedSubscript:v10];

            break;
          default:
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              int v14 = sqlite3_column_type((sqlite3_stmt *)[v11 stmt], v7 + v9);
              *(_DWORD *)buf = 67109120;
              int v25 = v14;
              _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected sqlite data type: %d", buf, 8u);
            }
            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v18, @"Unexpected sqlite data type: %d", sqlite3_column_type((sqlite3_stmt *)objc_msgSend(v11, "stmt"), v7 + v9));
            break;
        }
        ++v9;
      }
      while (v6 != v9);
      v7 += v9;
      uint64_t v15 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
      uint64_t v6 = v15;
    }
    while (v15);
  }

  [*(id *)(v17 + 40) addObject:v4];
  return 0;
}

void __66___PASSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v3 = 0;
    do
    {
      unsigned int v4 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
      uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
      int v7 = [MEMORY[0x1E4F1CA98] null];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        sqlite3_bind_null((sqlite3_stmt *)[v13 stmt], ++v3);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          _PAS_sqlite3_bind_nsstring((sqlite3_stmt *)[v13 stmt], ++v3, v6);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            _PAS_sqlite3_bind_nsdata((sqlite3_stmt *)[v13 stmt], ++v3, v6);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v13 bindParam:++v3 toNSNumber:v6];
            }
            else
            {
              if (![v6 conformsToProtocol:&unk_1EF685C18])
              {
                uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
                int v14 = @"type";
                uint64_t v10 = [(id)objc_opt_class() description];
                v15[0] = v10;
                id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
                id v12 = [v9 exceptionWithName:@"TypeError" reason:@"Could not insert this type into sqlite" userInfo:v11];

                objc_exception_throw(v12);
              }
              _PAS_sqlite3_bind_nssecurecoding((sqlite3_stmt *)[v13 stmt], ++v3, v6);
            }
          }
        }
      }
    }
    while ([*(id *)(a1 + 32) count] > v3);
  }
}

uint64_t __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_121(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __58___PASSqliteDatabase_vacuumWithShouldContinueBlock_error___block_invoke_125(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __41___PASSqliteDatabase_valueForPragmaName___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return 1;
}

uint64_t __41___PASSqliteDatabase_valueForPragmaName___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASSqliteDatabase: unable to fetch %@: %@", (uint8_t *)&v6, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;

  return 1;
}

sqlite3_int64 __37___PASSqliteDatabase_lastInsertRowId__block_invoke(uint64_t a1)
{
  sqlite3_int64 result = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43___PASSqliteDatabase__prepareForFirstQuery__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unable to set temp_store to MEMORY: %@", (uint8_t *)&v4, 0xCu);
  }
  return 1;
}

uint64_t __64___PASSqliteDatabase_initWithFilename_flags_error_errorHandler___block_invoke(uint64_t a1)
{
  sqlite3_close(*(sqlite3 **)(*(void *)(a1 + 32) + 8));

  return ITSCollationContextFreeContextForDatabaseHandle();
}

uint64_t __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __95___PASSqliteDatabase_initializeDatabase_withContentProtection_newDatabaseCreated_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return 1;
}

@end