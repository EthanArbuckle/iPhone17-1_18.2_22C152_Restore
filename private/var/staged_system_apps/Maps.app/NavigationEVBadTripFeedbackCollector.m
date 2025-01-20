@interface NavigationEVBadTripFeedbackCollector
- (BOOL)_checkForBadTrip;
- (BOOL)isBadTrip;
- (BOOL)isRecording;
- (GEOComposedRoute)observedRoute;
- (MNNavigationService)navigationService;
- (NSDictionary)stepIDToExpectedEVInfos;
- (NSMutableArray)routeInfos;
- (NavigationEVBadTripFeedbackCollector)initWithNavigationService:(id)a3 virtualGarageService:(id)a4;
- (OS_dispatch_queue)queue;
- (VGVehicleState)currentVehicleState;
- (VGVirtualGarageService)virtualGarageService;
- (void)_rebuildExpectedEVInfos;
- (void)_reset;
- (void)_virtualGarageDidBecomeAvailable;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5;
- (void)setCurrentVehicleState:(id)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setNavigationService:(id)a3;
- (void)setObservedRoute:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRouteInfos:(id)a3;
- (void)setStepIDToExpectedEVInfos:(id)a3;
- (void)setVirtualGarageService:(id)a3;
- (void)startRecording;
- (void)stopRecording;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation NavigationEVBadTripFeedbackCollector

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C5D8;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setCurrentVehicleState:(id)a3
{
  id v5 = a3;
  currentVehicleState = self->_currentVehicleState;
  p_currentVehicleState = &self->_currentVehicleState;
  unint64_t v8 = (unint64_t)v5;
  id v9 = currentVehicleState;
  if (v8 | (unint64_t)v9)
  {
    v10 = v9;
    unsigned __int8 v11 = [(id)v8 isEqual:v9];

    if ((v11 & 1) == 0)
    {
      objc_storeStrong((id *)p_currentVehicleState, a3);
      v12 = sub_10010A0F0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = [(id)v8 identifier];
        v14 = [(id)v8 currentBatteryCharge];
        int v15 = 138412546;
        v16 = v13;
        __int16 v17 = 2048;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "currentVehicleState was changed to: %@, battery charge (Wh): %lu", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)_virtualGarageDidBecomeAvailable
{
  if ((MapsFeature_IsEnabled_EVRouting() & 1) != 0 || MapsFeature_IsEnabled_Alberta())
  {
    v3 = sub_10010A0F0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "virtualGarageDidBecomeAvailable fetching garage", (uint8_t *)buf, 2u);
    }

    [(VGVirtualGarageService *)self->_virtualGarageService registerObserver:self];
    objc_initWeak(buf, self);
    virtualGarageService = self->_virtualGarageService;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000271DC;
    v5[3] = &unk_1012E65A8;
    objc_copyWeak(&v6, buf);
    [(VGVirtualGarageService *)virtualGarageService virtualGarageGetGarageWithReply:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

- (NavigationEVBadTripFeedbackCollector)initWithNavigationService:(id)a3 virtualGarageService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NavigationEVBadTripFeedbackCollector;
  id v9 = [(NavigationEVBadTripFeedbackCollector *)&v15 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("NavigationFeedbackEVBadTripCollector", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_navigationService, a3);
    [(MNNavigationService *)v9->_navigationService registerObserver:v9];
    objc_storeStrong((id *)&v9->_virtualGarageService, a4);
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v9 selector:"_virtualGarageDidBecomeAvailable" name:off_1015F22B0 object:0];
  }
  return v9;
}

- (void)startRecording
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10066446C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopRecording
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100664600;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isBadTrip
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100664728;
  v5[3] = &unk_1012E67C0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_checkForBadTrip
{
  v2 = self;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  char v3 = self->_routeInfos;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v53 objects:v71 count:16];
  if (!v4)
  {

    goto LABEL_23;
  }
  id v5 = v4;
  v50 = v2;
  uint64_t v6 = *(void *)v54;
  double v7 = 0.0;
  double v8 = 0.0;
  uint64_t v51 = *(void *)v54;
  v52 = v3;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v54 != v6) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      uint64_t v11 = [v10 initialBatteryCharge];
      if (v11)
      {
        v12 = (void *)v11;
        uint64_t v13 = [v10 realArrivalBatteryCharge];
        if (v13)
        {
          v14 = (void *)v13;
          objc_super v15 = [v10 expectedArrivalBatteryCharge];

          if (v15)
          {
            v16 = [v10 realArrivalBatteryCharge];
            [v16 doubleValue];
            double v18 = v17;
            v19 = [v10 expectedArrivalBatteryCharge];
            [v19 doubleValue];
            double v21 = v18 - v20;

            v22 = [v10 realArrivalBatteryCharge];
            [v22 doubleValue];
            double v24 = v23;
            v25 = [v10 initialBatteryCharge];
            [v25 doubleValue];
            double v27 = vabdd_f64(v24, v26);

            double v8 = v8 + v21;
            double v7 = v7 + v27;
            v28 = sub_10010A0F0();
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
              goto LABEL_15;
            }
            v29 = [v10 route];
            double v30 = COERCE_DOUBLE([v29 serverIdentifier]);
            v31 = [v10 lastTraversedStep];
            double v32 = COERCE_DOUBLE([v31 stepIndex]);
            double v33 = [v10 initialBatteryCharge];
            v34 = [v10 realArrivalBatteryCharge];
            v35 = [v10 expectedArrivalBatteryCharge];
            *(_DWORD *)buf = 134219522;
            double v58 = v30;
            __int16 v59 = 2048;
            double v60 = v32;
            __int16 v61 = 2048;
            double v62 = v21;
            __int16 v63 = 2048;
            double v64 = v27;
            __int16 v65 = 2112;
            double v66 = v33;
            __int16 v67 = 2112;
            v68 = v34;
            __int16 v69 = 2112;
            v70 = v35;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Added new segment (%lu lastTraveledStep: %lu) with delta: %.4f, consumption: %.2f, initial: %@, real: %@, expected: %@", buf, 0x48u);

            uint64_t v6 = v51;
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      v28 = sub_10010A0F0();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      v29 = [v10 route];
      double v36 = COERCE_DOUBLE([v29 serverIdentifier]);
      v31 = [v10 lastTraversedStep];
      double v37 = COERCE_DOUBLE([v31 stepIndex]);
      double v33 = [v10 initialBatteryCharge];
      double v38 = [v10 realArrivalBatteryCharge];
      v39 = [v10 expectedArrivalBatteryCharge];
      *(_DWORD *)buf = 134219010;
      double v58 = v36;
      __int16 v59 = 2048;
      double v60 = v37;
      uint64_t v6 = v51;
      __int16 v61 = 2112;
      double v62 = v33;
      __int16 v63 = 2112;
      double v64 = v38;
      __int16 v65 = 2112;
      double v66 = *(double *)&v39;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Will not be able to calculate delta for route: %lu, lastTraveledStep: %lu, initial: %@, real: %@, expected: %@", buf, 0x34u);

LABEL_14:
      char v3 = v52;

LABEL_15:
    }
    id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v53 objects:v71 count:16];
  }
  while (v5);

  v2 = v50;
  if (v7 >= 2.22044605e-16)
  {
    double v40 = fabs(v8 / v7);
    BOOL v41 = v40 > 0.05;
    v42 = sub_10010A0F0();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = @"NO";
      if (v40 > 0.05) {
        v43 = @"YES";
      }
      *(double *)&v44 = COERCE_DOUBLE(v43);
      *(_DWORD *)buf = 134218754;
      double v58 = v8;
      __int16 v59 = 2048;
      double v60 = v7;
      __int16 v61 = 2048;
      double v62 = v8 / v7;
      __int16 v63 = 2112;
      double v64 = *(double *)&v44;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Finished adding up segments. deltaSum: %.4f, consumptionSum: %.2f, result: %.4f, isBadTrip: %@", buf, 0x2Au);
    }
    goto LABEL_31;
  }
