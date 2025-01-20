@interface MFSqliteMessageIDStore
- (MFSqliteMessageIDStore)initWithLibrary:(id)a3 URLString:(id)a4;
- (id)knownMessageIDsFromSet:(id)a3;
- (id)messageIDsAddedBeforeDate:(double)a3;
- (unint64_t)flagsForUID:(id)a3;
- (unsigned)numberOfMessageIDs;
- (void)_loadMailboxRowidIfNecessary:(id)a3;
- (void)deleteAllUIDs;
- (void)deleteUIDsNotInArray:(id)a3;
@end

@implementation MFSqliteMessageIDStore

- (MFSqliteMessageIDStore)initWithLibrary:(id)a3 URLString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFSqliteMessageIDStore;
  v9 = [(MFSqliteMessageIDStore *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_url, a4);
    v10->_mailboxRowid = -1;
  }

  return v10;
}

- (void)_loadMailboxRowidIfNecessary:(id)a3
{
  id v4 = a3;
  if (self->_mailboxRowid == -1)
  {
    id v7 = v4;
    v5 = [v4 preparedStatementForQueryString:@"SELECT ROWID from mailboxes WHERE url = ?"];;
    v6 = (sqlite3_stmt *)[v5 compiled];
    if (v6)
    {
      sqlite3_bind_text(v6, 1, [(NSString *)self->_url UTF8String], -1, 0);
      if (sqlite3_step(v6) == 100) {
        self->_mailboxRowid = sqlite3_column_int64(v6, 0);
      }
      sqlite3_reset(v6);
    }

    id v4 = v7;
  }
}

- (id)knownMessageIDsFromSet:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__20;
  v17 = __Block_byref_object_dispose__20;
  id v18 = (id)0xAAAAAAAAAAAAAAAALL;
  id v18 = [MEMORY[0x1E4F1CA80] set];
  v5 = [(MFMailMessageLibrary *)self->_library database];
  v6 = [NSString stringWithUTF8String:"-[MFSqliteMessageIDStore knownMessageIDsFromSet:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__MFSqliteMessageIDStore_knownMessageIDsFromSet___block_invoke;
  v10[3] = &unk_1E5D3C500;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  objc_super v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __49__MFSqliteMessageIDStore_knownMessageIDsFromSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _loadMailboxRowidIfNecessary:v3];
  if (*(void *)(*(void *)(a1 + 32) + 16) != -1)
  {
    id v4 = [v3 preparedStatementForQueryString:@"SELECT 1 FROM pop_uids WHERE mailbox = ? AND uid = ? AND flags IS NULL"];;
    v5 = (sqlite3_stmt *)[v4 compiled];
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(void *)(*(void *)(a1 + 32) + 16));
      id v7 = [*(id *)(a1 + 40) objectEnumerator];
      id v8 = 0;
      while (1)
      {
        v9 = [v7 nextObject];

        if (!v9) {
          break;
        }
        id v8 = v9;
        sqlite3_bind_text(v6, 2, (const char *)[v8 UTF8String], -1, 0);
        if (sqlite3_step(v6) == 100) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v8];
        }
        sqlite3_reset(v6);
      }
    }
  }

  return 1;
}

- (id)messageIDsAddedBeforeDate:(double)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__20;
  v14 = __Block_byref_object_dispose__20;
  id v15 = 0;
  v5 = [(MFMailMessageLibrary *)self->_library database];
  v6 = [NSString stringWithUTF8String:"-[MFSqliteMessageIDStore messageIDsAddedBeforeDate:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__MFSqliteMessageIDStore_messageIDsAddedBeforeDate___block_invoke;
  v9[3] = &unk_1E5D40EB8;
  *(double *)&v9[6] = a3;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __52__MFSqliteMessageIDStore_messageIDsAddedBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _loadMailboxRowidIfNecessary:v3];
  if (*(void *)(*(void *)(a1 + 32) + 16) != -1)
  {
    id v4 = [v3 preparedStatementForQueryString:@"SELECT uid FROM pop_uids WHERE mailbox = ? AND date_added < ?"];;
    v5 = (sqlite3_stmt *)[v4 compiled];
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(void *)(*(void *)(a1 + 32) + 16));
      sqlite3_bind_int(v6, 2, (int)*(double *)(a1 + 48));
      while (sqlite3_step(v6) == 100)
      {
        id v7 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v6, 0));
        id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (v8)
        {
          [v8 addObject:v7];
        }
        else
        {
          uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          id v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;
        }
      }
      sqlite3_reset(v6);
    }
  }
  return 1;
}

- (void)deleteUIDsNotInArray:(id)a3
{
  id v4 = a3;
  v5 = [(MFMailMessageLibrary *)self->_library database];
  v6 = [NSString stringWithUTF8String:"-[MFSqliteMessageIDStore deleteUIDsNotInArray:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__MFSqliteMessageIDStore_deleteUIDsNotInArray___block_invoke;
  v8[3] = &unk_1E5D3CCE8;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);
}

