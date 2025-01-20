@interface DynamicViewControllerDelegate
- (BOOL)dynamicViewControllerShouldDismiss:(id)a3;
- (_TtC16NewsSubscription29DynamicViewControllerDelegate)init;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
@end

@implementation DynamicViewControllerDelegate

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  uint64_t v4 = qword_1EBA876B8;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  sub_1BFBD4A18();
  sub_1BFBD2D88();
  sub_1BFBC8948((uint64_t)v5);

  return 1;
}

- (_TtC16NewsSubscription29DynamicViewControllerDelegate)init
{
  result = (_TtC16NewsSubscription29DynamicViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BFBC8FA0((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext, (uint64_t (*)(void))sub_1BFAA8EC0);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_router);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_postPurchaseOnboardingManager);
  v3 = (char *)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_paidBundleViaOfferHandler;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end