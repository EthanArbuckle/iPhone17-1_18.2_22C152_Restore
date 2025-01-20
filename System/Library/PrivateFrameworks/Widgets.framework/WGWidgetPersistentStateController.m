@interface WGWidgetPersistentStateController
- (BOOL)_setHasContent:(BOOL)a3 forWidgetWithIdentifier:(id)a4;
- (BOOL)doesWidgetWithIdentifierHaveContent:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)setLargestAvailableDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4;
- (WGWidgetPersistentStateController)initWithDiscoveryController:(id)a3;
- (id)_persistentStateForWidgetWithIdentifier:(id)a3 containingBundleIdentifier:(id)a4;
- (id)_updateCachedStateForWidgetWithIdentifier:(id)a3 containingBundleID:(id)a4;
- (id)_valueForKey:(id)a3 forWidgetWithIdentifier:(id)a4;
- (int64_t)largestAvailableDisplayModeForWidgetWithIdentifier:(id)a3;
- (void)__requestRefreshAfterDate:(id)a3 forWidgetWithBundleIdentifier:(id)a4;
- (void)__setHasContent:(BOOL)a3 forWidgetWithBundleIdentifier:(id)a4;
- (void)_setValue:(id)a3 forKey:(id)a4 forWidgetWithIdentifier:(id)a5 containingBundleID:(id)a6;
- (void)_synchronizePersistentStateForWidgetWithIdentifier:(id)a3;
- (void)dealloc;
@end

@implementation WGWidgetPersistentStateController

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x263F08D80];
  id v6 = a4;
  v7 = [v5 interfaceWithProtocol:&unk_26D606BF0];
  [v6 setExportedInterface:v7];

  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D617B78];
  [v6 setRemoteObjectInterface:v8];

  [v6 setInterruptionHandler:&__block_literal_global_7];
  [v6 setInvalidationHandler:&__block_literal_global_51_0];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

void __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _xpcConnection];
  if (BSXPCConnectionHasEntitlement())
  {
  }
  else
  {
    char v3 = NCXPCConnectionIsFromContainingAppOrWidgetWithIdentifier(*(void **)(a1 + 32), *(void **)(a1 + 40));

    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
  }
  v4 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    int v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "Will set hasContent: %d for %{public}@", buf, 0x12u);
  }
  [*(id *)(a1 + 48) _setHasContent:*(unsigned __int8 *)(a1 + 56) forWidgetWithIdentifier:*(void *)(a1 + 40)];
LABEL_7:
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke_53;
  v9[3] = &unk_264677268;
  v7 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
  objc_msgSend(v8, "__didReceiveHasContentRequest");
}

- (BOOL)_setHasContent:(BOOL)a3 forWidgetWithIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (![v6 length]
    || [(WGWidgetPersistentStateController *)self doesWidgetWithIdentifierHaveContent:v6] == v4)
  {
    BOOL v10 = 0;
  }
  else
  {
    v7 = [NSNumber numberWithBool:v4];
    v8 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v6);
    [(WGWidgetPersistentStateController *)self _setValue:v7 forKey:@"SBWidgetViewControllerHasContentKey" forWidgetWithIdentifier:v6 containingBundleID:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryController);
    [WeakRetained setHasContent:v4 forWidgetWithIdentifier:v6];

    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)doesWidgetWithIdentifierHaveContent:(id)a3
{
  char v3 = [(WGWidgetPersistentStateController *)self _valueForKey:@"SBWidgetViewControllerHasContentKey" forWidgetWithIdentifier:a3];
  BOOL v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)_valueForKey:(id)a3 forWidgetWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length] || !objc_msgSend(v7, "length"))
  {
    v8 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetPersistentStateController _valueForKey:forWidgetWithIdentifier:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v16 = [(NSMutableDictionary *)self->_widgetIdentifiersToCachedState objectForKey:v7];
    if (!v16)
    {
      v17 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v7);
      v16 = [(WGWidgetPersistentStateController *)self _updateCachedStateForWidgetWithIdentifier:v7 containingBundleID:v17];
    }
    v18 = [v16 objectForKey:v6];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_49()
{
  v0 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
    __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_49_cold_1(v0);
  }
}

- (void)__setHasContent:(BOOL)a3 forWidgetWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x263F08D68] currentConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke;
  v10[3] = &unk_264677290;
  id v11 = v7;
  id v12 = v6;
  BOOL v14 = a3;
  uint64_t v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

