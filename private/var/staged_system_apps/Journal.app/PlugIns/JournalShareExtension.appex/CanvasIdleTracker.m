@interface CanvasIdleTracker
- (void)inactivityTimerDidFire;
@end

@implementation CanvasIdleTracker

- (void)inactivityTimerDidFire
{
  swift_retain();
  sub_10009C61C();

  swift_release();
}

@end