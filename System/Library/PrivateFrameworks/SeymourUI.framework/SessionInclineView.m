@interface SessionInclineView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9SeymourUI18SessionInclineView)initWithCoder:(id)a3;
- (_TtC9SeymourUI18SessionInclineView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionInclineView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_23A1F5D14();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI18SessionInclineView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A1F6D74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A1F67B0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SessionInclineView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI18SessionInclineView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI18SessionInclineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_walkingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_runningImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_walkingValueLabel));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18SessionInclineView_runningValueLabel);
}

@end