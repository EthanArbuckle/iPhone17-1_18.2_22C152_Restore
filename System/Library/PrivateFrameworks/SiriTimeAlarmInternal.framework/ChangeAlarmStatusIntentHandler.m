@interface ChangeAlarmStatusIntentHandler
- (_TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler)init;
- (void)confirmChangeAlarmStatus:(id)a3 completion:(id)a4;
- (void)handleChangeAlarmStatus:(id)a3 completion:(id)a4;
- (void)resolveAlarmsForChangeAlarmStatus:(id)a3 withCompletion:(id)a4;
- (void)resolveHandleSilentlyForChangeAlarmStatus:(id)a3 withCompletion:(id)a4;
@end

@implementation ChangeAlarmStatusIntentHandler

- (_TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler *)ChangeAlarmStatusIntentHandler.init()();
}

- (void)resolveAlarmsForChangeAlarmStatus:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveHandleSilentlyForChangeAlarmStatus:(id)a3 withCompletion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v7 = a3;
  v12 = self;
  id v8 = objc_msgSend(v7, sel_handleSilently);
  if (v8)
  {
    v9 = v8;
    id v10 = objc_msgSend(v8, sel_BOOLValue);
  }
  else
  {
    id v10 = 0;
  }
  id v11 = objc_msgSend(self, sel_successWithResolvedValue_, v10);
  v6[2](v6, v11);

  _Block_release(v6);
}

- (void)confirmChangeAlarmStatus:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, id))_Block_copy(a4);
  id v7 = objc_allocWithZone((Class)type metadata accessor for ChangeAlarmStatusIntentResponse());
  id v8 = a3;
  v9 = self;
  id v10 = (char *)objc_msgSend(v7, sel_init);
  id v11 = &v10[OBJC_IVAR___ChangeAlarmStatusIntentResponse_code];
  swift_beginAccess();
  *(void *)id v11 = 4;
  objc_msgSend(v10, sel_setUserActivity_, 0);
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)handleChangeAlarmStatus:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler_siriAlarmManager);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler_osLogObject);
}

@end