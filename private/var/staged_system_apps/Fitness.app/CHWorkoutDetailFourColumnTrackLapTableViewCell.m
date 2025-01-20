@interface CHWorkoutDetailFourColumnTrackLapTableViewCell
- (CHWorkoutDetailFourColumnTrackLapTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailFourColumnTrackLapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureHeaderWithWorkout:(id)a3 activityMoveMode:(int64_t)a4 formattingManager:(id)a5;
- (void)configureWithTrackLap:(id)a3 lapIndex:(int64_t)a4 workout:(id)a5 distanceUnit:(unint64_t)a6 activityType:(id)a7 activityMoveMode:(int64_t)a8 isLastCell:(BOOL)a9 formattingManager:(id)a10;
@end

@implementation CHWorkoutDetailFourColumnTrackLapTableViewCell

- (void)configureHeaderWithWorkout:(id)a3 activityMoveMode:(int64_t)a4 formattingManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  sub_1005FD4E8((uint64_t)v8, a4, v9);
}

- (void)configureWithTrackLap:(id)a3 lapIndex:(int64_t)a4 workout:(id)a5 distanceUnit:(unint64_t)a6 activityType:(id)a7 activityMoveMode:(int64_t)a8 isLastCell:(BOOL)a9 formattingManager:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a10;
  v20 = self;
  sub_1005FDE48(a3, (uint64_t)v17, a6, (uint64_t)v18, a8, a9, v19);
}

- (CHWorkoutDetailFourColumnTrackLapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnTrackLapTableViewCell();
  v7 = [(CHWorkoutDetailFourColumnTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (CHWorkoutDetailFourColumnTrackLapTableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnTrackLapTableViewCell();
  return [(CHWorkoutDetailFourColumnTableViewCell *)&v5 initWithCoder:a3];
}

@end