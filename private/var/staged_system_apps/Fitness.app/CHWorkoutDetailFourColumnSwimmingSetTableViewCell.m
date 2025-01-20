@interface CHWorkoutDetailFourColumnSwimmingSetTableViewCell
+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5;
- (CHWorkoutDetailFourColumnSwimmingSetTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailFourColumnSwimmingSetTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureHeader;
- (void)configureWithSwimmingSet:(id)a3 index:(int64_t)a4 isLastCell:(BOOL)a5 formattingManager:(id)a6;
@end

@implementation CHWorkoutDetailFourColumnSwimmingSetTableViewCell

+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  if (IndexPath.row.getter()) {
    double v9 = 83.0;
  }
  else {
    double v9 = 32.0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (void)configureHeader
{
  v2 = self;
  sub_10026BF58();
}

- (void)configureWithSwimmingSet:(id)a3 index:(int64_t)a4 isLastCell:(BOOL)a5 formattingManager:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v13 = self;
  sub_10026C3D0(a3, a4, a5, (uint64_t)v12);
}

- (CHWorkoutDetailFourColumnSwimmingSetTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSwimmingSetTableViewCell();
  uint64_t v7 = [(CHWorkoutDetailFourColumnTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (CHWorkoutDetailFourColumnSwimmingSetTableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnSwimmingSetTableViewCell();
  return [(CHWorkoutDetailFourColumnTableViewCell *)&v5 initWithCoder:a3];
}

@end