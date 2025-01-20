@interface NPKApplicationStateListener
- (NPKApplicationStateListener)init;
- (unint64_t)_applicationStateWithLSApplicationState:(id)a3;
- (unint64_t)cachedAppState;
- (void)_handleApplicationChangeNotificationWithWorkspaceApplicationProxies:(id)a3 newStateResolver:(id)a4;
- (void)_retrieveAppState:(id)a3;
- (void)_updateStateWithNewState:(unint64_t)a3 completion:(id)a4;
- (void)appState:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)prewarm;
- (void)registerObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NPKApplicationStateListener

- (NPKApplicationStateListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)NPKApplicationStateListener;
  v2 = [(NPKApplicationStateListener *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_appStateLock._os_unfair_lock_opaque = 0;
    v2->_appState = 0;
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanoPassKit.applicationStateListener", v4);
    internalClassQueue = v3->_internalClassQueue;
    v3->_internalClassQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(NPKThreadSafeObserverManager);
    observerManager = v3->_observerManager;
    v3->_observerManager = &v7->super;
  }
  return v3;
}

- (void)prewarm
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    dispatch_queue_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Prewarming app state", buf, 0xCu);
    }
  }
  internalClassQueue = self->_internalClassQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__NPKApplicationStateListener_prewarm__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalClassQueue, block);
}

uint64_t __38__NPKApplicationStateListener_prewarm__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retrieveAppState:0];
}

- (unint64_t)cachedAppState
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  p_appStateLock = &self->_appStateLock;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v14 = __45__NPKApplicationStateListener_cachedAppState__block_invoke;
  v15 = &unk_2644D2960;
  v16 = self;
  v17 = &v18;
  BOOL v4 = v13;
  os_unfair_lock_lock(p_appStateLock);
  v14((uint64_t)v4);

  os_unfair_lock_unlock(p_appStateLock);
  dispatch_queue_t v5 = pk_Payment_log();
  LODWORD(v4) = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = v19[3] - 1;
      if (v7 > 2) {
        v8 = @"Unknown";
      }
      else {
        v8 = off_2644D6040[v7];
      }
      *(_DWORD *)buf = 134218242;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Getting cached app state. State: %@", buf, 0x16u);
    }
  }
  unint64_t v9 = v19[3];
  if (!v9)
  {
    internalClassQueue = self->_internalClassQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__NPKApplicationStateListener_cachedAppState__block_invoke_60;
    block[3] = &unk_2644D2910;
    block[4] = self;
    dispatch_async(internalClassQueue, block);
    unint64_t v9 = v19[3];
  }
  _Block_object_dispose(&v18, 8);
  return v9;
}

uint64_t __45__NPKApplicationStateListener_cachedAppState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t __45__NPKApplicationStateListener_cachedAppState__block_invoke_60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retrieveAppState:0];
}

- (void)appState:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    internalClassQueue = self->_internalClassQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__NPKApplicationStateListener_appState___block_invoke;
    v7[3] = &unk_2644D2E58;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(internalClassQueue, v7);
  }
}

uint64_t __40__NPKApplicationStateListener_appState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retrieveAppState:*(void *)(a1 + 40)];
}

- (void)registerObserver:(id)a3
{
  [(NPKObserverManager *)self->_observerManager registerObserver:a3];
  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  [v4 addObserver:self];
}

- (void)removeObserver:(id)a3
{
  [(NPKObserverManager *)self->_observerManager unregisterObserver:a3];
  if (![(NPKObserverManager *)self->_observerManager hasObservers])
  {
    id v4 = [MEMORY[0x263F01880] defaultWorkspace];
    [v4 removeObserver:self];
  }
}

- (void)applicationStateDidChange:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__NPKApplicationStateListener_applicationStateDidChange___block_invoke;
  v3[3] = &unk_2644D5F88;
  v3[4] = self;
  [(NPKApplicationStateListener *)self _handleApplicationChangeNotificationWithWorkspaceApplicationProxies:a3 newStateResolver:v3];
}

uint64_t __57__NPKApplicationStateListener_applicationStateDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applicationStateWithLSApplicationState:a2];
}

- (void)applicationsDidInstall:(id)a3
{
}

uint64_t __54__NPKApplicationStateListener_applicationsDidInstall___block_invoke()
{
  return 1;
}

- (void)applicationsDidUninstall:(id)a3
{
}

uint64_t __56__NPKApplicationStateListener_applicationsDidUninstall___block_invoke()
{
  return 3;
}

