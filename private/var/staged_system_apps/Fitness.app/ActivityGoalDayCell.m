@interface ActivityGoalDayCell
- (_TtC10FitnessApp19ActivityGoalDayCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp19ActivityGoalDayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setupGoalViewValueChanged:(id)a3 value:(id)a4;
@end

@implementation ActivityGoalDayCell

- (_TtC10FitnessApp19ActivityGoalDayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp19ActivityGoalDayCell *)sub_10061E688(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp19ActivityGoalDayCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_dayLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_goalView) = 0;
  *(void *)&self->dayLabel[OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC10FitnessApp19ActivityGoalDayCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_goalView));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_delegate;

  sub_10019B9F8((uint64_t)v3);
}

- (void)setupGoalViewValueChanged:(id)a3 value:(id)a4
{
  id v7 = (char *)self + OBJC_IVAR____TtC10FitnessApp19ActivityGoalDayCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 8);
    id v10 = a3;
    id v11 = a4;
    v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

@end