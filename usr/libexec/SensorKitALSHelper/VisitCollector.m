@interface VisitCollector
+ (void)initialize;
- (VisitCollector)initWithLaunchEvents:(id)a3 sensorWriter:(id)a4 routineManager:(id)a5 q:(id)a6;
- (double)visitsQueryWindowShift;
- (void)dealloc;
- (void)launchEventRunActivity:(id)a3;
- (void)sensorWriterDidStopMonitoring:(id)a3;
- (void)sensorWriterWillStartMonitoring:(id)a3;
- (void)writeVisitsWithCompletionHandler:(id)a3;
@end

@implementation VisitCollector

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002A9D0 = (uint64_t)os_log_create("com.apple.SensorKit", "SensorKitVisitCollector");
  }
}

- (VisitCollector)initWithLaunchEvents:(id)a3 sensorWriter:(id)a4 routineManager:(id)a5 q:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)VisitCollector;
  v10 = [(VisitCollector *)&v13 init];
  if (v10)
  {
    v10->_sensorWriter = (SRSensorWriter *)a4;
    v10->_queue = (OS_dispatch_queue *)a6;
    v10->_rtManager = (RTRoutineManager *)a5;
    v11 = (RDLaunchEvents *)a3;
    v10->_launchEvents = v11;
    if (v11) {
      objc_storeWeak((id *)&v11->_delegate, v10);
    }
    [(SRSensorWriter *)v10->_sensorWriter setDelegate:v10];
  }
  return v10;
}

- (void)dealloc
{
  self->_sensorWriter = 0;
  self->_queue = 0;

  self->_launchEvents = 0;
  self->_rtManager = 0;
  v3.receiver = self;
  v3.super_class = (Class)VisitCollector;
  [(VisitCollector *)&v3 dealloc];
}

- (double)visitsQueryWindowShift
{
  id v2 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"kVisitsQueryWindowShiftKey"];
  double v3 = 14400.0;
  if (v2)
  {
    v4 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 doubleValue];
      double v6 = v5;
      if (v5 >= 0.0)
      {
        return v5;
      }
      else
      {
        v7 = qword_10002A9D0;
        if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_ERROR))
        {
          int v9 = 134218240;
          double v10 = v6;
          __int16 v11 = 2048;
          uint64_t v12 = 0x40CC200000000000;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Negative value (%f) for query window shift is not supported. Valid range [0..n] seconds. Default value (%f) will be applied", (uint8_t *)&v9, 0x16u);
        }
      }
    }
  }
  return v3;
}

- (void)writeVisitsWithCompletionHandler:(id)a3
{
  if ([(SRSensorWriter *)self->_sensorWriter isMonitoring])
  {
    objc_initWeak(location, self);
    rtManager = self->_rtManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004FB0;
    v7[3] = &unk_100024948;
    objc_copyWeak(&v8, location);
    v7[4] = a3;
    [(RTRoutineManager *)rtManager fetchLocationsOfInterestOfType:0 withHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }
  else
  {
    double v6 = qword_10002A9D0;
    if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "VisitCollection running but writer is not monitoring", (uint8_t *)location, 2u);
    }
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  v4 = qword_10002A9D0;
  if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "start visist metrics recording", v6, 2u);
  }
  launchEvents = self->_launchEvents;
  CFStringRef v7 = @"com.apple.sensorkit.fetchVisits";
  [(RDLaunchEvents *)launchEvents registerForXPCActivities:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (void)sensorWriterDidStopMonitoring:(id)a3
{
  v4 = qword_10002A9D0;
  if (os_log_type_enabled((os_log_t)qword_10002A9D0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "stop visit metrics recording", v6, 2u);
  }
  launchEvents = self->_launchEvents;
  CFStringRef v7 = @"com.apple.sensorkit.fetchVisits";
  [(RDLaunchEvents *)launchEvents unregisterForXPCActivities:+[NSArray arrayWithObjects:&v7 count:1]];
  [+[NSUserDefaults standardUserDefaults] setObject:0 forKey:@"kCurrentMonitoringLastTimestamp"];
}

- (void)launchEventRunActivity:(id)a3
{
  v4 = self;
  if (self) {
    self = (VisitCollector *)self->_queue;
  }
  dispatch_assert_queue_V2(&self->super);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005580;
  v5[3] = &unk_100024970;
  v5[4] = a3;
  [(VisitCollector *)v4 writeVisitsWithCompletionHandler:v5];
}

@end