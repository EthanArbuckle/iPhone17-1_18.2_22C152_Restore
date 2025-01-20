@interface AccountNumbersViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (_TtC9PassKitUI28AccountNumbersViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI28AccountNumbersViewController)initWithConfiguration:(id)a3;
- (_TtC9PassKitUI28AccountNumbersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation AccountNumbersViewController

- (_TtC9PassKitUI28AccountNumbersViewController)initWithConfiguration:(id)a3
{
  return (_TtC9PassKitUI28AccountNumbersViewController *)AccountNumbersViewController.init(withConfiguration:)(a3);
}

- (_TtC9PassKitUI28AccountNumbersViewController)initWithCoder:(id)a3
{
  result = (_TtC9PassKitUI28AccountNumbersViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F5B7158(type metadata accessor for AccountNumbersViewController, &OBJC_IVAR____TtC9PassKitUI28AccountNumbersViewController_accountNumbersVC);
}

- (void)viewWillLayoutSubviews
{
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (_TtC9PassKitUI28AccountNumbersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28AccountNumbersViewController_accountNumbersVC));
}

@end