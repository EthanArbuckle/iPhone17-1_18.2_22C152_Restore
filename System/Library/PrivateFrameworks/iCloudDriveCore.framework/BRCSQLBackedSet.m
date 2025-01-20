@interface BRCSQLBackedSet
+ (id)_databaseRootDirectory;
+ (id)createSetOfClass:(Class)a3 withSQLType:(id)a4 error:(id *)a5;
+ (id)createStringsSetWithError:(id *)a3;
+ (void)clearTempDatabases;
- (BOOL)_createSchemaForSQLType:(id)a3 error:(id *)a4;
- (BOOL)addObject:(id)a3 error:(id *)a4;
- (id)description;
- (id)initArrayOfClass:(Class)a3 withSQLType:(id)a4 error:(id *)a5;
- (unint64_t)count;
- (void)_closeDB;
- (void)dealloc;
- (void)enumerateObjectsWithSortOrder:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation BRCSQLBackedSet

+ (id)createStringsSetWithError:(id *)a3
{
  uint64_t v4 = objc_opt_class();
  return +[BRCSQLBackedSet createSetOfClass:v4 withSQLType:@"text" error:a3];
}

+ (id)createSetOfClass:(Class)a3 withSQLType:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [[BRCSQLBackedSet alloc] initArrayOfClass:a3 withSQLType:v7 error:a5];

  return v8;
}

+ (void)clearTempDatabases
{
  id v3 = +[BRCSQLBackedSet _databaseRootDirectory];
  v2 = [v3 path];
  BRCRemoveFolder(v2, 0, 1, 0);
}

+ (id)_databaseRootDirectory
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:*MEMORY[0x263F32390]])
  {
    uint64_t v4 = [MEMORY[0x263F325A0] cloudDocsAppSupportURL];
    [v4 URLByAppendingPathComponent:@"session/tmp"];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 temporaryDirectory];
  v5 = };

  return v5;
}

- (id)initArrayOfClass:(Class)a3 withSQLType:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)BRCSQLBackedSet;
  v9 = [(BRCSQLBackedSet *)&v45 init];
  p_isa = (id *)&v9->super.isa;
  if (!v9) {
    goto LABEL_21;
  }
  v9->_class = a3;
  v9->_count = 0;
  objc_initWeak(&location, v9);
  v11 = [BRCPQLConnection alloc];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke;
  v42[3] = &unk_26507F100;
  objc_copyWeak(&v43, &location);
  v12 = [(BRCPQLConnection *)v11 initWithLabel:@"BRCSQLBackedSet" dbCorruptionHandler:v42];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_13;
  v40[3] = &unk_265080FF0;
  objc_copyWeak(&v41, &location);
  [(BRCPQLConnection *)v12 setSqliteErrorHandler:v40];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_15;
  v38[3] = &unk_265080FF0;
  objc_copyWeak(&v39, &location);
  [(BRCPQLConnection *)v12 setAutoRollbackHandler:v38];
  v13 = +[BRCSQLBackedSet _databaseRootDirectory];
  v14 = objc_opt_new();
  uint64_t v15 = [v14 UUIDString];
  uint64_t v16 = [v13 URLByAppendingPathComponent:v15];
  id v17 = p_isa[2];
  p_isa[2] = (id)v16;

  v18 = [MEMORY[0x263F08850] defaultManager];
  id v19 = p_isa[2];
  id v37 = 0;
  LOBYTE(v15) = [v18 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v37];
  v20 = (char *)v37;

  if ((v15 & 1) == 0)
  {
    brc_bread_crumbs();
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      v33 = (const char *)p_isa[2];
      *(_DWORD *)buf = 138412802;
      v47 = v33;
      __int16 v48 = 2112;
      v49 = v20;
      __int16 v50 = 2112;
      v51 = v27;
      _os_log_error_impl(&dword_23FA42000, v28, (os_log_type_t)0x90u, "[ERROR] Failed creating root folder for DB: %@. %@%@", buf, 0x20u);
    }

    v21 = v20;
    if (v21)
    {
      v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        v34 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v47 = "-[BRCSQLBackedSet initArrayOfClass:withSQLType:error:]";
        __int16 v48 = 2080;
        if (!a5) {
          v34 = "(ignored by caller)";
        }
        v49 = v34;
        __int16 v50 = 2112;
        v51 = v21;
        __int16 v52 = 2112;
        v53 = v29;
        _os_log_error_impl(&dword_23FA42000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5)
    {
      v21 = v21;
      *a5 = v21;
    }
    v24 = v21;
    goto LABEL_18;
  }
  v21 = [p_isa[2] URLByAppendingPathComponent:@"db.db"];
  v22 = brc_bread_crumbs();
  v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRCSQLBackedSet initArrayOfClass:withSQLType:error:]();
  }

  v36 = v20;
  [(BRCPQLConnection *)v12 openAtURL:v21 withFlags:3145734 error:&v36];
  v24 = v36;

  if (v24)
  {
    v24 = v24;
    v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      v35 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v47 = "-[BRCSQLBackedSet initArrayOfClass:withSQLType:error:]";
      __int16 v48 = 2080;
      if (!a5) {
        v35 = "(ignored by caller)";
      }
      v49 = v35;
      __int16 v50 = 2112;
      v51 = v24;
      __int16 v52 = 2112;
      v53 = v25;
      _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a5) {
      *a5 = v24;
    }

    goto LABEL_18;
  }
  objc_storeStrong(p_isa + 1, v12);
  if ([p_isa _createSchemaForSQLType:v8 error:a5])
  {
    [(BRCPQLConnection *)v12 setSynchronousMode:1];
    [(BRCPQLConnection *)v12 useSerialQueue];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);

    objc_destroyWeak(&location);