LABEL_23:
  v42 = sub_10010A0F0();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v45 = v2->_routeInfos;
    v46 = v45;
    if (v45)
    {
      if ([(NSMutableArray *)v45 count])
      {
        v47 = [(NSMutableArray *)v46 componentsJoinedByString:@", "];
        *(double *)&v48 = +[NSString stringWithFormat:@"<%p> [%@]", v46, v47];
      }
      else
      {
        *(double *)&v48 = +[NSString stringWithFormat:@"<%p> (empty)", v46];
      }
    }
    else
    {
      *(double *)&v48 = COERCE_DOUBLE(@"<nil>");
    }

    *(_DWORD *)buf = 138412290;
    double v58 = *(double *)&v48;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "No consumption for routeInfos: %@", buf, 0xCu);
  }
  BOOL v41 = 0;
LABEL_31:

  return v41;
}

- (void)setObservedRoute:(id)a3
{
  id v4 = a3;
  if (!self->_isRecording)
  {
    id v5 = sub_10010A0F0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "observedRoute called when we are not recording", v10, 2u);
    }

    id v4 = 0;
  }
  objc_storeStrong((id *)&self->_observedRoute, v4);
  if (self->_observedRoute)
  {
    uint64_t v6 = [EVBadTripRouteInfo alloc];
    double v7 = [(NavigationEVBadTripFeedbackCollector *)self observedRoute];
    double v8 = [(NavigationEVBadTripFeedbackCollector *)self currentVehicleState];
    char v9 = [(EVBadTripRouteInfo *)v6 initWithRoute:v7 currentVehicleState:v8];

    [(NSMutableArray *)self->_routeInfos addObject:v9];
    [(NavigationEVBadTripFeedbackCollector *)self _rebuildExpectedEVInfos];
  }
  else
  {
    [(NavigationEVBadTripFeedbackCollector *)self _reset];
  }
}

