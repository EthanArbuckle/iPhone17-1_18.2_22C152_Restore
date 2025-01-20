@interface VehicleMonitoringTask
+ (int64_t)creationPreference;
- (RoutePlanningSession)routePlanningSession;
- (VehicleMonitoringTask)init;
- (void)_checkBatteryStateWithGarage:(id)a3;
- (void)_loadGarageWithCompletion:(id)a3;
- (void)_syncSelectedVehicleStateWithGarage:(id)a3;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5;
- (void)setRoutePlanningSession:(id)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation VehicleMonitoringTask

- (VehicleMonitoringTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)VehicleMonitoringTask;
  v2 = [(VehicleMonitoringTask *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("VehicleMonitoringTask", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)setRoutePlanningSession:(id)a3
{
  v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  objc_super v7 = v5;
  if (routePlanningSession != v5)
  {
    [(RoutePlanningSession *)routePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
    self->_hasReportedRoutePlanningSession = 0;
    if (self->_routePlanningSession) {
      [(VehicleMonitoringTask *)self _syncSelectedVehicleStateWithGarage:0];
    }
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005EB144;
  v12[3] = &unk_1012E9340;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a5 == 1 && !self->_hasReportedRoutePlanningSession)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100103DEC;
    v23 = sub_100104780;
    id v24 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1005EB598;
    v18[3] = &unk_1012EED18;
    v18[4] = &v19;
    [v9 withValue:v18 orError:&stru_1012F1BF0];
    id v11 = [(id)v20[5] currentRoute];
    if ([v11 isEVRoute])
    {
      v12 = +[VGVirtualGarageService sharedService];
      id v13 = [v12 activeVehicleIdentifier];

      if (v13)
      {
        objc_initWeak(&location, self);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1005EB5AC;
        v14[3] = &unk_1012F1C40;
        objc_copyWeak(&v16, &location);
        id v15 = v13;
        [(VehicleMonitoringTask *)self _loadGarageWithCompletion:v14];

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
    _Block_object_dispose(&v19, 8);
  }
}

- (void)_loadGarageWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[VGVirtualGarageService sharedService];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005EB884;
  v7[3] = &unk_1012F1C68;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 virtualGarageGetGarageWithReply:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005EBACC;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_syncSelectedVehicleStateWithGarage:(id)a3
{
  if (a3)
  {
    id v3 = [a3 selectedVehicle];
    sub_1005EBBD8(v3, (VGVehicle *)v3);
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1005EBD64;
    v4[3] = &unk_1012F1D10;
    v5 = &stru_1012F1CA8;
    [(VehicleMonitoringTask *)self _loadGarageWithCompletion:v4];
  }
}

- (void)_checkBatteryStateWithGarage:(id)a3
{
  id v4 = [a3 selectedVehicle];
  id v25 = [v4 currentVehicleState];

  if (self->_hasReportedBatteryState || v25 == 0)
  {
    id v6 = +[VGVirtualGarageService sharedService];
    [v6 unregisterObserver:self];
  }
  else if (self->_isNavigating)
  {
    id v7 = [v25 maxBatteryCapacity];
    [v7 doubleValue];
    double v9 = v8;
    id v10 = [v25 minBatteryCapacity];
    [v10 doubleValue];
    double v12 = vabdd_f64(v9, v11);

    if (v12 > 2.22044605e-16)
    {
      id v13 = [v25 currentBatteryCapacity];
      [v13 doubleValue];
      double v15 = v14;
      id v16 = [v25 maxBatteryCapacity];
      [v16 doubleValue];
      double v18 = v17;
      uint64_t v19 = [v25 minBatteryCapacity];
      [v19 doubleValue];
      double v21 = v15 / (v18 - v20);

      GEOConfigGetDouble();
      if (v21 < v22)
      {
        v23 = +[MKMapService sharedService];
        [v23 captureUserAction:6091 onTarget:0 eventValue:0];

        id v24 = +[NavigationFeedbackCollector sharedFeedbackCollector];
        [v24 vehicleBatteryDied];

        self->_hasReportedBatteryState = 1;
      }
    }
  }
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end