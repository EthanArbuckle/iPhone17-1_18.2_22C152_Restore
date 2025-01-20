@interface WRM_SpeedTestSchedulerServices
- (BOOL)ifScheduleSpeedTestAfterReboot:(BOOL)a3 probability:(int)a4;
- (WRM_SpeedTestSchedulerServices)initWithWaitTime:(double)a3;
@end

@implementation WRM_SpeedTestSchedulerServices

- (WRM_SpeedTestSchedulerServices)initWithWaitTime:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_SpeedTestSchedulerServices;
  return [(WRM_SpeedTestSchedulerServices *)&v4 init];
}

- (BOOL)ifScheduleSpeedTestAfterReboot:(BOOL)a3 probability:(int)a4
{
  return 0;
}

@end