@interface ML3DatabaseConnection
- (BOOL)_alreadyAttemptedCorruptionRecovery;
- (BOOL)_alterTableNamed:(id)a3 withNewColumnDefinitions:(id)a4 newColumnNames:(id)a5 oldColumnNames:(id)a6;
- (BOOL)_closeAndFlushTransactionState:(BOOL)a3;
- (BOOL)_closeConnectionWhenCheckingIn;
- (BOOL)_databaseFileExists;
- (BOOL)_databaseFilesAreWritable;
- (BOOL)_executeStatement:(id)a3 withError:(id *)a4;
- (BOOL)_handleBusyLockWithNumberOfRetries:(int)a3;
- (BOOL)_handleConnectionErrorWhileOpening:(int)a3;
- (BOOL)_handleDiskIOError;
- (BOOL)_handleZombieSQLiteConnection:(sqlite3 *)a3;
- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3;
- (BOOL)_internalEndTransactionAndCommit:(BOOL)a3;
- (BOOL)_internalExecuteUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5;
- (BOOL)_isDeviceMediaLibraryDatabase;
- (BOOL)_openWithFlags:(int)a3;
- (BOOL)_validatePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)automaticCheckpointingEnabled;
- (BOOL)close;
- (BOOL)databasePathExists;
- (BOOL)deleteDatabase;
- (BOOL)executeUpdate:(id)a3;
- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInTransaction;
- (BOOL)isOpen;
- (BOOL)isReadOnly;
- (BOOL)logQueryPlans;
- (BOOL)open;
- (BOOL)performTransactionWithBlock:(id)a3;
- (BOOL)performTransactionWithBlock:(id)a3 usingBehaviorType:(unint64_t)a4;
- (BOOL)popToRootTransactionAndCommit:(BOOL)a3;
- (BOOL)popTransactionAndCommit:(BOOL)a3;
- (BOOL)pushTransaction;
- (BOOL)pushTransactionUsingBehaviorType:(unint64_t)a3;
- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 block:(id)a5;
- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5;
- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5 userData:(void *)a6;
- (BOOL)registerModule:(id)a3;
- (BOOL)registerModuleName:(id)a3 moduleMethods:(sqlite3_module *)a4;
- (BOOL)removeModuleNamed:(id)a3;
- (BOOL)schemaAddColumnDefinition:(id)a3 toTable:(id)a4;
- (BOOL)schemaDeleteColumn:(id)a3 inTable:(id)a4;
- (BOOL)schemaDeleteColumns:(id)a3 inTable:(id)a4;
- (BOOL)schemaInsertColumnDefinition:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)schemaInsertColumnDefinitions:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)schemaRenameColumn:(id)a3 inTable:(id)a4 toNewColumnName:(id)a5;
- (BOOL)tableExists:(id)a3;
- (BOOL)transactionMarkedForRollBack;
- (ML3DatabaseConnection)init;
- (ML3DatabaseConnection)initWithDatabasePath:(id)a3;
- (ML3DatabaseConnectionDelegate)connectionDelegate;
- (ML3DatabasePrivacyContext)privacyContext;
- (NSString)databasePath;
- (NSUUID)currentTransactionID;
- (NSUUID)uniqueIdentifier;
- (id)_databaseFilePaths;
- (id)_internalExecuteQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6;
- (id)_owningPool;
- (id)_prepareStatement:(id)a3 error:(id *)a4;
- (id)_registeredModuleNamed:(id)a3;
- (id)_shortDescription;
- (id)debugDescription;
- (id)description;
- (id)executeQuery:(id)a3;
- (id)executeQuery:(id)a3 withParameters:(id)a4;
- (id)openBlobInTable:(id)a3 column:(id)a4 row:(int64_t)a5 readOnly:(BOOL)a6;
- (id)sqliteError;
- (int)_distrustQueriesDuringBlock:(id)a3;
- (int)checkpointDatabase;
- (int64_t)lastInsertionRowID;
- (sqlite3)_sqliteHandle;
- (unint64_t)checkpointStatementThreshold;
- (unint64_t)journalingMode;
- (unint64_t)protectionLevel;
- (unint64_t)transactionLevel;
- (void)_createDatabaseDirectoryIfNonexistent;
- (void)_createDatabaseFileIfNonexistent;
- (void)_ensureConnectionIsOpen;
- (void)_enumerateTableColumnNamesAndDefinitionsFromTable:(id)a3 usingBlock:(id)a4;
- (void)_executeTransactionCommitBlocks:(BOOL)a3;
- (void)_finalizeAllStatements;
- (void)_handleDatabaseCorruption;
- (void)_internalLogQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6;
- (void)_logCurrentError;
- (void)_logCurrentErrorWhilePerformingStatementOperation:(id)a3 statement:(id)a4;
- (void)_logCurrentErrorWhilePerformingStatementOperation:(id)a3 statementSQL:(id)a4;
- (void)_logDatabaseFileDebugInformation;
- (void)_raiseConnectionClosedException;
- (void)_resetUnfinalizedStatements;
- (void)_setAlreadyAttemptedCorruptionRecovery:(BOOL)a3;
- (void)_setCloseConnectionWhenCheckingIn;
- (void)_setOwningPool:(id)a3;
- (void)dealloc;
- (void)enqueueBlockForTransactionCommit:(id)a3;
- (void)flush;
- (void)setAutomaticCheckpointingEnabled:(BOOL)a3;
- (void)setCheckpointStatementThreshold:(unint64_t)a3;
- (void)setConnectionDelegate:(id)a3;
- (void)setCurrentTransactionID:(id)a3;
- (void)setJournalingMode:(unint64_t)a3;
- (void)setLogQueryPlans:(BOOL)a3;
- (void)setPrivacyContext:(id)a3;
- (void)setProtectionLevel:(unint64_t)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setTransactionLevel:(unint64_t)a3;
@end

@implementation ML3DatabaseConnection

- (id)_internalExecuteQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  [(ML3DatabaseConnection *)self _ensureConnectionIsOpen];
  [(ML3DatabaseConnection *)self _internalLogQuery:v12 withParameters:v10 limitProperty:v11 limitValue:a6];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v14 = v13;
  v15 = [(ML3DatabaseConnection *)self _prepareStatement:v12 error:0];

  if (v15)
  {
    if (v10) {
      [v15 bindValuesInArray:v10];
    }
    v16 = [[ML3DatabaseResult alloc] initWithStatement:v15 connection:self];
    v17 = v16;
    if (v11) {
      [(ML3DatabaseResult *)v16 setLimitProperty:v11 limitValue:a6];
    }
  }
  else
  {
    v17 = 0;
  }
  if ([(ML3DatabaseConnection *)self logQueryPlans])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"Executed in %.1f", v18 - v14);
    NSLog(&stru_1F08D64D0.isa, v19);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained connectionDidAccessDatabase:self];
  }

  return v17;
}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    [(ML3DatabaseConnection *)self _ensureConnectionIsOpen];
    v8 = [(ML3DatabaseStatementCache *)self->_statementCache cachedStatementForSQL:v7];
    if (v8)
    {
      v9 = v8;
      [(ML3DatabaseStatement *)v8 reset];
    }
    else
    {
      sel = a2;
      id v10 = v7;
      id v11 = (const char *)[v10 UTF8String];
      unsigned int v30 = 0;
      ppStmt = 0;
      while (1)
      {
        while (1)
        {
          int v12 = sqlite3_prepare_v3(self->_sqlitedb, v11, -1, 1u, &ppStmt, 0);
          if (v12 != 10) {
            break;
          }
          double v13 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v36 = (const char *)v10;
            _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "Disk IO error detected while preparing statement %{public}@", buf, 0xCu);
          }

          if (![(ML3DatabaseConnection *)self _handleDiskIOError])
          {
            v19 = ML3DatabaseCreateDiskIOError();
            v20 = a4;
            goto LABEL_29;
          }
        }
        id v14 = v10;
        if (v12 > 0xAu) {
          break;
        }
        if (v12 - 5 >= 2)
        {
          if (!(_BYTE)v12)
          {
            v20 = a4;
            if (ppStmt)
            {
              v19 = 0;
              goto LABEL_30;
            }
LABEL_34:
            uint64_t v33 = *MEMORY[0x1E4F28568];
            v34 = @"An unknown error occurred while preparing a database statement.";
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ML3DatabaseErrorDomain" code:300 userInfo:v22];
            goto LABEL_35;
          }
          goto LABEL_26;
        }
        int v15 = v12;
        if ([(ML3DatabaseConnection *)self _handleBusyLockWithNumberOfRetries:v30])
        {
          v19 = [(ML3DatabaseConnection *)self sqliteError];
          v26 = _ML3LogCategoryDefault();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            Name = sel_getName(sel);
            v28 = "locked";
            *(_DWORD *)buf = 136315906;
            v36 = Name;
            __int16 v37 = 2080;
            if (v15 == 5) {
              v28 = "busy";
            }
            v38 = v28;
            __int16 v39 = 1024;
            unsigned int v40 = v30;
            __int16 v41 = 2114;
            v42 = v19;
            _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_DEFAULT, "(%s) SQLite was %s after %u retries. %{public}@", buf, 0x26u);
          }

          v20 = a4;
          id v10 = v14;
          goto LABEL_29;
        }
        ++v30;
      }
      if (v12 != 11 && v12 != 26)
      {
LABEL_26:
        v19 = [(ML3DatabaseConnection *)self sqliteError];
        v20 = a4;
        if (ppStmt)
        {
          sqlite3_finalize(ppStmt);
          ppStmt = 0;
        }
        v17 = [NSString stringWithFormat:@"Error preparing statement SQL. \"%@\" %@", v10, v19];
        double v18 = +[ML3DatabaseException databaseExceptionWithReason:v17 sqliteError:v19];
        [v18 raise];

        goto LABEL_29;
      }
      v20 = a4;
      if (ppStmt)
      {
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
      }
      [(ML3DatabaseConnection *)self _handleDatabaseCorruption];
      v19 = ML3DatabaseCreateCorruptionError();
LABEL_29:
      if (!ppStmt)
      {
        if (v19)
        {
          v9 = 0;
          goto LABEL_37;
        }
        goto LABEL_34;
      }
LABEL_30:
      v21 = [ML3DatabaseStatement alloc];
      v22 = [(ML3DatabaseStatement *)v21 initWithSQLiteStatement:ppStmt SQL:v10];
      id v31 = v19;
      BOOL v23 = [(ML3DatabaseConnection *)self _validatePreparedStatement:v22 error:&v31];
      id v24 = v31;

      if (v23)
      {
        v22 = v22;
        [(ML3DatabaseStatementCache *)self->_statementCache cacheStatement:v22];
        v9 = v22;
        goto LABEL_36;
      }
LABEL_35:
      v9 = 0;
LABEL_36:

      v19 = v24;
