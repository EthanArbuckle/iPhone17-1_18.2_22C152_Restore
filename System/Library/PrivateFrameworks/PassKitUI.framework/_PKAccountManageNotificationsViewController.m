@interface _PKAccountManageNotificationsViewController
- (_PKAccountManageNotificationsViewController)initWithCoder:(id)a3;
- (_PKAccountManageNotificationsViewController)initWithConfiguration:(id)a3;
- (_PKAccountManageNotificationsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation _PKAccountManageNotificationsViewController

- (_PKAccountManageNotificationsViewController)initWithConfiguration:(id)a3
{
  return (_PKAccountManageNotificationsViewController *)AccountManageNotificationsViewController.init(withConfiguration:)(a3);
}

- (_PKAccountManageNotificationsViewController)initWithCoder:(id)a3
{
  result = (_PKAccountManageNotificationsViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19F5B7158(type metadata accessor for AccountManageNotificationsViewController, &OBJC_IVAR____PKAccountManageNotificationsViewController_hostingVC);
}

- (void)viewWillLayoutSubviews
{
}

- (_PKAccountManageNotificationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAccountManageNotificationsViewController_hostingVC));
}

@end