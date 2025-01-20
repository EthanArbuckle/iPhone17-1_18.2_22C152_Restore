@interface CARDNDStateObserver
+ (BOOL)observesVehicularReports;
- (BOOL)connected;
- (BOOL)isInAirplaneMode;
- (BOOL)isInLostMode;
- (CARDNDStateDelegate)delegate;
- (CARDNDStateObserver)initWithRadiosPreferences:(id)a3 vehicleStateClass:(Class)a4;
- (CXCallObserver)callObserver;
- (Class)vehicleStateClass;
- (NSDate)mostRecentVehicleBTConnectionDate;
- (NSTimer)vehicleStateCheckTimer;
- (RadiosPreferences)radiosPreferences;
- (void)_checkVehicleState;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)scheduleVehicleStateCheckWithDelay:(double)a3;
- (void)setCallObserver:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setVehicleStateCheckTimer:(id)a3;
@end

@implementation CARDNDStateObserver

- (CARDNDStateObserver)initWithRadiosPreferences:(id)a3 vehicleStateClass:(Class)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CARDNDStateObserver;
  v8 = [(CARDNDStateObserver *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_vehicleStateClass, a4);
    objc_storeStrong((id *)&v9->_radiosPreferences, a3);
    [(RadiosPreferences *)v9->_radiosPreferences setDelegate:v9];
    [(RadiosPreferences *)v9->_radiosPreferences refresh];
    v10 = (CXCallObserver *)objc_alloc_init((Class)CXCallObserver);
    callObserver = v9->_callObserver;
    v9->_callObserver = v10;

    char v12 = CRDeviceSupportsAutomaticDNDMotionTrigger();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (v12)
    {
      CFStringRef v14 = (const __CFString *)kCMVehicularStateChangedNotification;
      v15 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_100010BBC;
      v16 = v9;
    }
    else
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)sub_100010B24, kCMVehicleConnectedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFStringRef v14 = (const __CFString *)kCMVehicleDisconnectedNotification;
      v16 = v9;
      v15 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_100010B24;
    }
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v16, v15, v14, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, v9, (CFNotificationCallback)sub_100010BC4, kLostModeChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    sub_100010BC4(v18, v9);
  }

  return v9;
}

- (void)dealloc
{
  [(RadiosPreferences *)self->_radiosPreferences setDelegate:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v5 = [(CARDNDStateObserver *)self vehicleStateCheckTimer];
  [v5 invalidate];

  v6.receiver = self;
  v6.super_class = (Class)CARDNDStateObserver;
  [(CARDNDStateObserver *)&v6 dealloc];
}

+ (BOOL)observesVehicularReports
{
  if (CRDeviceSupportsDNDWhileDriving())
  {
    if (+[CRVehicleStoreAvailability isVehicleStoreAvailable])
    {
      return 1;
    }
    v3 = CarDNDWDLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = 0;
      v4 = "Not fetching vehicle state - device has not unlocked since boot.";
      v5 = (uint8_t *)&v6;
      goto LABEL_8;
    }
  }
  else
  {
    v3 = CarDNDWDLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      v4 = "Not fetching vehicle state - device does not support DNDWD.";
      v5 = (uint8_t *)&v7;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }

  return 0;
}

- (BOOL)isInAirplaneMode
{
  return [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
}

- (BOOL)isInLostMode
{
  v2 = +[FMDFMIPManager sharedInstance];
  if ([v2 lostModeIsActive])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    v4 = +[FMDFMIPManager sharedInstance];
    unsigned __int8 v3 = [v4 isManagedLostModeActive];
  }
  return v3;
}

- (NSDate)mostRecentVehicleBTConnectionDate
{
  v2 = [(objc_class *)[(CARDNDStateObserver *)self vehicleStateClass] mostRecentVehicleConnection];
  unsigned __int8 v3 = [v2 timeRange];
  v4 = [v3 startDate];

  return (NSDate *)v4;
}

