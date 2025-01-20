@interface MTCompanionSyncSession
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (MTCompanionSyncRequest)request;
- (MTCompanionSyncSession)initWithSession:(id)a3 delegate:(id)a4;
- (MTCompanionSyncSession)initWithSession:(id)a3 request:(id)a4 delegate:(id)a5;
- (MTSyncServiceDelegate)delegate;
- (NSArray)pendingChanges;
- (NSMutableArray)processedChanges;
- (NSString)description;
- (SYSession)session;
- (id)sessionDescription;
- (unint64_t)lastIndex;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)setDelegate:(id)a3;
- (void)setLastIndex:(unint64_t)a3;
- (void)setPendingChanges:(id)a3;
- (void)setProcessedChanges:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSession:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation MTCompanionSyncSession

- (MTCompanionSyncSession)initWithSession:(id)a3 delegate:(id)a4
{
  return [(MTCompanionSyncSession *)self initWithSession:a3 request:0 delegate:a4];
}

- (MTCompanionSyncSession)initWithSession:(id)a3 request:(id)a4 delegate:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (NSArray *)a5;
  v24.receiver = self;
  v24.super_class = (Class)MTCompanionSyncSession;
  v12 = [(MTCompanionSyncSession *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    v14 = objc_opt_new();
    [(SYSession *)v13->_session setSerializer:v14];

    [(SYSession *)v13->_session setDelegate:v13];
    objc_storeStrong((id *)&v13->_request, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_lastIndex = 0;
    uint64_t v15 = objc_opt_new();
    processedChanges = v13->_processedChanges;
    v13->_processedChanges = (NSMutableArray *)v15;

    v17 = MTLogForCategory(6);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      __int16 v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with delegate %{public}@", buf, 0x16u);
    }

    if ([v9 isSending])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
      uint64_t v19 = [WeakRetained pendingChanges];
      pendingChanges = v13->_pendingChanges;
      v13->_pendingChanges = (NSArray *)v19;

      v21 = MTLogForCategory(6);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v13->_pendingChanges;
        *(_DWORD *)buf = 138543618;
        v26 = v13;
        __int16 v27 = 2114;
        v28 = v22;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ will enqueue changes %{public}@", buf, 0x16u);
      }
    }
  }

  return v13;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t (**)(id, void *))a4;
  v7 = MTLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ready to enqueue changes", buf, 0xCu);
  }

  unint64_t lastIndex = self->_lastIndex;
  if (lastIndex < [(NSArray *)self->_pendingChanges count])
  {
    *(void *)&long long v9 = 138543618;
    long long v20 = v9;
    while (1)
    {
      id v10 = -[NSArray objectAtIndexedSubscript:](self->_pendingChanges, "objectAtIndexedSubscript:", lastIndex, v20);
      int v11 = v6[2](v6, v10);
      v12 = MTLogForCategory(6);
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (!v11) {
        break;
      }
      if (v13)
      {
        *(_DWORD *)buf = v20;
        v22 = self;
        __int16 v23 = 2114;
        NSUInteger v24 = (NSUInteger)v10;
        _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueued %{public}@", buf, 0x16u);
      }

      [(NSMutableArray *)self->_processedChanges addObject:v10];
      ++lastIndex;

      if (lastIndex >= [(NSArray *)self->_pendingChanges count]) {
        goto LABEL_13;
      }
    }
    if (v13)
    {
      *(_DWORD *)buf = v20;
      v22 = self;
      __int16 v23 = 2114;
      NSUInteger v24 = (NSUInteger)v10;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ stopped enqueing at %{public}@", buf, 0x16u);
    }
  }
LABEL_13:
  self->_unint64_t lastIndex = lastIndex;
  NSUInteger v14 = [(NSArray *)self->_pendingChanges count];
  uint64_t v15 = MTLogForCategory(6);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (lastIndex >= v14)
  {
    if (v16)
    {
      NSUInteger v18 = [(NSArray *)self->_pendingChanges count];
      *(_DWORD *)buf = 138543618;
      v22 = self;
      __int16 v23 = 2048;
      NSUInteger v24 = v18;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueued all %lu changes", buf, 0x16u);
    }
    unsigned int v17 = 2;
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ continuing session...", buf, 0xCu);
    }
    unsigned int v17 = 1;
  }

  return v17;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v20 = (void (**)(id, uint64_t, void))a5;
  v8 = MTLogForCategory(6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = [v7 count];
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has %lu changes to apply", buf, 0x16u);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        NSUInteger v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v14 conformsToProtocol:&unk_1EEE21590])
        {
          uint64_t v15 = v14;
          BOOL v16 = MTLogForCategory(6);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            __int16 v27 = self;
            __int16 v28 = 2114;
            uint64_t v29 = (uint64_t)v15;
            _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ applying %{public}@", buf, 0x16u);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained applyChange:v15];

          [(NSMutableArray *)self->_processedChanges addObject:v15];
        }
        else
        {
          uint64_t v15 = MTLogForCategory(6);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            __int16 v27 = self;
            __int16 v28 = 2114;
            uint64_t v29 = (uint64_t)v14;
            _os_log_error_impl(&dword_19CC95000, v15, OS_LOG_TYPE_ERROR, "%{public}@ skipping invalid change %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  NSUInteger v18 = MTLogForCategory(6);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [(NSMutableArray *)self->_processedChanges count];
    *(_DWORD *)buf = 138543618;
    __int16 v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = v19;
    _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ finished applying %lu changes", buf, 0x16u);
  }

  v20[2](v20, 1, 0);
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = MTLogForCategory(6);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ session %{public}@ wants to reset data store", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained resetDataStore];

  return 1;
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = a3;
  v8 = MTLogForCategory(6);
  int v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MTCompanionSyncSession syncSession:didEndWithError:]((uint64_t)self, (uint64_t)v6, v9);
    }

    [WeakRetained isSending];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = self;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ completed succesfully", (uint8_t *)&v11, 0xCu);
  }

  int v10 = [WeakRetained isSending];
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pendingChangesSent:self->_processedChanges];
LABEL_9:
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MTCompanionSyncSession *)self sessionDescription];
  id v6 = [v3 stringWithFormat:@"<%@: %p %@ >", v4, self, v5];

  return (NSString *)v6;
}

- (id)sessionDescription
{
  v2 = [(MTCompanionSyncSession *)self session];
  int v3 = [v2 isSending];

  if (v3) {
    return @"SEND";
  }
  else {
    return @"RECV";
  }
}

- (NSMutableArray)processedChanges
{
  return self->_processedChanges;
}

- (void)setProcessedChanges:(id)a3
{
}

- (MTCompanionSyncRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (SYSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSArray)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(id)a3
{
}

- (unint64_t)lastIndex
{
  return self->_lastIndex;
}

- (void)setLastIndex:(unint64_t)a3
{
  self->_unint64_t lastIndex = a3;
}

- (MTSyncServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTSyncServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_processedChanges, 0);
}

- (void)syncSession:(os_log_t)log didEndWithError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed with error %{public}@", (uint8_t *)&v3, 0x16u);
}

@end