LABEL_37:
      if (v20 && v19) {
        id *v20 = v19;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_ensureConnectionIsOpen
{
  if (![(ML3DatabaseConnection *)self isOpen])
  {
    [(ML3DatabaseConnection *)self open];
    if (![(ML3DatabaseConnection *)self isOpen])
    {
      [(ML3DatabaseConnection *)self _raiseConnectionClosedException];
    }
  }
}

- (BOOL)isOpen
{
  return self->_isOpen && self->_sqlitedb != 0;
}

- (void)_internalLogQuery:(id)a3 withParameters:(id)a4 limitProperty:(id)a5 limitValue:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(ML3DatabaseConnection *)self logQueryPlans])
  {
    [(ML3DatabaseConnection *)self setLogQueryPlans:0];
    double v13 = [MEMORY[0x1E4F28E78] stringWithFormat:@"EXPLAIN QUERY PLAN for: %@\n", v10];
    uint64_t v14 = [@"EXPLAIN QUERY PLAN " stringByAppendingString:v10];

    int v15 = [(ML3DatabaseConnection *)self _internalExecuteQuery:v14 withParameters:v11 limitProperty:v12 limitValue:a6];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __83__ML3DatabaseConnection__internalLogQuery_withParameters_limitProperty_limitValue___block_invoke;
    v20 = &unk_1E5FB83F8;
    id v21 = v13;
    id v16 = v13;
    [v15 enumerateRowsWithBlock:&v17];
    NSLog(&stru_1F08D64D0.isa, v16, v17, v18, v19, v20);
    [(ML3DatabaseConnection *)self setLogQueryPlans:1];

    id v10 = (id)v14;
  }
}

- (BOOL)logQueryPlans
{
  return self->_logQueryPlans;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)flush
{
  [(ML3DatabaseConnection *)self popToRootTransactionAndCommit:0];

  [(ML3DatabaseConnection *)self _resetUnfinalizedStatements];
}

- (BOOL)popToRootTransactionAndCommit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(ML3DatabaseConnection *)self isInTransaction]) {
    return 0;
  }
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ ending transaction", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(ML3DatabaseConnection *)self _internalEndTransactionAndCommit:v3];
  os_unfair_lock_lock(&self->_lock);
  self->_transactionLevel = 0;
  self->_nestedTransactionWantsToRollback = 0;
  os_unfair_lock_unlock(&self->_lock);
  [(ML3DatabaseConnection *)self _executeTransactionCommitBlocks:v3];
  return v6;
}

- (BOOL)isInTransaction
{
  return [(ML3DatabaseConnection *)self transactionLevel] != 0;
}

- (unint64_t)transactionLevel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t transactionLevel = self->_transactionLevel;
  os_unfair_lock_unlock(p_lock);
  return transactionLevel;
}

- (void)_resetUnfinalizedStatements
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(ML3DatabaseStatementCache *)self->_statementCache allStatements];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) reset];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)executeQuery:(id)a3 withParameters:(id)a4
{
  return [(ML3DatabaseConnection *)self _internalExecuteQuery:a3 withParameters:a4 limitProperty:0 limitValue:0];
}

- (BOOL)open
{
  if (self->_isReadOnly) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  return [(ML3DatabaseConnection *)self _openWithFlags:v2];
}

- (void)setConnectionDelegate:(id)a3
{
}

- (void)_setOwningPool:(id)a3
{
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5 userData:(void *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = [[ML3DatabaseFunctionPointer alloc] initWithName:v10 argumentCount:v8];

  [(ML3DatabaseFunctionPointer *)v11 setFunctionPointer:a5];
  if (a6) {
    [(ML3DatabaseFunctionPointer *)v11 setUserData:a6];
  }
  BOOL v12 = [(ML3DatabaseFunctionPointer *)v11 registerWithConnection:self];
  if (v12) {
    [(NSMutableArray *)self->_registeredFunctions addObject:v11];
  }

  return v12;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 functionPointer:(void *)a5
{
  return [(ML3DatabaseConnection *)self registerFunctionName:a3 argumentCount:*(void *)&a4 functionPointer:a5 userData:0];
}

- (sqlite3)_sqliteHandle
{
  return self->_sqlitedb;
}

- (BOOL)registerFunctionName:(id)a3 argumentCount:(int)a4 block:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[ML3DatabaseFunctionBlock alloc] initWithName:v9 argumentCount:v5];

  [(ML3DatabaseFunctionBlock *)v10 setBlock:v8];
  BOOL v11 = [(ML3DatabaseFunctionBlock *)v10 registerWithConnection:self];
  if (v11) {
    [(NSMutableArray *)self->_registeredFunctions addObject:v10];
  }

  return v11;
}

- (id)executeQuery:(id)a3
{
  return [(ML3DatabaseConnection *)self _internalExecuteQuery:a3 withParameters:0 limitProperty:0 limitValue:0];
}

- (void)setReadOnly:(BOOL)a3
{
  BOOL v5 = [(ML3DatabaseConnection *)self isOpen];
  if ([(ML3DatabaseConnection *)self isOpen]) {
    [(ML3DatabaseConnection *)self close];
  }
  self->_isReadOnly = a3;
  if (v5)
  {
    [(ML3DatabaseConnection *)self open];
  }
}

- (void)setJournalingMode:(unint64_t)a3
{
  self->_journalingMode = a3;
}

- (ML3DatabaseConnection)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ML3DatabaseConnection;
  BOOL v5 = [(ML3DatabaseConnection *)&v20 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    databasePath = v6->_databasePath;
    v6->_databasePath = (NSString *)v7;

    v6->_isOpen = 0;
    v6->_isReadOnly = [(ML3DatabaseConnection *)v6 _isDeviceMediaLibraryDatabase];
    *(_OWORD *)&v6->_journalingMode = xmmword_1B04DA420;
    v6->_checkpointStatementThreshold = 1000;
    v6->_automaticCheckpointingEnabled = 0;
    *(_WORD *)&v6->_isHandlingIOError = 0;
    v6->_closeConnectionWhenCheckingIn = 0;
    v6->_sqlitedb = 0;
    id v9 = [[ML3DatabaseStatementCache alloc] initWithCacheSize:10];
    statementCache = v6->_statementCache;
    v6->_statementCache = v9;

    v6->_statementsSinceLastCheckpoint = 0;
    v6->_unint64_t transactionLevel = 0;
    v6->_nestedTransactionWantsToRollback = 0;
    BOOL v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    enqueuedTransactionCommitBlocks = v6->_enqueuedTransactionCommitBlocks;
    v6->_enqueuedTransactionCommitBlocks = v11;

    double v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registeredFunctions = v6->_registeredFunctions;
    v6->_registeredFunctions = v13;

    int v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registeredModules = v6->_registeredModules;
    v6->_registeredModules = v15;

    uint64_t v17 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = v17;
  }
  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  databasePath = self->_databasePath;
  uint64_t v6 = @"YES";
  if ([(ML3DatabaseConnection *)self isOpen]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  if ([(ML3DatabaseConnection *)self isReadOnly]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  if ([(ML3DatabaseConnection *)self _closeConnectionWhenCheckingIn]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  if (![(ML3DatabaseConnection *)self isInTransaction]) {
    uint64_t v6 = @"NO";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningPool);
  BOOL v11 = [v3 stringWithFormat:@"<%@ %p, path=%@, open=%@, readonly=%@, _closeConnectionWhenCheckingIn=%@, in transaction=%@, owning pool=%@>", v4, self, databasePath, v7, v8, v9, v6, WeakRetained];

  return v11;
}

- (BOOL)_closeConnectionWhenCheckingIn
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_closeConnectionWhenCheckingIn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_validatePreparedStatement:(id)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (-[ML3DatabaseConnection isReadOnly](self, "isReadOnly") && ([v6 isReadOnly] & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:@"Attempt to write a readonly database with statement %@", v6];
    v20[0] = *MEMORY[0x1E4F28568];
    v21[0] = v8;
    id v9 = [(id)objc_opt_class() description];
    v20[1] = v9;
    id v10 = [(ML3DatabaseConnection *)self description];
    v21[1] = v10;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    BOOL v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ML3DatabaseErrorDomain" code:200 userInfo:v11];
    double v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v6 sql];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Error preparing statement SQL. \"%{public}@\" %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v12;
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)_databaseFilePaths
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (_databaseFilePaths___once != -1) {
    dispatch_once(&_databaseFilePaths___once, &__block_literal_global_25631);
  }
  uint64_t v4 = (void *)_databaseFilePaths___dbfileSuffixesForJournalingMode;
  BOOL v5 = [NSNumber numberWithUnsignedInteger:self->_journalingMode];
  id v6 = [v4 objectForKey:v5];

  uint64_t v7 = [v6 count];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v7 != -1)
  {
    uint64_t v9 = 0;
    unsigned int v10 = 1;
    do
    {
      BOOL v11 = [(ML3DatabaseConnection *)self databasePath];
      if (v7 != v9)
      {
        BOOL v12 = [v6 objectAtIndex:v9];
        uint64_t v13 = [v11 stringByAppendingString:v12];

        BOOL v11 = (void *)v13;
      }
      if ([v8 fileExistsAtPath:v11]) {
        [v3 addObject:v11];
      }

      uint64_t v9 = v10;
    }
    while (v7 + 1 > (unint64_t)v10++);
  }

  return v3;
}

