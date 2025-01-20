@interface MKApplicationDatabase
- (BOOL)_addAppStoreIdentifier:(id)a3;
- (BOOL)addIdentifier:(id)a3;
- (MKApplicationDatabase)init;
- (id)appStoreIdentifiers;
- (id)identifiers;
- (int64_t)countForAppStoreIdentifiers;
- (void)addAppStoreIdentifier:(id)a3;
- (void)addIdentifiers:(id)a3;
- (void)begin;
- (void)close;
- (void)commit;
- (void)create;
- (void)dealloc;
- (void)drop;
- (void)init;
- (void)open:(id)a3;
- (void)query:(id)a3;
- (void)rollback;
@end

@implementation MKApplicationDatabase

- (MKApplicationDatabase)init
{
  v13.receiver = self;
  v13.super_class = (Class)MKApplicationDatabase;
  v2 = [(MKApplicationDatabase *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_database = 0;
    v4 = [NSString stringWithFormat:@"/Library/MigrationKit/"];
    v5 = NSHomeDirectory();
    v6 = [v5 stringByAppendingPathComponent:v4];

    v7 = [MEMORY[0x263F08850] defaultManager];
    id v12 = 0;
    [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v8 = v12;

    if (v8)
    {
      v9 = +[MKLog log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(MKApplicationDatabase *)(uint64_t)v8 init];
      }
    }
    v10 = [v6 stringByAppendingPathComponent:@"application.db"];
    [(MKApplicationDatabase *)v3 open:v10];
  }
  return v3;
}

- (void)dealloc
{
  [(MKApplicationDatabase *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MKApplicationDatabase;
  [(MKApplicationDatabase *)&v3 dealloc];
}

- (void)open:(id)a3
{
  if (sqlite3_open((const char *)[a3 UTF8String], &self->_database))
  {
    v4 = +[MKLog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase open:]((uint64_t)self, v4);
    }
  }
  else
  {
    [(MKApplicationDatabase *)self create];
  }
}

- (void)close
{
  if (self->_database)
  {
    objc_super v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "will close application database.", v4, 2u);
    }

    sqlite3_close(self->_database);
    self->_database = 0;
  }
}

- (void)query:(id)a3
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_database, (const char *)[a3 UTF8String], -1, &ppStmt, 0))
  {
    objc_super v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      v4 = +[MKLog log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)begin
{
}

- (void)commit
{
}

- (void)rollback
{
}

- (void)create
{
  [(MKApplicationDatabase *)self query:@"CREATE TABLE IF NOT EXISTS identifiers (identifier TEXT DEFAULT '' NOT NULL);"];
  [(MKApplicationDatabase *)self query:@"CREATE TABLE IF NOT EXISTS applications (appstore_identifier TEXT DEFAULT '' NOT NULL);"];
}

- (void)drop
{
  [(MKApplicationDatabase *)self query:@"DROP TABLE IF EXISTS identifiers;"];
  [(MKApplicationDatabase *)self query:@"DROP TABLE IF EXISTS applications;"];
}

- (void)addIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(MKApplicationDatabase *)self begin];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      if (!-[MKApplicationDatabase addIdentifier:](self, "addIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * v9), (void)v10))break; {
      if (v7 == ++v9)
      }
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }

        [(MKApplicationDatabase *)self commit];
        goto LABEL_11;
      }
    }
  }

  [(MKApplicationDatabase *)self rollback];
LABEL_11:
}

- (BOOL)addIdentifier:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B028, "count"));
    if ([&unk_26DF7B028 count])
    {
      unint64_t v8 = 0;
      do
        [v7 setObject:@"?" atIndexedSubscript:v8++];
      while (v8 < [&unk_26DF7B028 count]);
    }
    uint64_t v9 = NSString;
    long long v10 = [&unk_26DF7B028 componentsJoinedByString:@","];
    long long v11 = [v7 componentsJoinedByString:@","];
    long long v12 = [v9 stringWithFormat:@"INSERT INTO identifiers (%@) VALUES (%@)", v10, v11];

    ppStmt = 0;
    long long v13 = *p_database;
    id v14 = v12;
    if (sqlite3_prepare(v13, (const char *)[v14 UTF8String], -1, &ppStmt, 0))
    {
      uint64_t v15 = +[MKLog log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }

      sqlite3_int64 insert_rowid = -1;
    }
    else
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
      if (sqlite3_step(ppStmt) == 101)
      {
        sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      }
      else
      {
        v18 = +[MKLog log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[MKApplicationDatabase addIdentifier:]();
        }

        sqlite3_int64 insert_rowid = -1;
      }
      sqlite3_finalize(ppStmt);
    }
    BOOL v17 = insert_rowid != -1;
  }
  else
  {
    uint64_t v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [&unk_26DF7B040 componentsJoinedByString:@","];
    unint64_t v8 = [v6 stringWithFormat:@"SELECT %@ FROM identifiers ORDER BY rowid ASC;", v7];

    ppStmt = 0;
    uint64_t v9 = *p_database;
    long long v10 = v8;
    if (sqlite3_prepare(v9, (const char *)[v10 UTF8String], -1, &ppStmt, 0))
    {
      long long v11 = +[MKLog log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }

      long long v12 = 0;
    }
    else
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        long long v12 = 0;
        do
        {
          long long v13 = sqlite3_column_text(ppStmt, 0);
          if (v13)
          {
            uint64_t v14 = [NSString stringWithUTF8String:v13];

            [v3 addObject:v14];
            long long v12 = (void *)v14;
          }
        }
        while (sqlite3_step(ppStmt) == 100);
      }
      else
      {
        long long v12 = 0;
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    long long v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }

  return v3;
}

