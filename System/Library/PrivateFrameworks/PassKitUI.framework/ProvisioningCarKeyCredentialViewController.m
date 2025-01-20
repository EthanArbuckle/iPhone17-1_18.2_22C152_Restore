@interface ProvisioningCarKeyCredentialViewController
- (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6;
- (id)defaultFields;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)visibleFieldIdentifiers;
- (void)cancel;
- (void)handleNextButtonTapped:(id)a3;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProvisioningCarKeyCredentialViewController

- (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator) = 0;
  id v4 = a3;

  result = (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ProvisioningCarKeyCredentialViewController();
  id v4 = v10.receiver;
  [(PKPaymentSetupFieldsViewController *)&v10 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v10.receiver, v10.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_viewControllers);

    sub_19F48BAC4(0, (unint64_t *)&qword_1E94A3910);
    unint64_t v8 = sub_1A03B4C58();

    if (v8 >> 62)
    {
      sub_1A03AE138();
      uint64_t v9 = sub_1A03B5AC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v9 == 1) {
      sub_19F9AD144();
    }
  }
}

- (void)cancel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator);
  if (v2)
  {
    BOOL v3 = self;
    id v4 = v2;
    sub_19F70592C();
  }
}

- (void)loadView
{
  v2 = self;
  sub_19F9AC8B8();
}

- (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a6;
  result = (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_credential));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator);
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
  BOOL v3 = self;
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A03B57A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v5 = self;
  }
  uint64_t v6 = *(Class *)((char *)&v3->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator);
  if (!v6) {
    goto LABEL_7;
  }
  id v7 = v6;
  id v8 = [(PKPaymentSetupFieldsViewController *)v3 fieldsModel];
  if (v8)
  {
    uint64_t v9 = (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *)v8;
    sub_19F704D44(v8);

    BOOL v3 = v9;
LABEL_7:

    sub_19F5DE960((uint64_t)v10);
    return;
  }
  __break(1u);
}

- (id)defaultHeaderViewTitle
{
  v2 = self;
  sub_19F9AD890();

  swift_bridgeObjectRelease();
  BOOL v3 = (void *)sub_1A03B4958();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  v2 = self;
  sub_19F9AD890();
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