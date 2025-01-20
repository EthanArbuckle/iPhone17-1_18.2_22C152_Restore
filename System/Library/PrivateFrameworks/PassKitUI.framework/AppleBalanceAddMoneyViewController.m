@interface AppleBalanceAddMoneyViewController
- (_TtC9PassKitUI34AppleBalanceAddMoneyViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI34AppleBalanceAddMoneyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissAction;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation AppleBalanceAddMoneyViewController

- (_TtC9PassKitUI34AppleBalanceAddMoneyViewController)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_paymentWebService;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend(self, sel_sharedService);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_dtuConfiguration) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_cancelItem) = 0;

  result = (_TtC9PassKitUI34AppleBalanceAddMoneyViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F6873D4();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AppleBalanceAddMoneyViewController();
  v2 = (char *)v14.receiver;
  [(AppleBalanceAddMoneyViewController *)&v14 viewWillLayoutSubviews];
  id v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_hostingVC], sel_view);
    objc_msgSend(v13, sel_setFrame_, v6, v8, v10, v12);
  }
  else
  {
    __break(1u);
  }
}

- (void)dismissAction
{
}

- (_TtC9PassKitUI34AppleBalanceAddMoneyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9PassKitUI34AppleBalanceAddMoneyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_hostingVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_accountService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_uiManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_paymentWebService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_dtuConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_inStoreModel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_cancelItem);
}

@end