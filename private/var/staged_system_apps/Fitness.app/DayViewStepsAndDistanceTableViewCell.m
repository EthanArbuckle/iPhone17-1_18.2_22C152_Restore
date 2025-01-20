@interface DayViewStepsAndDistanceTableViewCell
- (_TtC10FitnessApp36DayViewStepsAndDistanceTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp36DayViewStepsAndDistanceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DayViewStepsAndDistanceTableViewCell

- (_TtC10FitnessApp36DayViewStepsAndDistanceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp36DayViewStepsAndDistanceTableViewCell *)sub_1006108FC(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp36DayViewStepsAndDistanceTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36DayViewStepsAndDistanceTableViewCell_stepsLabelPair));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp36DayViewStepsAndDistanceTableViewCell_distanceLabelPair);
}

@end