@interface _DASSleepWakeMonitor
+ (id)sharedMonitorWithDaemon:(id)a3;
- (BOOL)canRunInCurrentWakeState:(id)a3;
- (BOOL)hasFinishedRunningSinceLastWake:(id)a3;
- (BOOL)inADarkWake;
- (BOOL)shouldIgnoreThermalNotifications;
- (id)wakeStateDescription;
- (int)darkWakeCount;
- (int)darkWakeRunningActivities;
- (int)pushWakeCount;
- (int)pushWakeRunningActivities;
- (unsigned)wakeState;
- (void)setDarkWakeCount:(int)a3;
- (void)setDarkWakeRunningActivities:(int)a3;
- (void)setPushWakeCount:(int)a3;
- (void)setPushWakeRunningActivities:(int)a3;
@end

@implementation _DASSleepWakeMonitor

+ (id)sharedMonitorWithDaemon:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DF384;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C44B0 != -1) {
    dispatch_once(&qword_1001C44B0, block);
  }
  v3 = (void *)qword_1001C44B8;

  return v3;
}

- (BOOL)inADarkWake
{
  return 0;
}

- (BOOL)shouldIgnoreThermalNotifications
{
  return 0;
}

- (unsigned)wakeState
{
  return -1;
}

- (id)wakeStateDescription
{
  return &stru_100179948;
}

- (BOOL)canRunInCurrentWakeState:(id)a3
{
  return 1;
}

- (BOOL)hasFinishedRunningSinceLastWake:(id)a3
{
  return 0;
}

- (int)darkWakeCount
{
  return self->_darkWakeCount;
}

- (void)setDarkWakeCount:(int)a3
{
  self->_darkWakeCount = a3;
}

- (int)pushWakeCount
{
  return self->_pushWakeCount;
}

- (void)setPushWakeCount:(int)a3
{
  self->_pushWakeCount = a3;
}

- (int)darkWakeRunningActivities
{
  return self->_darkWakeRunningActivities;
}

- (void)setDarkWakeRunningActivities:(int)a3
{
  self->_darkWakeRunningActivities = a3;
}

- (int)pushWakeRunningActivities
{
  return self->_pushWakeRunningActivities;
}

- (void)setPushWakeRunningActivities:(int)a3
{
  self->_pushWakeRunningActivities = a3;
}

@end