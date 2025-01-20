@interface DayViewFlightsTableViewCell
- (_TtC10FitnessApp27DayViewFlightsTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp27DayViewFlightsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DayViewFlightsTableViewCell

- (_TtC10FitnessApp27DayViewFlightsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp27DayViewFlightsTableViewCell *)sub_1002C1F98(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp27DayViewFlightsTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27DayViewFlightsTableViewCell_div));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp27DayViewFlightsTableViewCell_labelPair);
}

@end