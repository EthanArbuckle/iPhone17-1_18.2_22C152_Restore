@interface CHWorkoutDetailEffortTableViewCell
- (CHWorkoutDetailEffortTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailEffortTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 parent:(id)a6;
@end

@implementation CHWorkoutDetailEffortTableViewCell

- (CHWorkoutDetailEffortTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (CHWorkoutDetailEffortTableViewCell *)sub_100393CF8(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailEffortTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10039840C();
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 parent:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_10039475C(v10, a4, v12, v13);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_effortController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_dataCalculator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_workout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailEffortTableViewCell_workoutActivity));

  swift_release();
}

@end