- (void)scheduleVehicleStateCheckWithDelay:(double)a3
{
  v5 = [(CARDNDStateObserver *)self vehicleStateCheckTimer];

  if (v5)
  {
    __int16 v6 = [(CARDNDStateObserver *)self vehicleStateCheckTimer];
    [v6 invalidate];

    [(CARDNDStateObserver *)self setVehicleStateCheckTimer:0];
  }
  __int16 v7 = CarDNDWDLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = +[NSNumber numberWithDouble:a3];
    int v13 = 138412290;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scheduling vehicle state check after %@", (uint8_t *)&v13, 0xCu);
  }
  v9 = +[NSTimer timerWithTimeInterval:self target:"_checkVehicleState" selector:0 userInfo:0 repeats:a3];
  vehicleStateCheckTimer = self->_vehicleStateCheckTimer;
  self->_vehicleStateCheckTimer = v9;

  v11 = +[NSRunLoop mainRunLoop];
  char v12 = [(CARDNDStateObserver *)self vehicleStateCheckTimer];
  [v11 addTimer:v12 forMode:NSDefaultRunLoopMode];
}

- (void)airplaneModeChanged
{
  [(RadiosPreferences *)self->_radiosPreferences refresh];
  BOOL v3 = [(CARDNDStateObserver *)self isInAirplaneMode];
  v4 = CarDNDWDLogging();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    __int16 v12 = 0;
    __int16 v6 = "Airplane mode now active.";
    __int16 v7 = (uint8_t *)&v12;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    __int16 v11 = 0;
    __int16 v6 = "Airplane mode now inactive.";
    __int16 v7 = (uint8_t *)&v11;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
LABEL_7:

  v8 = [(CARDNDStateObserver *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(CARDNDStateObserver *)self delegate];
    [v10 stateMachine:self receivedAirplaneMode:v3];
  }
}

- (void)_checkVehicleState
{
  if ([(id)objc_opt_class() observesVehicularReports])
  {
    if (CRDeviceSupportsAutomaticDNDMotionTrigger())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      uint64_t v4 = (uint64_t)[WeakRetained vehicularState];

      id v5 = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      uint64_t v6 = (uint64_t)[v5 vehicularHints];

      id v7 = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      id v8 = [v7 vehicularOperatorState];
    }
    else
    {
      if ([(CARDNDStateObserver *)self connected]) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 1;
      }
      id v8 = 0;
      if ([(CARDNDStateObserver *)self connected]) {
        uint64_t v6 = 16;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    char v9 = CarDNDWDLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = +[NSNumber numberWithUnsignedInteger:v4];
      int v20 = 138412290;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetched CM vehicle state: %@", (uint8_t *)&v20, 0xCu);
    }
    if (v4)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      __int16 v12 = [v11 mostRecentVehicleConnection];

      int v13 = [v12 deviceId];
      CFStringRef v14 = objc_opt_new();
      [v14 setDeviceID:v13];
      [v14 setVehicleState:v4];
      [v14 setVehicularHints:v6];
      [v14 setVehicleOperatorState:v8];
      v15 = CarDNDWDLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v14 vehicleStateDebugDescription];
        int v20 = 138543362;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Generated vehicle state %{public}@", (uint8_t *)&v20, 0xCu);
      }
      v17 = [(CARDNDStateObserver *)self delegate];
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        v19 = [(CARDNDStateObserver *)self delegate];
        [v19 stateMachine:self receivedVehicleState:v14];
      }
    }
    else
    {
      __int16 v12 = CarDNDWDLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring unknown vehicular state.", (uint8_t *)&v20, 2u);
      }
    }
  }
}

- (Class)vehicleStateClass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleStateClass);

  return (Class)WeakRetained;
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (CARDNDStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CARDNDStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (NSTimer)vehicleStateCheckTimer
{
  return self->_vehicleStateCheckTimer;
}

- (void)setVehicleStateCheckTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleStateCheckTimer, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);

  objc_destroyWeak((id *)&self->_vehicleStateClass);
}

@end