@interface SnoozeAlarmIntentHandler
- (_TtC21SiriTimeAlarmInternal24SnoozeAlarmIntentHandler)init;
- (void)confirmSnoozeAlarmHal:(id)a3 completion:(id)a4;
- (void)handleSnoozeAlarmHal:(SnoozeAlarmHalIntent *)a3 completion:(id)a4;
@end

@implementation SnoozeAlarmIntentHandler

- (_TtC21SiriTimeAlarmInternal24SnoozeAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24SnoozeAlarmIntentHandler *)SnoozeAlarmIntentHandler.init()();
}

- (void)confirmSnoozeAlarmHal:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25DC66094(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleSnoozeAlarmHal:(SnoozeAlarmHalIntent *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6BBEE0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25DC96020();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A6BBEF0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A6BBEF8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_25DC7CB84((uint64_t)v9, (uint64_t)&unk_26A6BBF00, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24SnoozeAlarmIntentHandler_siriAlarmManager);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21SiriTimeAlarmInternal24SnoozeAlarmIntentHandler_osLogObject);
}

@end