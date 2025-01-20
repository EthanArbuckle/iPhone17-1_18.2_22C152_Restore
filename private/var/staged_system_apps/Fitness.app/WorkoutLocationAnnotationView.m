@interface WorkoutLocationAnnotationView
- (_TtC10FitnessApp29WorkoutLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC10FitnessApp29WorkoutLocationAnnotationView)initWithCoder:(id)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation WorkoutLocationAnnotationView

- (_TtC10FitnessApp29WorkoutLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = swift_unknownObjectRetain();
  return (_TtC10FitnessApp29WorkoutLocationAnnotationView *)sub_1001F8040(v7, v4, v6);
}

- (_TtC10FitnessApp29WorkoutLocationAnnotationView)initWithCoder:(id)a3
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = self;
  sub_1001F82D8(x, y, width, height);
}

@end