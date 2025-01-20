@interface DayViewStandChartTableViewCell
- (UIButton)editGoalButton;
- (UILabel)idleHoursLabel;
- (_TtC10FitnessApp22ActivityStandChartView)chartView;
- (_TtC10FitnessApp30DayViewStandChartTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp30DayViewStandChartTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)updateFonts;
@end

@implementation DayViewStandChartTableViewCell

- (UILabel)idleHoursLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_idleHoursLabel));
}

- (UIButton)editGoalButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_editGoalButton));
}

- (_TtC10FitnessApp22ActivityStandChartView)chartView
{
  return (_TtC10FitnessApp22ActivityStandChartView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_chartView));
}

- (_TtC10FitnessApp30DayViewStandChartTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  sub_1002334F4(a3, (uint64_t)a4, v6);
  return result;
}

- (void)updateFonts
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_idleHoursLabel);
  v4 = self;
  uint64_t v6 = self;
  id v5 = [v4 preferredFontForTextStyle:UIFontTextStyleCaption1];
  [v3 setFont:v5];

  [(DayViewStandChartTableViewCell *)v6 setNeedsLayout];
}

- (_TtC10FitnessApp30DayViewStandChartTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DayViewStandChartTableViewCell();
  v2 = (char *)v5.receiver;
  [(DayViewStandChartTableViewCell *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_editGoalButton];
  id v4 = [v3 layer];
  [v3 frame];
  [v4 setCornerRadius:CGRectGetHeight(v6) * 0.5];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_labelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_idleHoursLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_editGoalButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_chartView));
  swift_bridgeObjectRelease();
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp30DayViewStandChartTableViewCell_onEditGoal));

  swift_bridgeObjectRelease();
}

@end