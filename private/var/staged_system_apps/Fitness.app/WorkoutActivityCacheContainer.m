@interface WorkoutActivityCacheContainer
- (_TtC10FitnessApp29WorkoutActivityCacheContainer)init;
@end

@implementation WorkoutActivityCacheContainer

- (_TtC10FitnessApp29WorkoutActivityCacheContainer)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp29WorkoutActivityCacheContainer_totalDistance) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WorkoutActivityCacheContainer();
  return [(WorkoutActivityCacheContainer *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp29WorkoutActivityCacheContainer_totalDistance));
}

@end