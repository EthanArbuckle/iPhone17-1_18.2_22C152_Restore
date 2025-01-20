@interface BRCSystemResourcesManager
+ (id)manager;
- (BOOL)connectedToPowerSource;
- (BOOL)hasEnoughSpaceForDevice:(int)a3;
- (BOOL)isNetworkReachable;
- (BOOL)isPowerOK;
- (BRCSystemResourcesManager)init;
- (void)__resetReachability;
- (void)_didReceiveMemoryWarning;
- (void)_initAppListObservers;
- (void)_initLowDiskManager;
- (void)_initLowMemory;
- (void)_initPowerManager;
- (void)_initProcessObservers;
- (void)_initReachability;
- (void)_initScreenLockManager;
- (void)_invalidateAppListObservers;
- (void)_invalidateLowDiskManager;
- (void)_invalidateLowMemory;
- (void)_invalidatePowerManager;
- (void)_invalidateProcessObservers;
- (void)_invalidateReachability;
- (void)_invalidateScreenLockManager;
- (void)_processLowDiskNotification:(BOOL)a3;
- (void)_resetLowDiskManager;
- (void)_resetPowerManager;
- (void)_resetReachability;
- (void)_setIsNetworkReachableWithCoalescing:(BOOL)a3;
- (void)_setNetworkReachable:(BOOL)a3;
- (void)_setPowerLevel:(BOOL)a3;
- (void)_setPowerLevelWithCoalescing:(BOOL)a3;
- (void)addAppListObserver:(id)a3;
- (void)addLowDiskObserver:(id)a3 forDevice:(int)a4;
- (void)addLowMemoryObserver:(id)a3;
- (void)addPowerObserver:(id)a3;
- (void)addProcessMonitor:(id)a3 forProcessID:(int)a4;
- (void)addReachabilityObserver:(id)a3;
- (void)addScreenLockObserver:(id)a3;
- (void)close;
- (void)dealloc;
- (void)init;
- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4;
- (void)removeAppListObserver:(id)a3;
- (void)removeLowDiskObserver:(id)a3 forDevice:(int)a4;
- (void)removeLowMemoryObserver:(id)a3;
- (void)removePowerObserver:(id)a3;
- (void)removeProcessMonitor:(id)a3;
- (void)removeReachabilityObserver:(id)a3;
- (void)removeScreenLockObserver:(id)a3;
- (void)reset;
- (void)screenLockChanged:(BOOL)a3;
@end

@implementation BRCSystemResourcesManager

- (void)removeProcessMonitor:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__BRCSystemResourcesManager_removeProcessMonitor___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

+ (id)manager
{
  if (manager_once != -1) {
    dispatch_once(&manager_once, &__block_literal_global_66);
  }
  v2 = (void *)manager_gSystemResourcesManager;
  return v2;
}

void __50__BRCSystemResourcesManager_removeProcessMonitor___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = v2;
    [v2 invalidate];
    [*(id *)(*(void *)(a1 + 32) + 160) removeObjectForKey:*(void *)(a1 + 40)];
    v2 = v3;
  }
}

void __36__BRCSystemResourcesManager_manager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)manager_gSystemResourcesManager;
  manager_gSystemResourcesManager = v0;
}

- (BRCSystemResourcesManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)BRCSystemResourcesManager;
  v2 = [(BRCSystemResourcesManager *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.brc.system-resources", v4);

    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    [(BRCSystemResourcesManager *)v2 _initScreenLockManager];
    [(BRCSystemResourcesManager *)v2 _initReachability];
    [(BRCSystemResourcesManager *)v2 _initPowerManager];
    [(BRCSystemResourcesManager *)v2 _initLowDiskManager];
    [(BRCSystemResourcesManager *)v2 _initLowMemory];
    [(BRCSystemResourcesManager *)v2 _initProcessObservers];
    [(BRCSystemResourcesManager *)v2 _initAppListObservers];
    v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCSystemResourcesManager init]();
    }
  }
  return v2;
}

