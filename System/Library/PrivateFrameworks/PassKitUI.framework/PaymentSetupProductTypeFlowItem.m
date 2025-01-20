@interface PaymentSetupProductTypeFlowItem
- (_TtC9PassKitUI31PaymentSetupProductTypeFlowItem)init;
- (void)chooseProductTypeViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4;
- (void)chooseProductTypeViewController:(id)a3 didSelectServiceProducts:(id)a4;
- (void)chooseProductTypeViewControllerDidSelectManualEntry:(id)a3;
- (void)chooseProductTypeViewControllerDidTerminate:(id)a3;
@end

@implementation PaymentSetupProductTypeFlowItem

- (_TtC9PassKitUI31PaymentSetupProductTypeFlowItem)init
{
  result = (_TtC9PassKitUI31PaymentSetupProductTypeFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_viewController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)chooseProductTypeViewControllerDidSelectManualEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F567A74();
}

- (void)chooseProductTypeViewController:(id)a3 didPerformPurchaseWithCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19F5676B0(v6, v7);
}

- (void)chooseProductTypeViewControllerDidTerminate:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupProductTypeFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF185170, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)chooseProductTypeViewController:(id)a3 didSelectServiceProducts:(id)a4
{
  sub_19F567A34();
  unint64_t v6 = sub_1A03B4C58();
  id v7 = a3;
  id v8 = self;
  sub_19F567BDC(v6);

  swift_bridgeObjectRelease();
}

@end