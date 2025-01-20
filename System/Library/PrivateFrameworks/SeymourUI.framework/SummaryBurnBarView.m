@interface SummaryBurnBarView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI18SummaryBurnBarView)initWithCoder:(id)a3;
- (_TtC9SeymourUI18SummaryBurnBarView)initWithFrame:(CGRect)a3;
@end

@implementation SummaryBurnBarView

- (_TtC9SeymourUI18SummaryBurnBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A0DD7F8();
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18SummaryBurnBarView_burnBarSummary);
  id v3 = self;
  objc_msgSend(v2, sel_frame);
  CGFloat MaxX = CGRectGetMaxX(v9);
  objc_msgSend(v2, sel_frame);
  CGFloat MaxY = CGRectGetMaxY(v10);

  double v6 = MaxX;
  double v7 = MaxY;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI18SummaryBurnBarView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI18SummaryBurnBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SummaryBurnBarView_headerLabelStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SummaryBurnBarView_burnBarSummary));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end