- (BOOL)_isDeviceMediaLibraryDatabase
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[ML3MusicLibrary mediaFolderPath];
  uint64_t v4 = objc_msgSend(v3, "msv_stringByResolvingRealPath");

  BOOL v5 = [(ML3DatabaseConnection *)self databasePath];
  if ([v5 hasPrefix:v4])
  {
    id v6 = [(ML3DatabaseConnection *)self databasePath];
    char v7 = [v6 containsString:@"MediaLibrary.sqlitedb"];

    if (v7)
    {
      BOOL v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [(ML3DatabaseConnection *)self databasePath];
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    int v15 = v4;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "Database at path %{public}@, mediaFolderPath %{public}@ is not mediaLibraryDatabase", (uint8_t *)&v12, 0x16u);
  }
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)_openWithFlags:(int)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  if (self->_databasePath)
  {
    uint64_t v4 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained connectionWillOpenDatabase:v4];
    }
    id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v4->_isReadOnly) {
        char v7 = @"readonly";
      }
      else {
        char v7 = @"readwrite";
      }
      BOOL v8 = [(ML3DatabaseConnection *)v4 databasePath];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&long long v127 = v8;
      WORD4(v127) = 1024;
      *(_DWORD *)((char *)&v127 + 10) = a3;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Trying to open %{public}@ connection %{public}@ to database at path %{public}@ with flags=%d", buf, 0x26u);
    }
    if ((a3 & 2) != 0)
    {
      v4->_BOOL isReadOnly = 0;
      uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isReadOnly = v4->_isReadOnly;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = isReadOnly;
        BOOL v11 = "Adjusting connection %{public}@ setting _isReadOnly=%{BOOL}u as the flags are SQLITE_OPEN_READWRITE";
        goto LABEL_16;
      }
    }
    else
    {
      if ((a3 & 1) == 0)
      {
LABEL_18:
        if ([(ML3DatabaseConnection *)v4 _databaseFilesAreWritable]
          || v4->_journalingMode == 1)
        {
          a3 = a3 & 0xFFFFFFFC | 2;
          uint64_t v13 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v4;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = a3;
            _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Adjusting connection %{public}@ setting openFlags=%d to account for WAL files", buf, 0x12u);
          }
        }
        uint64_t v14 = __daemonProcessInfo;
        uint64_t v15 = __daemonProcessInfo != 0;
        if (__daemonProcessInfo)
        {
          a3 |= 0x1000000u;
          uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v4;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = a3;
            _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "Adjusting connection %{public}@ setting openFlags=%d for medialibrary deamon", buf, 0x12u);
          }
        }
        BOOL v17 = [(ML3DatabaseConnection *)v4 _isDeviceMediaLibraryDatabase];
        if (!v17) {
          uint64_t v15 = !v4->_isReadOnly;
        }
        __int16 v18 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          databasePath = v4->_databasePath;
          BOOL v20 = v4->_isReadOnly;
          *(_DWORD *)buf = 138544898;
          *(void *)&uint8_t buf[4] = v4;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = databasePath;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v127) = v20;
          WORD2(v127) = 1024;
          *(_DWORD *)((char *)&v127 + 6) = v17;
          WORD5(v127) = 1024;
          HIDWORD(v127) = v14 != 0;
          __int16 v128 = 1024;
          int v129 = v15;
          __int16 v130 = 1024;
          int v131 = a3;
          _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ attempting to open database at %{public}@ _isReadOnly=%{BOOL}u, isDeviceMediaLibraryDatabase=%{BOOL}u, isMediaLibraryDeamon=%{BOOL}u, canCreateDatabase=%{BOOL}u, openFlags=%d,", buf, 0x34u);
        }

        if (v15)
        {
          a3 |= 4u;
          [(ML3DatabaseConnection *)v4 _createDatabaseDirectoryIfNonexistent];
        }
        else if (v4->_isReadOnly)
        {
          id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
          char v22 = [v21 fileExistsAtPath:v4->_databasePath];

          if ((v22 & 1) == 0)
          {
            v34 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v35 = v4->_databasePath;
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v4;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v35;
              _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_ERROR, "Connection %{public}@ is readOnly, creating DB is NOT allowed and database file doesn't exist at %{public}@", buf, 0x16u);
            }

            goto LABEL_135;
          }
        }
        unint64_t protectionLevel = v4->_protectionLevel;
        if (protectionLevel > 3) {
          int v24 = 7340032;
        }
        else {
          int v24 = dword_1B04DA450[protectionLevel];
        }
        int v25 = v24 | a3;
        ppDb = 0;
        errmsg = 0;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __MLSetSQLiteAutoTraceEnabled_block_invoke;
        *(void *)&long long v127 = &__block_descriptor_33_e5_v8__0l;
        BYTE8(v127) = 1;
        _MLDispatchToSerialQueue(0, buf);
        v26 = [(NSString *)v4->_databasePath fileSystemRepresentation];
        int v27 = sqlite3_open_v2(v26, &ppDb, v25, 0);
        v106 = WeakRetained;
        unsigned int v102 = v25;
        if (v27)
        {
          int v28 = v27;
          uint64_t v29 = v27;
          BOOL v30 = v27 == 11 || v27 == 267 || v27 == 26;
          v36 = sqlite3_errstr(v27);
          __int16 v37 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = "<nil>";
            *(_DWORD *)buf = 136447234;
            if (v36) {
              v38 = v36;
            }
            *(void *)&uint8_t buf[4] = v26;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v28;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v29;
            LOWORD(v127) = 1024;
            *(_DWORD *)((char *)&v127 + 2) = v30;
            WORD3(v127) = 2082;
            *((void *)&v127 + 1) = v38;
            _os_log_impl(&dword_1B022D000, v37, OS_LOG_TYPE_DEFAULT, "SQLite detected while opening database at '%{public}s'. errorCode=%d, minimalCode=%d, corrupted=%{BOOL}u, errorMsg=%{public}s", buf, 0x28u);
          }

          if (v30)
          {
            uint64_t v39 = ML3DatabaseCreateCorruptionError();
          }
          else
          {
            if (((v28 & 0xFB) == 0xA || v29 == 15)
              && [(ML3DatabaseConnection *)v4 _handleDiskIOError])
            {
              BOOL v30 = 0;
              v107 = 0;
LABEL_66:
              unsigned int v40 = 0;
              uint64_t v41 = 0;
              uint64_t v42 = 0;
              goto LABEL_110;
            }
            uint64_t v39 = [(ML3DatabaseConnection *)v4 sqliteError];
          }
          v107 = (void *)v39;
          goto LABEL_66;
        }
        sqlite3_extended_result_codes(ppDb, 1);
        unint64_t journalingMode = v4->_journalingMode;
        unsigned int v93 = v15;
        if (journalingMode)
        {
          if (journalingMode != 1)
          {
            char v98 = 1;
            unsigned int v96 = 0;
            unsigned int v100 = 0;
            v104 = 0;
            goto LABEL_86;
          }
          int v118 = 1;
          unsigned int v100 = sqlite3_file_control(ppDb, 0, 10, &v118);
          if (v100)
          {
            v32 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v4;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v100;
              _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ could not enable SQLITE_FCNTL_PERSIST_WAL option, result %d", buf, 0x12u);
            }

            uint64_t v33 = @"enable SQLITE_FCNTL_PERSIST_WAL option failed";
            if (![(ML3DatabaseConnection *)v4 _handleConnectionErrorWhileOpening:v100])
            {
              v104 = @"enable SQLITE_FCNTL_PERSIST_WAL option failed";
              unsigned int v96 = 0;
LABEL_72:
              char v98 = 0;
LABEL_86:
              v125[0] = v4->_databasePath;
              v52 = [v125[0] stringByAppendingString:@"-shm"];
              v125[1] = v52;
              v108 = v4;
              v53 = [(NSString *)v4->_databasePath stringByAppendingString:@"-wal"];
              v125[2] = v53;
              v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:3];

              long long v115 = 0u;
              long long v116 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id v55 = v54;
              uint64_t v56 = [v55 countByEnumeratingWithState:&v113 objects:v124 count:16];
              if (v56)
              {
                uint64_t v57 = v56;
                uint64_t v58 = *(void *)v114;
                do
                {
                  for (uint64_t i = 0; i != v57; ++i)
                  {
                    if (*(void *)v114 != v58) {
                      objc_enumerationMutation(v55);
                    }
                    uint64_t v60 = *(void *)(*((void *)&v113 + 1) + 8 * i);
                    v61 = [MEMORY[0x1E4F28CB8] defaultManager];
                    int v62 = [v61 fileExistsAtPath:v60];

                    if (v62)
                    {
                      char value = 0;
                      id v63 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v60];
                      if (getxattr((const char *)[v63 fileSystemRepresentation], "com.apple.runningboard.can-suspend-locked", 0, 0, 0, 0) == 1)getxattr((const char *)objc_msgSend(v63, "fileSystemRepresentation"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0); {
                      if (!value)
                      }
                      {
                        char value = -1;
                        id v64 = v63;
                        int v65 = setxattr((const char *)[v64 fileSystemRepresentation], "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
                        if (v65)
                        {
                          int v66 = v65;
                          v67 = os_log_create("com.apple.amp.medialibrary", "Default");
                          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138543874;
                            *(void *)&uint8_t buf[4] = v108;
                            *(_WORD *)&buf[12] = 2114;
                            *(void *)&buf[14] = v64;
                            *(_WORD *)&buf[22] = 1024;
                            LODWORD(v127) = v66;
                            _os_log_impl(&dword_1B022D000, v67, OS_LOG_TYPE_ERROR, "%{public}@ Failed to set can-suspend-locked xattr on file %{public}@. err=%d", buf, 0x1Cu);
                          }
                        }
                      }
                    }
                  }
                  uint64_t v57 = [v55 countByEnumeratingWithState:&v113 objects:v124 count:16];
                }
                while (v57);
              }

              if (v98)
              {
                uint64_t v4 = v108;
                uint64_t v41 = v100;
                if (__daemonProcessInfo
                  && !v108->_isReadOnly
                  && (uint64_t v86 = sqlite3_exec(ppDb, "PRAGMA cache_size=500", 0, 0, &errmsg), v86))
                {
                  uint64_t v42 = v86;
                  v87 = _ML3LogCategoryDefault();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    *(void *)&uint8_t buf[4] = v108;
                    *(_WORD *)&buf[12] = 2082;
                    *(void *)&buf[14] = errmsg;
                    *(_WORD *)&buf[22] = 1024;
                    LODWORD(v127) = v42;
                    _os_log_impl(&dword_1B022D000, v87, OS_LOG_TYPE_DEFAULT, "Warning: connection %{public}@ could not set cache size. %{public}s, result %d", buf, 0x1Cu);
                  }

                  BOOL v88 = [(ML3DatabaseConnection *)v108 _handleConnectionErrorWhileOpening:v42];
                  MLSetSQLiteAutoTraceEnabled(0);
                  if (!v88)
                  {
                    BOOL v30 = 0;
                    v107 = 0;
                    uint64_t v29 = 0;
                    unsigned int v40 = @"set cache size error";
                    uint64_t v15 = v93;
                    goto LABEL_111;
                  }
                }
                else
                {

                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __MLSetSQLiteAutoTraceEnabled_block_invoke;
                  *(void *)&long long v127 = &__block_descriptor_33_e5_v8__0l;
                  BYTE8(v127) = 0;
                  _MLDispatchToSerialQueue(0, buf);
                }
                v108->_isOpen = 1;
                v108->_sqlitedb = ppDb;
                if (v108->_iTunesExtensions) {
                  DestroySQLExtensions((sqlite3 **)v108->_iTunesExtensions);
                }
                CreateSQLExtensionsOnSqliteConnection();
              }

              BOOL v30 = 0;
              v107 = 0;
              uint64_t v29 = 0;
              uint64_t v4 = v108;
              uint64_t v15 = v93;
              unsigned int v40 = v104;
              uint64_t v41 = v100;
              uint64_t v42 = v96;
LABEL_110:
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __MLSetSQLiteAutoTraceEnabled_block_invoke;
              *(void *)&long long v127 = &__block_descriptor_33_e5_v8__0l;
              BYTE8(v127) = 0;
              _MLDispatchToSerialQueue(0, buf);
