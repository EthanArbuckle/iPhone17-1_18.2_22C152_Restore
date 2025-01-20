@interface SearchForTimersIntentHandlerSingle
- (_TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle)init;
- (void)confirmSearchTimer:(id)a3 completion:(id)a4;
- (void)handleSearchTimer:(id)a3 completion:(id)a4;
- (void)resolveAllAvailableTargetsForSearchTimer:(SearchTimerIntent *)a3 withCompletion:(id)a4;
- (void)resolveAssociatedDeviceTargetForSearchTimer:(SearchTimerIntent *)a3 withCompletion:(id)a4;
@end

@implementation SearchForTimersIntentHandlerSingle

- (_TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle)init
{
  v7[3] = type metadata accessor for SiriTimerManagerImpl();
  v7[4] = &protocol witness table for SiriTimerManagerImpl;
  v7[0] = swift_allocObject();
  v2 = (objc_class *)type metadata accessor for SearchForTimersIntentHandlerSingle();
  id v3 = objc_allocWithZone(v2);
  sub_25DCAB3F4((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle_siriTimerManager);
  v6.receiver = v3;
  v6.super_class = v2;
  swift_retain();
  v4 = [(SearchForTimersIntentHandlerSingle *)&v6 init];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)confirmSearchTimer:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (**)(void *, id))_Block_copy(a4);
  id v7 = objc_allocWithZone((Class)type metadata accessor for SearchTimerIntentResponse());
  id v8 = a3;
  v9 = self;
  v10 = (char *)objc_msgSend(v7, sel_init);
  v11 = &v10[OBJC_IVAR___SearchTimerIntentResponse_code];
  swift_beginAccess();
  *(void *)v11 = 4;
  objc_msgSend(v10, sel_setUserActivity_, 0);
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)resolveAssociatedDeviceTargetForSearchTimer:(SearchTimerIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C0EA8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A6C0EB0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_25DD12874((uint64_t)v10, (uint64_t)&unk_26A6C0EB8, (uint64_t)v15);
  swift_release();
}

- (void)resolveAllAvailableTargetsForSearchTimer:(SearchTimerIntent *)a3 withCompletion:(id)a4
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
  v14[4] = &unk_26A6C0E88;
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

- (void)handleSearchTimer:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_25DCBE4B4(v8, (uint64_t)sub_25DCBEFDC, v7);

  swift_release();
}

- (void).cxx_destruct
{
}

@end