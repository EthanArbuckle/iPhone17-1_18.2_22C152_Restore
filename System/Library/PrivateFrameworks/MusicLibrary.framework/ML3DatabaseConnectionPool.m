@interface ML3DatabaseConnectionPool
- (BOOL)isClosed;
- (BOOL)isClosedWithNoActiveOrBusyConnections;
- (BOOL)isCurrentThreadConnectionInTransaction;
- (BOOL)isLocked;
- (BOOL)ownsConnection:(id)a3;
- (BOOL)useDistantWriterConnections;
- (ML3DatabaseConnectionPool)init;
- (ML3DatabaseConnectionPool)initWithDatabasePath:(id)a3 maxReaders:(unint64_t)a4;
- (ML3DatabaseConnectionPool)initWithDatabasePath:(id)a3 maxReaders:(unint64_t)a4 maxWriters:(unint64_t)a5;
- (ML3DatabaseConnectionPoolDelegate)delegate;
- (NSString)databasePath;
- (id)_connectionForIdentifier:(id)a3;
- (id)_connectionForWriting:(BOOL)a3 useThreadConnection:(BOOL)a4 storeThreadLocalConnection:(BOOL)a5;
- (id)_generateDiagnostic;
- (id)_localConnectionForThread:(id)a3;
- (id)debugDescription;
- (id)readerConnection;
- (id)writerConnection;
- (unint64_t)connectionsJournalingMode;
- (unint64_t)maxReaders;
- (unint64_t)maxWriters;
- (void)_closeAllConnectionsAndWaitForBusyConnections:(BOOL)a3;
- (void)_setConnection:(id)a3 forIdentifier:(id)a4;
- (void)_setLocalConnection:(id)a3 forThread:(id)a4;
- (void)checkInConnection:(id)a3;
- (void)closeAllConnections;
- (void)dealloc;
- (void)lock;
- (void)lockAndCloseAllConnectionsForTermination;
- (void)setClosed:(BOOL)a3;
- (void)setConnectionsJournalingMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setUseDistantWriterConnections:(BOOL)a3;
- (void)unlock;
@end

@implementation ML3DatabaseConnectionPool

uint64_t __37__ML3DatabaseConnectionPool_isClosed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 168);
  return result;
}

uint64_t __98__ML3DatabaseConnectionPool__connectionForWriting_useThreadConnection_storeThreadLocalConnection___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 useCount] + 1;

  return [v1 setUseCount:v2];
}

