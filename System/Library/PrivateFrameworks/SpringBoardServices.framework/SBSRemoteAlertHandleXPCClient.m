@interface SBSRemoteAlertHandleXPCClient
- (SBSRemoteAlertHandleXPCClient)init;
- (id)_connection;
- (id)createRemoteAlertHandleWithDefinition:(id)a3 configurationContext:(id)a4;
- (id)remoteAlertHandlesForDefinition:(id)a3 allowsCreation:(BOOL)a4 configurationContext:(id)a5;
- (void)_handleError:(id)a3;
- (void)_invalidateHandleForHandleID:(id)a3 withError:(id)a4;
- (void)activateRemoteAlertHandle:(id)a3 withContext:(id)a4;
- (void)invalidateRemoteAlertHandle:(id)a3;
- (void)remoteAlertHandleWithID:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleWithIDDidActivate:(id)a3;
- (void)remoteAlertHandleWithIDDidDeactivate:(id)a3;
@end

@implementation SBSRemoteAlertHandleXPCClient

- (SBSRemoteAlertHandleXPCClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBSRemoteAlertHandleXPCClient;
  v2 = [(SBSRemoteAlertHandleXPCClient *)&v8 init];
  if (v2)
  {
    uint64_t v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = BSDispatchQueueCreateWithQualityOfService();
    connectionAccessQueue = v2->_connectionAccessQueue;
    v2->_connectionAccessQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)remoteAlertHandleWithIDDidActivate:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_handleIDToHandle, "objectForKey:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 _didActivate];
  }
}

- (void)remoteAlertHandleWithIDDidDeactivate:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_handleIDToHandle, "objectForKey:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 _didDeactivate];
  }
}

- (void)remoteAlertHandleWithID:(id)a3 didInvalidateWithError:(id)a4
{
  if (a3) {
    [(SBSRemoteAlertHandleXPCClient *)self _invalidateHandleForHandleID:a3 withError:a4];
  }
}

- (id)remoteAlertHandlesForDefinition:(id)a3 allowsCreation:(BOOL)a4 configurationContext:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [(SBSRemoteAlertHandleXPCClient *)self _connection];
  v11 = [v10 remoteTarget];
  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  v28 = v8;
  v13 = [v11 remoteAlertHandleContextsForDefinition:v8 allowsCreationValue:v12 configurationContext:v9];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v15)
  {
    v17 = 0;
    goto LABEL_21;
  }
  uint64_t v16 = v15;
  v17 = 0;
  uint64_t v18 = *(void *)v30;
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v30 != v18) {
        objc_enumerationMutation(v14);
      }
      v20 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
      v21 = [v20 handleID];
      if ([v21 length])
      {
        id v22 = [(NSMutableDictionary *)self->_handleIDToHandle objectForKey:v21];
        if (v22)
        {
          if (v17)
          {
LABEL_9:
            [v17 addObject:v22];

            goto LABEL_10;
          }
        }
        else
        {
          id v22 = [[SBSRemoteAlertHandle alloc] _initWithHandleID:v21 handleClient:self];
          if ([v20 isActive]) {
            [v22 _didActivate];
          }
          handleIDToHandle = self->_handleIDToHandle;
          if (!handleIDToHandle)
          {
            v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v25 = self->_handleIDToHandle;
            self->_handleIDToHandle = v24;

            handleIDToHandle = self->_handleIDToHandle;
          }
          [(NSMutableDictionary *)handleIDToHandle setObject:v22 forKey:v21];
          if (v17) {
            goto LABEL_9;
          }
        }
        v17 = [NSMutableArray initWithCapacity:[v14 count]];
        goto LABEL_9;
      }
LABEL_10:

      ++v19;
    }
    while (v16 != v19);
    uint64_t v26 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v16 = v26;
  }
  while (v26);
LABEL_21:

  return v17;
}

