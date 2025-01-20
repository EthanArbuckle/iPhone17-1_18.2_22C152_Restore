@interface SBRemoteTransientOverlaySessionManager
- (BOOL)hasActiveSessionMatchingPredicate:(id)a3 options:(int64_t)a4;
- (BOOL)hasActiveSessionWithSceneIdentityTokenString:(id)a3 options:(int64_t)a4;
- (BOOL)hasSessionWithPendingButtonEvents:(unint64_t)a3 options:(int64_t)a4;
- (BOOL)hasSessionWithServiceProcessIdentifier:(int)a3 options:(int64_t)a4;
- (BOOL)remoteTransientOverlaySession:(id)a3 performDismissalRequest:(id)a4;
- (BOOL)remoteTransientOverlaySession:(id)a3 performPresentationRequest:(id)a4;
- (BOOL)remoteTransientOverlaySession:(id)a3 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:(id)a4;
- (BOOL)remoteTransientOverlaySession:(id)a3 shouldActivateWithContext:(id)a4;
- (SBRemoteTransientOverlaySessionManager)init;
- (SBRemoteTransientOverlaySessionManagerDelegate)delegate;
- (id)_createSessionWithDefinition:(id)a3;
- (id)_existingSessionsWithDefinition:(id)a3 options:(int64_t)a4;
- (id)createSessionWithDefinition:(id)a3;
- (id)embeddedDisplayWindowSceneForRemoteTransientOverlaySession:(id)a3;
- (id)existingSessionWithSessionID:(id)a3 options:(int64_t)a4;
- (id)existingSessionsWithDefinition:(id)a3 options:(int64_t)a4;
- (id)sessionWithDefinition:(id)a3 options:(int64_t)a4;
- (id)sessionsWithDefinition:(id)a3 options:(int64_t)a4;
- (int64_t)activeWallpaperVariantForRemoteTransientOverlaySession:(id)a3;
- (void)addObserver:(id)a3;
- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5;
- (void)remoteTransientOverlaySession:(id)a3 requestsHandlingForButtonEvents:(unint64_t)a4 viewController:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBRemoteTransientOverlaySessionManager

- (SBRemoteTransientOverlaySessionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlaySessionManager;
  v2 = [(SBRemoteTransientOverlaySessionManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SpringBoard.SBRemoteTransientOverlaySessionManager.accessSerialQueue", v3);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FA5FC8]) initWithIdentifier:@"com.apple.SpringBoard.SceneWorkspace.RemoteAlert" delegate:v2];
    sceneWorkspaceController = v2->_sceneWorkspaceController;
    v2->_sceneWorkspaceController = (SBFSceneWorkspaceController *)v6;
  }
  return v2;
}

- (id)embeddedDisplayWindowSceneForRemoteTransientOverlaySession:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = [WeakRetained remoteTransientOverlaySessionManager:self embeddedDisplayWindowSceneForRemoteTransientOverlaySession:v5];

  return v7;
}

- (int64_t)activeWallpaperVariantForRemoteTransientOverlaySession:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  int64_t v7 = [WeakRetained remoteTransientOverlaySessionManager:self activeWallpaperVariantForSession:v5];

  return v7;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 shouldActivateWithContext:(id)a4
{
  id v5 = self;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = [WeakRetained remoteTransientOverlaySessionManager:v5 shouldActivateOverlayWithContext:v7 forSession:v8];

  return (char)v5;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 performDismissalRequest:(id)a4
{
  id v5 = self;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = [WeakRetained remoteTransientOverlaySessionManager:v5 performDismissalRequest:v7 forSession:v8];

  return (char)v5;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 performPresentationRequest:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v9 = [WeakRetained remoteTransientOverlaySessionManager:self performPresentationRequest:v7 forSession:v6];

  if (v9)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v14++) remoteTransientOverlaySessionManager:self didActivateSession:v6];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

- (BOOL)remoteTransientOverlaySession:(id)a3 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:(id)a4
{
  id v5 = self;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = [WeakRetained remoteTransientOverlaySessionManager:v5 prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:v7 forSession:v8];

  return (char)v5;
}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  id v6 = [a3 sessionID];
  accessSerialQueue = self->_accessSerialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__SBRemoteTransientOverlaySessionManager_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke;
  v9[3] = &unk_1E6AF5290;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(accessSerialQueue, v9);
}

