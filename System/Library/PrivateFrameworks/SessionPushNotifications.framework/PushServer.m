@interface PushServer
- (_TtC24SessionPushNotifications10PushServer)init;
@end

@implementation PushServer

- (_TtC24SessionPushNotifications10PushServer)init
{
  result = (_TtC24SessionPushNotifications10PushServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC24SessionPushNotifications10PushServer_connectionFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC24SessionPushNotifications10PushServer_subscriptionStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC24SessionPushNotifications10PushServer_publicTokenStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC24SessionPushNotifications10PushServer_tokenStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC24SessionPushNotifications10PushServer_budgetServer);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end