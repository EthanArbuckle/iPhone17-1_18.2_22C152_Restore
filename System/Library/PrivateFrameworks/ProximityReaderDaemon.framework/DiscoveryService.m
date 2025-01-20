@interface DiscoveryService
- (_TtC21ProximityReaderDaemon16DiscoveryService)init;
- (void)cancelRequestWithCompletionHandler:(id)a3;
- (void)contentListWithCompletionHandler:(id)a3;
- (void)contentWithTopic:(NSString *)a3 subtopic:(NSString *)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)layoutBundleWithContentId:(NSString *)a3 completionHandler:(id)a4;
- (void)sendAnalyticsWithAnalyticsData:(id)a3;
@end

@implementation DiscoveryService

- (void)dealloc
{
  v2 = self;
  sub_25AB1F004();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC21ProximityReaderDaemon16DiscoveryService)init
{
  result = (_TtC21ProximityReaderDaemon16DiscoveryService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)contentWithTopic:(NSString *)a3 subtopic:(NSString *)a4 completionHandler:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4A0070);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_25AC35140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A49FF10;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A49FF18;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_25AB2446C((uint64_t)v10, (uint64_t)&unk_26A49FF20, (uint64_t)v15);
  swift_release();
}

- (void)contentListWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4A0070);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_25AC35140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_26A49FEE8;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A49FEF0;
  v11[5] = v10;
  v12 = self;
  sub_25AB2446C((uint64_t)v6, (uint64_t)&unk_26A49FEF8, (uint64_t)v11);
  swift_release();
}

- (void)layoutBundleWithContentId:(NSString *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4A0070);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_25AC35140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A49FE88;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A49FE90;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_25AB2446C((uint64_t)v8, (uint64_t)&unk_26A49FE98, (uint64_t)v13);
  swift_release();
}

- (void)cancelRequestWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4A0070);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_25AC35140();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_26A49FE40;
  v10[5] = v8;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A49FE50;
  v11[5] = v10;
  v12 = self;
  sub_25AB2446C((uint64_t)v6, (uint64_t)&unk_26A49FE60, (uint64_t)v11);
  swift_release();
}

- (void)sendAnalyticsWithAnalyticsData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = sub_25AC323A0();
  unint64_t v7 = v6;

  sub_25AB231D8();
  sub_25AB16958(v5, v7);
}

@end