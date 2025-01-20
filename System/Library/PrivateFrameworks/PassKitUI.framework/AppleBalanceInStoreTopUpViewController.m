@interface AppleBalanceInStoreTopUpViewController
- (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissAction;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AppleBalanceInStoreTopUpViewController

- (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController)initWithCoder:(id)a3
{
  result = (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F85BF78();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AppleBalanceInStoreTopUpViewController();
  v2 = (char *)v14.receiver;
  [(AppleBalanceInStoreTopUpViewController *)&v14 viewWillLayoutSubviews];
  id v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_hostingVC], sel_view);
    objc_msgSend(v13, sel_setFrame_, v6, v8, v10, v12);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)dismissAction
{
}

- (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_hostingVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_account));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_tokenModel);
}

@end