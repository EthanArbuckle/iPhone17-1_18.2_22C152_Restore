@interface SeymourNotificationResponseCoordinator
- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)init;
- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)initWithFitnessAppContext:(id)a3;
- (void)handleNotificationResponse:(id)a3 completion:(id)a4;
@end

@implementation SeymourNotificationResponseCoordinator

- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)initWithFitnessAppContext:(id)a3
{
  return (_TtC10FitnessApp38SeymourNotificationResponseCoordinator *)sub_10001CF58((char *)a3);
}

- (void)handleNotificationResponse:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1005AB0A4(v7, v8, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)init
{
  result = (_TtC10FitnessApp38SeymourNotificationResponseCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end