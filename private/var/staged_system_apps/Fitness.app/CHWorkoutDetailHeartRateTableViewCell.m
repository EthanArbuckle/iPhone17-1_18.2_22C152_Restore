@interface CHWorkoutDetailHeartRateTableViewCell
+ (double)preferredHeightForWorkout:(id)a3;
- (CHWorkoutDetailHeartRateTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailHeartRateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 heartRateReadings:(id)a7 averageHeartRate:(id)a8 parent:(id)a9;
@end

@implementation CHWorkoutDetailHeartRateTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  return 132.0;
}

- (CHWorkoutDetailHeartRateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailHeartRateTableViewCell *)sub_1003A5DF8(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailHeartRateTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_heartRateController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_cellPadding) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_cellInset) = (Class)0x4030000000000000;
  id v4 = a3;

  result = (CHWorkoutDetailHeartRateTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 heartRateReadings:(id)a7 averageHeartRate:(id)a8 parent:(id)a9
{
  sub_10007E2D8(0, &qword_10095A3B8);
  v15 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v20 = (char *)a8;
  id v21 = a9;
  v22 = self;
  sub_1003A6094(v16, a4, v18, v19, v15, v20, v21);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailHeartRateTableViewCell_heartRateController));
}

@end