- (WGWidgetPersistentStateController)initWithDiscoveryController:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WGWidgetPersistentStateController;
  char v5 = [(WGWidgetPersistentStateController *)&v17 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_discoveryController, v4);
    id v7 = objc_alloc(MEMORY[0x263F08D88]);
    uint64_t v8 = [v7 initWithMachServiceName:*MEMORY[0x263F146B8]];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v8;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
    if (MKBDeviceUnlockedSinceBoot())
    {
      v6->_canCacheState = 1;
    }
    else
    {
      uint64_t Serial = BSDispatchQueueCreateSerial();
      keybagQueue = v6->_keybagQueue;
      v6->_keybagQueue = (OS_dispatch_queue *)Serial;

      objc_initWeak(&location, v6);
      objc_copyWeak(&v15, &location);
      v6->_keybagEvent = (_MKBEvent *)MKBEventsRegister();
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    uint64_t v12 = BSDispatchQueueCreateSerial();
    diskWriteQueue = v6->_diskWriteQueue;
    v6->_diskWriteQueue = (OS_dispatch_queue *)v12;
  }
  return v6;
}

void __65__WGWidgetPersistentStateController_initWithDiscoveryController___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    v5[3] = v2;
    v5[4] = v3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__WGWidgetPersistentStateController_initWithDiscoveryController___block_invoke_2;
    block[3] = &unk_2646766F8;
    objc_copyWeak(v5, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v5);
  }
}

void __65__WGWidgetPersistentStateController_initWithDiscoveryController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = WeakRetained;
  if (*((void *)WeakRetained + 5))
  {
    MKBEventsUnregister();
    id WeakRetained = v3;
    v3[5] = 0;
  }
  *((unsigned char *)WeakRetained + 32) = 1;
  id v2 = objc_loadWeakRetained((id *)WeakRetained + 2);
  [v2 invalidateVisibleIdentifiers];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  if (self->_keybagEvent) {
    MKBEventsUnregister();
  }
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetPersistentStateController;
  [(WGWidgetPersistentStateController *)&v3 dealloc];
}

- (id)_persistentStateForWidgetWithIdentifier:(id)a3 containingBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v6 length])
  {
    id v9 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v10 = WGPersistedStateURLForWidgetWithBundleIdentifier(v6, 0);
    uint64_t v11 = [v9 dictionaryWithContentsOfURL:v10];

    id v8 = (id)v11;
    if (!v11)
    {
      id v12 = v6;
      id v13 = v7;
      if ([v12 length])
      {
        BOOL v14 = WGContainingBundleCachePathForWidgetWithContainingBundleIdentifier((uint64_t)v13, @"State", 0);
        id v15 = [v14 stringByAppendingPathComponent:v12];
        v16 = [v15 stringByAppendingPathExtension:@"plist"];

        if ([v16 length])
        {
          objc_super v17 = [NSURL fileURLWithPath:v16];
        }
        else
        {
          objc_super v17 = 0;
        }
      }
      else
      {
        objc_super v17 = 0;
      }

      uint64_t v18 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:v17];
      if (v18)
      {
        id v8 = (id)v18;
        v19 = [v17 URLByDeletingLastPathComponent];
        v20 = [MEMORY[0x263F08850] defaultManager];
        diskWriteQueue = self->_diskWriteQueue;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __104__WGWidgetPersistentStateController__persistentStateForWidgetWithIdentifier_containingBundleIdentifier___block_invoke;
        v25[3] = &unk_264676680;
        id v26 = v20;
        id v27 = v19;
        id v22 = v19;
        id v23 = v20;
        dispatch_async(diskWriteQueue, v25);
      }
      else
      {
        id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
    }
  }

  return v8;
}

uint64_t __104__WGWidgetPersistentStateController__persistentStateForWidgetWithIdentifier_containingBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

- (id)_updateCachedStateForWidgetWithIdentifier:(id)a3 containingBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    id v8 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetPersistentStateController _updateCachedStateForWidgetWithIdentifier:containingBundleID:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if ([v6 length])
  {
    if (!self->_widgetIdentifiersToCachedState && self->_canCacheState)
    {
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      widgetIdentifiersToCachedState = self->_widgetIdentifiersToCachedState;
      self->_widgetIdentifiersToCachedState = v16;
    }
    uint64_t v18 = [(WGWidgetPersistentStateController *)self _persistentStateForWidgetWithIdentifier:v6 containingBundleIdentifier:v7];
    if (v18) {
      [(NSMutableDictionary *)self->_widgetIdentifiersToCachedState setObject:v18 forKey:v6];
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)_synchronizePersistentStateForWidgetWithIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    char v5 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR)) {
      -[WGWidgetPersistentStateController _updateCachedStateForWidgetWithIdentifier:containingBundleID:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if ([v4 length])
  {
    uint64_t v13 = [(NSMutableDictionary *)self->_widgetIdentifiersToCachedState objectForKey:v4];
    uint64_t v14 = v13;
    if (v13)
    {
      diskWriteQueue = self->_diskWriteQueue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __88__WGWidgetPersistentStateController__synchronizePersistentStateForWidgetWithIdentifier___block_invoke;
      v16[3] = &unk_264676680;
      id v17 = v13;
      id v18 = v4;
      dispatch_async(diskWriteQueue, v16);
    }
  }
}

void __88__WGWidgetPersistentStateController__synchronizePersistentStateForWidgetWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  WGPersistedStateURLForWidgetWithBundleIdentifier(*(void **)(a1 + 40), 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 writeToURL:v2 atomically:1];
}

