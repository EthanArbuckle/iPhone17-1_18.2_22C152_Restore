@interface CHWorkoutsListTableViewCell
+ (double)preferredHeightForWorkout:(id)a3 formattingManager:(id)a4;
- (CHWorkoutsListTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutsListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6;
- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6 completion:(id)a7;
@end

@implementation CHWorkoutsListTableViewCell

- (CHWorkoutsListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHWorkoutsListTableViewCell *)sub_1001B3D8C(a3, (uint64_t)a4, v6);
}

- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  sub_1001B430C(v10, v11, v12, a6, 1, 0, 0);
}

- (void)setWorkout:(id)a3 fitnessAppContext:(id)a4 formattingManager:(id)a5 achievementCount:(int64_t)a6 completion:(id)a7
{
  id v12 = _Block_copy(a7);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    id v12 = sub_1001A7D48;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  sub_1001B430C(v14, v15, v16, a6, 1, (uint64_t)v12, v13);
  sub_10005E5F8((uint64_t)v12);
}

+ (double)preferredHeightForWorkout:(id)a3 formattingManager:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (CHWorkoutsListTableViewCell)initWithCoder:(id)a3
{
  result = (CHWorkoutsListTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WorkoutsListTableViewCell();
  id v2 = v3.receiver;
  [(CHWorkoutsListTableViewCell *)&v3 prepareForReuse];
  sub_1001B585C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutsListTableViewCell_workoutContentView));
}

@end