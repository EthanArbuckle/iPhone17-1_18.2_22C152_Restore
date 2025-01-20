@interface NavigationController
- (BOOL)_allowChildSplitViewControllers;
- (NSArray)viewControllers;
- (UINavigationControllerDelegate)delegate;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC16MusicApplication20NavigationController)init;
- (_TtC16MusicApplication20NavigationController)initWithCoder:(id)a3;
- (_TtC16MusicApplication20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC16MusicApplication20NavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16MusicApplication20NavigationController)initWithRootViewController:(id)a3;
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

- (_TtC16MusicApplication20NavigationController)init
{
  type metadata accessor for NavigationBar();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();

  return [(NavigationController *)self initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:0];
}

- (_TtC16MusicApplication20NavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v5 = [(NavigationController *)self init];
  [(TraitNavigationController *)v5 pushViewController:v4 animated:0];

  return v5;
}

- (_TtC16MusicApplication20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (_TtC16MusicApplication20NavigationController *)sub_1B17D0(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (_TtC16MusicApplication20NavigationController *)sub_1B17D0(ObjCClassMetadata, v6);
}

- (_TtC16MusicApplication20NavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B6E74();
}

- (id)_targetNavigationBarForUISplitViewControllerSidebarButton
{
  v2 = self;
  id v3 = sub_1B1948();

  return v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication20NavigationController_overrideNavigationBarPropertiesTopViewController);
  if (v3)
  {
    id v4 = self;
    id v5 = v3;
  }
  else
  {
    id v5 = [(NavigationController *)self topViewController];
  }
  id v6 = v3;

  return (UIViewController *)v5;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1B1BAC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B1F1C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for NavigationController();
  id v4 = (char *)v10.receiver;
  id v5 = a3;
  [(NavigationController *)&v10 traitCollectionDidChange:v5];
  id v6 = *(void **)&v4[OBJC_IVAR____TtC16MusicApplication20NavigationController_overrideNavigationBarPropertiesTopViewController];
  if (v6)
  {
    v7 = *(char **)&v4[OBJC_IVAR____TtC16MusicApplication20NavigationController_overrideNavigationBarPropertiesTopViewController];
LABEL_5:
    id v9 = v6;
    sub_1B1378(v7, 0);

    id v5 = v4;
    id v4 = v7;
    goto LABEL_6;
  }
  v8 = (char *)[v4 topViewController];
  if (v8)
  {
    v7 = v8;
    id v6 = 0;
    goto LABEL_5;
  }
LABEL_6:
}

- (UINavigationControllerDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NavigationController();
  v2 = [(NavigationController *)&v4 delegate];

  return v2;
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

- (NSArray)viewControllers
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationController();
  id v2 = v6.receiver;
  id v3 = [(NavigationController *)&v6 viewControllers];
  sub_173E4(0, (unint64_t *)&qword_DBE680);
  sub_AB69B0();

  v4.super.isa = sub_AB6990().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setViewControllers:(id)a3
{
  sub_173E4(0, (unint64_t *)&qword_DBE680);
  sub_AB69B0();
  id v5 = a3;
  objc_super v6 = self;
  id v7 = [(NavigationController *)v6 existingPaletteForEdge:2];
  if (v7)
  {
    v8 = v7;
    [(NavigationController *)v6 detachPalette:v7];
  }
  Class isa = sub_AB6990().super.isa;
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for NavigationController();
  [(NavigationController *)&v10 setViewControllers:isa];

  swift_bridgeObjectRelease();
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_1B23BC(a3, a4);
}

- (void)detachPalette:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1B2790(a3);
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  NSArray v4 = self;
  uint64_t v5 = sub_1B0EA8(a3, 1);

  if (v5)
  {
    sub_173E4(0, (unint64_t *)&qword_DBE680);
    v6.super.Class isa = sub_AB6990().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.Class isa = 0;
  }

  return v6.super.isa;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  NSArray v4 = self;
  id v5 = sub_1B2BA8(a3);

  return v5;
}

- (BOOL)_allowChildSplitViewControllers
{
  return 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = self;
  sub_1B69F8(v9, a5);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1B6A9C(v8);
}

- (void)navigationBar:(id)a3 didPushItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1B6CC4(v6);
}

- (void)navigationBar:(id)a3 didPopItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1B6CC4(v6);
}

- (_TtC16MusicApplication20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication20NavigationController_onWillShowViewController));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication20NavigationController_onDidShowViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20NavigationController_overrideNavigationBarPropertiesTopViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20NavigationController_existingTopPalette));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication20NavigationController____lazy_storage___statusBarEffectView);
}

@end