@interface RestrictionsController
- (_TtC7MusicUI22RestrictionsController)init;
- (uint64_t)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(void *)a3 userInfo:;
- (void)dealloc;
@end

@implementation RestrictionsController

- (_TtC7MusicUI22RestrictionsController)init
{
  return (_TtC7MusicUI22RestrictionsController *)sub_229E926CC();
}

- (void)dealloc
{
  v2 = self;
  sub_229E9278C();
}

- (uint64_t)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(void *)a3 userInfo:
{
  sub_22A170640();
  id v5 = a3;
  id v6 = a1;
  sub_229E9294C();

  return swift_bridgeObjectRelease();
}

@end