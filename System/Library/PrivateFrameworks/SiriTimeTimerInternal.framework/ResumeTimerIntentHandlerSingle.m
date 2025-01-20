@interface ResumeTimerIntentHandlerSingle
- (_TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle)init;
- (void)confirmResumeTimer:(ResumeTimerIntent *)a3 completion:(id)a4;
- (void)handleResumeTimer:(id)a3 completion:(id)a4;
- (void)resolveAllAvailableTargetsForResumeTimer:(ResumeTimerIntent *)a3 withCompletion:(id)a4;
- (void)resolveAssociatedDeviceTargetForResumeTimer:(ResumeTimerIntent *)a3 withCompletion:(id)a4;
- (void)resolveTargetTimerForResumeTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation ResumeTimerIntentHandlerSingle

- (_TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle)init
{
  v7[3] = type metadata accessor for SiriTimerManagerImpl();
  v7[4] = &protocol witness table for SiriTimerManagerImpl;
  v7[0] = swift_allocObject();
  v2 = (objc_class *)type metadata accessor for ResumeTimerIntentHandlerSingle();
  id v3 = objc_allocWithZone(v2);
  sub_25DCAB3F4((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle_siriTimerManager);
  v6.receiver = v3;
  v6.super_class = v2;
  swift_retain();
  v4 = [(ResumeTimerIntentHandlerSingle *)&v6 init];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)confirmResumeTimer:(ResumeTimerIntent *)a3 completion:(id)a4
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
  v14[4] = &unk_26A6C1E28;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A6C0FA0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_25DD12874((uint64_t)v10, (uint64_t)&unk_26A6C0FA8, (uint64_t)v15);
  swift_release();
}

- (void)resolveTargetTimerForResumeTimer:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveAssociatedDeviceTargetForResumeTimer:(ResumeTimerIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C1E18;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A6C0F80;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_25DD12874((uint64_t)v10, (uint64_t)&unk_26A6C0F88, (uint64_t)v15);
  swift_release();
}

- (void)resolveAllAvailableTargetsForResumeTimer:(ResumeTimerIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C1E08;
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

- (void)handleResumeTimer:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end