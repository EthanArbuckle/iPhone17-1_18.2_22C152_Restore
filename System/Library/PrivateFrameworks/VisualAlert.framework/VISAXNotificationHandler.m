@interface VISAXNotificationHandler
+ (id)_safelyGetObserverForIdentifier:(unint64_t)a3;
+ (unint64_t)_safelyRegisterObserver:(id)a3;
+ (void)_safelyRemoveObserverForIdentifier:(unint64_t)a3;
- (BOOL)isValid;
- (NSString)_notificationName;
- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5;
- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 startObserving:(BOOL)a6;
- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 handler:(SEL)a5;
- (id)_dispatcher;
- (id)_notificationTypeDescription;
- (id)_target;
- (id)description;
- (void)_handleNotificationWithName:(id)a3 object:(const void *)a4 userInfo:(id)a5;
- (void)_setDispatcher:(id)a3;
- (void)_setNotificationName:(id)a3;
- (void)_setTarget:(id)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)invalidate;
- (void)processHandler:(SEL)a3;
@end

@implementation VISAXNotificationHandler

- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 handler:(SEL)a5
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__VISAXNotificationHandler_initWithNotificationName_target_handler___block_invoke;
  v6[3] = &__block_descriptor_40_e40__32__0__NSString_8r_v16__NSDictionary_24l;
  v6[4] = a5;
  return [(VISAXNotificationHandler *)self initWithNotificationName:a3 target:a4 dispatcher:v6];
}

uint64_t __68__VISAXNotificationHandler_initWithNotificationName_target_handler___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5
{
  return [(VISAXNotificationHandler *)self initWithNotificationName:a3 target:a4 dispatcher:a5 startObserving:1];
}

- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 startObserving:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VISAXNotificationHandler;
  v13 = [(VISAXNotificationHandler *)&v27 init];
  v14 = v13;
  if (v13)
  {
    [(VISAXNotificationHandler *)v13 _setNotificationName:v10];
    [(VISAXNotificationHandler *)v14 _setTarget:v11];
    [(VISAXNotificationHandler *)v14 _setDispatcher:v12];
    v14->_observerIdentifier = [(id)objc_opt_class() _safelyRegisterObserver:v14];
    if (v6)
    {
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
          v21 = [(VISAXNotificationHandler *)v14 _notificationTypeDescription];
          [(VISAXNotificationHandler *)v14 _notificationName];
          v26 = v25 = v21;
          v24 = v14;
          v22 = _AXStringForArgs();

          if (os_log_type_enabled(v18, v19))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v22;
            _os_log_impl(&dword_22D39A000, v18, v19, "%{public}@", buf, 0xCu);
          }
        }
      }
      [(VISAXNotificationHandler *)v14 _startObserving];
      v14->_valid = 1;
    }
  }

  return v14;
}

- (void)dealloc
{
  [(VISAXNotificationHandler *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VISAXNotificationHandler;
  [(VISAXNotificationHandler *)&v3 dealloc];
}

- (id)_dispatcher
{
  v2 = (void *)MEMORY[0x230F7CF50](self->_dispatcher, a2);
  return v2;
}

- (void)_setDispatcher:(id)a3
{
  id v4 = a3;
  id dispatcher = self->_dispatcher;
  if (dispatcher != v4)
  {
    id v6 = v4;
    if (v4)
    {
      id v4 = (id)[v4 copy];
      id dispatcher = self->_dispatcher;
    }
    self->_id dispatcher = v4;

    id v4 = v6;
  }
}

- (id)description
{
  objc_super v3 = [(VISAXNotificationHandler *)self _target];
  id v4 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VISAXNotificationHandler;
  v5 = [(VISAXNotificationHandler *)&v10 description];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@ (target: <%@: %p>)", v5, v7, v3];

  return v8;
}

- (void)invalidate
{
}

uint64_t __38__VISAXNotificationHandler_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) _stopObserving];
    objc_super v3 = [MEMORY[0x263F22988] sharedInstance];
    char v4 = [v3 ignoreLogging];

    if ((v4 & 1) == 0)
    {
      v5 = [MEMORY[0x263F22988] identifier];
      id v6 = AXLoggerForFacility();

      os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = AXColorizeFormatLog();
        v9 = [*(id *)(a1 + 32) _notificationTypeDescription];
        id v11 = [*(id *)(a1 + 32) _notificationName];
        objc_super v10 = _AXStringForArgs();

        if (os_log_type_enabled(v6, v7))
        {
          *(_DWORD *)buf = 138543362;
          v13 = v10;
          _os_log_impl(&dword_22D39A000, v6, v7, "%{public}@", buf, 0xCu);
        }
      }
    }
    [(id)objc_opt_class() _safelyRemoveObserverForIdentifier:*(void *)(*(void *)(a1 + 32) + 32)];
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    [*(id *)(a1 + 32) _setNotificationName:0];
    [*(id *)(a1 + 32) _setTarget:0];
    uint64_t result = [*(id *)(a1 + 32) _setDispatcher:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  }
  return result;
}

