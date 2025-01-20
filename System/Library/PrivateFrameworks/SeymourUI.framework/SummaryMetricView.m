@interface SummaryMetricView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI17SummaryMetricView)initWithCoder:(id)a3;
- (_TtC9SeymourUI17SummaryMetricView)initWithFrame:(CGRect)a3;
@end

@implementation SummaryMetricView

- (_TtC9SeymourUI17SummaryMetricView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17SummaryMetricView *)sub_23A364C38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI17SummaryMetricView_labelStack), sel_sizeThatFits_, 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC9SeymourUI17SummaryMetricView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI17SummaryMetricView_labelStack;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SessionStackedLabelView());
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  CGSize result = (_TtC9SeymourUI17SummaryMetricView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end