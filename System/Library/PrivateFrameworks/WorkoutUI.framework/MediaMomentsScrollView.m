@interface MediaMomentsScrollView
- (_TtC9WorkoutUI22MediaMomentsScrollView)initWithCoder:(id)a3;
- (_TtC9WorkoutUI22MediaMomentsScrollView)initWithFrame:(CGRect)a3;
@end

@implementation MediaMomentsScrollView

- (_TtC9WorkoutUI22MediaMomentsScrollView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MediaMomentsScrollView();
  return -[MediaMomentsScrollView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9WorkoutUI22MediaMomentsScrollView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MediaMomentsScrollView();
  return [(MediaMomentsScrollView *)&v5 initWithCoder:a3];
}

@end