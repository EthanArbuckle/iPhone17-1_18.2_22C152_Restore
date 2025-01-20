@interface NavigationThermalWarningController
- (BOOL)isActive;
- (NavigationThermalWarningController)init;
- (id)_localizedMessage;
- (id)_localizedTitle;
- (id)changeHandler;
- (void)_checkIfLockScreenMitigationShouldActivate;
- (void)_clearIdleTimerIfNeeded;
- (void)_lockAndStartIdleTimer;
- (void)_sendNotification;
- (void)_sendNotificationIfNeccessary;
- (void)_tearDownNotificationIfNeeded;
- (void)dealloc;
- (void)didUpdateMitigationNamed:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setChangeHandler:(id)a3;
@end

@implementation NavigationThermalWarningController

- (NavigationThermalWarningController)init
{
  v7.receiver = self;
  v7.super_class = (Class)NavigationThermalWarningController;
  v2 = [(NavigationThermalWarningController *)&v7 init];
  if (v2)
  {
    v3 = sub_100398098();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v9 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Enabling thermal level monitoring", buf, 0xCu);
    }

    v4 = +[MapsThermalPressureController sharedController];
    [v4 addObserver:v2 forMitigationNamed:@"NavigationDisableLockScreen"];

    v5 = +[MapsScreenLayoutMonitor sharedMonitor];
    [v5 startMonitoringWithObserver:v2];

    [(NavigationThermalWarningController *)v2 _checkIfLockScreenMitigationShouldActivate];
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_100398098();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    objc_super v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling thermal level monitoring", buf, 0xCu);
  }

  v4 = +[MapsScreenLayoutMonitor sharedMonitor];
  [v4 stopMonitoringWithObserver:self];

  [(NavigationThermalWarningController *)self _tearDownNotificationIfNeeded];
  [(NavigationThermalWarningController *)self _clearIdleTimerIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)NavigationThermalWarningController;
  [(NavigationThermalWarningController *)&v5 dealloc];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = sub_100398098();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL active = self->_active;
      int v11 = 134349568;
      v12 = self;
      __int16 v13 = 1024;
      BOOL v14 = active;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Active state changed: %d => %d", (uint8_t *)&v11, 0x18u);
    }

    self->_BOOL active = v3;
    objc_super v7 = [(NavigationThermalWarningController *)self changeHandler];

    if (v7)
    {
      v8 = [(NavigationThermalWarningController *)self changeHandler];
      v8[2](v8, v3);
    }
    v9 = sub_100398098();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v10)
      {
        int v11 = 134349056;
        v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Thermal level is dangerous", (uint8_t *)&v11, 0xCu);
      }

      [(NavigationThermalWarningController *)self _lockAndStartIdleTimer];
      [(NavigationThermalWarningController *)self _sendNotificationIfNeccessary];
    }
    else
    {
      if (v10)
      {
        int v11 = 134349056;
        v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Thermal level is normal", (uint8_t *)&v11, 0xCu);
      }

      [(NavigationThermalWarningController *)self _clearIdleTimerIfNeeded];
      [(NavigationThermalWarningController *)self _tearDownNotificationIfNeeded];
    }
  }
}

- (void)_lockAndStartIdleTimer
{
  BOOL v3 = sub_100398098();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Force lock the screen", buf, 0xCu);
  }

  SBSLockDevice();
  if (!self->_idleTimerAssertion)
  {
    v4 = sub_100398098();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Taking timer assertion", buf, 0xCu);
    }

    objc_super v5 = +[SBIdleTimerRequestConfiguration configurationWithMinimumExpirationTimeout:5.0 maximumExpirationTimeout:60.0];
    v6 = +[ITIdleTimerState sharedInstance];
    id v17 = 0;
    objc_super v7 = (BSInvalidatable *)[v6 newIdleTimerAssertionWithConfiguration:v5 forReason:@"high thermal level during navigation" error:&v17];
    v8 = (BSInvalidatable *)v17;
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = v7;

    BOOL v10 = self->_idleTimerAssertion;
    int v11 = sub_100398098();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = self->_idleTimerAssertion;
        *(_DWORD *)buf = 134349314;
        v19 = self;
        __int16 v20 = 2112;
        v21 = v13;
        BOOL v14 = "[%{public}p] Successfully acquired idle time assertion: %@";
        __int16 v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v8;
      BOOL v14 = "[%{public}p] Error acquiring idle timer assertion: %@";
      __int16 v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }
  }
}

