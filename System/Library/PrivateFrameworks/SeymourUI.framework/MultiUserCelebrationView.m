@interface MultiUserCelebrationView
- (_TtC9SeymourUI24MultiUserCelebrationView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24MultiUserCelebrationView)initWithFrame:(CGRect)a3;
- (void)presentWithDuration:(double)a3;
@end

@implementation MultiUserCelebrationView

- (_TtC9SeymourUI24MultiUserCelebrationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A481330();
}

- (_TtC9SeymourUI24MultiUserCelebrationView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI24MultiUserCelebrationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_platter));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_monogramLabel));
  sub_239EA0A14((uint64_t)self + OBJC_IVAR____TtC9SeymourUI24MultiUserCelebrationView_stringBuilder);

  swift_release();
}

- (void)presentWithDuration:(double)a3
{
  v4 = self;
  sub_23A480D38(a3);
}

@end