@interface _PKAccountSavingsViewController
- (_PKAccountSavingsViewController)initWithCoder:(id)a3;
- (_PKAccountSavingsViewController)initWithConfiguration:(id)a3;
- (_PKAccountSavingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation _PKAccountSavingsViewController

- (_PKAccountSavingsViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountSavingsViewController *)AccountSavingsViewController.init(withConfiguration:)(a3);
}

- (_PKAccountSavingsViewController)initWithCoder:(id)a3
{
  result = (_PKAccountSavingsViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F5B4608();
}

- (void)viewWillLayoutSubviews
{
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_PKAccountSavingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountSavingsViewController_accountHostingVC));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____PKAccountSavingsViewController_configuration);
}

@end