@interface PQLConnection
+ (void)initialize;
- (BOOL)_execute:(id)a3 mustSucceed:(BOOL)a4 bindings:(char *)a5;
- (BOOL)_executeStmt:(id)a3 mustSucceed:(BOOL)a4 preparationTime:(unint64_t)a5;
- (BOOL)_fullSync;
- (BOOL)_incrementalVacuum:(unint64_t)a3;
- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5;
- (BOOL)backupToURL:(id)a3 progress:(id)a4;
- (BOOL)close:(id *)a3;
- (BOOL)crashIfUsedAfterClose;
- (BOOL)destroyDatabaseWithError:(id *)a3;
- (BOOL)execute:(id)a3;
- (BOOL)execute:(id)a3 args:(char *)a4;
- (BOOL)executeRaw:(id)a3;
- (BOOL)executeSwift:(id)a3 error:(id *)a4;
- (BOOL)groupInTransaction:(id)a3;
- (BOOL)incrementalVacuum:(int64_t)a3;
- (BOOL)isBatchSuspended;
- (BOOL)isInBatch;
- (BOOL)isInTransaction;
- (BOOL)isTraced;
- (BOOL)openAtURL:(id)a3 sharedCache:(BOOL)a4 error:(id *)a5;
- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5;
- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4;
- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5;
- (BOOL)registerFunction:(id)a3 nArgs:(int)a4 handler:(id)a5;
- (BOOL)setUserVersion:(int64_t)a3;
- (BOOL)setupPragmas;
- (BOOL)shouldUseWALJournalMode;
- (NSError)lastError;
- (NSString)debugDescription;
- (NSString)label;
- (NSURL)url;
- (OS_dispatch_queue)serialQueue;
- (PQLConnection)init;
- (double)currentOperationDuration;
- (id)_description:(BOOL)a3;
- (id)_newStatementForBuilder:(id)a3 preparationTime:(unint64_t *)a4;
- (id)_newStatementForFormat:(id)a3 preparationTime:(unint64_t *)a4 arguments:(char *)a5;
- (id)autoRollbackHandler;
- (id)busyHandler;
- (id)description;
- (id)didFinishBatchingHook;
- (id)fetch:(id)a3;
- (id)fetch:(id)a3 args:(char *)a4;
- (id)fetchObject:(id)a3 sql:(id)a4;
- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5;
- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5;
- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6;
- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4;
- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5;
- (id)fetchObjectOfClassSwift:(Class)a3 query:(id)a4 error:(id *)a5;
- (id)fetchObjectSwift:(id)a3 query:(id)a4 error:(id *)a5;
- (id)fetchSwift:(id)a3 error:(id *)a4;
- (id)lockedHandler;
- (id)postFlushHook;
- (id)preFlushHook;
- (id)profilingHook;
- (id)profilingHookV2;
- (id)sqliteErrorHandler;
- (id)userVersion;
- (id)willBeginBatchingHook;
- (int)_vacuumMode;
- (int)batchTransactionType;
- (int64_t)autovacuumableSpaceInBytes;
- (int64_t)changes;
- (int64_t)lastInsertedRowID;
- (sqlite3)dbHandle;
- (unint64_t)statementCacheMaxCount;
- (unint64_t)synchronousMode;
- (void)_batchStartIfNeeded:(int)a3;
- (void)_batchStopIfNeeded;
- (void)_clearCleanupCacheQueueIfNeeded;
- (void)_clearStatementCache;
- (void)_createCacheIfNeeded;
- (void)_fireFlushNotifications;
- (void)_resetState;
- (void)_vacuumIfNeeded;
- (void)assertOnQueue;
- (void)dealloc;
- (void)flush;
- (void)forceBatchStart;
- (void)groupInBatch:(id)a3;
- (void)makeNextFlushBarrierFSync;
- (void)makeNextFlushFullSync;
- (void)setAutoRollbackHandler:(id)a3;
- (void)setBatchTransactionType:(int)a3;
- (void)setBusyHandler:(id)a3;
- (void)setCrashIfUsedAfterClose:(BOOL)a3;
- (void)setDidFinishBatchingHook:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLastError:(id)a3;
- (void)setLockedHandler:(id)a3;
- (void)setPostFlushHook:(id)a3;
- (void)setPreFlushHook:(id)a3;
- (void)setProfilingHook:(id)a3;
- (void)setProfilingHookV2:(id)a3;
- (void)setShouldUseWALJournalMode:(BOOL)a3;
- (void)setSqliteErrorHandler:(id)a3;
- (void)setStatementCacheMaxCount:(unint64_t)a3;
- (void)setSynchronousMode:(unint64_t)a3;
- (void)setTraced:(BOOL)a3;
- (void)setWillBeginBatchingHook:(id)a3;
- (void)useBatchingOnTargetQueue:(id)a3 delay:(double)a4 changeCount:(int)a5;
- (void)useBatchingOnTargetQueue:(id)a3 withPolicyHandler:(id)a4;
- (void)useBatchingWithDelay:(double)a3 changeCount:(int)a4;
- (void)useBatchingWithPolicyHandler:(id)a3;
- (void)useSerialQueue;
- (void)useSerialQueueWithTarget:(id)a3;
@end

@implementation PQLConnection

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)assertOnQueue
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
}

- (id)profilingHookV2
{
  return self->_profilingHookV2;
}

- (id)profilingHook
{
  return self->_profilingHook;
}

- (id)fetchSwift:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  id v6 = [(PQLConnection *)self _newStatementForBuilder:a3 preparationTime:&v12];
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  v7 = [PQLResultSet alloc];
  v8 = [(PQLResultSet *)v7 initWithStatement:v6 usingDatabase:self preparationTime:v12];
  lastError = self->_lastError;
  if (lastError)
  {
    v10 = 0;
    if (a4) {
      *a4 = lastError;
    }
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (id)_newStatementForBuilder:(id)a3 preparationTime:(unint64_t *)a4
{
  id v7 = a3;
  self->_changesOverride = 0;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v13;

      v11 = 0;
      goto LABEL_11;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1692 description:@"Connection has been used after close (or before open)"];
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (self->_suspendCaching || !self->_serialQueue) {
    preparedStatements = 0;
  }
  else {
    preparedStatements = self->_preparedStatements;
  }
  [(PQLConnection *)self _clearCleanupCacheQueueIfNeeded];
  v10 = self->_lastError;
  self->_lastError = 0;

  v11 = [[PQLStatement alloc] initWithQueryBuilder:v7 db:self cache:preparedStatements preparationTime:a4];
LABEL_11:

  return v11;
}

- (BOOL)isTraced
{
  return self->_traced;
}

- (sqlite3)dbHandle
{
  return self->_db;
}

- (void)_clearCleanupCacheQueueIfNeeded
{
  obj = self->_stmtCacheCleanupQueue;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_stmtCacheCleanupQueue removeAllObjects];
  objc_sync_exit(obj);
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4
{
  return [(PQLConnection *)self fetchObjectOfClass:a3 initializer:0 sql:a4 args:&v5];
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5 args:(char *)a6
{
  id v10 = a5;
  [(PQLConnection *)self assertOnQueue];
  uint64_t v18 = 0;
  id v11 = [(PQLConnection *)self _newStatementForFormat:v10 preparationTime:&v18 arguments:a6];

  uint64_t v12 = [PQLResultSet alloc];
  v13 = [(PQLResultSet *)v12 initWithStatement:v11 usingDatabase:self preparationTime:v18];
  v14 = [(PQLResultSet *)v13 onlyObjectOfClass:a3 initializer:a4];
  if (!v14)
  {
    v15 = [(PQLResultSet *)v13 error];
    lastError = self->_lastError;
    self->_lastError = v15;
  }
  return v14;
}

- (id)_newStatementForFormat:(id)a3 preparationTime:(unint64_t *)a4 arguments:(char *)a5
{
  id v9 = a3;
  self->_changesOverride = 0;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      v15 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v15;

      v13 = 0;
      goto LABEL_11;
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1431 description:@"Connection has been used after close (or before open)"];
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (self->_suspendCaching || !self->_serialQueue) {
    preparedStatements = 0;
  }
  else {
    preparedStatements = self->_preparedStatements;
  }
  [(PQLConnection *)self _clearCleanupCacheQueueIfNeeded];
  uint64_t v12 = self->_lastError;
  self->_lastError = 0;

  v13 = [[PQLStatement alloc] initWithFormat:v9 arguments:a5 db:self cache:preparedStatements preparationTime:a4];
LABEL_11:

  return v13;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:2 capacity:0];
    v3 = (void *)gPQLConnections;
    gPQLConnections = v2;

    if (initialize_onceToken != -1)
    {
      dispatch_once(&initialize_onceToken, &__block_literal_global_3);
    }
  }
}

