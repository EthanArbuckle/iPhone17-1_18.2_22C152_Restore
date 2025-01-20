@interface TrendDetailSummaryView
- (_TtC10FitnessApp22TrendDetailSummaryView)initWithCoder:(id)a3;
- (_TtC10FitnessApp22TrendDetailSummaryView)initWithFrame:(CGRect)a3;
@end

@implementation TrendDetailSummaryView

- (_TtC10FitnessApp22TrendDetailSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp22TrendDetailSummaryView *)sub_1002AA520(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp22TrendDetailSummaryView)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendDetailSummaryView_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendDetailSummaryView_coachingLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp22TrendDetailSummaryView_divider);
}

@end