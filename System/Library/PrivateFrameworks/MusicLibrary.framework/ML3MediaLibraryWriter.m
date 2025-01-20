@interface ML3MediaLibraryWriter
+ (id)writerErrorWithCode:(int64_t)a3 description:(id)a4;
+ (id)writerErrorWithCode:(int64_t)a3 description:(id)a4 userInfo:(id)a5;
- (BOOL)_shouldWatchdogTransaction:(id)a3;
- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5;
- (BOOL)executeUntrustedUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6;
- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6;
- (BOOL)isSuspended;
- (ML3MediaLibraryWriter)init;
- (ML3MediaLibraryWriterDelegate)delegate;
- (NSMutableDictionary)transactionMap;
- (NSOperationQueue)databaseOperationLimitedQueue;
- (NSOperationQueue)databaseOperationQueue;
- (NSOperationQueue)databaseOperationSerialQueue;
- (OS_dispatch_queue)serialQueue;
- (double)transactionTimeout;
- (id)_allDatabaseOperations;
- (id)_createNewTransactionForLibrary:(id)a3 fromClient:(id)a4 readOnly:(BOOL)a5;
- (id)_transactionForIdentifier:(id)a3;
- (id)beginTransactionForLibrary:(id)a3 withClient:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)description;
- (id)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 error:(id *)a7;
- (id)executeUntrustedQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 error:(id *)a7;
- (void)_destroyTransaction:(id)a3 forceRelinquishConnection:(BOOL)a4;
- (void)_destroyTransactionForIdentifier:(id)a3 forceRelinquishConnection:(BOOL)a4;
- (void)_registerTransaction:(id)a3;
- (void)_setupWatchdogTimer;
- (void)_tearDownWatchdogTimer;
- (void)_unregisterTransaction:(id)a3;
- (void)_watchdogTimerFired:(id)a3;
- (void)cancelActiveTransactionForClient:(id)a3;
- (void)cancelActiveTransationAndDatabaseOperationsForClient:(id)a3;
- (void)cancelAllActiveDatabaseOperationsAndWaitUntilFinished:(BOOL)a3;
- (void)cancelAllActiveTransactions;
- (void)dealloc;
- (void)performDatabaseOperation:(unint64_t)a3 onLibrary:(id)a4 withAttributes:(id)a5 options:(id)a6 fromClient:(id)a7 completionHandler:(id)a8;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTransactionTimeout:(double)a3;
@end

@implementation ML3MediaLibraryWriter

uint64_t __51__ML3MediaLibraryWriter__transactionForIdentifier___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 48) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)executeUntrustedUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v14 = [(ML3MediaLibraryWriter *)self _transactionForIdentifier:v13];
  v15 = v14;
  if (v14 && ([v14 connection], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    SEL v28 = a2;
    *(void *)v44 = 0;
    *(void *)&v44[8] = v44;
    *(void *)&v44[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__18761;
    v46 = __Block_byref_object_dispose__18762;
    id v47 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __83__ML3MediaLibraryWriter_executeUntrustedUpdate_withParameters_onTransaction_error___block_invoke;
    v30[3] = &unk_1E5FB62F8;
    v34 = &v36;
    v30[4] = self;
    id v17 = v11;
    id v31 = v17;
    id v32 = v12;
    id v33 = v13;
    v35 = v44;
    uint64_t v18 = [v16 _distrustQueriesDuringBlock:v30];
    if (v18)
    {
      v29 = [NSString stringWithFormat:@"Attempted to execute illegal update: %@ (%d)", v17, v18];
      if (a6)
      {
        v42 = @"action";
        v19 = [NSNumber numberWithInt:v18];
        v43 = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        *a6 = +[ML3MediaLibraryWriter writerErrorWithCode:301 description:v29 userInfo:v20];
      }
      v21 = os_log_create("com.apple.amp.medialibrary", "Writer");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v29;
        _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      if (*((unsigned char *)v37 + 24))
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:v28 object:self file:@"ML3MediaLibraryWriter.m" lineNumber:234 description:@"Authorizer failure should have caused executeUpdate: to return NO"];
      }
    }
    else if (a6)
    {
      v24 = *(void **)(*(void *)&v44[8] + 40);
      if (v24) {
        *a6 = v24;
      }
    }

    _Block_object_dispose(v44, 8);
  }
  else
  {
    v22 = [NSString stringWithFormat:@"Attempted to execute update without a valid transaction (transaction ID = %@). You must start a transaction first before executing an update.", v13];
    if (a6)
    {
      *a6 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:v22];
    }
    v23 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138543618;
      *(void *)&v44[4] = v11;
      *(_WORD *)&v44[12] = 2114;
      *(void *)&v44[14] = v22;
      _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_ERROR, "Failed to execute update %{public}@. %{public}@", v44, 0x16u);
    }

    v16 = 0;
  }
  BOOL v25 = *((unsigned char *)v37 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  return v25;
}

