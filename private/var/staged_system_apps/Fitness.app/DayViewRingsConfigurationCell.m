@interface DayViewRingsConfigurationCell
- (_TtC10FitnessApp29DayViewRingsConfigurationCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp29DayViewRingsConfigurationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)onLeftButtonPressed:(id)a3;
- (void)onRightButtonPressed:(id)a3;
@end

@implementation DayViewRingsConfigurationCell

- (_TtC10FitnessApp29DayViewRingsConfigurationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  sub_1004A5FC0(a3, (uint64_t)a4, v6);
  return result;
}

- (void)onLeftButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004A7260(&OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onUnpauseRings, &OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onChangeGoals);
}

- (void)onRightButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004A7260(&OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onEditPauseRings, &OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onPauseRings);
}

- (_TtC10FitnessApp29DayViewRingsConfigurationCell)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_rightButton));
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onChangeGoals));
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onPauseRings));
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onUnpauseRings));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10FitnessApp29DayViewRingsConfigurationCell_onEditPauseRings);

  sub_10005E5F8(v3);
}

@end