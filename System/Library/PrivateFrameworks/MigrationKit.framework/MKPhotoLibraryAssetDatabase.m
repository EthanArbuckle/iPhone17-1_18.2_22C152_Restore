@interface MKPhotoLibraryAssetDatabase
- (MKPhotoLibraryAssetDatabase)initWithType:(unint64_t)a3;
- (MKPhotoLibraryAssetDatabase)initWithType:(unint64_t)a3 reuse:(BOOL)a4;
- (id)asset;
- (id)collections;
- (id)identifiersForCollection:(id)a3 offset:(unint64_t)a4 limit:(unint64_t)a5;
- (unint64_t)count;
- (unint64_t)countForCollection:(id)a3;
- (void)addAsset:(id)a3;
- (void)begin;
- (void)close;
- (void)commit;
- (void)create:(BOOL)a3;
- (void)dealloc;
- (void)open:(id)a3 reuse:(BOOL)a4;
- (void)query:(id)a3;
- (void)remove:(id)a3;
- (void)removeCollection:(id)a3;
- (void)rollback;
- (void)setIdentifier:(id)a3 forAsset:(id)a4;
@end

@implementation MKPhotoLibraryAssetDatabase

- (MKPhotoLibraryAssetDatabase)initWithType:(unint64_t)a3
{
  return [(MKPhotoLibraryAssetDatabase *)self initWithType:a3 reuse:0];
}

- (MKPhotoLibraryAssetDatabase)initWithType:(unint64_t)a3 reuse:(BOOL)a4
{
  BOOL v4 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MKPhotoLibraryAssetDatabase;
  v6 = [(MKPhotoLibraryAssetDatabase *)&v26 init];
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    v6->_database = 0;
    if (a3 <= 2) {
      v8 = off_264905F48[a3];
    }
    v9 = [NSString stringWithFormat:@"/Library/MigrationKit/%@", v8];
    v10 = NSHomeDirectory();
    v11 = [v10 stringByAppendingPathComponent:v9];

    v12 = [v11 stringByDeletingLastPathComponent];
    v13 = [MEMORY[0x263F08850] defaultManager];
    char v14 = [v13 fileExistsAtPath:v12];

    if (v14)
    {
      id v15 = 0;
    }
    else
    {
      v16 = [MEMORY[0x263F08850] defaultManager];
      id v25 = 0;
      [v16 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v25];
      id v15 = v25;

      if (v15)
      {
        v17 = +[MKLog log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[MKPhotoLibraryAssetDatabase initWithType:reuse:]();
        }
      }
    }
    if (v4
      || ([MEMORY[0x263F08850] defaultManager],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 isDeletableFileAtPath:v11],
          v18,
          !v19))
    {
      id v21 = v15;
    }
    else
    {
      v20 = [MEMORY[0x263F08850] defaultManager];
      id v24 = v15;
      [v20 removeItemAtPath:v11 error:&v24];
      id v21 = v24;

      if (v21)
      {
        v22 = +[MKLog log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[MKPhotoLibraryAssetDatabase initWithType:reuse:]();
        }
      }
    }
    [(MKPhotoLibraryAssetDatabase *)v7 open:v11 reuse:v4];
  }
  return v7;
}

