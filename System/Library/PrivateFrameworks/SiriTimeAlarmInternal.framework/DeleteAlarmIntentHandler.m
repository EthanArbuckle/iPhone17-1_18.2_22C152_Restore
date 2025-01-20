@interface DeleteAlarmIntentHandler
- (_TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler)init;
- (void)confirmDeleteAlarm:(id)a3 completion:(id)a4;
- (void)handleDeleteAlarm:(id)a3 completion:(id)a4;
- (void)resolveAlarmsForDeleteAlarm:(id)a3 withCompletion:(id)a4;
@end

@implementation DeleteAlarmIntentHandler

- (_TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler *)DeleteAlarmIntentHandler.init()();
}

- (void)resolveAlarmsForDeleteAlarm:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmDeleteAlarm:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25DC87790(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleDeleteAlarm:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler_siriAlarmManager);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler_osLogObject);
}

@end