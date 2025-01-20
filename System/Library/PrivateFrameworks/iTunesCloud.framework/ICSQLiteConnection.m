@interface ICSQLiteConnection
- (BOOL)_close;
- (BOOL)_executeStatement:(id)a3 error:(id *)a4;
- (BOOL)_open;
- (BOOL)_performResetAfterCorruptionError;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)resetAfterCorruptionError;
- (BOOL)resetAfterIOError;
- (BOOL)setUserVersion:(id)a3;
- (BOOL)truncate;
- (ICSQLiteConnection)initWithOptions:(id)a3;
- (ICSQLiteConnectionDelegate)delegate;
- (ICSQLiteConnectionOptions)options;
- (NSError)currentError;
- (NSNumber)userVersion;
- (id)_prepareStatement:(id)a3 error:(id *)a4;
- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4;
- (id)prepareStatement:(id)a3 error:(id *)a4;
- (int64_t)lastChangeCount;
- (void)_finalizeAllStatements;
- (void)_flushAfterTransactionBlocks;
- (void)dispatchAfterTransaction:(id)a3;
- (void)executePreparedQuery:(id)a3 withResults:(id)a4;
- (void)executeQuery:(id)a3 withResults:(id)a4;
- (void)performTransaction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ICSQLiteConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

- (ICSQLiteConnectionOptions)options
{
  return self->_options;
}

- (void)setDelegate:(id)a3
{
}

- (ICSQLiteConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSQLiteConnectionDelegate *)WeakRetained;
}

- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ICSQLiteConnection *)self _open])
  {
    id v12 = 0;
    v7 = [(ICSQLiteConnection *)self _prepareStatement:v6 error:&v12];
    id v8 = v12;
    if (v7)
    {
      if ([(ICSQLiteConnectionOptions *)self->_options isReadOnly]
        && ([v7 isReadOnly] & 1) == 0)
      {
        uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7701 userInfo:0];

        [v7 finalizeStatement];
        id v9 = 0;
        id v8 = (id)v10;
      }
      else
      {
        id v9 = v7;
      }
    }
    else
    {
      id v9 = 0;
    }

    if (!a4) {
      goto LABEL_13;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7700 userInfo:0];
    id v9 = 0;
    if (!a4) {
      goto LABEL_13;
    }
  }
  if (!v9) {
    *a4 = v8;
  }
LABEL_13:

  return v9;
}

- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((ICSQLiteConnection *)[v6 connectionPointer] == self)
  {
    if ([(ICSQLiteConnection *)self _open])
    {
      id v12 = 0;
      id v9 = [(ICSQLiteConnection *)self _statementForPreparedStatement:v6 error:&v12];
      id v8 = v12;
      if (v9)
      {
        if ([(ICSQLiteConnectionOptions *)self->_options isReadOnly]
          && ([v9 isReadOnly] & 1) == 0)
        {
          uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7701 userInfo:0];

          id v7 = 0;
          id v8 = (id)v10;
        }
        else
        {
          id v7 = v9;
        }
      }
      else
      {
        id v7 = 0;
      }

      if (!a4) {
        goto LABEL_16;
      }
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7700 userInfo:0];
      id v7 = 0;
      if (!a4) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Statement from a different connection"];
    id v7 = 0;
    id v8 = 0;
    if (!a4) {
      goto LABEL_16;
    }
  }
  if (!v7) {
    *a4 = v8;
  }
LABEL_16:

  return v7;
}

- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMapTable *)self->_preparedStatements objectForKey:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = [v6 SQL];
    id v15 = 0;
    id v8 = [(ICSQLiteConnection *)self _prepareStatement:v10 error:&v15];
    id v9 = v15;

    if (v8)
    {
      preparedStatements = self->_preparedStatements;
      if (!preparedStatements)
      {
        id v12 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
        v13 = self->_preparedStatements;
        self->_preparedStatements = v12;

        preparedStatements = self->_preparedStatements;
      }
      [(NSMapTable *)preparedStatements setObject:v8 forKey:v6];
    }
    else if (a4)
    {
      id v9 = v9;
      id v8 = 0;
      *a4 = v9;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_database)
  {
    id v8 = (const char *)[v6 UTF8String];
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    while (2)
    {
      if (v10 <= 10) {
        uint64_t v11 = 10;
      }
      else {
        uint64_t v11 = v10;
      }
      while (1)
      {
        ppStmt = 0;
        int v12 = sqlite3_prepare_v2(self->_database, v8, -1, &ppStmt, 0);
        if ((v12 - 5) >= 2) {
          break;
        }
        if (ppStmt) {
          sqlite3_finalize(ppStmt);
        }
        if (v11 == v10)
        {
          v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7003 userInfo:0];
          goto LABEL_37;
        }
        ++v10;
        usleep(0xF4240u);
      }
      if (v12 > 10)
      {
        if (v12 == 11 || v12 == 26)
        {
          v13 = ICSQLiteGetCurrentError(self->_database);
          if (ppStmt) {
            sqlite3_finalize(ppStmt);
          }
          BOOL v17 = [(ICSQLiteConnection *)self resetAfterCorruptionError];
          if (v9 < 3)
          {
            BOOL v18 = v17;

            if (!v18)
            {
LABEL_45:
              v21 = 0;
LABEL_33:
              v13 = 0;
              if (!a4) {
                goto LABEL_40;
              }
              goto LABEL_38;
            }
LABEL_28:
            ++v9;
            continue;
          }
LABEL_37:
          v21 = 0;
          if (!a4)
          {
LABEL_40:
            v19 = v21;

            goto LABEL_41;
          }
LABEL_38:
          if (!v21) {
            *a4 = v13;
          }
          goto LABEL_40;
        }
      }
      else
      {
        if (!v12)
        {
          v20 = [ICSQLiteStatement alloc];
          v21 = [(ICSQLiteStatement *)v20 initWithStatement:ppStmt connection:self];
          goto LABEL_33;
        }
        if (v12 == 10)
        {
          v13 = ICSQLiteGetCurrentError(self->_database);
          if (ppStmt) {
            sqlite3_finalize(ppStmt);
          }
          BOOL v14 = [(ICSQLiteConnection *)self resetAfterIOError];
          if (v9 < 3)
          {
            BOOL v15 = v14;

            if (!v15) {
              goto LABEL_45;
            }
            goto LABEL_28;
          }
          goto LABEL_37;
        }
      }
      break;
    }
    v13 = ICSQLiteGetCurrentError(self->_database);
    if (ppStmt) {
      sqlite3_finalize(ppStmt);
    }
    goto LABEL_37;
  }
  if (*a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICSQLiteError", -1, @"Cannot prepare statement without a database.");
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_41:

  return v19;
}

- (BOOL)_performResetAfterCorruptionError
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained connectionNeedsResetForCorruption:self];
  }
  else if ([(ICSQLiteConnectionOptions *)self->_options isReadOnly])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [(ICSQLiteConnectionOptions *)self->_options databasePath];
    char v4 = ICSQLiteTruncateDatabase(v5);
  }
  return v4;
}

- (BOOL)_open
{
  BOOL v2 = 1;
  if (!self->_database)
  {
    char v4 = 1;
    while (1)
    {
      v5 = self->_options;
      ppDb = 0;
      id v6 = [(ICSQLiteConnectionOptions *)v5 databasePath];
      if ([(ICSQLiteConnectionOptions *)v5 isReadOnly])
      {
        int v7 = 2;
      }
      else
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        unint64_t v9 = [v6 stringByDeletingLastPathComponent];
        [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

        int v7 = 6;
      }
      id v10 = v6;
      int v11 = sqlite3_open_v2((const char *)[v10 fileSystemRepresentation], &ppDb, v7, 0);
      if (!v11)
      {
        int v11 = [(ICSQLiteConnectionOptions *)v5 applyToDatabase:ppDb];
        if (!v11) {
          break;
        }
      }
      if (ppDb) {
        sqlite3_close(ppDb);
      }

      if (v11 <= 0x1Au && ((1 << v11) & 0x4000C00) != 0)
      {
        char v13 = [(ICSQLiteConnection *)self _performResetAfterCorruptionError] & v4;
        char v4 = 0;
        if (v13) {
          continue;
        }
      }
      return v11 == 0;
    }
    BOOL v14 = ppDb;

    self->_database = v14;
    self->_didResetForCorruption = 0;
    return 1;
  }
  return v2;
}

