@interface _DASBacklightStateMonitor
+ (_DASBacklightStateMonitor)sharedInstance;
- (BOOL)isBacklightOff;
- (OS_dispatch_queue)queue;
- (_DASBacklightStateMonitor)init;
- (int64_t)currentState;
- (int64_t)state;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)registerForBacklightUpdates;
- (void)setCurrentState:(int64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASBacklightStateMonitor

- (int64_t)state
{
  return self->_currentState;
}

- (BOOL)isBacklightOff
{
  return self->_currentState == 0;
}

- (_DASBacklightStateMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASBacklightStateMonitor;
  v2 = [(_DASBacklightStateMonitor *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.duetactivityscheduler.backlightstatemonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = +[BLSBacklight sharedBacklight];
    v2->_int64_t currentState = (int64_t)[v6 backlightState];

    v7 = +[_DASDaemonLogger logForCategory:@"BacklightStateMonitor"];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentState = v2->_currentState;
      *(_DWORD *)buf = 134217984;
      int64_t v12 = currentState;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initial BacklightState: %ld.", buf, 0xCu);
    }

    [(_DASBacklightStateMonitor *)v2 registerForBacklightUpdates];
  }
  return v2;
}

+ (_DASBacklightStateMonitor)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DF62C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C44C0 != -1) {
    dispatch_once(&qword_1001C44C0, block);
  }
  v2 = (void *)qword_1001C44C8;

  return (_DASBacklightStateMonitor *)v2;
}

- (void)registerForBacklightUpdates
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000DF730;
  v5[3] = &unk_1001753B0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  if (self->_currentState != a4)
  {
    self->_int64_t currentState = a4;
    id v6 = +[_DASDaemonLogger logForCategory:@"BacklightStateMonitor"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentState = self->_currentState;
      *(_DWORD *)buf = 134217984;
      int64_t v12 = currentState;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BacklightState: %ld.", buf, 0xCu);
    }

    v8 = +[_DASDaemon sharedInstance];
    CFStringRef v10 = @"com.apple.das.restartpolicy.backlightOn";
    v9 = +[NSArray arrayWithObjects:&v10 count:1];
    [v8 handleTriggersBatched:v9];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_int64_t currentState = a3;
}

- (void).cxx_destruct
{
}

@end