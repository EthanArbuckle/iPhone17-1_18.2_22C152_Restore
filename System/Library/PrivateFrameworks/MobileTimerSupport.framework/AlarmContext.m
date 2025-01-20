@interface AlarmContext
- (NSString)description;
- (_TtC18MobileTimerSupport12AlarmContext)init;
- (_TtC18MobileTimerSupport12AlarmContext)initWithTitle:(id)a3 alarmId:(id)a4 hour:(unint64_t)a5 min:(unint64_t)a6 isSnoozed:(BOOL)a7 isFiring:(BOOL)a8;
@end

@implementation AlarmContext

- (_TtC18MobileTimerSupport12AlarmContext)initWithTitle:(id)a3 alarmId:(id)a4 hour:(unint64_t)a5 min:(unint64_t)a6 isSnoozed:(BOOL)a7 isFiring:(BOOL)a8
{
  uint64_t v12 = sub_1BE3233C0();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1BE3233C0();
  return (_TtC18MobileTimerSupport12AlarmContext *)AlarmContext.init(title:alarmId:hour:min:isSnoozed:isFiring:)(v12, v14, v15, v16, a5, a6, a7, a8);
}

- (NSString)description
{
  return (NSString *)sub_1BE296904(self, (uint64_t)a2, (void (*)(void))sub_1BE296974);
}

- (_TtC18MobileTimerSupport12AlarmContext)init
{
  result = (_TtC18MobileTimerSupport12AlarmContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end