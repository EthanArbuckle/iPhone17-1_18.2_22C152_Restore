@interface MainTabBarController
- (_TtC7NewsUI220MainTabBarController)initWithCoder:(id)a3;
- (void)accessibilityReduceTransparencyDidChange;
- (void)dealloc;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MainTabBarController

- (_TtC7NewsUI220MainTabBarController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI220MainTabBarController_followingEngagementView) = 0;
  id v4 = a3;

  result = (_TtC7NewsUI220MainTabBarController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  swift_retain();
  sub_1DFDF0490();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(MainTabBarController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MainTabBarController_styler);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220MainTabBarController_followingEngagementView));
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEB4FF8C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[MainTabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  sub_1DFDF04B0();
  swift_unknownObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)accessibilityReduceTransparencyDidChange
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI220MainTabBarController_styler), *(uint64_t *)((char *)&self->super.super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC7NewsUI220MainTabBarController_styler));
  v3 = self;
  id v4 = [(MainTabBarController *)v3 tabBar];
  sub_1DFDF18B0();
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  sub_1DEB50684((uint64_t)v6, v7);
}

@end