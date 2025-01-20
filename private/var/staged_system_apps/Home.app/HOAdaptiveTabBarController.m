@interface HOAdaptiveTabBarController
+ (BOOL)isAdaptiveTabBarEnabled;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (BOOL)wantsAccessoryControlsCard;
- (HOAdaptiveTabBarController)init;
- (HOAdaptiveTabBarController)initWithCoder:(id)a3;
- (HOAdaptiveTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (HOAdaptiveTabBarController)initWithTabs:(id)a3;
- (HOBaseController)baseController;
- (HUDashboardNavigator)dashboardNavigator;
- (id)currentViewController;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)selectCurrentTab;
- (id)selectTabWithIdentifier:(id)a3;
- (id)tabBarController:(id)a3 animationControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5;
- (unint64_t)_uip_tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5;
- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4;
- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4;
- (void)_uip_tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5;
- (void)dealloc;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)home:(void *)a3 didAddAccessory:(void *)a4;
- (void)homeDidUpdateHomeLocationStatus:(id)a3;
- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)setBaseController:(id)a3;
- (void)setLoadingViewController:(id)a3;
- (void)switchToAccessoryTypeGroup:(id)a3;
- (void)switchToHome:(id)a3;
- (void)switchToRoom:(id)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HOAdaptiveTabBarController

- (HUDashboardNavigator)dashboardNavigator
{
  v2 = self;
  id v3 = _s7HomeApp24AdaptiveTabBarControllerC18dashboardNavigatorSo011HUDashboardH0_pSgvg_0();

  return (HUDashboardNavigator *)v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(HOAdaptiveTabBarController *)&v7 viewDidAppear:v3];
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v4;
  static Published.subscript.setter();
  id v6 = AdaptiveTabBarController.baseController.getter();
  [v6 reloadInitialSetup];
}

- (HOAdaptiveTabBarController)init
{
  return (HOAdaptiveTabBarController *)AdaptiveTabBarController.init()();
}

- (void)viewDidLoad
{
  v2 = self;
  AdaptiveTabBarController.viewDidLoad()();
}

+ (BOOL)isAdaptiveTabBarEnabled
{
  uint64_t v2 = type metadata accessor for HomeAppFeatures();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UIKitFeatures();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for UIKitFeatures.floatingTabBar(_:), v6);
  sub_10000EFEC(&qword_1000DDD28, (void (*)(uint64_t))&type metadata accessor for UIKitFeatures);
  char v10 = FeatureFlagsKey.isEnabled.getter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for HomeAppFeatures.adaptiveNavigation(_:), v2);
    sub_10000EFEC(&qword_1000DDD30, (void (*)(uint64_t))&type metadata accessor for HomeAppFeatures);
    char v11 = FeatureFlagsKey.isEnabled.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (HOBaseController)baseController
{
  uint64_t v2 = self;
  id v3 = AdaptiveTabBarController.baseController.getter();

  return (HOBaseController *)v3;
}

- (void)setBaseController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___baseController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___baseController) = (Class)a3;
  id v3 = a3;
}

- (HOAdaptiveTabBarController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___HOAdaptiveTabBarController_controllers);
  swift_beginAccess();
  *id v4 = &_swiftEmptyDictionarySingleton;
  id v5 = self;
  swift_bridgeObjectRelease();
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(HOAdaptiveTabBarController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___baseController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController____lazy_storage___navigator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController_dashboardContext));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HOAdaptiveTabBarController_categoriesElements));

  id v3 = (char *)self + OBJC_IVAR___HOAdaptiveTabBarController__viewIsVisible;
  uint64_t v4 = sub_10000D858(&qword_1000DDD40);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_getKeyPath();
  swift_getKeyPath();
  char v8 = 0;
  objc_super v6 = self;
  static Published.subscript.setter();
  v7.receiver = v6;
  v7.super_class = ObjectType;
  [(HOAdaptiveTabBarController *)&v7 viewDidDisappear:v3];
}

- (id)selectCurrentTab
{
  id v2 = [(HOAdaptiveTabBarController *)self navigationController];

  return v2;
}

- (void)switchToRoom:(id)a3
{
  id v4 = a3;
  id v5 = self;
  AdaptiveTabBarController.switchTo(room:)((HMRoom)v4);
}

- (void)switchToAccessoryTypeGroup:(id)a3
{
  id v4 = a3;
  id v5 = self;
  AdaptiveTabBarController.switchTo(accessoryTypeGroup:)(v4);
}

- (void)switchToHome:(id)a3
{
  id v4 = a3;
  id v5 = self;
  AdaptiveTabBarController.switchTo(home:)((HMHome)v4);
}

- (HOAdaptiveTabBarController)initWithTabs:(id)a3
{
  result = (HOAdaptiveTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HOAdaptiveTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (HOAdaptiveTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)currentViewController
{
  id v2 = self;
  BOOL v3 = (void *)AdaptiveTabBarController.currentViewController()();

  return v3;
}

- (void)setLoadingViewController:(id)a3
{
  sub_10000D858((uint64_t *)&unk_1000DDDB0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100094FC0;
  *(void *)(v5 + 32) = a3;
  specialized Array._endMutation()();
  sub_10000AE6C(0, &qword_1000DD750);
  id v6 = a3;
  objc_super v7 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [(HOAdaptiveTabBarController *)v7 setViewControllers:isa];
}

- (id)selectTabWithIdentifier:(id)a3
{
  uint64_t v5 = sub_10000D858(&qword_1000DE4D0);
  __chkstk_darwin(v5 - 8);
  objc_super v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a3;
  sub_10000AE6C(0, &qword_1000DDDE0);
  id v11 = a3;
  v12 = self;
  uint64_t v13 = (void *)static NAFutureHelper.futureOnMainActor<A>(priority:descriptor:with:)();
  swift_release();
  sub_100003950((uint64_t)v7, &qword_1000DE4D0);

  return v13;
}

- (BOOL)wantsAccessoryControlsCard
{
  id v2 = self;
  unsigned __int8 v3 = AdaptiveTabBarController.wantsAccessoryControlsCard.getter();

  return v3 & 1;
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  AdaptiveTabBarController._tabElementGroup(_:didSelect:)(v6, v7);
}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  sub_1000732E4(v6);

  swift_bridgeObjectRelease();
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();
}

- (void)home:(void *)a3 didAddAccessory:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();
}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();
}

- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  _s7HomeApp24AdaptiveTabBarControllerC4home_9didUpdate3forySo6HMHomeC_So6HMRoomCSo11HMAccessoryCtF_0();
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  debug_assert(_:_:file:line:)();
  if (HUIsPhoneIdiom())
  {
    id v8 = [self currentDevice];
    [v8 setOrientation:1 animated:0];
  }
  id v9 = [(HOAdaptiveTabBarController *)v7 hu_dismissViewControllerAnimated:v4];

  return v9;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1000735F8(v7);

  return v9 & 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1000737C4(v7);
}

- (id)tabBarController:(id)a3 animationControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  id v9 = objc_allocWithZone((Class)HUPreloadedTransitionController);
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = self;
  id v14 = [v9 init];

  return v14;
}

- (unint64_t)_uip_tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_100073B38(v9, a5);
  unint64_t v12 = v11;

  swift_unknownObjectRelease();
  return v12;
}

- (void)_uip_tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_100073DD8(v9, a5);

  swift_unknownObjectRelease();
}

@end