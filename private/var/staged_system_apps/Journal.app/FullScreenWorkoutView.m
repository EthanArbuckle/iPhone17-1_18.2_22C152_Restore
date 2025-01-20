@interface FullScreenWorkoutView
- (_TtC7Journal21FullScreenWorkoutView)initWithCoder:(id)a3;
- (_TtC7Journal21FullScreenWorkoutView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenWorkoutView

- (_TtC7Journal21FullScreenWorkoutView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7Journal21FullScreenWorkoutView_workoutActivityView;
  type metadata accessor for WorkoutActivityGridView();
  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Journal21FullScreenWorkoutView_workoutAsset) = 0;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for FullScreenWorkoutView();
  return -[FullScreenWorkoutView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal21FullScreenWorkoutView)initWithCoder:(id)a3
{
  return (_TtC7Journal21FullScreenWorkoutView *)sub_10030A2FC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21FullScreenWorkoutView_workoutActivityView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal21FullScreenWorkoutView_workoutAsset);
}

@end