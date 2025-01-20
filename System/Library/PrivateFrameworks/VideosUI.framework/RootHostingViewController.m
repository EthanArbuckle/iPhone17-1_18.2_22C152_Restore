@interface RootHostingViewController
- (UITabBarItem)tabBarItem;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC8VideosUI25RootHostingViewController)init;
- (_TtC8VideosUI25RootHostingViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI25RootHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setTabBarItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation RootHostingViewController

- (UITabBarItem)tabBarItem
{
  v2 = self;
  id v3 = sub_1E3757B40();

  return (UITabBarItem *)v3;
}

- (void)setTabBarItem:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E3757C30(a3);
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = (void *)sub_1E3757CFC();

  return (UIViewController *)v3;
}

- (_TtC8VideosUI25RootHostingViewController)init
{
  return (_TtC8VideosUI25RootHostingViewController *)sub_1E3757E28();
}

- (_TtC8VideosUI25RootHostingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3757EE8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E3757F7C();
}

- (_TtC8VideosUI25RootHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3758474();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25RootHostingViewController_contentNavigationController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI25RootHostingViewController____lazy_storage___emptyNavigationController);
}

@end