void __83__ML3MediaLibraryWriter_executeUntrustedUpdate_withParameters_onTransaction_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [v2 executeUpdate:v3 withParameters:v4 onTransaction:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v7;
}

- (BOOL)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(ML3MediaLibraryWriter *)self _transactionForIdentifier:v12];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 connection];
    id v29 = 0;
    char v16 = [v15 executeUpdate:v10 withParameters:v11 error:&v29];
    id v17 = v29;
    if (v17) {
      char v18 = 0;
    }
    else {
      char v18 = v16;
    }
    if (v18)
    {
      v19 = 0;
    }
    else
    {
      v21 = [NSString stringWithFormat:@"Database Error: %@", v17];
      v19 = +[ML3MediaLibraryWriter writerErrorWithCode:300 description:v21];
    }
  }
  else
  {
    v20 = [NSString stringWithFormat:@"Attempted to execute update without a valid transaction (transaction ID = %@). You must start a transaction first before executing an update.", v12];
    v19 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:v20];
  }
  v22 = os_log_create("com.apple.amp.medialibrary", "Writer");
  v23 = v22;
  if (v19)
  {
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138543618;
    id v31 = v10;
    __int16 v32 = 2114;
    id v33 = v19;
    v24 = "Failed to execute update %{public}@. %{public}@";
    BOOL v25 = v23;
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    uint32_t v27 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138543362;
    id v31 = v10;
    v24 = "Successfully executed update %{public}@.";
    BOOL v25 = v23;
    os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
    uint32_t v27 = 12;
  }
  _os_log_impl(&dword_1B022D000, v25, v26, v24, buf, v27);
LABEL_16:

  if (a6) {
    *a6 = v19;
  }

  return v19 == 0;
}

- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(ML3MediaLibraryWriter *)self _transactionForIdentifier:v8];
  id v10 = os_log_create("com.apple.amp.medialibrary", "Writer");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    id v12 = "Committing transaction=%p";
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    id v12 = "Rolling back transaction=%p";
  }
  _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_7:

  if (!v9)
  {
    id v13 = [NSString stringWithFormat:@"A connection with the transaction ID %@ could not be found.", v8];
    v14 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:v13];
    goto LABEL_20;
  }
  [v9 lock];
  id v13 = [v9 connection];
  if (![v13 isInTransaction])
  {
    v15 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "Warning: Tried to end non-existent transaction for local connection.", buf, 2u);
    }
    v14 = 0;
    goto LABEL_18;
  }
  if (([v13 popToRootTransactionAndCommit:v6] & 1) == 0)
  {
    char v16 = [v13 sqliteError];
    id v17 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Unable to end transaction with ID %@.", v8];
    v15 = v17;
    if (v16) {
      [v17 appendFormat:@" %@", v16];
    }
    v14 = +[ML3MediaLibraryWriter writerErrorWithCode:300 description:v15];

LABEL_18:
    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:
  [(ML3MediaLibraryWriter *)self _destroyTransactionForIdentifier:v8 forceRelinquishConnection:0];
  [v9 unlock];
LABEL_20:

  if (a5) {
    *a5 = v14;
  }

  return v14 == 0;
}

- (void)_destroyTransactionForIdentifier:(id)a3 forceRelinquishConnection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ML3MediaLibraryWriter *)self _transactionForIdentifier:a3];
  [(ML3MediaLibraryWriter *)self _destroyTransaction:v6 forceRelinquishConnection:v4];
}

- (id)_transactionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18761;
  char v16 = __Block_byref_object_dispose__18762;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ML3MediaLibraryWriter__transactionForIdentifier___block_invoke;
  block[3] = &unk_1E5FB8208;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_destroyTransaction:(id)a3 forceRelinquishConnection:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    [(ML3MediaLibraryWriter *)self _unregisterTransaction:v5];
    id v6 = [v5 _relinquishConnection];
    id v7 = [v5 library];
    [v7 checkInDatabaseConnection:v6];
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_ERROR, "Warning: Attempted to destroy non-existent transaction. Possible deadlock.", v9, 2u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mediaLibraryWriter:self didDestroyTransaction:v5];
  }
}