uint64_t __47__ML3DatabaseConnectionPool_checkInConnection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUseCount:", objc_msgSend(*(id *)(a1 + 32), "useCount") - 1);
  uint64_t result = [*(id *)(a1 + 32) useCount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

uint64_t __58__ML3DatabaseConnectionPool__setConnection_forIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(void **)(a1[5] + 24);
  if (v2) {
    return [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

- (id)readerConnection
{
  return [(ML3DatabaseConnectionPool *)self _connectionForWriting:0 useThreadConnection:1 storeThreadLocalConnection:1];
}

- (BOOL)ownsConnection:(id)a3
{
  v4 = [a3 uniqueIdentifier];
  v5 = [(ML3DatabaseConnectionPool *)self _connectionForIdentifier:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (id)_connectionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__24922;
  v16 = __Block_byref_object_dispose__24923;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ML3DatabaseConnectionPool__connectionForIdentifier___block_invoke;
  block[3] = &unk_1E5FB8208;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)checkInConnection:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 uniqueIdentifier];
  id v7 = [(ML3DatabaseConnectionPool *)self _connectionForIdentifier:v6];

  if (v5)
  {
    if (![(ML3DatabaseConnectionPool *)self isClosed]
      || (([v7 connection],
           v8 = objc_claimAutoreleasedReturnValue(),
           ![v8 isReadOnly])
        ? (writersSubPool = self->_writersSubPool)
        : (writersSubPool = self->_readersSubPool),
          BOOL v16 = [(_ML3DatabaseConnectionSubPool *)writersSubPool isBusyConnection:v7],
          v8,
          v16))
    {
      if (!v7)
      {
        v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionPool.m", 254, @"Attempted to return connection %@ not owned by connection pool %@. (Connections in this pool: %@)", v5, self, self->_identifiersConnectionsMap object file lineNumber description];
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v48) = 0;
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__ML3DatabaseConnectionPool_checkInConnection___block_invoke;
      block[3] = &unk_1E5FB8360;
      id v18 = v7;
      id v39 = v18;
      v40 = buf;
      dispatch_sync(serialQueue, block);
      if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
        goto LABEL_31;
      }
      v19 = [v18 owningThread];
      BOOL v20 = v19 == 0;

      if (!v20)
      {
        v21 = [v18 owningThread];
        [(ML3DatabaseConnectionPool *)self _setLocalConnection:0 forThread:v21];

        [v18 setOwningThread:0];
      }
      v22 = [v18 connection];
      v23 = [v22 uniqueIdentifier];
      [(ML3DatabaseConnectionPool *)self _setConnection:0 forIdentifier:v23];

      if ([(ML3DatabaseConnectionPool *)self isClosed])
      {
        v24 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 138543874;
          v42 = self;
          __int16 v43 = 2048;
          id v44 = v5;
          __int16 v45 = 2114;
          id v46 = v18;
          _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ closing connection=%p, wrapper=%{public}@", v41, 0x20u);
        }

        v25 = [v18 connection];
        [v25 isReadOnly];

        readersSubPool = self->_readersSubPool;
        goto LABEL_22;
      }
      v30 = [v18 connection];
      int v31 = [v30 isReadOnly];

      if (v31)
      {
        readersSubPool = self->_readersSubPool;
      }
      else
      {
        v32 = [v18 connection];
        int v33 = [v32 _closeConnectionWhenCheckingIn];

        readersSubPool = self->_writersSubPool;
        if (v33)
        {
LABEL_22:
          [(_ML3DatabaseConnectionSubPool *)readersSubPool closeConnection:v18];
LABEL_31:

          _Block_object_dispose(buf, 8);
          goto LABEL_36;
        }
      }
      [(_ML3DatabaseConnectionSubPool *)readersSubPool checkInConnection:v18];
      goto LABEL_31;
    }
    v27 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 1024;
      BOOL v48 = [(ML3DatabaseConnectionPool *)self isClosed];
      _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot check in connection %{public}@. closed=%{BOOL}u", buf, 0x1Cu);
    }

    v28 = (void *)MEMORY[0x1E4F77950];
    v49[0] = @"ML3DatabaseConnection";
    v11 = [v5 debugDescription];
    v50[0] = v11;
    v49[1] = @"connectionWrapper";
    if (v7)
    {
      v29 = [v7 debugDescription];
    }
    else
    {
      v29 = @"nil";
    }
    v50[1] = v29;
    v49[2] = @"ML3DatabaseConnectionPool";
    v34 = [(ML3DatabaseConnectionPool *)self debugDescription];
    v50[2] = v34;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
    v51 = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [v28 snapshotWithDomain:*MEMORY[0x1E4F778D0] type:@"Bug" subType:@"NotCheckingInConnection" context:@"Connection not in busy pool" triggerThresholdValues:0 events:v36 completion:0];

    if (v7) {
LABEL_35:
    }

    goto LABEL_36;
  }
  id v10 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 1024;
    BOOL v48 = [(ML3DatabaseConnectionPool *)self isClosed];
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot check in connection %{public}@ as we don't have a valid connection wrapper. closed=%{BOOL}u", buf, 0x1Cu);
  }

  v11 = @"nil";
  uint64_t v12 = (void *)MEMORY[0x1E4F77950];
  v53[0] = @"nil";
  v52[0] = @"ML3DatabaseConnection";
  v52[1] = @"connectionWrapper";
  if (v7)
  {
    v11 = [v7 debugDescription];
  }
  v53[1] = v11;
  v52[2] = @"ML3DatabaseConnectionPool";
  v13 = [(ML3DatabaseConnectionPool *)self debugDescription];
  v53[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  v54[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  [v12 snapshotWithDomain:*MEMORY[0x1E4F778D0] type:@"Bug" subType:@"NotCheckingInConnection" context:@"No connection wrapper" triggerThresholdValues:0 events:v15 completion:0];

  if (v7) {
    goto LABEL_35;
  }
LABEL_36:
}

- (BOOL)isClosed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ML3DatabaseConnectionPool_isClosed__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setLocalConnection:(id)a3 forThread:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [v7 owningThread];

  if (v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = [v7 owningThread];
    [v13 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionPool.m", 409, @"Attempted to store local connection for thread %@ when it's already being marked as stored in thread %@", v8, v14 object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ML3DatabaseConnectionPool__setLocalConnection_forThread___block_invoke;
  block[3] = &unk_1E5FB7F48;
  id v16 = v8;
  id v17 = v7;
  id v18 = self;
  id v11 = v7;
  id v12 = v8;
  dispatch_sync(serialQueue, block);
}

- (id)_connectionForWriting:(BOOL)a3 useThreadConnection:(BOOL)a4 storeThreadLocalConnection:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![(ML3DatabaseConnectionPool *)self isClosed])
  {
    char v9 = [MEMORY[0x1E4F29060] currentThread];
    if (v6)
    {
      id v11 = [(ML3DatabaseConnectionPool *)self _localConnectionForThread:v9];
    }
    else
    {
      id v11 = 0;
    }
    pthread_mutex_lock(&self->_poolLockMutex);
    while (self->_locked)
      pthread_cond_wait(&self->_poolLockCondition, &self->_poolLockMutex);
    pthread_mutex_unlock(&self->_poolLockMutex);
    if (v11)
    {
      if (!v7
        || ([v11 connection],
            id v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 isReadOnly],
            v12,
            !v13))
      {
        uint64_t v14 = v11;
LABEL_26:
        serialQueue = self->_serialQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __98__ML3DatabaseConnectionPool__connectionForWriting_useThreadConnection_storeThreadLocalConnection___block_invoke;
        block[3] = &unk_1E5FB8298;
        id v26 = v14;
        id v23 = v14;
        dispatch_sync(serialQueue, block);
        id v10 = [v23 connection];

        goto LABEL_27;
      }
      buf[0] = 0;
    }
    else
    {
      buf[0] = 0;
      if (!v7)
      {
        uint64_t v15 = 8;
        if (!self->_maxReaders) {
          uint64_t v15 = 16;
        }
        goto LABEL_19;
      }
    }
    uint64_t v15 = 16;
LABEL_19:
    id v16 = *(id *)((char *)&self->super.isa + v15);
    uint64_t v14 = [v16 checkoutConnection:buf];

    if (buf[0])
    {
      id v17 = [v14 connection];
      [v17 _setOwningPool:self];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        v19 = [v14 connection];
        [WeakRetained connectionPool:self createdNewConnection:v19];
      }
    }
    if (v5) {
      [(ML3DatabaseConnectionPool *)self _setLocalConnection:v14 forThread:v9];
    }
    BOOL v20 = [v14 connection];
    v21 = [v20 uniqueIdentifier];
    [(ML3DatabaseConnectionPool *)self _setConnection:v14 forIdentifier:v21];

    goto LABEL_26;
  }
  char v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "Database connection pool %{public}@ is closed. You may no longer use it.", buf, 0xCu);
  }
  id v10 = 0;
