@interface RTBatteryManager
+ (BOOL)_ioDrawingUnlimitedPower;
+ (id)externalConnectionStateToString:(int64_t)a3;
+ (int)_ioGetCurrentBatteryPercent;
+ (int64_t)currentExternalConnectionState;
- (BOOL)monitorBatteryStatusChanges;
- (RTBatteryManager)init;
- (RTBatteryManager)initWithQueue:(id)a3;
- (RTBatteryManager)initWithQueue:(id)a3 notificationHelper:(id)a4;
- (RTDarwinNotificationHelper)notificationHelper;
- (int64_t)externalConnectionState;
- (void)_shutdownWithHandler:(id)a3;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)fetchCurrentBatteryPercent:(id)a3;
- (void)fetchCurrentChargerConnectionState:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)setExternalConnectionState:(int64_t)a3;
- (void)setMonitorBatteryStatusChanges:(BOOL)a3;
- (void)startMonitoringBatteryStatusChanges;
- (void)stopMonitoringBatteryStatusChanges;
- (void)updateBatteryStatus:(int64_t)a3;
@end

@implementation RTBatteryManager

- (RTBatteryManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_notificationHelper_);
}

- (RTBatteryManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(RTBatteryManager *)self initWithQueue:v4 notificationHelper:v5];

  return v6;
}

- (RTBatteryManager)initWithQueue:(id)a3 notificationHelper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: queue";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: notificationHelper";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTBatteryManager;
  v9 = [(RTNotifier *)&v15 initWithQueue:v6];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationHelper, a4);
    v10->_externalConnectionState = [(id)objc_opt_class() currentExternalConnectionState];
  }
  self = v10;
  v11 = self;
LABEL_10:

  return v11;
}

+ (id)externalConnectionStateToString:(int64_t)a3
{
  if (a3) {
    return @"Connected";
  }
  else {
    return @"Disconnected";
  }
}

- (void)dealloc
{
  [(RTBatteryManager *)self _unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)RTBatteryManager;
  [(RTBatteryManager *)&v3 dealloc];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(RTBatteryManager *)self _unregisterForNotifications];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)_unregisterForNotifications
{
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    if ([(RTNotifier *)self getNumberOfObservers:v6] == 1) {
      [(RTBatteryManager *)self setMonitorBatteryStatusChanges:1];
    }
    v9 = [[RTBatteryManagerNotificationChargerConnected alloc] initWithChargerConnected:self->_externalConnectionState == 1];
    if (v9) {
      [(RTNotifier *)self postNotification:v9 toObserver:v10];
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v7 = a4;
  id v5 = +[RTNotification notificationName];
  int v6 = [v7 isEqualToString:v5];

  if (v6 && ![(RTNotifier *)self getNumberOfObservers:v7]) {
    [(RTBatteryManager *)self setMonitorBatteryStatusChanges:0];
  }
}

- (void)setMonitorBatteryStatusChanges:(BOOL)a3
{
  if (self->_monitorBatteryStatusChanges != a3)
  {
    self->_monitorBatteryStatusChanges = a3;
    if (a3) {
      [(RTBatteryManager *)self startMonitoringBatteryStatusChanges];
    }
    else {
      [(RTBatteryManager *)self stopMonitoringBatteryStatusChanges];
    }
  }
}

- (void)startMonitoringBatteryStatusChanges
{
  objc_super v3 = _rt_log_facility_get_os_log(RTLogFacilityBattery);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "start monitoring battery status changes", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  notificationHelper = self->_notificationHelper;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke;
  v5[3] = &unk_1E6B91900;
  objc_copyWeak(&v6, buf);
  [(RTDarwinNotificationHelper *)notificationHelper addObserverForNotificationName:@"com.apple.system.powermanagement.poweradapter" handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke_2;
    block[3] = &unk_1E6B90E70;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() currentExternalConnectionState];
  objc_super v3 = *(void **)(a1 + 32);

  return [v3 updateBatteryStatus:v2];
}

- (void)stopMonitoringBatteryStatusChanges
{
  objc_super v3 = _rt_log_facility_get_os_log(RTLogFacilityBattery);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "stop monitoring battery status changes", v4, 2u);
  }

  [(RTDarwinNotificationHelper *)self->_notificationHelper removeObserverForNotificationName:@"com.apple.system.powermanagement.poweradapter"];
}

+ (int64_t)currentExternalConnectionState
{
  return [(id)objc_opt_class() _ioDrawingUnlimitedPower];
}

- (void)updateBatteryStatus:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t externalConnectionState = self->_externalConnectionState;
  self->_int64_t externalConnectionState = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityBattery);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = +[RTBatteryManager externalConnectionStateToString:externalConnectionState];
    id v7 = +[RTBatteryManager externalConnectionStateToString:self->_externalConnectionState];
    int v10 = 138543618;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "charger connected state changed from, %{public}@, to, %{public}@", (uint8_t *)&v10, 0x16u);
  }
  int64_t v8 = self->_externalConnectionState;
  if (externalConnectionState != v8)
  {
    v9 = [[RTBatteryManagerNotificationChargerConnected alloc] initWithChargerConnected:v8 == 1];
    if (v9) {
      [(RTNotifier *)self postNotification:v9];
    }
  }
}

- (void)fetchCurrentChargerConnectionState:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__RTBatteryManager_fetchCurrentChargerConnectionState___block_invoke;
    v7[3] = &unk_1E6B90D08;
    v7[4] = self;
    int64_t v8 = v4;
    dispatch_async(v5, v7);

    id v6 = v8;
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v10 = "-[RTBatteryManager fetchCurrentChargerConnectionState:]";
      __int16 v11 = 1024;
      int v12 = 199;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

uint64_t __55__RTBatteryManager_fetchCurrentChargerConnectionState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 40), 0);
}

- (void)fetchCurrentBatteryPercent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[RTBatteryManager fetchCurrentBatteryPercent:]";
      __int16 v13 = 1024;
      int v14 = 212;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", location, 0x12u);
    }
  }
  id v6 = objc_initWeak((id *)location, self);
  id v7 = [(RTNotifier *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__RTBatteryManager_fetchCurrentBatteryPercent___block_invoke;
  v9[3] = &unk_1E6B954D8;
  id v10 = v4;
  id v8 = v4;
  objc_copyWeak(&v11, (id *)location);
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)location);
}

void __47__RTBatteryManager_fetchCurrentBatteryPercent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [(id)objc_opt_class() _ioGetCurrentBatteryPercent];
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

- (BOOL)monitorBatteryStatusChanges
{
  return self->_monitorBatteryStatusChanges;
}

- (int64_t)externalConnectionState
{
  return self->_externalConnectionState;
}

- (void)setExternalConnectionState:(int64_t)a3
{
  self->_int64_t externalConnectionState = a3;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void).cxx_destruct
{
}

+ (BOOL)_ioDrawingUnlimitedPower
{
  return MEMORY[0x1F40E9100](a1, a2);
}

+ (int)_ioGetCurrentBatteryPercent
{
  return 0;
}

@end