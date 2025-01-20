@interface TVPReachabilityMonitor
+ (id)sharedInstance;
- (BOOL)isNetworkReachable;
- (BOOL)isWifiEnabled;
- (TVPReachabilityMonitor)init;
- (id)_init;
- (unint64_t)networkType;
- (void)_reachabilityDidChange:(id)a3;
- (void)_wifiDidChange:(id)a3;
- (void)dealloc;
@end

@implementation TVPReachabilityMonitor

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___sharedManager;
  return v2;
}

uint64_t __40__TVPReachabilityMonitor_sharedInstance__block_invoke()
{
  sharedInstance___sharedManager = [[TVPReachabilityMonitor alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (TVPReachabilityMonitor)init
{
  return 0;
}

- (id)_init
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)TVPReachabilityMonitor;
  v2 = [(TVPReachabilityMonitor *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F255C0] sharedNetworkObserver];
    [v3 addNetworkReachableObserver:v2 selector:sel__reachabilityDidChange_];

    v4 = [MEMORY[0x263F255C0] sharedNetworkObserver];
    [v4 addWiFiObserver:v2 selector:sel__wifiDidChange_];

    sockaddr address = (sockaddr)xmmword_23702FB50;
    v2->_reachability = SCNetworkReachabilityCreateWithAddress(0, &address);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F255C0] sharedNetworkObserver];
  [v3 removeNetworkReachableObserver:self];

  v4 = [MEMORY[0x263F255C0] sharedNetworkObserver];
  [v4 removeWiFiObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)TVPReachabilityMonitor;
  [(TVPReachabilityMonitor *)&v5 dealloc];
}

- (void)_reachabilityDidChange:(id)a3
{
  SCNetworkReachabilityFlags flags = 0;
  SCNetworkReachabilityGetFlags(self->_reachability, &flags);
  v4 = self;
  objc_sync_enter(v4);
  if ((flags & 0x40000) != 0)
  {
    v4->_networkType = 2;
    objc_sync_exit(v4);
  }
  else
  {
    v4->_networkType = ((unint64_t)flags >> 1) & 1;
    objc_sync_exit(v4);

    objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
    [(TVPReachabilityMonitor *)v5 postNotificationName:@"TVPReachabilityMonitorReachabilityDidChange" object:v4];
    v4 = v5;
  }
}

- (void)_wifiDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"TVPReachabilityMonitorWifiDidChange" object:self];
}

- (BOOL)isNetworkReachable
{
  v2 = [MEMORY[0x263F255C0] sharedNetworkObserver];
  char v3 = [v2 isNetworkReachable];

  return v3;
}

- (BOOL)isWifiEnabled
{
  v2 = [MEMORY[0x263F255C0] sharedNetworkObserver];
  char v3 = [v2 isWiFiEnabled];

  return v3;
}

- (unint64_t)networkType
{
  return self->_networkType;
}

@end