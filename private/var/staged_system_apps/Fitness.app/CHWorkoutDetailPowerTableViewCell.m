@interface CHWorkoutDetailPowerTableViewCell
+ (double)preferredHeightForWorkout:(id)a3;
- (CHWorkoutDetailPowerTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailPowerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 powerSamples:(id)a7 parent:(id)a8;
@end

@implementation CHWorkoutDetailPowerTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  return 132.0;
}

- (CHWorkoutDetailPowerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutDetailPowerTableViewCell *)sub_1006710E0(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailPowerTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_powerController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_cellPadding) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_cellInset) = (Class)0x4030000000000000;
  id v4 = a3;

  result = (CHWorkoutDetailPowerTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 powerSamples:(id)a7 parent:(id)a8
{
  sub_10007E2D8(0, (unint64_t *)&qword_100951108);
  v14 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = (void (**)(char *, char *))a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v20 = self;
  sub_10067137C(v15, a4, v17, v18, v14, v19);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailPowerTableViewCell_powerController));
}

@end