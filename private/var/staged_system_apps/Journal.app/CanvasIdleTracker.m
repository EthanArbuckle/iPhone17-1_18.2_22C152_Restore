@interface CanvasIdleTracker
- (void)inactivityTimerDidFire;
@end

@implementation CanvasIdleTracker

- (void)inactivityTimerDidFire
{
  swift_retain();
  sub_10023F6AC();

  swift_release();
}

@end