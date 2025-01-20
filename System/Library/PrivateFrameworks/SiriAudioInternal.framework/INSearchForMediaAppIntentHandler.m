@interface INSearchForMediaAppIntentHandler
- (_TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler)init;
- (void)handleSearchForMedia:(INSearchForMediaIntent *)a3 completion:(id)a4;
- (void)resolveMediaItemsForSearchForMedia:(INSearchForMediaIntent *)a3 withCompletion:(id)a4;
@end

@implementation INSearchForMediaAppIntentHandler

- (void)resolveMediaItemsForSearchForMedia:(INSearchForMediaIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C520);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2355BCE60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26880C570;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26880C578;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235589DC8((uint64_t)v9, (uint64_t)&unk_26880C580, (uint64_t)v14);
  swift_release();
}

- (void)handleSearchForMedia:(INSearchForMediaIntent *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C520);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2355BCE60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26880C530;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26880C540;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_235589DC8((uint64_t)v9, (uint64_t)&unk_26880C550, (uint64_t)v14);
  swift_release();
}

- (_TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler)init
{
  result = (_TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider);
  v3 = (char *)self + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
}

@end