@interface SessionHeartRateView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI20SessionHeartRateView)initWithCoder:(id)a3;
- (_TtC9SeymourUI20SessionHeartRateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionHeartRateView

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionHeartRateView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionHeartRateView_heartView), sel_sizeThatFits_, 0.0, 0.0);
  double v7 = v5 + v6 + 2.0;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A1427EC();
}

- (_TtC9SeymourUI20SessionHeartRateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A14411C();
}

- (_TtC9SeymourUI20SessionHeartRateView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI20SessionHeartRateView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_23A143FF0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20SessionHeartRateView_state, type metadata accessor for SessionHeartRateView.State);
  swift_unknownObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionHeartRateView_label);
}

@end