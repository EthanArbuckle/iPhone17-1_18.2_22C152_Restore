@interface SessionSingleMetricView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9SeymourUI23SessionSingleMetricView)initWithCoder:(id)a3;
- (_TtC9SeymourUI23SessionSingleMetricView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionSingleMetricView

- (_TtC9SeymourUI23SessionSingleMetricView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23SessionSingleMetricView *)sub_23A219EA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A21A480();
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_valueLabel);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_unitLabel), sel_intrinsicContentSize);
  double v7 = v5 + v6 + 2.0;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SessionSingleMetricView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI23SessionSingleMetricView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s9SeymourUI23SessionSingleMetricViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_valueLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_unitLabel);
}

@end