LABEL_111:
              v4->_isOpen = 0;
              v68 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                id v69 = (id)objc_opt_class();
                uint64_t v70 = v42;
                v71 = v4->_databasePath;
                v72 = sqlite3_errmsg(ppDb);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v69;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v71;
                uint64_t v42 = v70;
                *(_WORD *)&buf[22] = 2082;
                *(void *)&long long v127 = v72;
                _os_log_impl(&dword_1B022D000, v68, OS_LOG_TYPE_ERROR, "[%@] Unable to open database connection to path %{public}@. %{public}s", buf, 0x20u);
              }
              if (errmsg)
              {
                objc_msgSend(NSString, "stringWithFormat:", @"%s", errmsg);
                v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v73 = &stru_1F08D4D70;
              }
              dispatch_semaphore_t v95 = dispatch_semaphore_create(0);
              v97 = (void *)MEMORY[0x1E4F77950];
              v121[0] = @"corrupted";
              v109 = [NSNumber numberWithBool:v30];
              v122[0] = v109;
              v121[1] = @"openError";
              uint64_t v74 = (uint64_t)v107;
              if (!v107)
              {
                uint64_t v74 = [MEMORY[0x1E4F1CA98] null];
              }
              v75 = (uint64_t *)MEMORY[0x1E4F778D0];
              v90 = (void *)v74;
              v122[1] = v74;
              v121[2] = @"minimalCode";
              v101 = [NSNumber numberWithInt:v29];
              v122[2] = v101;
              v121[3] = @"canCreateDatabase";
              v99 = [NSNumber numberWithBool:v15];
              v122[3] = v99;
              v121[4] = @"openFlags";
              v103 = [NSNumber numberWithInt:v102];
              v122[4] = v103;
              v121[5] = @"isReadOnly";
              v94 = [NSNumber numberWithBool:v4->_isReadOnly];
              v122[5] = v94;
              v121[6] = @"sqliteResult";
              v92 = [NSNumber numberWithInt:v42];
              v122[6] = v92;
              v121[7] = @"walResult";
              v91 = [NSNumber numberWithInt:v41];
              v122[7] = v91;
              v121[8] = @"path";
              v76 = v4->_databasePath;
              uint64_t v77 = (uint64_t)v76;
              if (!v76)
              {
                uint64_t v77 = [MEMORY[0x1E4F1CA98] null];
              }
              uint64_t v78 = *v75;
              v89 = (void *)v77;
              v122[8] = v77;
              v121[9] = @"context";
              v79 = v40;
              v105 = v40;
              if (!v40)
              {
                v79 = [MEMORY[0x1E4F1CA98] null];
              }
              v80 = v4;
              v122[9] = v79;
              v121[10] = @"sqlErrorString";
              v81 = v73;
              if (!v73)
              {
                v81 = [MEMORY[0x1E4F1CA98] null];
              }
              v122[10] = v81;
              v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:11];
              v123 = v82;
              v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
              v110[0] = MEMORY[0x1E4F143A8];
              v110[1] = 3221225472;
              v110[2] = __40__ML3DatabaseConnection__openWithFlags___block_invoke;
              v110[3] = &unk_1E5FB8298;
              v84 = v95;
              v111 = v84;
              [v97 snapshotWithDomain:v78 type:@"Bug" subType:@"Database Validation Bug" context:@"database open error" triggerThresholdValues:0 events:v83 completion:v110];

              if (!v73) {
              if (!v105)
              }

              if (!v76) {
              if (!v107)
              }

              dispatch_semaphore_wait(v84, 0xFFFFFFFFFFFFFFFFLL);
              [(ML3DatabaseConnection *)v80 _logDatabaseFileDebugInformation];
              sqlite3_close(ppDb);
              if (objc_opt_respondsToSelector()) {
                [v106 connection:v80 didFailToOpenDatabaseWithError:v107];
              }

              id WeakRetained = v106;
LABEL_135:

              return 0;
            }
          }
          else
          {
            uint64_t v33 = 0;
          }
          uint64_t v47 = sqlite3_exec(ppDb, "PRAGMA journal_mode=WAL", 0, 0, &errmsg);
          if (v47)
          {
            uint64_t v48 = v47;
            v49 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v4;
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = errmsg;
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v127) = v48;
              _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_DEFAULT, "Warning: connection %{public}@ could not enable WAL journal mode. %{public}s, result %d", buf, 0x1Cu);
            }
            unsigned int v96 = 0;
            v50 = @"enable WAL journal mode failed";
            unsigned int v100 = v48;
LABEL_84:
            v104 = v50;

            char v98 = [(ML3DatabaseConnection *)v4 _handleConnectionErrorWhileOpening:v48];
            goto LABEL_86;
          }
        }
        else
        {
          int v117 = 0;
          uint64_t v43 = sqlite3_file_control(ppDb, 0, 10, &v117);
          if (v43)
          {
            uint64_t v44 = v43;
            v45 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v4;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v44;
              _os_log_impl(&dword_1B022D000, v45, OS_LOG_TYPE_DEFAULT, "Connection %{public}@ could not disable SQLITE_FCNTL_PERSIST_WAL option, result %d", buf, 0x12u);
            }

            unsigned int v96 = v44;
            BOOL v46 = [(ML3DatabaseConnection *)v4 _handleConnectionErrorWhileOpening:v44];
            uint64_t v33 = @"disable SQLITE_FCNTL_PERSIST_WAL option failed";
            if (!v46)
            {
              v104 = @"disable SQLITE_FCNTL_PERSIST_WAL option failed";
              unsigned int v100 = 0;
              goto LABEL_72;
            }
          }
          else
          {
            uint64_t v33 = 0;
          }
          uint64_t v51 = sqlite3_exec(ppDb, "PRAGMA journal_mode=DELETE", 0, 0, &errmsg);
          if (v51)
          {
            uint64_t v48 = v51;
            v49 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v4;
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = errmsg;
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v127) = v48;
              _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_DEFAULT, "Warning: connection %{public}@ could not update journaling mode to DELETE. %{public}s, result %d", buf, 0x1Cu);
            }
            unsigned int v100 = 0;
            v50 = @"update journaling mode to DELETE failed";
            unsigned int v96 = v48;
            goto LABEL_84;
          }
        }
        v104 = v33;
        unsigned int v96 = 0;
        unsigned int v100 = 0;
        char v98 = 1;
        goto LABEL_86;
      }
      v4->_BOOL isReadOnly = 1;
      uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = v4->_isReadOnly;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        BOOL v11 = "Adjusting connection %{public}@ setting _isReadOnly=%{BOOL}u as the flags are SQLITE_OPEN_READONLY";
LABEL_16:
        _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0x12u);
      }
    }

    goto LABEL_18;
  }
  ML3DatabaseConnectionRaiseNilDatabasePath();
  return 0;
}

- (BOOL)_databaseFilesAreWritable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ML3DatabaseConnection *)self _databaseFilePaths];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(v3, "isWritableFileAtPath:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          LOBYTE(v5) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    LOBYTE(v5) = 1;
  }
LABEL_11:

  return v5;
}

- (void)setPrivacyContext:(id)a3
{
}

- (int)_distrustQueriesDuringBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  uint64_t pUserData = 0;
  int v5 = sqlite3_set_authorizer(self->_sqlitedb, (int (__cdecl *)(void *, int, const char *, const char *, const char *, const char *))_databaseAuthorizer, (char *)&pUserData + 4);
  if (v5)
  {
    int v6 = v5;
    char v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sqlitedb = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      int v26 = v6;
      __int16 v27 = 2048;
      int v28 = sqlitedb;
      long long v9 = "Enabling authorizer failed: %d, connection: %p";
LABEL_10:
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  int v10 = sqlite3_db_config(self->_sqlitedb, 1010, 1, &pUserData);
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = pUserData == 1;
  }
  if (!v11)
  {
    int v12 = v10;
    char v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      int v26 = v12;
      __int16 v27 = 2048;
      int v28 = v13;
      long long v9 = "Enabling defensive mode failed: %d, connection: %p";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  v4[2](v4);
LABEL_12:
  int v14 = sqlite3_db_config(self->_sqlitedb, 1010, 0, &pUserData);
  if (v14 | pUserData)
  {
    int v15 = v14;
    uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      int v26 = v15;
      __int16 v27 = 2048;
      int v28 = v17;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "Disabling defensive mode failed: %d, connection: %p", buf, 0x12u);
    }
  }
  int v18 = sqlite3_set_authorizer(self->_sqlitedb, 0, 0);
  if (v18)
  {
    int v19 = v18;
    BOOL v20 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = self->_sqlitedb;
      *(_DWORD *)buf = 67109376;
      int v26 = v19;
      __int16 v27 = 2048;
      int v28 = v21;
      _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_ERROR, "Disabling authorizer failed: %d, connection: %p", buf, 0x12u);
    }
  }
  int v22 = HIDWORD(pUserData);

  return v22;
}

- (BOOL)pushTransaction
{
  return [(ML3DatabaseConnection *)self pushTransactionUsingBehaviorType:0];
}

- (BOOL)pushTransactionUsingBehaviorType:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(ML3DatabaseConnection *)self isInTransaction])
  {
    [(ML3DatabaseConnection *)self setTransactionLevel:[(ML3DatabaseConnection *)self transactionLevel] + 1];
    return 1;
  }
  else if ([(ML3DatabaseConnection *)self _internalBeginTransactionWithBehaviorType:a3])
  {
    os_unfair_lock_lock(&self->_lock);
    self->_nestedTransactionWantsToRollback = 0;
    BOOL v5 = 1;
    self->_unint64_t transactionLevel = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    int v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      long long v9 = self;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Warning: unable to begin transaction on connection: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
  return v5;
}

- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(ML3DatabaseConnection *)self transactionMarkedForRollBack])
  {
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v8;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "failing update request in a transaction marked for rollback. sql=%{public}@", (uint8_t *)&v13, 0xCu);
    }

    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = [(ML3DatabaseConnection *)self _internalExecuteUpdate:v8 withParameters:v9 error:a5];
  }

  return v11;
}

- (BOOL)transactionMarkedForRollBack
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_nestedTransactionWantsToRollback;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCurrentTransactionID:(id)a3
{
}

- (BOOL)popTransactionAndCommit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t transactionLevel = self->_transactionLevel;
  BOOL nestedTransactionWantsToRollback = self->_nestedTransactionWantsToRollback;
  os_unfair_lock_unlock(p_lock);
  if (transactionLevel)
  {
    if (transactionLevel == 1)
    {
      BOOL v8 = !nestedTransactionWantsToRollback && v3;
      BOOL v3 = [(ML3DatabaseConnection *)self _internalEndTransactionAndCommit:v8];
      if (v3)
      {
        os_unfair_lock_lock(p_lock);
        self->_unint64_t transactionLevel = 0;
        self->_BOOL nestedTransactionWantsToRollback = 0;
        os_unfair_lock_unlock(p_lock);
      }
      else
      {
        uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138543362;
          int v13 = self;
          _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Warning: unable to end transaction on connection %{public}@", (uint8_t *)&v12, 0xCu);
        }
      }
      [(ML3DatabaseConnection *)self _executeTransactionCommitBlocks:v8];
    }
    else
    {
      os_unfair_lock_lock(p_lock);
      --self->_transactionLevel;
      self->_nestedTransactionWantsToRollback |= !v3;
      os_unfair_lock_unlock(p_lock);
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "Warning: attempted to end a non-existent transaction.", (uint8_t *)&v12, 2u);
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_executeTransactionCommitBlocks:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[(NSMutableArray *)self->_enqueuedTransactionCommitBlocks copy];
  [(NSMutableArray *)self->_enqueuedTransactionCommitBlocks removeAllObjects];
  int v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v13 = self;
    __int16 v14 = 1024;
    int v15 = [v5 count];
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ running %d transaction commit blocks", buf, 0x12u);
  }

  char v7 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ML3DatabaseConnection__executeTransactionCommitBlocks___block_invoke;
  v9[3] = &unk_1E5FB80E8;
  id v10 = v5;
  BOOL v11 = a3;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (ML3DatabaseConnectionDelegate)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);

  return (ML3DatabaseConnectionDelegate *)WeakRetained;
}

