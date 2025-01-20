@interface TVRDAssertionManager
+ (id)sharedInstance;
- (BOOL)_newLockScreenBehaviour;
- (BOOL)isLockScreenAssertionActive;
- (CUSystemMonitor)systemMonitor;
- (NSTimer)expirationTimer;
- (SBSLockScreenContentAssertion)assertion;
- (TVRDAssertionManager)init;
- (void)_createAssertionExpirationTimer;
- (void)_setup;
- (void)acquireLockScreenAssertion;
- (void)dealloc;
- (void)invalidateAssertionExpirationTimer;
- (void)releaseLockScreenAssertion;
- (void)setAssertion:(id)a3;
- (void)setExpirationTimer:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)startAssertionExpirationTimer;
@end

@implementation TVRDAssertionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __38__TVRDAssertionManager_sharedInstance__block_invoke(id a1)
{
  sharedInstance_sharedInstance = objc_alloc_init(TVRDAssertionManager);

  _objc_release_x1();
}

- (TVRDAssertionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)TVRDAssertionManager;
  v2 = [(TVRDAssertionManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TVRDAssertionManager *)v2 _setup];
  }
  return v3;
}

- (void)_setup
{
  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    objc_initWeak(&location, self);
    objc_super v5 = self->_systemMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __30__TVRDAssertionManager__setup__block_invoke;
    v6[3] = &unk_10001C4E0;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [(CUSystemMonitor *)v5 setScreenLockedChangedHandler:v6];
    [(CUSystemMonitor *)self->_systemMonitor activateWithCompletion:&__block_literal_global_8];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  _TVRCAddStateHandlerWithName();
}

void __30__TVRDAssertionManager__setup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained systemMonitor];
    unsigned int v5 = [v4 screenLocked];

    v6 = _TVRDXPCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"unlocked";
      if (v5) {
        CFStringRef v7 = @"locked";
      }
      int v9 = 138412290;
      CFStringRef v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Screen is now %@", (uint8_t *)&v9, 0xCu);
    }

    if (v5 && ([*(id *)(a1 + 32) _newLockScreenBehaviour] & 1) == 0)
    {
      v8 = _TVRDXPCLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting expiration timer", (uint8_t *)&v9, 2u);
      }

      [v3 invalidateAssertionExpirationTimer];
      [v3 _createAssertionExpirationTimer];
    }
  }
}

void __30__TVRDAssertionManager__setup__block_invoke_6(id a1)
{
  v1 = _TVRDXPCLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v2, 2u);
  }
}

id __30__TVRDAssertionManager__setup__block_invoke_10(uint64_t a1)
{
  v2 = +[NSMutableDictionary dictionary];
  v3 = [*(id *)(a1 + 32) assertion];
  v4 = +[NSNumber numberWithInt:v3 != 0];
  [v2 setObject:v4 forKeyedSubscript:@"lockScreen"];

  return v2;
}

- (BOOL)_newLockScreenBehaviour
{
  return GestaltGetDeviceClass() != 3;
}

- (void)dealloc
{
  [(TVRDAssertionManager *)self releaseLockScreenAssertion];
  v3 = [(TVRDAssertionManager *)self systemMonitor];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)TVRDAssertionManager;
  [(TVRDAssertionManager *)&v4 dealloc];
}

