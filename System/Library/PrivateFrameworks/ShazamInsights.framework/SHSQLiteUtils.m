@interface SHSQLiteUtils
+ (BOOL)closeDatabase:(sqlite3 *)a3 error:(id *)a4;
+ (BOOL)createDatabase:(sqlite3 *)a3 atURL:(id)a4 error:(id *)a5;
+ (BOOL)database:(sqlite3 *)a3 hasPopulatedTable:(id)a4 error:(id *)a5;
+ (BOOL)defenseAgainstBadDatabase:(sqlite3 *)a3;
+ (BOOL)openDatabase:(sqlite3 *)a3 atURL:(id)a4 error:(id *)a5;
+ (BOOL)runNoResultSQL:(id)a3 onDatabase:(sqlite3 *)a4 error:(id *)a5;
+ (BOOL)runSQL:(id)a3 onDatabase:(sqlite3 *)a4 replacingTokens:(id)a5 withObjects:(id)a6 rowHandler:(id)a7 error:(id *)a8;
+ (id)queryStringForCount:(unint64_t)a3;
+ (void)commitTransactionOnDatabase:(sqlite3 *)a3;
+ (void)startTransactionOnDatabase:(sqlite3 *)a3;
@end

@implementation SHSQLiteUtils

+ (BOOL)createDatabase:(sqlite3 *)a3 atURL:(id)a4 error:(id *)a5
{
  id v8 = [a4 absoluteString];
  int v9 = sqlite3_open((const char *)[v8 cStringUsingEncoding:4], a3);

  if (v9)
  {
    sh_databaseErrorToNSError(*a3, 200, a5);
    +[SHSQLiteUtils closeDatabase:*a3 error:0];
    BOOL result = 0;
    *a3 = 0;
  }
  else if ([a1 defenseAgainstBadDatabase:*a3])
  {
    return 1;
  }
  else
  {
    +[SHSQLiteUtils closeDatabase:*a3 error:0];
    return 0;
  }
  return result;
}

+ (BOOL)openDatabase:(sqlite3 *)a3 atURL:(id)a4 error:(id *)a5
{
  id v8 = [a4 absoluteString];
  int v9 = sqlite3_open_v2((const char *)[v8 cStringUsingEncoding:4], a3, 1, 0);

  if (v9)
  {
    sh_databaseErrorToNSError(*a3, 200, a5);
    +[SHSQLiteUtils closeDatabase:*a3 error:0];
    BOOL v10 = 0;
    *a3 = 0;
  }
  else
  {
    BOOL v10 = 1;
    sqlite3_create_collation(*a3, (const char *)[SHInsightsCustomCollation cStringUsingEncoding:4], 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))sh_CaseDiacriticInsensitiveCollation);
    if (([a1 defenseAgainstBadDatabase:*a3] & 1) == 0)
    {
      +[SHSQLiteUtils closeDatabase:*a3 error:0];
      return 0;
    }
  }
  return v10;
}

+ (BOOL)defenseAgainstBadDatabase:(sqlite3 *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sqlite3_db_config(a3, 1003, 0, 0);
  sqlite3_db_config(a3, 1015, 0, 0);
  id v16 = 0;
  char v5 = [a1 runNoResultSQL:@"PRAGMA cell_size_check=ON" onDatabase:a3 error:&v16];
  id v6 = v16;
  v7 = v6;
  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    id v14 = v6;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__SHSQLiteUtils_defenseAgainstBadDatabase___block_invoke;
    v15[3] = &unk_2647AD160;
    v15[4] = &buf;
    int v8 = [a1 runSQL:@"PRAGMA quick_check" onDatabase:a3 replacingTokens:MEMORY[0x263EFFA68] withObjects:MEMORY[0x263EFFA68] rowHandler:v15 error:&v14];
    id v9 = v14;

    if (v8 && *(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      BOOL v10 = 1;
    }
    else
    {
      v12 = shcore_log_object();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v17 = 138412290;
        id v18 = v9;
        _os_log_impl(&dword_2266BF000, v12, OS_LOG_TYPE_ERROR, "Failed to run quick check %@", v17, 0xCu);
      }

      BOOL v10 = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = shcore_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_2266BF000, v11, OS_LOG_TYPE_ERROR, "Failed to turn on cell_size_check %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v10 = 0;
    id v9 = v7;
  }

  return v10;
}

void __43__SHSQLiteUtils_defenseAgainstBadDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sh_columnToText(a2, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 isEqualToString:@"ok"];
}