- (BOOL)_internalBeginTransactionWithBehaviorType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[ML3DatabaseStatementRenderer defaultRenderer];
  int v6 = [v5 beginTransactionStatementWithBehaviorType:a3];

  id v14 = 0;
  BOOL v7 = [(ML3DatabaseConnection *)self _internalExecuteUpdate:v6 withParameters:0 error:&v14];
  id v8 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      if (!self->_currentTransactionID)
      {
        id v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
        currentTransactionID = self->_currentTransactionID;
        self->_currentTransactionID = v10;
      }
      [WeakRetained connectionDidBeginDatabaseTransaction:self];
    }
  }
  else
  {
    int v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Error beginning transaction on connection: %{public}@. %{public}@", buf, 0x16u);
    }
  }
  return v7;
}

- (BOOL)_internalEndTransactionAndCommit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[ML3DatabaseStatementRenderer defaultRenderer];
  int v6 = v5;
  if (v3) {
    [v5 commitTransactionStatement];
  }
  else {
  BOOL v7 = [v5 rollbackTranscationStatement];
  }

  id v14 = 0;
  BOOL v8 = [(ML3DatabaseConnection *)self _internalExecuteUpdate:v7 withParameters:0 error:&v14];
  id v9 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if (v8)
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained connection:self didEndDatabaseTransactionAndCommit:v3];
    }
  }
  else
  {
    BOOL v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Error ending transaction on connection: %{public}@. %{public}@", buf, 0x16u);
    }
  }
  currentTransactionID = self->_currentTransactionID;
  self->_currentTransactionID = 0;

  return v8;
}

- (BOOL)_internalExecuteUpdate:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  [(ML3DatabaseConnection *)self _ensureConnectionIsOpen];
  [(ML3DatabaseConnection *)self _internalLogQuery:v9 withParameters:v8 limitProperty:0 limitValue:0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v11 = v10;
  id v23 = 0;
  int v12 = [(ML3DatabaseConnection *)self _prepareStatement:v9 error:&v23];

  id v13 = v23;
  if (!v12)
  {
    BOOL v14 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v8) {
    [v12 bindValuesInArray:v8];
  }
  id v22 = v13;
  BOOL v14 = [(ML3DatabaseConnection *)self _executeStatement:v12 withError:&v22];
  id v15 = v22;

  [v12 reset];
  id v13 = v15;
  if (a5)
  {
LABEL_7:
    if (v13) {
      *a5 = v13;
    }
  }
LABEL_9:
  BOOL v16 = self->_automaticCheckpointingEnabled && v14;
  if (v16 && ![(ML3DatabaseConnection *)self isReadOnly])
  {
    unint64_t v17 = self->_statementsSinceLastCheckpoint + 1;
    self->_statementsSinceLastCheckpoint = v17;
    if (v17 >= self->_checkpointStatementThreshold
      && ![(ML3DatabaseConnection *)self checkpointDatabase])
    {
      self->_statementsSinceLastCheckpoint = 0;
    }
  }
  if ([(ML3DatabaseConnection *)self logQueryPlans])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Executed in %.1f", v18 - v11);
    NSLog(&stru_1F08D64D0.isa, v19);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained connectionDidAccessDatabase:self];
  }

  return v14;
}

- (BOOL)_executeStatement:(id)a3 withError:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(ML3DatabaseConnection *)self _ensureConnectionIsOpen];
  uint64_t v9 = 0;
  uint64_t v10 = *MEMORY[0x1E4F778C0];
  while (1)
  {
    double v11 = (void *)MEMORY[0x1B3E93C70](v8);
    int v12 = [v7 step];
    if (v12 - 5 >= 2) {
      break;
    }
    int v13 = v12;
    [v7 reset];
    if ([(ML3DatabaseConnection *)self _handleBusyLockWithNumberOfRetries:v9])
    {
      id v15 = [(ML3DatabaseConnection *)self sqliteError];
      BOOL v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        Name = sel_getName(a2);
        double v18 = "locked";
        *(_DWORD *)buf = 136315906;
        v35 = Name;
        __int16 v36 = 2080;
        if (v13 == 5) {
          double v18 = "busy";
        }
        __int16 v37 = v18;
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v40 = 2114;
        id v41 = v15;
        _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "(%s) SQLite was %s after %u retries. %{public}@", buf, 0x26u);
      }

      goto LABEL_25;
    }
    uint64_t v9 = (v9 + 1);
  }
  if (v12 <= 0x63u)
  {
    if (v12 == 10)
    {
      uint64_t v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = (const char *)v7;
        _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_ERROR, "Disk IO error detected while executing statement %{public}@", buf, 0xCu);
      }

      ML3DatabaseCreateDiskIOError();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [(ML3DatabaseConnection *)self _handleDiskIOError];
      goto LABEL_25;
    }
    if (v12 == 11 || v12 == 26)
    {
      BOOL v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = (const char *)v7;
        _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Database corruption detected while executing statement %{public}@", buf, 0xCu);
      }

      [(ML3DatabaseConnection *)self _handleDatabaseCorruption];
      ML3DatabaseCreateCorruptionError();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v12 - 100 > 1)
  {
LABEL_24:
    id v15 = [(ML3DatabaseConnection *)self sqliteError];
    BOOL v30 = [NSString stringWithFormat:@"Error stepping statement. %@ %@", v7, v15];
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    uint64_t v29 = (void *)MEMORY[0x1E4F77950];
    BOOL v20 = NSString;
    id v21 = [v15 domain];
    int v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "code"));
    id v22 = [v20 stringWithFormat:@"Error domain=%@ code=%@", v21, v28];
    uint64_t v33 = v30;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__ML3DatabaseConnection__executeStatement_withError___block_invoke;
    v31[3] = &unk_1E5FB8298;
    dispatch_semaphore_t v32 = v27;
    int v24 = v27;
    [v29 snapshotWithDomain:v10 type:@"Bug" subType:@"ML3SQLiteBug" context:v22 triggerThresholdValues:0 events:v23 completion:v31];

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    int v25 = +[ML3DatabaseException databaseExceptionWithReason:v30 sqliteError:v15];
    [v25 raise];

LABEL_25:
    if (a4 && v15)
    {
      id v15 = v15;
      *a4 = v15;
    }
    goto LABEL_28;
  }
  if ([v7 clearBindingsAfterRunning]) {
    [v7 clearBindings];
  }
  id v15 = 0;
LABEL_28:

  return v15 == 0;
}

- (NSUUID)currentTransactionID
{
  return self->_currentTransactionID;
}

void __57__ML3DatabaseConnection__executeTransactionCommitBlocks___block_invoke(uint64_t a1)
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

void __43__ML3DatabaseConnection__databaseFilePaths__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0912538;
  v2[1] = &unk_1F0912550;
  v3[0] = &unk_1F0910A68;
  v3[1] = &unk_1F0910A80;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  id v1 = (void *)_databaseFilePaths___dbfileSuffixesForJournalingMode;
  _databaseFilePaths___dbfileSuffixesForJournalingMode = v0;
}

- (BOOL)databasePathExists
{
  if (ML3IsMemorySQLiteDatabasePath(self->_databasePath)) {
    return 1;
  }
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:self->_databasePath];

  return v5;
}

- (void)_createDatabaseDirectoryIfNonexistent
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(NSString *)self->_databasePath stringByDeletingLastPathComponent];
  if (([v3 fileExistsAtPath:v4] & 1) == 0)
  {
    id v7 = 0;
    char v5 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v7];
    id v6 = v7;
    if ((v5 & 1) == 0)
    {
      ML3DatabaseConnectionCheckDatabasePathAndRaiseIfNecessary(self->_databasePath);
      ML3RaiseExceptionWithError(v6);
    }
  }
}

- (BOOL)_alterTableNamed:(id)a3 withNewColumnDefinitions:(id)a4 newColumnNames:(id)a5 oldColumnNames:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  dispatch_semaphore_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __114__ML3DatabaseConnection_SchemaUtilities___alterTableNamed_withNewColumnDefinitions_newColumnNames_oldColumnNames___block_invoke;
  v19[3] = &unk_1E5FB4758;
  id v14 = v11;
  id v20 = v14;
  id v15 = v10;
  int v25 = &v26;
  id v21 = v15;
  id v22 = self;
  id v16 = v12;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  [(ML3DatabaseConnection *)self performTransactionWithBlock:v19];
  LOBYTE(self) = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)self;
}

uint64_t __114__ML3DatabaseConnection_SchemaUtilities___alterTableNamed_withNewColumnDefinitions_newColumnNames_oldColumnNames___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) componentsJoinedByString:@","];
  uint64_t v3 = [NSString stringWithFormat:@"%@_new", *(void *)(a1 + 40)];
  uint64_t v4 = [NSString stringWithFormat:@"CREATE TABLE %@ (%@)", v3, v2];
  char v5 = *(void **)(a1 + 48);
  id v30 = 0;
  char v6 = [v5 executeUpdate:v4 withParameters:0 error:&v30];
  id v7 = v30;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    long long v8 = [*(id *)(a1 + 56) componentsJoinedByString:@", "];
    long long v9 = [*(id *)(a1 + 64) componentsJoinedByString:@", "];
    uint64_t v10 = [NSString stringWithFormat:@"INSERT INTO %@ (%@) SELECT %@ FROM %@", v3, v8, v9, *(void *)(a1 + 40)];
    id v11 = *(void **)(a1 + 48);
    v29[1] = v7;
    dispatch_semaphore_t v27 = (void *)v10;
    char v12 = objc_msgSend(v11, "executeUpdate:withParameters:error:");
    id v13 = v7;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v12;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      uint64_t v26 = v9;
      id v14 = [NSString stringWithFormat:@"DROP TABLE %@", *(void *)(a1 + 40)];
      id v15 = *(void **)(a1 + 48);
      v29[0] = v13;
      char v16 = [v15 executeUpdate:v14 withParameters:0 error:v29];
      id v17 = v29[0];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v16;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        double v18 = [NSString stringWithFormat:@"ALTER TABLE %@ RENAME TO %@", v3, *(void *)(a1 + 40)];
        uint64_t v19 = *(void **)(a1 + 48);
        id v28 = v17;
        char v20 = [v19 executeUpdate:v18 withParameters:0 error:&v28];
        id v13 = v28;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v20;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          uint64_t v21 = 1;
        }
        else
        {
          id v23 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v24 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            id v32 = v3;
            __int16 v33 = 2114;
            id v34 = v24;
            __int16 v35 = 2114;
            id v36 = v13;
            _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_ERROR, "Failed to rename temporary table %{public}@ to permanent name %{public}@. %{public}@", buf, 0x20u);
          }

          uint64_t v21 = 0;
        }
      }
      else
      {
        double v18 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v22 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          id v32 = v22;
          __int16 v33 = 2114;
          id v34 = v17;
          _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_ERROR, "Failed to drop old %{public}@ table. %{public}@", buf, 0x16u);
        }
        uint64_t v21 = 0;
        id v13 = v17;
      }

      long long v9 = v26;
    }
    else
    {
      id v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v13;
        _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate data to temporary table for column rename. %{public}@", buf, 0xCu);
      }
      uint64_t v21 = 0;
    }

    id v7 = v13;
  }
  else
  {
    long long v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v7;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "Failed to create temporary table for rename. %{public}@", buf, 0xCu);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)_enumerateTableColumnNamesAndDefinitionsFromTable:(id)a3 usingBlock:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    char v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 131, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 132, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  v41[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  id v11 = [(ML3DatabaseConnection *)self executeQuery:@"SELECT sql FROM sqlite_master WHERE type='table' AND name=?" withParameters:v10];
  char v12 = [v11 stringValueForFirstRowAndColumn];

  id v13 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^CREATE( TEMPORARY)* TABLE \"*(\\w+)\"*( IF NOT EXISTS)* \\(([\\w\\s'\",]+)\\)" options:1 error:0];
  id v14 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(\\w+)( \\w+)*( \\w+)*" options:0 error:0];
  id v15 = objc_msgSend(v13, "firstMatchInString:options:range:", v12, 0, 0, objc_msgSend(v12, "length"));
  if ((unint64_t)[v15 numberOfRanges] < 5)
  {
    id v28 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_ERROR, "Unable to parse table schema from sqlite_master.", buf, 2u);
    }
  }
  else
  {
    id v32 = v15;
    __int16 v33 = v13;
    id v34 = v7;
    uint64_t v16 = [v15 rangeAtIndex:4];
    id v31 = objc_msgSend(v12, "substringWithRange:", v16, v17);
    double v18 = [v31 componentsSeparatedByString:@","];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v24 = objc_msgSend(v14, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length"));
          int v25 = 0;
          if ((unint64_t)[v24 numberOfRanges] >= 2)
          {
            uint64_t v26 = [v24 rangeAtIndex:1];
            int v25 = objc_msgSend(v23, "substringWithRange:", v26, v27);
          }
          ((void (**)(void, void *, void *))v9)[2](v9, v25, v23);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v20);
    }

    id v7 = v34;
    id v15 = v32;
    id v13 = v33;
    id v28 = v31;
  }
}

