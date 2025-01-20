@interface AccountUserNotificationDaemonService
- (void)postAccountUserNotificationWith:(id)a3 completion:(id)a4;
@end

@implementation AccountUserNotificationDaemonService

- (void)postAccountUserNotificationWith:(id)a3 completion:(id)a4
{
  v5 = (objc_class *)_Block_copy(a4);
  v6 = swift_allocObject();
  v6[2].isa = v5;
  id v7 = a3;
  swift_retain();
  sub_1000A0AE0(v7, sub_10009EA5C, v6);

  swift_release();

  swift_release();
}

@end