- (void)_unregisterTransaction:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__ML3MediaLibraryWriter__unregisterTransaction___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (id)beginTransactionForLibrary:(id)a3 withClient:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(ML3MediaLibraryWriter *)self _createNewTransactionForLibrary:v10 fromClient:v11 readOnly:(a5 >> 1) & 1];
  id v13 = v12;
  if (v12)
  {
    if (a5) {
      [v12 setTerminable:0];
    }
    uint64_t v14 = [v13 connection];
    if ([v14 pushTransaction])
    {
      v15 = 0;
    }
    else
    {
      char v16 = [v14 sqliteError];
      id v17 = [v13 identifier];
      [(ML3MediaLibraryWriter *)self _destroyTransactionForIdentifier:v17 forceRelinquishConnection:0];

      char v18 = [NSString stringWithFormat:@"Could not begin transaction. %@", v16];
      v15 = +[ML3MediaLibraryWriter writerErrorWithCode:300 description:v18];
    }
  }
  else
  {
    v15 = +[ML3MediaLibraryWriter writerErrorWithCode:100 description:@"Could not obtain writer connection for database."];
  }
  v19 = os_log_create("com.apple.amp.medialibrary", "Writer");
  v20 = v19;
  if (v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = v11;
      __int16 v25 = 2114;
      os_log_type_t v26 = v15;
      _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_ERROR, "Failed to begin transaction for client %{public}@. %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v13 identifier];
    *(_DWORD *)buf = 138543618;
    id v24 = v11;
    __int16 v25 = 2114;
    os_log_type_t v26 = v21;
    _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "Successfully began transaction for client %{public}@ with identifier %{public}@.", buf, 0x16u);
  }
  if (a6) {
    *a6 = v15;
  }

  return v13;
}

- (id)_createNewTransactionForLibrary:(id)a3 fromClient:(id)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ML3MediaLibraryWriter.m", 624, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  id v11 = [v10 connection];
  if ((objc_msgSend(v11, "ml_isValid") & 1) != 0 || objc_msgSend(v10, "isDaemonClient"))
  {
    uint64_t v12 = [v10 isDaemonClient];
    id v13 = [v9 connectionPool];
    uint64_t v14 = [v13 _connectionForWriting:v5 ^ 1 useThreadConnection:0 storeThreadLocalConnection:v12];

    if ((objc_msgSend(v11, "ml_isValid") & 1) != 0 || objc_msgSend(v10, "isDaemonClient"))
    {
      v15 = [[ML3ActiveTransaction alloc] initWithLibrary:v9 connection:v14 client:v10];
      [(ML3ActiveTransaction *)v15 setReadOnly:v5];
      char v16 = [(ML3ActiveTransaction *)v15 identifier];
      [v14 setCurrentTransactionID:v16];

      [(ML3MediaLibraryWriter *)self _registerTransaction:v15];
      goto LABEL_14;
    }
    id v17 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = [v11 processIdentifier];
      _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "Zombie process with ID %d tried to start a transaction. It already got a connection, but it's being returned.", buf, 8u);
    }

    [v9 checkInDatabaseConnection:v14];
  }
  else
  {
    uint64_t v14 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = [v11 processIdentifier];
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Zombie process with ID %d tried to start a transaction.", buf, 8u);
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

void __46__ML3MediaLibraryWriter__registerTransaction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identifier];
  [*(id *)(*(void *)(a1 + 40) + 48) setObject:*(void *)(a1 + 32) forKey:v2];
}

- (void)_registerTransaction:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ML3MediaLibraryWriter__registerTransaction___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __48__ML3MediaLibraryWriter__unregisterTransaction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identifier];
  [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseOperationLimitedQueue, 0);
  objc_storeStrong((id *)&self->_databaseOperationSerialQueue, 0);
  objc_storeStrong((id *)&self->_databaseOperationQueue, 0);
  objc_storeStrong((id *)&self->_transactionMap, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_watchdogTimer, 0);
}

- (NSOperationQueue)databaseOperationLimitedQueue
{
  return self->_databaseOperationLimitedQueue;
}

- (NSOperationQueue)databaseOperationSerialQueue
{
  return self->_databaseOperationSerialQueue;
}

- (NSOperationQueue)databaseOperationQueue
{
  return self->_databaseOperationQueue;
}

- (NSMutableDictionary)transactionMap
{
  return self->_transactionMap;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (double)transactionTimeout
{
  return self->_transactionTimeout;
}

- (void)setDelegate:(id)a3
{
}

- (ML3MediaLibraryWriterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ML3MediaLibraryWriterDelegate *)WeakRetained;
}

