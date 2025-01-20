@interface DebugNavigationController
- (_TtC8NewsFeed25DebugNavigationController)initWithCoder:(id)a3;
- (_TtC8NewsFeed25DebugNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC8NewsFeed25DebugNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8NewsFeed25DebugNavigationController)initWithRootViewController:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation DebugNavigationController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DebugNavigationController *)&v3 viewDidLoad];
  objc_msgSend(v2, sel_setDelegate_, v2, v3.receiver, v3.super_class);
}

- (_TtC8NewsFeed25DebugNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(DebugNavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC8NewsFeed25DebugNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(DebugNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC8NewsFeed25DebugNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1C151E62C();
    id v8 = a4;
    a3 = (id)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(DebugNavigationController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC8NewsFeed25DebugNavigationController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(DebugNavigationController *)&v5 initWithCoder:a3];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1C01B4814(v7);
}

@end