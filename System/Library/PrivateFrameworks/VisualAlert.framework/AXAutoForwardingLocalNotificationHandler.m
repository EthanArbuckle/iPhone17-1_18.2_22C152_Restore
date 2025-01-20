@interface AXAutoForwardingLocalNotificationHandler
- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 possibleHandlers:(SEL)a6;
- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 startObserving:(BOOL)a6;
- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 handler:(SEL)a5;
- (BOOL)_handleForwardDistributedNotificationWithName:(id)a3 object:(const void *)a4 userInfo:(id)a5;
- (id)_forwardDistributedNotificationNameForHandler:(SEL)a3;
- (id)_notificationTypeDescription;
- (id)_prefixForForwardDistributedNotificationName;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)processHandler:(SEL)a3;
@end

@implementation AXAutoForwardingLocalNotificationHandler

- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 handler:(SEL)a5
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__AXAutoForwardingLocalNotificationHandler_initWithNotificationName_target_handler___block_invoke;
  v6[3] = &__block_descriptor_40_e40__32__0__NSString_8r_v16__NSDictionary_24l;
  v6[4] = a5;
  return -[AXAutoForwardingLocalNotificationHandler initWithNotificationName:target:dispatcher:possibleHandlers:](self, "initWithNotificationName:target:dispatcher:possibleHandlers:", a3, a4, v6, a5, 0);
}

uint64_t __84__AXAutoForwardingLocalNotificationHandler_initWithNotificationName_target_handler___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 startObserving:(BOOL)a6
{
  v7 = (void *)MEMORY[0x263EFF940];
  uint64_t v8 = *MEMORY[0x263EFF488];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = NSStringFromSelector(a2);
  v12 = NSStringFromSelector(sel_initWithNotificationName_target_dispatcher_possibleHandlers_);
  [v7 raise:v8, @"Can't initialize an instance of %@ with initializer %@. If you need to provide a complex dispatcher (i.e. if you have more than 1 possible handler), you need to use %@ and provide a list of all the handler selectors that might be returned by your dispatcher.", v10, v11, v12 format];

  return 0;
}

- (AXAutoForwardingLocalNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 possibleHandlers:(SEL)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  v7 = [(VISAXNotificationHandler *)&v28 initWithNotificationName:a3 target:a4 dispatcher:a5 startObserving:0];
  if (v7)
  {
    v27 = 0;
    if (a6)
    {
      size_t v8 = 0;
      unint64_t v9 = 0;
      v27 = (SEL *)&v32;
      do
      {
        v10 = v27++;
        ++v9;
        v8 += 8;
      }
      while (*v10);
      if (v9)
      {
        v11 = (SEL *)malloc_type_malloc(v8, 0xCEE6D6EEuLL);
        v7->_possibleHandlers = v11;
        if (v11)
        {
          SEL *v11 = a6;
          v27 = (SEL *)&v32;
          if (v9 >= 2)
          {
            unint64_t v12 = v9 - 1;
            uint64_t v13 = 1;
            do
            {
              v14 = v27++;
              v7->_possibleHandlers[v13++] = *v14;
              --v12;
            }
            while (v12);
          }
          v7->_possibleHandlersCount = v9;
        }
      }
    }
    v15 = [MEMORY[0x263F22988] sharedInstance];
    char v16 = [v15 ignoreLogging];

    if ((v16 & 1) == 0)
    {
      v17 = [MEMORY[0x263F22988] identifier];
      v18 = AXLoggerForFacility();

      os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = AXColorizeFormatLog();
        v21 = [(AXAutoForwardingLocalNotificationHandler *)v7 _notificationTypeDescription];
        [(VISAXNotificationHandler *)v7 _notificationName];
        v26 = v25 = v21;
        v24 = v7;
        v22 = _AXStringForArgs();

        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v22;
          _os_log_impl(&dword_22D39A000, v18, v19, "%{public}@", buf, 0xCu);
        }
      }
    }
    [(AXAutoForwardingLocalNotificationHandler *)v7 _startObserving];
    v7->super.super._valid = 1;
  }
  return v7;
}

- (void)dealloc
{
  [(VISAXNotificationHandler *)self invalidate];
  possibleHandlers = self->_possibleHandlers;
  if (possibleHandlers) {
    free(possibleHandlers);
  }
  v4.receiver = self;
  v4.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  [(VISAXNotificationHandler *)&v4 dealloc];
}

- (void)processHandler:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  -[VISAXNotificationHandler processHandler:](&v14, sel_processHandler_);
  if (AXProcessIsSpringBoard())
  {
    v5 = [(AXAutoForwardingLocalNotificationHandler *)self _forwardDistributedNotificationNameForHandler:a3];
    v6 = [MEMORY[0x263F22988] sharedInstance];
    char v7 = [v6 ignoreLogging];

    if ((v7 & 1) == 0)
    {
      size_t v8 = [MEMORY[0x263F22988] identifier];
      unint64_t v9 = AXLoggerForFacility();

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = AXColorizeFormatLog();
        unint64_t v12 = _AXStringForArgs();
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)buf = 138543362;
          char v16 = v12;
          _os_log_impl(&dword_22D39A000, v9, v10, "%{public}@", buf, 0xCu);
        }
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v5, 0, 0, 1u);
  }
}

