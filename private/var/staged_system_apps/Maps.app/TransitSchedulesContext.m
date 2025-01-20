@interface TransitSchedulesContext
+ (BOOL)shouldDisplayScheduleFor:(id)a3 departureSequence:(id)a4;
- (BOOL)wantsMapSelectionControl;
- (ChromeViewController)chromeViewController;
- (TransitSchedulesViewController)viewController;
- (_TtC4Maps23TransitSchedulesContext)init;
- (_TtC4Maps23TransitSchedulesContext)initWithDepartureSequence:(id)a3 timeZone:(id)a4 scheduleWindowStartDate:(id)a5 includeAllDirections:(BOOL)a6;
- (_TtC4Maps23TransitSchedulesContext)initWithMapItem:(id)a3 departureSequence:(id)a4;
- (_TtC4Maps23TransitSchedulesContext)initWithRouteStep:(id)a3;
- (id)desiredCards;
- (id)mapCameraControllerForTransitSchedulesViewController:(id)a3;
- (id)routeAnnotationsControllerFor:(id)a3;
- (id)routeAnnotationsProvider;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)prepareToEnterStackInChromeViewController:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)transitSchedulesViewController:(id)a3 wantsToDoDirectionItem:(id)a4 withUserInfo:(id)a5;
- (void)transitSchedulesViewController:(id)a3 wantsToOpenURL:(id)a4;
- (void)transitSchedulesViewController:(id)a3 wantsToShowInfoForLine:(id)a4;
- (void)transitSchedulesViewControllerWantsToUpdateRouteAnnotations:(id)a3;
@end

@implementation TransitSchedulesContext

- (id)desiredCards
{
  v2 = self;
  v3 = sub_1001282B0();

  if (v3)
  {
    sub_1000FF33C((uint64_t *)&unk_1015CE7A0);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  NSArray v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController);
  id v5 = a3;
  v6 = self;
  [v4 setContaineeDelegate:v6];
  [v4 setTransitSchedulesDelegate:v6];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  *(void *)(v7 + 24) = a3;
  v13[4] = sub_10012867C;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10008C380;
  v13[3] = &unk_1012D9A40;
  v8 = _Block_copy(v13);
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  id v12 = a4;
  swift_release();
  [v12 addPreparation:v8];
  _Block_release(v8);
}

- (id)routeAnnotationsProvider
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController));
}

- (ChromeViewController)chromeViewController
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ChromeViewController *)Strong;
}

- (void)setChromeViewController:(id)a3
{
}

- (TransitSchedulesViewController)viewController
{
  return (TransitSchedulesViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController));
}

+ (BOOL)shouldDisplayScheduleFor:(id)a3 departureSequence:(id)a4
{
  v6 = self;

  return [v6 shouldShowScheduleForTransitMapItem:a3 sequence:a4];
}

- (_TtC4Maps23TransitSchedulesContext)initWithMapItem:(id)a3 departureSequence:(id)a4
{
  swift_unknownObjectWeakInit();
  id v7 = objc_allocWithZone((Class)TransitSchedulesViewController);
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = self;
  v10 = (objc_class *)[v7 initWithTransitMapItem:v8 departureSequence:a4];
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController) = v10;

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for TransitSchedulesContext();
  id v11 = [(TransitSchedulesContext *)&v13 init];

  swift_unknownObjectRelease();
  return v11;
}

- (_TtC4Maps23TransitSchedulesContext)initWithRouteStep:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = objc_allocWithZone((Class)TransitSchedulesViewController);
  id v6 = a3;
  id v7 = self;
  id v8 = (objc_class *)[v5 initWithTransitRouteStep:v6];
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController) = v8;

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for TransitSchedulesContext();
  id v9 = [(TransitSchedulesContext *)&v11 init];

  return v9;
}

- (_TtC4Maps23TransitSchedulesContext)initWithDepartureSequence:(id)a3 timeZone:(id)a4 scheduleWindowStartDate:(id)a5 includeAllDirections:(BOOL)a6
{
  uint64_t v9 = sub_1000FF33C((uint64_t *)&unk_1015D9410);
  __chkstk_darwin(v9 - 8);
  objc_super v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000FF33C((uint64_t *)&unk_1015D9A00);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = type metadata accessor for TimeZone();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = type metadata accessor for TimeZone();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 1, 1, v18);
  }
  uint64_t v19 = swift_unknownObjectRetain();
  v20 = (_TtC4Maps23TransitSchedulesContext *)sub_10018B258(v19, (uint64_t)v14, (uint64_t)v11, a6);
  swift_unknownObjectRelease();
  return v20;
}

- (_TtC4Maps23TransitSchedulesContext)init
{
  result = (_TtC4Maps23TransitSchedulesContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23TransitSchedulesContext_viewController);
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  NSArray v4 = a3;
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v8 = a3;
    uint64_t v9 = self;
  }
  Strong = (_TtC4Maps23TransitSchedulesContext *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v11 = Strong;
    if ([(TransitSchedulesContext *)Strong isTopContext:self]) {
      [(TransitSchedulesContext *)v11 popContext:self animated:1 completion:0];
    }

    NSArray v4 = self;
  }
  else
  {
    objc_super v11 = self;
  }

  sub_1001189D4((uint64_t)v12);
}

- (void)transitSchedulesViewController:(id)a3 wantsToShowInfoForLine:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_10029C620((uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)transitSchedulesViewControllerWantsToUpdateRouteAnnotations:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (id)Strong;
    id v6 = a3;
    id v7 = self;
    [v8 setNeedsUpdateComponent:@"routeAnnotations" animated:1];
  }
}

- (id)routeAnnotationsControllerFor:(id)a3
{
  return sub_10029C2D8(self, (uint64_t)a2, a3, (SEL *)&selRef_routeAnnotationsController);
}

- (id)mapCameraControllerForTransitSchedulesViewController:(id)a3
{
  return sub_10029C2D8(self, (uint64_t)a2, a3, (SEL *)&selRef_mapCameraController);
}

- (void)transitSchedulesViewController:(id)a3 wantsToDoDirectionItem:(id)a4 withUserInfo:(id)a5
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v14 = a4;
  uint64_t v9 = self;
  id v10 = [(TransitSchedulesContext *)v9 iosBasedChromeViewController];
  if (v10
    && (objc_super v11 = v10, v12 = [v10 appCoordinator], v11, v12))
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    [v12 enterRoutePlanningWithDirectionItem:v14 withUserInfo:isa];

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)transitSchedulesViewController:(id)a3 wantsToOpenURL:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  objc_super v11 = self;
  id v12 = [(TransitSchedulesContext *)v11 iosBasedChromeViewController];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = [v12 _currentContainerViewController];

    if (v14)
    {
      id v15 = [objc_allocWithZone((Class)MapsWebLinkPresenter) initWithPresentingViewController:v14];
      URL._bridgeToObjectiveC()(v16);
      uint64_t v18 = v17;
      [v15 presentWebURL:v17];

      id v10 = v15;
      objc_super v11 = v18;
    }
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end