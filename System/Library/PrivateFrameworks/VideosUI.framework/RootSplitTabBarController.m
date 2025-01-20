@interface RootSplitTabBarController
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (_TtC8VideosUI25RootSplitTabBarController)init;
- (_TtC8VideosUI25RootSplitTabBarController)initWithCoder:(id)a3;
- (_TtC8VideosUI25RootSplitTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8VideosUI25RootSplitTabBarController)initWithTabs:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RootSplitTabBarController

- (_TtC8VideosUI25RootSplitTabBarController)init
{
  return (_TtC8VideosUI25RootSplitTabBarController *)sub_1E3754504();
}

- (_TtC8VideosUI25RootSplitTabBarController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E375462C();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E37546E4(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1E3754D00(a3, (SEL *)&selRef_viewWillAppear_, &OBJC_IVAR____TtC8VideosUI25RootSplitTabBarController_listenForAppear, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1E3754D00(a3, (SEL *)&selRef_viewWillDisappear_, &OBJC_IVAR____TtC8VideosUI25RootSplitTabBarController_listenForDissapear, 0);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  unint64_t v5 = (unint64_t)a3;
  if (a3)
  {
    sub_1E2BE915C(0, (unint64_t *)&qword_1EBF8E6A0);
    unint64_t v5 = sub_1E387CC98();
  }
  v7 = self;
  sub_1E3754E68(v5, a4);

  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI25RootSplitTabBarController)initWithTabs:(id)a3
{
}

- (_TtC8VideosUI25RootSplitTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E37555B8();
}

- (void).cxx_destruct
{
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E3755654(v6, v7);

  return 0;
}

@end