@interface BYNetworkMonitor
+ (BOOL)holdsWiFiAssertion;
+ (id)sharedInstance;
+ (void)setHoldsWiFiAssertion:(BOOL)a3;
- (BYNetworkMonitor)init;
- (int)_networkTypeFromFlags:(unsigned int)a3;
- (int)currentNetworkType;
- (void)_initNetworkObservation;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCurrentNetworkType:(int)a3;
- (void)withMinimumNetworkType:(int)a3 timeout:(double)a4 runBlock:(id)a5;
@end

@implementation BYNetworkMonitor

- (BYNetworkMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)BYNetworkMonitor;
  v2 = [(BYNetworkMonitor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    networkTypeBlocks = v2->_networkTypeBlocks;
    v2->_networkTypeBlocks = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("by-network-monitor network type", 0);
    networkTypeQueue = v2->_networkTypeQueue;
    v2->_networkTypeQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v2->_currentNetworkType = 0;
  }
  return v2;
}

- (void)dealloc
{
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    v4 = self->_reachability;
    Main = CFRunLoopGetMain();
    SCNetworkReachabilityUnscheduleFromRunLoop(v4, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_reachability);
  }
  v6.receiver = self;
  v6.super_class = (Class)BYNetworkMonitor;
  [(BYNetworkMonitor *)&v6 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_singletonPredicate != -1) {
    dispatch_once(&sharedInstance_singletonPredicate, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __34__BYNetworkMonitor_sharedInstance__block_invoke()
{
  sharedInstance___instance = objc_alloc_init(BYNetworkMonitor);
  return MEMORY[0x1F41817F8]();
}

- (int)currentNetworkType
{
  return self->_currentNetworkType;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable addObject:](self->_observers, "addObject:");
    [(BYNetworkMonitor *)self _initNetworkObservation];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)withMinimumNetworkType:(int)a3 timeout:(double)a4 runBlock:(id)a5
{
  v8 = (void (**)(id, void))a5;
  if (v8)
  {
    v9 = v8;
    if ([(BYNetworkMonitor *)self currentNetworkType] >= a3)
    {
      v9[2](v9, 0);
    }
    else
    {
      if (a3 == 1)
      {
        [(id)objc_opt_class() setHoldsWiFiAssertion:1];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke;
        v15[3] = &unk_1E5D2CD80;
        v15[4] = self;
        id v16 = v9;
        v9 = (void (**)(id, void))MEMORY[0x1AD0DBFE0](v15);
      }
      networkTypeQueue = self->_networkTypeQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_2;
      v11[3] = &unk_1E5D2CDD0;
      int v14 = a3;
      v11[4] = self;
      id v12 = v9;
      double v13 = a4;
      v9 = v9;
      dispatch_async(networkTypeQueue, v11);
    }
  }
}

uint64_t __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() setHoldsWiFiAssertion:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  v4 = [v2 objectForKeyedSubscript:v3];
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v7 = v6;

  v8 = *(void **)(*(void *)(a1 + 32) + 32);
  v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  [v8 setObject:v7 forKey:v9];

  objc_super v10 = (void *)MEMORY[0x1AD0DBFE0](*(void *)(a1 + 40));
  [v7 addObject:v10];

  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  uint64_t v12 = *(void *)(a1 + 32);
  double v13 = *(NSObject **)(v12 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_3;
  block[3] = &unk_1E5D2CDA8;
  block[4] = v12;
  int v16 = *(_DWORD *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  dispatch_after(v11, v13, block);
}

void __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v4 = [v2 objectForKeyedSubscript:v3];

  dispatch_queue_t v5 = (void *)MEMORY[0x1AD0DBFE0](*(void *)(a1 + 40));
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1AD0DBFE0](*(void *)(a1 + 40));
    [v4 removeObject:v7];

    v8 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_4;
    block[3] = &unk_1E5D2C028;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
}

uint64_t __60__BYNetworkMonitor_withMinimumNetworkType_timeout_runBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCurrentNetworkType:(int)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_currentNetworkType != a3)
  {
    dispatch_queue_t v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = @"Wifi";
      if (!a3) {
        int v6 = @"None";
      }
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      uint64_t v7 = v6;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Network type changed to: %{public}@", buf, 0xCu);
    }
    uint64_t currentNetworkType = self->_currentNetworkType;
    self->_uint64_t currentNetworkType = a3;
    v9 = [(NSHashTable *)self->_observers allObjects];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            [v14 networkChangedFromNetworkType:currentNetworkType toNetworkType:self->_currentNetworkType];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
    networkTypeQueue = self->_networkTypeQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke;
    v16[3] = &unk_1E5D2CDF8;
    int v17 = a3;
    v16[4] = self;
    dispatch_async(networkTypeQueue, v16);
  }
}

