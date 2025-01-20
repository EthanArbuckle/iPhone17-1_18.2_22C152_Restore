@interface TrendChartMaskingView
- (_TtC10FitnessApp21TrendChartMaskingView)initWithCoder:(id)a3;
- (_TtC10FitnessApp21TrendChartMaskingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TrendChartMaskingView

- (_TtC10FitnessApp21TrendChartMaskingView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp21TrendChartMaskingView *)sub_100213634(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp21TrendChartMaskingView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100213A18();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrendChartMaskingView_leftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrendChartMaskingView_centerView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp21TrendChartMaskingView_rightView);
}

@end