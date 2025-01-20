@interface NavigationController
- (BOOL)_allowChildSplitViewControllers;
- (NSArray)viewControllers;
- (UINavigationControllerDelegate)delegate;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5Music20NavigationController)init;
- (_TtC5Music20NavigationController)initWithCoder:(id)a3;
- (_TtC5Music20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC5Music20NavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Music20NavigationController)initWithRootViewController:(id)a3;
- (id)_targetNavigationBarForUISplitViewControllerSidebarButton;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)attachPalette:(id)a3 isPinned:(BOOL)a4;
- (void)detachPalette:(id)a3;
- (void)navigationBar:(id)a3 didPopItem:(id)a4;
- (void)navigationBar:(id)a3 didPushItem:(id)a4;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NavigationController

- (UIViewController)childViewControllerForStatusBarStyle
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController);
  if (v3)
  {
    v4 = self;
    id v5 = v3;
  }
  else
  {
    id v5 = [(NavigationController *)self topViewController];
  }
  id v6 = v3;

  return (UIViewController *)v5;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1000119BC(v8);
}

- (UINavigationControllerDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NavigationController();
  v2 = [(NavigationController *)&v4 delegate];

  return v2;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100023038();
}

- (void)setDelegate:(id)a3
{
  if (a3)
  {
    if (a3 == self)
    {
      v4.receiver = a3;
      v4.super_class = (Class)type metadata accessor for NavigationController();
      [(NavigationController *)&v4 setDelegate:a3];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1000268E8();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_10002D894(v9, a5);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for NavigationController();
  objc_super v4 = (char *)v10.receiver;
  id v5 = a3;
  [(NavigationController *)&v10 traitCollectionDidChange:v5];
  id v6 = *(void **)&v4[OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController];
  if (v6)
  {
    id v7 = *(char **)&v4[OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController];
LABEL_5:
    id v9 = v6;
    sub_10002D9FC(v7, 0);

    id v5 = v4;
    objc_super v4 = v7;
    goto LABEL_6;
  }
  id v8 = [v4 topViewController];
  if (v8)
  {
    id v7 = v8;
    id v6 = 0;
    goto LABEL_5;
  }
LABEL_6:
}

- (_TtC5Music20NavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(NavigationController *)self init];
  [(TraitNavigationController *)v5 pushViewController:v4 animated:0];

  return v5;
}

- (_TtC5Music20NavigationController)init
{
  type metadata accessor for NavigationBar();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();

  return [(NavigationController *)self initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:0];
}

- (_TtC5Music20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (_TtC5Music20NavigationController *)sub_10004F6B0(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (_TtC5Music20NavigationController *)sub_10004F6B0(ObjCClassMetadata, v6);
}

- (NSArray)viewControllers
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationController();
  id v2 = v6.receiver;
  v3 = [(NavigationController *)&v6 viewControllers];
  sub_100057778(0, (unint64_t *)&qword_101099260);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (_TtC5Music20NavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10072B718();
}

- (id)_targetNavigationBarForUISplitViewControllerSidebarButton
{
  id v2 = self;
  id v3 = sub_10072852C();

  return v3;
}

- (void)setViewControllers:(id)a3
{
  sub_100057778(0, (unint64_t *)&qword_101099260);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  NSArray v4 = self;
  id v5 = [(NavigationController *)v4 existingPaletteForEdge:2];
  if (v5)
  {
    objc_super v6 = v5;
    [(NavigationController *)v4 detachPalette:v5];
  }
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for NavigationController();
  [(NavigationController *)&v8 setViewControllers:isa];

  sub_100057A68();
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  id v7 = a3;
  objc_super v8 = self;
  sub_10072876C(a3, a4);
}

- (void)detachPalette:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_100728B54(a3);
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  NSArray v4 = self;
  sub_1007281BC(a3, 1);
  uint64_t v6 = v5;

  if (v6)
  {
    sub_100057778(0, (unint64_t *)&qword_101099260);
    v7.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.Class isa = 0;
  }

  return v7.super.isa;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  NSArray v4 = self;
  id v5 = sub_100728F6C(a3);

  return v5;
}

- (BOOL)_allowChildSplitViewControllers
{
  return 1;
}

- (void)navigationBar:(id)a3 didPushItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  sub_10072B520(v6);
}

- (void)navigationBar:(id)a3 didPopItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  sub_10072B520(v6);
}

- (_TtC5Music20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music20NavigationController_onWillShowViewController));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music20NavigationController_onDidShowViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music20NavigationController_overrideNavigationBarPropertiesTopViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music20NavigationController_existingTopPalette));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Music20NavigationController____lazy_storage___statusBarEffectView);
}

@end