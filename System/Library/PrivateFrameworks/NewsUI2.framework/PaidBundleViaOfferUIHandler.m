@interface PaidBundleViaOfferUIHandler
- (_TtC7NewsUI227PaidBundleViaOfferUIHandler)init;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4;
@end

@implementation PaidBundleViaOfferUIHandler

- (_TtC7NewsUI227PaidBundleViaOfferUIHandler)init
{
  result = (_TtC7NewsUI227PaidBundleViaOfferUIHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_notificationService);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_paidBundleViaOfferHandler);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_featureAvailability);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_tracker);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_router);
  sub_1DEA17274((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_sessionBadgeSource, (unint64_t *)&unk_1EBAD1D90, MEMORY[0x1E4F7B170]);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler____lazy_storage___paidBundleViaOfferConfig);
  sub_1DF2C5184(v3);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_featureAvailability), *(void *)&self->notificationService[OBJC_IVAR____TtC7NewsUI227PaidBundleViaOfferUIHandler_featureAvailability + 8]);
  id v5 = a3;
  v6 = self;
  sub_1DFDEF560();
  *(void *)(swift_allocObject() + 16) = v6;
  v7 = v6;
  id v8 = (id)sub_1DFDEDCE0();
  sub_1DFDEDE00();

  swift_release();
  swift_release();
  swift_release();
}

- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1DFA8B8F8(v7);
}

@end