- (void)close
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__BRCSystemResourcesManager_close__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

void __34__BRCSystemResourcesManager_close__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[16])
  {
    [v1 _invalidateScreenLockManager];
    [*v2 _invalidateReachability];
    [*v2 _invalidatePowerManager];
    [*v2 _invalidateLowDiskManager];
    [*v2 _invalidateLowMemory];
    [*v2 _invalidateProcessObservers];
    [*v2 _invalidateAppListObservers];
    *((unsigned char *)*v2 + 16) = 1;
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __34__BRCSystemResourcesManager_close__block_invoke_cold_1();
    }
  }
}

- (void)dealloc
{
  [(BRCSystemResourcesManager *)self close];
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)BRCSystemResourcesManager;
  [(BRCSystemResourcesManager *)&v4 dealloc];
}

- (void)reset
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_4(v0);
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] [%@] has been reset%@", v4, v5, v6, v7, v8);
}

- (void)_initScreenLockManager
{
  uint64_t v3 = [MEMORY[0x263F32630] sharedScreenLockMonitor];
  [v3 addObserver:self];

  uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  screenLockObservers = self->_screenLockObservers;
  self->_screenLockObservers = v4;
}

- (void)_invalidateScreenLockManager
{
  uint64_t v3 = [MEMORY[0x263F32630] sharedScreenLockMonitor];
  [v3 removeObserver:self];

  screenLockObservers = self->_screenLockObservers;
  self->_screenLockObservers = 0;
}

- (void)screenLockChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = self->_screenLockObservers;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSHashTable *)self->_screenLockObservers allObjects];
  objc_sync_exit(v5);

  if (self->_screenLocked != v3)
  {
    self->_screenLocked = v3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "screenLockChanged:", v3, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)addScreenLockObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_screenLockObservers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_screenLockObservers addObject:v5];
  objc_sync_exit(v4);

  [v5 screenLockChanged:self->_screenLocked];
}

- (void)removeScreenLockObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_screenLockObservers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_screenLockObservers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)reachabilityMonitor:(id)a3 didChangeReachabilityStatusTo:(BOOL)a4
{
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__BRCSystemResourcesManager_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke;
  v5[3] = &unk_2650806E8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __79__BRCSystemResourcesManager_reachabilityMonitor_didChangeReachabilityStatusTo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIsNetworkReachableWithCoalescing:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_initReachability
{
  self->_isNetworkReachable = 1;
  BOOL v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  reachabilityObservers = self->_reachabilityObservers;
  self->_reachabilityObservers = v3;

  id v15 = +[BRCUserDefaults defaultsForMangledID:0];
  id v5 = [BRCStateUpdateCoalescer alloc];
  notificationQueue = self->_notificationQueue;
  [v15 systemReachabilityMinDelay];
  double v8 = v7;
  [v15 systemReachabilityMaxDelay];
  double v10 = v9;
  [v15 systemReachabilityStableStateMinThreshold];
  long long v12 = [(BRCStateUpdateCoalescer *)v5 initWithCallbackQueue:notificationQueue timerMinDelay:v8 timerMaxDelay:v10 stableStateMinThreshold:v11];
  reachabilityStateUpdateCoalescer = self->_reachabilityStateUpdateCoalescer;
  self->_reachabilityStateUpdateCoalescer = v12;

  long long v14 = [MEMORY[0x263F32618] sharedReachabilityMonitor];
  [v14 addObserver:self];
}

- (void)__resetReachability
{
  [(BRCStateUpdateCoalescer *)self->_reachabilityStateUpdateCoalescer reset];
  BOOL isNetworkReachable = self->_isNetworkReachable;
  [(BRCSystemResourcesManager *)self _setNetworkReachable:isNetworkReachable];
}

- (void)_resetReachability
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BRCSystemResourcesManager__resetReachability__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __47__BRCSystemResourcesManager__resetReachability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__resetReachability");
}