- (void)_setValue:(id)a3 forKey:(id)a4 forWidgetWithIdentifier:(id)a5 containingBundleID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 || ![v11 length] || !objc_msgSend(v12, "length"))
  {
    uint64_t v14 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
    {
      -[WGWidgetPersistentStateController _setValue:forKey:forWidgetWithIdentifier:containingBundleID:](v14, v15, v16, v17, v18, v19, v20, v21);
      if (!v10) {
        goto LABEL_11;
      }
    }
    else if (!v10)
    {
      goto LABEL_11;
    }
  }
  if ([v11 length])
  {
    if ([v12 length])
    {
      id v22 = [(NSMutableDictionary *)self->_widgetIdentifiersToCachedState objectForKey:v12];
      if (v22
        || ([(WGWidgetPersistentStateController *)self _updateCachedStateForWidgetWithIdentifier:v12 containingBundleID:v13], (id v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [v22 setObject:v10 forKey:v11];
        [(WGWidgetPersistentStateController *)self _synchronizePersistentStateForWidgetWithIdentifier:v12];
      }
    }
  }
LABEL_11:
}

- (int64_t)largestAvailableDisplayModeForWidgetWithIdentifier:(id)a3
{
  objc_super v3 = [(WGWidgetPersistentStateController *)self _valueForKey:@"WGWidgetViewControllerLargestAvailableDisplayMode" forWidgetWithIdentifier:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)setLargestAvailableDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4
{
  id v6 = a4;
  if ([v6 length]
    && [(WGWidgetPersistentStateController *)self largestAvailableDisplayModeForWidgetWithIdentifier:v6] != a3)
  {
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    uint64_t v9 = WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v6);
    [(WGWidgetPersistentStateController *)self _setValue:v8 forKey:@"WGWidgetViewControllerLargestAvailableDisplayMode" forWidgetWithIdentifier:v6 containingBundleID:v9];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG)) {
    __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_222E49000, v4, OS_LOG_TYPE_DEFAULT, "Encountered error attempting to reply to content availability request for widget with bundle ID \"%{public}@\": %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)__requestRefreshAfterDate:(id)a3 forWidgetWithBundleIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [MEMORY[0x263F08D68] currentConnection];
  if ([v7 hasPrefix:@"com.apple."])
  {
    id v9 = [v8 _xpcConnection];
    if (BSXPCConnectionHasEntitlement())
    {
    }
    else
    {
      int v10 = NCXPCConnectionIsFromContainingAppOrWidgetWithIdentifier(v8, v7);

      if (!v10) {
        goto LABEL_11;
      }
    }
    id v11 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_222E49000, v11, OS_LOG_TYPE_DEFAULT, "Will request refresh for %{public}@ after %{public}@", (uint8_t *)&v15, 0x16u);
    }
    if (v6)
    {
      id v12 = v6;
    }
    else
    {
      id v12 = [MEMORY[0x263EFF910] date];
    }
    id v13 = v12;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryController);
    [WeakRetained requestRefreshForWidget:v7 afterDate:v13];
  }
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskWriteQueue, 0);
  objc_storeStrong((id *)&self->_keybagQueue, 0);
  objc_storeStrong((id *)&self->_widgetIdentifiersToCachedState, 0);
  objc_destroyWeak((id *)&self->_discoveryController);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_updateCachedStateForWidgetWithIdentifier:(uint64_t)a3 containingBundleID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setValue:(uint64_t)a3 forKey:(uint64_t)a4 forWidgetWithIdentifier:(uint64_t)a5 containingBundleID:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_valueForKey:(uint64_t)a3 forWidgetWithIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222E49000, log, OS_LOG_TYPE_DEBUG, "WGWidgetController (host-side) connection interrupted", v1, 2u);
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_49_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222E49000, log, OS_LOG_TYPE_DEBUG, "WGWidgetController (host-side) connection invalidated", v1, 2u);
}

@end