- (BOOL)schemaDeleteColumns:(id)a3 inTable:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 99, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__ML3DatabaseConnection_SchemaUtilities__schemaDeleteColumns_inTable___block_invoke;
  v18[3] = &unk_1E5FB4730;
  id v11 = v7;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  id v22 = &v23;
  [(ML3DatabaseConnection *)self _enumerateTableColumnNamesAndDefinitionsFromTable:v8 usingBlock:v18];
  if (*((unsigned char *)v24 + 24))
  {
    BOOL v14 = [(ML3DatabaseConnection *)self _alterTableNamed:v8 withNewColumnDefinitions:v12 newColumnNames:v13 oldColumnNames:v13];
  }
  else
  {
    id v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v8;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "Could not find columns in table %{public}@", buf, 0xCu);
    }

    BOOL v14 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __70__ML3DatabaseConnection_SchemaUtilities__schemaDeleteColumns_inTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (v6)
  {
    [*(id *)(a1 + 40) addObject:v5];
    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (BOOL)schemaDeleteColumn:(id)a3 inTable:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 93, @"Invalid parameter not satisfying: %@", @"columnName" object file lineNumber description];
  }
  v13[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  BOOL v10 = [(ML3DatabaseConnection *)self schemaDeleteColumns:v9 inTable:v8];

  return v10;
}

- (BOOL)schemaRenameColumn:(id)a3 inTable:(id)a4 toNewColumnName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 65, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 66, @"Invalid parameter not satisfying: %@", @"newName" object file lineNumber description];

    goto LABEL_4;
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 64, @"Invalid parameter not satisfying: %@", @"columnName" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__ML3DatabaseConnection_SchemaUtilities__schemaRenameColumn_inTable_toNewColumnName___block_invoke;
  v25[3] = &unk_1E5FB4708;
  id v26 = v9;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v30 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v9;
  [(ML3DatabaseConnection *)self _enumerateTableColumnNamesAndDefinitionsFromTable:v10 usingBlock:v25];
  BOOL v20 = [(ML3DatabaseConnection *)self _alterTableNamed:v10 withNewColumnDefinitions:v17 newColumnNames:v15 oldColumnNames:v16];

  return v20;
}

void __85__ML3DatabaseConnection_SchemaUtilities__schemaRenameColumn_inTable_toNewColumnName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v10 = v5;
  id v7 = v6;
  id v8 = v10;
  id v9 = v7;
  if ([v10 isEqualToString:*(void *)(a1 + 32)])
  {
    id v8 = *(id *)(a1 + 40);

    id v9 = [v7 stringByReplacingOccurrencesOfString:v10 withString:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 48) addObject:v9];
  [*(id *)(a1 + 56) addObject:v10];
  [*(id *)(a1 + 64) addObject:v8];
}

- (BOOL)schemaInsertColumnDefinitions:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 39, @"Invalid parameter not satisfying: %@", @"newDefinitions" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 40, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__ML3DatabaseConnection_SchemaUtilities__schemaInsertColumnDefinitions_intoTable_atIndex___block_invoke;
  void v21[3] = &unk_1E5FB46E0;
  uint64_t v25 = v27;
  unint64_t v26 = a5;
  id v14 = v12;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  id v16 = v13;
  id v24 = v16;
  [(ML3DatabaseConnection *)self _enumerateTableColumnNamesAndDefinitionsFromTable:v11 usingBlock:v21];
  BOOL v17 = [(ML3DatabaseConnection *)self _alterTableNamed:v11 withNewColumnDefinitions:v14 newColumnNames:v16 oldColumnNames:v16];

  _Block_object_dispose(v27, 8);
  return v17;
}

void __90__ML3DatabaseConnection_SchemaUtilities__schemaInsertColumnDefinitions_intoTable_atIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(a1 + 64)) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 48) addObject:v6];
  [*(id *)(a1 + 32) addObject:v5];
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

- (BOOL)schemaInsertColumnDefinition:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:&v13 count:1];

  LOBYTE(a5) = -[ML3DatabaseConnection schemaInsertColumnDefinitions:intoTable:atIndex:](self, "schemaInsertColumnDefinitions:intoTable:atIndex:", v11, v9, a5, v13, v14);
  return a5;
}

- (BOOL)schemaAddColumnDefinition:(id)a3 toTable:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 19, @"Invalid parameter not satisfying: %@", @"columnDefinition" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionAdditions.m", 20, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];

LABEL_3:
  id v10 = [NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN %@", v9, v7];
  id v17 = 0;
  BOOL v11 = [(ML3DatabaseConnection *)self executeUpdate:v10 withParameters:0 error:&v17];
  id v12 = v17;
  if (!v11)
  {
    id v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v9;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "Could not add column to table %{public}@. %{public}@", buf, 0x16u);
    }
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentTransactionID, 0);
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_registeredModules, 0);
  objc_storeStrong((id *)&self->_registeredFunctions, 0);
  objc_destroyWeak((id *)&self->_owningPool);
  objc_storeStrong((id *)&self->_enqueuedTransactionCommitBlocks, 0);

  objc_storeStrong((id *)&self->_statementCache, 0);
}

- (void)setLogQueryPlans:(BOOL)a3
{
  self->_logQueryPlans = a3;
}

- (void)setCheckpointStatementThreshold:(unint64_t)a3
{
  self->_checkpointStatementThreshold = a3;
}

- (unint64_t)checkpointStatementThreshold
{
  return self->_checkpointStatementThreshold;
}

- (void)setAutomaticCheckpointingEnabled:(BOOL)a3
{
  self->_automaticCheckpointingEnabled = a3;
}

- (BOOL)automaticCheckpointingEnabled
{
  return self->_automaticCheckpointingEnabled;
}

- (void)setProtectionLevel:(unint64_t)a3
{
  self->_unint64_t protectionLevel = a3;
}

- (unint64_t)protectionLevel
{
  return self->_protectionLevel;
}

- (unint64_t)journalingMode
{
  return self->_journalingMode;
}

- (BOOL)_handleZombieSQLiteConnection:(sqlite3 *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v22 = a3;
    __int16 v23 = 2114;
    id v24 = self;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Database connection was unable to close SQLite handle %p. Attempting to clean up remaining resources and close again. (connection = %{public}@)", buf, 0x16u);
  }

  if (!a3) {
    return 0;
  }
  stmt = sqlite3_next_stmt(a3, 0);
  if (stmt)
  {
    id v7 = stmt;
    do
    {
      id v8 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = v7;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up unfinalized statement %p.", buf, 0xCu);
      }

      int v9 = sqlite3_finalize(v7);
      if (v9)
      {
        int v10 = v9;
        BOOL v11 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = sqlite3_errmsg(a3);
          *(_DWORD *)buf = 134218498;
          uint64_t v22 = a3;
          __int16 v23 = 2080;
          id v24 = (ML3DatabaseConnection *)v12;
          __int16 v25 = 1024;
          int v26 = v10;
          _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Failed to finalize statement %p. %s (%d)", buf, 0x1Cu);
        }
      }
      id v7 = sqlite3_next_stmt(a3, v7);
    }
    while (v7);
  }
  id v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Reattempting close of connection...", buf, 2u);
  }

  int v14 = sqlite3_close(a3);
  id v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Failed to close connection.", buf, 2u);
    }

    id v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    id v19 = sqlite3_errmsg(a3);
    objc_msgSend(v17, "raise:format:", v18, @"Failed to close connection for database. %s (errno = %d)", v19, *__error());
    return 0;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Successfully closed connection.", buf, 2u);
  }

  return 1;
}

- (BOOL)_handleConnectionErrorWhileOpening:(int)a3
{
  if (a3 == 11)
  {
    [(ML3DatabaseConnection *)self _handleDatabaseCorruption];
    return 0;
  }
  else if (a3 == 10)
  {
    return [(ML3DatabaseConnection *)self _handleDiskIOError];
  }
  else
  {
    return 1;
  }
}

- (void)_finalizeAllStatements
{
}

- (void)_logDatabaseFileDebugInformation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(ML3DatabaseConnection *)self _databaseFilePaths];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v5 = 138543362;
    long long v16 = v5;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v19 = 0;
        int v10 = objc_msgSend(v3, "attributesOfItemAtPath:error:", v9, &v19, v16);
        id v11 = v19;
        if (v10)
        {
          id v12 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [(ML3DatabaseConnection *)self sqliteError];
            BOOL v14 = [(ML3DatabaseConnection *)self _databaseFilesAreWritable];
            *(_DWORD *)buf = 138544130;
            id v15 = "false";
            if (v14) {
              id v15 = "true";
            }
            id v25 = v9;
            __int16 v26 = 2114;
            uint64_t v27 = v13;
            __int16 v28 = 2082;
            id v29 = v15;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "** Information about database file at path %{public}@\nlastError = %{public}@\nwritable = %{public}s\nattributes = %{public}@", buf, 0x2Au);

            uint64_t v7 = v17;
          }
        }
        else
        {
          id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            id v25 = v11;
            _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "Error fetching attributes from database file. %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v6);
  }
}

- (void)_logCurrentError
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ML3DatabaseConnection *)self sqliteError];
  if (v2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543618;
      id v6 = (id)objc_opt_class();
      __int16 v7 = 2114;
      id v8 = v2;
      id v4 = v6;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database error: %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_logCurrentErrorWhilePerformingStatementOperation:(id)a3 statement:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ML3DatabaseConnection *)self sqliteError];
  if (v8)
  {
    uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138544130;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 2114;
      long long v16 = v8;
      __int16 v17 = 2114;
      id v18 = v7;
      id v10 = v12;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database error while %{public}@ statement '%{public}@': %{public}@", (uint8_t *)&v11, 0x2Au);
    }
  }
}

