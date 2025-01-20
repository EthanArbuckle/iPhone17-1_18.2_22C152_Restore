@interface WLKReachabilityMonitor
+ (id)sharedInstance;
- (BOOL)isNetworkReachable;
- (BOOL)isWifiEnabled;
- (WLKReachabilityMonitor)init;
- (id)_init;
- (void)_reachabilityDidChange:(id)a3;
- (void)_wifiDidChange:(id)a3;
- (void)dealloc;
@end

@implementation WLKReachabilityMonitor

- (BOOL)isNetworkReachable
{
  v2 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v3 = [v2 isNetworkReachable];

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___sharedManager;

  return v2;
}

- (void)_wifiDidChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [(WLKReachabilityMonitor *)self isWifiEnabled];
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKReachabilityMonitor - Wifi did change: %d", (uint8_t *)v6, 8u);
  }

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"WLKReachabilityMonitorWifiDidChange" object:self];
}

- (BOOL)isWifiEnabled
{
  v2 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  char v3 = [v2 isWiFiEnabled];

  return v3;
}

- (void)_reachabilityDidChange:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [(WLKReachabilityMonitor *)self isNetworkReachable];
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKReachabilityMonitor - Reachability did change: %d", (uint8_t *)v6, 8u);
  }

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"WLKReachabilityMonitorReachabilityDidChange" object:self];
}

uint64_t __40__WLKReachabilityMonitor_sharedInstance__block_invoke()
{
  sharedInstance___sharedManager = [[WLKReachabilityMonitor alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)WLKReachabilityMonitor;
  v2 = [(WLKReachabilityMonitor *)&v8 init];
  if (v2)
  {
    char v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKReachabilityMonitor - Adding reachability observers", v7, 2u);
    }

    v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
    [v4 addNetworkReachableObserver:v2 selector:sel__reachabilityDidChange_];

    v5 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
    [v5 addWiFiObserver:v2 selector:sel__wifiDidChange_];
  }
  return v2;
}

- (WLKReachabilityMonitor)init
{
  return 0;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v3 removeNetworkReachableObserver:self];

  v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v4 removeWiFiObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)WLKReachabilityMonitor;
  [(WLKReachabilityMonitor *)&v5 dealloc];
}

@end