uint64_t __102__SBRemoteTransientOverlaySessionManager_remoteTransientOverlaySession_didInvalidateWithReason_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)remoteTransientOverlaySession:(id)a3 requestsHandlingForButtonEvents:(unint64_t)a4 viewController:(id)a5
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteTransientOverlaySessionManager:self requestsHandlingForButtonEvents:a4 forSession:v10 viewController:v9];
}

- (id)createSessionWithDefinition:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__19;
  long long v16 = __Block_byref_object_dispose__19;
  id v17 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SBRemoteTransientOverlaySessionManager_createSessionWithDefinition___block_invoke;
  block[3] = &unk_1E6AF6380;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessSerialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __70__SBRemoteTransientOverlaySessionManager_createSessionWithDefinition___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _createSessionWithDefinition:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)existingSessionsWithDefinition:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__19;
  long long v19 = __Block_byref_object_dispose__19;
  id v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__SBRemoteTransientOverlaySessionManager_existingSessionsWithDefinition_options___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = &v15;
  int64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(accessSerialQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __81__SBRemoteTransientOverlaySessionManager_existingSessionsWithDefinition_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingSessionsWithDefinition:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)existingSessionWithSessionID:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19;
  long long v18 = __Block_byref_object_dispose__19;
  id v19 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SBRemoteTransientOverlaySessionManager_existingSessionWithSessionID_options___block_invoke;
  block[3] = &unk_1E6AF6380;
  uint64_t v13 = &v14;
  block[4] = self;
  id v8 = v6;
  id v12 = v8;
  dispatch_sync(accessSerialQueue, block);
  if (_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions((void *)v15[5], v4)) {
    id v9 = (id)v15[5];
  }
  else {
    id v9 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __79__SBRemoteTransientOverlaySessionManager_existingSessionWithSessionID_options___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasSessionWithPendingButtonEvents:(unint64_t)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__19;
  v23 = __Block_byref_object_dispose__19;
  id v24 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SBRemoteTransientOverlaySessionManager_hasSessionWithPendingButtonEvents_options___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  void block[5] = &v19;
  dispatch_sync(accessSerialQueue, block);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)v20[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v11, v4) & 1) != 0
          && (objc_msgSend(v11, "hasPendingButtonEvents:", a3, (void)v14) & 1) != 0)
        {
          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __84__SBRemoteTransientOverlaySessionManager_hasSessionWithPendingButtonEvents_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasSessionWithServiceProcessIdentifier:(int)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__19;
  v23 = __Block_byref_object_dispose__19;
  id v24 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SBRemoteTransientOverlaySessionManager_hasSessionWithServiceProcessIdentifier_options___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  void block[5] = &v19;
  dispatch_sync(accessSerialQueue, block);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)v20[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v11, v4) & 1) != 0
          && (objc_msgSend(v11, "hasServiceProcessIdentifier:", v5, (void)v14) & 1) != 0)
        {
          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __89__SBRemoteTransientOverlaySessionManager_hasSessionWithServiceProcessIdentifier_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasActiveSessionWithSceneIdentityTokenString:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__19;
  id v24 = __Block_byref_object_dispose__19;
  id v25 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__SBRemoteTransientOverlaySessionManager_hasActiveSessionWithSceneIdentityTokenString_options___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  void block[5] = &v20;
  dispatch_sync(accessSerialQueue, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)v21[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        BOOL v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v12, v4) & 1) != 0
          && objc_msgSend(v12, "isActivated", (void)v15)
          && ([v12 isPresentedFromSceneWithIdentityTokenString:v6] & 1) != 0)
        {
          BOOL v13 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_13:

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __95__SBRemoteTransientOverlaySessionManager_hasActiveSessionWithSceneIdentityTokenString_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasActiveSessionMatchingPredicate:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (**)(id, void *))a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__19;
  id v24 = __Block_byref_object_dispose__19;
  id v25 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SBRemoteTransientOverlaySessionManager_hasActiveSessionMatchingPredicate_options___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  void block[5] = &v20;
  dispatch_sync(accessSerialQueue, block);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)v21[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        BOOL v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((_SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v12, v4) & 1) != 0
          && objc_msgSend(v12, "isActivated", (void)v15)
          && (v6[2](v6, v12) & 1) != 0)
        {
          BOOL v13 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_13:

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __84__SBRemoteTransientOverlaySessionManager_hasActiveSessionMatchingPredicate_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)sessionWithDefinition:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__19;
  uint64_t v19 = __Block_byref_object_dispose__19;
  id v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SBRemoteTransientOverlaySessionManager_sessionWithDefinition_options___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = &v15;
  int64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(accessSerialQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __72__SBRemoteTransientOverlaySessionManager_sessionWithDefinition_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingSessionsWithDefinition:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _createSessionWithDefinition:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)sessionsWithDefinition:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__19;
  uint64_t v19 = __Block_byref_object_dispose__19;
  id v20 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__SBRemoteTransientOverlaySessionManager_sessionsWithDefinition_options___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = &v15;
  int64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(accessSerialQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __73__SBRemoteTransientOverlaySessionManager_sessionsWithDefinition_options___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _existingSessionsWithDefinition:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _createSessionWithDefinition:*(void *)(a1 + 40)];
    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_observers removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      id v4 = v7;
    }
  }
}