- (void)_invalidateReachability
{
  reachabilityObservers = self->_reachabilityObservers;
  self->_reachabilityObservers = 0;

  uint64_t v4 = [MEMORY[0x263F32618] sharedReachabilityMonitor];
  [v4 removeObserver:self];

  [(BRCSystemResourcesManager *)self __resetReachability];
  reachabilityStateUpdateCoalescer = self->_reachabilityStateUpdateCoalescer;
  self->_reachabilityStateUpdateCoalescer = 0;
}

- (void)_setIsNetworkReachableWithCoalescing:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  reachabilityStateUpdateCoalescer = self->_reachabilityStateUpdateCoalescer;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__BRCSystemResourcesManager__setIsNetworkReachableWithCoalescing___block_invoke;
  v6[3] = &unk_2650806E8;
  v6[4] = self;
  BOOL v7 = v3;
  [(BRCStateUpdateCoalescer *)reachabilityStateUpdateCoalescer updateStateWithCoalescing:v6 oldState:self->_isNetworkReachable newState:v3];
}

uint64_t __66__BRCSystemResourcesManager__setIsNetworkReachableWithCoalescing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNetworkReachable:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isNetworkReachable
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__BRCSystemResourcesManager_isNetworkReachable__block_invoke;
  v5[3] = &unk_265081558;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(notificationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__BRCSystemResourcesManager_isNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (void)_setNetworkReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  self->_BOOL isNetworkReachable = v3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = "un";
    if (v3) {
      BOOL v7 = "";
    }
    *(_DWORD *)buf = 136315394;
    v19 = v7;
    __int16 v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] Network really becomes %sreachable%@", buf, 0x16u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = self->_reachabilityObservers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "networkReachabilityChanged:", v3, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)addReachabilityObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__BRCSystemResourcesManager_addReachabilityObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __53__BRCSystemResourcesManager_addReachabilityObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 48);
  return [v2 networkReachabilityChanged:v3];
}

- (void)removeReachabilityObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__BRCSystemResourcesManager_removeReachabilityObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __56__BRCSystemResourcesManager_removeReachabilityObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)_initPowerManager
{
  self->_powerLevelOK = 1;
  uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  powerObservers = self->_powerObservers;
  self->_powerObservers = v3;

  notificationQueue = self->_notificationQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__BRCSystemResourcesManager__initPowerManager__block_invoke;
  v12[3] = &unk_26507F088;
  v12[4] = self;
  id v6 = v12;
  BOOL v7 = (void *)MEMORY[0x263F841B0];
  id v8 = notificationQueue;
  uint64_t v9 = [v7 sharedManager];
  uint64_t v10 = objc_msgSend(v9, "br_currentPersonaID");

  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __br_notify_register_dispatch_block_invoke_1;
  handler[3] = &unk_26507F0D8;
  id v15 = v6;
  long long v16 = "com.apple.system.powermanagement.SystemLoadAdvisory";
  id v14 = v10;
  id v11 = v10;
  notify_register_dispatch("com.apple.system.powermanagement.SystemLoadAdvisory", &self->_powerNotifyToken, v8, handler);

  [(BRCSystemResourcesManager *)self _resetPowerManager];
}

uint64_t __46__BRCSystemResourcesManager__initPowerManager__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t is_ok = brc_power_is_ok();
  return [v1 _setPowerLevelWithCoalescing:is_ok];
}

- (void)_invalidatePowerManager
{
  notify_cancel(self->_powerNotifyToken);
  self->_powerNotifyToken = 0;
  powerObservers = self->_powerObservers;
  self->_powerObservers = 0;
}

- (void)_resetPowerManager
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BRCSystemResourcesManager__resetPowerManager__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __47__BRCSystemResourcesManager__resetPowerManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t is_ok = brc_power_is_ok();
  return [v2 _setPowerLevel:is_ok];
}

