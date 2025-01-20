@interface PaymentSetupWelcomeFlowItem
- (_TtC9PassKitUI27PaymentSetupWelcomeFlowItem)init;
- (void)welcomeViewController:(id)a3 didSelectCategory:(id)a4 products:(id)a5;
- (void)welcomeViewControllerDidSelectCardsOnFile:(id)a3;
- (void)welcomeViewControllerDidSelectManualEntry:(id)a3;
- (void)welcomeViewControllerDidTerminate:(id)a3;
@end

@implementation PaymentSetupWelcomeFlowItem

- (_TtC9PassKitUI27PaymentSetupWelcomeFlowItem)init
{
  result = (_TtC9PassKitUI27PaymentSetupWelcomeFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI27PaymentSetupWelcomeFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)welcomeViewControllerDidSelectCardsOnFile:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F96A5C4();
}

- (void)welcomeViewControllerDidSelectManualEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F96A788();
}

- (void)welcomeViewController:(id)a3 didSelectCategory:(id)a4 products:(id)a5
{
  unint64_t v5 = (unint64_t)a5;
  if (a5)
  {
    sub_19F48BAC4(0, (unint64_t *)&qword_1E94B3790);
    unint64_t v5 = sub_1A03B4C58();
  }
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_19F96A87C(v10, v5);

  swift_bridgeObjectRelease();
}

- (void)welcomeViewControllerDidTerminate:(id)a3
{
  unint64_t v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI27PaymentSetupWelcomeFlowItem_delegate;
  if (MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI27PaymentSetupWelcomeFlowItem_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    id v9 = self;
    sub_19FBE1190((uint64_t)v9, (uint64_t)&off_1EF198D68, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end