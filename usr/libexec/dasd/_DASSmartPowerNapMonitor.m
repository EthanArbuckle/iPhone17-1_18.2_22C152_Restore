@interface _DASSmartPowerNapMonitor
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BOOL)inSmartPowerNap;
- (OS_dispatch_queue)queue;
- (_DASDaemon)daemon;
- (_DASSmartPowerNapMonitor)initWithDaemon:(id)a3;
- (_PMCoreSmartPowerNap)smartPowerNapMonitor;
- (unsigned)currentState;
- (unsigned)state;
- (void)handleSmartPowerNapNotification:(unsigned __int8)a3;
- (void)registerForSmartPowerNapNotifications;
- (void)setCurrentState:(unsigned __int8)a3;
- (void)setDaemon:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSmartPowerNapMonitor:(id)a3;
@end

@implementation _DASSmartPowerNapMonitor

- (unsigned)state
{
  return self->_currentState;
}

- (BOOL)inSmartPowerNap
{
  return self->_currentState == 1;
}

- (void)handleSmartPowerNapNotification:(unsigned __int8)a3
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    daemon = self->_daemon;
    if (a3 == 1) {
      CFStringRef v4 = @"Entered SmartPowerNap";
    }
    else {
      CFStringRef v4 = @"Exit SmartPowerNap";
    }
    [(_DASDaemon *)daemon evaluateScoreAndRunAllActivitiesForReason:v4];
  }
}

- (void)registerForSmartPowerNapNotifications
{
  v3 = (_PMCoreSmartPowerNap *)objc_alloc_init((Class)_PMCoreSmartPowerNap);
  smartPowerNapMonitor = self->_smartPowerNapMonitor;
  self->_smartPowerNapMonitor = v3;

  v5 = self->_smartPowerNapMonitor;
  if (v5)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004A0CC;
    v7[3] = &unk_1001761B0;
    v7[4] = self;
    [(_PMCoreSmartPowerNap *)v5 registerWithCallback:queue callback:v7];
  }
}

- (_DASSmartPowerNapMonitor)initWithDaemon:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DASSmartPowerNapMonitor;
  v6 = [(_DASSmartPowerNapMonitor *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.duetactivityscheduler.smartpowernapmonitor", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    [(_DASSmartPowerNapMonitor *)v7 registerForSmartPowerNapNotifications];
  }

  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004A248;
  v8[3] = &unk_100175F40;
  id v9 = a3;
  id v10 = a1;
  uint64_t v4 = qword_1001C3D38;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_1001C3D38, v8);
  }
  id v6 = (id)qword_1001C3D40;

  return v6;
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (_PMCoreSmartPowerNap)smartPowerNapMonitor
{
  return self->_smartPowerNapMonitor;
}

- (void)setSmartPowerNapMonitor:(id)a3
{
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unsigned __int8)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartPowerNapMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end