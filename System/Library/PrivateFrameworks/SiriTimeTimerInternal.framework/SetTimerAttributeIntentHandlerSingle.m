@interface SetTimerAttributeIntentHandlerSingle
- (_TtC21SiriTimeTimerInternal36SetTimerAttributeIntentHandlerSingle)init;
- (void)confirmSetTimerAttribute:(SetTimerAttributeIntent *)a3 completion:(id)a4;
- (void)handleSetTimerAttribute:(id)a3 completion:(id)a4;
- (void)resolveAllAvailableTargetsForSetTimerAttribute:(SetTimerAttributeIntent *)a3 withCompletion:(id)a4;
- (void)resolveAssociatedDeviceTargetForSetTimerAttribute:(SetTimerAttributeIntent *)a3 withCompletion:(id)a4;
- (void)resolveTargetTimerForSetTimerAttribute:(id)a3 withCompletion:(id)a4;
- (void)resolveToDurationForSetTimerAttribute:(id)a3 withCompletion:(id)a4;
@end

@implementation SetTimerAttributeIntentHandlerSingle

- (_TtC21SiriTimeTimerInternal36SetTimerAttributeIntentHandlerSingle)init
{
  v7[3] = type metadata accessor for SiriTimerManagerImpl();
  v7[4] = &protocol witness table for SiriTimerManagerImpl;
  v7[0] = swift_allocObject();
  v2 = (objc_class *)type metadata accessor for SetTimerAttributeIntentHandlerSingle();
  id v3 = objc_allocWithZone(v2);
  sub_25DCAB3F4((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC21SiriTimeTimerInternal36SetTimerAttributeIntentHandlerSingle_siriTimerManager);
  v6.receiver = v3;
  v6.super_class = v2;
  swift_retain();
  v4 = [(SetTimerAttributeIntentHandlerSingle *)&v6 init];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)confirmSetTimerAttribute:(SetTimerAttributeIntent *)a3 completion:(id)a4
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
  v14[4] = &unk_26A6C1F70;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A6C1F78;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_25DD12874((uint64_t)v10, (uint64_t)&unk_26A6C1F80, (uint64_t)v15);
  swift_release();
}

- (void)handleSetTimerAttribute:(id)a3 completion:(id)a4
{
}

- (void)resolveTargetTimerForSetTimerAttribute:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveToDurationForSetTimerAttribute:(id)a3 withCompletion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_25DD113F4(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)resolveAssociatedDeviceTargetForSetTimerAttribute:(SetTimerAttributeIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C1F50;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A6C1F58;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_25DD12874((uint64_t)v10, (uint64_t)&unk_26A6C1F60, (uint64_t)v15);
  swift_release();
}

- (void)resolveAllAvailableTargetsForSetTimerAttribute:(SetTimerAttributeIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C1F40;
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

- (void).cxx_destruct
{
}

@end