- (void)addAppStoreIdentifier:(id)a3
{
  id v4 = a3;
  [(MKApplicationDatabase *)self begin];
  BOOL v5 = [(MKApplicationDatabase *)self _addAppStoreIdentifier:v4];

  if (v5)
  {
    [(MKApplicationDatabase *)self commit];
  }
  else
  {
    [(MKApplicationDatabase *)self rollback];
  }
}

- (BOOL)_addAppStoreIdentifier:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B058, "count"));
    if ([&unk_26DF7B058 count])
    {
      unint64_t v8 = 0;
      do
        [v7 setObject:@"?" atIndexedSubscript:v8++];
      while (v8 < [&unk_26DF7B058 count]);
    }
    uint64_t v9 = NSString;
    long long v10 = [&unk_26DF7B058 componentsJoinedByString:@","];
    long long v11 = [v7 componentsJoinedByString:@","];
    long long v12 = [v9 stringWithFormat:@"INSERT INTO applications (%@) VALUES (%@)", v10, v11];

    ppStmt = 0;
    long long v13 = *p_database;
    id v14 = v12;
    if (sqlite3_prepare(v13, (const char *)[v14 UTF8String], -1, &ppStmt, 0))
    {
      uint64_t v15 = +[MKLog log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }

      sqlite3_int64 insert_rowid = -1;
    }
    else
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
      if (sqlite3_step(ppStmt) == 101)
      {
        sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      }
      else
      {
        v18 = +[MKLog log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[MKApplicationDatabase addIdentifier:]();
        }

        sqlite3_int64 insert_rowid = -1;
      }
      sqlite3_finalize(ppStmt);
    }
    BOOL v17 = insert_rowid != -1;
  }
  else
  {
    uint64_t v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (id)appStoreIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [&unk_26DF7B070 componentsJoinedByString:@","];
    unint64_t v8 = [v6 stringWithFormat:@"SELECT %@ FROM applications ORDER BY rowid ASC;", v7];

    ppStmt = 0;
    uint64_t v9 = *p_database;
    long long v10 = v8;
    if (sqlite3_prepare(v9, (const char *)[v10 UTF8String], -1, &ppStmt, 0))
    {
      long long v11 = +[MKLog log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }

      long long v12 = 0;
    }
    else
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        long long v12 = 0;
        do
        {
          long long v13 = sqlite3_column_text(ppStmt, 0);
          if (v13)
          {
            uint64_t v14 = [NSString stringWithUTF8String:v13];

            [v3 addObject:v14];
            long long v12 = (void *)v14;
          }
        }
        while (sqlite3_step(ppStmt) == 100);
      }
      else
      {
        long long v12 = 0;
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    long long v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }

  return v3;
}

- (int64_t)countForAppStoreIdentifiers
{
  if (self->_database)
  {
    ppStmt = 0;
    sqlite3_int64 v2 = 0;
    if (!sqlite3_prepare(self->_database, (const char *)[@"SELECT COUNT(*) FROM applications;" UTF8String],
            -1,
            &ppStmt,
            0))
    {
      if (sqlite3_step(ppStmt) == 100) {
        sqlite3_int64 v2 = sqlite3_column_int64(ppStmt, 0);
      }
      else {
        sqlite3_int64 v2 = 0;
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    id v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }

    return 0;
  }
  return v2;
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "could not create a directory for application database. error=%@", (uint8_t *)&v2, 0xCu);
}

- (void)open:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ could not open a database file.", (uint8_t *)&v2, 0xCu);
}

- (void)query:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22BFAC000, v1, v2, "query failed. %d (%s)", v3, v4, v5, v6, v7);
}

- (void)query:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22BFAC000, v1, v2, "prepare failed. %d (%s)", v3, v4, v5, v6, v7);
}

- (void)addIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "tried to access an unintialized or closed database.", v2, v3, v4, v5, v6);
}

- (void)addIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22BFAC000, v1, v2, "insert failed. %d (%s)", v3, v4, v5, v6, v7);
}

@end