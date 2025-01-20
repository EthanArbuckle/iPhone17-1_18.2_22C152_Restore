@interface TrendArrowIndicatorView
- (_TtC10FitnessApp23TrendArrowIndicatorView)initWithCoder:(id)a3;
- (_TtC10FitnessApp23TrendArrowIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TrendArrowIndicatorView

- (_TtC10FitnessApp23TrendArrowIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp23TrendArrowIndicatorView *)sub_1005791A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp23TrendArrowIndicatorView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10057AC70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_arrowLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_arrowGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_arrowContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_gradientColors));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_circleColor);
}

@end