LABEL_27:

  return v10;
}

- (void)_setConnection:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ML3DatabaseConnectionPool__setConnection_forIdentifier___block_invoke;
  block[3] = &unk_1E5FB7F48;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

- (id)_localConnectionForThread:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__24922;
  v19 = __Block_byref_object_dispose__24923;
  id v20 = 0;
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__ML3DatabaseConnectionPool__localConnectionForThread___block_invoke;
  v10[3] = &unk_1E5FB7F70;
  id v11 = v5;
  id v12 = self;
  int v13 = &v15;
  SEL v14 = a2;
  id v7 = v5;
  dispatch_sync(serialQueue, v10);
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v8;
}

void __55__ML3DatabaseConnectionPool__localConnectionForThread___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) threadDictionary];
  id v9 = [v2 objectForKey:@"ML3DatabaseConnectionPoolThreadStorageKey"];

  if (v9)
  {
    uint64_t v3 = [v9 objectForKey:*(void *)(*(void *)(a1 + 40) + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) owningThread];
  if (v6 != *(void **)(a1 + 32))
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) borrowingThread];
    if (v7 == *(void **)(a1 + 32))
    {
    }
    else
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

      if (!v8) {
        goto LABEL_9;
      }
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"ML3DatabaseConnectionPool.m", 402, @"Connection subpool stored a thread-contested connection %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) object file lineNumber description];
    }
  }

