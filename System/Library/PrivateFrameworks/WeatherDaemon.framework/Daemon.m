@interface Daemon
- (_TtC8weatherd6Daemon)init;
@end

@implementation Daemon

- (_TtC8weatherd6Daemon)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_100008AD0((uint64_t)self + OBJC_IVAR____TtC8weatherd6Daemon_activityManager);

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8weatherd6Daemon_severeNotificationsManager;
  sub_100008AD0((uint64_t)v3);
}

@end