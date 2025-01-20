@interface PaymentSetupPurchaseProductFlowItem
- (_TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem)init;
- (void)purchaseViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4;
- (void)purchaseViewControllerDidRequestTransferBalance:(id)a3;
@end

@implementation PaymentSetupPurchaseProductFlowItem

- (_TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem)init
{
  result = (_TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem_viewController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35PaymentSetupPurchaseProductFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)purchaseViewControllerDidRequestTransferBalance:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FB95188();
}

- (void)purchaseViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19FB94F30(v6, v7);
}

@end