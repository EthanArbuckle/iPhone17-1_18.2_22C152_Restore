@interface CarRouteGeniusVehicleBatteryMonitor
- (BOOL)active;
- (BOOL)needsCheckBattery;
- (CarRouteGeniusService)routeGeniusService;
- (CarRouteGeniusVehicleBatteryMonitor)initWithRouteGeniusService:(id)a3 virtualGarageService:(id)a4 callbackQueue:(id)a5;
- (CarRouteGeniusVehicleBatteryMonitorDelegate)delegate;
- (GEORouteAttributes)currentRouteAttributes;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (VGVehicleState)currentVehicleState;
- (VGVirtualGarageService)garageService;
- (void)_checkBattery;
- (void)_setNeedsCheckBattery;
- (void)_updateState;
- (void)didUpdateRouteGenius:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCurrentRouteAttributes:(id)a3;
- (void)setCurrentVehicleState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGarageService:(id)a3;
- (void)setNeedsCheckBattery:(BOOL)a3;
- (void)setRouteGeniusService:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation CarRouteGeniusVehicleBatteryMonitor

- (CarRouteGeniusVehicleBatteryMonitor)initWithRouteGeniusService:(id)a3 virtualGarageService:(id)a4 callbackQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CarRouteGeniusVehicleBatteryMonitor;
  v12 = [(CarRouteGeniusVehicleBatteryMonitor *)&v17 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("CarRouteGeniusVehicleBatteryMonitor", v13);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_callbackQueue, a5);
    objc_storeStrong((id *)&v12->_routeGeniusService, a3);
    objc_storeStrong((id *)&v12->_garageService, a4);
  }

  return v12;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    routeGeniusService = self->_routeGeniusService;
    if (a3)
    {
      [(CarRouteGeniusService *)routeGeniusService registerObserver:self];
      [(VGVirtualGarageService *)self->_garageService registerObserver:self];
    }
    else
    {
      [(CarRouteGeniusService *)routeGeniusService unregisterObserver:self];
      [(VGVirtualGarageService *)self->_garageService unregisterObserver:self];
    }
    [(CarRouteGeniusVehicleBatteryMonitor *)self _updateState];
  }
}

- (void)setCurrentVehicleState:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  v6 = (void *)v5;
  if (v5 | (unint64_t)self->_currentVehicleState
    && objc_msgSend((id)v5, "isSignificantlyDifferentFromVehicleState:"))
  {
    v7 = sub_100D6ACF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      currentVehicleState = self->_currentVehicleState;
      int v9 = 138412546;
      id v10 = currentVehicleState;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setCurrentVehicleState: from: %@ to: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentVehicleState, a3);
    [(CarRouteGeniusVehicleBatteryMonitor *)self _setNeedsCheckBattery];
  }
}

- (void)setCurrentRouteAttributes:(id)a3
{
  id v5 = a3;
  currentRouteAttributes = self->_currentRouteAttributes;
  unint64_t v7 = (unint64_t)v5;
  id v8 = currentRouteAttributes;
  if (v7 | (unint64_t)v8)
  {
    int v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      __int16 v11 = sub_100D6ACF0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_currentRouteAttributes;
        int v13 = 138412546;
        dispatch_queue_t v14 = v12;
        __int16 v15 = 2112;
        unint64_t v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "setCurrentRouteAttributes: from: %@ to: %@", (uint8_t *)&v13, 0x16u);
      }

      objc_storeStrong((id *)&self->_currentRouteAttributes, a3);
      [(CarRouteGeniusVehicleBatteryMonitor *)self _setNeedsCheckBattery];
    }
  }
}

