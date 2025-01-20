@interface BeaconNearOwnerService
- (void)nearOwnerMonitoringTimerFired;
- (void)scanTimerFired;
@end

@implementation BeaconNearOwnerService

- (void)scanTimerFired
{
  swift_retain();
  sub_10036C310();

  swift_release();
}

- (void)nearOwnerMonitoringTimerFired
{
}

@end