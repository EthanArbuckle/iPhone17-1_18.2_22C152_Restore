@interface _ML3DatabaseConnectionSubPool
- (BOOL)hasBusyConnections;
- (BOOL)isBusyConnection:(id)a3;
- (BOOL)useDistantConnections;
- (BOOL)useReadOnlyConnections;
- (NSString)databasePath;
- (_ML3DatabaseConnectionSubPool)init;
- (_ML3DatabaseConnectionSubPool)initWithDatabasePath:(id)a3 maxConcurrentConnections:(unint64_t)a4;
- (id)checkoutConnection:(BOOL *)a3;
- (id)debugDescription;
- (unint64_t)connectionsJournalingMode;
- (unint64_t)maxConcurrentConnections;
- (void)_handleDatabaseDeletion;
- (void)checkInConnection:(id)a3;
- (void)checkInConnection:(id)a3 returnToPool:(BOOL)a4;
- (void)closeConnection:(id)a3;
- (void)closeConnectionsAndWaitForBusyConnections:(BOOL)a3;
- (void)dealloc;
- (void)handleDiagnostic:(id)a3;
- (void)setConnectionsJournalingMode:(unint64_t)a3;
- (void)setUseDistantConnections:(BOOL)a3;
- (void)setUseReadOnlyConnections:(BOOL)a3;
@end

@implementation _ML3DatabaseConnectionSubPool

- (void)checkInConnection:(id)a3 returnToPool:(BOOL)a4
{
  id v6 = a3;
  checkinQueue = self->_checkinQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke;
  block[3] = &unk_1E5FB8018;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(checkinQueue, block);
}

- (id)checkoutConnection:(BOOL *)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__24922;
  v16 = __Block_byref_object_dispose__24923;
  id v17 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  checkoutQueue = self->_checkoutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke;
  block[3] = &unk_1E5FB7FF0;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(checkoutQueue, block);
  if (a3) {
    *a3 = *((unsigned char *)v9 + 24);
  }
  id v5 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

- (void)checkInConnection:(id)a3
{
  [(_ML3DatabaseConnectionSubPool *)self checkInConnection:a3 returnToPool:1];
}

- (void)setUseReadOnlyConnections:(BOOL)a3
{
  self->_useReadOnlyConnections = a3;
}

- (void)setUseDistantConnections:(BOOL)a3
{
  self->_useDistantConnections = a3;
}

- (void)setConnectionsJournalingMode:(unint64_t)a3
{
  self->_connectionsJournalingMode = a3;
}

- (_ML3DatabaseConnectionSubPool)initWithDatabasePath:(id)a3 maxConcurrentConnections:(unint64_t)a4
{
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_ML3DatabaseConnectionSubPool;
  v7 = [(_ML3DatabaseConnectionSubPool *)&v33 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    databasePath = v7->_databasePath;
    v7->_databasePath = (NSString *)v8;

    v7->_maxConcurrentConnections = a4;
    *(_WORD *)&v7->_useReadOnlyConnections = 0;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MusicLibrary._ML3DatabaseConnectionSubPool.checkoutQueue", 0);
    checkoutQueue = v7->_checkoutQueue;
    v7->_checkoutQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MusicLibrary._ML3DatabaseConnectionSubPool.checkinQueue", 0);
    checkinQueue = v7->_checkinQueue;
    v7->_checkinQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MusicLibrary._ML3DatabaseConnectionSubPool.serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v14;

    dispatch_semaphore_t v16 = dispatch_semaphore_create(v7->_maxConcurrentConnections);
    waitingSemaphore = v7->_waitingSemaphore;
    v7->_waitingSemaphore = (OS_dispatch_semaphore *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    availableConnections = v7->_availableConnections;
    v7->_availableConnections = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    busyConnections = v7->_busyConnections;
    v7->_busyConnections = v20;

    if (!__daemonProcessInfo)
    {
      objc_initWeak(&location, v7);
      v22 = (const char *)[@"MLMediaLibraryWillDeleteDatabaseNotification" UTF8String];
      v23 = MEMORY[0x1E4F14428];
      id v24 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke;
      handler[3] = &unk_1E5FB7FA0;
      objc_copyWeak(&v31, &location);
      notify_register_dispatch(v22, &v7->_willDeleteDatabaseNotifyToken, v23, handler);
      v25 = MEMORY[0x1E4F14428];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke_205;
      v27[3] = &unk_1E5FB7FC8;
      objc_copyWeak(&v29, &location);
      id v28 = v6;
      notify_register_dispatch("HSCachesClearedNotification", &v7->_homeSharingCachesClearedNotifyToken, v25, v27);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_busyConnections, 0);
  objc_storeStrong((id *)&self->_availableConnections, 0);
  objc_storeStrong((id *)&self->_waitingSemaphore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_checkinQueue, 0);

  objc_storeStrong((id *)&self->_checkoutQueue, 0);
}

- (unint64_t)connectionsJournalingMode
{
  return self->_connectionsJournalingMode;
}

- (BOOL)useDistantConnections
{
  return self->_useDistantConnections;
}

- (BOOL)useReadOnlyConnections
{
  return self->_useReadOnlyConnections;
}

- (unint64_t)maxConcurrentConnections
{
  return self->_maxConcurrentConnections;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)_handleDatabaseDeletion
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Connection subpool %{public}@ closing all connections.", (uint8_t *)&v4, 0xCu);
  }

  [(_ML3DatabaseConnectionSubPool *)self closeConnectionsAndWaitForBusyConnections:0];
}

