@interface FMDMotionMonitor
- (CMMotionActivityManager)motionActivityManager;
- (FMDDeviceMotion)lastKnownDeviceMotion;
- (NSOperationQueue)activityUpdateQueue;
- (id)_deviceMotionFrom:(id)a3;
- (void)setActivityUpdateQueue:(id)a3;
- (void)setLastKnownDeviceMotion:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)startMotionMonitoring;
- (void)stopMotionMonitoring;
@end

@implementation FMDMotionMonitor

- (void)startMotionMonitoring
{
  if (!self->_motionActivityManager)
  {
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10004AE04;
    v2[3] = &unk_1002D93C8;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)stopMotionMonitoring
{
  if (self->_motionActivityManager)
  {
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10004B074;
    v2[3] = &unk_1002D93C8;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (id)_deviceMotionFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FMDDeviceMotion);
  if ([v3 automotive])
  {
    uint64_t v5 = 5;
  }
  else if ([v3 cycling])
  {
    uint64_t v5 = 4;
  }
  else if ([v3 running])
  {
    uint64_t v5 = 3;
  }
  else if ([v3 walking])
  {
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = [v3 stationary];
  }
  [(FMDDeviceMotion *)v4 setActivityState:v5];
  v6 = [v3 startDate];
  [(FMDDeviceMotion *)v4 setActivityStartDate:v6];

  return v4;
}

- (FMDDeviceMotion)lastKnownDeviceMotion
{
  return (FMDDeviceMotion *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastKnownDeviceMotion:(id)a3
{
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (NSOperationQueue)activityUpdateQueue
{
  return self->_activityUpdateQueue;
}

- (void)setActivityUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUpdateQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);

  objc_storeStrong((id *)&self->_lastKnownDeviceMotion, 0);
}

@end