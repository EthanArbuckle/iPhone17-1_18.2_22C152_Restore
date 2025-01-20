@interface CHWorkoutDetailedMetricsViewController
- (CHWorkoutDetailedMetricsViewController)initWithCoder:(id)a3;
- (CHWorkoutDetailedMetricsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHWorkoutDetailedMetricsViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 locationReadings:(id)a7;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)close;
- (void)durationChanged:(id)a3;
- (void)updateLocationReadings:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CHWorkoutDetailedMetricsViewController

- (CHWorkoutDetailedMetricsViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 locationReadings:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  return (CHWorkoutDetailedMetricsViewController *)sub_1006AF8CC(v11, a4, a5, a6, a7);
}

- (CHWorkoutDetailedMetricsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006B5F8C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006B0960();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1006B12F0(a3);
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailedMetricsViewController();
  v2 = (char *)v5.receiver;
  [(CHWorkoutDetailedMetricsViewController *)&v5 viewDidLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapView];
  id v4 = *(id *)&v2[OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapGradientView];
  [v3 bounds];
  [v4 setFrame:];
}

- (void)close
{
}

- (void)durationChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1006B3930(v4);
}

- (CHWorkoutDetailedMetricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHWorkoutDetailedMetricsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_locationReadings));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_workoutActivity));
  id v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_startDate;
  uint64_t v4 = type metadata accessor for Date();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_endDate, v4);
  sub_10008DB18((uint64_t)self + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_selectedDate, (uint64_t *)&unk_10095B890);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_topViewHiddenConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_scrubbedAnnotation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_mapRoutePolyline));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_durationControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_chartHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_chartsController));
  swift_release();
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutDetailedMetricsViewController_distanceQueue);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_1006B6190((uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4 = [objc_allocWithZone((Class)type metadata accessor for WorkoutLocationAnnotationView()) initWithAnnotation:a4 reuseIdentifier:0];

  return v4;
}

- (void)updateLocationReadings:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1006B5554(v4);
}

@end