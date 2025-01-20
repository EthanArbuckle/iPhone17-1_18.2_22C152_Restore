@interface PromiseViewController
- (NSString)description;
- (UINavigationItem)navigationItem;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI21PromiseViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI21PromiseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PromiseViewController

- (_TtC5TeaUI21PromiseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  PromiseViewController.init(coder:)();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1B5E661BC();

  return (UINavigationItem *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5E66240();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1B5E671F0((uint64_t)a3);
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = sub_1B5E672E4();
  return (UIViewController *)v2;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  id v3 = sub_1B5E67348();

  return (int64_t)v3;
}

- (NSString)description
{
  v2 = self;
  sub_1B5E676D4();

  id v3 = (void *)sub_1B61B20C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC5TeaUI21PromiseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  PromiseViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21PromiseViewController_contentViewController));
  swift_release();
  swift_release();
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI21PromiseViewController_parentingCompleteClosure));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5TeaUI21PromiseViewController_parentingErrorClosure);
  sub_1B5E3799C(v3);
}

@end