@interface AddBankAccountInformationView.Coordinator
- (_TtCV9PassKitUI29AddBankAccountInformationView11Coordinator)init;
- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4;
- (void)addBankAccountInformationViewControllerDidFinish:(id)a3;
@end

@implementation AddBankAccountInformationView.Coordinator

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded) = (Class)a4;
  id v4 = a4;
}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  id v5 = *(void (**)(void *))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_completionAction);
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded);
  id v9 = v6;
  id v7 = a3;
  v8 = self;
  sub_1A03ADE18();
  v5(v6);

  swift_release();
}

- (_TtCV9PassKitUI29AddBankAccountInformationView11Coordinator)init
{
  result = (_TtCV9PassKitUI29AddBankAccountInformationView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded);
}

@end