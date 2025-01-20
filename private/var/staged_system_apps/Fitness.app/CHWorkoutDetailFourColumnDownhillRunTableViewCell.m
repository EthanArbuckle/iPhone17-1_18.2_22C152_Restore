@interface CHWorkoutDetailFourColumnDownhillRunTableViewCell
- (CHWorkoutDetailFourColumnDownhillRunTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailFourColumnDownhillRunTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureHeaderWithFormattingManager:(id)a3;
- (void)configureWithDownhillRun:(id)a3 downhillRunIndex:(int64_t)a4 activityType:(id)a5 isLastCell:(BOOL)a6 formattingManager:(id)a7;
- (void)configureWithDownhillRunsStats:(id)a3 activityType:(id)a4 formattingManager:(id)a5;
@end

@implementation CHWorkoutDetailFourColumnDownhillRunTableViewCell

- (void)configureHeaderWithFormattingManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100266BCC(v4);
}

- (void)configureWithDownhillRunsStats:(id)a3 activityType:(id)a4 formattingManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10026726C((int)v8, (uint64_t)v9, v10);
}

- (void)configureWithDownhillRun:(id)a3 downhillRunIndex:(int64_t)a4 activityType:(id)a5 isLastCell:(BOOL)a6 formattingManager:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v16 = self;
  sub_1002675D4(a3, a4, (uint64_t)v14, a6, v15);
}

- (CHWorkoutDetailFourColumnDownhillRunTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnDownhillRunTableViewCell();
  v7 = [(CHWorkoutDetailFourColumnTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (CHWorkoutDetailFourColumnDownhillRunTableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutDetailFourColumnDownhillRunTableViewCell();
  return [(CHWorkoutDetailFourColumnTableViewCell *)&v5 initWithCoder:a3];
}

@end