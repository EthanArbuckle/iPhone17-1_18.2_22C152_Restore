@interface GoalDaysModel
- (NSArray)goalDays;
- (_TtC10FitnessApp13GoalDaysModel)init;
- (_TtC10FitnessApp13GoalDaysModel)initWithGoalSchedule:(id)a3;
- (int64_t)goalType;
- (void)setGoalDays:(id)a3;
- (void)setGoalType:(int64_t)a3;
@end

@implementation GoalDaysModel

- (NSArray)goalDays
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  type metadata accessor for GoalDay();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setGoalDays:(id)a3
{
  type metadata accessor for GoalDay();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v4 = self;
  static Published.subscript.setter();
}

- (int64_t)goalType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel_goalType);
}

- (void)setGoalType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel_goalType) = (Class)a3;
}

- (_TtC10FitnessApp13GoalDaysModel)initWithGoalSchedule:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_10055C968();
  swift_beginAccess();
  uint64_t v11 = v6;
  sub_1000AFA94(&qword_100952E40);
  Published.init(initialValue:)();
  swift_endAccess();
  v7 = (objc_class *)[v4 goalType];
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel_goalType) = v7;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for GoalDaysModel();
  v8 = [(GoalDaysModel *)&v10 init];

  return v8;
}

- (_TtC10FitnessApp13GoalDaysModel)init
{
  result = (_TtC10FitnessApp13GoalDaysModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10FitnessApp13GoalDaysModel__goalDays;
  uint64_t v3 = sub_1000AFA94(&qword_100952E48);
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end