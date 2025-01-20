@interface AppleBalanceDirectTopUpViewController
- (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addAction;
- (void)dismissAction;
- (void)loadView;
- (void)viewWillLayoutSubviews;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
@end

@implementation AppleBalanceDirectTopUpViewController

- (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_addItem) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_amount;
  *(void *)v4 = sub_1A03B5528();
  *((_WORD *)v4 + 4) = v5;
  *((_WORD *)v4 + 5) = v6;
  *((_WORD *)v4 + 6) = v7;
  *((_WORD *)v4 + 7) = v8;
  *((_WORD *)v4 + 8) = v9;
  *((_WORD *)v4 + 9) = v10;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_biometricsUnavailable) = 0;

  result = (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F653FC8();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AppleBalanceDirectTopUpViewController();
  v2 = (char *)v14.receiver;
  [(AppleBalanceDirectTopUpViewController *)&v14 viewWillLayoutSubviews];
  id v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_hostingVC], sel_view);
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

- (void)addAction
{
  v2 = self;
  sub_19F6549D0();
}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = self;
  id v11 = a5;
  sub_19F656F8C((uint64_t)a4, a5);
}

- (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_hostingVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_uiManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_dtuModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_setupController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_addItem);
}

@end