- (BOOL)isPowerOK
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__BRCSystemResourcesManager_isPowerOK__block_invoke;
  v5[3] = &unk_265081558;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(notificationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__BRCSystemResourcesManager_isPowerOK__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 76);
  return result;
}

- (void)_setPowerLevelWithCoalescing:(BOOL)a3
{
  id v5 = +[BRCUserDefaults defaultsForMangledID:0];
  [v5 systemPowerLatency];
  double v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (a3)
  {
    powerLevelOKTimer = self->_powerLevelOKTimer;
    if (self->_powerLevelOK)
    {
      if (powerLevelOKTimer)
      {
        dispatch_source_cancel(powerLevelOKTimer);
        char v9 = self->_powerLevelOKTimer;
        self->_powerLevelOKTimer = 0;
      }
    }
    else
    {
      if (powerLevelOKTimer)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke_2;
        v25[3] = &unk_2650806E8;
        v25[4] = self;
        BOOL v26 = a3;
        uint64_t v12 = powerLevelOKTimer;
        long long v13 = v25;
        id v14 = v13;
        id v15 = v13;
        if (*MEMORY[0x263F32768])
        {
          id v15 = ((void (*)(void *))*MEMORY[0x263F32768])(v13);
        }
        dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v15);
        dispatch_source_set_event_handler(v12, v16);
      }
      else
      {
        v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_notificationQueue);
        dispatch_time_t v18 = dispatch_time(0, (unint64_t)(v7 * 1000000000.0));
        dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(unint64_t)(v7 * 1000000000.0) / 10);

        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke;
        v27[3] = &unk_2650806E8;
        v27[4] = self;
        BOOL v28 = a3;
        v19 = v17;
        __int16 v20 = v27;
        v21 = v20;
        uint64_t v22 = v20;
        if (*MEMORY[0x263F32768])
        {
          uint64_t v22 = ((void (*)(void *))*MEMORY[0x263F32768])(v20);
        }
        dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v22);
        dispatch_source_set_event_handler(v19, v23);

        v24 = self->_powerLevelOKTimer;
        self->_powerLevelOKTimer = (OS_dispatch_source *)v19;
        uint64_t v12 = v19;

        dispatch_resume(v12);
      }
    }
  }
  else
  {
    uint64_t v10 = self->_powerLevelOKTimer;
    if (v10)
    {
      dispatch_source_cancel(v10);
      id v11 = self->_powerLevelOKTimer;
      self->_powerLevelOKTimer = 0;
    }
    if (self->_powerLevelOK) {
      [(BRCSystemResourcesManager *)self _setPowerLevel:0];
    }
  }
}

uint64_t __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPowerLevel:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __58__BRCSystemResourcesManager__setPowerLevelWithCoalescing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPowerLevel:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_setPowerLevel:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  powerLevelOKTimer = self->_powerLevelOKTimer;
  if (powerLevelOKTimer)
  {
    dispatch_source_cancel(powerLevelOKTimer);
    double v6 = self->_powerLevelOKTimer;
    self->_powerLevelOKTimer = 0;
  }
  self->_powerLevelOK = v3;
  double v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCSystemResourcesManager _setPowerLevel:]();
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v9 = self->_powerObservers;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "powerLevelChanged:", v3, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)addPowerObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__BRCSystemResourcesManager_addPowerObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __46__BRCSystemResourcesManager_addPowerObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 76);
  return [v2 powerLevelChanged:v3];
}

- (void)removePowerObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__BRCSystemResourcesManager_removePowerObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __49__BRCSystemResourcesManager_removePowerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)connectedToPowerSource
{
  return 1;
}