void __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  if ((v1 & 0x80000000) == 0)
  {
    uint64_t v2 = a1;
    uint64_t v16 = a1;
    do
    {
      uint64_t v3 = *(void **)(*(void *)(v2 + 32) + 32);
      v4 = objc_msgSend(NSNumber, "numberWithInt:", v1, v16);
      dispatch_queue_t v5 = [v3 objectForKeyedSubscript:v4];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
            uint64_t v12 = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke_2;
            block[3] = &unk_1E5D2C028;
            void block[4] = v11;
            dispatch_async(v12, block);

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }

      uint64_t v2 = v16;
      uint64_t v13 = *(void **)(*(void *)(v16 + 32) + 32);
      int v14 = [NSNumber numberWithInt:v1];
      [v13 removeObjectForKey:v14];

      BOOL v15 = (int)v1 <= 0;
      uint64_t v1 = (v1 - 1);
    }
    while (!v15);
  }
}

uint64_t __42__BYNetworkMonitor_setCurrentNetworkType___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_initNetworkObservation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (!self->_reachability)
  {
    v9[0] = @"nodename";
    v9[1] = @"ResolverBypass";
    v10[0] = @"www.apple.com";
    v10[1] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    v4 = (__SCNetworkReachability *)SCNetworkReachabilityCreateWithOptions();
    self->_reachability = v4;
    SCNetworkReachabilityFlags flags = 0;
    SCNetworkReachabilityGetFlags(v4, &flags);
    [(BYNetworkMonitor *)self setCurrentNetworkType:[(BYNetworkMonitor *)self _networkTypeFromFlags:flags]];
    v7.version = 0;
    memset(&v7.retain, 0, 24);
    v7.info = self;
    SCNetworkReachabilitySetCallback(self->_reachability, (SCNetworkReachabilityCallBack)_networkReachabilityCallback, &v7);
    reachability = self->_reachability;
    Main = CFRunLoopGetMain();
    SCNetworkReachabilityScheduleWithRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
  }
}

- (int)_networkTypeFromFlags:(unsigned int)a3
{
  return (a3 >> 1) & ~(a3 >> 18) & 1;
}

+ (BOOL)holdsWiFiAssertion
{
  return __assertionCount != 0;
}

+ (void)setHoldsWiFiAssertion:(BOOL)a3
{
  if (!MGGetBoolAnswer()) {
    return;
  }
  if (a3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    if (!__assertionCount) {
      goto LABEL_7;
    }
    uint64_t v4 = -1;
  }
  __assertionCount += v4;
LABEL_7:
  dispatch_queue_t v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[BYNetworkMonitor setHoldsWiFiAssertion:].cold.4(v5);
  }

  BOOL v6 = __assertionCount != 0;
  uint64_t v7 = __wifiManager;
  if (!__wifiManager)
  {
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v13 = (uint64_t (*)(void, BOOL))getWiFiManagerClientCreateSymbolLoc_ptr;
    long long v19 = getWiFiManagerClientCreateSymbolLoc_ptr;
    if (!getWiFiManagerClientCreateSymbolLoc_ptr)
    {
      int v14 = (void *)MobileWiFiLibrary();
      v17[3] = (uint64_t)dlsym(v14, "WiFiManagerClientCreate");
      getWiFiManagerClientCreateSymbolLoc_ptr = (_UNKNOWN *)v17[3];
      uint64_t v13 = (uint64_t (*)(void, BOOL))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (v13)
    {
      __wifiManager = v13(*MEMORY[0x1E4F1CF80], v6);
      return;
    }
LABEL_24:
    +[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
    goto LABEL_25;
  }
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v8 = (unsigned int (*)(uint64_t))getWiFiManagerClientGetTypeSymbolLoc_ptr;
  long long v19 = getWiFiManagerClientGetTypeSymbolLoc_ptr;
  if (!getWiFiManagerClientGetTypeSymbolLoc_ptr)
  {
    uint64_t v9 = (void *)MobileWiFiLibrary();
    v17[3] = (uint64_t)dlsym(v9, "WiFiManagerClientGetType");
    getWiFiManagerClientGetTypeSymbolLoc_ptr = (_UNKNOWN *)v17[3];
    uint64_t v8 = (unsigned int (*)(uint64_t))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    +[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
    goto LABEL_24;
  }
  if (v8(v7) != v6)
  {
    uint64_t v10 = __wifiManager;
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v11 = (void (*)(uint64_t, BOOL))getWiFiManagerClientSetTypeSymbolLoc_ptr;
    long long v19 = getWiFiManagerClientSetTypeSymbolLoc_ptr;
    if (!getWiFiManagerClientSetTypeSymbolLoc_ptr)
    {
      uint64_t v12 = (void *)MobileWiFiLibrary();
      v17[3] = (uint64_t)dlsym(v12, "WiFiManagerClientSetType");
      getWiFiManagerClientSetTypeSymbolLoc_ptr = (_UNKNOWN *)v17[3];
      uint64_t v11 = (void (*)(uint64_t, BOOL))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (v11)
    {
      v11(v10, v6);
      return;
    }
LABEL_25:
    BOOL v15 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTypeQueue, 0);
  objc_storeStrong((id *)&self->_networkTypeBlocks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)setHoldsWiFiAssertion:(os_log_t)log .cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = __assertionCount;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "WiFi background assertion count changed: %lu", (uint8_t *)&v1, 0xCu);
}

@end