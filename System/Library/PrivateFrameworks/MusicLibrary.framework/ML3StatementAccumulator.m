@interface ML3StatementAccumulator
- (BOOL)_onQueueFlushAndWait:(BOOL)a3;
- (BOOL)enqueueStatement:(id)a3;
- (BOOL)flushAndWait:(BOOL)a3;
- (ML3DatabaseConnection)connection;
- (ML3StatementAccumulator)init;
- (ML3StatementAccumulator)initWithConnection:(id)a3;
- (NSMutableArray)statementQueue;
- (NSString)databasePath;
- (NSUUID)existingTransactionIdentifier;
- (unint64_t)priorityLevel;
- (unint64_t)statementThreshold;
- (void)dealloc;
- (void)setExistingTransactionIdentifier:(id)a3;
- (void)setPriorityLevel:(unint64_t)a3;
- (void)setStatementThreshold:(unint64_t)a3;
@end

@implementation ML3StatementAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_statementQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_xpcService, 0);
}

- (void)setPriorityLevel:(unint64_t)a3
{
  self->_priorityLevel = a3;
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (void)setExistingTransactionIdentifier:(id)a3
{
}

- (NSUUID)existingTransactionIdentifier
{
  return self->_existingTransactionIdentifier;
}

- (ML3DatabaseConnection)connection
{
  return self->_connection;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (NSMutableArray)statementQueue
{
  return self->_statementQueue;
}

- (void)setStatementThreshold:(unint64_t)a3
{
  self->_statementThreshold = a3;
}

- (unint64_t)statementThreshold
{
  return self->_statementThreshold;
}

- (BOOL)_onQueueFlushAndWait:(BOOL)a3
{
  BOOL v3 = a3;
  v30[1] = *MEMORY[0x1E4F143B8];
  if (!self->_databasePath)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ML3StatementAccumulator.m" lineNumber:84 description:@"Attempted to flush database statements without a specified database path."];
  }
  BOOL v5 = 1;
  if ([(NSMutableArray *)self->_statementQueue count])
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    v6 = (void *)[(NSMutableArray *)self->_statementQueue copy];
    [(NSMutableArray *)self->_statementQueue removeAllObjects];
    v29 = @"MLDatabaseOperationAttributeStatementsKey";
    v30[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    databasePath = self->_databasePath;
    v27[1] = @"MLDatabaseOperationOptionPriorityLevelKey";
    v28[0] = databasePath;
    v27[0] = @"MLDatabaseOperationOptionDatabasePathKey";
    v9 = [NSNumber numberWithUnsignedInteger:self->_priorityLevel];
    v28[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    v11 = (void *)[v10 mutableCopy];

    existingTransactionIdentifier = self->_existingTransactionIdentifier;
    if (existingTransactionIdentifier) {
      [v11 setObject:existingTransactionIdentifier forKey:@"MLDatabaseOperationOptionTransactionIdentifierKey"];
    }
    dispatch_semaphore_t v13 = 0;
    if (v3) {
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    }
    xpcService = self->_xpcService;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__ML3StatementAccumulator__onQueueFlushAndWait___block_invoke;
    v19[3] = &unk_1E5FB8270;
    v21 = &v23;
    BOOL v22 = v3;
    v15 = v13;
    v20 = v15;
    [(MLMediaLibraryService *)xpcService performDatabaseOperation:2 withAttributes:v7 options:v11 completionHandler:v19];
    if (v3) {
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
    BOOL v5 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }
  return v5;
}

void __48__ML3StatementAccumulator__onQueueFlushAndWait___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Error flushing statements in accumulator: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)flushAndWait:(BOOL)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ML3StatementAccumulator_flushAndWait___block_invoke;
  block[3] = &unk_1E5FB8230;
  block[4] = self;
  block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(serialQueue, block);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __40__ML3StatementAccumulator_flushAndWait___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _onQueueFlushAndWait:*(unsigned __int8 *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)enqueueStatement:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  if ([(ML3DatabaseConnection *)self->_connection transactionMarkedForRollBack])
  {
    *((unsigned char *)v14 + 24) = 0;
    id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v4 sql];
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "failing to enque statement inside a transaction marked for rollback. sql=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__ML3StatementAccumulator_enqueueStatement___block_invoke;
    block[3] = &unk_1E5FB8208;
    block[4] = self;
    id v11 = v4;
    v12 = &v13;
    dispatch_sync(serialQueue, block);
  }
  BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void *__44__ML3StatementAccumulator_enqueueStatement___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 32) addObject:a1[5]];
  unint64_t v2 = [*(id *)(a1[4] + 32) count];
  uint64_t result = (void *)a1[4];
  if (v2 >= result[3])
  {
    uint64_t result = (void *)[result _onQueueFlushAndWait:1];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  }
  return result;
}

- (void)dealloc
{
  [(ML3StatementAccumulator *)self flushAndWait:1];
  v3.receiver = self;
  v3.super_class = (Class)ML3StatementAccumulator;
  [(ML3StatementAccumulator *)&v3 dealloc];
}

- (ML3StatementAccumulator)init
{
  return 0;
}

- (ML3StatementAccumulator)initWithConnection:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ML3StatementAccumulator;
  v6 = [(ML3StatementAccumulator *)&v19 init];
  BOOL v7 = v6;
  if (v6)
  {
    v6->_statementThreshold = 20;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6->_statementThreshold];
    statementQueue = v7->_statementQueue;
    v7->_statementQueue = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_connection, a3);
    uint64_t v10 = [v5 databasePath];
    uint64_t v11 = [v10 copy];
    databasePath = v7->_databasePath;
    v7->_databasePath = (NSString *)v11;

    existingTransactionIdentifier = v7->_existingTransactionIdentifier;
    v7->_existingTransactionIdentifier = 0;

    v7->_priorityLevel = 0;
    uint64_t v14 = +[MLMediaLibraryService sharedMediaLibraryService];
    xpcService = v7->_xpcService;
    v7->_xpcService = (MLMediaLibraryService *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.MusicLibrary.ML3StatementAccumulator", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v16;
  }
  return v7;
}

@end