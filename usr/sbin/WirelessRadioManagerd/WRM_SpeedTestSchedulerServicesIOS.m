@interface WRM_SpeedTestSchedulerServicesIOS
- (BOOL)ifNoActiveVoiceCall;
- (BOOL)ifScheduleSpeedTestAfterReboot:(BOOL)a3 probability:(int)a4;
- (WRM_SpeedTestSchedulerServicesIOS)initWithWaitTime:(double)a3;
- (void)abort;
- (void)dealloc;
- (void)scheduleTests:(int)a3 :(id)a4;
@end

@implementation WRM_SpeedTestSchedulerServicesIOS

- (WRM_SpeedTestSchedulerServicesIOS)initWithWaitTime:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WRM_SpeedTestSchedulerServicesIOS;
  v4 = [(WRM_SpeedTestSchedulerServicesIOS *)&v6 init];
  if (v4)
  {
    +[WCM_Logging logLevel:22 message:@"CellularThroughput: In WRM_SpeedTestSchedulerServicesIOS"];
    v4->waitTime = a3;
    v4->mQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wirelessdataanalytics.SpeedTestScheduler", 0);
  }
  return v4;
}

- (BOOL)ifScheduleSpeedTestAfterReboot:(BOOL)a3 probability:(int)a4
{
  if (!a3) {
    return 1;
  }
  signed int v5 = arc4random_uniform(0xAu);
  int v6 = a4 / -10 + 9;
  BOOL v7 = v5 <= v6;
  BOOL v8 = v5 > v6;
  v9 = "NO";
  if (!v7) {
    v9 = "YES";
  }
  +[WCM_Logging logLevel:22, @"CellularThroughput ifScheduleSpeedTestAfterReboot: %s", v9 message];
  return v8;
}

- (BOOL)ifNoActiveVoiceCall
{
  return [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") isCallActive] ^ 1];
}

- (void)scheduleTests:(int)a3 :(id)a4
{
  dispatch_time_t v7 = dispatch_time(0, 120000000000);
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068EEC;
  block[3] = &unk_10020EBC0;
  int v10 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_after(v7, mQueue, block);
}

- (void)abort
{
  cellularTestStartRef = self->cellularTestStartRef;
  if (cellularTestStartRef) {
    [(WRM_SpeedTestConfigIOS *)cellularTestStartRef abort];
  }
}

- (void)dealloc
{
  cellularTestStartRef = self->cellularTestStartRef;
  if (cellularTestStartRef)
  {

    self->cellularTestStartRef = 0;
  }
  mQueue = self->mQueue;
  if (mQueue)
  {
    dispatch_release(mQueue);
    self->mQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WRM_SpeedTestSchedulerServicesIOS;
  [(WRM_SpeedTestSchedulerServicesIOS *)&v5 dealloc];
}

@end