@interface SummaryTrainerView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI18SummaryTrainerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI18SummaryTrainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SummaryTrainerView

- (_TtC9SeymourUI18SummaryTrainerView)initWithFrame:(CGRect)a3
{
  sub_23A155900(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC9SeymourUI18SummaryTrainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A155E7C();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 90.0;
  double v3 = 90.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_23A155C5C();
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18SummaryTrainerView_borderLayer);
}

@end