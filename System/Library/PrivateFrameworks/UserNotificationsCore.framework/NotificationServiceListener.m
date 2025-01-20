@interface NotificationServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21UserNotificationsCore27NotificationServiceListener)init;
@end

@implementation NotificationServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7 = objc_allocWithZone((Class)type metadata accessor for NotificationServiceConnection());
  id v8 = a4;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  id v12 = a3;
  v14 = sub_2608E26C8(v11, v10, v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3FC958);
  sub_260A850E0();

  return 1;
}

- (_TtC21UserNotificationsCore27NotificationServiceListener)init
{
  return (_TtC21UserNotificationsCore27NotificationServiceListener *)sub_2609D201C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore27NotificationServiceListener_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore27NotificationServiceListener_queue_listener));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end