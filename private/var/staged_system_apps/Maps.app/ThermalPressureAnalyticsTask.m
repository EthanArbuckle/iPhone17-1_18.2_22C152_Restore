@interface ThermalPressureAnalyticsTask
+ (int64_t)creationPreference;
- (MNNavigationService)navigationService;
- (MapsPowerSourceController)powerSourceController;
- (MapsThermalPressureController)thermalPressureController;
- (OS_dispatch_queue)isolationQueue;
- (PlatformController)platformController;
- (ThermalPressureAnalyticsTask)initWithPlatformController:(id)a3 thermalPressureController:(id)a4 navigationService:(id)a5 powerSourceController:(id)a6;
- (int)_chargingState;
- (int)_mapType;
- (void)dealloc;
- (void)didUpdateThermalPressureLevel:(int)a3;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)powerSourceController:(id)a3 didUpdateChargingState:(int64_t)a4;
- (void)setIsolationQueue:(id)a3;
- (void)setNavigationService:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setPowerSourceController:(id)a3;
- (void)setThermalPressureController:(id)a3;
@end

@implementation ThermalPressureAnalyticsTask

- (ThermalPressureAnalyticsTask)initWithPlatformController:(id)a3 thermalPressureController:(id)a4 navigationService:(id)a5 powerSourceController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)ThermalPressureAnalyticsTask;
  v14 = [(ThermalPressureAnalyticsTask *)&v30 init];
  if (v14)
  {
    v15 = sub_10006BD6C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.Maps.ThermalPressureAnalyticsTask.isolation", v17);
    isolationQueue = v14->_isolationQueue;
    v14->_isolationQueue = (OS_dispatch_queue *)v18;

    objc_storeWeak((id *)&v14->_platformController, v10);
    objc_storeWeak((id *)&v14->_thermalPressureController, v11);
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    unsigned int v21 = [WeakRetained isPrimary];

    if (v21)
    {
      v22 = sub_10006BD6C();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Observing thermal pressure changes", buf, 0xCu);
      }

      id v23 = objc_loadWeakRetained((id *)&v14->_thermalPressureController);
      [v23 addThermalPressureObserver:v14];
    }
    id v24 = objc_storeWeak((id *)&v14->_navigationService, v12);
    [v12 registerObserver:v14];

    objc_storeWeak((id *)&v14->_powerSourceController, v13);
    id v25 = objc_loadWeakRetained((id *)&v14->_platformController);
    unsigned int v26 = [v25 isPrimary];

    if (v26)
    {
      v27 = sub_10006BD6C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Observing power source changes", buf, 0xCu);
      }

      id v28 = objc_loadWeakRetained((id *)&v14->_powerSourceController);
      [v28 registerObserver:v14];
    }
  }

  return v14;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  v3 = sub_10006BD6C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_thermalPressureController);
  [WeakRetained removeThermalPressureObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_navigationService);
  [v5 unregisterObserver:self];

  id v6 = objc_loadWeakRetained((id *)&self->_powerSourceController);
  [v6 unregisterObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)ThermalPressureAnalyticsTask;
  [(ThermalPressureAnalyticsTask *)&v7 dealloc];
}

- (int)_mapType
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100990204;
  v4[3] = &unk_1012E67C0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)_chargingState
{
  int v2 = [(ThermalPressureAnalyticsTask *)self powerSourceController];
  v3 = (char *)[v2 chargingState];

  if ((unint64_t)(v3 - 1) < 3) {
    return (int)v3;
  }
  else {
    return 0;
  }
}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = [(ThermalPressureAnalyticsTask *)self isolationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100990470;
  block[3] = &unk_1012F02D8;
  objc_copyWeak(&v7, &location);
  int v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  v9 = [(ThermalPressureAnalyticsTask *)self isolationQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100990688;
  v10[3] = &unk_1012E8268;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v11[2] = (id)a5;
  dispatch_async(v9, v10);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)powerSourceController:(id)a3 didUpdateChargingState:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [(ThermalPressureAnalyticsTask *)self isolationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100990934;
  block[3] = &unk_1012F0708;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  dispatch_async(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (MapsThermalPressureController)thermalPressureController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thermalPressureController);

  return (MapsThermalPressureController *)WeakRetained;
}

- (void)setThermalPressureController:(id)a3
{
}

- (MNNavigationService)navigationService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationService);

  return (MNNavigationService *)WeakRetained;
}

- (void)setNavigationService:(id)a3
{
}

- (MapsPowerSourceController)powerSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_powerSourceController);

  return (MapsPowerSourceController *)WeakRetained;
}

- (void)setPowerSourceController:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_powerSourceController);
  objc_destroyWeak((id *)&self->_navigationService);
  objc_destroyWeak((id *)&self->_thermalPressureController);

  objc_destroyWeak((id *)&self->_platformController);
}

@end