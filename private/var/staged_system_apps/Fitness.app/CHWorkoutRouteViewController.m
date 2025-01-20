@interface CHWorkoutRouteViewController
- (CHWorkoutRouteViewController)initWithCoder:(id)a3;
- (CHWorkoutRouteViewController)initWithLocationReadings:(id)a3 title:(id)a4 sharingEnabled:(BOOL)a5 shareText:(id)a6 excludedActivityTypes:(id)a7;
- (CHWorkoutRouteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)close;
- (void)reportProblem;
- (void)shareButtonPressed;
- (void)toggleMapType;
- (void)updateLocationReadings:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CHWorkoutRouteViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (CHWorkoutRouteViewController)initWithLocationReadings:(id)a3 title:(id)a4 sharingEnabled:(BOOL)a5 shareText:(id)a6 excludedActivityTypes:(id)a7
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  type metadata accessor for ActivityType(0);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (CHWorkoutRouteViewController *)sub_100346DB4(a3, v9, v11, a5, v12, v14, v15);
}

- (CHWorkoutRouteViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003492A0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100347090(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WorkoutRouteViewController();
  id v4 = v8.receiver;
  [(CHWorkoutRouteViewController *)&v8 viewWillDisappear:v3];
  id v5 = [v4 tabBarController];
  if (v5)
  {
    v6 = v5;
    id v7 = [v5 tabBar];

    [v7 setScrollEdgeAppearance:0];
    id v4 = v7;
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1003472B0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003475D4();
}

- (void)close
{
}

- (void)shareButtonPressed
{
  v2 = self;
  sub_10034798C();
}

- (void)toggleMapType
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutRouteViewController_mapView);
  id v4 = self;
  if ([v2 mapType] == (id)5) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 5;
  }
  sub_100347D98(v3);
}

- (void)reportProblem
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutRouteViewController_mapView);
  uint64_t v3 = self;
  [v2 centerCoordinate];
  CLLocationDegrees v5 = v4;
  CLLocationDegrees v7 = v6;
  id v8 = [*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR___CHWorkoutRouteViewController_workout) trackId];
  id v9 = objc_allocWithZone((Class)type metadata accessor for WorkoutDetailedBasicViewController());
  id v10 = sub_100322998(v8, v5, v7);

  [(CHWorkoutRouteViewController *)v3 presentViewController:v10 animated:1 completion:0];
}

- (CHWorkoutRouteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHWorkoutRouteViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutRouteViewController_toggleMapTypeButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutRouteViewController_reportProblemButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutRouteViewController_geoMapFeatureAccess));

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  CLLocationDegrees v7 = self;
  id v8 = sub_1003493DC((uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  CLLocationDegrees v7 = self;
  id v8 = sub_1003495DC((uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v3 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();

  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  CLLocationDegrees v5 = self;
  id v6 = sub_1003496D8();

  return v6;
}

- (void)updateLocationReadings:(id)a3
{
  id v4 = a3;
  CLLocationDegrees v5 = self;
  sub_100349108(v4);
}

@end