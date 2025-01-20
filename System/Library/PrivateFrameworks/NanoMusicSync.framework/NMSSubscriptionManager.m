@interface NMSSubscriptionManager
+ (NMSSubscriptionManager)sharedManager;
- (BOOL)hasCapability:(unint64_t)a3;
- (NMSSubscriptionManager)init;
- (int64_t)subscriptionType;
- (unint64_t)subscriptionCapabilities;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_retrySubscriptionStatusRequest;
- (void)_updateActiveAccount;
- (void)_updateSubscriptionStatus;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
@end

@implementation NMSSubscriptionManager

+ (NMSSubscriptionManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NMSSubscriptionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, block);
  }
  v2 = (void *)sharedManager_instance;

  return (NMSSubscriptionManager *)v2;
}

uint64_t __39__NMSSubscriptionManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedManager_instance;
  sharedManager_instance = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (NMSSubscriptionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)NMSSubscriptionManager;
  v2 = [(NMSSubscriptionManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoMusicSync.NMSSubscriptionManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__NMSSubscriptionManager_init__block_invoke;
    block[3] = &unk_264633B20;
    v9 = v2;
    dispatch_async(v6, block);
  }
  return v2;
}

void __30__NMSSubscriptionManager_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFB210], "ic_sharedAccountStore");
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "ic_activeStoreAccount");
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v15 = [v8 objectForKey:@"CachedICSubscriptionStatusType"];

  uint64_t v9 = (uint64_t)v15;
  if (v15) {
    uint64_t v9 = [v15 integerValue];
  }
  *(void *)(*(void *)(a1 + 32) + 32) = v9;
  objc_super v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v11 = [v10 objectForKey:@"CachedSubscriptionCapabilitiesKey"];

  if (v11) {
    uint64_t v12 = [v11 unsignedIntegerValue];
  }
  else {
    uint64_t v12 = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 40) = v12;
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:*(void *)(a1 + 32) selector:sel__handleSubscriptionStatusDidChangeNotification_ name:*MEMORY[0x263F88F60] object:0];

  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:*(void *)(a1 + 32) selector:sel__handleAccountStoreDidChangeNotification_ name:*MEMORY[0x263EFB060] object:*(void *)(*(void *)(a1 + 32) + 16)];

  [*(id *)(a1 + 32) _updateSubscriptionStatus];
}

- (int64_t)subscriptionType
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__NMSSubscriptionManager_subscriptionType__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__NMSSubscriptionManager_subscriptionType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (unint64_t)subscriptionCapabilities
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__NMSSubscriptionManager_subscriptionCapabilities__block_invoke;
  v5[3] = &unk_264633AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__NMSSubscriptionManager_subscriptionCapabilities__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~[(NMSSubscriptionManager *)self subscriptionCapabilities]) == 0;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  if ([v4 isRemoteServerLikelyReachable]
    && [v4 isCurrentNetworkLinkHighQuality])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__NMSSubscriptionManager_environmentMonitorDidChangeNetworkReachability___block_invoke;
    block[3] = &unk_264633B20;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __73__NMSSubscriptionManager_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (!*(void *)(v2 + 32) || *(void *)(v2 + 48))
  {
    unint64_t v3 = NMLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[Subscription] Retrying get subscription status after remote server likely becoming reachable.", v4, 2u);
    }

    return [*(id *)(v1 + 32) _updateSubscriptionStatus];
  }
  return result;
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NMSSubscriptionManager__handleSubscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__NMSSubscriptionManager__handleSubscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Subscription] Received subscription status did change notification.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateSubscriptionStatus];
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NMSSubscriptionManager__handleAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __67__NMSSubscriptionManager__handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = NMLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "[Subscription] Received account store did change notification.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateActiveAccount];
}

- (void)_updateActiveAccount
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = [(ACAccountStore *)self->_accountStore ic_activeStoreAccount];
  uint64_t v4 = [(ACAccount *)v3 ic_DSID];
  uint64_t v5 = NMLogForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[Subscription] Active account is %@", buf, 0xCu);
  }

  activeAccount = self->_activeAccount;
  if (v3 != activeAccount)
  {
    uint64_t v7 = [(ACAccount *)activeAccount ic_DSID];
    uint64_t v8 = (void *)v7;
    if (v7 | v4)
    {
      BOOL v10 = v7 == 0;
      if (v4)
      {
        BOOL v11 = 1;
      }
      else
      {
        BOOL v10 = 0;
        BOOL v11 = v7 == 0;
      }
      if (!v11 || v10 || ([(id)v4 isEqualToNumber:v7] & 1) == 0)
      {
        uint64_t v12 = NMLogForCategory(5);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_activeAccount;
          *(_DWORD *)buf = 138412546;
          v19 = v13;
          __int16 v20 = 2112;
          v21 = v3;
          _os_log_impl(&dword_2228FD000, v12, OS_LOG_TYPE_DEFAULT, "[Subscription] Active account has changed from %@ to %@. Clearing subscription status.", buf, 0x16u);
        }

        objc_storeStrong((id *)&self->_activeAccount, v3);
        v14 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __46__NMSSubscriptionManager__updateActiveAccount__block_invoke;
        block[3] = &unk_264633B20;
        void block[4] = self;
        dispatch_async(v14, block);

        self->_subscriptionType = 0;
        id v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v15 removeObjectForKey:@"CachedICSubscriptionStatusType"];

        self->_subscriptionCapabilities = 0;
        v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v16 removeObjectForKey:@"CachedSubscriptionCapabilitiesKey"];

        [(NMSSubscriptionManager *)self _updateSubscriptionStatus];
      }
    }
    else
    {
      uint64_t v9 = NMLogForCategory(5);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "[Subscription] currentActiveAccountDSID == nil && newActiveAccountDSID == nil, exiting early", buf, 2u);
      }
    }
  }
}

