@interface DayViewTitleAndValueLabelPair
- (CGSize)intrinsicContentSize;
- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)initWithCoder:(id)a3;
- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)initWithFrame:(CGRect)a3;
- (void)updateFonts;
@end

@implementation DayViewTitleAndValueLabelPair

- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp29DayViewTitleAndValueLabelPair *)sub_100276084(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateFonts
{
  v2 = self;
  sub_10027690C();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_100276A2C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC10FitnessApp29DayViewTitleAndValueLabelPair)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_titleLabelTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueLabelTextColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueAttributedText));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_titleBaselineConstraint));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp29DayViewTitleAndValueLabelPair_valueBaselineConstraint);
}

@end