- (void)_updateState
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D6AF0C;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setNeedsCheckBattery
{
  if (!self->_needsCheckBattery)
  {
    self->_needsCheckBattery = 1;
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D6B3A8;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)_checkBattery
{
  if (self->_needsCheckBattery)
  {
    self->_needsCheckBattery = 0;
    currentRouteAttributes = self->_currentRouteAttributes;
    if (currentRouteAttributes)
    {
      v4 = [(GEORouteAttributes *)currentRouteAttributes automobileOptions];
      id v5 = [v4 vehicleSpecifications];
      uint64_t v6 = [v5 evInfo];

      if ((uint64_t)self->_currentVehicleState | v6)
      {
        unsigned int v12 = [(id)v6 minBatteryCharge];
        unsigned int v13 = [(id)v6 maxBatteryCharge];
        unsigned int v14 = [(id)v6 currentBatteryCharge];
        double v15 = 0.0;
        double v16 = 0.0;
        unsigned int v17 = v13 - v12;
        if (v13 != v12)
        {
          double v18 = fmin(fmax((double)(v14 - v12) / (double)v17, 0.0), 1.0);
          if ((double)(v14 - v12) <= (double)v17) {
            double v16 = v18;
          }
          else {
            double v16 = 0.0;
          }
        }
        v19 = [(VGVehicleState *)self->_currentVehicleState minBatteryCapacity];
        v37 = +[NSUnitEnergy kilowattHours];
        v38 = v19;
        v36 = [v19 measurementByConvertingToUnit:v37];
        [v36 doubleValue];
        unsigned int v21 = (v20 * 1000.0);
        v22 = [(VGVehicleState *)self->_currentVehicleState maxBatteryCapacity];
        v23 = +[NSUnitEnergy kilowattHours];
        v24 = [v22 measurementByConvertingToUnit:v23];
        [v24 doubleValue];
        unsigned int v26 = (v25 * 1000.0);
        v27 = [(VGVehicleState *)self->_currentVehicleState currentBatteryCapacity];
        v28 = +[NSUnitEnergy kilowattHours];
        v29 = [v27 measurementByConvertingToUnit:v28];
        [v29 doubleValue];
        unsigned int v31 = v26 - v21;
        if (v26 != v21)
        {
          unsigned int v32 = (v30 * 1000.0) - v21;
          if ((double)v32 <= (double)v31) {
            double v15 = fmin(fmax((double)v32 / (double)v31, 0.0), 1.0);
          }
        }

        GEOConfigGetDouble();
        double v34 = v33;
        if (vabdd_f64(v16, v15) > v33)
        {
          objc_initWeak((id *)&location, self);
          callbackQueue = self->_callbackQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100D6B768;
          block[3] = &unk_1012F2118;
          objc_copyWeak(v40, (id *)&location);
          v40[1] = *(id *)&v16;
          v40[2] = *(id *)&v15;
          v40[3] = *(id *)&v34;
          dispatch_async(callbackQueue, block);
          objc_destroyWeak(v40);
          objc_destroyWeak((id *)&location);
LABEL_19:

          return;
        }
        unint64_t v7 = sub_100D6ACF0();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int location = 134218496;
          double location_4 = v16 * 100.0;
          __int16 v43 = 2048;
          double v44 = v15 * 100.0;
          __int16 v45 = 2048;
          double v46 = v34 * 100.0;
          id v8 = "_checkBattery: batteryPercentage changed from: %.2lf (RG) to: %.2lf (VG), which is less than threshold: %"
               ".2lf -> ignoring";
          int v9 = v7;
          os_log_type_t v10 = OS_LOG_TYPE_INFO;
          uint32_t v11 = 32;
          goto LABEL_17;
        }
      }
      else
      {
        unint64_t v7 = sub_100D6ACF0();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(location) = 0;
          id v8 = "_checkBattery: user is not driving an EV -> ignoring.";
          int v9 = v7;
          os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
          uint32_t v11 = 2;
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&location, v11);
        }
      }

      goto LABEL_19;
    }
  }
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4 = a3;
  id v5 = sub_100D6ACF0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didUpdateRouteGenius: %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D6B990;
  v8[3] = &unk_1012E5D58;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workQueue, v8);
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = sub_100D6ACF0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "virtualGarageDidUpdate: %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100D6BB18;
  v8[3] = &unk_1012E5D58;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workQueue, v8);
}

- (CarRouteGeniusVehicleBatteryMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarRouteGeniusVehicleBatteryMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (CarRouteGeniusService)routeGeniusService
{
  return self->_routeGeniusService;
}

- (void)setRouteGeniusService:(id)a3
{
}

- (VGVirtualGarageService)garageService
{
  return self->_garageService;
}

- (void)setGarageService:(id)a3
{
}

- (GEORouteAttributes)currentRouteAttributes
{
  return self->_currentRouteAttributes;
}

- (VGVehicleState)currentVehicleState
{
  return self->_currentVehicleState;
}

- (BOOL)needsCheckBattery
{
  return self->_needsCheckBattery;
}

- (void)setNeedsCheckBattery:(BOOL)a3
{
  self->_needsCheckBattery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_currentRouteAttributes, 0);
  objc_storeStrong((id *)&self->_garageService, 0);
  objc_storeStrong((id *)&self->_routeGeniusService, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end