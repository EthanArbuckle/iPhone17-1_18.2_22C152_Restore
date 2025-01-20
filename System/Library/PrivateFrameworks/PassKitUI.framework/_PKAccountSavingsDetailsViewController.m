@interface _PKAccountSavingsDetailsViewController
- (_PKAccountSavingsDetailsViewController)initWithCoder:(id)a3;
- (_PKAccountSavingsDetailsViewController)initWithConfiguration:(id)a3 setNavigationIconVisible:(id)a4;
- (_PKAccountSavingsDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation _PKAccountSavingsDetailsViewController

- (_PKAccountSavingsDetailsViewController)initWithConfiguration:(id)a3 setNavigationIconVisible:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_19F5C125C;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_PKAccountSavingsDetailsViewController *)AccountSavingsDetailsViewController.init(withConfiguration:setNavigationIconVisible:)(a3, v5, v6);
}

- (_PKAccountSavingsDetailsViewController)initWithCoder:(id)a3
{
  result = (_PKAccountSavingsDetailsViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F5B51BC();
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

- (_PKAccountSavingsDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountSavingsDetailsViewController_detailsHostingVC));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____PKAccountSavingsDetailsViewController_configuration);
}

@end