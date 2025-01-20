@interface PaymentSetupPurchaseServiceProductFlowItem
- (_TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem)init;
- (void)purchaseServiceProviderProductItemsViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4;
- (void)purchaseServiceProviderProductItemsViewControllerDidTerminate:(id)a3;
@end

@implementation PaymentSetupPurchaseServiceProductFlowItem

- (_TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem)init
{
  result = (_TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_serviceProviderProduct));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_viewController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)purchaseServiceProviderProductItemsViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19F91DAE8(v6, v7);
}

- (void)purchaseServiceProviderProductItemsViewControllerDidTerminate:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI42PaymentSetupPurchaseServiceProductFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF197230, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end