LABEL_21:
    v31 = p_isa;
    goto LABEL_22;
  }
LABEL_18:

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&location);
  v31 = 0;
LABEL_22:

  return v31;
}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
    __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dbBecameCorrupted];
}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_error_impl(&dword_23FA42000, v9, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called - %@ (%@)%@", (uint8_t *)&v11, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dbBecameCorrupted];
}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_error_impl(&dword_23FA42000, v9, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called - %@ (%@)%@", (uint8_t *)&v11, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dbBecameCorrupted];
}

- (void)_closeDB
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_db;
  id v4 = v2->_dbRootFolder;
  db = v2->_db;
  v2->_db = 0;

  dbRootFolder = v2->_dbRootFolder;
  v2->_dbRootFolder = 0;

  objc_sync_exit(v2);
  if (v3)
  {
    id v7 = [(BRCPQLConnection *)v3 serialQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__BRCSQLBackedSet__closeDB__block_invoke;
    v8[3] = &unk_26507ED98;
    v9 = v3;
    v10 = v4;
    dispatch_async(v7, v8);
  }
}

void __27__BRCSQLBackedSet__closeDB__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) close:0];
  v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__BRCSQLBackedSet__closeDB__block_invoke_2;
  block[3] = &unk_26507ED70;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

void __27__BRCSQLBackedSet__closeDB__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) path];
  BRCRemoveFolder(v1, 0, 0, 0);
}

- (void)dealloc
{
  [(BRCSQLBackedSet *)self _closeDB];
  v3.receiver = self;
  v3.super_class = (Class)BRCSQLBackedSet;
  [(BRCSQLBackedSet *)&v3 dealloc];
}

- (BOOL)_createSchemaForSQLType:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F8C720];
  id v7 = a3;
  uint64_t v8 = [v7 UTF8String];
  uint64_t v9 = [v7 lengthOfBytesUsingEncoding:4];

  v10 = [v6 rawInjection:v8 length:v9];
  db = self->_db;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__BRCSQLBackedSet__createSchemaForSQLType_error___block_invoke;
  v19[3] = &unk_26507F2F8;
  id v12 = v10;
  id v20 = v12;
  char v13 = [(BRCPQLConnection *)db performWithFlags:8 action:v19];
  if (v13)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = [(BRCPQLConnection *)self->_db lastError];
    if (v14)
    {
      __int16 v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "-[BRCSQLBackedSet _createSchemaForSQLType:error:]";
        __int16 v23 = 2080;
        if (!a4) {
          v18 = "(ignored by caller)";
        }
        v24 = v18;
        __int16 v25 = 2112;
        id v26 = v14;
        __int16 v27 = 2112;
        v28 = v15;
        _os_log_error_impl(&dword_23FA42000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
  }
  if (a4) {
    *a4 = v14;
  }

  return v13;
}