- (void)_flushAfterTransactionBlocks
{
  afterTransactionBlocks = self->_afterTransactionBlocks;
  if (afterTransactionBlocks)
  {
    char v4 = (void *)[(NSMutableArray *)afterTransactionBlocks copy];
    v5 = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0;

    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__ICSQLiteConnection__flushAfterTransactionBlocks__block_invoke;
    block[3] = &unk_1E5ACD750;
    block[4] = v4;
    dispatch_async(v6, block);
  }
}

void __50__ICSQLiteConnection__flushAfterTransactionBlocks__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_finalizeAllStatements
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_preparedStatements;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = -[NSMapTable objectForKey:](self->_preparedStatements, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v7), (void)v12);
        [v8 finalizeStatement];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  preparedStatements = self->_preparedStatements;
  self->_preparedStatements = 0;

  stmt = sqlite3_next_stmt(self->_database, 0);
  if (stmt)
  {
    uint64_t v11 = stmt;
    do
    {
      sqlite3_finalize(v11);
      uint64_t v11 = sqlite3_next_stmt(self->_database, v11);
    }
    while (v11);
  }
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  for (uint64_t i = 10; ; --i)
  {
    int v8 = [v6 step];
    if ((v8 - 5) >= 2) {
      break;
    }
    [v6 reset];
    if (!i)
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7003 userInfo:0];
      goto LABEL_17;
    }
    usleep(0xF4240u);
  }
  if (v8 <= 99)
  {
    if (v8 == 10)
    {
      ICSQLiteGetCurrentError(self->_database);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [(ICSQLiteConnection *)self resetAfterIOError];
      if (!a4) {
        goto LABEL_10;
      }
LABEL_18:
      id v9 = v9;
      BOOL v10 = 0;
      *a4 = v9;
      goto LABEL_19;
    }
    if (v8 == 11 || v8 == 26)
    {
      ICSQLiteGetCurrentError(self->_database);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [(ICSQLiteConnection *)self resetAfterCorruptionError];
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
LABEL_16:
    uint64_t v11 = ICSQLiteGetCurrentError(self->_database);
LABEL_17:
    id v9 = (id)v11;
    if (!a4)
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ((v8 - 100) >= 2) {
    goto LABEL_16;
  }
  id v9 = 0;
  BOOL v10 = 1;
LABEL_19:

  return v10;
}

- (BOOL)_close
{
  if (!self->_database) {
    return 1;
  }
  [(ICSQLiteConnection *)self _finalizeAllStatements];
  if (sqlite3_close(self->_database)) {
    return 0;
  }
  afterTransactionBlocks = self->_afterTransactionBlocks;
  self->_afterTransactionBlocks = 0;

  self->_database = 0;
  self->_transactionDepth = 0;
  BOOL result = 1;
  self->_transactionWantsRollback = 0;
  return result;
}

- (BOOL)resetAfterIOError
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    BOOL v10 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Resetting after IO error", (uint8_t *)&v9, 0xCu);
  }

  afterTransactionBlocks = self->_afterTransactionBlocks;
  uint64_t v5 = afterTransactionBlocks;
  int64_t transactionDepth = self->_transactionDepth;
  if ([(ICSQLiteConnection *)self _close] && [(ICSQLiteConnection *)self _open])
  {
    if (!transactionDepth)
    {
      BOOL v7 = 1;
      goto LABEL_8;
    }
    if (!sqlite3_exec(self->_database, "BEGIN DEFERRED TRANSACTION", 0, 0, 0))
    {
      objc_storeStrong((id *)&self->_afterTransactionBlocks, afterTransactionBlocks);
      self->_int64_t transactionDepth = transactionDepth;
      BOOL v7 = 1;
      self->_transactionWantsRollback = 1;
      goto LABEL_8;
    }
  }
  [(ICSQLiteConnection *)self _close];
  BOOL v7 = [(ICSQLiteConnection *)self _performResetAfterCorruptionError];