uint64_t __47__MFSqliteMessageIDStore_deleteUIDsNotInArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _loadMailboxRowidIfNecessary:v3];
  if (*(void *)(*(void *)(a1 + 32) + 16) == -1)
  {
    uint64_t v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      int v21 = 138412290;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "no entry for mailbox %@?", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    id v4 = [v3 preparedStatementForQueryString:@"SELECT uid FROM pop_uids WHERE mailbox = ?"];;
    v5 = (sqlite3_stmt *)[v4 compiled];
    if (v5)
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
      sqlite3_bind_int64(v5, 1, *(void *)(*(void *)(a1 + 32) + 16));
      while (sqlite3_step(v5) == 100)
      {
        id v8 = sqlite3_column_text(v5, 0);
        if (v8)
        {
          id v9 = (void *)[[NSString alloc] initWithUTF8String:v8];
          if (([v7 containsObject:v9] & 1) == 0) {
            [v6 addObject:v9];
          }
        }
      }
      sqlite3_reset(v5);
    }
    else
    {
      v6 = 0;
    }
    uint64_t v12 = [v6 count];
    if (v12)
    {
      uint64_t v13 = [v3 preparedStatementForQueryString:@"DELETE FROM pop_uids WHERE mailbox = ? AND uid = ?"];;

      v14 = (sqlite3_stmt *)[v13 compiled];
      id v15 = v14;
      if (v14)
      {
        sqlite3_bind_int64(v14, 1, *(void *)(*(void *)(a1 + 32) + 16));
        uint64_t v16 = v12 - 1;
        do
        {
          id v17 = [v6 objectAtIndex:v16];
          sqlite3_bind_text(v15, 2, (const char *)[v17 UTF8String], -1, 0);
          int v18 = sqlite3_step(v15);
          sqlite3_reset(v15);

          BOOL v19 = v16-- != 0;
        }
        while (v19 && v18 == 101);
      }
      id v4 = v13;
    }
  }
  return 1;
}

- (unsigned)numberOfMessageIDs
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  id v3 = [(MFMailMessageLibrary *)self->_library database];
  id v4 = [NSString stringWithUTF8String:"-[MFSqliteMessageIDStore numberOfMessageIDs]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MFSqliteMessageIDStore_numberOfMessageIDs__block_invoke;
  v6[3] = &unk_1E5D3CC20;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __44__MFSqliteMessageIDStore_numberOfMessageIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _loadMailboxRowidIfNecessary:v3];
  if (*(void *)(*(void *)(a1 + 32) + 16) != -1)
  {
    id v4 = [v3 preparedStatementForQueryString:@"SELECT COUNT() FROM pop_uids WHERE mailbox = ?"];;
    v5 = (sqlite3_stmt *)[v4 compiled];
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(void *)(*(void *)(a1 + 32) + 16));
      if (sqlite3_step(v6) == 100) {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(v6, 0);
      }
    }
    sqlite3_reset(v6);
  }
  return 1;
}

- (void)deleteAllUIDs
{
  id v3 = [(MFMailMessageLibrary *)self->_library database];
  id v4 = [NSString stringWithUTF8String:"-[MFSqliteMessageIDStore deleteAllUIDs]"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MFSqliteMessageIDStore_deleteAllUIDs__block_invoke;
  v5[3] = &unk_1E5D3D068;
  v5[4] = self;
  objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v5);
}

uint64_t __39__MFSqliteMessageIDStore_deleteAllUIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _loadMailboxRowidIfNecessary:v3];
  if (*(void *)(*(void *)(a1 + 32) + 16) != -1)
  {
    id v4 = [v3 preparedStatementForQueryString:@"DELETE FROM pop_uids WHERE mailbox = ?"];;
    v5 = (sqlite3_stmt *)[v4 compiled];
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(void *)(*(void *)(a1 + 32) + 16));
      sqlite3_step(v6);
    }
    sqlite3_reset(v6);
  }
  return 1;
}

- (unint64_t)flagsForUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v5 = [(MFMailMessageLibrary *)self->_library database];
  v6 = [NSString stringWithUTF8String:"-[MFSqliteMessageIDStore flagsForUID:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__MFSqliteMessageIDStore_flagsForUID___block_invoke;
  v10[3] = &unk_1E5D3C500;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  unint64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __38__MFSqliteMessageIDStore_flagsForUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _loadMailboxRowidIfNecessary:v3];
  if (*(void *)(*(void *)(a1 + 32) + 16) != -1)
  {
    id v4 = [v3 preparedStatementForQueryString:@"SELECT flags FROM pop_uids WHERE mailbox = ? AND uid = ?"];;
    v5 = (sqlite3_stmt *)[v4 compiled];
    v6 = v5;
    if (v5)
    {
      sqlite3_bind_int64(v5, 1, *(void *)(*(void *)(a1 + 32) + 16));
      sqlite3_bind_text(v6, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
      if (sqlite3_step(v6) == 100) {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(v6, 0);
      }
      sqlite3_reset(v6);
    }
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end