@interface CHWorkoutDetailedBasicViewController
- (CHWorkoutDetailedBasicViewController)initWithCoder:(id)a3;
- (CHWorkoutDetailedBasicViewController)initWithDownhillRunDataSource:(id)a3;
- (CHWorkoutDetailedBasicViewController)initWithIntervalDataSource:(id)a3;
- (CHWorkoutDetailedBasicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHWorkoutDetailedBasicViewController)initWithSegmentDataSource:(id)a3;
- (CHWorkoutDetailedBasicViewController)initWithSplitDataSource:(id)a3;
- (CHWorkoutDetailedBasicViewController)initWithSwimmingSetDataSource:(id)a3;
- (CHWorkoutDetailedBasicViewController)initWithSwimmingSplitDataSource:(id)a3;
- (CHWorkoutDetailedBasicViewController)initWithTrackLapDataSource:(id)a3;
- (void)close;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CHWorkoutDetailedBasicViewController

- (CHWorkoutDetailedBasicViewController)initWithSegmentDataSource:(id)a3
{
  id v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_100321558(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithSplitDataSource:(id)a3
{
  id v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_10032194C(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithIntervalDataSource:(id)a3
{
  id v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_100321CFC(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithSwimmingSetDataSource:(id)a3
{
  return (CHWorkoutDetailedBasicViewController *)sub_1003205BC(a3);
}

- (CHWorkoutDetailedBasicViewController)initWithSwimmingSplitDataSource:(id)a3
{
  return (CHWorkoutDetailedBasicViewController *)sub_100320814(a3);
}

- (CHWorkoutDetailedBasicViewController)initWithTrackLapDataSource:(id)a3
{
  id v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_100322190(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithDownhillRunDataSource:(id)a3
{
  id v3 = a3;
  v4 = (CHWorkoutDetailedBasicViewController *)sub_100322624(v3);

  return v4;
}

- (CHWorkoutDetailedBasicViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___CHWorkoutDetailedBasicViewController_activityIndicator;
  id v6 = objc_allocWithZone((Class)UIActivityIndicatorView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithActivityIndicatorStyle:100];

  result = (CHWorkoutDetailedBasicViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100320B80();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100320EBC(a3);
}

- (void)close
{
}

- (CHWorkoutDetailedBasicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHWorkoutDetailedBasicViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedBasicViewController_metricController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CHWorkoutDetailedBasicViewController_activityIndicator);
}

@end