@interface DayViewMoveAndExerciseChartTableViewCell
- (UIButton)editGoalButton;
- (UILabel)auxiliaryLabel;
- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)labelPair;
- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)chartView;
- (_TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation DayViewMoveAndExerciseChartTableViewCell

- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)labelPair
{
  return (_TtC10FitnessApp29DayViewTitleAndValueLabelPair *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_labelPair);
}

- (_TtC10FitnessApp32ActivityMoveAndExerciseChartView)chartView
{
  return (_TtC10FitnessApp32ActivityMoveAndExerciseChartView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_chartView);
}

- (UILabel)auxiliaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_auxiliaryLabel));
}

- (UIButton)editGoalButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_editGoalButton));
}

- (_TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  sub_1003E0C24(a3, (uint64_t)a4, v6);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DayViewMoveAndExerciseChartTableViewCell();
  v2 = (char *)v5.receiver;
  [(DayViewMoveAndExerciseChartTableViewCell *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_editGoalButton];
  id v4 = [v3 layer];
  [v3 frame];
  [v4 setCornerRadius:CGRectGetHeight(v6) * 0.5];

  [v3 setNeedsLayout];
}

- (void)dealloc
{
  v2 = self;
  sub_1003E28D4();
}

- (void).cxx_destruct
{
  sub_1000D6120(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_histogram));
  sub_1000D6120(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_workoutHistogram));
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_onEditGoal));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_auxiliaryValue));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_labelPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_chartView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_auxiliaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_editGoalButton));
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell_fontListener, &qword_100955A00);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC10FitnessApp40DayViewMoveAndExerciseChartTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

@end