- (void)dealloc
{
  [(MKPhotoLibraryAssetDatabase *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MKPhotoLibraryAssetDatabase;
  [(MKPhotoLibraryAssetDatabase *)&v3 dealloc];
}

- (void)open:(id)a3 reuse:(BOOL)a4
{
  BOOL v4 = a4;
  if (sqlite3_open((const char *)[a3 UTF8String], &self->_database))
  {
    v6 = +[MKLog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase open:]((uint64_t)self, v6);
    }
  }
  else
  {
    [(MKPhotoLibraryAssetDatabase *)self create:v4];
  }
}

- (void)close
{
  if (self->_database)
  {
    objc_super v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "will close an asset database.", v4, 2u);
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
      BOOL v4 = +[MKLog log];
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

- (void)create:(BOOL)a3
{
  if (!a3)
  {
    [(MKPhotoLibraryAssetDatabase *)self query:@"DROP TABLE IF EXISTS assets;"];
    [(MKPhotoLibraryAssetDatabase *)self query:@"DROP TABLE IF EXISTS identifiers;"];
  }
  [(MKPhotoLibraryAssetDatabase *)self query:@"CREATE TABLE IF NOT EXISTS assets (size INTEGER DEFAULT 0, path TEXT DEFAULT '' NOT NULL, filename TEXT DEFAULT '' NOT NULL, collection TEXT, original_filename TEXT);"];
  [(MKPhotoLibraryAssetDatabase *)self query:@"CREATE TABLE IF NOT EXISTS identifiers (identifier TEXT, collection TEXT);"];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)addAsset:(id)a3
{
  id v4 = a3;
  v5 = v4;
  p_database = &self->_database;
  if (self->_database)
  {
    uint64_t v23 = [v4 size];
    v7 = [v5 path];
    v8 = [v5 filename];
    v9 = [v5 collection];
    id v24 = [v5 originalFilename];
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B0D0, "count"));
    if ([&unk_26DF7B0D0 count])
    {
      unint64_t v11 = 0;
      do
        [v10 setObject:@"?" atIndexedSubscript:v11++];
      while (v11 < [&unk_26DF7B0D0 count]);
    }
    v12 = NSString;
    v13 = [&unk_26DF7B0D0 componentsJoinedByString:@","];
    char v14 = [v10 componentsJoinedByString:@","];
    id v15 = [v12 stringWithFormat:@"INSERT INTO assets (%@) VALUES (%@)", v13, v14];

    ppStmt = 0;
    v16 = *p_database;
    id v17 = v15;
    if (sqlite3_prepare(v16, (const char *)[v17 UTF8String], -1, &ppStmt, 0))
    {
      v18 = +[MKLog log];
      int v19 = v8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }

      v20 = v24;
    }
    else
    {
      sqlite3_bind_int64(ppStmt, 1, v23);
      sqlite3_bind_text(ppStmt, 2, (const char *)[v7 UTF8String], -1, 0);
      int v19 = v8;
      sqlite3_bind_text(ppStmt, 3, (const char *)[v8 UTF8String], -1, 0);
      if (v9) {
        sqlite3_bind_text(ppStmt, 4, (const char *)[v9 UTF8String], -1, 0);
      }
      else {
        sqlite3_bind_null(ppStmt, 4);
      }
      v20 = v24;
      if (v24) {
        sqlite3_bind_text(ppStmt, 5, (const char *)[v24 UTF8String], -1, 0);
      }
      else {
        sqlite3_bind_null(ppStmt, 5);
      }
      if (sqlite3_step(ppStmt) == 101)
      {
        sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
        sqlite3_finalize(ppStmt);
        if (insert_rowid != -1) {
          ++self->_count;
        }
      }
      else
      {
        v22 = +[MKLog log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[MKApplicationDatabase addIdentifier:]();
        }

        sqlite3_finalize(ppStmt);
      }
    }
  }
  else
  {
    v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }
}

- (id)asset
{
  if (self->_database)
  {
    objc_super v3 = NSString;
    id v4 = [&unk_26DF7B0E8 componentsJoinedByString:@","];
    v5 = [v3 stringWithFormat:@"SELECT %@ FROM assets ORDER BY rowid ASC LIMIT 1;", v4];

    ppStmt = 0;
    database = self->_database;
    v7 = v5;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    unint64_t v11 = 0;
    v12 = 0;
    if (!sqlite3_prepare(database, (const char *)[v7 UTF8String], -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        sqlite3_int64 v13 = sqlite3_column_int64(ppStmt, 0);
        sqlite3_int64 v14 = sqlite3_column_int64(ppStmt, 1);
        id v15 = sqlite3_column_text(ppStmt, 2);
        if (v15)
        {
          unint64_t v11 = [NSString stringWithUTF8String:v15];
        }
        else
        {
          unint64_t v11 = 0;
        }
        v16 = sqlite3_column_text(ppStmt, 3);
        if (v16)
        {
          v10 = [NSString stringWithUTF8String:v16];
        }
        else
        {
          v10 = 0;
        }
        id v17 = sqlite3_column_text(ppStmt, 4);
        if (v17)
        {
          v9 = [NSString stringWithUTF8String:v17];
        }
        else
        {
          v9 = 0;
        }
        v18 = sqlite3_column_text(ppStmt, 5);
        if (v18)
        {
          v8 = [NSString stringWithUTF8String:v18];
        }
        else
        {
          v8 = 0;
        }
        sqlite3_finalize(ppStmt);
        if (v13 != -1)
        {
          v12 = [[MKPhotoLibraryAsset alloc] initWithPath:v11 filename:v10 collection:v9 originalFilename:v8 size:v14];
          [(MKPhotoLibraryAsset *)v12 setRowID:v13];
          goto LABEL_23;
        }
      }
      else
      {
        sqlite3_finalize(ppStmt);
        v8 = 0;
        v9 = 0;
        v10 = 0;
        unint64_t v11 = 0;
      }
      v12 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MKApplicationDatabase addIdentifier:]();
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (void)remove:(id)a3
{
  id v4 = a3;
  if (self->_database)
  {
    v5 = [NSString stringWithFormat:@"DELETE FROM assets WHERE rowid = ?"];;
    sqlite3_int64 v6 = [v4 rowID];
    ppStmt = 0;
    database = self->_database;
    v8 = v5;
    if (!sqlite3_prepare(database, (const char *)[v8 UTF8String], -1, &ppStmt, 0))
    {
      sqlite3_bind_int64(ppStmt, 1, v6);
      if (sqlite3_step(ppStmt) == 101)
      {
        --self->_count;
      }
      else
      {
        v9 = +[MKLog log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[MKApplicationDatabase addIdentifier:]();
        }
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }
}

- (void)setIdentifier:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B100, "count"));
    if ([&unk_26DF7B100 count])
    {
      unint64_t v11 = 0;
      do
        [v10 setObject:@"?" atIndexedSubscript:v11++];
      while (v11 < [&unk_26DF7B100 count]);
    }
    v12 = NSString;
    sqlite3_int64 v13 = [&unk_26DF7B100 componentsJoinedByString:@","];
    sqlite3_int64 v14 = [v10 componentsJoinedByString:@","];
    id v15 = [v12 stringWithFormat:@"INSERT INTO identifiers (%@) VALUES (%@)", v13, v14];

    ppStmt = 0;
    v16 = *p_database;
    id v17 = v15;
    if (sqlite3_prepare(v16, (const char *)[v17 UTF8String], -1, &ppStmt, 0))
    {
      v18 = +[MKLog log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }
    }
    else
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v6 UTF8String], -1, 0);
      int v19 = ppStmt;
      id v20 = [v7 collection];
      sqlite3_bind_text(v19, 2, (const char *)[v20 UTF8String], -1, 0);

      if (sqlite3_step(ppStmt) == 101)
      {
        sqlite3_last_insert_rowid(*p_database);
      }
      else
      {
        id v21 = +[MKLog log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[MKApplicationDatabase addIdentifier:]();
        }
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }
}

