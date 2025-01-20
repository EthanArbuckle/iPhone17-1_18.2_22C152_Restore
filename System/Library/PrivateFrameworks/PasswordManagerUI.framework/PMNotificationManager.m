@interface PMNotificationManager
- (_TtC17PasswordManagerUI21PMNotificationManager)init;
- (void)notificationManager:(id)a3 didReceiveResponseOfType:(int64_t)a4 toNotificationOfType:(int64_t)a5 withUserInfo:(id)a6;
@end

@implementation PMNotificationManager

- (_TtC17PasswordManagerUI21PMNotificationManager)init
{
  return (_TtC17PasswordManagerUI21PMNotificationManager *)PMNotificationManager.init()();
}

- (void)notificationManager:(id)a3 didReceiveResponseOfType:(int64_t)a4 toNotificationOfType:(int64_t)a5 withUserInfo:(id)a6
{
  uint64_t v10 = sub_258D6F338();
  id v11 = a3;
  v12 = self;
  sub_258BFC574(a4, a5, v10);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI21PMNotificationManager_notificationManager));
  sub_258921D90((uint64_t)self + OBJC_IVAR____TtC17PasswordManagerUI21PMNotificationManager__accountWithRecentlyCreatedPasskey, &qword_26A0B15E0);
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI21PMNotificationManager___observationRegistrar;
  uint64_t v4 = sub_258D6B9C8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end