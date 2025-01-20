@interface NotificationCoreServiceListener
- (_TtC21UserNotificationsCore31NotificationCoreServiceListener)init;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation NotificationCoreServiceListener

- (_TtC21UserNotificationsCore31NotificationCoreServiceListener)init
{
  result = (_TtC21UserNotificationsCore31NotificationCoreServiceListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore31NotificationCoreServiceListener_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore31NotificationCoreServiceListener_queue_listener));

  swift_bridgeObjectRelease();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_2609A84A8(v8);

  swift_unknownObjectRelease();
}

@end