@interface DeviceBadgeView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI15DeviceBadgeView)initWithCoder:(id)a3;
- (_TtC9SeymourUI15DeviceBadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DeviceBadgeView

- (_TtC9SeymourUI15DeviceBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A73A6E4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A739884();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_23A739E40();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC9SeymourUI15DeviceBadgeView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI15DeviceBadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15DeviceBadgeView_heightConstraint);
}

@end