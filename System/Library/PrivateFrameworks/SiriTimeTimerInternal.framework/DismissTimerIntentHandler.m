@interface DismissTimerIntentHandler
- (_TtC21SiriTimeTimerInternal25DismissTimerIntentHandler)init;
- (void)confirmDismissTimer:(id)a3 completion:(id)a4;
- (void)handleDismissTimer:(DismissTimerIntent *)a3 completion:(id)a4;
@end

@implementation DismissTimerIntentHandler

- (void)confirmDismissTimer:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25DCD8C0C(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)handleDismissTimer:(DismissTimerIntent *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C0E78);
  MEMORY[0x270FA5388](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_25DD204C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A6C1508;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A6C0E90;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_25DD12874((uint64_t)v10, (uint64_t)&unk_26A6C0E98, (uint64_t)v15);
  swift_release();
}

- (_TtC21SiriTimeTimerInternal25DismissTimerIntentHandler)init
{
  result = (_TtC21SiriTimeTimerInternal25DismissTimerIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end