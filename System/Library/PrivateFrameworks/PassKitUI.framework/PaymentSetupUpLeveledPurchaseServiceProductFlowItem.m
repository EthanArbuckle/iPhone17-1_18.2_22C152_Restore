@interface PaymentSetupUpLeveledPurchaseServiceProductFlowItem
- (_TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem)init;
- (void)purchaseServiceProviderProductItemsViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4;
- (void)purchaseServiceProviderProductItemsViewControllerDidTerminate:(id)a3;
@end

@implementation PaymentSetupUpLeveledPurchaseServiceProductFlowItem

- (_TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem)init
{
  result = (_TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_product));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_viewController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)purchaseServiceProviderProductItemsViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19F505B7C(v6, v7);
}

- (void)purchaseServiceProviderProductItemsViewControllerDidTerminate:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI51PaymentSetupUpLeveledPurchaseServiceProductFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1842D0, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end