- (void)_sendNotification
{
  [(NavigationThermalWarningController *)self _tearDownNotificationIfNeeded];
  v22[0] = kCFUserNotificationAlertHeaderKey;
  BOOL v3 = [(NavigationThermalWarningController *)self _localizedTitle];
  v23[0] = v3;
  v22[1] = kCFUserNotificationAlertMessageKey;
  v4 = [(NavigationThermalWarningController *)self _localizedMessage];
  v23[1] = v4;
  v23[2] = &__kCFBooleanTrue;
  v22[2] = kCFUserNotificationAlertTopMostKey;
  v22[3] = SBUserNotificationLockScreenAlertHeaderKey;
  objc_super v5 = [(NavigationThermalWarningController *)self _localizedTitle];
  v23[3] = v5;
  v22[4] = SBUserNotificationLockScreenAlertMessageKey;
  v6 = [(NavigationThermalWarningController *)self _localizedMessage];
  v23[4] = v6;
  v23[5] = &__kCFBooleanTrue;
  v22[5] = SBUserNotificationAllowInSetupKey;
  v22[6] = SBUserNotificationAllowInLoginWindow;
  v23[6] = &__kCFBooleanTrue;
  v23[7] = &__kCFBooleanFalse;
  v22[7] = SBUserNotificationDismissOnLock;
  v22[8] = SBUserNotificationDontDismissOnUnlock;
  v23[8] = &__kCFBooleanFalse;
  v23[9] = &__kCFBooleanFalse;
  v22[9] = SBUserNotificationForcesModalAlertAppearance;
  v22[10] = SBUserNotificationIgnoresQuietMode;
  v22[11] = SBUserNotificationWakeDisplay;
  v23[10] = &__kCFBooleanTrue;
  v23[11] = &__kCFBooleanFalse;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:12];

  SInt32 error = 0;
  self->_notification = CFUserNotificationCreate(0, 0.0, 0x20uLL, &error, v7);
  LODWORD(v4) = error;
  v8 = sub_100398098();
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349570;
      id v17 = self;
      __int16 v18 = 2112;
      CFDictionaryRef v19 = v7;
      __int16 v20 = 1024;
      SInt32 v21 = error;
      BOOL v10 = "[%{public}p] Unable to create notification: %@ error: %d";
      int v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_FAULT;
      uint32_t v13 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    notification = self->_notification;
    *(_DWORD *)buf = 134349314;
    id v17 = self;
    __int16 v18 = 2112;
    CFDictionaryRef v19 = notification;
    BOOL v10 = "[%{public}p] Successfully created notification: %@";
    int v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)_clearIdleTimerIfNeeded
{
  if (self->_idleTimerAssertion)
  {
    BOOL v3 = sub_100398098();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      idleTimerAssertion = self->_idleTimerAssertion;
      int v6 = 134349314;
      CFDictionaryRef v7 = self;
      __int16 v8 = 2112;
      v9 = idleTimerAssertion;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Clearing previous idle timer assertion: %@", (uint8_t *)&v6, 0x16u);
    }

    [(BSInvalidatable *)self->_idleTimerAssertion invalidate];
    objc_super v5 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;
  }
}

- (void)_tearDownNotificationIfNeeded
{
  if (self->_notification)
  {
    BOOL v3 = sub_100398098();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      notification = self->_notification;
      int v9 = 134349314;
      BOOL v10 = self;
      __int16 v11 = 2112;
      os_log_type_t v12 = notification;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Cancelling notification: %@", (uint8_t *)&v9, 0x16u);
    }

    SInt32 v5 = CFUserNotificationCancel(self->_notification);
    if (v5)
    {
      SInt32 v6 = v5;
      CFDictionaryRef v7 = sub_100398098();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        __int16 v8 = self->_notification;
        int v9 = 134349570;
        BOOL v10 = self;
        __int16 v11 = 2112;
        os_log_type_t v12 = v8;
        __int16 v13 = 1024;
        SInt32 v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "[%{public}p] Unable to cancel notification: %@ statusCode: %d", (uint8_t *)&v9, 0x1Cu);
      }
    }
    CFRelease(self->_notification);
    self->_notification = 0;
  }
}

- (id)_localizedMessage
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 model];

  v4 = +[NSBundle mainBundle];
  SInt32 v5 = [v4 localizedStringForKey:@"unknown_device_cooldown" value:@"localized string not found" table:0];
  SInt32 v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);

  return v6;
}

- (id)_localizedTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"temperature_title" value:@"localized string not found" table:0];

  return v3;
}

- (void)_sendNotificationIfNeccessary
{
  BOOL v3 = +[MapsScreenLayoutMonitor sharedMonitor];
  unsigned int v4 = [v3 isLocked];

  if (v4)
  {
    if (![(NavigationThermalWarningController *)self isActive] || self->_notification)
    {
      SInt32 v5 = sub_100398098();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
LABEL_7:

        return;
      }
      int v11 = 134349056;
      os_log_type_t v12 = self;
      SInt32 v6 = "[%{public}p] Screen is locked";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_7;
    }
    __int16 v8 = +[CarDisplayController sharedInstance];
    unsigned int v9 = [v8 isCurrentlyConnectedToAnyCarScene];

    SInt32 v5 = sub_100398098();
    BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (!v10) {
        goto LABEL_7;
      }
      int v11 = 134349056;
      os_log_type_t v12 = self;
      SInt32 v6 = "[%{public}p] Screen is locked and the phone is still hot but CarPlay is connected; not showing notification";
      goto LABEL_6;
    }
    if (v10)
    {
      int v11 = 134349056;
      os_log_type_t v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Screen is locked and the phone is still hot; showing notification",
        (uint8_t *)&v11,
        0xCu);
    }

    [(NavigationThermalWarningController *)self _sendNotification];
  }
  else
  {
    CFDictionaryRef v7 = sub_100398098();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 134349056;
      os_log_type_t v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Device is unlocked; tearing down notification",
        (uint8_t *)&v11,
        0xCu);
    }

    [(NavigationThermalWarningController *)self _tearDownNotificationIfNeeded];
  }
}

- (void)didUpdateMitigationNamed:(id)a3
{
  if ([a3 isEqualToString:@"NavigationDisableLockScreen"])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100398E58;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_checkIfLockScreenMitigationShouldActivate
{
  BOOL v3 = sub_100398098();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349314;
    SInt32 v6 = self;
    __int16 v7 = 2080;
    __int16 v8 = "-[NavigationThermalWarningController _checkIfLockScreenMitigationShouldActivate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] %s", (uint8_t *)&v5, 0x16u);
  }

  unsigned int v4 = +[MapsThermalPressureController sharedController];
  -[NavigationThermalWarningController setActive:](self, "setActive:", [v4 shouldActivateMitigationNamed:@"NavigationDisableLockScreen"]);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);

  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
}

@end