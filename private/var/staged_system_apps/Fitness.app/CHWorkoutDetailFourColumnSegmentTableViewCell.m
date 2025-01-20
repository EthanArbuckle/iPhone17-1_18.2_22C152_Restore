@interface CHWorkoutDetailFourColumnSegmentTableViewCell
- (CHWorkoutDetailFourColumnSegmentTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailFourColumnSegmentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureHeaderWithWorkout:(id)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 formattingManager:(id)a6;
- (void)configureWithSegment:(id)a3 segmentIndex:(int64_t)a4 workout:(id)a5 trackDistanceUnit:(unint64_t)a6 activityType:(id)a7 activityMoveMode:(int64_t)a8 isLastCell:(BOOL)a9 formattingManager:(id)a10;
@end

@implementation CHWorkoutDetailFourColumnSegmentTableViewCell

- (void)configureHeaderWithWorkout:(id)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 formattingManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_10031EA04((uint64_t)v10, (uint64_t)v11, a5, v12);
}

- (void)configureWithSegment:(id)a3 segmentIndex:(int64_t)a4 workout:(id)a5 trackDistanceUnit:(unint64_t)a6 activityType:(id)a7 activityMoveMode:(int64_t)a8 isLastCell:(BOOL)a9 formattingManager:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a10;
  v20 = self;
  sub_10031F1FC(a3, a4, v17, a6, (uint64_t)v18, a8, a9, v19);
}

- (CHWorkoutDetailFourColumnSegmentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSegmentTableViewCell();
  v7 = [(CHWorkoutDetailFourColumnTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (CHWorkoutDetailFourColumnSegmentTableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSegmentTableViewCell();
  return [(CHWorkoutDetailFourColumnTableViewCell *)&v5 initWithCoder:a3];
}

@end