- (void)_watchdogTimerFired:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_transactionTimeout != 0.0)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke;
    block[3] = &unk_1E5FB83D0;
    block[4] = self;
    id v6 = v4;
    id v20 = v6;
    dispatch_sync(serialQueue, block);
    id v7 = +[ML3MediaLibraryWriter writerErrorWithCode:900 description:@"Media library database transaction was terminated due to inactivity."];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          -[ML3MediaLibraryWriter _destroyTransaction:forceRelinquishConnection:](self, "_destroyTransaction:forceRelinquishConnection:", v13, 1, (void)v15);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (objc_opt_respondsToSelector()) {
            [WeakRetained mediaLibraryWriter:self terminatedTransaction:v13 withError:v7];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

void __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke_2;
  v3[3] = &unk_1E5FB63C0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __45__ML3MediaLibraryWriter__watchdogTimerFired___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([*(id *)(a1 + 32) _shouldWatchdogTransaction:v4])
  {
    BOOL v5 = [v4 client];

    if (v5)
    {
      id v6 = [v4 client];
      id v7 = [v6 bundleID];
    }
    else
    {
      id v7 = @"<Unknown>";
    }
    id v8 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "** WARNING ** Writer daemon transaction was watchdogged for %{public}@. Forcing return of connection. %{public}@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (BOOL)_shouldWatchdogTransaction:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  [v4 lastUsedTime];
  double v8 = v6 - v7;
  double transactionTimeout = self->_transactionTimeout;
  char v10 = [v4 inUseByOperation];
  BOOL v11 = 0;
  if (v8 > transactionTimeout && (v10 & 1) == 0)
  {
    CFPreferencesAppSynchronize(@"com.apple.medialibraryd");
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaLibraryWatchdogDisabled", @"com.apple.medialibraryd", 0);
    char v13 = [v4 terminable];
    if (AppBooleanValue) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v13;
    }
  }

  return v11;
}

- (void)_tearDownWatchdogTimer
{
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    [(NSTimer *)watchdogTimer invalidate];
    id v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;
  }
}

- (void)_setupWatchdogTimer
{
  if (self->_watchdogTimer) {
    [(ML3MediaLibraryWriter *)self _tearDownWatchdogTimer];
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1CB00]);
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:self->_transactionTimeout];
  double v5 = (NSTimer *)[v3 initWithFireDate:v4 interval:self target:sel__watchdogTimerFired_ selector:0 userInfo:1 repeats:self->_transactionTimeout];
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = v5;

  id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v7 addTimer:self->_watchdogTimer forMode:*MEMORY[0x1E4F1C3A0]];
}

- (id)_allDatabaseOperations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NSOperationQueue *)self->_databaseOperationQueue operations];
  [v3 addObjectsFromArray:v4];

  double v5 = [(NSOperationQueue *)self->_databaseOperationSerialQueue operations];
  [v3 addObjectsFromArray:v5];

  double v6 = [(NSOperationQueue *)self->_databaseOperationLimitedQueue operations];
  [v3 addObjectsFromArray:v6];

  return v3;
}

- (void)reset
{
  [(ML3MediaLibraryWriter *)self cancelAllActiveTransactions];
  [(ML3MediaLibraryWriter *)self cancelAllActiveDatabaseOperationsAndWaitUntilFinished:1];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ML3MediaLibraryWriter_reset__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __30__ML3MediaLibraryWriter_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
}

- (void)cancelActiveTransationAndDatabaseOperationsForClient:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling database transaction and operations for client %{public}@", buf, 0xCu);
  }

  double v6 = [(ML3MediaLibraryWriter *)self _allDatabaseOperations];
  id v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ML3MediaLibraryWriter_cancelActiveTransationAndDatabaseOperationsForClient___block_invoke;
  block[3] = &unk_1E5FB7F48;
  id v11 = v6;
  id v12 = v4;
  char v13 = self;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __78__ML3MediaLibraryWriter_cancelActiveTransationAndDatabaseOperationsForClient___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138543362;
    long long v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "originatingClient", v14, (void)v15);
        int v10 = [v9 isEqual:*(void *)(a1 + 40)];

        if (v10)
        {
          id v11 = os_log_create("com.apple.amp.medialibrary", "Writer");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            id v20 = v8;
            _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling operation %{public}@", buf, 0xCu);
          }

          [v8 cancel];
          [v8 waitUntilFinished];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 48) cancelActiveTransactionForClient:*(void *)(a1 + 40)];
  id v12 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    id v20 = v13;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Finished cancelling database operations for client %{public}@", buf, 0xCu);
  }
}

