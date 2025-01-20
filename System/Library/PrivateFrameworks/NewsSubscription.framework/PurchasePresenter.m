@interface PurchasePresenter
- (_TtC16NewsSubscription17PurchasePresenter)init;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)handlePurchaseAddedNotificationWithNotification:(id)a3;
@end

@implementation PurchasePresenter

- (_TtC16NewsSubscription17PurchasePresenter)init
{
  result = (_TtC16NewsSubscription17PurchasePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter____lazy_storage___spinnerViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_urlHandler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_purchaseController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_postPurchaseOnboardingManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_router);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_onboardingPrewarmer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_featureAvailability);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_osloAbandonmentUpsellManager);
  sub_1BFA653BC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription17PurchasePresenter_purchaseContext, (unint64_t *)&qword_1EBA89280, (void (*)(uint64_t))type metadata accessor for PurchaseContext);
}

- (void)handlePurchaseAddedNotificationWithNotification:(id)a3
{
  uint64_t v4 = sub_1BFBD1B68();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD1B48();
  v8 = self;
  sub_1BFA62C18();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1BFA65124();
}

@end