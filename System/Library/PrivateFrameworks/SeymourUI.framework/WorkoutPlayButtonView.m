@interface WorkoutPlayButtonView
- (_TtC9SeymourUI21WorkoutPlayButtonView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21WorkoutPlayButtonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WorkoutPlayButtonView

- (_TtC9SeymourUI21WorkoutPlayButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21WorkoutPlayButtonView *)sub_239EEF394(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21WorkoutPlayButtonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EEFF58();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239EEFBF0();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21WorkoutPlayButtonView_playButton);
}

@end