LABEL_9:
}

void __59__ML3DatabaseConnectionPool__setLocalConnection_forThread___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) threadDictionary];
  id v10 = [v2 objectForKey:@"ML3DatabaseConnectionPoolThreadStorageKey"];

  uint64_t v3 = v10;
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [*(id *)(a1 + 32) threadDictionary];
    [v4 setObject:v11 forKey:@"ML3DatabaseConnectionPoolThreadStorageKey"];

    uint64_t v3 = v11;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 40);
  id v12 = v3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [v3 objectForKey:v5];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 connection];
      int v9 = [v8 isReadOnly];

      if (!v9)
      {
LABEL_8:

        goto LABEL_10;
      }
      [v7 setOwningThread:0];
    }
    [v12 setObject:*(void *)(a1 + 40) forKey:*(void *)(*(void *)(a1 + 48) + 40)];
    [*(id *)(a1 + 40) setOwningThread:*(void *)(a1 + 32)];
    goto LABEL_8;
  }
  [v3 removeObjectForKey:v5];
LABEL_10:
}

uint64_t __54__ML3DatabaseConnectionPool__connectionForIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (void)setDelegate:(id)a3
{
}

- (ML3DatabaseConnectionPool)initWithDatabasePath:(id)a3 maxReaders:(unint64_t)a4 maxWriters:(unint64_t)a5
{
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ML3DatabaseConnectionPool;
  id v10 = [(ML3DatabaseConnectionPool *)&v26 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    databasePath = v10->_databasePath;
    v10->_databasePath = (NSString *)v11;

    v10->_maxReaders = a4;
    v10->_maxWriters = a5;
    v10->_connectionsJournalingMode = 1;
    v10->_useDistantWriterConnections = __daemonProcessInfo == 0;
    int v13 = [[_ML3DatabaseConnectionSubPool alloc] initWithDatabasePath:v10->_databasePath maxConcurrentConnections:v10->_maxReaders];
    readersSubPool = v10->_readersSubPool;
    v10->_readersSubPool = v13;

    [(_ML3DatabaseConnectionSubPool *)v10->_readersSubPool setUseReadOnlyConnections:1];
    [(_ML3DatabaseConnectionSubPool *)v10->_readersSubPool setUseDistantConnections:0];
    [(_ML3DatabaseConnectionSubPool *)v10->_readersSubPool setConnectionsJournalingMode:v10->_connectionsJournalingMode];
    uint64_t v15 = [[_ML3DatabaseConnectionSubPool alloc] initWithDatabasePath:v10->_databasePath maxConcurrentConnections:v10->_maxWriters];
    writersSubPool = v10->_writersSubPool;
    v10->_writersSubPool = v15;

    [(_ML3DatabaseConnectionSubPool *)v10->_writersSubPool setUseReadOnlyConnections:0];
    [(_ML3DatabaseConnectionSubPool *)v10->_writersSubPool setUseDistantConnections:v10->_useDistantWriterConnections];
    [(_ML3DatabaseConnectionSubPool *)v10->_writersSubPool setConnectionsJournalingMode:v10->_connectionsJournalingMode];
    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifiersConnectionsMap = v10->_identifiersConnectionsMap;
    v10->_identifiersConnectionsMap = v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.MusicLibrary.ML3DatabaseConectionPool.serialQueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v19;

    v21 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    poolStorageKey = v10->_poolStorageKey;
    v10->_poolStorageKey = v21;

    v10->_closed = 0;
    if (pthread_cond_init(&v10->_poolLockCondition, 0))
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:v10 file:@"ML3DatabaseConnectionPool.m" lineNumber:86 description:@"Failed to initialize condition variable."];
    }
    if (pthread_mutex_init(&v10->_poolLockMutex, 0))
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:v10 file:@"ML3DatabaseConnectionPool.m" lineNumber:89 description:@"Failed to initialize mutex."];
    }
  }

  return v10;
}

