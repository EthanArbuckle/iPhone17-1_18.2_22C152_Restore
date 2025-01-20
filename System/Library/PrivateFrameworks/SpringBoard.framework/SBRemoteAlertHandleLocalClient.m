@interface SBRemoteAlertHandleLocalClient
- (SBRemoteAlertHandleLocalClient)initWithSessionManager:(id)a3;
- (id)createRemoteAlertHandleWithDefinition:(id)a3 configurationContext:(id)a4;
- (id)remoteAlertHandlesForDefinition:(id)a3 allowsCreation:(BOOL)a4 configurationContext:(id)a5;
- (void)_registerHandle:(id)a3 forSession:(id)a4;
- (void)_unregisterHandle:(id)a3;
- (void)activateRemoteAlertHandle:(id)a3 withContext:(id)a4;
- (void)invalidateRemoteAlertHandle:(id)a3;
- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5;
- (void)remoteTransientOverlaySessionDidActivate:(id)a3;
- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3;
@end

@implementation SBRemoteAlertHandleLocalClient

- (SBRemoteAlertHandleLocalClient)initWithSessionManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBRemoteAlertHandleLocalClient;
  v6 = [(SBRemoteAlertHandleLocalClient *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SpringBoard.SBRemoteAlertHandleLocalClient.accessSerialQueue", v7);
    accessSerialQueue = v6->_accessSerialQueue;
    v6->_accessSerialQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_sessionManager, a3);
  }

  return v6;
}

- (id)remoteAlertHandlesForDefinition:(id)a3 allowsCreation:(BOOL)a4 configurationContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__78;
  v26 = __Block_byref_object_dispose__78;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__78;
  v20[4] = __Block_byref_object_dispose__78;
  id v21 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__SBRemoteAlertHandleLocalClient_remoteAlertHandlesForDefinition_allowsCreation_configurationContext___block_invoke;
  block[3] = &unk_1E6B069C8;
  BOOL v19 = a4;
  v17 = v20;
  block[4] = self;
  id v11 = v8;
  id v16 = v11;
  v18 = &v22;
  dispatch_sync(accessSerialQueue, block);
  id v14 = v9;
  BSDispatchMain();
  id v12 = (id)v23[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __102__SBRemoteAlertHandleLocalClient_remoteAlertHandlesForDefinition_allowsCreation_configurationContext___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2) {
    [v4 sessionsWithDefinition:v3 options:0];
  }
  else {
  id v5 = [v4 existingSessionsWithDefinition:v3 options:0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "sessionID", (void)v18);
        v13 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v12];
        if (!v13)
        {
          v13 = (void *)[objc_alloc(MEMORY[0x1E4FA6BC8]) _initWithHandleID:v12 handleClient:*(void *)(a1 + 32)];
          [*(id *)(a1 + 32) _registerHandle:v13 forSession:v11];
        }
        id v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        if (!v14)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
          v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;

          id v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        }
        [v14 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

void __102__SBRemoteAlertHandleLocalClient_remoteAlertHandlesForDefinition_allowsCreation_configurationContext___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isPrepared", (void)v8) & 1) == 0) {
          [v7 prepareWithConfigurationContext:*(void *)(a1 + 32)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)createRemoteAlertHandleWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__78;
  uint64_t v23 = __Block_byref_object_dispose__78;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__78;
  v17[4] = __Block_byref_object_dispose__78;
  id v18 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SBRemoteAlertHandleLocalClient_createRemoteAlertHandleWithDefinition_configurationContext___block_invoke;
  block[3] = &unk_1E6B069F0;
  id v15 = v17;
  block[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v16 = &v19;
  dispatch_sync(accessSerialQueue, block);
  id v12 = v7;
  BSDispatchMain();
  id v10 = (id)v20[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __93__SBRemoteAlertHandleLocalClient_createRemoteAlertHandleWithDefinition_configurationContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) createSessionWithDefinition:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) sessionID];
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4FA6BC8]) _initWithHandleID:v8 handleClient:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) _registerHandle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forSession:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

uint64_t __93__SBRemoteAlertHandleLocalClient_createRemoteAlertHandleWithDefinition_configurationContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prepareWithConfigurationContext:*(void *)(a1 + 32)];
}