- (PQLConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)PQLConnection;
  uint64_t v2 = [(PQLConnection *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PQLConnection *)v2 setBusyHandler:&__block_literal_global_6];
    [(PQLConnection *)v3 setAutoRollbackHandler:&__block_literal_global_15];
    v3->_shouldUseWALJournalMode = 1;
    pthread_mutex_lock(&gPQLMutex);
    [(id)gPQLConnections addObject:v3];
    pthread_mutex_unlock(&gPQLMutex);
  }
  return v3;
}

uint64_t __21__PQLConnection_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v5 appendFormat:@"busy handler called (%d) %@", a3, v4];
  pthread_mutex_lock(&gPQLMutex);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)gPQLConnections;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        [v5 appendFormat:@"\n > %@", v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }

  if (pql_pred != -1) {
    dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
  }
  uint64_t v12 = pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_1DCCE4000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  pthread_mutex_unlock(&gPQLMutex);
  sqlite3_sleep(10);

  return 1;
}

uint64_t __21__PQLConnection_init__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Sqlite rollbacked transaction [%@] because of unrecoverable error [%@], aborting.", a3, a4 format];
}

- (id)_description:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v6 = objc_opt_class();
  label = (__CFString *)self->_label;
  BOOL v8 = label == 0;
  if (!label) {
    label = &stru_1F382CE78;
  }
  uint64_t v9 = " ";
  if (v8) {
    uint64_t v9 = "";
  }
  [v5 appendFormat:@"<%@:%p %@%s{batch:%d:%d txn:%d", v6, self, label, v9, self->_batchStarted != 0, self->_skipBatchStop, self->_savePointLevel];
  db = self->_db;
  if (db && v3)
  {
    [v5 appendFormat:@" auto-commit:%d}>", sqlite3_get_autocommit(db)];
    stmt = sqlite3_next_stmt(self->_db, 0);
    if (stmt)
    {
      uint64_t v12 = stmt;
      LODWORD(v13) = 0;
      LODWORD(v14) = 0;
      do
      {
        uint64_t v14 = (v14 + 1);
        if (sqlite3_stmt_busy(v12)) {
          uint64_t v13 = (v13 + 1);
        }
        else {
          uint64_t v13 = v13;
        }
        uint64_t v12 = sqlite3_next_stmt(self->_db, v12);
      }
      while (v12);
      [v5 appendFormat:@" %d prepared statements", v14];
      if (v13)
      {
        [v5 appendFormat:@", %d busy:", v13];
        long long v15 = sqlite3_next_stmt(self->_db, 0);
        if (v15)
        {
          long long v16 = v15;
          do
          {
            if (sqlite3_stmt_busy(v16)) {
              [v5 appendFormat:@"\n    %s", sqlite3_sql(v16)];
            }
            long long v16 = sqlite3_next_stmt(self->_db, v16);
          }
          while (v16);
        }
      }
    }
  }
  else
  {
    [v5 appendString:@"}>"];
  }

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)[(PQLConnection *)self _description:1];
}

- (id)description
{
  return [(PQLConnection *)self _description:0];
}

- (void)_resetState
{
  __assert_rtn("-[PQLConnection _resetState]", "PQLConnection.m", 213, "_db == nil");
}

- (void)dealloc
{
  pthread_mutex_lock(&gPQLMutex);
  [(id)gPQLConnections removeObject:self];
  pthread_mutex_unlock(&gPQLMutex);
  stmtCacheSource = self->_stmtCacheSource;
  if (stmtCacheSource)
  {
    dispatch_source_cancel(stmtCacheSource);
    id v4 = self->_stmtCacheSource;
    self->_stmtCacheSource = 0;
  }
  preparedStatements = self->_preparedStatements;
  if (preparedStatements)
  {
    while (cache_destroy(preparedStatements) == 35)
    {
      sleep(1u);
      preparedStatements = self->_preparedStatements;
    }
    self->_preparedStatements = 0;
  }
  uint64_t v6 = self->_stmtCacheCleanupQueue;
  objc_sync_enter(v6);
  [(NSMutableArray *)self->_stmtCacheCleanupQueue removeAllObjects];
  stmtCacheCleanupQueue = self->_stmtCacheCleanupQueue;
  self->_stmtCacheCleanupQueue = 0;

  objc_sync_exit(v6);
  if (self->_db) {
    [(PQLConnection *)self close:0];
  }
  [(PQLConnection *)self _resetState];
  serialQueue = self->_serialQueue;
  self->_serialQueue = 0;

  targetQueue = self->_targetQueue;
  self->_targetQueue = 0;

  label = self->_label;
  self->_label = 0;

  v11.receiver = self;
  v11.super_class = (Class)PQLConnection;
  [(PQLConnection *)&v11 dealloc];
}

- (void)_createCacheIfNeeded
{
  p_preparedStatements = &self->_preparedStatements;
  if (!self->_preparedStatements)
  {
    *(&attrs.version + 1) = 0;
    attrs.version = 2;
    attrs.key_hash_cb = (cache_key_hash_cb_t)__PQLCacheKeyHash;
    attrs.key_is_equal_cb = (cache_key_is_equal_cb_t)__PQLCacheKeyEqual;
    attrs.key_retain_cb = (cache_key_retain_cb_t)__PQLCacheKeyRetain;
    attrs.key_release_cb = (cache_release_cb_t)__PQLCacheKeyRelease;
    attrs.value_release_cb = (cache_release_cb_t)__PQLCacheValueRelease;
    attrs.value_make_nonpurgeable_cb = 0;
    attrs.value_make_purgeable_cb = 0;
    attrs.user_data = self;
    attrs.value_retain_cb = (cache_value_retain_cb_t)__PQLCacheValueRetain;
    id v3 = [NSString stringWithFormat:@"com.apple.sqlite.%@", self->_label];
    if (cache_create((const char *)[v3 UTF8String], &attrs, p_preparedStatements))
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      }
      id v4 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCCE4000, v4, OS_LOG_TYPE_ERROR, "Unable to create preprared cache for statements", buf, 2u);
      }
    }
  }
}

- (double)currentOperationDuration
{
  if (!self->_currentStmtStart) {
    return 0.0;
  }
  uint64_t v2 = mach_absolute_time() - self->_currentStmtStart;
  if (timeInSeconds_once != -1) {
    dispatch_once(&timeInSeconds_once, &__block_literal_global);
  }
  return *(double *)&timeInSeconds_factor * (double)v2;
}

- (unint64_t)statementCacheMaxCount
{
  [(PQLConnection *)self _createCacheIfNeeded];
  preparedStatements = self->_preparedStatements;

  return MEMORY[0x1F40CA5D0](preparedStatements);
}

- (void)setStatementCacheMaxCount:(unint64_t)a3
{
  [(PQLConnection *)self _createCacheIfNeeded];
  if (a3 >= 0xFFFFFFFF) {
    unint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    unint64_t v5 = a3;
  }
  preparedStatements = self->_preparedStatements;

  MEMORY[0x1F40CA640](preparedStatements, v5);
}

- (void)useSerialQueueWithTarget:(id)a3
{
  id v4 = a3;
  if (!self->_serialQueue)
  {
    unint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    [(PQLConnection *)self _createCacheIfNeeded];
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stmtCacheCleanupQueue = self->_stmtCacheCleanupQueue;
    self->_stmtCacheCleanupQueue = v6;

    name = (const char *)cache_get_name();
    uint64_t v9 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(name, v5, v4);
    serialQueue = self->_serialQueue;
    self->_serialQueue = v9;

    objc_super v11 = (OS_dispatch_queue *)v4;
    if (!v4) {
      objc_super v11 = self->_serialQueue;
    }
    objc_storeStrong((id *)&self->_targetQueue, v11);
    uint64_t v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)self->_serialQueue);
    stmtCacheSource = self->_stmtCacheSource;
    self->_stmtCacheSource = v12;

    objc_initWeak(&location, self);
    uint64_t v14 = self->_stmtCacheSource;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__PQLConnection_useSerialQueueWithTarget___block_invoke;
    v16[3] = &unk_1E6CAF9A8;
    objc_copyWeak(&v17, &location);
    dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, v16);
    dispatch_source_set_event_handler(v14, v15);

    dispatch_resume((dispatch_object_t)self->_stmtCacheSource);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  self->_useQueue = 1;
}

