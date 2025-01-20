@interface _DASTimer
+ (_DASTimer)timerWithCallback:(id)a3;
- (NSDictionary)previousWakeRequestDictionary;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASTimer)initWithCallback:(id)a3;
- (id)callback;
- (void)cancelPreviousWakeRequest;
- (void)requestSystemWakeOBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5;
- (void)requestSystemWakeOnBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5 cancelPrevious:(BOOL)a6;
- (void)scheduleOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6;
- (void)setCallback:(id)a3;
- (void)setPreviousWakeRequestDictionary:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASTimer

- (void)scheduleOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a3;
  dispatch_suspend((dispatch_object_t)self->_timer);
  double v10 = a5 - a4;
  if (v6)
  {
    v11 = +[NSDate dateWithTimeIntervalSinceNow:a4 + 10.0];
    [(_DASTimer *)self requestSystemWakeOnBehalfOf:v15 at:v11 withLeeway:1 cancelPrevious:v10 + -10.0];

    unint64_t v12 = 10;
  }
  else
  {
    unint64_t v12 = (unint64_t)fmax(v10, 1.0);
  }
  timer = self->_timer;
  dispatch_time_t v14 = dispatch_walltime(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(timer, v14, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * v12);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (id)callback
{
  return self->_callback;
}

- (_DASTimer)initWithCallback:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_DASTimer;
  id v5 = [(_DASTimer *)&v18 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.das.dastimerqueue", v8);
    double v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v5 + 2));
    unint64_t v12 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v11;

    dispatch_set_qos_class_fallback();
    dispatch_source_set_timer(*((dispatch_source_t *)v5 + 3), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    objc_initWeak(&location, v5);
    v13 = *((void *)v5 + 3);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000A72C;
    v15[3] = &unk_1001753B0;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_resume(*((dispatch_object_t *)v5 + 3));
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return (_DASTimer *)v5;
}

+ (_DASTimer)timerWithCallback:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithCallback:v3];

  return (_DASTimer *)v4;
}

- (void)cancelPreviousWakeRequest
{
  CFDateRef time_to_wake = [(NSDictionary *)self->_previousWakeRequestDictionary objectForKeyedSubscript:@"time"];
  id v3 = [(NSDictionary *)self->_previousWakeRequestDictionary objectForKeyedSubscript:@"scheduledby"];
  if (time_to_wake) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    IOPMCancelScheduledPowerEvent(time_to_wake, v3, @"wake");
  }
}

- (void)requestSystemWakeOBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5
{
}

- (void)requestSystemWakeOnBehalfOf:(id)a3 at:(id)a4 withLeeway:(double)a5 cancelPrevious:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = +[NSMutableDictionary dictionary];
  [v12 setObject:v11 forKeyedSubscript:@"time"];

  v13 = +[NSNumber numberWithInteger:(uint64_t)a5];
  [v12 setObject:v13 forKeyedSubscript:@"leeway"];

  dispatch_time_t v14 = +[NSString stringWithFormat:@"%@.%@", _DASDaemonServiceName, v10];
  [v12 setObject:v14 forKeyedSubscript:@"scheduledby"];

  if (v6)
  {
    [(_DASTimer *)self cancelPreviousWakeRequest];
    id v15 = +[NSDictionary dictionaryWithDictionary:v12];
    previousWakeRequestDictionary = self->_previousWakeRequestDictionary;
    self->_previousWakeRequestDictionary = v15;
  }
  if (IOPMRequestSysWake())
  {
    v17 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to request system wake for %@", buf, 0xCu);
    }
  }
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSDictionary)previousWakeRequestDictionary
{
  return self->_previousWakeRequestDictionary;
}

- (void)setPreviousWakeRequestDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousWakeRequestDictionary, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_callback, 0);
}

@end