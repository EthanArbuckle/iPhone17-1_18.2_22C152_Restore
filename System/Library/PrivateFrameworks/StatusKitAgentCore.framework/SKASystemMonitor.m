@interface SKASystemMonitor
+ (SKASystemMonitor)sharedInstance;
+ (id)logger;
- (BOOL)_deviceStillUnderFirstLock;
- (BOOL)isUnderFirstDataProtectionLock;
- (BOOL)underFirstLock;
- (NSHashTable)listeners;
- (SKASystemMonitor)init;
- (os_unfair_lock_s)ivarLock;
- (void)_deliverNotificationSelectorToListeners:(SEL)a3;
- (void)_listenForKeyBagChangeNotifications;
- (void)_updateLockState;
- (void)addListener:(id)a3;
- (void)removeListener:(id)a3;
- (void)setIvarLock:(os_unfair_lock_s)a3;
- (void)setListeners:(id)a3;
- (void)setUnderFirstLock:(BOOL)a3;
@end

@implementation SKASystemMonitor

- (SKASystemMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKASystemMonitor;
  v2 = [(SKASystemMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_ivarLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    listeners = v3->_listeners;
    v3->_listeners = (NSHashTable *)v4;

    v3->_underFirstLock = 0;
    [(SKASystemMonitor *)v3 _updateLockState];
    [(SKASystemMonitor *)v3 _listenForKeyBagChangeNotifications];
  }
  return v3;
}

+ (SKASystemMonitor)sharedInstance
{
  if (sharedInstance_creation != -1) {
    dispatch_once(&sharedInstance_creation, &__block_literal_global_28);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (SKASystemMonitor *)v2;
}

uint64_t __34__SKASystemMonitor_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SKASystemMonitor);
  return MEMORY[0x270F9A758]();
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  if (![(NSHashTable *)self->_listeners containsObject:v4]) {
    [(NSHashTable *)self->_listeners addObject:v4];
  }
  os_unfair_lock_unlock(&self->_ivarLock);
}

- (void)removeListener:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  [(NSHashTable *)self->_listeners removeObject:v5];

  os_unfair_lock_unlock(p_ivarLock);
}

- (BOOL)isUnderFirstDataProtectionLock
{
  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_underFirstLock;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)_listenForKeyBagChangeNotifications
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Error registering for mobile key bag notifications", v1, 2u);
}

void __55__SKASystemMonitor__listenForKeyBagChangeNotifications__block_invoke(int a1, int val)
{
  if (notify_is_valid_token(val))
  {
    id v2 = +[SKASystemMonitor sharedInstance];
    [v2 _updateLockState];
  }
}

- (BOOL)_deviceStillUnderFirstLock
{
  return (int)MKBDeviceUnlockedSinceBoot() < 1;
}

- (void)_updateLockState
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  BOOL v4 = [(SKASystemMonitor *)self _deviceStillUnderFirstLock];
  if (v4)
  {
    self->_BOOL underFirstLock = v4;
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    BOOL underFirstLock = self->_underFirstLock;
    self->_BOOL underFirstLock = v4;
    os_unfair_lock_unlock(p_ivarLock);
    if (underFirstLock)
    {
      [(SKASystemMonitor *)self _deliverNotificationSelectorToListeners:sel_systemDidLeaveFirstDataProtectionLock];
    }
  }
}

- (void)_deliverNotificationSelectorToListeners:(SEL)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v6 = [(NSHashTable *)self->_listeners allObjects];
  os_unfair_lock_unlock(p_ivarLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v13 = +[SKASystemMonitor logger];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = NSStringFromSelector(a3);
            *(_DWORD *)buf = 138412546;
            v20 = v14;
            __int16 v21 = 2112;
            v22 = v12;
            _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Delivering %@ to %@", buf, 0x16u);
          }
          [v12 performSelectorOnMainThread:a3 withObject:0 waitUntilDone:1];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v9);
  }
}

+ (id)logger
{
  if (logger_onceToken_28 != -1) {
    dispatch_once(&logger_onceToken_28, &__block_literal_global_8);
  }
  id v2 = (void *)logger__logger_28;
  return v2;
}

uint64_t __26__SKASystemMonitor_logger__block_invoke()
{
  logger__logger_28 = (uint64_t)os_log_create("com.apple.StatusKit", "SKASystemMonitor");
  return MEMORY[0x270F9A758]();
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (BOOL)underFirstLock
{
  return self->_underFirstLock;
}

- (void)setUnderFirstLock:(BOOL)a3
{
  self->_BOOL underFirstLock = a3;
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end