- (void)_retrieveAppState:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    unint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Retrieving application record.", buf, 0xCu);
    }
  }
  id v8 = objc_alloc(MEMORY[0x263F01878]);
  uint64_t v9 = *MEMORY[0x263F5C7F8];
  id v18 = 0;
  uint64_t v10 = (void *)[v8 initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v18];
  id v11 = v18;
  if (v11)
  {
    v12 = pk_Payment_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      v14 = pk_Payment_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = NSStringFromBOOL();
        *(_DWORD *)buf = 134218754;
        uint64_t v20 = self;
        __int16 v21 = 2112;
        uint64_t v22 = v9;
        __int16 v23 = 2112;
        __int16 v24 = v15;
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_ERROR, "Error: [NPKApplicationStateListener] %p Failed to fetch %@ application record. App Record is nil? %@. Error: %@", buf, 0x2Au);
      }
    }
  }
  v16 = [v10 applicationState];
  unint64_t v17 = [(NPKApplicationStateListener *)self _applicationStateWithLSApplicationState:v16];

  [(NPKApplicationStateListener *)self _updateStateWithNewState:v17 completion:v4];
}

- (void)_handleApplicationChangeNotificationWithWorkspaceApplicationProxies:(id)a3 newStateResolver:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = (uint64_t (**)(id, void *))a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    uint64_t v12 = *MEMORY[0x263F5C7F8];
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v15 = [v14 bundleIdentifier];
        int v16 = [v15 isEqualToString:v12];

        if (v16)
        {
          unint64_t v17 = [v14 appState];
          uint64_t v18 = v7[2](v7, v17);

          v19 = pk_Payment_log();
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

          if (v20)
          {
            __int16 v21 = pk_Payment_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = [v14 appState];
              __int16 v23 = (void *)v22;
              if ((unint64_t)(v18 - 1) > 2) {
                __int16 v24 = @"Unknown";
              }
              else {
                __int16 v24 = off_2644D6040[v18 - 1];
              }
              *(_DWORD *)buf = 134218498;
              v32 = self;
              __int16 v33 = 2112;
              uint64_t v34 = v22;
              __int16 v35 = 2112;
              v36 = v24;
              _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Received NanoPassbook LS app state change notification. App Proxy state: %@, resolved state to %@", buf, 0x20u);
            }
          }
          internalClassQueue = self->_internalClassQueue;
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke;
          v26[3] = &unk_2644D3160;
          v26[4] = self;
          v26[5] = v18;
          dispatch_async(internalClassQueue, v26);
          goto LABEL_18;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

uint64_t __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStateWithNewState:completion:", MEMORY[0x263EF8330], 3221225472, __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke_2, &unk_2644D5FD0, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __116__NPKApplicationStateListener__handleApplicationChangeNotificationWithWorkspaceApplicationProxies_newStateResolver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = *(void *)(a1 + 40) - 1;
      if (v7 > 2) {
        id v8 = @"Unknown";
      }
      else {
        id v8 = off_2644D6040[v7];
      }
      uint64_t v9 = *(void *)(a1 + 32);
      if ((unint64_t)(a2 - 1) > 2) {
        uint64_t v10 = @"Unknown";
      }
      else {
        uint64_t v10 = off_2644D6040[a2 - 1];
      }
      int v11 = 134218498;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      v14 = v8;
      __int16 v15 = 2112;
      int v16 = v10;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [NPKApplicationStateListener] %p Finished updating application state from LS app state notification with state %@. New resolved state: %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (unint64_t)_applicationStateWithLSApplicationState:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 isInstalled];
    char v6 = [v4 isRestricted];
    if (v5) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = 3;
    }
    if (v5 && (v6 & 1) != 0) {
      unint64_t v7 = 2;
    }
  }
  else if (PKPassbookIsCurrentlyDeletedByUser())
  {
    unint64_t v7 = 3;
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (void)_updateStateWithNewState:(unint64_t)a3 completion:(id)a4
{
  char v6 = (void (**)(id, unint64_t))a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  int v11 = (void (*)(void *))__67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke;
  uint64_t v12 = &unk_2644D5FF8;
  __int16 v13 = self;
  v14 = &v16;
  unint64_t v15 = a3;
  unint64_t v7 = v10;
  os_unfair_lock_lock(&self->_appStateLock);
  v11(v7);

  os_unfair_lock_unlock(&self->_appStateLock);
  if (v6) {
    v6[2](v6, a3);
  }
  if (v17[3] != a3)
  {
    observerManager = self->_observerManager;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke_2;
    v9[3] = &unk_2644D6020;
    v9[4] = self;
    v9[5] = &v16;
    v9[6] = a3;
    [(NPKObserverManager *)observerManager enumerateObserversUsingBlock:v9];
  }
  _Block_object_dispose(&v16, 8);
}

void *__67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 16);
  *(void *)(result[4] + 16) = result[6];
  return result;
}

uint64_t __67__NPKApplicationStateListener__updateStateWithNewState_completion___block_invoke_2(void *a1, void *a2)
{
  return [a2 applicationStateListener:a1[4] applicationStateDidChangeFrom:*(void *)(*(void *)(a1[5] + 8) + 24) to:a1[6]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerManager, 0);
  objc_storeStrong((id *)&self->_internalClassQueue, 0);
}

@end