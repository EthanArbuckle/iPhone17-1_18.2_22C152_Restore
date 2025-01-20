@interface AllPurchaseTransactionObserver
- (_TtC16NewsSubscription30AllPurchaseTransactionObserver)init;
- (void)bundleSubscriptionDidSubscribe:(id)a3 hideBundleDetectionUI:(BOOL)a4;
- (void)handlePurchaseAddedNotificationWithNotification:(id)a3;
@end

@implementation AllPurchaseTransactionObserver

- (_TtC16NewsSubscription30AllPurchaseTransactionObserver)init
{
  result = (_TtC16NewsSubscription30AllPurchaseTransactionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_inAppSubscriptionStatusChecker);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_tagController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_purchaseController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_subscriptionController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_purchaseAdContextEntriesManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_webOptinFlowManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_trackerProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_router);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_osloAbandonmentUpsellManager);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_familySharingLandingPageLauncher);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_entitlementService));
  v3 = (char *)self + OBJC_IVAR____TtC16NewsSubscription30AllPurchaseTransactionObserver_postPurchaseOnboardingManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)handlePurchaseAddedNotificationWithNotification:(id)a3
{
  uint64_t v4 = sub_1BFBD1B68();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD1B48();
  v8 = self;
  sub_1BFB5F948();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3 hideBundleDetectionUI:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1BFB61C3C(a4);
}

@end