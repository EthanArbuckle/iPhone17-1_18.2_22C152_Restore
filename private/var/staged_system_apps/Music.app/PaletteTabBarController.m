@interface PaletteTabBarController
- (NSArray)viewControllers;
- (NSMutableArray)mutableChildViewControllers;
- (_TtC5Music23PaletteTabBarController)initWithCoder:(id)a3;
- (_TtC5Music23PaletteTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Music23PaletteTabBarController)initWithTabs:(id)a3;
- (id)_viewControllersInTabBar;
- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4;
- (void)setMutableChildViewControllers:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PaletteTabBarController

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteTabBarController();
  id v2 = v3.receiver;
  [(PaletteTabBarController *)&v3 viewSafeAreaInsetsDidChange];
  sub_10003D18C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10000E5B4(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_10000EA00(v3);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_10002206C();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteTabBarController();
  id v2 = v3.receiver;
  [(PaletteTabBarController *)&v3 viewDidLayoutSubviews];
  sub_10003D18C();
  sub_10002A984();
}

- (_TtC5Music23PaletteTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Music23PaletteTabBarController *)sub_10002E38C(v5, v7, a4);
}

- (void)setViewControllers:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_100057778(0, (unint64_t *)&qword_101099260);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PaletteTabBarController();
  [(PaletteTabBarController *)&v7 setViewControllers:isa];
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PaletteTabBarController();
  id v6 = a3;
  id v7 = v8.receiver;
  [(PaletteTabBarController *)&v8 _setSelectedViewController:v6 performUpdates:v4];
  sub_10003D18C();
}

- (NSMutableArray)mutableChildViewControllers
{
  id v2 = self;
  id v3 = sub_100039CC8();

  return (NSMutableArray *)v3;
}

- (NSArray)viewControllers
{
  id v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x90);
  id v3 = self;
  unint64_t v4 = v2();
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for PaletteTabBarController();
  uint64_t v5 = [(PaletteTabBarController *)&v10 viewControllers];
  if (v5)
  {
    id v6 = v5;
    sub_100057778(0, (unint64_t *)&qword_101099260);
    unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10003A0AC(v7, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  }
  else
  {

    v8.super.isa = 0;
  }
  swift_bridgeObjectRelease();

  return (NSArray *)v8.super.isa;
}

- (id)_viewControllersInTabBar
{
  id v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x90);
  id v3 = self;
  unint64_t v4 = v2();
  id v5 = [(PaletteTabBarController *)v3 childViewControllers];
  sub_100057778(0, (unint64_t *)&qword_101099260);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10003A0AC(v6, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = self;
  sub_10065610C(v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_100656280(a3);
}

- (void)setMutableChildViewControllers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaletteTabBarController();
  [(PaletteTabBarController *)&v4 setMutableChildViewControllers:a3];
}

- (_TtC5Music23PaletteTabBarController)initWithTabs:(id)a3
{
  return (_TtC5Music23PaletteTabBarController *)sub_100656428();
}

- (_TtC5Music23PaletteTabBarController)initWithCoder:(id)a3
{
  return (_TtC5Music23PaletteTabBarController *)sub_1006565D0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23PaletteTabBarController_paletteView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23PaletteTabBarController_accessoryView));

  swift_bridgeObjectRelease();
}

@end