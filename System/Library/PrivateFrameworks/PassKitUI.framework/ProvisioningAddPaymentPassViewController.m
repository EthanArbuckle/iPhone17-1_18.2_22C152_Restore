@interface ProvisioningAddPaymentPassViewController
- (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6;
- (id)defaultFields;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)visibleFieldIdentifiers;
- (void)cancel;
- (void)handleNextButtonTapped:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ProvisioningAddPaymentPassViewController

- (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_privacyController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_coordinator) = 0;
  id v4 = a3;

  result = (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_19F999888(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProvisioningAddPaymentPassViewController();
  id v4 = (char *)v5.receiver;
  [(PKPaymentSetupFieldsViewController *)&v5 viewDidAppear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_reporter], sel_reportViewAppeared, v5.receiver, v5.super_class);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_19F999D9C();
}

- (void)cancel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_coordinator);
  if (v2)
  {
    BOOL v3 = self;
    id v4 = v2;
    sub_19FBA51C8();
  }
}

- (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a6;
  result = (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_privacyController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_reporter));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_coordinator);
}

- (id)visibleFieldIdentifiers
{
  v2 = self;
  id result = [(PKPaymentSetupFieldsViewController *)v2 fieldsModel];
  if (result)
  {
    id v4 = result;
    id v5 = objc_msgSend(result, sel_visibleSetupFieldIdentifiers);

    if (v5)
    {
      uint64_t v6 = sub_1A03B4C58();

      sub_19F7F2334(v6);
      swift_bridgeObjectRelease();
      id v7 = (void *)sub_1A03B4C38();
      swift_bridgeObjectRelease();
    }
    else
    {

      id v7 = 0;
    }
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)handleNextButtonTapped:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A03B57A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_19F99A2C4();

  sub_19F5DE960((uint64_t)v6);
}

- (id)defaultHeaderViewTitle
{
  v2 = self;
  sub_19F99A3E0();

  swift_bridgeObjectRelease();
  BOOL v3 = (void *)sub_1A03B4958();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  v2 = self;
  sub_19F99A3E0();
  uint64_t v4 = v3;

  swift_bridgeObjectRelease();
  if (v4)
  {
    id v5 = (void *)sub_1A03B4958();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)defaultFields
{
  v2 = (void *)sub_1A03B4C38();

  return v2;
}

@end