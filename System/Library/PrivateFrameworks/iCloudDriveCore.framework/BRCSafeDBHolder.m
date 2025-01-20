@interface BRCSafeDBHolder
+ (id)newSafeDBHolder:(id)a3 withDatabaseURL:(id)a4;
- (BOOL)closeWithError:(id *)a3;
- (BRCPQLConnection)db;
- (void)asyncClose;
- (void)asyncCloseWithCompletionHandler:(id)a3;
- (void)closeDatabaseSynchronously:(BOOL)a3 dispatchToSerialQueue:(BOOL)a4 completionHandler:(id)a5;
- (void)dealloc;
@end

@implementation BRCSafeDBHolder

+ (id)newSafeDBHolder:(id)a3 withDatabaseURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v9 = objc_alloc_init(BRCSafeDBHolder);
    objc_storeStrong((id *)&v9->_db, a3);
    objc_storeStrong((id *)&v9->_databaseURL, a4);
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218498;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] <BRCSafeDBHolder %p> - Creating for db in path: %@%@", (uint8_t *)&v13, 0x20u);
    }
  }
  return v9;
}

- (void)closeDatabaseSynchronously:(BOOL)a3 dispatchToSerialQueue:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v10 = v9->_db;
  db = v9->_db;
  v9->_db = 0;

  objc_sync_exit(v9);
  if (v10)
  {
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"<BRCSafeDBHolder %p>", v9);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke;
    v18[3] = &unk_26507F918;
    id v13 = v12;
    id v19 = v13;
    v14 = v10;
    v20 = v14;
    id v21 = v8;
    uint64_t v15 = MEMORY[0x2455D9A50](v18);
    v16 = (void *)v15;
    if (v6)
    {
      if (!v5)
      {
        (*(void (**)(uint64_t))(v15 + 16))(v15);
        goto LABEL_10;
      }
      __int16 v17 = [(BRCPQLConnection *)v14 serialQueue];
      dispatch_sync(v17, v16);
    }
    else
    {
      __int16 v17 = [(BRCPQLConnection *)v14 serialQueue];
      dispatch_async(v17, v16);
    }

LABEL_10:
    goto LABEL_11;
  }
  if (v8) {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
LABEL_11:
}

void __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_2((uint64_t)a1);
  }

  v4 = (void *)a1[5];
  id v11 = 0;
  char v5 = objc_msgSend(v4, "brc_closeWithError:", &v11);
  id v6 = v11;
  if (v5)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_1((uint64_t)a1);
    }
  }
  else
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = v7;
      _os_log_fault_impl(&dword_23FA42000, v8, OS_LOG_TYPE_FAULT, "[CRIT] %@ - Error closing BRCPendingChangesStream DB connection: %@%@", buf, 0x20u);
    }
  }

  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__4;
  __int16 v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__BRCSafeDBHolder_closeWithError___block_invoke;
  v9[3] = &unk_26507F8C8;
  v9[4] = &v10;
  [(BRCSafeDBHolder *)self closeDatabaseSynchronously:1 dispatchToSerialQueue:0 completionHandler:v9];
  id v4 = (id)v11[5];
  if (v4)
  {
    char v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      id v8 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      __int16 v17 = "-[BRCSafeDBHolder closeWithError:]";
      __int16 v18 = 2080;
      if (!a3) {
        id v8 = "(ignored by caller)";
      }
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v4;
      __int16 v22 = 2112;
      v23 = v5;
      _os_log_error_impl(&dword_23FA42000, v6, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a3) {
    *a3 = v4;
  }

  _Block_object_dispose(&v10, 8);
  return v4 == 0;
}

void __34__BRCSafeDBHolder_closeWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (void)asyncClose
{
}

- (void)asyncCloseWithCompletionHandler:(id)a3
{
}

- (void)dealloc
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] <BRCSafeDBHolder %p> - dealloc called%@", (void)v3, DWORD2(v3));
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

void __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ - Database closed%@", (void)v3, DWORD2(v3));
}

void __86__BRCSafeDBHolder_closeDatabaseSynchronously_dispatchToSerialQueue_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ - Closing the database%@", (void)v3, DWORD2(v3));
}

@end