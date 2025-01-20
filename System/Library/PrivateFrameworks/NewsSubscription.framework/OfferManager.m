@interface OfferManager
- (_TtC16NewsSubscription12OfferManager)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
@end

@implementation OfferManager

- (_TtC16NewsSubscription12OfferManager)init
{
  result = (_TtC16NewsSubscription12OfferManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_1BFADA374((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription12OfferManager_lastSessionEndTime, (unint64_t *)&qword_1EBA83870, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription12OfferManager_featureAvailability);

  swift_bridgeObjectRelease();
}

- (void)networkReachabilityDidChange:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1BFAD8660(a3);
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BFADA8C0();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BFADAA4C();
}

@end