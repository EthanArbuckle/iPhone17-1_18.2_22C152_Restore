@interface WOWorkoutNotification
- (WOWorkoutNotification)init;
- (WOWorkoutNotification)initWithNotification:(id)a3;
- (_TtC11WorkoutCore19WorkoutNotification)bridgedNotification;
@end

@implementation WOWorkoutNotification

- (_TtC11WorkoutCore19WorkoutNotification)bridgedNotification
{
  return (_TtC11WorkoutCore19WorkoutNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR___WOWorkoutNotification_bridgedNotification));
}

- (WOWorkoutNotification)initWithNotification:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOWorkoutNotification_bridgedNotification) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for WorkoutNotificationBridge();
  id v4 = a3;
  return [(WOWorkoutNotification *)&v6 init];
}

- (WOWorkoutNotification)init
{
  result = (WOWorkoutNotification *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end