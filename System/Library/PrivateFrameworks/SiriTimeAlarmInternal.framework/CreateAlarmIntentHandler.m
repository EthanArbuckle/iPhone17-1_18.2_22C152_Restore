@interface CreateAlarmIntentHandler
- (_TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler)init;
- (void)confirmCreateAlarm:(id)a3 completion:(id)a4;
- (void)handleCreateAlarm:(id)a3 completion:(id)a4;
- (void)resolveTimeForCreateAlarm:(id)a3 withCompletion:(id)a4;
@end

@implementation CreateAlarmIntentHandler

- (void)resolveTimeForCreateAlarm:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmCreateAlarm:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler_siriAlarmManager);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler_osLogObject);
}

- (void)handleCreateAlarm:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25DC79B98(v7, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler *)CreateAlarmIntentHandler.init()();
}

@end