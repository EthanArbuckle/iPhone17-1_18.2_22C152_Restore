@interface CyclingSensorsStore
- (_TtC11WorkoutCore19CyclingSensorsStore)init;
@end

@implementation CyclingSensorsStore

- (_TtC11WorkoutCore19CyclingSensorsStore)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11WorkoutCore19CyclingSensorsStore_centralManagerDelegate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11WorkoutCore19CyclingSensorsStore_centralManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CyclingSensorsStore();
  return [(CyclingSensorsStore *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WorkoutCore19CyclingSensorsStore_centralManagerDelegate));
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11WorkoutCore19CyclingSensorsStore_centralManager);
}

@end