- (id)writerConnection
{
  return [(ML3DatabaseConnectionPool *)self _connectionForWriting:1 useThreadConnection:1 storeThreadLocalConnection:1];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_poolStorageKey, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_identifiersConnectionsMap, 0);
  objc_storeStrong((id *)&self->_writersSubPool, 0);

  objc_storeStrong((id *)&self->_readersSubPool, 0);
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (unint64_t)connectionsJournalingMode
{
  return self->_connectionsJournalingMode;
}

- (unint64_t)maxWriters
{
  return self->_maxWriters;
}

- (unint64_t)maxReaders
{
  return self->_maxReaders;
}

- (ML3DatabaseConnectionPoolDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ML3DatabaseConnectionPoolDelegate *)WeakRetained;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (id)_generateDiagnostic
{
  uint64_t v3 = objc_alloc_init(_ML3MutableDatabaseConnectionPoolDiagnostic);
  [(_ML3DatabaseConnectionSubPool *)self->_readersSubPool handleDiagnostic:v3];
  [(_ML3DatabaseConnectionSubPool *)self->_writersSubPool handleDiagnostic:v3];

  return v3;
}

- (void)_closeAllConnectionsAndWaitForBusyConnections:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing all connections and wait for busy connection=%{BOOL}u.", (uint8_t *)&v6, 0x12u);
  }

  [(_ML3DatabaseConnectionSubPool *)self->_readersSubPool closeConnectionsAndWaitForBusyConnections:v3];
  [(_ML3DatabaseConnectionSubPool *)self->_writersSubPool closeConnectionsAndWaitForBusyConnections:v3];
}

- (BOOL)isClosedWithNoActiveOrBusyConnections
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ML3DatabaseConnectionPool *)self isClosed];
  BOOL v4 = [(_ML3DatabaseConnectionSubPool *)self->_readersSubPool hasBusyConnections];
  BOOL v5 = [(_ML3DatabaseConnectionSubPool *)self->_writersSubPool hasBusyConnections];
  int v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138544130;
    BOOL v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Connection pool %{public}@ isClosed=%{BOOL}u, readerSubPoolHasBusyConnections=%{BOOL}u, writerSubPoolHasBusyConnections=%{BOOL}u.", (uint8_t *)&v8, 0x1Eu);
  }

  return v3 && !v4 && !v5;
}

- (void)setClosed:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ML3DatabaseConnectionPool_setClosed___block_invoke;
  block[3] = &unk_1E5FB8298;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __39__ML3DatabaseConnectionPool_setClosed___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 168) = 1;
  return result;
}

- (void)lockAndCloseAllConnectionsForTermination
{
  [(ML3DatabaseConnectionPool *)self setClosed:1];
  [(ML3DatabaseConnectionPool *)self lock];

  [(ML3DatabaseConnectionPool *)self _closeAllConnectionsAndWaitForBusyConnections:1];
}