- (id)_createSessionWithDefinition:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  NSUInteger v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];

  id v7 = [[SBRemoteTransientOverlaySession alloc] _initWithSessionID:v6 definition:v4 sceneWorkspaceController:self->_sceneWorkspaceController];
  [v7 setHostDelegate:self];
  sessionIDToSession = self->_sessionIDToSession;
  if (!sessionIDToSession)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = self->_sessionIDToSession;
    self->_sessionIDToSession = v9;

    sessionIDToSession = self->_sessionIDToSession;
  }
  [(NSMutableDictionary *)sessionIDToSession setObject:v7 forKey:v6];
  uint64_t v11 = SBLogTransientOverlay();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Created %{public}@ for definition: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  return v7;
}

- (id)_existingSessionsWithDefinition:(id)a3 options:(int64_t)a4
{
  char v37 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(NSMutableDictionary *)self->_sessionIDToSession objectEnumerator];
  uint64_t v6 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v6)
  {
    id v38 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  id v38 = 0;
  uint64_t v8 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v41 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      id v11 = [v10 definition];
      id v12 = v5;
      int v13 = [v11 sceneProvidingProcess];

      id v14 = [v12 sceneProvidingProcess];
      BOOL v15 = v14 == 0;

      if ((v13 != 0) == v15)
      {
LABEL_20:

LABEL_21:
        continue;
      }
      if (v13)
      {
        id v16 = [v11 sceneProvidingProcess];
        uint64_t v17 = [v12 sceneProvidingProcess];
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_20;
        }
        uint64_t v19 = [v11 configurationIdentifier];
        id v20 = [v12 configurationIdentifier];
        int v21 = BSEqualStrings();

        if (!v21) {
          goto LABEL_20;
        }
        uint64_t v22 = [v11 secondaryConfigurationIdentifier];
        uint64_t v23 = [v12 secondaryConfigurationIdentifier];
      }
      else
      {
        id v24 = [v11 serviceName];
        id v25 = [v12 serviceName];
        int v26 = [v24 isEqualToString:v25];

        if (!v26) {
          goto LABEL_20;
        }
        uint64_t v27 = [v11 viewControllerClassName];
        v28 = [v12 viewControllerClassName];
        int v29 = [v27 isEqualToString:v28];

        if (!v29) {
          goto LABEL_20;
        }
        uint64_t v22 = [v11 secondaryViewControllerClassName];
        uint64_t v23 = [v12 secondaryViewControllerClassName];
      }
      v30 = (void *)v23;
      char v31 = BSEqualStrings();

      if ((v31 & 1) == 0) {
        goto LABEL_20;
      }
      int v32 = [v11 isForCarPlay];
      int v33 = [v12 isForCarPlay];

      if (v32 != v33) {
        goto LABEL_21;
      }
      int IsValidSessionForLookupOptions = _SBRemoteTransientOverlaySessionManagerIsValidSessionForLookupOptions(v10, v37);

      if (IsValidSessionForLookupOptions)
      {
        v35 = v38;
        if (!v38) {
          v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        }
        id v38 = v35;
        [v35 addObject:v10];
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v7);
LABEL_26:

  return v38;
}

- (SBRemoteTransientOverlaySessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRemoteTransientOverlaySessionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sceneWorkspaceController, 0);
  objc_storeStrong((id *)&self->_sessionIDToSession, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

@end