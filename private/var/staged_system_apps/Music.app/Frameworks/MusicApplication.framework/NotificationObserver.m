@interface NotificationObserver
- (void)handleNotification:(id)a3;
@end

@implementation NotificationObserver

- (void)handleNotification:(id)a3
{
  uint64_t v3 = sub_AB03C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB0380();
  swift_retain();
  sub_7BA6AC((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end