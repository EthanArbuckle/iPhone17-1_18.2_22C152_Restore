@interface CHWorkoutDetailedHeartRateViewController
- (CHWorkoutDetailedHeartRateViewController)initWithCoder:(id)a3;
- (CHWorkoutDetailedHeartRateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHWorkoutDetailedHeartRateViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5;
- (void)close;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CHWorkoutDetailedHeartRateViewController

- (CHWorkoutDetailedHeartRateViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 formattingManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (CHWorkoutDetailedHeartRateViewController *)sub_100214784(v7, a4, v9);

  return v10;
}

- (CHWorkoutDetailedHeartRateViewController)initWithCoder:(id)a3
{
  result = (CHWorkoutDetailedHeartRateViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100213D34();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100214098(a3);
}

- (void)close
{
}

- (CHWorkoutDetailedHeartRateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHWorkoutDetailedHeartRateViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_workout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_workoutActivity));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CHWorkoutDetailedHeartRateViewController_heartRateController);
}

@end