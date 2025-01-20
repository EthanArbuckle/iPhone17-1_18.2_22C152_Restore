@interface NotificationsManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8weatherd20NotificationsManager)init;
- (void)evaluateWith:(id)a3;
- (void)scheduleWith:(id)a3;
- (void)unregisterWith:(id)a3;
- (void)validateWith:(id)a3;
@end

@implementation NotificationsManager

- (_TtC8weatherd20NotificationsManager)init
{
}

- (void).cxx_destruct
{
  sub_100008AD0((uint64_t)self + OBJC_IVAR____TtC8weatherd20NotificationsManager_precipitationNotificationsManager);
  sub_100008AD0((uint64_t)self + OBJC_IVAR____TtC8weatherd20NotificationsManager_severeNotificationsManager);
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  NotificationsManager.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v8, (NSXPCConnection)v7);

  return 1;
}

- (void)scheduleWith:(id)a3
{
}

- (void)evaluateWith:(id)a3
{
}

- (void)unregisterWith:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  NotificationsManager.unregister(with:)((uint64_t)sub_100047130, v5);

  swift_release();
}

- (void)validateWith:(id)a3
{
}

@end