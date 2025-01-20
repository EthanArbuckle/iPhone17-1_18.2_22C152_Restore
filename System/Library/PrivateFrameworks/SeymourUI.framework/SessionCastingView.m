@interface SessionCastingView
- (_TtC9SeymourUI18SessionCastingView)initWithCoder:(id)a3;
- (_TtC9SeymourUI18SessionCastingView)initWithFrame:(CGRect)a3;
- (void)airplayButtonTapped;
- (void)exitButtonTapped;
- (void)playButtonTapped;
@end

@implementation SessionCastingView

- (_TtC9SeymourUI18SessionCastingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A30F760();
}

- (void)exitButtonTapped
{
}

- (void)airplayButtonTapped
{
}

- (void)playButtonTapped
{
  v2 = self;
  sub_239DF80EC();
}

- (_TtC9SeymourUI18SessionCastingView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI18SessionCastingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_exitControlItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_airplayControlItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_playControlItem));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18SessionCastingView_castingStackView);
}

@end