- (void)cancelAllActiveDatabaseOperationsAndWaitUntilFinished:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling all active database operations.", v6, 2u);
  }

  [(NSOperationQueue *)self->_databaseOperationQueue cancelAllOperations];
  [(NSOperationQueue *)self->_databaseOperationSerialQueue cancelAllOperations];
  [(NSOperationQueue *)self->_databaseOperationLimitedQueue cancelAllOperations];
  if (v3)
  {
    [(NSOperationQueue *)self->_databaseOperationQueue waitUntilAllOperationsAreFinished];
    [(NSOperationQueue *)self->_databaseOperationSerialQueue waitUntilAllOperationsAreFinished];
    [(NSOperationQueue *)self->_databaseOperationLimitedQueue waitUntilAllOperationsAreFinished];
  }
}

- (void)cancelAllActiveTransactions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all active transactions.", buf, 2u);
  }

  long long v4 = [MEMORY[0x1E4F1CA48] array];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ML3MediaLibraryWriter_cancelAllActiveTransactions__block_invoke;
  block[3] = &unk_1E5FB83D0;
  id v6 = v4;
  id v21 = v6;
  uint64_t v22 = self;
  dispatch_sync(serialQueue, block);
  id v7 = +[ML3MediaLibraryWriter writerErrorWithCode:900 description:@"The media library service cancelled all active database transactions."];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "identifier", (void)v16);
        [(ML3MediaLibraryWriter *)self _destroyTransactionForIdentifier:v14 forceRelinquishConnection:1];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (objc_opt_respondsToSelector()) {
          [WeakRetained mediaLibraryWriter:self terminatedTransaction:v13 withError:v7];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }
}

void __52__ML3MediaLibraryWriter_cancelAllActiveTransactions__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 48) allValues];
  [v1 addObjectsFromArray:v2];
}

- (void)cancelActiveTransactionForClient:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Writer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 bundleID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v4 processID];
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up any remaining transactions for ended process %{public}@ (process ID = %d)", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  long long v14 = __Block_byref_object_copy__18761;
  long long v15 = __Block_byref_object_dispose__18762;
  id v16 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke;
  block[3] = &unk_1E5FB8208;
  void block[4] = self;
  id v8 = v4;
  id v11 = v8;
  id v12 = buf;
  dispatch_sync(serialQueue, block);
  uint64_t v9 = *(void *)(*(void *)&buf[8] + 40);
  if (v9) {
    [(ML3MediaLibraryWriter *)self endTransaction:v9 shouldCommit:0 error:0];
  }

  _Block_object_dispose(buf, 8);
}

void __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke_2;
  v5[3] = &unk_1E5FB6398;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __58__ML3MediaLibraryWriter_cancelActiveTransactionForClient___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 client];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    id v11 = [v8 client];
    int v12 = [v11 isEqual:*(void *)(a1 + 32)];

    if (v12)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)performDatabaseOperation:(unint64_t)a3 onLibrary:(id)a4 withAttributes:(id)a5 options:(id)a6 fromClient:(id)a7 completionHandler:(id)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  context = (void *)MEMORY[0x1B3E93C70]();
  long long v19 = +[ML3DatabaseOperation databaseOperationForType:a3 withLibrary:v14 writer:self];
  id v20 = v19;
  if (v19)
  {
    [v19 setOriginatingClient:v17];
    [v20 setOptions:v16];
    [v20 setAttributes:v15];
    objc_initWeak(&location, v20);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __112__ML3MediaLibraryWriter_performDatabaseOperation_onLibrary_withAttributes_options_fromClient_completionHandler___block_invoke;
    v35[3] = &unk_1E5FB6370;
    objc_copyWeak(&v37, &location);
    id v36 = v18;
    [v20 setCompletionBlock:v35];
    id v21 = [v16 objectForKey:@"MLDatabaseOperationOptionEnqueueSerially"];
    int v22 = [v21 BOOLValue];

    v23 = [v16 objectForKey:@"MLDatabaseOperationOptionUseLimitedQueue"];
    int v24 = [v23 BOOLValue];

    uint64_t v25 = os_log_create("com.apple.amp.medialibrary", "Writer");
    os_log_type_t v26 = v25;
    if (v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [v17 bundleID];
        int v28 = [(NSOperationQueue *)self->_databaseOperationQueue operationCount];
        *(_DWORD *)buf = 138543874;
        v40 = v27;
        __int16 v41 = 2114;
        v42 = v20;
        __int16 v43 = 1024;
        int v44 = v28;
        _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_DEFAULT, "Enqueueing %{public}@'s database operation to the service's serial queue: %{public}@. current operation count = %d", buf, 0x1Cu);
      }
      uint64_t v29 = 64;
    }
    else if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = [v17 bundleID];
        *(_DWORD *)buf = 138543618;
        v40 = v32;
        __int16 v41 = 2114;
        v42 = v20;
        _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_DEFAULT, "Enqueueing %{public}@'s database operation to the service's limited size queue: %{public}@", buf, 0x16u);
      }
      uint64_t v29 = 72;
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v33 = [v17 bundleID];
        *(_DWORD *)buf = 138543618;
        v40 = v33;
        __int16 v41 = 2114;
        v42 = v20;
        _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_DEBUG, "Enqueueing %{public}@'s database operation to the service's concurrent queue: %{public}@", buf, 0x16u);
      }
      uint64_t v29 = 56;
    }

    [*(id *)((char *)&self->super.isa + v29) addOperation:v20];
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"No operation exists for operation type: %lu", a3);
    id v31 = +[ML3MediaLibraryWriter writerErrorWithCode:600 description:v30];
    if (v18) {
      (*((void (**)(id, void, void *))v18 + 2))(v18, 0, v31);
    }
  }
}