LABEL_8:

  return v7;
}

- (BOOL)resetAfterCorruptionError
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Resetting after database corruption error", (uint8_t *)&v5, 0xCu);
  }

  if (self->_didResetForCorruption)
  {
    [(ICSQLiteConnection *)self _close];
    return [(ICSQLiteConnection *)self _performResetAfterCorruptionError];
  }
  else
  {
    self->_didResetForCorruption = 1;
    return [(ICSQLiteConnection *)self resetAfterIOError];
  }
}

- (NSError)currentError
{
  database = self->_database;
  if (database)
  {
    ICSQLiteGetCurrentError(database);
    database = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  }

  return (NSError *)database;
}

- (BOOL)truncate
{
  if ([(ICSQLiteConnectionOptions *)self->_options isReadOnly]
    || ![(ICSQLiteConnection *)self _open])
  {
    return 0;
  }
  [(ICSQLiteConnection *)self _finalizeAllStatements];
  int v6 = 129;
  int v3 = sqlite3_file_control(self->_database, 0, 101, &v6);
  BOOL v4 = v3 == 0;
  if (!v3)
  {
    sqlite3_close(self->_database);
    self->_database = 0;
  }
  return v4;
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(ICSQLiteConnection *)self _open])
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7700 userInfo:0];
    uint64_t v11 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v13 = 0;
  uint64_t v7 = [(ICSQLiteConnection *)self _prepareStatement:v6 error:&v13];
  id v8 = v13;
  if (v7)
  {
    if (!self->_preparedStatements)
    {
      int v9 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
      preparedStatements = self->_preparedStatements;
      self->_preparedStatements = v9;
    }
    uint64_t v11 = [[ICSQLitePreparedStatement alloc] initWithConnection:self SQL:v6];
    [(NSMapTable *)self->_preparedStatements setObject:v7 forKey:v11];
  }
  else
  {
    uint64_t v11 = 0;
  }

  if (a4)
  {
LABEL_10:
    if (!v11) {
      *a4 = v8;
    }
  }
LABEL_12:

  return v11;
}

- (void)performTransaction:(id)a3
{
  int v9 = (uint64_t (**)(void))a3;
  int64_t transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (![(ICSQLiteConnection *)self executeStatement:@"BEGIN DEFERRED TRANSACTION" error:0])goto LABEL_12; {
    self->_int64_t transactionDepth = 1;
    }
    self->_transactionWantsRollback = 0;
  }
  else
  {
    self->_int64_t transactionDepth = transactionDepth + 1;
  }
  int v5 = v9[2]() ^ 1;
  int64_t v6 = self->_transactionDepth;
  if (self->_transactionWantsRollback) {
    int v5 = 1;
  }
  self->_transactionWantsRollback = v5;
  int64_t v7 = v6 - 1;
  self->_int64_t transactionDepth = v7;
  if (!v7)
  {
    if (v5) {
      id v8 = @"ROLLBACK TRANSACTION";
    }
    else {
      id v8 = @"COMMIT TRANSACTION";
    }
    [(ICSQLiteConnection *)self executeStatement:v8 error:0];
    [(ICSQLiteConnection *)self _flushAfterTransactionBlocks];
  }
LABEL_12:
}