- (void)_initLowDiskManager
{
  uint64_t v3 = (NSMutableSet *)objc_opt_new();
  lowDiskSet = self->_lowDiskSet;
  self->_lowDiskSet = v3;

  id v5 = (NSMutableDictionary *)objc_opt_new();
  lowDiskDict = self->_lowDiskDict;
  self->_lowDiskDict = v5;

  double v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8408], 0, 0x1304uLL, (dispatch_queue_t)self->_notificationQueue);
  lowDiskSource = self->_lowDiskSource;
  self->_lowDiskSource = v7;

  char v9 = self->_lowDiskSource;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke;
  v15[3] = &unk_26507ED70;
  v15[4] = self;
  uint64_t v10 = v9;
  uint64_t v11 = v15;
  uint64_t v12 = v11;
  uint64_t v13 = v11;
  if (*MEMORY[0x263F32768])
  {
    uint64_t v13 = ((void (*)(void *))*MEMORY[0x263F32768])(v11);
  }
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v13);
  dispatch_source_set_event_handler(v10, v14);

  dispatch_resume((dispatch_object_t)self->_lowDiskSource);
}

void __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 128))
  {
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(v3 + 8));
    [v2 systemLowDiskLatency];
    int64_t v6 = (unint64_t)(v5 * 1000000000.0);
    double v7 = v4;
    dispatch_time_t v8 = dispatch_time(0, v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, v6 / 10);

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke_2;
    v19[3] = &unk_26507ED98;
    char v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    __int16 v20 = v9;
    uint64_t v21 = v10;
    uint64_t v11 = v9;
    uint64_t v12 = v19;
    uint64_t v13 = v12;
    dispatch_block_t v14 = v12;
    if (*MEMORY[0x263F32768])
    {
      dispatch_block_t v14 = ((void (*)(void *))*MEMORY[0x263F32768])(v12);
    }
    dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
    dispatch_source_set_event_handler(v11, v15);

    uint64_t v16 = *(void *)(a1 + 32);
    long long v17 = *(void **)(v16 + 128);
    *(void *)(v16 + 128) = v11;
    dispatch_time_t v18 = v11;

    dispatch_resume(v18);
  }
}

uint64_t __48__BRCSystemResourcesManager__initLowDiskManager__block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  dispatch_source_t v4 = *(void **)(a1 + 40);
  return [v4 _processLowDiskNotification:0];
}

- (void)_invalidateLowDiskManager
{
  lowDiskTimer = self->_lowDiskTimer;
  if (lowDiskTimer)
  {
    dispatch_source_cancel(lowDiskTimer);
    dispatch_source_t v4 = self->_lowDiskTimer;
    self->_lowDiskTimer = 0;
  }
  lowDiskSource = self->_lowDiskSource;
  if (lowDiskSource)
  {
    dispatch_source_cancel(lowDiskSource);
    int64_t v6 = self->_lowDiskSource;
    self->_lowDiskSource = 0;
  }
  lowDiskDict = self->_lowDiskDict;
  self->_lowDiskDict = 0;

  lowDiskSet = self->_lowDiskSet;
  self->_lowDiskSet = 0;
}

- (void)_resetLowDiskManager
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BRCSystemResourcesManager__resetLowDiskManager__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

uint64_t __49__BRCSystemResourcesManager__resetLowDiskManager__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processLowDiskNotification:1];
}

- (void)_processLowDiskNotification:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  lowDiskDict = self->_lowDiskDict;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__BRCSystemResourcesManager__processLowDiskNotification___block_invoke;
  v6[3] = &unk_265086DC0;
  v6[4] = self;
  BOOL v7 = a3;
  [(NSMutableDictionary *)lowDiskDict enumerateKeysAndObjectsUsingBlock:v6];
}