void __112__ML3MediaLibraryWriter_performDatabaseOperation_onLibrary_withAttributes_options_fromClient_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained success];
    uint64_t v5 = [v3 error];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Writer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v3 originatingClient];
        uint64_t v9 = [v8 bundleID];
        int v13 = 138543618;
        id v14 = v9;
        __int16 v15 = 2114;
        id v16 = v6;
        _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "Error executing database operation for %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Writer_Oversize");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v3 originatingClient];
        id v11 = [v10 bundleID];
        int v13 = 138543618;
        id v14 = v3;
        __int16 v15 = 2114;
        id v16 = v11;
        _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Successfully executed database operation %{public}@ for process %{public}@", (uint8_t *)&v13, 0x16u);
      }
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
    uint64_t v4 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v4, v6);
  }
}

- (id)executeUntrustedQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 error:(id *)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v32 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  __int16 v43 = __Block_byref_object_copy__18761;
  int v44 = __Block_byref_object_dispose__18762;
  id v45 = (id)MEMORY[0x1E4F1CBF0];
  id v16 = [(ML3MediaLibraryWriter *)self _transactionForIdentifier:v15];
  uint64_t v17 = v16;
  if (v16 && ([v16 connection], (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    SEL v30 = a2;
    *(void *)v50 = 0;
    *(void *)&v50[8] = v50;
    *(void *)&v50[16] = 0x3032000000;
    v51 = __Block_byref_object_copy__18761;
    v52 = __Block_byref_object_dispose__18762;
    id v53 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __90__ML3MediaLibraryWriter_executeUntrustedQuery_withParameters_options_onTransaction_error___block_invoke;
    v33[3] = &unk_1E5FB6348;
    uint64_t v38 = &v40;
    v33[4] = self;
    id v19 = v13;
    id v34 = v19;
    id v35 = v32;
    id v36 = v14;
    id v37 = v15;
    char v39 = v50;
    uint64_t v20 = [v18 _distrustQueriesDuringBlock:v33];
    if (v20)
    {
      id v31 = [NSString stringWithFormat:@"Attempted to execute illegal query: %@ (%d)", v19, v20];
      if (a7)
      {
        uint64_t v48 = @"action";
        id v21 = [NSNumber numberWithInt:v20];
        v49 = v21;
        int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        *a7 = +[ML3MediaLibraryWriter writerErrorWithCode:301 description:v31 userInfo:v22];
      }
      v23 = os_log_create("com.apple.amp.medialibrary", "Writer");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v47 = v31;
        _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      if (v41[5])
      {
        uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
        [v29 handleFailureInMethod:v30 object:self file:@"ML3MediaLibraryWriter.m" lineNumber:346 description:@"Authorizer failure should have caused executeUpdate: to return NO"];
      }
    }
    else if (a7)
    {
      os_log_type_t v26 = *(void **)(*(void *)&v50[8] + 40);
      if (v26) {
        *a7 = v26;
      }
    }

    _Block_object_dispose(v50, 8);
  }
  else
  {
    int v24 = [NSString stringWithFormat:@"Attempted to execute query without a valid transaction (transaction ID = %@). You must be within an existing transaction first before executing a query.", v15];
    if (a7)
    {
      *a7 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:v24];
    }
    uint64_t v25 = os_log_create("com.apple.amp.medialibrary", "Writer");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v50 = 138543618;
      *(void *)&v50[4] = v13;
      *(_WORD *)&v50[12] = 2114;
      *(void *)&v50[14] = v24;
      _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "Error executing query: %{public}@. %{public}@", v50, 0x16u);
    }

    id v18 = 0;
  }
  id v27 = (id)v41[5];

  _Block_object_dispose(&v40, 8);

  return v27;
}

