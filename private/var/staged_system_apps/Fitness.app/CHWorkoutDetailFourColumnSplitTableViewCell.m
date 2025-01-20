@interface CHWorkoutDetailFourColumnSplitTableViewCell
- (CHWorkoutDetailFourColumnSplitTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailFourColumnSplitTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureHeaderWithActivityType:(id)a3;
- (void)configureWithSwimmingSplit:(id)a3 splitIndex:(int64_t)a4 isLastCell:(BOOL)a5 formattingManager:(id)a6;
- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 unit:(id)a5 split:(id)a6 splitIndex:(int64_t)a7 splitDistance:(double)a8 isLastCell:(BOOL)a9 dataCalculator:(id)a10 formattingManager:(id)a11;
@end

@implementation CHWorkoutDetailFourColumnSplitTableViewCell

- (void)configureHeaderWithActivityType:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10042F0E8(v4);
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 unit:(id)a5 split:(id)a6 splitIndex:(int64_t)a7 splitDistance:(double)a8 isLastCell:(BOOL)a9 dataCalculator:(id)a10 formattingManager:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a10;
  id v22 = a11;
  v23 = self;
  sub_100430824(v17, a4, v20, a7, a9, v21, v22);
}

- (CHWorkoutDetailFourColumnSplitTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSplitTableViewCell();
  v7 = [(CHWorkoutDetailFourColumnTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (CHWorkoutDetailFourColumnSplitTableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSplitTableViewCell();
  return [(CHWorkoutDetailFourColumnTableViewCell *)&v5 initWithCoder:a3];
}

- (void)configureWithSwimmingSplit:(id)a3 splitIndex:(int64_t)a4 isLastCell:(BOOL)a5 formattingManager:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = self;
  sub_1004301B4(v10, (char *)a4, a5, v11);
}

@end