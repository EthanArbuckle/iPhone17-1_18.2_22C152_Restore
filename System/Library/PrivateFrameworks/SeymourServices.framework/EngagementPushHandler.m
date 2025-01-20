@interface EngagementPushHandler
- (_TtC15SeymourServices21EngagementPushHandler)init;
- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4;
@end

@implementation EngagementPushHandler

- (_TtC15SeymourServices21EngagementPushHandler)init
{
  result = (_TtC15SeymourServices21EngagementPushHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices21EngagementPushHandler_bagConsumer);

  v3 = (char *)self + OBJC_IVAR____TtC15SeymourServices21EngagementPushHandler_delegate;

  sub_1D6C522F0((uint64_t)v3);
}

- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1D6C5217C(v7);
}

@end