@interface BurnBarGradientContainer
- (_TtC9SeymourUI24BurnBarGradientContainer)initWithCoder:(id)a3;
- (_TtC9SeymourUI24BurnBarGradientContainer)initWithFrame:(CGRect)a3;
@end

@implementation BurnBarGradientContainer

- (_TtC9SeymourUI24BurnBarGradientContainer)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24BurnBarGradientContainer *)sub_23A73822C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24BurnBarGradientContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A738F80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24BurnBarGradientContainer_gradient));
}

@end