@interface PaymentSetupFeatureOnboardingFlowItem
- (_TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem)init;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation PaymentSetupFeatureOnboardingFlowItem

- (_TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem)init
{
  result = (_TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_payLaterSetupFlowController));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_viewController);
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = (void (*)(const void *, void, void))*((void *)v4 + 2);
    v7 = self;
    v6(v5, 0, 0);
    _Block_release(v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI37PaymentSetupFeatureOnboardingFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1A67D8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end