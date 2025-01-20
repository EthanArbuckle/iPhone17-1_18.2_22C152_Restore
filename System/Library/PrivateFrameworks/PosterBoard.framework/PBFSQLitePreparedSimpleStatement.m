@interface PBFSQLitePreparedSimpleStatement
@end

@implementation PBFSQLitePreparedSimpleStatement

uint64_t __44___PBFSQLitePreparedSimpleStatement_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

void __80___PBFSQLitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24));
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        uint64_t v10 = *(void *)(a1 + 32);
        v11 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9, (void)v18);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -[_PBFSQLitePreparedSimpleStatement _bindKey:value:](v10, v9, v11);

        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v30 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    do
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32)
                                                                                                  + 24));
      int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v12 == 100)
      {
        if (*(void *)(a1 + 48))
        {
          v13 = +[PBFSQLiteResultRow resultRowWithStatement:]((uint64_t)PBFSQLiteResultRow, *(void *)(*(void *)(a1 + 32) + 24));
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          [v13 invalidate];

          int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        }
        else
        {
          int v12 = 100;
        }
      }
    }
    while (v12 == 100);
    if (v12 != 101)
    {
      int v14 = sqlite3_extended_errcode(a2);
      v15 = [*(id *)(a1 + 32) loggingCategory];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = sqlite3_errstr(v14);
        v17 = sqlite3_sql(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24));
        *(_DWORD *)buf = 136315906;
        v23 = "-[_PBFSQLitePreparedSimpleStatement executeWithBindings:resultRowHandler:error:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = v14;
        __int16 v26 = 2080;
        v27 = v16;
        __int16 v28 = 2080;
        v29 = v17;
        _os_log_error_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_ERROR, "%s: received extended error %d (%s) executing statement '%s'", buf, 0x26u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32)
                                                                                                 + 24));
  }
}

@end