@interface WorkoutGradientView
+ (Class)layerClass;
- (_TtC10FitnessApp19WorkoutGradientView)initWithCoder:(id)a3;
- (_TtC10FitnessApp19WorkoutGradientView)initWithFrame:(CGRect)a3;
@end

@implementation WorkoutGradientView

+ (Class)layerClass
{
  sub_10007E2D8(0, &qword_10095F1B8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC10FitnessApp19WorkoutGradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WorkoutGradientView();
  return -[WorkoutGradientView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC10FitnessApp19WorkoutGradientView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutGradientView();
  return [(WorkoutGradientView *)&v5 initWithCoder:a3];
}

@end