- (void)unlock
{
  p_poolLockMutex = &self->_poolLockMutex;
  pthread_mutex_lock(&self->_poolLockMutex);
  self->_locked = 0;
  pthread_cond_broadcast(&self->_poolLockCondition);

  pthread_mutex_unlock(p_poolLockMutex);
}

- (void)lock
{
  p_poolLockMutex = &self->_poolLockMutex;
  pthread_mutex_lock(&self->_poolLockMutex);
  self->_locked = 1;

  pthread_mutex_unlock(p_poolLockMutex);
}

- (void)closeAllConnections
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(ML3DatabaseConnectionPool *)self isClosed])
  {
    BOOL v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      BOOL v5 = self;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Database connection pool %{public}@ is closed. You may no longer use it.", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    [(ML3DatabaseConnectionPool *)self _closeAllConnectionsAndWaitForBusyConnections:1];
  }
}

- (BOOL)isCurrentThreadConnectionInTransaction
{
  BOOL v3 = [MEMORY[0x1E4F29060] currentThread];
  int v4 = [(ML3DatabaseConnectionPool *)self _localConnectionForThread:v3];

  BOOL v5 = [v4 connection];
  char v6 = [v5 isInTransaction];

  return v6;
}

- (void)setUseDistantWriterConnections:(BOOL)a3
{
  self->_BOOL useDistantWriterConnections = a3;
  [(_ML3DatabaseConnectionSubPool *)self->_writersSubPool closeConnectionsAndWaitForBusyConnections:1];
  BOOL useDistantWriterConnections = self->_useDistantWriterConnections;
  writersSubPool = self->_writersSubPool;

  [(_ML3DatabaseConnectionSubPool *)writersSubPool setUseDistantConnections:useDistantWriterConnections];
}

- (BOOL)useDistantWriterConnections
{
  return self->_useDistantWriterConnections;
}

- (void)setConnectionsJournalingMode:(unint64_t)a3
{
  self->_unint64_t connectionsJournalingMode = a3;
  -[_ML3DatabaseConnectionSubPool setConnectionsJournalingMode:](self->_readersSubPool, "setConnectionsJournalingMode:");
  unint64_t connectionsJournalingMode = self->_connectionsJournalingMode;
  writersSubPool = self->_writersSubPool;

  [(_ML3DatabaseConnectionSubPool *)writersSubPool setConnectionsJournalingMode:connectionsJournalingMode];
}

- (id)debugDescription
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"ML3DatabaseConnectionPool=%p, maxReaders=%d, maxWriters=%d, journalingMode=%d, useDistantWriterConnections=%d, closed=%d", self, self->_maxReaders, self->_maxWriters, self->_connectionsJournalingMode, self->_useDistantWriterConnections, self->_closed];
  [v3 appendString:@"\n"];
  int v4 = [(_ML3DatabaseConnectionSubPool *)self->_readersSubPool debugDescription];
  [v3 appendFormat:@"readerSubPool=%@", v4];

  [v3 appendString:@"\n"];
  BOOL v5 = [(_ML3DatabaseConnectionSubPool *)self->_writersSubPool debugDescription];
  [v3 appendFormat:@"writerSubPool=%@", v5];

  return v3;
}

- (void)dealloc
{
  if (![(ML3DatabaseConnectionPool *)self isClosed]) {
    [(ML3DatabaseConnectionPool *)self lockAndCloseAllConnectionsForTermination];
  }
  pthread_cond_destroy(&self->_poolLockCondition);
  pthread_mutex_destroy(&self->_poolLockMutex);
  v3.receiver = self;
  v3.super_class = (Class)ML3DatabaseConnectionPool;
  [(ML3DatabaseConnectionPool *)&v3 dealloc];
}

- (ML3DatabaseConnectionPool)init
{
  return 0;
}

- (ML3DatabaseConnectionPool)initWithDatabasePath:(id)a3 maxReaders:(unint64_t)a4
{
  return [(ML3DatabaseConnectionPool *)self initWithDatabasePath:a3 maxReaders:a4 maxWriters:1];
}

@end