void __42__PQLConnection_useSerialQueueWithTarget___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01AB700]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _clearCleanupCacheQueueIfNeeded];
  }
}

- (void)useSerialQueue
{
}

- (void)useBatchingOnTargetQueue:(id)a3 delay:(double)a4 changeCount:(int)a5
{
  id v9 = a3;
  id v10 = v9;
  BOOL v11 = a4 <= 0.0 && a5 <= 0;
  id v14 = v9;
  if (v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PQLConnection.m", 383, @"Invalid parameter not satisfying: %@", @"count > 0 || delay > 0" object file lineNumber description];

    id v10 = v14;
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  else {
    [(PQLConnection *)self useSerialQueueWithTarget:v10];
  }
  self->_useBatching = 1;
  self->_batchingChangesLimit = a5;
  self->_batchingPeriod = a4;
  id batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_id batchingPolicyHandler = 0;
}

- (void)useBatchingWithDelay:(double)a3 changeCount:(int)a4
{
}

- (void)useBatchingOnTargetQueue:(id)a3 withPolicyHandler:(id)a4
{
  if (self->_useQueue)
  {
    targetQueue = self->_targetQueue;
    id v7 = a4;
    dispatch_assert_queue_V2(targetQueue);
  }
  else
  {
    id v9 = a4;
    [(PQLConnection *)self useSerialQueueWithTarget:a3];
  }
  self->_useBatching = 1;
  self->_batchingChangesLimit = 0;
  self->_batchingPeriod = 0.0;
  id v10 = (void *)[a4 copy];

  id batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_id batchingPolicyHandler = v10;
}

- (void)useBatchingWithPolicyHandler:(id)a3
{
}

- (void)_batchStartIfNeeded:(int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (!self->_useBatching || self->_batchStarted) {
    -[PQLConnection _batchStartIfNeeded:]();
  }
  if (a3 > 2) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = off_1E6CAFB30[a3];
  }
  if ([(PQLConnection *)self _execute:v5 mustSucceed:1 bindings:0])
  {
    willBeginBatchingHook = (void (**)(id, PQLConnection *))self->_willBeginBatchingHook;
    if (willBeginBatchingHook) {
      willBeginBatchingHook[2](willBeginBatchingHook, self);
    }
    id v7 = (OS_os_transaction *)os_transaction_create();
    batchStarted = self->_batchStarted;
    self->_batchStarted = v7;

    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    id v9 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_1DCCE4000, v9, OS_LOG_TYPE_DEBUG, "Starting database batch on %@", buf, 0xCu);
    }
    self->_batchingChangesCount = sqlite3_total_changes(self->_db);
    double batchingPeriod = self->_batchingPeriod;
    if (batchingPeriod > 0.0)
    {
      unint64_t v11 = 1000000 * (unint64_t)(batchingPeriod * 1000.0);
      uint64_t v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_serialQueue);
      dispatch_time_t v13 = dispatch_time(0, v11);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, v11 / 0xA);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__PQLConnection__batchStartIfNeeded___block_invoke;
      block[3] = &unk_1E6CAF9D0;
      block[4] = self;
      dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
      dispatch_source_set_event_handler(v12, v14);

      dispatch_resume(v12);
      batchingTimer = self->_batchingTimer;
      self->_batchingTimer = (OS_dispatch_source *)v12;
      long long v16 = v12;
    }
    id batchingPolicyHandler = (void (**)(id, PQLConnection *, uint64_t))self->_batchingPolicyHandler;
    if (batchingPolicyHandler) {
      batchingPolicyHandler[2](batchingPolicyHandler, self, 4294967294);
    }
  }
}

void __37__PQLConnection__batchStartIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01AB700]();
  if (pql_pred != -1) {
    dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
  }
  id v3 = pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1DCCE4000, v3, OS_LOG_TYPE_DEBUG, "Flushing database batch for timer on %@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) flush];
}

- (void)forceBatchStart
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      self->_lastError = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      goto LABEL_8;
    }
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:488 description:@"Connection has been used after close (or before open)"];
  }
  int v5 = self;
  if (v5->_useBatching && !v5->_batchStarted) {
    [(PQLConnection *)v5 _batchStartIfNeeded:v5->_batchTransactionType];
  }
LABEL_8:

  MEMORY[0x1F41817F8]();
}

- (void)_batchStopIfNeeded
{
}

- (void)_fireFlushNotifications
{
}

void __40__PQLConnection__fireFlushNotifications__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01AB700]();
  ++*(_DWORD *)(*(void *)(a1 + 32) + 40);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*(void *)(a1 + 32) + 16)) {
          uint64_t v8 = *(void *)(a1 + 32);
        }
        else {
          uint64_t v8 = 0;
        }
        (*(void (**)(void, uint64_t))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * i), v8);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  --*(_DWORD *)(*(void *)(a1 + 32) + 40);
}

- (int)_vacuumMode
{
  id v2 = [(PQLConnection *)self fetch:@"PRAGMA auto_vacuum"];
  if ([v2 next])
  {
    id v3 = [v2 stringAtIndex:0];
    uint64_t v4 = [v3 lowercaseString];

    if ([v4 isEqualToString:@"incremental"])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:@"full"])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:@"off"])
    {
      int v5 = 0;
    }
    else
    {
      int v6 = [v4 intValue];
      if (v6 >= 2) {
        int v7 = 2;
      }
      else {
        int v7 = v6;
      }
      int v5 = v7 & ~(v7 >> 31);
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)_incrementalVacuum:(unint64_t)a3
{
  ++self->_suspendCaching;
  uint64_t v4 = [NSString stringWithFormat:@"PRAGMA incremental_vacuum(%lld)", a3];
  db = self->_db;
  id v6 = v4;
  int v7 = sqlite3_exec(db, (const char *)[v6 UTF8String], 0, 0, 0);
  if (v7)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v8 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCE4000, v8, OS_LOG_TYPE_DEFAULT, "warning: Incremental vacuum failed", buf, 2u);
    }
  }
  --self->_suspendCaching;

  return v7 == 0;
}

- (void)_vacuumIfNeeded
{
}

- (BOOL)_fullSync
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  self->_currentStmtStart = mach_absolute_time();
  int v3 = sqlite3_wal_checkpoint_v2(self->_db, "main", 1, 0, 0);
  self->_currentStmtStart = 0;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorForDB:self->_db];
    lastError = self->_lastError;
    self->_lastError = v4;

LABEL_3:
    (*((void (**)(void))self->_autoRollbackHandler + 2))();
    return 0;
  }
  if (pql_pred != -1) {
    dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
  }
  int v7 = pql_log;
  if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = "full";
    if (!self->_needsFullSync) {
      uint64_t v8 = "barrier";
    }
    int v21 = 136315394;
    v22 = (PQLConnection *)v8;
    __int16 v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1DCCE4000, v7, OS_LOG_TYPE_DEBUG, "%s fsyncing %@", (uint8_t *)&v21, 0x16u);
  }
  int v9 = open([(NSURL *)self->_url fileSystemRepresentation], 0);
  if (v9 < 0)
  {
    long long v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    dispatch_time_t v13 = self->_lastError;
    self->_lastError = v12;

    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v14 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      dispatch_block_t v15 = self->_lastError;
      int v21 = 138412546;
      v22 = self;
      __int16 v23 = 2112;
      v24 = (PQLConnection *)v15;
      _os_log_impl(&dword_1DCCE4000, v14, OS_LOG_TYPE_ERROR, "Failed to open the db for fsync %@ - %@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_3;
  }
  int v10 = v9;
  if (self->_needsFullSync) {
    int v11 = fcntl(v9, 51);
  }
  else {
    int v11 = fcntl(v9, 85);
  }
  if (v11 < 0)
  {
    long long v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    id v17 = self->_lastError;
    self->_lastError = v16;

    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v18 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      id v19 = "F_FULLFSYNC";
      v20 = self->_lastError;
      if (!self->_needsFullSync) {
        id v19 = "F_BARRIERFSYNC";
      }
      int v21 = 136315650;
      v22 = (PQLConnection *)v19;
      __int16 v23 = 2112;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1DCCE4000, v18, OS_LOG_TYPE_ERROR, "Failed to %s the db for %@ - %@", (uint8_t *)&v21, 0x20u);
    }
    (*((void (**)(void))self->_autoRollbackHandler + 2))();
    close(v10);
    return 0;
  }
  close(v10);
  return 1;
}