- (void)processHandler:(SEL)a3
{
}

void __43__VISAXNotificationHandler_processHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F22988] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    char v4 = [MEMORY[0x263F22988] identifier];
    v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = AXColorizeFormatLog();
      uint64_t v8 = *(void *)(a1 + 32);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v11 = v8;
      v9 = _AXStringForArgs();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_impl(&dword_22D39A000, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  objc_super v10 = objc_msgSend(*(id *)(a1 + 32), "_target", v11, v12, v13);
  [v10 performSelector:*(void *)(a1 + 40) withObject:0];
}

- (void)_handleNotificationWithName:(id)a3 object:(const void *)a4 userInfo:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  id dispatcher = (uint64_t (**)(id, id, const void *, id))self->_dispatcher;
  if (dispatcher)
  {
    uint64_t v10 = dispatcher[2](dispatcher, v11, a4, v8);
    if (v10) {
      [(VISAXNotificationHandler *)self processHandler:v10];
    }
  }
}

+ (unint64_t)_safelyRegisterObserver:(id)a3
{
  uint64_t v6 = 0;
  os_log_type_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v5 = a3;
  AXPerformBlockSynchronouslyOnMainThread();
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__VISAXNotificationHandler__safelyRegisterObserver___block_invoke(uint64_t a1)
{
  if (!_AXNotificationHandlerListenerIdentifiers)
  {
    uint64_t v2 = objc_opt_new();
    unint64_t v3 = (void *)_AXNotificationHandlerListenerIdentifiers;
    _AXNotificationHandlerListenerIdentifiers = v2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = ++_AXNotificationHandlerListenerNextIdentifier;
  id v6 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  char v4 = (void *)_AXNotificationHandlerListenerIdentifiers;
  id v5 = [MEMORY[0x263F08D40] valueWithNonretainedObject:*(void *)(a1 + 32)];
  [v4 setObject:v5 forKey:v6];
}

+ (void)_safelyRemoveObserverForIdentifier:(unint64_t)a3
{
}

void __63__VISAXNotificationHandler__safelyRemoveObserverForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:*(void *)(a1 + 32)];
  objc_msgSend((id)_AXNotificationHandlerListenerIdentifiers, "removeObjectForKey:");
  if (![(id)_AXNotificationHandlerListenerIdentifiers count])
  {
    v1 = (void *)_AXNotificationHandlerListenerIdentifiers;
    _AXNotificationHandlerListenerIdentifiers = 0;
  }
}

+ (id)_safelyGetObserverForIdentifier:(unint64_t)a3
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __60__VISAXNotificationHandler__safelyGetObserverForIdentifier___block_invoke(uint64_t a1)
{
  id v6 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:*(void *)(a1 + 40)];
  id v2 = [(id)_AXNotificationHandlerListenerIdentifiers objectForKey:v6];
  uint64_t v3 = [v2 nonretainedObjectValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSString)_notificationName
{
  return self->_notificationName;
}

- (void)_setNotificationName:(id)a3
{
}

- (id)_target
{
  return self->_target;
}

- (void)_setTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dispatcher, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

- (id)_notificationTypeDescription
{
  return 0;
}

- (void)_startObserving
{
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  NSRequestConcreteImplementation();
}

- (void)_stopObserving
{
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  NSRequestConcreteImplementation();
}

@end