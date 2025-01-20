@interface MTAgentNotificationManager
+ (double)_schedulingAssertionTimeout;
+ (double)defaultAssertionTimeOutForNotification:(id)a3 type:(int64_t)a4;
- (MTAgentNotificationManager)init;
- (NAScheduler)serializer;
- (NSMutableArray)listeners;
- (void)_handleNotificationWithName:(id)a3 type:(int64_t)a4;
- (void)_registerForAlarmNotifications;
- (void)_registerForDarwinNotifications;
- (void)_registerForDistributedNotifications;
- (void)_registerForLiveDarwinNotification:(id)a3;
- (void)_registerForXPCStream:(id)a3 notificationType:(int64_t)a4;
- (void)beginListening;
- (void)dealloc;
- (void)registerListener:(id)a3;
- (void)setListeners:(id)a3;
- (void)setSerializer:(id)a3;
@end

@implementation MTAgentNotificationManager

- (MTAgentNotificationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTAgentNotificationManager;
  v2 = [(MTAgentNotificationManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTNotificationManager.serialqueue", +[MTScheduler defaultPriority]);
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)registerListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTAgentNotificationManager *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MTAgentNotificationManager_registerListener___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __47__MTAgentNotificationManager_registerListener___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    uint64_t v19 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ registered %{public}@", buf, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) listeners];
  [v5 addObject:*(void *)(a1 + 40)];

  if (objc_opt_respondsToSelector())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 40), "liveDarwinNotifications", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(a1 + 32) _registerForLiveDarwinNotification:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)beginListening
{
  [(MTAgentNotificationManager *)self _registerForDistributedNotifications];
  [(MTAgentNotificationManager *)self _registerForDarwinNotifications];
  [(MTAgentNotificationManager *)self _registerForAlarmNotifications];
}

- (void)_registerForDistributedNotifications
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for distributed notifications", (uint8_t *)&v4, 0xCu);
  }

  [(MTAgentNotificationManager *)self _registerForXPCStream:@"com.apple.distnoted.matching" notificationType:1];
}

- (void)_registerForDarwinNotifications
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for darwin notifications", (uint8_t *)&v4, 0xCu);
  }

  [(MTAgentNotificationManager *)self _registerForXPCStream:@"com.apple.notifyd.matching" notificationType:0];
}

- (void)_registerForAlarmNotifications
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for alarm notifications", (uint8_t *)&v4, 0xCu);
  }

  [(MTAgentNotificationManager *)self _registerForXPCStream:@"com.apple.alarm" notificationType:2];
}

- (void)_registerForLiveDarwinNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = (__CFString *)a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for darwin notification %{public}@", (uint8_t *)&v7, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleLiveNotification, v4, self, CFNotificationSuspensionBehaviorDrop);
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(MTAgentNotificationManager *)self listeners];
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v21 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t v8 = [v7 liveDarwinNotifications];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v18;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v18 != v11) {
                  objc_enumerationMutation(v8);
                }
                CFStringRef v13 = *(const __CFString **)(*((void *)&v17 + 1) + 8 * v12);
                DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
                CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v13, 0);
                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v10);
          }
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  v16.receiver = self;
  v16.super_class = (Class)MTAgentNotificationManager;
  [(MTAgentNotificationManager *)&v16 dealloc];
}

- (void)_registerForXPCStream:(id)a3 notificationType:(int64_t)a4
{
  uint64_t v6 = (const char *)[a3 UTF8String];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__MTAgentNotificationManager__registerForXPCStream_notificationType___block_invoke;
  v7[3] = &unk_1E5915230;
  v7[4] = self;
  void v7[5] = a4;
  xpc_set_event_stream_handler(v6, MEMORY[0x1E4F14428], v7);
}

void __69__MTAgentNotificationManager__registerForXPCStream_notificationType___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]), 1);
  uint64_t v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received notification %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) _handleNotificationWithName:v3 type:*(void *)(a1 + 40)];
}

- (void)_handleNotificationWithName:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(MTAgentNotificationManager *)self serializer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke;
  v9[3] = &unk_1E5915258;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 performBlock:v9];
}

void __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [*(id *)(a1 + 32) listeners];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v6 handlesNotification:*(void *)(a1 + 40) ofType:*(void *)(a1 + 48)])
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || ([v6 assertionTimeOutForNotification:*(void *)(a1 + 40) ofType:*(void *)(a1 + 48)],
                v7 == 0.0))
          {
            [(id)objc_opt_class() defaultAssertionTimeOutForNotification:*(void *)(a1 + 40) type:*(void *)(a1 + 48)];
          }
          id v8 = +[MTAgentNotification notificationWithType:name:powerAssertionTimeout:](MTAgentNotification, "notificationWithType:name:powerAssertionTimeout:", *(void *)(a1 + 48), *(void *)(a1 + 40));
          uint64_t v9 = *(void *)(a1 + 40);
          uint64_t v10 = *(void *)(a1 + 48);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke_2;
          v13[3] = &unk_1E59150A8;
          id v14 = v8;
          id v11 = v8;
          [v6 handleNotification:v9 ofType:v10 completion:v13];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseAssertion];
}

+ (double)defaultAssertionTimeOutForNotification:(id)a3 type:(int64_t)a4
{
  if (a4 != 2) {
    return 0.0;
  }
  objc_msgSend(a1, "_schedulingAssertionTimeout", a3);
  return result;
}

+ (double)_schedulingAssertionTimeout
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MTAgentNotificationManager__schedulingAssertionTimeout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_schedulingAssertionTimeout_onceToken != -1) {
    dispatch_once(&_schedulingAssertionTimeout_onceToken, block);
  }
  return *(double *)&_schedulingAssertionTimeout_assertionTimeout;
}

void __57__MTAgentNotificationManager__schedulingAssertionTimeout__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MTUserDefaults sharedUserDefaults];
  uint64_t v3 = MTIntegerIsPositive();
  *(double *)&_schedulingAssertionTimeout_assertionTimeout = (double)[v2 integerForKey:@"SchedulingAssertionTimeout" isValid:v3 defaultValue:(uint64_t)*(double *)&_schedulingAssertionTimeout_assertionTimeout];

  uint64_t v4 = MTLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 1026;
    int v9 = (int)*(double *)&_schedulingAssertionTimeout_assertionTimeout;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Using a scheduling power assertion timeout of %{public}d", (uint8_t *)&v6, 0x12u);
  }
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end