- (void)flush
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (self->_savePointLevel)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:734 description:@"-flush is invalid when in a savepoint"];
  }
  if (self->_db) {
    goto LABEL_8;
  }
  if (self->_crashIfUsedAfterClose)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:736 description:@"Connection has been used after close (or before open)"];

LABEL_8:
    if (self->_batchStarted)
    {
      int v5 = (void *)MEMORY[0x1E01AB700]();
      id v6 = self->_batchStarted;
      batchingTimer = self->_batchingTimer;
      if (batchingTimer)
      {
        dispatch_source_cancel(batchingTimer);
        uint64_t v8 = self->_batchingTimer;
        self->_batchingTimer = 0;
      }
      id batchingPolicyHandler = (void (**)(id, PQLConnection *, uint64_t))self->_batchingPolicyHandler;
      if (batchingPolicyHandler) {
        batchingPolicyHandler[2](batchingPolicyHandler, self, 0xFFFFFFFFLL);
      }
      ++self->_skipBatchStop;
      preFlushHook = (void (**)(id, PQLConnection *))self->_preFlushHook;
      if (preFlushHook) {
        preFlushHook[2](preFlushHook, self);
      }
      if ([(PQLConnection *)self _execute:@"commit" mustSucceed:1 bindings:0])
      {
        if (self->_needsFullSync || self->_needsBarrierFSync)
        {
          if ([(PQLConnection *)self synchronousMode] != 2) {
            [(PQLConnection *)self _fullSync];
          }
          *(_WORD *)&self->_needsFullSync = 0;
        }
        batchStarted = self->_batchStarted;
        self->_batchStarted = 0;

        didFinishBatchingHook = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
        if (didFinishBatchingHook) {
          didFinishBatchingHook[2](didFinishBatchingHook, self);
        }
        if (pql_pred != -1) {
          dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
        }
        dispatch_time_t v13 = pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 138412290;
          int v21 = self;
          _os_log_impl(&dword_1DCCE4000, v13, OS_LOG_TYPE_DEBUG, "Flushed %@", (uint8_t *)&v20, 0xCu);
        }
        if ((self->_vacuumTracker & 0x80000000) == 0) {
          [(PQLConnection *)self _vacuumIfNeeded];
        }
        postFlushHook = (void (**)(id, PQLConnection *))self->_postFlushHook;
        if (postFlushHook) {
          postFlushHook[2](postFlushHook, self);
        }
      }
      else
      {
        dispatch_block_t v15 = self->_batchStarted;
        self->_batchStarted = 0;

        long long v16 = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
        if (v16) {
          v16[2](v16, self);
        }
        flushNotifications = self->_flushNotifications;
        self->_flushNotifications = 0;

        if ((self->_vacuumTracker & 0x80000000) == 0) {
          [(PQLConnection *)self _vacuumIfNeeded];
        }
      }
      --self->_skipBatchStop;
      uint64_t v18 = self;

      if (v18)
      {

        id v6 = 0;
      }
      self->_batchingChangesCount = sqlite3_total_changes(self->_db);
      if (self->_flushNotifications) {
        [(PQLConnection *)self _fireFlushNotifications];
      }
    }
    return;
  }
  self->_lastError = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];

  MEMORY[0x1F41817F8]();
}

- (void)makeNextFlushBarrierFSync
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (!self->_needsFullSync && !self->_needsBarrierFSync)
  {
    [(PQLConnection *)self forceBatchStart];
    self->_needsBarrierFSync = 1;
  }
}

- (void)makeNextFlushFullSync
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if (!self->_needsFullSync)
  {
    [(PQLConnection *)self forceBatchStart];
    self->_needsFullSync = 1;
  }
}

- (BOOL)_performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5
{
  char v6 = a3;
  int v9 = (unsigned int (**)(id, PQLConnection *))a4;
  id v10 = a5;
  uint64_t v11 = [(NSMutableArray *)self->_flushNotifications count];
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      v46 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v46;

      uint64_t v22 = 0;
      __int16 v23 = 0;
      v24 = 0;
      int v21 = 0;
      BOOL v39 = 0;
      goto LABEL_74;
    }
    [MEMORY[0x1E4F28B00] currentHandler];
    v13 = uint64_t v12 = v11;
    [v13 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:858 description:@"Connection has been used after close (or before open)"];

    uint64_t v11 = v12;
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  if ((v6 & 0x20) != 0) {
    [(PQLConnection *)self flush];
  }
  v54 = v10;
  if (v10)
  {
    if (self->_useBatching) {
      v6 |= 4u;
    }
    if (!self->_useQueue)
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      v52 = uint64_t v51 = v11;
      [v52 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:869 description:@"completion handler passed and no serial Queue in use"];

      uint64_t v11 = v51;
    }
    if ((v6 & 0xC) == 0)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      dispatch_block_t v15 = v14;
      long long v16 = @"flush notification makes no sense without batching or savepoints";
      SEL v17 = a2;
      uint64_t v18 = self;
      uint64_t v19 = 871;
LABEL_81:
      [v14 handleFailureInMethod:v17 object:v18 file:@"PQLConnection.m" lineNumber:v19 description:v16];
    }
  }
  else if ((v6 & 4) != 0 && !self->_useBatching)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    dispatch_block_t v15 = v14;
    long long v16 = @"PerformSuspendBatch makes no sense if batching isn't in use";
    SEL v17 = a2;
    uint64_t v18 = self;
    uint64_t v19 = 873;
    goto LABEL_81;
  }
  int v20 = v6 & 0xC;
  if ((v6 & 0xC) != 0)
  {
    if (self->_useBatching || self->_savePointLevel)
    {
      int v21 = 0;
    }
    else
    {
      willBeginBatchingHook = (void (**)(id, PQLConnection *))self->_willBeginBatchingHook;
      if (willBeginBatchingHook) {
        willBeginBatchingHook[2](willBeginBatchingHook, self);
      }
      int v21 = (void *)os_transaction_create();
    }
    ++self->_skipBatchStop;
    if ((v6 & 2) != 0) {
      goto LABEL_22;
    }
  }
  else
  {
    int v21 = 0;
    if ((v6 & 2) != 0) {
LABEL_22:
    }
      ++self->_suspendCaching;
  }
  if ((v6 & 8) != 0)
  {
    uint64_t savePointLevel = self->_savePointLevel;
    v26 = v9;
    if (savePointLevel > 4)
    {
      [NSString stringWithFormat:@"savepoint savepoint_%d", self->_savePointLevel];
      uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithFormat:@"rollback to savepoint savepoint_%d", self->_savePointLevel];
      __int16 v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithFormat:@"release savepoint savepoint_%d", self->_savePointLevel];
      uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v22 = _performWithFlags_action_whenFlushed__start_list[savePointLevel];
      __int16 v23 = _performWithFlags_action_whenFlushed__rollback_list[self->_savePointLevel];
      uint64_t v27 = _performWithFlags_action_whenFlushed__release_list[self->_savePointLevel];
    }
    v24 = v27;
    v28 = self;
    p_isa = (id *)&v28->super.isa;
    if (v28->_useBatching && !v28->_batchStarted) {
      [(PQLConnection *)v28 _batchStartIfNeeded:v28->_batchTransactionType];
    }

    if (![p_isa _execute:v22 mustSucceed:1 bindings:0])
    {
      int v9 = v26;
      goto LABEL_51;
    }
    uint64_t v53 = v11;
    ++self->_savePointLevel;
    v30 = v26;
    char v31 = v26[2](v26, (PQLConnection *)p_isa);
    id v32 = p_isa[31];
    if ((v31 & 1) == 0) {
      [p_isa _execute:v23 mustSucceed:1 bindings:0];
    }
    --self->_savePointLevel;
    char v33 = [p_isa _execute:v24 mustSucceed:1 bindings:0] & v31;
    id v34 = p_isa[31];
    p_isa[31] = v32;

    int v9 = v30;
    uint64_t v11 = v53;
    int v20 = v6 & 0xC;
    if ((v33 & 1) == 0)
    {
LABEL_51:
      uint64_t v40 = [(NSMutableArray *)self->_flushNotifications count];
      if (v40 != v11) {
        -[NSMutableArray removeObjectsInRange:](self->_flushNotifications, "removeObjectsInRange:", v11, v40 - v11);
      }
      BOOL v39 = 0;
      if ((v6 & 2) == 0) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }
  else
  {
    uint64_t v22 = 0;
    __int16 v23 = 0;
    v24 = 0;
    if (!v9[2](v9, self)) {
      goto LABEL_51;
    }
  }
  if (v54)
  {
    if (self->_batchStarted || self->_savePointLevel)
    {
      flushNotifications = self->_flushNotifications;
      if (!flushNotifications)
      {
        v36 = (NSMutableArray *)objc_opt_new();
        v37 = self->_flushNotifications;
        self->_flushNotifications = v36;

        flushNotifications = self->_flushNotifications;
      }
      v38 = (void *)MEMORY[0x1E01AB900](v54);
      [(NSMutableArray *)flushNotifications addObject:v38];
    }
    else
    {
      if (self->_flushNotifications) {
        -[PQLConnection _performWithFlags:action:whenFlushed:]();
      }
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PQLConnection__performWithFlags_action_whenFlushed___block_invoke;
      block[3] = &unk_1E6CAFA98;
      block[4] = self;
      id v56 = v54;
      dispatch_async(serialQueue, block);
    }
  }
  if (!self->_useBatching && !self->_savePointLevel && (self->_vacuumTracker & 0x80000000) == 0) {
    [(PQLConnection *)self _vacuumIfNeeded];
  }
  BOOL v39 = 1;
  if ((v6 & 2) == 0) {
    goto LABEL_55;
  }
