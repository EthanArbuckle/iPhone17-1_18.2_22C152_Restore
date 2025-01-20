@interface DismissAlarmHalIntentHandler
- (_TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler)init;
- (void)confirmDismissAlarmHal:(id)a3 completion:(id)a4;
- (void)handleDismissAlarmHal:(DismissAlarmHalIntent *)a3 completion:(id)a4;
@end

@implementation DismissAlarmHalIntentHandler

- (void)confirmDismissAlarmHal:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25DC7D480(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleDismissAlarmHal:(DismissAlarmHalIntent *)a3 completion:(id)a4
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
  v13[4] = &unk_26A6BC348;
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

- (_TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler)init
{
  result = (_TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler_siriAlarmManager);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler_osLogObject);
}

@end