void __57__BRCSystemResourcesManager__processLowDiskNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL has_enough_space = brc_device_has_enough_space([v5 intValue]);
  int v8 = [*(id *)(*(void *)(a1 + 32) + 104) containsObject:v5];
  if (*(unsigned char *)(a1 + 40) || has_enough_space == v8)
  {
    char v9 = *(void **)(*(void *)(a1 + 32) + 104);
    if (has_enough_space) {
      [v9 removeObject:v5];
    }
    else {
      [v9 addObject:v5];
    }
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      long long v17 = "NOT ";
      *(_DWORD *)buf = 138412802;
      id v24 = v5;
      if (has_enough_space) {
        long long v17 = "";
      }
      __int16 v25 = 2080;
      BOOL v26 = v17;
      __int16 v27 = 2112;
      BOOL v28 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] disk %@ has %senough space now%@", buf, 0x20u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "lowDiskStatusChangedForDevice:hasEnoughSpace:", objc_msgSend(v5, "intValue", (void)v18), has_enough_space);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
}

- (BOOL)hasEnoughSpaceForDevice:(int)a3
{
  return brc_device_has_enough_space(*(uint64_t *)&a3);
}

- (void)addLowDiskObserver:(id)a3 forDevice:(int)a4
{
  id v6 = a3;
  if (!a4)
  {
    char v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCSystemResourcesManager addLowDiskObserver:forDevice:]();
    }
  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BRCSystemResourcesManager_addLowDiskObserver_forDevice___block_invoke;
  block[3] = &unk_265083628;
  int v13 = a4;
  block[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_sync(notificationQueue, block);
}

void __58__BRCSystemResourcesManager_addLowDiskObserver_forDevice___block_invoke(uint64_t a1)
{
  id v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKeyedSubscript:v6];
  int v3 = [*(id *)(*(void *)(a1 + 32) + 104) containsObject:v6];
  if (v2)
  {
    uint64_t v4 = v3 ^ 1u;
  }
  else
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 112);
    uint64_t v2 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [v5 setObject:v2 forKeyedSubscript:v6];
    if (brc_device_has_enough_space(*(unsigned int *)(a1 + 48)))
    {
      uint64_t v4 = 1;
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 104) addObject:v6];
      uint64_t v4 = 0;
    }
  }
  [v2 addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) lowDiskStatusChangedForDevice:*(unsigned int *)(a1 + 48) hasEnoughSpace:v4];
}

- (void)removeLowDiskObserver:(id)a3 forDevice:(int)a4
{
  id v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BRCSystemResourcesManager_removeLowDiskObserver_forDevice___block_invoke;
  block[3] = &unk_265083628;
  int v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(notificationQueue, block);
}

void __61__BRCSystemResourcesManager_removeLowDiskObserver_forDevice___block_invoke(uint64_t a1)
{
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "objectForKeyedSubscript:");
  int v3 = v2;
  if (v2)
  {
    [v2 removeObject:*(void *)(a1 + 40)];
    if (![v3 count])
    {
      [*(id *)(*(void *)(a1 + 32) + 112) removeObjectForKey:v4];
      [*(id *)(*(void *)(a1 + 32) + 104) removeObject:v4];
    }
  }
}

- (void)_initLowMemory
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _memoryNotificationEventSource == NULL%@", v1, 0xCu);
}

uint64_t __43__BRCSystemResourcesManager__initLowMemory__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didReceiveMemoryWarning];
}

uint64_t __43__BRCSystemResourcesManager__initLowMemory__block_invoke_2()
{
  return br_pacer_signal();
}

- (void)_invalidateLowMemory
{
  lowMemoryObservers = self->_lowMemoryObservers;
  self->_lowMemoryObservers = 0;

  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BRCSystemResourcesManager__invalidateLowMemory__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

void __49__BRCSystemResourcesManager__invalidateLowMemory__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 152);
  *(void *)(v4 + 152) = 0;
}

- (void)_didReceiveMemoryWarning
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Memory warning received%@", v2, v3, v4, v5, v6);
}

- (void)addLowMemoryObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__BRCSystemResourcesManager_addLowMemoryObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __50__BRCSystemResourcesManager_addLowMemoryObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) addObject:*(void *)(a1 + 40)];
}