- (void)activateRemoteAlertHandle:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = [a3 handleID];
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SBRemoteAlertHandleLocalClient_activateRemoteAlertHandle_withContext___block_invoke;
  block[3] = &unk_1E6AF4E00;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(accessSerialQueue, block);
}

void __72__SBRemoteAlertHandleLocalClient_activateRemoteAlertHandle_withContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) existingSessionWithSessionID:*(void *)(a1 + 40) options:0];
  id v4 = *(id *)(a1 + 48);
  id v3 = v2;
  BSDispatchMain();
}

uint64_t __72__SBRemoteAlertHandleLocalClient_activateRemoteAlertHandle_withContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateWithContext:*(void *)(a1 + 40)];
}

- (void)invalidateRemoteAlertHandle:(id)a3
{
  id v4 = [a3 handleID];
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SBRemoteAlertHandleLocalClient_invalidateRemoteAlertHandle___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessSerialQueue, v7);
}

void __62__SBRemoteAlertHandleLocalClient_invalidateRemoteAlertHandle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) existingSessionWithSessionID:*(void *)(a1 + 40) options:0];
  id v1 = v2;
  BSDispatchMain();
}

uint64_t __62__SBRemoteAlertHandleLocalClient_invalidateRemoteAlertHandle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)remoteTransientOverlaySessionDidActivate:(id)a3
{
  id v4 = [a3 sessionID];
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidActivate___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessSerialQueue, v7);
}

void __75__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidActivate___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  [v1 _didActivate];
}

- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3
{
  id v4 = [a3 sessionID];
  accessSerialQueue = self->_accessSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidDeactivate___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessSerialQueue, v7);
}

void __77__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySessionDidDeactivate___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  [v1 _didDeactivate];
}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = [a3 sessionID];
  accessSerialQueue = self->_accessSerialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke;
  v13[3] = &unk_1E6AF6F98;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(accessSerialQueue, v13);
}

void __94__SBRemoteAlertHandleLocalClient_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)SBSRemoteAlertHandleInvalidationErrorCodeForInvalidationReason();
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    id v4 = SBSRemoteAlertHandleInvalidationErrorDescription();
    [v3 setObject:v4 forKey:*MEMORY[0x1E4F28568]];

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      [v3 setObject:v5 forKey:*MEMORY[0x1E4F28A50]];
    }
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA7170] code:v2 userInfo:v3];
  }
  [v6 _receivedInvalidationWithError:v2];
  [*(id *)(a1 + 32) _unregisterHandle:v6];
}

- (void)_registerHandle:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  id v8 = [v7 sessionID];
  id v9 = [(NSMutableDictionary *)self->_sessionIDToRemoteAlertHandle objectForKey:v8];

  if (!v9)
  {
    sessionIDToRemoteAlertHandle = self->_sessionIDToRemoteAlertHandle;
    if (!sessionIDToRemoteAlertHandle)
    {
      id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v12 = self->_sessionIDToRemoteAlertHandle;
      self->_sessionIDToRemoteAlertHandle = v11;

      sessionIDToRemoteAlertHandle = self->_sessionIDToRemoteAlertHandle;
    }
    [(NSMutableDictionary *)sessionIDToRemoteAlertHandle setObject:v6 forKey:v8];
    id v13 = v7;
    BSDispatchMain();
  }
}

uint64_t __61__SBRemoteAlertHandleLocalClient__registerHandle_forSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSessionObserver:*(void *)(a1 + 40)];
}

- (void)_unregisterHandle:(id)a3
{
  accessSerialQueue = self->_accessSerialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(accessSerialQueue);
  id v6 = [v5 handleID];

  id v7 = [(SBRemoteTransientOverlaySessionManager *)self->_sessionManager existingSessionWithSessionID:v6 options:0];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v8 = v7;
  id v11 = v8;
  BSDispatchMain();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_sessionIDToRemoteAlertHandle, "removeObjectForKey:", v6, v10, 3221225472, __52__SBRemoteAlertHandleLocalClient__unregisterHandle___block_invoke, &unk_1E6AF5290, v8, self);
    if (![(NSMutableDictionary *)self->_sessionIDToRemoteAlertHandle count])
    {
      sessionIDToRemoteAlertHandle = self->_sessionIDToRemoteAlertHandle;
      self->_sessionIDToRemoteAlertHandle = 0;
    }
  }
}

uint64_t __52__SBRemoteAlertHandleLocalClient__unregisterHandle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSessionObserver:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDToRemoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end