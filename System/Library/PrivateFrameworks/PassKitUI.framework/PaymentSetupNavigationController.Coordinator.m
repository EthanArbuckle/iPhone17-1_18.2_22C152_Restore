@interface PaymentSetupNavigationController.Coordinator
- (_TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator)init;
- (void)paymentSetupDidFinish:(id)a3;
@end

@implementation PaymentSetupNavigationController.Coordinator

- (void)paymentSetupDidFinish:(id)a3
{
  v4 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator_setupFinishedAction);
  id v5 = a3;
  v6 = self;
  v4();
}

- (_TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator)init
{
  result = (_TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19F8BA42C((uint64_t)self + OBJC_IVAR____TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator_parent);

  swift_release();
}

@end