LABEL_54:
  --self->_suspendCaching;
LABEL_55:
  if (v20)
  {
    v41 = self;

    if (v41)
    {
      if (self->_flushNotifications) {
        [(PQLConnection *)self _fireFlushNotifications];
      }

      didFinishBatchingHook = (void (**)(id, PQLConnection *))self->_didFinishBatchingHook;
      id v10 = v54;
      if (didFinishBatchingHook) {
        didFinishBatchingHook[2](didFinishBatchingHook, self);
      }
      int v21 = 0;
    }
    else
    {
      id v10 = v54;
    }
    --self->_skipBatchStop;
  }
  else
  {
    id v10 = v54;
  }
  v43 = self;
  v44 = v43;
  if (v43->_useBatching && v43->_batchStarted && !v43->_skipBatchStop) {
    [(PQLConnection *)v43 _batchStopIfNeeded];
  }

  char v45 = !v39;
  if ((v6 & 0x10) == 0) {
    char v45 = 1;
  }
  if ((v45 & 1) == 0)
  {
    [(PQLConnection *)v44 flush];
    BOOL v39 = 1;
  }
LABEL_74:

  return v39;
}

void __54__PQLConnection__performWithFlags_action_whenFlushed___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E01AB700]();
  ++*(_DWORD *)(*(void *)(a1 + 32) + 40);
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
  --*(_DWORD *)(*(void *)(a1 + 32) + 40);
}

- (BOOL)isBatchSuspended
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  return self->_skipBatchStop > 0;
}

- (void)groupInBatch:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__PQLConnection_groupInBatch___block_invoke;
  v6[3] = &unk_1E6CAFAC0;
  id v7 = v4;
  id v5 = v4;
  [(PQLConnection *)self _performWithFlags:4 action:v6 whenFlushed:0];
}

uint64_t __30__PQLConnection_groupInBatch___block_invoke(uint64_t a1)
{
  return 1;
}

- (BOOL)groupInTransaction:(id)a3
{
  return [(PQLConnection *)self _performWithFlags:8 action:a3 whenFlushed:0];
}

- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4 whenFlushed:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (v6)
  {
    if (!self->_useQueue)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1000 description:@"PerformOnSerialQueue asked with no serial Queue in use"];
    }
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PQLConnection_performWithFlags_action_whenFlushed___block_invoke;
    block[3] = &unk_1E6CAFAE8;
    uint64_t v18 = &v20;
    block[4] = self;
    int v19 = v6;
    id v16 = v9;
    id v17 = v10;
    dispatch_sync(serialQueue, block);

    BOOL v11 = *((unsigned char *)v21 + 24) != 0;
  }
  else
  {
    BOOL v11 = [(PQLConnection *)self _performWithFlags:v6 action:v9 whenFlushed:v10];
    *((unsigned char *)v21 + 24) = v11;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __53__PQLConnection_performWithFlags_action_whenFlushed___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performWithFlags:*(unsigned int *)(a1 + 64) action:*(void *)(a1 + 40) whenFlushed:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)performWithFlags:(unsigned int)a3 action:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (v4)
  {
    if (!self->_useQueue)
    {
      BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1016 description:@"PerformOnSerialQueue asked with no serial Queue in use"];
    }
    serialQueue = self->_serialQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PQLConnection_performWithFlags_action___block_invoke;
    v12[3] = &unk_1E6CAFB10;
    uint64_t v14 = &v16;
    v12[4] = self;
    int v15 = v4;
    id v13 = v7;
    dispatch_sync(serialQueue, v12);

    BOOL v8 = *((unsigned char *)v17 + 24) != 0;
  }
  else
  {
    BOOL v8 = [(PQLConnection *)self _performWithFlags:v4 action:v7 whenFlushed:0];
    *((unsigned char *)v17 + 24) = v8;
  }
  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __41__PQLConnection_performWithFlags_action___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performWithFlags:*(unsigned int *)(a1 + 56) action:*(void *)(a1 + 40) whenFlushed:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)setTraced:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  db = self->_db;
  if (db)
  {
    if (v3)
    {
      uint64_t v6 = (int (__cdecl *)(unsigned int, void *, void *, void *))db_trace;
      unsigned int v7 = 1;
    }
    else
    {
      unsigned int v7 = 0;
      uint64_t v6 = 0;
    }
    sqlite3_trace_v2(db, v7, v6, self);
  }
  self->_traced = v3;
}

- (void)_clearStatementCache
{
  if (self->_serialQueue)
  {
    preparedStatements = self->_preparedStatements;
    if (preparedStatements) {
      cache_remove_all(preparedStatements);
    }
  }

  [(PQLConnection *)self _clearCleanupCacheQueueIfNeeded];
}

- (BOOL)openAtURL:(id)a3 withFlags:(int)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  objc_storeStrong((id *)&self->_url, a3);
  p_db = &self->_db;
  if (self->_db)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1094 description:@"-openAtURL called twice"];
  }
  int v12 = sqlite3_open_v2([(NSURL *)self->_url fileSystemRepresentation], &self->_db, a4, 0);
  if (v12)
  {
    if (*p_db)
    {
      if (a5)
      {
        [MEMORY[0x1E4F28C58] errorForDB:];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      [(PQLConnection *)self close:0];
    }
    else if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SqliteErrorDomain" code:v12 userInfo:0];
    }
    [(PQLConnection *)self _resetState];
  }
  else
  {
    if (sqlite3_busy_handler(*p_db, (int (__cdecl *)(void *, int))__PQLBusyHandlerFunction, self))
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      }
      id v13 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1DCCE4000, v13, OS_LOG_TYPE_ERROR, "Can't set busy handler", (uint8_t *)&v17, 2u);
      }
    }
    if (self->_traced)
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      }
      uint64_t v14 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        uint64_t v18 = self;
        _os_log_impl(&dword_1DCCE4000, v14, OS_LOG_TYPE_DEBUG, "opened %@", (uint8_t *)&v17, 0xCu);
      }
      [(PQLConnection *)self setTraced:self->_traced];
    }
    [(PQLConnection *)self _clearStatementCache];
  }

  return v12 == 0;
}

