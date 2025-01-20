@interface UserNotificationsCloudReceiver
- (_TtC21UserNotificationsCore30UserNotificationsCloudReceiver)init;
@end

@implementation UserNotificationsCloudReceiver

- (_TtC21UserNotificationsCore30UserNotificationsCloudReceiver)init
{
  result = (_TtC21UserNotificationsCore30UserNotificationsCloudReceiver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21UserNotificationsCore30UserNotificationsCloudReceiver_receiver));
  swift_unknownObjectRelease();
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore30UserNotificationsCloudReceiver_consumer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore30UserNotificationsCloudReceiver_sourceProvider);
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore30UserNotificationsCloudReceiver_settingsProvider);

  swift_release();
}

@end