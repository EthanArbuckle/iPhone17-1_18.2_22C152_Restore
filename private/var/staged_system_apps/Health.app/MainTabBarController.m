@interface MainTabBarController
- (_TtC6Health20MainTabBarController)init;
- (_TtC6Health20MainTabBarController)initWithCoder:(id)a3;
- (_TtC6Health20MainTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6Health20MainTabBarController)initWithTabs:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)restoreUserActivityState:(id)a3;
- (void)showAndActivateSearchBar;
- (void)tabBar:(id)a3 didSelectItem:(id)a4;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MainTabBarController

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(MainTabBarController *)v2 selectedViewController];
  if (!v3)
  {

    return 2;
  }
  v4 = v3;
  v5 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (!v5)
  {

    return 2;
  }
  id v6 = [v5 overrideMask];

  return (unint64_t)v6;
}

- (_TtC6Health20MainTabBarController)init
{
  return (_TtC6Health20MainTabBarController *)sub_10000C578();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000B8F0();
}

- (_TtC6Health20MainTabBarController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6Health20MainTabBarController____lazy_storage___providedHealthToolbox) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC6Health20MainTabBarController_providedPresentation;
  uint64_t v6 = enum case for Presentation.summaryFeed(_:);
  uint64_t v7 = type metadata accessor for Presentation();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  id v8 = a3;

  result = (_TtC6Health20MainTabBarController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tabBar:(id)a3 didSelectItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100043B54((uint64_t)v7);
}

- (void)showAndActivateSearchBar
{
  v2 = self;
  sub_100041E30();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MainTabBarController();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[MainTabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  if (qword_1001040A8 != -1) {
    swift_once();
  }
  sub_100006F78();
  dispatch thunk of HealthAppAnalyticsManager.submitResizeWindowInteraction(with:)();
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC6Health20MainTabBarController)initWithTabs:(id)a3
{
  result = (_TtC6Health20MainTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6Health20MainTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Health20MainTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health20MainTabBarController_providedHealthStore));
  _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)self + OBJC_IVAR____TtC6Health20MainTabBarController_providedHealthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health20MainTabBarController____lazy_storage___providedHealthToolbox));
  id v3 = (char *)self + OBJC_IVAR____TtC6Health20MainTabBarController_providedPresentation;
  uint64_t v4 = type metadata accessor for Presentation();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC6Health20MainTabBarController_pinnedContentManager;

  _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)v5);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100042D74(v4);
}

@end