- (BOOL)openAtURL:(id)a3 sharedCache:(BOOL)a4 error:(id *)a5
{
  if (a4) {
    uint64_t v5 = 131078;
  }
  else {
    uint64_t v5 = 262150;
  }
  return [(PQLConnection *)self openAtURL:a3 withFlags:v5 error:a5];
}

- (BOOL)destroyDatabaseWithError:(id *)a3
{
  int v22 = 0;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v20;

      return 0;
    }
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1132 description:@"Connection has been used after close (or before open)"];
  }
  id v7 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA page_size"];
  int v8 = 0;
  *((void *)&v9 + 1) = [v7 integerValue];
  *(void *)&long long v9 = *((void *)&v9 + 1) - 1024;
  switch((unint64_t)(v9 >> 10))
  {
    case 0uLL:
      int v8 = 16;
      goto LABEL_9;
    case 1uLL:
      int v8 = 32;
      goto LABEL_9;
    case 3uLL:
      int v8 = 48;
      goto LABEL_9;
    case 7uLL:
      int v8 = 64;
LABEL_9:
      int v22 = v8;
      break;
    default:
      break;
  }
  id v10 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA journal_mode"];
  BOOL v11 = [v10 lowercaseString];
  int v12 = [v11 isEqualToString:@"wal"];

  if (v12)
  {
    v8 |= 1u;
    int v22 = v8;
  }
  int v13 = [(PQLConnection *)self _vacuumMode];
  if (v13 == 2)
  {
    int v14 = v8 | 0xC;
  }
  else if (v13 == 1)
  {
    int v14 = v8 | 8;
  }
  else
  {
    if (v13) {
      goto LABEL_19;
    }
    int v14 = v8 | 4;
  }
  int v22 = v14;
LABEL_19:
  int v15 = sqlite3_file_control(self->_db, 0, 101, &v22);
  BOOL v16 = v15 == 0;
  if (v15)
  {
    int v17 = [MEMORY[0x1E4F28C58] errorForDB:self->_db];
    uint64_t v18 = self->_lastError;
    self->_lastError = v17;

    if (a3) {
      *a3 = self->_lastError;
    }
  }

  return v16;
}

- (BOOL)setupPragmas
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      int v12 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      BOOL v10 = 0;
      lastError = self->_lastError;
      self->_lastError = v12;
      goto LABEL_14;
    }
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1169 description:@"Connection has been used after close (or before open)"];
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  ++self->_suspendCaching;
  if ([(PQLConnection *)self execute:@"PRAGMA auto_vacuum = incremental"]
    && [(PQLConnection *)self execute:@"PRAGMA page_size = 4096"])
  {
    if (self->_shouldUseWALJournalMode)
    {
      lastError = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA journal_mode = WAL"];
      uint64_t v6 = [(NSError *)lastError lowercaseString];
      char v7 = [v6 isEqualToString:@"wal"];

      if ((v7 & 1) == 0)
      {
        long long v9 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:2 andMessage:@"cannot set journal_mode to WAL"];
        id v8 = 0;
        goto LABEL_19;
      }
      id v8 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA wal_autocheckpoint = 4000"];
      if (([v8 isEqualToNumber:&unk_1F3830338] & 1) == 0)
      {
        long long v9 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:2 andMessage:@"cannot set wal_autocheckpoint to 4000"];
LABEL_19:
        int v13 = self->_lastError;
        self->_lastError = v9;

        BOOL v10 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      lastError = 0;
      id v8 = 0;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
    lastError = 0;
    id v8 = 0;
  }
LABEL_13:
  --self->_suspendCaching;

LABEL_14:
  return v10;
}

- (BOOL)registerFunction:(id)a3 nArgs:(int)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v20;

LABEL_11:
      BOOL v19 = 0;
      goto LABEL_12;
    }
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1226 description:@"Connection has been used after close (or before open)"];
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  db = self->_db;
  int v13 = (const char *)[v9 UTF8String];
  id v14 = (id)[v10 copy];
  function_id v2 = sqlite3_create_function_v2(db, v13, a4, 5, v14, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))pql_invoke_xfunc, 0, 0, (void (__cdecl *)(void *))pql_destroy_xfunc);

  if (function_v2)
  {
    BOOL v16 = [MEMORY[0x1E4F28C58] errorForDB:self->_db];
    int v17 = self->_lastError;
    self->_lastError = v16;

    sqliteErrorHandler = (void (**)(id, PQLConnection *, void, NSError *))self->_sqliteErrorHandler;
    if (sqliteErrorHandler) {
      sqliteErrorHandler[2](sqliteErrorHandler, self, 0, self->_lastError);
    }
    goto LABEL_11;
  }
  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)close:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  [(PQLConnection *)self flush];
  [(PQLConnection *)self _clearStatementCache];
  id batchingPolicyHandler = self->_batchingPolicyHandler;
  self->_id batchingPolicyHandler = 0;

  db = self->_db;
  self->_db = 0;
  if (sqlite3_busy_handler(db, 0, 0))
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    char v7 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCE4000, v7, OS_LOG_TYPE_ERROR, "can't clear busy handler", buf, 2u);
    }
  }
  int v8 = sqlite3_close(db);
  if (v8)
  {
    self->_db = db;
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorForDB:db];
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    id v10 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412546;
      int v22 = (PQLConnection *)url;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1DCCE4000, v10, OS_LOG_TYPE_ERROR, "sqlite3_close(%@) failed: %@", buf, 0x16u);
    }
    uint64_t v20 = (void *)v9;
    if (v8 == 5)
    {
      stmt = sqlite3_next_stmt(self->_db, 0);
      if (stmt)
      {
        int v13 = stmt;
        do
        {
          if (pql_pred != -1) {
            dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
          }
          id v14 = (void *)pql_log;
          if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_ERROR))
          {
            int v15 = self->_url;
            BOOL v16 = v14;
            int v17 = sqlite3_sql(v13);
            *(_DWORD *)buf = 138412546;
            int v22 = (PQLConnection *)v15;
            __int16 v23 = 2080;
            uint64_t v24 = (uint64_t)v17;
            _os_log_impl(&dword_1DCCE4000, v16, OS_LOG_TYPE_ERROR, "sqlite3_close(%@) fails: [%s] isn't finalized", buf, 0x16u);
          }
          int v13 = sqlite3_next_stmt(self->_db, v13);
        }
        while (v13);
      }
    }
    if (a3) {
      *a3 = v20;
    }
  }
  else
  {
    if (self->_traced)
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      }
      uint64_t v18 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        int v22 = self;
        _os_log_impl(&dword_1DCCE4000, v18, OS_LOG_TYPE_DEBUG, "closed %@", buf, 0xCu);
      }
    }
    [(PQLConnection *)self _resetState];
  }
  return v8 == 0;
}

- (BOOL)backupToURL:(id)a3 progress:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v20;

      BOOL v16 = 0;
      goto LABEL_23;
    }
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1285 description:@"Connection has been used after close (or before open)"];
  }
  if (!self->_savePointLevel) {
    [(PQLConnection *)self flush];
  }
  ppDb = 0;
  while (1)
  {
    id v10 = [v7 path];
    [v10 UTF8String];
    int v11 = _sqlite3_db_clone();

    if (v11 != 5) {
      break;
    }
    usleep(0x186A0u);
  }
  id v12 = [v7 path];
  uint64_t v13 = sqlite3_open_v2((const char *)[v12 fileSystemRepresentation], &ppDb, 2, 0);

  if (!v13)
  {
    uint64_t v13 = sqlite3_wal_checkpoint_v2(ppDb, 0, 2, 0, 0);
    if (!v13)
    {
      uint64_t v13 = sqlite3_close(ppDb);
      ppDb = 0;
    }
  }
  if (self->_traced)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    id v14 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = url;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 1024;
      int v28 = v13;
      _os_log_impl(&dword_1DCCE4000, v14, OS_LOG_TYPE_DEBUG, "finished backup from %@ to %@, rc: %d", buf, 0x1Cu);
    }
  }
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  BOOL v16 = v13 == 0;
  if (v13)
  {
    int v17 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:v13 andMessage:@"backup failed"];
    uint64_t v18 = self->_lastError;
    self->_lastError = v17;
  }
  else
  {
    uint64_t v18 = self->_lastError;
    self->_lastError = 0;
  }

