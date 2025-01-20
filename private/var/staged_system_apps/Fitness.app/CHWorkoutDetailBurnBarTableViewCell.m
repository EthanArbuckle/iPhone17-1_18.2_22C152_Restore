@interface CHWorkoutDetailBurnBarTableViewCell
+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5;
- (CHWorkoutDetailBurnBarTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailBurnBarTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithFitnessAppContext:(id)a3 workout:(id)a4 scoreSummaryWrapper:(id)a5;
@end

@implementation CHWorkoutDetailBurnBarTableViewCell

+ (double)preferredHeightForWorkout:(id)a3 indexPath:(id)a4 numberOfRows:(int64_t)a5
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 108.0;
}

- (CHWorkoutDetailBurnBarTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView) = 0;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for WorkoutDetailBurnBarTableViewCell();
  uint64_t v7 = [(CHWorkoutDetailBurnBarTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (void)configureWithFitnessAppContext:(id)a3 workout:(id)a4 scoreSummaryWrapper:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100242AA4((uint64_t)v8, v9, (uint64_t)v10);
}

- (CHWorkoutDetailBurnBarTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView) = 0;
  id v4 = a3;

  result = (CHWorkoutDetailBurnBarTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailBurnBarTableViewCell_burnBarView));
}

@end