void __46__NMSSubscriptionManager__updateActiveAccount__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSActiveAccountDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_updateSubscriptionStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[Subscription] Will get subscription status now", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F89208] sharedStatusController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke;
  v5[3] = &unk_264634AD8;
  v5[4] = self;
  [v4 getSubscriptionStatusWithCompletionHandler:v5];
}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_cold_1((uint64_t)v6, v7);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_19;
    v16[3] = &unk_264633B20;
    v16[4] = v8;
    BOOL v10 = v16;
  }
  else
  {
    uint64_t v11 = [v5 statusType];
    uint64_t v12 = [v5 capabilities];
    v13 = NMLogForCategory(5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = v12;
      _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[Subscription] Got subscription status with type: %ld, capabilities: %ld", buf, 0x16u);
    }

    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v14 + 8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_20;
    v15[3] = &unk_264634AB0;
    v15[4] = v14;
    v15[5] = v11;
    v15[6] = v12;
    BOOL v10 = v15;
  }
  dispatch_async(v9, v10);
}

uint64_t __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retrySubscriptionStatusRequest];
}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_20(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 48))
  {
    unint64_t v3 = [MEMORY[0x263F89110] sharedMonitor];
    [v3 unregisterObserver:a1[4]];

    uint64_t v2 = a1[4];
  }
  *(void *)(v2 + 48) = 0;
  uint64_t v4 = a1[4];
  if (a1[5] != *(void *)(v4 + 32))
  {
    id v5 = NMLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[5];
      uint64_t v7 = *(void *)(a1[4] + 32);
      *(_DWORD *)buf = 134218240;
      uint64_t v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[Subscription] Subscription status is updated from %ld to %ld", buf, 0x16u);
    }

    *(void *)(a1[4] + 32) = a1[5];
    uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v9 = [NSNumber numberWithInteger:a1[5]];
    [v8 setValue:v9 forKey:@"CachedICSubscriptionStatusType"];

    uint64_t v10 = a1[4];
    if (a1[6] == *(void *)(v10 + 40)) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (a1[6] != *(void *)(v4 + 40))
  {
LABEL_9:
    uint64_t v11 = NMLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1[4] + 40);
      uint64_t v13 = a1[6];
      *(_DWORD *)buf = 134218240;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "[Subscription] Subscription capabilities is updated from %ld to %ld", buf, 0x16u);
    }

    *(void *)(a1[4] + 40) = a1[6];
    uint64_t v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v15 = [NSNumber numberWithUnsignedInteger:a1[6]];
    [v14 setValue:v15 forKey:@"CachedSubscriptionCapabilitiesKey"];

    uint64_t v10 = a1[4];
LABEL_12:
    v16 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_23;
    block[3] = &unk_264633B20;
    void block[4] = v10;
    dispatch_async(v16, block);
  }
}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_23(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"NMSSubscriptionStatusDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_retrySubscriptionStatusRequest
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t failedGetSubscriptionStatusAttempts = self->_failedGetSubscriptionStatusAttempts;
  if (!failedGetSubscriptionStatusAttempts)
  {
    uint64_t v4 = [MEMORY[0x263F89110] sharedMonitor];
    [v4 registerObserver:self];

    unint64_t failedGetSubscriptionStatusAttempts = self->_failedGetSubscriptionStatusAttempts;
  }
  id v5 = (void *)(failedGetSubscriptionStatusAttempts + 1);
  self->_unint64_t failedGetSubscriptionStatusAttempts = failedGetSubscriptionStatusAttempts + 1;
  if (failedGetSubscriptionStatusAttempts + 1 < 6) {
    unint64_t v6 = failedGetSubscriptionStatusAttempts + 1;
  }
  else {
    unint64_t v6 = 6;
  }
  double v7 = pow(5.0, (double)v6);
  uint64_t v8 = NMLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = v7;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Subscription] Will retry get subscription status after %f seconds", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__NMSSubscriptionManager__retrySubscriptionStatusRequest__block_invoke;
  v11[3] = &unk_264634B00;
  objc_copyWeak(v12, (id *)buf);
  v12[1] = v5;
  dispatch_after(v9, queue, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

void __57__NMSSubscriptionManager__retrySubscriptionStatusRequest__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v3 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 6))
  {
    uint64_t v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Subscription] Retrying get subscription status (attempt #%lu).", (uint8_t *)&v6, 0xCu);
    }

    [v3 _updateSubscriptionStatus];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __51__NMSSubscriptionManager__updateSubscriptionStatus__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "[Subscription] Failed to get IC subscription status with error: %@", (uint8_t *)&v2, 0xCu);
}

@end