- (void)_logCurrentErrorWhilePerformingStatementOperation:(id)a3 statementSQL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ML3DatabaseConnection *)self sqliteError];
  if (v8)
  {
    uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138544130;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v6;
      __int16 v15 = 2114;
      long long v16 = v8;
      __int16 v17 = 2114;
      id v18 = v7;
      id v10 = v12;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Database error while %{public}@ statement '%{public}@': %{public}@", (uint8_t *)&v11, 0x2Au);
    }
  }
}

- (void)_createDatabaseFileIfNonexistent
{
  if (![(ML3DatabaseConnection *)self _databaseFileExists])
  {
    [(ML3DatabaseConnection *)self _createDatabaseDirectoryIfNonexistent];
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v4 = [v3 createFileAtPath:self->_databasePath contents:0 attributes:0];

    if ((v4 & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"Could not create database file at %@, error = %@", self->_databasePath, 0 format];
    }
  }
}

- (BOOL)_databaseFileExists
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [(NSString *)self->_databasePath stringByDeletingLastPathComponent];
  if ([v3 fileExistsAtPath:v4]) {
    char v5 = [v3 fileExistsAtPath:self->_databasePath];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_registeredModuleNamed:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = self->_registeredModules;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "name", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_shortDescription
{
  v4.receiver = self;
  v4.super_class = (Class)ML3DatabaseConnection;
  uint64_t v2 = [(ML3DatabaseConnection *)&v4 description];

  return v2;
}

void __83__ML3DatabaseConnection__internalLogQuery_withParameters_limitProperty_limitValue___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 columnCount])
  {
    unint64_t v3 = 0;
    do
    {
      if (v3) {
        [*(id *)(a1 + 32) appendString:@"|"];
      }
      objc_super v4 = *(void **)(a1 + 32);
      char v5 = [v7 valueForColumnIndex:v3];
      id v6 = [v5 description];
      [v4 appendString:v6];

      ++v3;
    }
    while ([v7 columnCount] > v3);
  }
  [*(id *)(a1 + 32) appendString:@"\n"];
}

intptr_t __53__ML3DatabaseConnection__executeStatement_withError___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setCloseConnectionWhenCheckingIn
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_closeConnectionWhenCheckingIn = 1;

  os_unfair_lock_unlock(p_lock);
}

- (void)_setAlreadyAttemptedCorruptionRecovery:(BOOL)a3
{
  self->_alreadyAttemptedCorruptionRecovery = a3;
}

- (BOOL)_alreadyAttemptedCorruptionRecovery
{
  return self->_alreadyAttemptedCorruptionRecovery;
}

- (void)setTransactionLevel:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t transactionLevel = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_handleDiskIOError
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [(ML3DatabaseConnection *)self _logDatabaseFileDebugInformation];
  unint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "DISK IO ERROR: attempting to close and re-open connection for recovery.", buf, 2u);
  }

  BOOL v4 = 0;
  *(void *)buf = 0;
  __int16 v40 = buf;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  if (!self->_isHandlingIOError)
  {
    unint64_t v5 = [(ML3DatabaseConnection *)self transactionLevel];
    self->_isHandlingIOError = 1;
    BOOL v6 = [(ML3DatabaseConnection *)self _closeAndFlushTransactionState:0];
    v40[24] = v6;
    id v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!v6)
    {
      if (v8)
      {
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] failed to close database connection", v43, 2u);
      }
LABEL_18:

      int v15 = v40[24];
      long long v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      __int16 v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v43 = 0;
          _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEBUG, "[_handleDiskIOError] successfully recovered from disk IO error", v43, 2u);
        }
        goto LABEL_44;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] FAILED TO HANDLE DISK IO ERROR", v43, 2u);
      }

      __int16 v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      [(ML3DatabaseConnection *)self _databaseFilePaths];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v33;
LABEL_25:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = *(void **)(*((void *)&v32 + 1) + 8 * v21);
          if (objc_msgSend(v22, "containsString:", @"-shm", (void)v32)) {
            break;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
            if (v19) {
              goto LABEL_25;
            }
            goto LABEL_31;
          }
        }
        id v23 = v22;

        if (!v23 || ![v17 fileExistsAtPath:v23]) {
          goto LABEL_39;
        }
        id v23 = v23;
        if (unlink((const char *)[v23 fileSystemRepresentation]) == -1)
        {
          id v25 = _ML3LogCategoryDefault();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_43;
          }
          int v31 = *__error();
          *(_DWORD *)uint64_t v43 = 67109120;
          int v44 = v31;
          uint64_t v27 = "[_handleDiskIOError] failed to delete SHM file from disk (errno = %d)";
          __int16 v28 = v25;
          uint32_t v29 = 8;
          goto LABEL_42;
        }
        BOOL v24 = [(ML3DatabaseConnection *)self _isDeviceMediaLibraryDatabase];
        id v25 = _ML3LogCategoryDefault();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        if (v24)
        {
          if (v26)
          {
            *(_WORD *)uint64_t v43 = 0;
            _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] unlink successful. performing coordinated termination.", v43, 2u);
          }

          id v25 = +[ML3TerminationCoordinator sharedCoordinator];
          [v25 execute];
          goto LABEL_43;
        }
        if (!v26) {
          goto LABEL_43;
        }
        *(_WORD *)uint64_t v43 = 0;
        uint64_t v27 = "[_handleDiskIOError] unlink successful.";
      }
      else
      {
LABEL_31:

        id v23 = 0;
LABEL_39:
        id v25 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_WORD *)uint64_t v43 = 0;
        uint64_t v27 = "[_handleDiskIOError] SHM file not found—unable to unlink";
      }
      __int16 v28 = v25;
      uint32_t v29 = 2;
LABEL_42:
      _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_ERROR, v27, v43, v29);
LABEL_43:

LABEL_44:
      self->_isHandlingIOError = 0;
      BOOL v4 = v40[24] != 0;
      goto LABEL_45;
    }
    if (v8)
    {
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] checking database consistency", v43, 2u);
    }

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = +[MLMediaLibraryService sharedMediaLibraryService];
    databasePath = self->_databasePath;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __43__ML3DatabaseConnection__handleDiskIOError__block_invoke;
    v36[3] = &unk_1E5FB80C0;
    long long v38 = buf;
    v36[4] = self;
    id v7 = v9;
    long long v37 = v7;
    [v10 checkIntegrityOfDatabaseAtPath:databasePath repairFaults:1 withCompletionHandler:v36];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (v40[24] && (BOOL v12 = [(ML3DatabaseConnection *)self open], (v40[24] = v12) != 0))
    {
      if (!v5)
      {
LABEL_17:

        goto LABEL_18;
      }
      BOOL v13 = [(ML3DatabaseConnection *)self _internalBeginTransactionWithBehaviorType:0];
      v40[24] = v13;
      if (v13)
      {
        os_unfair_lock_lock(&self->_lock);
        self->_unint64_t transactionLevel = v5;
        self->_BOOL nestedTransactionWantsToRollback = 1;
        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_17;
      }
      long long v14 = _ML3LogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] failed to restart transaction after re-opening database connection", v43, 2u);
      }
    }
    else
    {
      long long v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "[_handleDiskIOError] failed to re-open database connection", v43, 2u);
      }
    }

    goto LABEL_17;
  }
LABEL_45:
  _Block_object_dispose(buf, 8);
  return v4;
}

intptr_t __43__ML3DatabaseConnection__handleDiskIOError__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  BOOL v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[_handleDiskIOError] Database integrity check passed.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[_handleDiskIOError] Database integrity check failed - treating as corrupted", v7, 2u);
    }

    [*(id *)(a1 + 32) _handleDatabaseCorruption];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_handleBusyLockWithNumberOfRetries:(int)a3
{
  if (a3)
  {
    if (a3 >= 10 && self->_journalingMode == 1) {
      return 1;
    }
    usleep(0xF4240u);
  }
  else
  {
    [(ML3DatabaseConnection *)self _resetUnfinalizedStatements];
  }
  return 0;
}

- (void)_handleDatabaseCorruption
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = (id)objc_opt_class();
    id v4 = v14;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] ✘ Database Corruption Detected ✘", buf, 0xCu);
  }
  [(ML3DatabaseConnection *)self _logDatabaseFileDebugInformation];
  if ([(ML3DatabaseConnection *)self isOpen]) {
    [(ML3DatabaseConnection *)self close];
  }
  if (!+[ML3MusicLibrary deviceSupportsMultipleLibraries]&& [(ML3DatabaseConnection *)self _isDeviceMediaLibraryDatabase])
  {
    BOOL v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Attempting database recovery...", buf, 2u);
    }

    BOOL v6 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v7 = [v6 componentsJoinedByString:@"\n"];

    BOOL v8 = +[MLMediaLibraryService sharedMediaLibraryService];
    databasePath = self->_databasePath;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__ML3DatabaseConnection__handleDatabaseCorruption__block_invoke;
    v11[3] = &unk_1E5FB8098;
    v11[4] = self;
    id v12 = v7;
    id v10 = v7;
    [v8 attemptDatabaseFileRecoveryAtPath:databasePath withCompletionHandler:v11];
  }
}

void __50__ML3DatabaseConnection__handleDatabaseCorruption__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Database recovery was reported to be successful.", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Database recovery failed. %{public}@", buf, 0xCu);
    }

    if (MSVDeviceOSIsInternalInstall() && !__daemonProcessInfo) {
      +[MLException raise:*MEMORY[0x1E4F1C3B8], @"Database at path %@ is corrupted. (Detected on connection %@) backtrace: %@", *(void *)(*(void *)(a1 + 32) + 120), *(void *)(a1 + 32), *(void *)(a1 + 40) format];
    }
  }
}

- (void)_raiseConnectionClosedException
{
  databasePath = self->_databasePath;
  if (!databasePath)
  {
    ML3DatabaseConnectionRaiseNilDatabasePath(0, a2);
    databasePath = self->_databasePath;
  }
  ML3DatabaseConnectionCheckDatabasePathAndRaiseIfNecessary(databasePath);

  ML3DatabaseConnectionRaiseUnknownException();
}

- (id)_owningPool
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningPool);

  return WeakRetained;
}

- (int)checkpointDatabase
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(ML3DatabaseConnection *)self isOpen]) {
    return -1;
  }
  if ([(ML3DatabaseConnection *)self isReadOnly]) {
    return -1;
  }
  sqlitedb = self->_sqlitedb;
  if (!sqlitedb) {
    return -1;
  }
  errmsg = 0;
  int v4 = sqlite3_exec(sqlitedb, "PRAGMA wal_checkpoint;", 0, 0, &errmsg);
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v9 = errmsg;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Could not checkpoint WAL file. %{public}s", buf, 0xCu);
    }
  }
  return v4;
}

- (BOOL)deleteDatabase
{
  if ([(ML3DatabaseConnection *)self isReadOnly]) {
    return 0;
  }
  if ([(ML3DatabaseConnection *)self isOpen]) {
    [(ML3DatabaseConnection *)self close];
  }
  databasePath = self->_databasePath;
  BOOL v5 = self->_journalingMode == 1;

  return ML3TruncateDatabase(databasePath, v5);
}

