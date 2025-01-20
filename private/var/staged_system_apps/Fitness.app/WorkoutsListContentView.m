@interface WorkoutsListContentView
- (_TtC10FitnessApp23WorkoutsListContentView)initWithCoder:(id)a3;
- (_TtC10FitnessApp23WorkoutsListContentView)initWithFrame:(CGRect)a3;
- (void)configureWithCurrentWorkout;
@end

@implementation WorkoutsListContentView

- (_TtC10FitnessApp23WorkoutsListContentView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp23WorkoutsListContentView *)sub_1001B4764(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp23WorkoutsListContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001B5E74();
}

- (void)configureWithCurrentWorkout
{
  v2 = self;
  sub_1001B538C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_workout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_workoutCellImageLabelView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp23WorkoutsListContentView_dateLabel);
}

@end