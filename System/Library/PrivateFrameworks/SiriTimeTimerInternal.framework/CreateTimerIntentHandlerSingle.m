@interface CreateTimerIntentHandlerSingle
- (_TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle)init;
- (void)confirmCreateTimer:(id)a3 completion:(id)a4;
- (void)handleCreateTimer:(id)a3 completion:(id)a4;
- (void)resolveAllAvailableTargetsForCreateTimer:(CreateTimerIntent *)a3 withCompletion:(id)a4;
- (void)resolveAssociatedDeviceTargetForCreateTimer:(CreateTimerIntent *)a3 withCompletion:(id)a4;
- (void)resolveDurationNumberForCreateTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveTypeForCreateTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation CreateTimerIntentHandlerSingle

- (_TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle)init
{
  v7[3] = type metadata accessor for SiriTimerManagerImpl();
  v7[4] = &protocol witness table for SiriTimerManagerImpl;
  v7[0] = swift_allocObject();
  TimerIntentHandlerSingle = (objc_class *)type metadata accessor for CreateTimerIntentHandlerSingle();
  id v3 = objc_allocWithZone(TimerIntentHandlerSingle);
  sub_25DCAB3F4((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle_siriTimerManager);
  v6.receiver = v3;
  v6.super_class = TimerIntentHandlerSingle;
  swift_retain();
  v4 = [(CreateTimerIntentHandlerSingle *)&v6 init];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)handleCreateTimer:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25DCED774(v7, (uint64_t)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)resolveDurationNumberForCreateTimer:(id)a3 withCompletion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25DCEDD88(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4
{
  objc_super v6 = (void (**)(void *, id))_Block_copy(a4);
  sub_25DCAE0D8(0, &qword_26A6C1888);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v8 = a3;
  v10 = self;
  id v9 = objc_msgSend(ObjCClassFromMetadata, sel_notRequired);
  v6[2](v6, v9);

  _Block_release(v6);
}

- (void)resolveTypeForCreateTimer:(id)a3 withCompletion:(id)a4
{
  objc_super v6 = (void (**)(void *, id))_Block_copy(a4);
  type metadata accessor for SiriTimerTypeResolutionResult();
  id v7 = a3;
  id v9 = self;
  id v8 = sub_25DCAC598((uint64_t)objc_msgSend(v7, sel_type));
  v6[2](v6, v8);

  _Block_release(v6);
}

- (void)resolveAssociatedDeviceTargetForCreateTimer:(CreateTimerIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C1870;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A6C1878;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_25DD12874((uint64_t)v10, (uint64_t)&unk_26A6C1880, (uint64_t)v15);
  swift_release();
}

- (void)resolveAllAvailableTargetsForCreateTimer:(CreateTimerIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C1860;
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

- (void)confirmCreateTimer:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_25DCEDF5C((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void).cxx_destruct
{
}

@end