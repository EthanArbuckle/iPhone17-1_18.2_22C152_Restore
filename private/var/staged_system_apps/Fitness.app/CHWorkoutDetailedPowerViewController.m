@interface CHWorkoutDetailedPowerViewController
- (CHWorkoutDetailedPowerViewController)initWithCoder:(id)a3;
- (CHWorkoutDetailedPowerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHWorkoutDetailedPowerViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 formattingManager:(id)a6 isFirstPartyWorkout:(BOOL)a7;
- (void)close;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CHWorkoutDetailedPowerViewController

- (CHWorkoutDetailedPowerViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 formattingManager:(id)a6 isFirstPartyWorkout:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (CHWorkoutDetailedPowerViewController *)sub_1001ABFD4(v11, a4, v13, v14, a7);

  return v15;
}

- (CHWorkoutDetailedPowerViewController)initWithCoder:(id)a3
{
  result = (CHWorkoutDetailedPowerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001AB528();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1001AB88C(a3);
}

- (void)close
{
}

- (CHWorkoutDetailedPowerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHWorkoutDetailedPowerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailedPowerViewController_workoutActivity));

  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CHWorkoutDetailedPowerViewController_powerController);
}

@end