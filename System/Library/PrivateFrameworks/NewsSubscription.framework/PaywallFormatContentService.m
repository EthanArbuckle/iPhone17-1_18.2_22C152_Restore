@interface PaywallFormatContentService
- (_TtC16NewsSubscription27PaywallFormatContentService)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)configurationManagerPaywallConfigDidChange:(id)a3;
@end

@implementation PaywallFormatContentService

- (_TtC16NewsSubscription27PaywallFormatContentService)init
{
  result = (_TtC16NewsSubscription27PaywallFormatContentService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27PaywallFormatContentService_formatService);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27PaywallFormatContentService_resourceService);
  swift_bridgeObjectRelease();
  sub_1BFAE49A0((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27PaywallFormatContentService_paywallConfig, (uint64_t)v3, &qword_1EBA87120, (uint64_t)&type metadata for PaywallConfig);
  sub_1BFAE4D9C((uint64_t)v3);
}

- (void)configurationManagerPaywallConfigDidChange:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BFADEB40();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BFAE6484();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BFADEB40();
}

@end