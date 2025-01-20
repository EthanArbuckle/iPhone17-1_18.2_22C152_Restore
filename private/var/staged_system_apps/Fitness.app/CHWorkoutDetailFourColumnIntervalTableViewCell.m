@interface CHWorkoutDetailFourColumnIntervalTableViewCell
- (CHWorkoutDetailFourColumnIntervalTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailFourColumnIntervalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureHeaderWithWorkout:(id)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 formattingManager:(id)a6;
- (void)configureWithInterval:(id)a3 index:(int64_t)a4 workout:(id)a5 activityType:(id)a6 activityMoveMode:(int64_t)a7 isLastCell:(BOOL)a8 formattingManager:(id)a9;
@end

@implementation CHWorkoutDetailFourColumnIntervalTableViewCell

- (void)configureHeaderWithWorkout:(id)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 formattingManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_1004C2B30((uint64_t)v10, (uint64_t)v11, a5, v12);
}

- (void)configureWithInterval:(id)a3 index:(int64_t)a4 workout:(id)a5 activityType:(id)a6 activityMoveMode:(int64_t)a7 isLastCell:(BOOL)a8 formattingManager:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  v20 = self;
  sub_1004C3314(a3, a4, v17, v18, (void *)a7, a8, v19);
}

- (CHWorkoutDetailFourColumnIntervalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnIntervalTableViewCell();
  v7 = [(CHWorkoutDetailFourColumnTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (CHWorkoutDetailFourColumnIntervalTableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnIntervalTableViewCell();
  return [(CHWorkoutDetailFourColumnTableViewCell *)&v5 initWithCoder:a3];
}

@end