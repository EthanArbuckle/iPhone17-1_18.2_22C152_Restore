@interface ACHBankCredentialViewController
- (_TtC9PassKitUI31ACHBankCredentialViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI31ACHBankCredentialViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)editButtonTapped;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ACHBankCredentialViewController

- (_TtC9PassKitUI31ACHBankCredentialViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_hostingVC) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_editAction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC9PassKitUI31ACHBankCredentialViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_19FA093D8();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_19FA097AC();
}

- (void)editButtonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_editAction);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_19F48BAB4((uint64_t)v2);
    v2(v3);
    sub_19F48BB68((uint64_t)v2);
  }
}

- (_TtC9PassKitUI31ACHBankCredentialViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_hostingVC));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_editAction);

  sub_19F48BB68(v3);
}

@end