@interface TabBarController
- (BOOL)_ignoreUnselectedTabsForStateRestoration;
- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5;
- (NSArray)tabs;
- (_TtC5Music16TabBarController)init;
- (_TtC5Music16TabBarController)initWithCoder:(id)a3;
- (_TtC5Music16TabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Music16TabBarController)initWithTabs:(id)a3;
- (id)drop:(id)a3 animated:(BOOL)a4;
- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4;
- (void)_setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)setTabs:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TabBarController

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_100031FA0(a3, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100016CC4((uint64_t)a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000219BC();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10002A708();
}

- (_TtC5Music16TabBarController)init
{
  return (_TtC5Music16TabBarController *)sub_10002DE88();
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  sub_100057778(0, (unint64_t *)&qword_101099260);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = self;
  sub_10007DB84(v6, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  char v11 = sub_100126FE0((uint64_t)v8, (uint64_t)a4, a5);

  return v11 & 1;
}

- (id)drop:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = (void *)sub_100127170((uint64_t)v6, a4);

  return v8;
}

- (_TtC5Music16TabBarController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10065B448();
}

- (NSArray)tabs
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  id v3 = [(TabBarController *)&v6 tabs];
  sub_100057778(0, (unint64_t *)&qword_10109AB10);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setTabs:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100057778(0, (unint64_t *)&qword_10109AB10);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(TabBarController *)&v7 setTabs:isa];

  sub_1002915C8();
  sub_100291980();
}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 1;
}

- (_TtC5Music16TabBarController)initWithTabs:(id)a3
{
  result = (_TtC5Music16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Music16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_barDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_sidebarDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_bottomPlayerViewController));
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music16TabBarController_libraryImportViewModel, &qword_1010BB850);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16TabBarController_playerTabsViewController));
  swift_bridgeObjectRelease();

  swift_release();
}

@end