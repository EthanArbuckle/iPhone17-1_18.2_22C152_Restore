@interface EngagementUpsellOfferManager
- (_TtC7NewsUI228EngagementUpsellOfferManager)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
@end

@implementation EngagementUpsellOfferManager

- (_TtC7NewsUI228EngagementUpsellOfferManager)init
{
  result = (_TtC7NewsUI228EngagementUpsellOfferManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEAD31B0((uint64_t)self + OBJC_IVAR____TtC7NewsUI228EngagementUpsellOfferManager_offerEntry, &qword_1EBAC5008, (void (*)(uint64_t))type metadata accessor for EngagementUpsellOfferEntry);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228EngagementUpsellOfferManager_store);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DE9834F8(1);
}

@end