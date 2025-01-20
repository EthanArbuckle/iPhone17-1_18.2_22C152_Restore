@interface PLDatabaseReader
- (PLDatabaseReader)initWithDatabaseFile:(id)a3;
- (id)performStatement:(sqlite3_stmt *)a3;
- (id)prepareStatementAndPerformWithString:(id)a3;
- (id)stringValueOfTable:(id)a3;
- (id)tableNamesFromDatabase;
- (sqlite3)dbConnection;
- (sqlite3)openDatabaseFile:(id)a3;
- (void)dealloc;
- (void)setDbConnection:(sqlite3 *)a3;
@end

@implementation PLDatabaseReader

- (sqlite3)openDatabaseFile:(id)a3
{
  ppDb = 0;
  if (sqlite3_open_v2((const char *)[a3 UTF8String], &ppDb, 6, 0))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "failed to open conn: %d\n");
  }
  else
  {
    errmsg = 0;
    if (!sqlite3_exec(ppDb, "PRAGMA cache_size = 50;", 0, 0, &errmsg)) {
      return ppDb;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "failed to set cache size to 50 x 4KB: %d");
  }
  return 0;
}

- (PLDatabaseReader)initWithDatabaseFile:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDatabaseReader;
  v5 = [(PLDatabaseReader *)&v9 init];
  if (v5)
  {
    if (!v4)
    {
      NSLog(&cfstr_InputDatabaseF.isa, 0);
      goto LABEL_9;
    }
    uint64_t v6 = sqlite3_initialize();
    if (v6)
    {
      NSLog(&cfstr_FailedToInitia.isa, v6);
LABEL_9:
      v7 = 0;
      goto LABEL_10;
    }
    v5->_dbConnection = [(PLDatabaseReader *)v5 openDatabaseFile:v4];
    if (![(PLDatabaseReader *)v5 dbConnection])
    {
      NSLog(&cfstr_FailToOpenConn.isa);
      goto LABEL_9;
    }
  }
  v7 = v5;
LABEL_10:

  return v7;
}

- (void)dealloc
{
  dbConnection = self->_dbConnection;
  if (dbConnection) {
    sqlite3_close(dbConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLDatabaseReader;
  [(PLDatabaseReader *)&v4 dealloc];
}

- (id)prepareStatementAndPerformWithString:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  int v5 = 5;
  while (1)
  {
    uint64_t v6 = [(PLDatabaseReader *)self dbConnection];
    id v7 = v4;
    if (!sqlite3_prepare_v2(v6, (const char *)[v7 UTF8String], -1, &ppStmt, 0)) {
      break;
    }
    if (!--v5)
    {
      v8 = sqlite3_errmsg([(PLDatabaseReader *)self dbConnection]);
      NSLog(&cfstr_ErrorPrepareSt.isa, v7, v8);
      objc_super v9 = 0;
      goto LABEL_6;
    }
  }
  objc_super v9 = [(PLDatabaseReader *)self performStatement:ppStmt];
LABEL_6:

  return v9;
}

- (id)performStatement:(sqlite3_stmt *)a3
{
  int v5 = [MEMORY[0x263EFF980] array];
  if (!a3 || ![(PLDatabaseReader *)self dbConnection])
  {
    NSLog(&cfstr_InvalidStateme.isa);
    id v20 = 0;
    goto LABEL_32;
  }
  int v6 = sqlite3_column_count(a3);
  id v7 = objc_opt_new();
  if (v6 < 1) {
    goto LABEL_31;
  }
  int v8 = 0;
  uint64_t v9 = v6;
  v22 = self;
  v23 = v5;
  while (1)
  {
    while (1)
    {
      uint64_t v10 = sqlite3_step(a3);
      uint64_t v11 = v10;
      if (!v10)
      {
LABEL_11:
        v13 = sqlite3_errmsg([(PLDatabaseReader *)self dbConnection]);
        NSLog(&cfstr_ErrorSqlite3St.isa, v11, v13);
LABEL_12:
        if (v8 > 4) {
          goto LABEL_31;
        }
        ++v8;
        goto LABEL_26;
      }
      if (v10 != 100) {
        break;
      }
      v14 = [MEMORY[0x263EFF980] array];
      for (uint64_t i = 0; i != v9; ++i)
      {
        if ([v7 count] == v9)
        {
          v16 = [v7 objectAtIndex:i];
        }
        else
        {
          v16 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(a3, i));
          [v7 addObject:v16];
        }
        uint64_t v17 = sqlite3_column_type(a3, i);
        switch((int)v17)
        {
          case 1:
            uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(a3, i));
            break;
          case 2:
            uint64_t v18 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(a3, i));
            break;
          case 3:
            uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a3, i));
            break;
          case 5:
            goto LABEL_23;
          default:
            NSLog(&cfstr_SqliteUnknownD.isa, v17);
LABEL_23:
            uint64_t v18 = [MEMORY[0x263EFF9D0] null];
            break;
        }
        v19 = (void *)v18;
        [v14 addObject:v18];
      }
      int v5 = v23;
      [v23 addObject:v14];

      int v8 = 0;
      self = v22;