- (id)createRemoteAlertHandleWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSRemoteAlertHandleXPCClient *)self _connection];
  id v9 = [v8 remoteTarget];
  v10 = [v9 createRemoteAlertHandleContextWithDefinition:v7 configurationContext:v6];

  v11 = [v10 handleID];
  if ([v11 length])
  {
    id v12 = [(NSMutableDictionary *)self->_handleIDToHandle objectForKey:v11];
    if (!v12)
    {
      id v12 = [[SBSRemoteAlertHandle alloc] _initWithHandleID:v11 handleClient:self];
      if ([v10 isActive]) {
        [v12 _didActivate];
      }
      handleIDToHandle = self->_handleIDToHandle;
      if (!handleIDToHandle)
      {
        id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v15 = self->_handleIDToHandle;
        self->_handleIDToHandle = v14;

        handleIDToHandle = self->_handleIDToHandle;
      }
      [(NSMutableDictionary *)handleIDToHandle setObject:v12 forKey:v11];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)activateRemoteAlertHandle:(id)a3 withContext:(id)a4
{
  id v9 = a4;
  id v6 = [a3 handleID];
  if (v6)
  {
    id v7 = [(SBSRemoteAlertHandleXPCClient *)self _connection];
    id v8 = [v7 remoteTarget];
    [v8 activateRemoteAlertHandleWithID:v6 activationContext:v9];
  }
}

- (void)invalidateRemoteAlertHandle:(id)a3
{
  id v6 = [a3 handleID];
  if (v6)
  {
    v4 = [(SBSRemoteAlertHandleXPCClient *)self _connection];
    uint64_t v5 = [v4 remoteTarget];
    [v5 invalidateRemoteAlertHandleWithID:v6];
  }
}

- (id)_connection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  connectionAccessQueue = self->_connectionAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke;
  v5[3] = &unk_1E566D960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    if (!*(void *)(v1 + 24))
    {
      id v3 = (void *)MEMORY[0x1E4F50BB8];
      v4 = (void *)MEMORY[0x1E4F4F858];
      uint64_t v5 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
      uint64_t v6 = [v4 resolveServiceName:v5];
      id v7 = +[SBSRemoteAlertHandleServiceSpecification identifier];
      uint64_t v8 = [v3 endpointForMachName:v6 service:v7 instance:0];

      uint64_t v9 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v8];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 24);
      *(void *)(v10 + 24) = v9;

      uint64_t v12 = *(void *)(a1 + 32);
      v13 = *(void **)(v12 + 24);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_2;
      v14[3] = &unk_1E566B118;
      v14[4] = v12;
      [v13 configureConnection:v14];

      uint64_t v1 = *(void *)(a1 + 32);
    }
    if (!*(unsigned char *)(v1 + 32))
    {
      *(unsigned char *)(v1 + 32) = 1;
      [*(id *)(*(void *)(a1 + 32) + 24) activate];
      uint64_t v1 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v1 + 24));
  }
}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBSRemoteAlertHandleServiceSpecification interface];
  [v3 setInterface:v4];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  uint64_t v5 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v5];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_3;
  v8[3] = &unk_1E566B0F0;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_5;
  v6[3] = &unk_1E566B0F0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_4;
    block[3] = &unk_1E566BCE8;
    v4 = WeakRetained;
    id v6 = v4;
    dispatch_barrier_async(v3, block);
    [v4 _handleError:0];
  }
}

uint64_t __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  return result;
}

void __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_5(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_6;
    block[3] = &unk_1E566BCE8;
    v4 = WeakRetained;
    id v6 = v4;
    dispatch_barrier_async(v3, block);
    [v4 _handleError:0];
  }
}

uint64_t __44__SBSRemoteAlertHandleXPCClient__connection__block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 33) = 1;
  return result;
}

- (void)_handleError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v6 = SBSRemoteAlertHandleInvalidationErrorDescription(2uLL);
  [v5 setObject:v6 forKey:*MEMORY[0x1E4F28568]];

  if (v4) {
    [v5 setObject:v4 forKey:*MEMORY[0x1E4F28A50]];
  }
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBSRemoteAlertHandleInvalidationErrorDomain" code:2 userInfo:v5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_handleIDToHandle copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBSRemoteAlertHandleXPCClient *)self _invalidateHandleForHandleID:*(void *)(*((void *)&v13 + 1) + 8 * v12++) withError:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_invalidateHandleForHandleID:(id)a3 withError:(id)a4
{
  calloutQueue = self->_calloutQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(calloutQueue);
  id v10 = [(NSMutableDictionary *)self->_handleIDToHandle objectForKey:v8];
  [v10 _receivedInvalidationWithError:v7];

  [(NSMutableDictionary *)self->_handleIDToHandle removeObjectForKey:v8];
  if (![(NSMutableDictionary *)self->_handleIDToHandle count])
  {
    handleIDToHandle = self->_handleIDToHandle;
    self->_handleIDToHandle = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleIDToHandle, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionAccessQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end