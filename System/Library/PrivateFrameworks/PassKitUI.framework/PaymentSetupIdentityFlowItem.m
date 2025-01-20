@interface PaymentSetupIdentityFlowItem
- (_TtC9PassKitUI28PaymentSetupIdentityFlowItem)init;
- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4;
- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4;
@end

@implementation PaymentSetupIdentityFlowItem

- (_TtC9PassKitUI28PaymentSetupIdentityFlowItem)init
{
  result = (_TtC9PassKitUI28PaymentSetupIdentityFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  sub_19FC23D08(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_region), *(void *)&self->context[OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_region]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_proofingManager));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_19FCAE25C(a4);
}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    sub_19F48BAC4(0, &qword_1E94B6B38);
    uint64_t v4 = sub_1A03B4C58();
  }
  id v7 = a3;
  id v8 = self;
  sub_19FCAE4B0(v4);

  swift_bridgeObjectRelease();
}

@end