LABEL_26:
      if (v11 != 5 && v11 != 100) {
        goto LABEL_31;
      }
    }
    if (v10 == 101) {
      goto LABEL_12;
    }
    v12 = sqlite3_errmsg([(PLDatabaseReader *)self dbConnection]);
    NSLog(&cfstr_ReturncodeS.isa, v12);
    if (v11 != 5) {
      goto LABEL_11;
    }
    if (v8 > 4) {
      break;
    }
    ++v8;
    sqlite3_sleep(10);
  }
  NSLog(&cfstr_DatabaseBusy.isa);
LABEL_31:

  id v20 = v5;
LABEL_32:

  return v20;
}

- (id)tableNamesFromDatabase
{
  v2 = [(PLDatabaseReader *)self prepareStatementAndPerformWithString:@"SELECT name FROM sqlite_master WHERE type = 'table' AND name LIKE \"%PL%\""];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] array];
    id v4 = (char *)[v2 count];
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        int v6 = [v2 objectAtIndexedSubscript:i];
        id v7 = [v6 objectAtIndexedSubscript:0];
        [v3 addObject:v7];
      }
      id v4 = v3;
    }
    else
    {
      NSLog(&cfstr_NoTableDefined.isa);
    }
  }
  else
  {
    NSLog(&cfstr_FailToQueryTab.isa);
    id v4 = 0;
  }

  return v4;
}

- (id)stringValueOfTable:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = [MEMORY[0x263F089D8] string];
    id v31 = v4;
    v30 = [NSString stringWithFormat:@"PRAGMA table_info('%@');", v4];
    int v6 = -[PLDatabaseReader prepareStatementAndPerformWithString:](self, "prepareStatementAndPerformWithString:");
    id v7 = [MEMORY[0x263EFF980] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v40 + 1) + 8 * i) objectAtIndexedSubscript:1];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v10);
    }

    v32 = v7;
    uint64_t v14 = [v7 count];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = 0;
      uint64_t v17 = v14 - 1;
      do
      {
        if (!v16) {
          objc_msgSend(v5, "appendString:", @"(");
        }
        uint64_t v18 = [v32 objectAtIndexedSubscript:v16];
        [v5 appendString:v18];

        if (v17 == v16) {
          v19 = @"");
        }
        else {
          v19 = @",";
        }
        [v5 appendString:v19];
        ++v16;
      }
      while (v15 != v16);
    }
    id v4 = v31;
    id v20 = [NSString stringWithFormat:@"SELECT * FROM '%@';", v31];
    v21 = [(PLDatabaseReader *)self prepareStatementAndPerformWithString:v20];
    if ([v21 count])
    {
      v28 = v21;
      v29 = v20;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      obuint64_t j = v21;
      uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v35)
      {
        uint64_t v34 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v37 != v34) {
              objc_enumerationMutation(obj);
            }
            if (v15)
            {
              uint64_t v23 = 0;
              v24 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              do
              {
                if (!v23) {
                  objc_msgSend(v5, "appendString:", @"(");
                }
                v25 = [v24 objectAtIndexedSubscript:v23];
                [v5 appendFormat:@"%@", v25];

                if (v15 - 1 == v23) {
                  v26 = @"");
                }
                else {
                  v26 = @",";
                }
                [v5 appendString:v26];
                ++v23;
              }
              while (v15 != v23);
            }
          }
          uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v35);
      }

      id v4 = v31;
      v21 = v28;
      id v20 = v29;
    }
  }
  else
  {
    NSLog(&cfstr_InvalidTableNa.isa);
    int v5 = 0;
  }

  return v5;
}

- (sqlite3)dbConnection
{
  return self->_dbConnection;
}

- (void)setDbConnection:(sqlite3 *)a3
{
  self->_dbConnection = a3;
}

@end