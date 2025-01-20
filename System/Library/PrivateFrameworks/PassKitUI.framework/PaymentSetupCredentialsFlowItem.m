@interface PaymentSetupCredentialsFlowItem
- (_TtC9PassKitUI31PaymentSetupCredentialsFlowItem)init;
- (void)credentialsViewController:(id)a3 didSelectCredentials:(id)a4;
- (void)credentialsViewControllerDidSelectManualEntry:(id)a3;
- (void)credentialsViewControllerDidSelectSecondaryManualEntry:(id)a3;
- (void)credentialsViewControllerDidTerminate:(id)a3;
@end

@implementation PaymentSetupCredentialsFlowItem

- (_TtC9PassKitUI31PaymentSetupCredentialsFlowItem)init
{
  result = (_TtC9PassKitUI31PaymentSetupCredentialsFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupCredentialsFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)credentialsViewControllerDidTerminate:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupCredentialsFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI31PaymentSetupCredentialsFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF1ABD90, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)credentialsViewControllerDidSelectManualEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FCFF00C();
}

- (void)credentialsViewControllerDidSelectSecondaryManualEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FCFF15C();
}

- (void)credentialsViewController:(id)a3 didSelectCredentials:(id)a4
{
  sub_19FACF630();
  uint64_t v6 = sub_1A03B4C58();
  id v7 = a3;
  id v8 = self;
  sub_19FCFF468(v6);

  swift_bridgeObjectRelease();
}

@end