void __90__ML3MediaLibraryWriter_executeUntrustedQuery_withParameters_options_onTransaction_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = *(void *)(a1[10] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v2 executeQuery:v3 withParameters:v4 options:v5 onTransaction:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[9] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 error:(id *)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v38 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__18761;
  v51 = __Block_byref_object_dispose__18762;
  id v52 = 0;
  id v37 = [MEMORY[0x1E4F1CA48] array];
  id v13 = [(ML3MediaLibraryWriter *)self _transactionForIdentifier:v12];
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 connection];
    id v16 = [v11 objectForKey:@"MLDatabaseQueryOptionLimitPropertyKey"];
    id v36 = [v11 objectForKey:@"MLDatabaseQueryOptionLimitValueKey"];
    if (v16 && v36)
    {
      uint64_t v17 = objc_msgSend(v15, "executeQuery:withParameters:limitProperty:limitValue:", v39, v38, v16, objc_msgSend(v36, "longLongValue"));
    }
    else
    {
      uint64_t v17 = [v15 executeQuery:v39 withParameters:v38];
    }
    id v19 = (void *)v17;
    if (v17)
    {
      uint64_t v20 = [v11 objectForKey:@"MLDatabaseQueryOptionRangeBeginKey"];
      id v21 = v20;
      if (v20) {
        uint64_t v22 = [v20 integerValue];
      }
      else {
        uint64_t v22 = 0;
      }
      v23 = [v11 objectForKey:@"MLDatabaseQueryOptionCountKey"];
      int v24 = v23;
      if (v23) {
        uint64_t v25 = [v23 integerValue];
      }
      else {
        uint64_t v25 = 0x7FFFFFFFLL;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v54 = 0;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __81__ML3MediaLibraryWriter_executeQuery_withParameters_options_onTransaction_error___block_invoke;
      v40[3] = &unk_1E5FB6320;
      __int16 v43 = buf;
      uint64_t v45 = v22;
      id v41 = v37;
      id v42 = v15;
      int v44 = &v47;
      uint64_t v46 = v25;
      [v19 enumerateRowsWithBlock:v40];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      os_log_type_t v26 = NSString;
      id v27 = [v15 sqliteError];
      id v19 = [v26 stringWithFormat:@"Database Error: %@", v27];

      uint64_t v28 = +[ML3MediaLibraryWriter writerErrorWithCode:300 description:v19];
      id v21 = (void *)v48[5];
      v48[5] = v28;
    }
  }
  else
  {
    id v15 = [NSString stringWithFormat:@"Attempted to execute query without a valid transaction (transaction ID = %@). You must be within an existing transaction first before executing a query.", v12];
    uint64_t v18 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:v15];
    id v16 = (void *)v48[5];
    v48[5] = v18;
  }

  uint64_t v29 = v48[5];
  SEL v30 = os_log_create("com.apple.amp.medialibrary", "Writer");
  id v31 = v30;
  if (v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = v48[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v32;
      _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_ERROR, "Error executing query: %{public}@. %{public}@", buf, 0x16u);
    }

    if (a7) {
      *a7 = (id) v48[5];
    }
  }
  else
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [v37 count];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v39;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_DEBUG, "Successfully executed query \"%{public}@\" with %lu rows returned.", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v47, 8);

  return v37;
}

void __81__ML3MediaLibraryWriter_executeQuery_withParameters_options_onTransaction_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v17 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void *)(v8 + 24);
  if (v9 >= *(void *)(a1 + 64))
  {
    if (!v17 || v7)
    {
      id v12 = NSString;
      id v13 = [*(id *)(a1 + 40) sqliteError];
      id v11 = [v12 stringWithFormat:@"Database error while fetching rows: %@", v13];

      uint64_t v14 = +[ML3MediaLibraryWriter writerErrorWithCode:300 description:v11];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      *a4 = 1;
    }
    else
    {
      uint64_t v10 = *(void **)(a1 + 32);
      id v11 = [v17 arrayRepresentation];
      [v10 addObject:v11];
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void *)(v8 + 24);
  }
  *(void *)(v8 + 24) = v9 + 1;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - *(void *)(a1 + 64) >= *(void *)(a1 + 72)) {
    *a4 = 1;
  }
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  self->_suspended = a3;
  -[NSOperationQueue setSuspended:](self->_databaseOperationQueue, "setSuspended:");
  [(NSOperationQueue *)self->_databaseOperationSerialQueue setSuspended:v3];
  databaseOperationLimitedQueue = self->_databaseOperationLimitedQueue;

  [(NSOperationQueue *)databaseOperationLimitedQueue setSuspended:v3];
}