LABEL_23:
  return v16;
}

- (BOOL)isInBatch
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  return self->_batchStarted != 0;
}

- (BOOL)isInTransaction
{
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  return self->_savePointLevel > 0;
}

- (int64_t)lastInsertedRowID
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v7;

      return 0;
    }
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1359 description:@"Connection has been used after close (or before open)"];
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  db = self->_db;

  return sqlite3_last_insert_rowid(db);
}

- (void)setBatchTransactionType:(int)a3
{
  if (a3 >= 3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"invalid transactionType passed: %ld", a3];
  }
  self->_batchTransactionType = a3;
}

- (unint64_t)synchronousMode
{
  id v2 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA synchronous"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setSynchronousMode:(unint64_t)a3
{
  if (self->_useBatching && self->_batchStarted)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    uint64_t v5 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCCE4000, v5, OS_LOG_TYPE_FAULT, "Safety level change from within a transaction", buf, 2u);
    }
  }
  switch(a3)
  {
    case 2uLL:
      uint64_t v6 = @"PRAGMA synchronous = 2";
      goto LABEL_13;
    case 1uLL:
      uint64_t v6 = @"PRAGMA synchronous = 1";
      goto LABEL_13;
    case 0uLL:
      uint64_t v6 = @"PRAGMA synchronous = 0";
LABEL_13:
      [(PQLConnection *)self _execute:v6 mustSucceed:1 bindings:0];
      return;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"invalid synchronousMode passed: %ld", a3];
}

- (void)setAutoRollbackHandler:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"autoRollbackHandler should not be nil"];
    id v4 = 0;
  }
  uint64_t v5 = (void *)MEMORY[0x1E01AB900](v4);
  id autoRollbackHandler = self->_autoRollbackHandler;
  self->_id autoRollbackHandler = v5;
}

- (int64_t)changes
{
  if (!self->_db)
  {
    if (!self->_crashIfUsedAfterClose)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:21 andMessage:@"connection is closed"];
      lastError = self->_lastError;
      self->_lastError = v6;

      return 0;
    }
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PQLConnection.m" lineNumber:1414 description:@"Connection has been used after close (or before open)"];
  }
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  int64_t result = self->_changesOverride;
  if (!result) {
    return sqlite3_changes(self->_db);
  }
  return result;
}

- (BOOL)_executeStmt:(id)a3 mustSucceed:(BOOL)a4 preparationTime:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = (sqlite3_stmt **)a3;
  [(PQLConnection *)self assertOnQueue];
  if (!v8)
  {
    BOOL v13 = 0;
    goto LABEL_25;
  }
  self->_changesOverride = 0;
  int autocommit = sqlite3_get_autocommit(self->_db);
  self->_currentStmtStart = mach_absolute_time();
  int v10 = sqlite3_step(v8[1]);
  int v11 = 101;
  if (v10)
  {
    int v12 = v10;
    if (v10 != 101)
    {
      if (v10 == 100)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"this isn't an update, you should use -select instead" format];
        goto LABEL_20;
      }
      id v14 = [MEMORY[0x1E4F28C58] errorForDB:self->_db stmt:v8[1]];
      lastError = self->_lastError;
      self->_lastError = v14;

      int v16 = sqlite3_get_autocommit(self->_db);
      if (autocommit) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v16 == 0;
      }
      char v18 = v17;
      if (v6 || (v18 & 1) == 0)
      {
        id autoRollbackHandler = (void (**)(id, PQLConnection *, sqlite3_stmt **, NSError *))self->_autoRollbackHandler;
      }
      else
      {
        id autoRollbackHandler = (void (**)(id, PQLConnection *, sqlite3_stmt **, NSError *))self->_sqliteErrorHandler;
        if (!autoRollbackHandler) {
          goto LABEL_19;
        }
      }
      autoRollbackHandler[2](autoRollbackHandler, self, v8, self->_lastError);
LABEL_19:
      int v11 = v12;
    }
  }
LABEL_20:
  [v8 unbindForDB:self returnedRows:0 executionTime:mach_absolute_time() - self->_currentStmtStart preparationTime:a5];
  self->_currentStmtStart = 0;
  if (!self->_useBatching && !self->_savePointLevel && (self->_vacuumTracker & 0x80000000) == 0)
  {
    int64_t v20 = [(PQLConnection *)self changes];
    [(PQLConnection *)self _vacuumIfNeeded];
    self->_changesOverride = v20;
  }
  BOOL v13 = v11 == 101;
LABEL_25:

  return v13;
}

- (BOOL)_execute:(id)a3 mustSucceed:(BOOL)a4 bindings:(char *)a5
{
  BOOL v5 = a4;
  uint64_t v9 = 0;
  id v7 = [(PQLConnection *)self _newStatementForFormat:a3 preparationTime:&v9 arguments:a5];
  LOBYTE(v5) = [(PQLConnection *)self _executeStmt:v7 mustSucceed:v5 preparationTime:v9];

  return v5;
}

- (BOOL)execute:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  BOOL v6 = v5;
  if (v5->_useBatching && !v5->_batchStarted) {
    [(PQLConnection *)v5 _batchStartIfNeeded:v5->_batchTransactionType];
  }

  BOOL v7 = [(PQLConnection *)v6 _execute:v4 mustSucceed:0 bindings:&v11];
  id v8 = v6;
  uint64_t v9 = v8;
  if (v6->_useBatching && v8->_batchStarted && !v8->_skipBatchStop) {
    [(PQLConnection *)v8 _batchStopIfNeeded];
  }

  return v7;
}

- (BOOL)execute:(id)a3 args:(char *)a4
{
  id v6 = a3;
  BOOL v7 = self;
  id v8 = v7;
  if (v7->_useBatching && !v7->_batchStarted) {
    [(PQLConnection *)v7 _batchStartIfNeeded:v7->_batchTransactionType];
  }

  BOOL v9 = [(PQLConnection *)v8 _execute:v6 mustSucceed:0 bindings:a4];
  int v10 = v8;
  uint64_t v11 = v10;
  if (v8->_useBatching && v10->_batchStarted && !v10->_skipBatchStop) {
    [(PQLConnection *)v10 _batchStopIfNeeded];
  }

  return v9;
}

- (BOOL)executeRaw:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  id v6 = v5;
  if (v5->_useBatching && !v5->_batchStarted) {
    [(PQLConnection *)v5 _batchStartIfNeeded:v5->_batchTransactionType];
  }

  BOOL v7 = [(PQLConnection *)v6 _execute:v4 mustSucceed:0 bindings:0];
  id v8 = v6;
  BOOL v9 = v8;
  if (v6->_useBatching && v8->_batchStarted && !v8->_skipBatchStop) {
    [(PQLConnection *)v8 _batchStopIfNeeded];
  }

  return v7;
}

- (id)fetch:(id)a3
{
  v9[0] = 0;
  id v4 = a3;
  [(PQLConnection *)self assertOnQueue];
  v9[1] = &v10;
  id v5 = [(PQLConnection *)self _newStatementForFormat:v4 preparationTime:v9 arguments:&v10];

  id v6 = [PQLResultSet alloc];
  BOOL v7 = [(PQLResultSet *)v6 initWithStatement:v5 usingDatabase:self preparationTime:v9[0]];

  return v7;
}

- (id)fetch:(id)a3 args:(char *)a4
{
  uint64_t v11 = 0;
  id v6 = a3;
  [(PQLConnection *)self assertOnQueue];
  id v7 = [(PQLConnection *)self _newStatementForFormat:v6 preparationTime:&v11 arguments:a4];

  id v8 = [PQLResultSet alloc];
  BOOL v9 = [(PQLResultSet *)v8 initWithStatement:v7 usingDatabase:self preparationTime:v11];

  return v9;
}

- (id)fetchObjectOfClass:(Class)a3 initializer:(SEL)a4 sql:(id)a5
{
  return [(PQLConnection *)self fetchObjectOfClass:a3 initializer:a4 sql:a5 args:&v6];
}

