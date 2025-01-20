@interface TabBarContainerController
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI25TabBarContainerController)initWithCoder:(id)a3;
- (_TtC5TeaUI25TabBarContainerController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TabBarContainerController

- (_TtC5TeaUI25TabBarContainerController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B615F834();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B615F8BC();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1B615F9E0();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = sub_1B615FB44();
  return (UIViewController *)v2;
}

- (_TtC5TeaUI25TabBarContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  sub_1B615FB74();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI25TabBarContainerController_rootViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI25TabBarContainerController____lazy_storage___intrinsicTabBar);
}

@end