+ (BOOL)closeDatabase:(sqlite3 *)a3 error:(id *)a4
{
  sqlite3_close(a3);
  if (a3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a4 == 0;
  }
  BOOL v7 = v6;
  if (!v6)
  {
    *a4 = +[SHInsightsError errorWithCode:201 underlyingError:0];
  }
  return v7;
}

+ (BOOL)runNoResultSQL:(id)a3 onDatabase:(sqlite3 *)a4 error:(id *)a5
{
  return [a1 runSQL:a3 onDatabase:a4 replacingTokens:MEMORY[0x263EFFA68] withObjects:MEMORY[0x263EFFA68] rowHandler:&__block_literal_global_0 error:a5];
}

+ (BOOL)runSQL:(id)a3 onDatabase:(sqlite3 *)a4 replacingTokens:(id)a5 withObjects:(id)a6 rowHandler:(id)a7 error:(id *)a8
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v42 = (void (**)(id, sqlite3_stmt *))a7;
  id v16 = (void *)[v13 mutableCopy];
  if ([v14 count])
  {
    unint64_t v17 = 0;
    do
    {
      id v18 = [v14 objectAtIndexedSubscript:v17];
      v19 = [v15 objectAtIndexedSubscript:v17];
      uint64_t v20 = objc_msgSend(a1, "queryStringForCount:", objc_msgSend(v19, "count"));
      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", v18, v20, 0, 0, objc_msgSend(v16, "length"));

      ++v17;
    }
    while ([v14 count] > v17);
  }
  ppStmt = 0;
  id v21 = v16;
  uint64_t v22 = a4;
  if (sqlite3_prepare_v2(a4, (const char *)[v21 cStringUsingEncoding:4], -1, &ppStmt, 0)) {
    goto LABEL_25;
  }
  id v38 = v21;
  v39 = a8;
  id v41 = v14;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v40 = v15;
  id obj = v15;
  uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    int v25 = 0;
    uint64_t v26 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v50 != v26) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v46;
          do
          {
            uint64_t v33 = 0;
            int v34 = v25;
            do
            {
              if (*(void *)v46 != v32) {
                objc_enumerationMutation(v29);
              }
              sqlite3_bind_text(ppStmt, v25 + v33 + 1, (const char *)[*(id *)(*((void *)&v45 + 1) + 8 * v33) cStringUsingEncoding:4], -1, 0);
              ++v33;
            }
            while (v31 != v33);
            uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v54 count:16];
            v25 += v33;
          }
          while (v31);
          int v25 = v34 + v33;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v24);
  }

  id v14 = v41;
  id v21 = v38;
  a8 = v39;
  while (1)
  {
    int v35 = sqlite3_step(ppStmt);
    if (v35 != 100) {
      break;
    }
    v42[2](v42, ppStmt);
  }
  id v15 = v40;
  uint64_t v22 = a4;
  if (v35 != 101)
  {
LABEL_25:
    sh_databaseErrorToNSError(v22, 201, a8);
    BOOL v36 = 0;
  }
  else
  {
    BOOL v36 = 1;
  }
  sqlite3_finalize(ppStmt);

  return v36;
}

+ (BOOL)database:(sqlite3 *)a3 hasPopulatedTable:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v9 = [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SHSQLiteUtils_database_hasPopulatedTable_error___block_invoke;
  v11[3] = &unk_2647AD160;
  v11[4] = &v12;
  [a1 runSQL:v9 onDatabase:a3 replacingTokens:MEMORY[0x263EFFA68] withObjects:MEMORY[0x263EFFA68] rowHandler:v11 error:a5];
  LOBYTE(a5) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)a5;
}

uint64_t __50__SHSQLiteUtils_database_hasPopulatedTable_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)result > 0;
  return result;
}

+ (id)queryStringForCount:(unint64_t)a3
{
  v4 = [MEMORY[0x263F089D8] string];
  if (a3)
  {
    uint64_t v5 = 0;
    do
    {
      if (v5) {
        BOOL v6 = @", ?";
      }
      else {
        BOOL v6 = @"?";
      }
      [v4 appendString:v6];
      ++v5;
    }
    while (a3 != v5);
  }
  return v4;
}

+ (void)startTransactionOnDatabase:(sqlite3 *)a3
{
}

+ (void)commitTransactionOnDatabase:(sqlite3 *)a3
{
}

@end