uint64_t __49__BRCSQLBackedSet__createSchemaForSQLType_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 execute:@"CREATE TABLE array_items (item %@ PRIMARY KEY)", *(void *)(a1 + 32)];
}

- (BOOL)addObject:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    db = self->_db;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __35__BRCSQLBackedSet_addObject_error___block_invoke;
    v18 = &unk_265080760;
    id v19 = v6;
    id v20 = self;
    BOOL v9 = 1;
    LOBYTE(db) = [(BRCPQLConnection *)db performWithFlags:1 action:&v15];

    if (db) {
      goto LABEL_14;
    }
    id v10 = [(BRCPQLConnection *)self->_db lastError];
    if (v10)
    {
      int v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        char v13 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "-[BRCSQLBackedSet addObject:error:]";
        __int16 v23 = 2080;
        if (!a4) {
          char v13 = "(ignored by caller)";
        }
LABEL_17:
        v24 = v13;
        __int16 v25 = 2112;
        id v26 = v10;
        __int16 v27 = 2112;
        v28 = v11;
        _os_log_error_impl(&dword_23FA42000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"object", 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      int v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        char v13 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "-[BRCSQLBackedSet addObject:error:]";
        __int16 v23 = 2080;
        if (!a4) {
          char v13 = "(ignored by caller)";
        }
        goto LABEL_17;
      }
LABEL_10:
    }
  }
  if (a4)
  {
    id v10 = v10;
    *a4 = v10;
  }

  BOOL v9 = 0;
LABEL_14:

  return v9;
}

uint64_t __35__BRCSQLBackedSet_addObject_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 execute:@"INSERT OR IGNORE INTO array_items (item) VALUES (%@)", v3];
  uint64_t v6 = [v4 changes];

  *(void *)(*(void *)(a1 + 40) + 32) += v6;
  return v5;
}

- (void)enumerateObjectsWithSortOrder:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 3uLL:
      id v7 = (void *)MEMORY[0x263F8C720];
      uint64_t v8 = "ORDER BY item DESC";
      uint64_t v9 = 18;
      break;
    case 2uLL:
      id v7 = (void *)MEMORY[0x263F8C720];
      uint64_t v8 = "ORDER BY item ASC";
      uint64_t v9 = 17;
      break;
    case 1uLL:
      id v7 = (void *)MEMORY[0x263F8C720];
      uint64_t v8 = "ORDER BY rowid";
      uint64_t v9 = 14;
      break;
    default:
      id v10 = 0;
      goto LABEL_9;
  }
  id v10 = [v7 rawInjection:v8 length:v9];
LABEL_9:
  db = self->_db;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__BRCSQLBackedSet_enumerateObjectsWithSortOrder_usingBlock___block_invoke;
  v14[3] = &unk_26507EE88;
  v14[4] = self;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  [(BRCPQLConnection *)db performWithFlags:1 action:v14];
}

uint64_t __60__BRCSQLBackedSet_enumerateObjectsWithSortOrder_usingBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[*(id *)(a1[4] + 8) fetch:@"SELECT item FROM array_items %@", a1[5]];
  while ([v4 next])
  {
    uint64_t v5 = (void *)MEMORY[0x2455D97F0]();
    id v6 = [v4 objectOfClass:*(void *)(a1[4] + 24) atIndex:0];
    (*(void (**)(void))(a1[6] + 16))();
  }
  [v4 close];

  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ count:%lu>", objc_opt_class(), self->_count];
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbRootFolder, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)initArrayOfClass:withSQLType:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening db at: %@%@", v1, 0x16u);
}

void __54__BRCSQLBackedSet_initArrayOfClass_withSQLType_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] db corruption handler called: %@%@", v1, 0x16u);
}

@end