@interface VUINetworkReachabilityMonitor
+ (BOOL)_isNetworkReachable;
+ (id)sharedInstance;
- (BOOL)isNetworkReachable;
- (VUINetworkReachabilityMonitor)init;
- (id)_init;
- (id)networkReachabilityChangedNotificationToken;
- (id)networkTypeChangedNotificationToken;
- (void)_updateNetworkReachability;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)setNetworkReachabilityChangedNotificationToken:(id)a3;
- (void)setNetworkReachable:(BOOL)a3;
- (void)setNetworkTypeChangedNotificationToken:(id)a3;
@end

@implementation VUINetworkReachabilityMonitor

- (BOOL)isNetworkReachable
{
  return self->_networkReachable;
}

+ (id)sharedInstance
{
  if (sharedInstance___onceToken != -1) {
    dispatch_once(&sharedInstance___onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

- (void)setNetworkReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = VUICDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL networkReachable = self->_networkReachable;
    *(_DWORD *)buf = 67109376;
    BOOL v14 = networkReachable;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl(&dword_1E29E1000, v5, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- set network reachable -- before %d -- after %d", buf, 0xEu);
  }

  if (self->_networkReachable != v3)
  {
    self->_BOOL networkReachable = v3;
    v7 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"VUINetworkReachabilityMonitorNetworkReachabilityDidChangeUserInfoKeyNetworkReachable");
    v12 = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];

    v9 = VUICDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E29E1000, v9, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- Posting NetworkReachabilityDidChangeNotification", buf, 2u);
    }

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"VUINetworkReachabilityMonitorNetworkReachabilityDidChangeNotification" object:self userInfo:v8];
  }
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  v4 = VUICDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E29E1000, v4, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- network reachability changed", v5, 2u);
  }

  [(VUINetworkReachabilityMonitor *)self _updateNetworkReachability];
}

- (void)_updateNetworkReachability
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VUINetworkReachabilityMonitor__updateNetworkReachability__block_invoke;
  block[3] = &unk_1E6DDD328;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__VUINetworkReachabilityMonitor_sharedInstance__block_invoke()
{
  id v0 = [[VUINetworkReachabilityMonitor alloc] _init];
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)VUINetworkReachabilityMonitor;
  v2 = [(VUINetworkReachabilityMonitor *)&v5 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
    [v3 registerObserver:v2];

    v2->_BOOL networkReachable = [(id)objc_opt_class() _isNetworkReachable];
  }
  return v2;
}

uint64_t __59__VUINetworkReachabilityMonitor__updateNetworkReachability__block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() _isNetworkReachable];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setNetworkReachable:v2];
}

+ (BOOL)_isNetworkReachable
{
  uint64_t v2 = [MEMORY[0x1E4FB8618] sharedMonitor];
  char v3 = [v2 isRemoteServerLikelyReachable];

  return v3;
}

- (VUINetworkReachabilityMonitor)init
{
  char v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  objc_super v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  uint64_t v4 = VUICDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1E29E1000, v4, OS_LOG_TYPE_DEFAULT, "VUINetworkReachabilityMonitor -- network type changed", v5, 2u);
  }

  [(VUINetworkReachabilityMonitor *)self _updateNetworkReachability];
}

- (id)networkTypeChangedNotificationToken
{
  return self->_networkTypeChangedNotificationToken;
}

- (void)setNetworkTypeChangedNotificationToken:(id)a3
{
}

- (id)networkReachabilityChangedNotificationToken
{
  return self->_networkReachabilityChangedNotificationToken;
}

- (void)setNetworkReachabilityChangedNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkReachabilityChangedNotificationToken, 0);
  objc_storeStrong(&self->_networkTypeChangedNotificationToken, 0);
}

@end