- (id)collections
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_database)
  {
    ppStmt = 0;
    if (!sqlite3_prepare(self->_database, (const char *)objc_msgSend(@"SELECT DISTINCT collection FROM identifiers WHERE collection IS NOT NULL;",
                            "UTF8String"),
            -1,
            &ppStmt,
            0))
    {
      while (sqlite3_step(ppStmt) == 100)
      {
        id v4 = sqlite3_column_text(ppStmt, 0);
        if (v4)
        {
          uint64_t v5 = [NSString stringWithUTF8String:v4];
          if (v5)
          {
            id v6 = (void *)v5;
            [v3 addObject:v5];
          }
        }
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    id v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }
  return v3;
}

- (id)identifiersForCollection:(id)a3 offset:(unint64_t)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_database)
  {
    v10 = NSString;
    unint64_t v11 = [&unk_26DF7B118 componentsJoinedByString:@","];
    objc_msgSend(v10, "stringWithFormat:", @"SELECT %@ FROM identifiers WHERE collection IS NOT NULL AND identifier IS NOT NULL AND collection = ? ORDER BY rowid ASC LIMIT %ld OFFSET %ld;",
      v11,
      a5,
    v12 = a4);

    ppStmt = 0;
    database = self->_database;
    sqlite3_int64 v14 = v12;
    if (!sqlite3_prepare(database, (const char *)[v14 UTF8String], -1, &ppStmt, 0))
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v8 UTF8String], -1, 0);
      while (sqlite3_step(ppStmt) == 100)
      {
        id v15 = sqlite3_column_text(ppStmt, 0);
        if (v15)
        {
          v16 = [NSString stringWithUTF8String:v15];
        }
        else
        {
          v16 = 0;
        }
        [v9 addObject:v16];
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    sqlite3_int64 v14 = +[MKLog log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }

  return v9;
}

- (unint64_t)countForCollection:(id)a3
{
  id v4 = a3;
  if (self->_database)
  {
    ppStmt = 0;
    int v5 = sqlite3_prepare(self->_database, (const char *)objc_msgSend(@"SELECT COUNT(*) FROM identifiers WHERE collection IS NOT NULL AND identifier IS NOT NULL AND collection = ?;",
                           "UTF8String"),
           -1,
           &ppStmt,
           0);
    sqlite3_int64 v6 = 0;
    if (!v5)
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
      sqlite3_int64 v6 = 0;
      if (sqlite3_step(ppStmt) == 100) {
        sqlite3_int64 v6 = sqlite3_column_int64(ppStmt, 0);
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    id v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }

    sqlite3_int64 v6 = 0;
  }

  return v6;
}

- (void)removeCollection:(id)a3
{
  id v4 = a3;
  database = self->_database;
  p_database = &self->_database;
  if (database)
  {
    id v7 = [NSString stringWithFormat:@"DELETE FROM identifiers WHERE collection = ?"];;
    ppStmt = 0;
    id v8 = *p_database;
    id v9 = v7;
    if (!sqlite3_prepare(v8, (const char *)[v9 UTF8String], -1, &ppStmt, 0))
    {
      sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
      if (sqlite3_step(ppStmt) != 101)
      {
        v10 = +[MKLog log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[MKPhotoLibraryAssetDatabase removeCollection:]();
        }
      }
      sqlite3_finalize(ppStmt);
    }
  }
  else
  {
    id v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }
  }
}

- (void)initWithType:reuse:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "could not delete asset database. path=%@, error=%@");
}

- (void)initWithType:reuse:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "could not delete asset database. directory=%@, error=%@");
}

- (void)removeCollection:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22BFAC000, v1, v2, "delete failed. %d (%s)", v3, v4, v5, v6, v7);
}

@end