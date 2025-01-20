@interface LazyViewController
- (NSString)description;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI18LazyViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI18LazyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation LazyViewController

- (_TtC5TeaUI18LazyViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5F945FC();
}

- (void)viewDidLoad
{
  v2 = self;
  LazyViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  LazyViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  LazyViewController.viewWillLayoutSubviews()();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = (void *)LazyViewController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  LazyViewController.setEditing(_:animated:)(a3, a4);
}

- (_TtC5TeaUI18LazyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  LazyViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (NSString)description
{
  v2 = self;
  LazyViewController.description.getter();

  id v3 = (void *)sub_1B61B20C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end