- (BOOL)setUserVersion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [NSString stringWithFormat:@"PRAGMA user_version=%@", a3];
  id v9 = 0;
  BOOL v5 = [(ICSQLiteConnection *)self executeStatement:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    int64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Failed to update user version. err=%{public}@", buf, 0xCu);
    }
  }
  return v5;
}

- (NSNumber)userVersion
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__38639;
  id v9 = __Block_byref_object_dispose__38640;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__ICSQLiteConnection_userVersion__block_invoke;
  v4[3] = &unk_1E5ACD198;
  v4[4] = &v5;
  [(ICSQLiteConnection *)self executeQuery:@"PRAGMA user_version" withResults:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

uint64_t __33__ICSQLiteConnection_userVersion__block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a2, "firstInt64Value"));
    uint64_t v5 = *(void *)(*(void *)(v3 + 32) + 8);
    uint64_t v6 = *(void *)(v5 + 40);
    *(void *)(v5 + 40) = v4;
    return MEMORY[0x1F41817F8](v4, v6);
  }
  return result;
}

- (int64_t)lastChangeCount
{
  if ([(ICSQLiteConnection *)self _open]) {
    return sqlite3_changes(self->_database);
  }
  else {
    return 0;
  }
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v9 = [(ICSQLiteConnection *)self _verifiedStatementForSQL:a3 error:&v15];
  id v10 = v15;
  if (!v9)
  {
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v8) {
    v8[2](v8, v9);
  }
  id v14 = v10;
  BOOL v11 = [(ICSQLiteConnection *)self _executeStatement:v9 error:&v14];
  id v12 = v14;

  [v9 finalizeStatement];
  id v10 = v12;
  if (a4)
  {
LABEL_7:
    if (!v11) {
      *a4 = v10;
    }
  }
LABEL_9:

  return v11;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return [(ICSQLiteConnection *)self executeStatement:a3 error:a4 bindings:0];
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, ICSQLiteQueryResults *, id))a4;
  id v11 = 0;
  id v8 = [(ICSQLiteConnection *)self _verifiedStatementForSQL:v6 error:&v11];
  id v9 = v11;
  if (v8) {
    id v10 = [[ICSQLiteQueryResults alloc] initWithStatement:v8];
  }
  else {
    id v10 = 0;
  }
  v7[2](v7, v10, v9);
  [v8 finalizeStatement];
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v9 = [(ICSQLiteConnection *)self _verifiedStatementForPreparedStatement:a3 error:&v15];
  id v10 = v15;
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9);
    }
    id v14 = v10;
    BOOL v11 = [(ICSQLiteConnection *)self _executeStatement:v9 error:&v14];
    id v12 = v14;

    if (v8) {
      [v9 clearBindings];
    }
    id v10 = v12;
  }
  else
  {
    BOOL v11 = 0;
  }
  [v9 reset];
  if (a4 && !v11) {
    *a4 = v10;
  }

  return v11;
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return [(ICSQLiteConnection *)self executePreparedStatement:a3 error:a4 bindings:0];
}

- (void)executePreparedQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, ICSQLiteQueryResults *, id))a4;
  id v11 = 0;
  id v8 = [(ICSQLiteConnection *)self _verifiedStatementForPreparedStatement:v6 error:&v11];
  id v9 = v11;
  if (v8) {
    id v10 = [[ICSQLiteQueryResults alloc] initWithStatement:v8];
  }
  else {
    id v10 = 0;
  }
  v7[2](v7, v10, v9);
  [v8 clearBindings];
  [v8 reset];
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;
    }
    uint64_t v7 = (void *)[v10 copy];
    id v8 = self->_afterTransactionBlocks;
    id v9 = (void *)MEMORY[0x1A6240BF0]();
    [(NSMutableArray *)v8 addObject:v9];
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (ICSQLiteConnection)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteConnection;
  uint64_t v5 = [(ICSQLiteConnection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    options = v5->_options;
    v5->_options = (ICSQLiteConnectionOptions *)v6;
  }
  return v5;
}

@end