@interface WCDistributedNotificationCenter
+ (WCDistributedNotificationCenter)defaultCenter;
- (NSHashTable)observers;
- (WCDistributedNotificationCenter)init;
- (os_unfair_lock_s)dataSynchronizationLock;
- (void)_notifyObserversOfPreferencesChange;
- (void)addObserver:(id)a3;
- (void)postWeatherLocationAuthorizationDidUpdateNotification;
- (void)postWeatherSavedLocationsDidUpdateNotification;
- (void)removeObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)weatherPrefsDidGetUpdated:(id)a3;
@end

@implementation WCDistributedNotificationCenter

+ (WCDistributedNotificationCenter)defaultCenter
{
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultCenter_sSharedInstance;
  return (WCDistributedNotificationCenter *)v2;
}

uint64_t __48__WCDistributedNotificationCenter_defaultCenter__block_invoke()
{
  defaultCenter_sSharedInstance = objc_alloc_init(WCDistributedNotificationCenter);
  return MEMORY[0x1F41817F8]();
}

- (WCDistributedNotificationCenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)WCDistributedNotificationCenter;
  v2 = [(WCDistributedNotificationCenter *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v6 addObserver:v3 selector:sel_weatherPrefsDidGetUpdated_ name:@"WeatherPrefPrefsToAppDidUpdateNotification" object:0 suspensionBehavior:2];

    v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v3 selector:sel_weatherPrefsDidGetUpdated_ name:@"WeatherGroupPrefsDidUpdateNotification" object:0 suspensionBehavior:2];
  }
  return v3;
}

- (void)postWeatherSavedLocationsDidUpdateNotification
{
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];
  [v4 postNotificationName:@"WeatherGroupPrefsDidUpdateNotification" object:v3 userInfo:0 deliverImmediately:1];
}

- (void)postWeatherLocationAuthorizationDidUpdateNotification
{
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];
  [v4 postNotificationName:@"WeatherPrefAppToPrefsDidUpdateNotification" object:v3 userInfo:0 deliverImmediately:1];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    id v5 = a3;
    os_unfair_lock_lock_with_options();
    v6 = [(WCDistributedNotificationCenter *)self observers];
    [v6 addObject:v5];

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    id v9 = v4;
    os_unfair_lock_lock_with_options();
    v6 = [(WCDistributedNotificationCenter *)self observers];
    int v7 = [v6 containsObject:v9];

    if (v7)
    {
      v8 = [(WCDistributedNotificationCenter *)self observers];
      [v8 removeObject:v9];
    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);
    id v4 = v9;
  }
}

- (void)weatherPrefsDidGetUpdated:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F80];
  id v5 = a3;
  v6 = [v4 processInfo];
  int v7 = [v6 processName];
  v8 = [v5 object];

  LOBYTE(v5) = [v7 isEqualToString:v8];
  if ((v5 & 1) == 0)
  {
    [(WCDistributedNotificationCenter *)self _notifyObserversOfPreferencesChange];
  }
}

- (void)_notifyObserversOfPreferencesChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(WCDistributedNotificationCenter *)self observers];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "sharedPreferencesChangedExternally", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
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
}

@end