- (void)removeLowMemoryObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__BRCSystemResourcesManager_removeLowMemoryObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __53__BRCSystemResourcesManager_removeLowMemoryObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) removeObject:*(void *)(a1 + 40)];
}

- (void)_initProcessObservers
{
  uint64_t v3 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  processObservers = self->_processObservers;
  self->_processObservers = v3;
}

- (void)_invalidateProcessObservers
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__BRCSystemResourcesManager__invalidateProcessObservers__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

void __56__BRCSystemResourcesManager__invalidateProcessObservers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "objectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) invalidate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 160);
  *(void *)(v7 + 160) = 0;
}

- (void)addProcessMonitor:(id)a3 forProcessID:(int)a4
{
  id v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BRCSystemResourcesManager_addProcessMonitor_forProcessID___block_invoke;
  block[3] = &unk_265083628;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_sync(notificationQueue, block);
}

void __60__BRCSystemResourcesManager_addProcessMonitor_forProcessID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:*(void *)(a1 + 40)];

  if (!v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F32608]) initForProcessID:*(unsigned int *)(a1 + 48) observer:*(void *)(a1 + 40)];
    if (v3)
    {
      uint64_t v4 = v3;
      [*(id *)(*(void *)(a1 + 32) + 160) setObject:v3 forKey:*(void *)(a1 + 40)];
      uint64_t v3 = v4;
    }
  }
}

- (void)_initAppListObservers
{
  uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  appListObservers = self->_appListObservers;
  self->_appListObservers = v3;

  notificationQueue = self->_notificationQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __50__BRCSystemResourcesManager__initAppListObservers__block_invoke;
  handler[3] = &unk_265081178;
  void handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", notificationQueue, handler);
}

void __50__BRCSystemResourcesManager__initAppListObservers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __50__BRCSystemResourcesManager__initAppListObservers__block_invoke_cold_1();
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "forceRefetchAppList", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_invalidateAppListObservers
{
  appListObservers = self->_appListObservers;
  self->_appListObservers = 0;
}

- (void)addAppListObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__BRCSystemResourcesManager_addAppListObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __48__BRCSystemResourcesManager_addAppListObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) addObject:*(void *)(a1 + 40)];
}

- (void)removeAppListObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__BRCSystemResourcesManager_removeAppListObserver___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

uint64_t __51__BRCSystemResourcesManager_removeAppListObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) removeObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appListObservers, 0);
  objc_storeStrong((id *)&self->_processObservers, 0);
  objc_storeStrong((id *)&self->_memoryNotificationCoalescePacer, 0);
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_lowMemoryObservers, 0);
  objc_storeStrong((id *)&self->_lowDiskTimer, 0);
  objc_storeStrong((id *)&self->_lowDiskSource, 0);
  objc_storeStrong((id *)&self->_lowDiskDict, 0);
  objc_storeStrong((id *)&self->_lowDiskSet, 0);
  objc_storeStrong((id *)&self->_connectedToPowerSourceCheckedDate, 0);
  objc_storeStrong((id *)&self->_powerLevelOKTimer, 0);
  objc_storeStrong((id *)&self->_powerObservers, 0);
  objc_storeStrong((id *)&self->_reachabilityStateUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_reachabilityObservers, 0);
  objc_storeStrong((id *)&self->_screenLockObservers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)init
{
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_4(v0);
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] [%@] has been initialized%@", v4, v5, v6, v7, v8);
}

void __34__BRCSystemResourcesManager_close__block_invoke_cold_1()
{
  os_log_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_4(v0);
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] [%@] has been invalidated%@", v4, v5, v6, v7, v8);
}

- (void)_setPowerLevel:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Power level really becomes %s%@");
}

- (void)addLowDiskObserver:forDevice:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: deviceID != 0%@", v1, 0xCu);
}

void __50__BRCSystemResourcesManager__initAppListObservers__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Received an app install notification%@", v2, v3, v4, v5, v6);
}

@end