- (id)sqliteError
{
  v21[2] = *MEMORY[0x1E4F143B8];
  sqlitedb = self->_sqlitedb;
  if (!sqlitedb)
  {
    v18[0] = *MEMORY[0x1E4F28568];
    v19[0] = @"Database connection lost or invalid.";
    id v14 = [(id)objc_opt_class() description];
    v18[1] = v14;
    uint64_t v15 = [(ML3DatabaseConnection *)self description];
    v19[1] = v15;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

    BOOL v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ML3DatabaseErrorDomain" code:200 userInfo:v8];
    goto LABEL_5;
  }
  int v4 = sqlite3_errcode(sqlitedb);
  uint64_t v5 = sqlite3_extended_errcode(self->_sqlitedb);
  unsigned int v17 = 0;
  if (v4)
  {
    uint64_t v6 = v5;
    BOOL v7 = sqlite3_errmsg(self->_sqlitedb);
    sqlite3_file_control(self->_sqlitedb, "main", 4, &v17);
    BOOL v8 = MLSQLiteExtendedResultString(v6);
    id v9 = [NSString stringWithFormat:@"%s -- extended errcode: %d (%@), last errno = %d", v7, v6, v8, v17];
    v20[0] = *MEMORY[0x1E4F28568];
    v21[0] = v9;
    uint64_t v10 = [(id)objc_opt_class() description];
    v20[1] = v10;
    int v11 = [(ML3DatabaseConnection *)self description];
    v21[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    BOOL v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ML3DatabaseErrorDomain" code:v4 userInfo:v12];

LABEL_5:
    goto LABEL_7;
  }
  BOOL v13 = 0;
LABEL_7:

  return v13;
}

- (int64_t)lastInsertionRowID
{
  return sqlite3_last_insert_rowid(self->_sqlitedb);
}

- (id)openBlobInTable:(id)a3 column:(id)a4 row:(int64_t)a5 readOnly:(BOOL)a6
{
  BOOL v6 = a6;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(ML3DatabaseConnection *)self _ensureConnectionIsOpen];
  ppBlob = 0;
  id v12 = [NSString stringWithFormat:@"SELECT 1 FROM %@ WHERE ROWID=?", v10];
  BOOL v13 = [NSNumber numberWithLongLong:a5];
  v20[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v15 = [(ML3DatabaseConnection *)self executeQuery:v12 withParameters:v14];

  long long v16 = 0;
  if ([v15 hasAtLeastOneRow])
  {
    if (sqlite3_blob_open(self->_sqlitedb, "main", (const char *)[v10 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), a5, !v6, &ppBlob))
    {
      [(ML3DatabaseConnection *)self _logCurrentError];
      long long v16 = 0;
    }
    else
    {
      unsigned int v17 = [ML3DatabaseBlob alloc];
      long long v16 = [(ML3DatabaseBlob *)v17 initWithSQLiteHandle:ppBlob];
    }
  }

  return v16;
}

- (BOOL)removeModuleNamed:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_registeredModules;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      id v11 = objc_msgSend(v10, "name", (void)v16);
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v10;

    if (v14)
    {
      [(NSMutableArray *)self->_registeredModules removeObject:v14];
      BOOL v13 = 1;
      uint64_t v5 = v14;
      goto LABEL_12;
    }
    BOOL v13 = 0;
  }
  else
  {
LABEL_9:
    BOOL v13 = 0;
LABEL_12:
  }
  return v13;
}

- (BOOL)registerModuleName:(id)a3 moduleMethods:(sqlite3_module *)a4
{
  id v7 = a3;
  uint64_t v8 = [(ML3DatabaseConnection *)self _registeredModuleNamed:v7];
  if (!v8)
  {
    uint64_t v9 = [[ML3DatabaseModule alloc] initWithName:v7 moduleMethods:a4];

    BOOL v13 = [(ML3DatabaseConnection *)self registerModule:v9];
    goto LABEL_6;
  }
  uint64_t v9 = v8;
  id v10 = [(ML3DatabaseModule *)v8 name];
  int v11 = [v10 isEqualToString:v7];

  if (!v11)
  {

    goto LABEL_8;
  }
  char v12 = [(ML3DatabaseModule *)v9 moduleMethods];

  if (v12 != a4)
  {
LABEL_8:
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"ML3DatabaseConnection.m" lineNumber:817 description:@"modules can only be registered one time"];
  }
  BOOL v13 = 1;
LABEL_6:

  return v13;
}

- (BOOL)registerModule:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_sqlitedb)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ML3DatabaseConnection.m", 794, @"Cannot register module. SQLite handle not available, or connection is not open." object file lineNumber description];
  }
  uint64_t v6 = [v5 context];

  if (v6)
  {
    id v7 = [v5 context];
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = v7;
  sqlitedb = self->_sqlitedb;
  id v10 = [v5 name];
  int module = sqlite3_create_module(sqlitedb, (const char *)[v10 UTF8String], (const sqlite3_module *)objc_msgSend(v5, "moduleMethods"), v8);

  if (module)
  {
    char v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(ML3DatabaseConnection *)self sqliteError];
      int v16 = 138543618;
      id v17 = v5;
      __int16 v18 = 2114;
      long long v19 = v13;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Error registering module: %{public}@. %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    [(NSMutableArray *)self->_registeredModules addObject:v5];
  }

  return module == 0;
}

- (void)enqueueBlockForTransactionCommit:(id)a3
{
  enqueuedTransactionCommitBlocks = self->_enqueuedTransactionCommitBlocks;
  id v4 = (id)MEMORY[0x1B3E93EE0](a3, a2);
  [(NSMutableArray *)enqueuedTransactionCommitBlocks addObject:v4];
}

- (BOOL)performTransactionWithBlock:(id)a3 usingBehaviorType:(unint64_t)a4
{
  uint64_t v6 = (uint64_t (**)(void))a3;
  if ([(ML3DatabaseConnection *)self pushTransactionUsingBehaviorType:a4]) {
    BOOL v7 = [(ML3DatabaseConnection *)self popTransactionAndCommit:v6[2](v6)];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)performTransactionWithBlock:(id)a3
{
  return [(ML3DatabaseConnection *)self performTransactionWithBlock:a3 usingBehaviorType:0];
}

- (BOOL)executeUpdate:(id)a3
{
  return [(ML3DatabaseConnection *)self executeUpdate:a3 withParameters:0 error:0];
}

- (BOOL)tableExists:(id)a3
{
  id v4 = [NSString stringWithFormat:@"SELECT name FROM sqlite_master WHERE type='table' AND name='%@'", a3];
  id v5 = [(ML3DatabaseConnection *)self executeQuery:v4];
  char v6 = [v5 hasAtLeastOneRow];

  return v6;
}

- (BOOL)_closeAndFlushTransactionState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(ML3DatabaseConnection *)self isOpen])
  {
    id WeakRetained = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      __int16 v18 = self;
      _os_log_impl(&dword_1B022D000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@ is not open", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_16;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained connectionWillCloseDatabase:self];
  }
  if (v3) {
    [(ML3DatabaseConnection *)self flush];
  }
  [(ML3DatabaseConnection *)self setTransactionLevel:0];
  char v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    __int16 v18 = self;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to finalize all statements", (uint8_t *)&v17, 0xCu);
  }

  [(ML3DatabaseConnection *)self _finalizeAllStatements];
  iTunesExtensions = (sqlite3 **)self->_iTunesExtensions;
  if (iTunesExtensions)
  {
    DestroySQLExtensions(iTunesExtensions);
    self->_iTunesExtensions = 0;
  }
  sqlitedb = self->_sqlitedb;
  if (!sqlitedb || !self->_isOpen)
  {
    char v12 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = self->_sqlitedb;
      BOOL isOpen = self->_isOpen;
      int v17 = 138543874;
      __int16 v18 = self;
      __int16 v19 = 2048;
      *(void *)uint64_t v20 = v13;
      *(_WORD *)&v20[8] = 1024;
      BOOL v21 = isOpen;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ not closing _sqlitedb=%p, _isOpen=%{BOOL}u", (uint8_t *)&v17, 0x1Cu);
    }
    goto LABEL_27;
  }
  int v9 = sqlite3_close(sqlitedb);
  if (v9) {
    BOOL v10 = [(ML3DatabaseConnection *)self _handleZombieSQLiteConnection:self->_sqlitedb];
  }
  else {
    BOOL v10 = 1;
  }
  uint64_t v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543874;
    __int16 v18 = self;
    __int16 v19 = 1024;
    *(_DWORD *)uint64_t v20 = v9;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v10;
    _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ closed with result=%d, status=%{BOOL}u", (uint8_t *)&v17, 0x18u);
  }

  if (!v10)
  {
    [(ML3DatabaseConnection *)self _logCurrentError];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_28:
      BOOL v11 = 0;
      goto LABEL_29;
    }
    char v12 = [(ML3DatabaseConnection *)self sqliteError];
    [WeakRetained connection:self didFailToCloseDatabaseWithError:v12];
LABEL_27:

    goto LABEL_28;
  }
  self->_sqlitedb = 0;
  self->_BOOL isOpen = 0;
  [(NSMutableArray *)self->_registeredFunctions removeAllObjects];
  [(NSMutableArray *)self->_registeredModules removeAllObjects];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained connectionDidCloseDatabase:self];
  }
LABEL_16:
  BOOL v11 = 1;
LABEL_29:

  return v11;
}

- (BOOL)close
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    char v6 = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to close", (uint8_t *)&v5, 0xCu);
  }

  return [(ML3DatabaseConnection *)self _closeAndFlushTransactionState:1];
}

intptr_t __40__ML3DatabaseConnection__openWithFlags___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    char v6 = [v4 uniqueIdentifier];
    char v7 = [(NSUUID *)uniqueIdentifier isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  databasePath = self->_databasePath;
  if ([(ML3DatabaseConnection *)self isOpen]) {
    char v6 = @"YES";
  }
  else {
    char v6 = @"NO";
  }
  if ([(ML3DatabaseConnection *)self isReadOnly]) {
    char v7 = @"YES";
  }
  else {
    char v7 = @"NO";
  }
  if ([(ML3DatabaseConnection *)self _closeConnectionWhenCheckingIn]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if ([(ML3DatabaseConnection *)self isInTransaction]) {
    int v9 = @"YES";
  }
  else {
    int v9 = @"NO";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningPool);
  BOOL v11 = [WeakRetained debugDescription];
  char v12 = [v3 stringWithFormat:@"<%@ %p, path=%@, open=%@, readonly=%@, _closeConnectionWhenCheckingIn=%@, in transaction=%@, owning pool=%@>", v4, self, databasePath, v6, v7, v8, v9, v11];

  return v12;
}

- (void)dealloc
{
  if ([(ML3DatabaseConnection *)self isOpen]) {
    [(ML3DatabaseConnection *)self close];
  }
  v3.receiver = self;
  v3.super_class = (Class)ML3DatabaseConnection;
  [(ML3DatabaseConnection *)&v3 dealloc];
}

- (ML3DatabaseConnection)init
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"-[%@ init] is unsupported. Use -[%@ initWithDatabasePath:] instead.", v4, v4 format];

  return 0;
}

@end