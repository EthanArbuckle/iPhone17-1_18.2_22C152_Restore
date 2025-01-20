@interface WorkoutActivityGridView
- (_TtC7Journal23WorkoutActivityGridView)initWithCoder:(id)a3;
- (_TtC7Journal23WorkoutActivityGridView)initWithFrame:(CGRect)a3;
@end

@implementation WorkoutActivityGridView

- (_TtC7Journal23WorkoutActivityGridView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal23WorkoutActivityGridView *)sub_10059C2E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal23WorkoutActivityGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005A270C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23WorkoutActivityGridView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23WorkoutActivityGridView_workoutDataLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23WorkoutActivityGridView_workoutImageView));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal23WorkoutActivityGridView_workoutAsset);
}

@end