- (void)setTransactionTimeout:(double)a3
{
  self->_double transactionTimeout = a3;
  if (a3 > 0.0) {
    [(ML3MediaLibraryWriter *)self _setupWatchdogTimer];
  }
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v3 stringWithFormat:@"MediaLibrary Daemon State at %@\n", v4];

  [v5 appendString:@"Active Transactions:\n"];
  if ([(NSMutableDictionary *)self->_transactionMap count])
  {
    transactionMap = self->_transactionMap;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __36__ML3MediaLibraryWriter_description__block_invoke;
    v20[3] = &unk_1E5FB62D0;
    id v21 = v5;
    [(NSMutableDictionary *)transactionMap enumerateKeysAndObjectsUsingBlock:v20];
  }
  else
  {
    [v5 appendString:@"(None)\n"];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v22 = *(_OWORD *)&self->_databaseOperationQueue;
  databaseOperationLimitedQueue = self->_databaseOperationLimitedQueue;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(NSOperationQueue **)(*((void *)&v16 + 1) + 8 * i);
        if (v12 == self->_databaseOperationQueue)
        {
          id v13 = @"Enqueued concurrent operations:\n";
        }
        else if (v12 == self->_databaseOperationLimitedQueue)
        {
          id v13 = @"Enqueued operations in limited size queue:\n";
        }
        else
        {
          id v13 = @"Enqueued serial operations:\n";
        }
        [v5 appendString:v13];
        if ([(NSOperationQueue *)v12 operationCount])
        {
          uint64_t v14 = [(NSOperationQueue *)v12 operations];
          [v5 appendFormat:@"%@\n", v14];
        }
        else
        {
          [v5 appendString:@"(None)\n"];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }

  return v5;
}

void __36__ML3MediaLibraryWriter_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [a3 description];
  [v3 appendFormat:@"%@\n", v4];
}

- (void)dealloc
{
  [(ML3MediaLibraryWriter *)self _tearDownWatchdogTimer];
  [(ML3MediaLibraryWriter *)self cancelAllActiveTransactions];
  v3.receiver = self;
  v3.super_class = (Class)ML3MediaLibraryWriter;
  [(ML3MediaLibraryWriter *)&v3 dealloc];
}

- (ML3MediaLibraryWriter)init
{
  v15.receiver = self;
  v15.super_class = (Class)ML3MediaLibraryWriter;
  id v2 = [(ML3MediaLibraryWriter *)&v15 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_double transactionTimeout = 0.0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ML3MediaLibraryWriter", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transactionMap = v3->_transactionMap;
    v3->_transactionMap = v6;

    uint64_t v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    databaseOperationQueue = v3->_databaseOperationQueue;
    v3->_databaseOperationQueue = v8;

    [(NSOperationQueue *)v3->_databaseOperationQueue setQualityOfService:25];
    uint64_t v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    databaseOperationSerialQueue = v3->_databaseOperationSerialQueue;
    v3->_databaseOperationSerialQueue = v10;

    [(NSOperationQueue *)v3->_databaseOperationSerialQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_databaseOperationSerialQueue setQualityOfService:25];
    id v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    databaseOperationLimitedQueue = v3->_databaseOperationLimitedQueue;
    v3->_databaseOperationLimitedQueue = v12;

    [(NSOperationQueue *)v3->_databaseOperationLimitedQueue setMaxConcurrentOperationCount:5];
    [(NSOperationQueue *)v3->_databaseOperationLimitedQueue setQualityOfService:25];
    if (v3->_transactionTimeout > 0.0) {
      [(ML3MediaLibraryWriter *)v3 _setupWatchdogTimer];
    }
  }
  return v3;
}

+ (id)writerErrorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)[a1 writerErrorWithCode:a3 description:a4 userInfo:0];
}

+ (id)writerErrorWithCode:(int64_t)a3 description:(id)a4 userInfo:(id)a5
{
  id v7 = a4;
  if (a5) {
    id v8 = a5;
  }
  else {
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }
  uint64_t v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MLWriterErrorDomain" code:a3 userInfo:v10];

  return v11;
}

@end