- (void)acquireLockScreenAssertion
{
  unsigned int v3 = [(TVRDAssertionManager *)self _newLockScreenBehaviour];
  objc_super v4 = @"SBSWakeToRemoteAlertAssertion";
  if (v3) {
    objc_super v4 = @"SBSSecureAppAssertion";
  }
  unsigned int v5 = v4;
  assertion = self->_assertion;
  CFStringRef v7 = _TVRDXPCLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (assertion)
  {
    if (v8)
    {
      int v15 = 138412290;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "We already have a valid %@", (uint8_t *)&v15, 0xCu);
    }

    if ((v3 & 1) == 0)
    {
      int v9 = _TVRDXPCLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Resetting invalidation timer for assertion", (uint8_t *)&v15, 2u);
      }

      [(TVRDAssertionManager *)self _createAssertionExpirationTimer];
    }
  }
  else
  {
    if (v8)
    {
      int v15 = 138412290;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Acquiring %@", (uint8_t *)&v15, 0xCu);
    }

    if (v3)
    {
      CFStringRef v10 = +[SBSSecureAppAssertion acquireSecureAppAssertionWithType:12 errorHandler:&__block_literal_global_28];
      v11 = self->_assertion;
      self->_assertion = v10;
    }
    else
    {
      id v12 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.TVRemoteUIService" viewControllerClassName:@"TVRemoteAlertViewController"];
      v13 = +[SBSWakeToRemoteAlertAssertion acquireWakeToRemoteAlertAssertionWithDefinition:v12 errorHandler:&__block_literal_global_39];
      v14 = self->_assertion;
      self->_assertion = v13;

      [(TVRDAssertionManager *)self _createAssertionExpirationTimer];
    }
  }
}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = [(NSError *)v2 code];
  objc_super v4 = _TVRDXPCLog();
  unsigned int v5 = v4;
  if (v3 == (id)5)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully invalidated lock screen assertion", v6, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_cold_1((uint64_t)v2, v5);
  }
}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_37(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_37_cold_1((uint64_t)v2, v3);
  }
}

- (void)releaseLockScreenAssertion
{
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing lock screen assertion", v5, 2u);
  }

  [(SBSLockScreenContentAssertion *)self->_assertion invalidate];
  assertion = self->_assertion;
  self->_assertion = 0;

  [(TVRDAssertionManager *)self invalidateAssertionExpirationTimer];
}

- (BOOL)isLockScreenAssertionActive
{
  return self->_assertion != 0;
}

- (void)_createAssertionExpirationTimer
{
  if (+[TVRCFeatures isPersistOnLockScreenEnabled])
  {
    id v3 = _TVRDXPCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      objc_super v4 = "Persist On LockScreen Internal flag is enabled. Ignoring creating the timer.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)location, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  unsigned int v5 = [(TVRDAssertionManager *)self assertion];

  if (!v5)
  {
    id v3 = _TVRDXPCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      objc_super v4 = "Lock Screen Assertion is nil. Skipping creating the expiration timer";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  [(TVRDAssertionManager *)self invalidateAssertionExpirationTimer];
  objc_initWeak(location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __55__TVRDAssertionManager__createAssertionExpirationTimer__block_invoke;
  v11[3] = &unk_10001C5B0;
  objc_copyWeak(&v12, location);
  v6 = +[NSTimer timerWithTimeInterval:0 repeats:v11 block:480.0];
  expirationTimer = self->_expirationTimer;
  self->_expirationTimer = v6;

  BOOL v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting Lock Screen Assertion Timer", v10, 2u);
  }

  int v9 = +[NSRunLoop mainRunLoop];
  [v9 addTimer:self->_expirationTimer forMode:NSRunLoopCommonModes];

  objc_destroyWeak(&v12);
  objc_destroyWeak(location);
}

void __55__TVRDAssertionManager__createAssertionExpirationTimer__block_invoke(uint64_t a1)
{
  v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Lock Screen Assertion expiration timer fired", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained releaseLockScreenAssertion];
}

- (void)startAssertionExpirationTimer
{
  if (self->_expirationTimer)
  {
    v2 = _TVRDXPCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Lock Screen Assertion Timer already exists", v3, 2u);
    }
  }
  else
  {
    [(TVRDAssertionManager *)self _createAssertionExpirationTimer];
  }
}

- (void)invalidateAssertionExpirationTimer
{
  if (self->_expirationTimer)
  {
    id v3 = _TVRDXPCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating Lock Screen Assertion Timer", v5, 2u);
    }

    [(NSTimer *)self->_expirationTimer invalidate];
    expirationTimer = self->_expirationTimer;
    self->_expirationTimer = 0;
  }
}

- (SBSLockScreenContentAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (NSTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)setExpirationTimer:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);

  objc_storeStrong((id *)&self->_assertion, 0);
}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error acquiring SBSSecureAppAssertion %{public}@", (uint8_t *)&v2, 0xCu);
}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_37_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error acquiring SBSWakeToRemoteAlertAssertion %{public}@", (uint8_t *)&v2, 0xCu);
}

@end