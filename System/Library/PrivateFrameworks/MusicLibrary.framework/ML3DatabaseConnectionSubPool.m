@interface ML3DatabaseConnectionSubPool
@end

@implementation ML3DatabaseConnectionSubPool

uint64_t __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) connection];
  v4 = v3;
  if (v2)
  {
    [v3 flush];

    [*(id *)(*(void *)(a1 + 40) + 40) addObject:*(void *)(a1 + 32)];
  }
  else
  {
    [v3 close];

    v5 = [*(id *)(a1 + 32) connection];
    v6 = [v5 connectionDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_3;
      block[3] = &unk_1E5FB8298;
      id v11 = *(id *)(a1 + 32);
      dispatch_async(v8, block);
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 48) removeObject:*(void *)(a1 + 32)];
}

void __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) anyObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeObject:");
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 65);

      if (v5) {
        return;
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v6 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;
    }
    else
    {
      v6 = v8;
    }
  }
}

void __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_2;
  block[3] = &unk_1E5FB8018;
  char v8 = *(unsigned char *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_sync(v2, block);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32));
}

void __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke(void *a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 32), 0xFFFFFFFFFFFFFFFFLL);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v2 = *((_OWORD *)a1 + 2);
  id v3 = *(NSObject **)(a1[4] + 24);
  block[2] = __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_2;
  block[3] = &unk_1E5FB8360;
  long long v14 = v2;
  dispatch_sync(v3, block);
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    if (*(unsigned char *)(a1[4] + 65)) {
      uint64_t v4 = off_1E5FAEBE0;
    }
    else {
      uint64_t v4 = off_1E5FAEBD0;
    }
    int v5 = (void *)[objc_alloc(*v4) initWithDatabasePath:*(void *)(a1[4] + 72)];
    [v5 setReadOnly:*(unsigned __int8 *)(a1[4] + 64)];
    [v5 setJournalingMode:*(void *)(a1[4] + 88)];
    id v6 = [[_ML3DatabaseConnectionWrapper alloc] initWithConnection:v5];
    uint64_t v7 = *(void *)(a1[5] + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    long long v9 = *((_OWORD *)a1 + 2);
    v10 = *(NSObject **)(a1[4] + 24);
    v11[2] = __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_3;
    v11[3] = &unk_1E5FB8360;
    long long v12 = v9;
    dispatch_sync(v10, v11);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __50___ML3DatabaseConnectionSubPool_isBusyConnection___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 48) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void __50___ML3DatabaseConnectionSubPool_handleDiagnostic___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 64);
  uint64_t v4 = [*(id *)(v2 + 40) allObjects];
  int v5 = *(void **)(a1 + 40);
  if (v3)
  {
    [v5 setReaderAvailableConnections:v4];

    id v6 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
    objc_msgSend(*(id *)(a1 + 40), "setReaderBusyConnections:");
  }
  else
  {
    [v5 setWriterAvailableConnections:v4];

    id v6 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
    objc_msgSend(*(id *)(a1 + 40), "setWriterBusyConnections:");
  }
}

uint64_t __75___ML3DatabaseConnectionSubPool_closeConnectionsAndWaitForBusyConnections___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v18;
    *(void *)&long long v3 = 138543618;
    long long v15 = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        char v8 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          v10 = [v7 debugDescription];
          *(_DWORD *)buf = v15;
          uint64_t v22 = v9;
          __int16 v23 = 2114;
          v24 = v10;
          _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ closing available connection=%{public}@", buf, 0x16u);
        }
        id v11 = [v7 connection];
        [v11 close];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v4);
  }

  if (!*(unsigned char *)(a1 + 56))
  {
    long long v12 = *(void **)(a1 + 40);
    v13 = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
    [v12 addObjectsFromArray:v13];
  }
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "count", v15);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

void __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  [v2 close];

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_2;
  block[3] = &unk_1E5FB83D0;
  void block[4] = v3;
  id v12 = *(id *)(a1 + 32);
  dispatch_sync(v4, block);
  uint64_t v5 = [*(id *)(a1 + 32) connection];
  uint64_t v6 = [v5 connectionDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_3;
    v9[3] = &unk_1E5FB8298;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 32));
}

uint64_t __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

void __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) connection];
  uint64_t v2 = [v4 connectionDelegate];
  uint64_t v3 = [*(id *)(a1 + 32) connection];
  [v2 connectionDidClose:v3];
}

void __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) connection];
  uint64_t v2 = [v4 connectionDelegate];
  uint64_t v3 = [*(id *)(a1 + 32) connection];
  [v2 connectionDidClose:v3];
}

uint64_t __51___ML3DatabaseConnectionSubPool_hasBusyConnections__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

intptr_t __40___ML3DatabaseConnectionSubPool_dealloc__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543362;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "Database connection subpool %{public}@ received database deletion notification.", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained _handleDatabaseDeletion];
  }
}

void __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke_205(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v3 = MSVHomeSharingCacheDirectory();
    if ([*(id *)(a1 + 32) containsString:v3])
    {
      id v4 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138543362;
        id v6 = WeakRetained;
        _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "Database connection subpool %{public}@ received HomeSharing caches cleared notification.", (uint8_t *)&v5, 0xCu);
      }

      [WeakRetained _handleDatabaseDeletion];
    }
  }
}

@end