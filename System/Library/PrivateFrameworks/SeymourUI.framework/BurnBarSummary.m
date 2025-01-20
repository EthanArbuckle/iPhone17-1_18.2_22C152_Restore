@interface BurnBarSummary
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9SeymourUI14BurnBarSummary)initWithCoder:(id)a3;
- (_TtC9SeymourUI14BurnBarSummary)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BurnBarSummary

- (_TtC9SeymourUI14BurnBarSummary)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14BurnBarSummary *)sub_23A7DF074(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI14BurnBarSummary)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7E260C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A7E0E80();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_23A7E1704();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A0DCA84(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI14BurnBarSummary_stringBuilder));
  swift_release();
  sub_23A7E2430((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14BurnBarSummary_scoreMetric);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14BurnBarSummary_burnBarHeightConstraint);
}

@end