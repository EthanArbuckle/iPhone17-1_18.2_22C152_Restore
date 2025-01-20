@interface PaywallInteractor
- (_TtC16NewsSubscription17PaywallInteractor)init;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
@end

@implementation PaywallInteractor

- (_TtC16NewsSubscription17PaywallInteractor)init
{
  result = (_TtC16NewsSubscription17PaywallInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BFA51A44((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_delegate);
  sub_1BFAF74A4((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_tracker, (unint64_t *)&qword_1EBA85840, (unint64_t *)&qword_1EBA85830, (uint64_t)&protocol descriptor for PaywallTrackerType);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_webAccessAuthenticatorFactory);
  sub_1BFAF74A4((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_webAccessAuthenticator, &qword_1EBA85FA0, (unint64_t *)&qword_1EBA85F90, (uint64_t)&protocol descriptor for WebAccessAuthenticatorType);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_webAccessConversionEventReporter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_paidBundleViaOfferFeatureAvailability);
  v3 = (char *)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_personalizedPaywallDataService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16NewsSubscription17PaywallInteractor_delegate;
  swift_beginAccess();
  if (MEMORY[0x1C18BCCA0](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
    id v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end