- (id)fetchObjectOfClass:(Class)a3 sql:(id)a4 args:(char *)a5
{
  return [(PQLConnection *)self fetchObjectOfClass:a3 initializer:0 sql:a4 args:a5];
}

- (id)fetchObject:(id)a3 sql:(id)a4 args:(char *)a5
{
  id v8 = a4;
  id v9 = a3;
  [(PQLConnection *)self assertOnQueue];
  uint64_t v17 = 0;
  id v10 = [(PQLConnection *)self _newStatementForFormat:v8 preparationTime:&v17 arguments:a5];

  uint64_t v11 = [PQLResultSet alloc];
  int v12 = [(PQLResultSet *)v11 initWithStatement:v10 usingDatabase:self preparationTime:v17];
  BOOL v13 = [(PQLResultSet *)v12 onlyObject:v9];

  if (!v13)
  {
    id v14 = [(PQLResultSet *)v12 error];
    lastError = self->_lastError;
    self->_lastError = v14;
  }
  return v13;
}

- (id)fetchObject:(id)a3 sql:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PQLConnection *)self assertOnQueue];
  v15[0] = 0;
  v15[1] = &v16;
  id v8 = [(PQLConnection *)self _newStatementForFormat:v6 preparationTime:v15 arguments:&v16];

  id v9 = [PQLResultSet alloc];
  id v10 = [(PQLResultSet *)v9 initWithStatement:v8 usingDatabase:self preparationTime:v15[0]];
  uint64_t v11 = [(PQLResultSet *)v10 onlyObject:v7];

  if (!v11)
  {
    int v12 = [(PQLResultSet *)v10 error];
    lastError = self->_lastError;
    self->_lastError = v12;
  }
  return v11;
}

- (id)userVersion
{
  id v2 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"PRAGMA user_version"];

  return v2;
}

- (BOOL)setUserVersion:(int64_t)a3
{
  id v4 = [[NSString alloc] initWithFormat:@"PRAGMA user_version = %ld", a3];
  ++self->_suspendCaching;
  BOOL v5 = [(PQLConnection *)self executeRaw:v4];
  --self->_suspendCaching;

  return v5;
}

- (int64_t)autovacuumableSpaceInBytes
{
  id v3 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"pragma freelist_count"];
  id v4 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"pragma page_size"];
  uint64_t v5 = [v3 integerValue];
  int64_t v6 = [v4 integerValue] * v5;

  return v6;
}

- (BOOL)incrementalVacuum:(int64_t)a3
{
  id v5 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:@"pragma page_size"];
  if ([v5 integerValue]) {
    BOOL v6 = -[PQLConnection _incrementalVacuum:](self, "_incrementalVacuum:", a3 / [v5 integerValue]);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (id)lockedHandler
{
  return self->_lockedHandler;
}

- (void)setLockedHandler:(id)a3
{
}

- (id)busyHandler
{
  return self->_busyHandler;
}

- (void)setBusyHandler:(id)a3
{
}

- (id)autoRollbackHandler
{
  return self->_autoRollbackHandler;
}

- (id)sqliteErrorHandler
{
  return self->_sqliteErrorHandler;
}

- (void)setSqliteErrorHandler:(id)a3
{
}

- (id)preFlushHook
{
  return self->_preFlushHook;
}

- (void)setPreFlushHook:(id)a3
{
}

- (id)postFlushHook
{
  return self->_postFlushHook;
}

- (void)setPostFlushHook:(id)a3
{
}

- (void)setProfilingHook:(id)a3
{
}

- (void)setProfilingHookV2:(id)a3
{
}

- (id)willBeginBatchingHook
{
  return self->_willBeginBatchingHook;
}

- (void)setWillBeginBatchingHook:(id)a3
{
}

- (id)didFinishBatchingHook
{
  return self->_didFinishBatchingHook;
}

- (void)setDidFinishBatchingHook:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (BOOL)crashIfUsedAfterClose
{
  return self->_crashIfUsedAfterClose;
}

- (void)setCrashIfUsedAfterClose:(BOOL)a3
{
  self->_crashIfUsedAfterClose = a3;
}

- (int)batchTransactionType
{
  return self->_batchTransactionType;
}

- (BOOL)shouldUseWALJournalMode
{
  return self->_shouldUseWALJournalMode;
}

- (void)setShouldUseWALJournalMode:(BOOL)a3
{
  self->_shouldUseWALJournalMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_didFinishBatchingHook, 0);
  objc_storeStrong(&self->_willBeginBatchingHook, 0);
  objc_storeStrong(&self->_profilingHookV2, 0);
  objc_storeStrong(&self->_profilingHook, 0);
  objc_storeStrong(&self->_postFlushHook, 0);
  objc_storeStrong(&self->_preFlushHook, 0);
  objc_storeStrong(&self->_sqliteErrorHandler, 0);
  objc_storeStrong(&self->_autoRollbackHandler, 0);
  objc_storeStrong(&self->_busyHandler, 0);
  objc_storeStrong(&self->_lockedHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_stmtCacheCleanupQueue, 0);
  objc_storeStrong((id *)&self->_stmtCacheSource, 0);
  objc_storeStrong((id *)&self->_batchingTimer, 0);
  objc_storeStrong(&self->_batchingPolicyHandler, 0);
  objc_storeStrong((id *)&self->_flushNotifications, 0);

  objc_storeStrong((id *)&self->_batchStarted, 0);
}

- (BOOL)executeSwift:(id)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  id v6 = [(PQLConnection *)self _newStatementForBuilder:a3 preparationTime:&v13];
  if (!v6)
  {
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v7 = self;
  id v8 = v7;
  if (v7->_useBatching && !v7->_batchStarted) {
    [(PQLConnection *)v7 _batchStartIfNeeded:v7->_batchTransactionType];
  }

  BOOL v9 = [(PQLConnection *)v8 _executeStmt:v6 mustSucceed:0 preparationTime:v13];
  id v10 = v8;
  uint64_t v11 = v10;
  if (v8->_useBatching && v10->_batchStarted && !v10->_skipBatchStop) {
    [(PQLConnection *)v10 _batchStopIfNeeded];
  }

  if (a4)
  {
LABEL_12:
    if (!v9) {
      *a4 = self->_lastError;
    }
  }
LABEL_14:

  return v9;
}

- (id)fetchObjectOfClassSwift:(Class)a3 query:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  uint64_t v17 = 0;
  id v9 = [(PQLConnection *)self _newStatementForBuilder:v8 preparationTime:&v17];
  id v10 = [PQLResultSet alloc];
  uint64_t v11 = [(PQLResultSet *)v10 initWithStatement:v9 usingDatabase:self preparationTime:v17];
  int v12 = [(PQLResultSet *)v11 onlyObjectOfClass:a3 initializer:0];
  if (!v12)
  {
    uint64_t v13 = [(PQLResultSet *)v11 error];
    lastError = self->_lastError;
    self->_lastError = v13;

    int v15 = self->_lastError;
    if (!v15) {
      -[PQLConnection(Swift) fetchObjectOfClassSwift:query:error:]();
    }
    if (a5) {
      *a5 = v15;
    }
  }

  return v12;
}

- (id)fetchObjectSwift:(id)a3 query:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_useQueue) {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_targetQueue);
  }
  uint64_t v18 = 0;
  id v10 = [(PQLConnection *)self _newStatementForBuilder:v9 preparationTime:&v18];
  uint64_t v11 = [PQLResultSet alloc];
  int v12 = [(PQLResultSet *)v11 initWithStatement:v10 usingDatabase:self preparationTime:v18];
  uint64_t v13 = [(PQLResultSet *)v12 onlyObject:v8];
  if (!v13)
  {
    id v14 = [(PQLResultSet *)v12 error];
    lastError = self->_lastError;
    self->_lastError = v14;

    uint64_t v16 = self->_lastError;
    if (!v16) {
      -[PQLConnection(Swift) fetchObjectSwift:query:error:]();
    }
    if (a5) {
      *a5 = v16;
    }
  }

  return v13;
}

- (void)_batchStartIfNeeded:.cold.1()
{
}

- (void)_performWithFlags:action:whenFlushed:.cold.1()
{
  __assert_rtn("-[PQLConnection _performWithFlags:action:whenFlushed:]", "PQLConnection.m", 927, "_flushNotifications == nil");
}

@end