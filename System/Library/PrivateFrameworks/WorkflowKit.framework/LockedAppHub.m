@interface LockedAppHub
- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4;
@end

@implementation LockedAppHub

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  id v4 = a3;
  swift_retain();
  sub_1C823D230();

  swift_release();
}

@end