- (BOOL)isBusyConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  dispatch_queue_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  checkinQueue = self->_checkinQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___ML3DatabaseConnectionSubPool_isBusyConnection___block_invoke;
  block[3] = &unk_1E5FB8208;
  id v9 = v4;
  dispatch_queue_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(checkinQueue, block);
  LOBYTE(checkinQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)checkinQueue;
}

- (void)handleDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50___ML3DatabaseConnectionSubPool_handleDiagnostic___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)closeConnectionsAndWaitForBusyConnections:(BOOL)a3
{
  BOOL v23 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = 0;
  objc_super v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v5 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(_ML3DatabaseConnectionSubPool *)self debugDescription];
    int v7 = [(NSMutableSet *)self->_availableConnections count];
    int v8 = [(NSMutableSet *)self->_busyConnections count];
    *(_DWORD *)buf = 138543874;
    v37 = v6;
    __int16 v38 = 1024;
    *(_DWORD *)v39 = v7;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v8;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ closeConnectionsAndWaitForBusyConnections _availableConnections (count) = %d, _busyConnections (count) = %d", buf, 0x18u);
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___ML3DatabaseConnectionSubPool_closeConnectionsAndWaitForBusyConnections___block_invoke;
  block[3] = &unk_1E5FB8040;
  block[4] = self;
  BOOL v31 = v23;
  id v10 = v4;
  id v29 = v10;
  v30 = &v32;
  dispatch_sync(serialQueue, block);
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_maxConcurrentConnections];
  if (v23 && *((unsigned char *)v33 + 24) && self->_maxConcurrentConnections)
  {
    unint64_t v12 = 0;
    do
    {
      buf[0] = 0;
      uint64_t v13 = [(_ML3DatabaseConnectionSubPool *)self checkoutConnection:buf];
      if (v13)
      {
        [v10 addObject:v13];
        if (buf[0]) {
          [v11 addObject:v13];
        }
      }

      ++v12;
    }
    while (self->_maxConcurrentConnections > v12);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [v17 debugDescription];
          int v20 = [v11 containsObject:v17];
          *(_DWORD *)buf = 138543874;
          v37 = self;
          __int16 v38 = 2114;
          *(void *)v39 = v19;
          *(_WORD *)&v39[8] = 1024;
          int v40 = v20 ^ 1;
          _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ closing open connection=%{public}@, returnToPool=%{BOOL}u", buf, 0x1Cu);
        }
        v21 = [v17 connection];
        [v21 close];

        if (v23) {
          -[_ML3DatabaseConnectionSubPool checkInConnection:returnToPool:](self, "checkInConnection:returnToPool:", v17, [v11 containsObject:v17] ^ 1);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v41 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)closeConnection:(id)a3
{
  id v4 = a3;
  checkinQueue = self->_checkinQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(checkinQueue, v7);
}

- (BOOL)hasBusyConnections
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51___ML3DatabaseConnectionSubPool_hasBusyConnections__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)debugDescription
{
  char v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"ML3DatabaseConnectionSubPool=%p, maxConcurrentConnections=%lu, useReadOnlyConnections=%d, useDistantConnections=%d", self, self->_maxConcurrentConnections, self->_useReadOnlyConnections, self->_useDistantConnections];
  [v3 appendString:@"\n"];
  id v4 = [(NSMutableSet *)self->_availableConnections debugDescription];
  [v3 appendFormat:@"availableConnections=%@", v4];

  [v3 appendString:@"\n"];
  id v5 = [(NSMutableSet *)self->_busyConnections debugDescription];
  [v3 appendFormat:@"busyConnections=%@", v5];

  return v3;
}

- (void)dealloc
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_busyConnections count])
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = (void *)MEMORY[0x1E4F77950];
    uint64_t v6 = *MEMORY[0x1E4F778D0];
    v16[0] = @"BusyConnectionCount";
    int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](self->_busyConnections, "count"));
    v16[1] = @"DatabaseConnectionPool";
    v17[0] = v7;
    uint64_t v8 = [(_ML3DatabaseConnectionSubPool *)self debugDescription];
    v17[1] = v8;
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    v18[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40___ML3DatabaseConnectionSubPool_dealloc__block_invoke;
    v14[3] = &unk_1E5FB8298;
    dispatch_semaphore_t v15 = v4;
    uint64_t v11 = v4;
    [v5 snapshotWithDomain:v6 type:@"Bug" subType:@"ConnectionPoolInBadState" context:@"Deallocating with active connections" triggerThresholdValues:0 events:v10 completion:v14];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  if ([(NSMutableSet *)self->_busyConnections count])
  {
    unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ML3DatabaseConnectionPool.m", 551, @"deallocating pool %@ has %lld active connections", self, -[NSMutableSet count](self->_busyConnections, "count") object file lineNumber description];
  }
  notify_cancel(self->_homeSharingCachesClearedNotifyToken);
  notify_cancel(self->_willDeleteDatabaseNotifyToken);
  [(_ML3DatabaseConnectionSubPool *)self closeConnectionsAndWaitForBusyConnections:0];
  v13.receiver = self;
  v13.super_class = (Class)_ML3DatabaseConnectionSubPool;
  [(_ML3DatabaseConnectionSubPool *)&v13 dealloc];
}

- (_ML3DatabaseConnectionSubPool)init
{
  return 0;
}

@end