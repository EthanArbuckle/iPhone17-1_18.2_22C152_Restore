@interface DOCBrowserContainerController
- (BOOL)allowsPickingMultipleItems;
- (BOOL)establishFirstResponder;
- (BOOL)preventAppearanceForwarding;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (NSArray)additionalLeadingNavigationBarButtonItems;
- (NSArray)additionalTrailingNavigationBarButtonItems;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (_TtC5Files29DOCBrowserContainerController)init;
- (_TtC5Files33DOCBrowserContainedViewController)contentViewController;
- (void)activateContentViewController;
- (void)didMoveToParentViewController:(id)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)getCellFor:(id)a3 :(id)a4;
- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4;
- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4;
- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5;
- (void)loadView;
- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5;
- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setAllowsPickingMultipleItems:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setPreventAppearanceForwarding:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation DOCBrowserContainerController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  v2 = (char *)v5.receiver;
  [(DOCBrowserContainerController *)&v5 viewDidLoad];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_dataSource + 8];
  uint64_t ObjectType = swift_getObjectType();
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(ObjectType, v3) & 1) == 0)
  {
    sub_10002D100();
    if (*(void *)&v2[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_state] == 5) {
      sub_1000686CC(0, 0, 0);
    }
  }
}

- (void)loadView
{
  type metadata accessor for DOCBrowserContainerController.DOCBrowserContainerControllerView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  id v5 = [v3 init];
  [(DOCBrowserContainerController *)v4 setView:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCBrowserContainerController *)&v6 traitCollectionDidChange:v4];
  sub_100076F34();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  id v4 = a3;
  id v5 = v9.receiver;
  [(DOCBrowserContainerController *)&v9 effectiveAppearanceDidChange:v4];
  id v6 = [v5 viewIfLoaded];
  if (v6)
  {
    v7 = v6;
    id v8 = [v4 backgroundColor];
    [v7 setBackgroundColor:v8];

    id v4 = v7;
    id v5 = v8;
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  id v8 = self;
  char v9 = (char)v8;
  v10 = v8;
  v12.value.super.super.super.isa = (Class)a3;
  v12.is_nil = a4;
  DOCBrowserContainerController.viewDidMove(to:shouldAppearOrDisappear:)(v12, v9);
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  DOCBrowserContainerController.viewIsAppearing(_:)(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  DOCBrowserContainerController.viewWillAppear(_:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1000686AC(*(unint64_t *)((char *)&self->super.super.super.super.isa
                                    + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_state));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_queue));
  sub_1000A7258(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_stateReporting));
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_actionReporting);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_overlayDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files29DOCBrowserContainerController__containerNavigationItem);
}

- (void)willMoveToParentViewController:(id)a3
{
  uint64_t v5 = type metadata accessor for UITraitOverrides();
  __chkstk_darwin(v5 - 8);
  id v6 = (objc_class *)type metadata accessor for DOCBrowserContainerController();
  v9.receiver = self;
  v9.super_class = v6;
  id v7 = a3;
  id v8 = self;
  [(DOCBrowserContainerController *)&v9 willMoveToParentViewController:v7];
  type metadata accessor for UITraitHorizontalSizeClass();
  UIViewController.traitOverrides.getter();
  UITraitOverrides.remove(_:)();
  UIViewController.traitOverrides.setter();
}

- (_TtC5Files33DOCBrowserContainedViewController)contentViewController
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController);
  swift_beginAccess();
  return (_TtC5Files33DOCBrowserContainedViewController *)*v2;
}

- (void)setPreventAppearanceForwarding:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_preventAppearanceForwarding);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_preventAppearanceForwarding) = a3;
  if (v3 == 1 && !a3)
  {
    uint64_t v5 = self;
    sub_1003349C8();
  }
}

- (BOOL)establishFirstResponder
{
  v2 = self;
  Swift::Bool v3 = DOCBrowserContainerController.establishFirstResponder()();

  return v3;
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  DOCBrowserContainerController.didMove(toParent:)(v9);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCBrowserContainerController();
  id v6 = (char *)v8.receiver;
  [(DOCBrowserContainerController *)&v8 setEditing:v5 animated:v4];
  id v7 = (id *)&v6[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController];
  swift_beginAccess();
  [*v7 setEditing:v5 animated:v4];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v4 = self;
  DOCBrowserContainerController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v4 = self;
  DOCBrowserContainerController.viewDidDisappear(_:)(a3);
}

- (void)setContentViewController:(id)a3
{
  BOOL v4 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController);
  swift_beginAccess();
  BOOL v5 = *v4;
  _TtC5Files29DOCBrowserContainerController *v4 = a3;
  id v6 = a3;
}

- (BOOL)allowsPickingMultipleItems
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_allowsPickingMultipleItems);
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  BOOL v4 = self;
  sub_100333D80(a3);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = (void **)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_contentViewController);
  swift_beginAccess();
  Swift::Bool v3 = *v2;
  if (*v2)
  {
    sub_1000CBE70((uint64_t *)&unk_1007084E0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1005A04F0;
    *(void *)(v4 + 32) = v3;
    specialized Array._endMutation()();
  }
  id v5 = v3;
  sub_1000CBE70((uint64_t *)&unk_10070D080);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (BOOL)preventAppearanceForwarding
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files29DOCBrowserContainerController_preventAppearanceForwarding);
}

- (NSArray)additionalLeadingNavigationBarButtonItems
{
  return (NSArray *)sub_100240570();
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return (NSArray *)sub_100240570();
}

- (void)activateContentViewController
{
  uint64_t v3 = *(void *)&self->super.appearStateTracker[OBJC_IVAR____TtC5Files29DOCBrowserContainerController_dataSource];
  uint64_t ObjectType = swift_getObjectType();
  id v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  NSArray v6 = self;
  v5(1, ObjectType, v3);
}

- (NSString)description
{
  v2 = self;
  DOCBrowserContainerController.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC5Files29DOCBrowserContainerController)init
{
  result = (_TtC5Files29DOCBrowserContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  UIViewController_optional v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  UIWindow_optional v12 = self;
  id v13 = sub_100335154();
  URL._bridgeToObjectiveC()(v14);
  v16 = v15;
  aBlock[4] = sub_100222598;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100045AE0;
  aBlock[3] = &unk_1006A2F28;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v13 getTransitionControllerForURL:v16 completionBlock:v17];
  _Block_release(v17);

  swift_release();
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  UIViewController_optional v9 = self;
  id v10 = sub_100335154();
  v12[4] = sub_100222598;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100045AE0;
  v12[3] = &unk_1006A2ED8;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getTransitionControllerForItem:v8 completionBlock:v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  UIViewController_optional v9 = self;
  id v10 = sub_100335154();
  v12[4] = sub_100336F90;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100045AE0;
  v12[3] = &unk_1006A2E88;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getPopoverTrackerForItem:v8 completionBlock:v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  BOOL v5 = a4;
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_100335154();
  v14[4] = sub_100222580;
  v14[5] = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1001B6C98;
  v14[3] = &unk_1006A2E38;
  id v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [v12 getViewFor:v10 waitForNewThumbnail:v5 :v13];
  _Block_release(v13);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)getCellFor:(id)a3 :(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = sub_100335154();
  v12[4] = sub_100222598;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100411BA4;
  v12[3] = &unk_1006A2DE8;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [v10 getCellFor:v8 :v11];
  _Block_release(v11);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_10009E6C4(0, (unint64_t *)&qword_1007069C0);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = self;
  DOCBrowserContainerController.reveal(items:selectEvenIfVisible:completionBlock:)(v8, a4, (uint64_t)sub_100336F8C, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

@end