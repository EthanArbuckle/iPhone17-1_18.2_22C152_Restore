@interface UpdateAlarmIntentHandler
- (_TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler)init;
- (void)confirmUpdateAlarm:(id)a3 completion:(id)a4;
- (void)handleUpdateAlarm:(id)a3 completion:(id)a4;
- (void)resolveAlarmForUpdateAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveProposedLabelForUpdateAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveProposedMeridiemSetByUserForUpdateAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveProposedTimeForUpdateAlarm:(id)a3 withCompletion:(id)a4;
@end

@implementation UpdateAlarmIntentHandler

- (_TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler *)UpdateAlarmIntentHandler.init()();
}

- (void)resolveAlarmForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveProposedLabelForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveProposedTimeForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveProposedMeridiemSetByUserForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmUpdateAlarm:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v7 = objc_allocWithZone((Class)type metadata accessor for UpdateAlarmIntentResponse());
  id v8 = a3;
  v9 = self;
  v10 = (char *)objc_msgSend(v7, sel_init);
  v11 = &v10[OBJC_IVAR___UpdateAlarmIntentResponse_code];
  swift_beginAccess();
  *(void *)v11 = 1;
  objc_msgSend(v10, sel_setUserActivity_, 0);
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)handleUpdateAlarm:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler_siriAlarmManager);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler_osLogObject);
}

@end