- (id)_prefixForForwardDistributedNotificationName
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(VISAXNotificationHandler *)self _notificationName];
  char v7 = [(VISAXNotificationHandler *)self _target];
  size_t v8 = (objc_class *)objc_opt_class();
  unint64_t v9 = NSStringFromClass(v8);
  os_log_type_t v10 = [v3 stringWithFormat:@"%@__%@__%@__", v5, v6, v9];

  return v10;
}

- (id)_forwardDistributedNotificationNameForHandler:(SEL)a3
{
  objc_super v4 = NSString;
  v5 = [(AXAutoForwardingLocalNotificationHandler *)self _prefixForForwardDistributedNotificationName];
  v6 = NSStringFromSelector(a3);
  char v7 = [v4 stringWithFormat:@"%@%@", v5, v6];

  return v7;
}

- (BOOL)_handleForwardDistributedNotificationWithName:(id)a3 object:(const void *)a4 userInfo:(id)a5
{
  id v6 = a3;
  char v7 = [(AXAutoForwardingLocalNotificationHandler *)self _prefixForForwardDistributedNotificationName];
  if (![v6 hasPrefix:v7]) {
    goto LABEL_5;
  }
  objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length"));
  size_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v9 = NSSelectorFromString(v8);
  if (!v9)
  {

LABEL_5:
    _AXAssert();
    BOOL v10 = 0;
    goto LABEL_6;
  }
  [(AXAutoForwardingLocalNotificationHandler *)self processHandler:v9];

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)_startObserving
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (AXProcessIsSpringBoard())
  {
    v15.receiver = self;
    v15.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
    [(AXLocalNotificationHandler *)&v15 _startObserving];
  }
  else if (self->_possibleHandlers && self->_possibleHandlersCount)
  {
    unint64_t v3 = 0;
    do
    {
      -[AXAutoForwardingLocalNotificationHandler _forwardDistributedNotificationNameForHandler:](self, "_forwardDistributedNotificationNameForHandler:", self->_possibleHandlers[v3], v13, v14);
      objc_super v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = [MEMORY[0x263F22988] sharedInstance];
      char v6 = [v5 ignoreLogging];

      if ((v6 & 1) == 0)
      {
        char v7 = [MEMORY[0x263F22988] identifier];
        size_t v8 = AXLoggerForFacility();

        os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v8, v9))
        {
          BOOL v10 = AXColorizeFormatLog();
          uint64_t v13 = self;
          objc_super v14 = v4;
          v11 = _AXStringForArgs();
          if (os_log_type_enabled(v8, v9))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v17 = v11;
            _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
          }
        }
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)self->super.super._observerIdentifier, (CFNotificationCallback)_HandleDistributedNotification, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

      ++v3;
    }
    while (v3 < self->_possibleHandlersCount);
  }
}

- (void)_stopObserving
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (AXProcessIsSpringBoard())
  {
    v15.receiver = self;
    v15.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
    [(AXLocalNotificationHandler *)&v15 _stopObserving];
  }
  else if (self->_possibleHandlersCount)
  {
    unint64_t v3 = 0;
    do
    {
      -[AXAutoForwardingLocalNotificationHandler _forwardDistributedNotificationNameForHandler:](self, "_forwardDistributedNotificationNameForHandler:", self->_possibleHandlers[v3], v13, v14);
      objc_super v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = [MEMORY[0x263F22988] sharedInstance];
      char v6 = [v5 ignoreLogging];

      if ((v6 & 1) == 0)
      {
        char v7 = [MEMORY[0x263F22988] identifier];
        size_t v8 = AXLoggerForFacility();

        os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v8, v9))
        {
          BOOL v10 = AXColorizeFormatLog();
          uint64_t v13 = self;
          objc_super v14 = v4;
          v11 = _AXStringForArgs();
          if (os_log_type_enabled(v8, v9))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v17 = v11;
            _os_log_impl(&dword_22D39A000, v8, v9, "%{public}@", buf, 0xCu);
          }
        }
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)self->super.super._observerIdentifier, v4, 0);

      ++v3;
    }
    while (v3 < self->_possibleHandlersCount);
  }
}

- (id)_notificationTypeDescription
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)AXAutoForwardingLocalNotificationHandler;
  unint64_t v3 = [(AXLocalNotificationHandler *)&v6 _notificationTypeDescription];
  objc_super v4 = [v2 stringWithFormat:@"auto-forwarding %@", v3];

  return v4;
}

@end