@interface FCNewsAvailabilityMonitor
- (BOOL)_isNewsAvailable;
- (BOOL)isNewsAvailable;
- (FCNewsAvailabilityMonitor)init;
- (FCNewsAvailabilityMonitor)initWithApplicationProxy:(id)a3 queue:(id)a4;
- (FCNewsAvailabilityMonitor)initWithProcessVariant:(unint64_t)a3;
- (FCNewsAvailabilityMonitor)initWithProcessVariant:(unint64_t)a3 queue:(id)a4;
- (LSApplicationProxy)applicationProxy;
- (NSMutableArray)blocks;
- (OS_dispatch_queue)queue;
- (void)_updateAvailability;
- (void)addNotificationBlock:(id)a3;
- (void)dealloc;
- (void)setApplicationProxy:(id)a3;
- (void)setBlocks:(id)a3;
- (void)setNewsIsAvailable:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation FCNewsAvailabilityMonitor

- (FCNewsAvailabilityMonitor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNewsAvailabilityMonitor init]";
    __int16 v9 = 2080;
    v10 = "FCNewsAvailabilityMonitor.m";
    __int16 v11 = 1024;
    int v12 = 60;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNewsAvailabilityMonitor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCNewsAvailabilityMonitor)initWithApplicationProxy:(id)a3 queue:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "applicationProxy");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCNewsAvailabilityMonitor initWithApplicationProxy:queue:]";
    __int16 v22 = 2080;
    v23 = "FCNewsAvailabilityMonitor.m";
    __int16 v24 = 1024;
    int v25 = 65;
    __int16 v26 = 2114;
    v27 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "queue");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCNewsAvailabilityMonitor initWithApplicationProxy:queue:]";
    __int16 v22 = 2080;
    v23 = "FCNewsAvailabilityMonitor.m";
    __int16 v24 = 1024;
    int v25 = 66;
    __int16 v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)FCNewsAvailabilityMonitor;
  v8 = [(FCNewsAvailabilityMonitor *)&v19 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    blocks = v8->_blocks;
    v8->_blocks = (NSMutableArray *)v9;

    uint64_t v11 = [v6 copy];
    applicationProxy = v8->_applicationProxy;
    v8->_applicationProxy = (LSApplicationProxy *)v11;

    objc_storeStrong((id *)&v8->_queue, a4);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v8, (CFNotificationCallback)applicationStateNotificationCallback, @"com.apple.LaunchServices.applicationStateChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v14 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v14, v8, (CFNotificationCallback)applicationRegisteredAndUnregisteredNotificationCallback, @"com.apple.LaunchServices.applicationRegistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v15 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v15, v8, (CFNotificationCallback)applicationRegisteredAndUnregisteredNotificationCallback, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(FCNewsAvailabilityMonitor *)v8 _updateAvailability];
  }

  return v8;
}

- (FCNewsAvailabilityMonitor)initWithProcessVariant:(unint64_t)a3 queue:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "queue");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCNewsAvailabilityMonitor initWithProcessVariant:queue:]";
    __int16 v18 = 2080;
    objc_super v19 = "FCNewsAvailabilityMonitor.m";
    __int16 v20 = 1024;
    int v21 = 104;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a3 - 1 >= 2)
  {
    if (a3)
    {
      id v7 = 0;
    }
    else
    {
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
      v10 = FCCheckedDynamicCast(v8, (uint64_t)v9);

      uint64_t v11 = (objc_class *)objc_opt_class();
      int v12 = [v10 containingBundle];
      id v7 = FCCheckedDynamicCast(v11, (uint64_t)v12);
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.news"];
  }
  __int16 v13 = [(FCNewsAvailabilityMonitor *)self initWithApplicationProxy:v7 queue:v6];

  return v13;
}

- (FCNewsAvailabilityMonitor)initWithProcessVariant:(unint64_t)a3
{
  return [(FCNewsAvailabilityMonitor *)self initWithProcessVariant:a3 queue:MEMORY[0x1E4F14428]];
}

- (void)setNewsIsAvailable:(BOOL)a3
{
  self->_NewsIsAvailable = a3;
}

- (void)dealloc
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)FCNewsAvailabilityMonitor;
  [(FCNewsAvailabilityMonitor *)&v4 dealloc];
}

- (BOOL)isNewsAvailable
{
  return self->_NewsIsAvailable;
}

- (void)addNotificationBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "notificationBlock");
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "-[FCNewsAvailabilityMonitor addNotificationBlock:]";
    __int16 v10 = 2080;
    uint64_t v11 = "FCNewsAvailabilityMonitor.m";
    __int16 v12 = 1024;
    int v13 = 162;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCNewsAvailabilityMonitor *)self blocks];
  id v6 = _Block_copy(v4);
  [v5 addObject:v6];
}

- (void)_updateAvailability
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int NewsIsAvailable = self->_NewsIsAvailable;
  int v4 = [(FCNewsAvailabilityMonitor *)self _isNewsAvailable];
  if (NewsIsAvailable != v4)
  {
    self->_int NewsIsAvailable = v4;
    v5 = [(FCNewsAvailabilityMonitor *)self blocks];
    id v6 = (void *)[v5 copy];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)_isNewsAvailable
{
  v2 = [(FCNewsAvailabilityMonitor *)self applicationProxy];
  v3 = [v2 appState];

  if ([v3 isRestricted]) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 isInstalled];
  }

  return v4;
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void)setBlocks:(id)a3
{
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (void)setApplicationProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end