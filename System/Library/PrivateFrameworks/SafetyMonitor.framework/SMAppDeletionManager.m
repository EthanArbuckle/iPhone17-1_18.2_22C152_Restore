@interface SMAppDeletionManager
- (BOOL)isMessagesAppInstalled;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (SMAppDeletionManager)init;
- (void)_addObserver:(id)a3;
- (void)_applicationsDidInstall:(id)a3;
- (void)_applicationsDidUninstall:(id)a3;
- (void)_notifyObserversForMessagesAppInstalled;
- (void)_notifyObserversForMessagesAppUninstalled;
- (void)_notifyObserversWithUpdatedMessagesInstallation;
- (void)_removeObserver:(id)a3;
- (void)_setup;
- (void)addObserver:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)databaseWasRebuilt;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setup;
@end

@implementation SMAppDeletionManager

- (SMAppDeletionManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SMAppDeletionManager;
  v2 = [(SMAppDeletionManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (const char *)[(SMAppDeletionManager *)v4 UTF8String];
    }
    else
    {
      id v7 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v4];
      v6 = (const char *)[v7 UTF8String];
    }
    dispatch_queue_t v8 = dispatch_queue_create(v6, v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSHashTable *)objc_alloc_init(MEMORY[0x263F088B0]);
    observers = v4->_observers;
    v4->_observers = v10;

    [(SMAppDeletionManager *)v4 setup];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SMAppDeletionManager;
  [(SMAppDeletionManager *)&v4 dealloc];
}

- (void)setup
{
  v3 = [(SMAppDeletionManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SMAppDeletionManager_setup__block_invoke;
  block[3] = &unk_265499BD0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__SMAppDeletionManager_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 addObserver:self];
}

- (BOOL)isMessagesAppInstalled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F01880] defaultWorkspace];
  int v3 = [v2 applicationIsInstalled:@"com.apple.MobileSMS"];

  objc_super v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412802;
    v9 = v7;
    __int16 v10 = 2080;
    v11 = "-[SMAppDeletionManager isMessagesAppInstalled]";
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_debug_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_DEBUG, "%@, %s, querying isMessagesAppInstalled:, %{BOOL}d", (uint8_t *)&v8, 0x1Cu);
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(SMAppDeletionManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SMAppDeletionManager_addObserver___block_invoke;
  v7[3] = &unk_265499BF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __36__SMAppDeletionManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addObserver:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(SMAppDeletionManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SMAppDeletionManager_removeObserver___block_invoke;
  v7[3] = &unk_265499BF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__SMAppDeletionManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObserver:*(void *)(a1 + 40)];
}

- (void)_addObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    __int16 v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    int v12 = 138412802;
    int v13 = v9;
    __int16 v14 = 2080;
    v15 = "-[SMAppDeletionManager _addObserver:]";
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, adding observer, %@", (uint8_t *)&v12, 0x20u);
  }
  [(NSHashTable *)self->_observers addObject:v4];
  id v6 = [MEMORY[0x263F01880] defaultWorkspace];
  int v7 = [v6 applicationIsInstalled:@"com.apple.MobileSMS"];

  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [v4 onMessagesAppInstalled];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v4 onMessagesAppUninstalled];
  }
}

- (void)_removeObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    v11 = v7;
    __int16 v12 = 2080;
    int v13 = "-[SMAppDeletionManager _removeObserver:]";
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, removing observer, %@", (uint8_t *)&v10, 0x20u);
  }
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (void)_notifyObserversForMessagesAppInstalled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SMAppDeletionManager *)self observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 onMessagesAppInstalled];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversForMessagesAppUninstalled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SMAppDeletionManager *)self observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 onMessagesAppUninstalled];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMAppDeletionManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SMAppDeletionManager_applicationsDidInstall___block_invoke;
  v7[3] = &unk_265499BF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__SMAppDeletionManager_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationsDidInstall:*(void *)(a1 + 40)];
}

- (void)_applicationsDidInstall:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleIdentifier", (void)v11);
        int v10 = [v9 isEqualToString:@"com.apple.MobileSMS"];

        if (v10)
        {
          [(SMAppDeletionManager *)self _notifyObserversForMessagesAppInstalled];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SMAppDeletionManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SMAppDeletionManager_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_265499BF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__SMAppDeletionManager_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationsDidUninstall:*(void *)(a1 + 40)];
}

- (void)_applicationsDidUninstall:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleIdentifier", (void)v11);
        int v10 = [v9 isEqualToString:@"com.apple.MobileSMS"];

        if (v10)
        {
          [(SMAppDeletionManager *)self _notifyObserversForMessagesAppUninstalled];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)databaseWasRebuilt
{
  uint64_t v3 = [(SMAppDeletionManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SMAppDeletionManager_databaseWasRebuilt__block_invoke;
  block[3] = &unk_265499BD0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __42__SMAppDeletionManager_databaseWasRebuilt__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _databaseWasRebuilt];
}

- (void)_notifyObserversWithUpdatedMessagesInstallation
{
  uint64_t v3 = [MEMORY[0x263F01880] defaultWorkspace];
  int v4 = [v3 applicationIsInstalled:@"com.apple.MobileSMS"];

  if (v4)
  {
    [(SMAppDeletionManager *)self _notifyObserversForMessagesAppInstalled];
  }
  else
  {
    [(SMAppDeletionManager *)self _notifyObserversForMessagesAppUninstalled];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end