- (void)_rebuildExpectedEVInfos
{
  if (!self->_observedRoute)
  {
    objc_super v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[NavigationEVBadTripFeedbackCollector _rebuildExpectedEVInfos]";
      __int16 v26 = 2080;
      double v27 = "NavigationEVBadTripFeedbackCollector.m";
      __int16 v28 = 1024;
      int v29 = 248;
      __int16 v30 = 2080;
      v31 = "_observedRoute";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (self->_isRecording && self->_observedRoute)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v18 = self;
    id v4 = [(GEOComposedRoute *)self->_observedRoute steps];
    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v10 = [v9 evInfo];
          if (v10)
          {
            uint64_t v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 stepID]);
            [v3 setObject:v10 forKeyedSubscript:v11];
          }
          else
          {
            uint64_t v11 = sub_10010A0F0();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              unsigned int v12 = [v9 stepID];
              *(_DWORD *)buf = 134217984;
              v25 = (char *)v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "stepID: %lu didn't have evInfo", buf, 0xCu);
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    uint64_t v13 = (NSDictionary *)[v3 copy];
    stepIDToExpectedEVInfos = v18->_stepIDToExpectedEVInfos;
    v18->_stepIDToExpectedEVInfos = v13;
  }
}

- (void)_reset
{
  observedRoute = self->_observedRoute;
  self->_observedRoute = 0;

  id v4 = (NSMutableArray *)objc_opt_new();
  routeInfos = self->_routeInfos;
  self->_routeInfos = v4;

  stepIDToExpectedEVInfos = self->_stepIDToExpectedEVInfos;
  self->_stepIDToExpectedEVInfos = 0;
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100665370;
  v9[3] = &unk_1012E5D58;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100665490;
  v11[3] = &unk_1012EAA08;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
}

- (VGVirtualGarageService)virtualGarageService
{
  return self->_virtualGarageService;
}

- (void)setVirtualGarageService:(id)a3
{
}

- (VGVehicleState)currentVehicleState
{
  return self->_currentVehicleState;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (GEOComposedRoute)observedRoute
{
  return self->_observedRoute;
}

- (NSMutableArray)routeInfos
{
  return self->_routeInfos;
}

- (void)setRouteInfos:(id)a3
{
}

- (NSDictionary)stepIDToExpectedEVInfos
{
  return self->_stepIDToExpectedEVInfos;
}

- (void)setStepIDToExpectedEVInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIDToExpectedEVInfos, 0);
  objc_storeStrong((id *)&self->_routeInfos, 0);
  objc_storeStrong((id *)&self->_observedRoute, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_virtualGarageService, 0);

  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end