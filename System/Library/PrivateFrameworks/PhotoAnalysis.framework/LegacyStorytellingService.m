@interface LegacyStorytellingService
- (void)cancelOperationsWithIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)dumpAnalysisStatusWithContext:(id)a3 reply:(id)a4;
- (void)writeQALog:(id)a3;
@end

@implementation LegacyStorytellingService

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  v4 = _Block_copy(a4);
  v5 = (void (*)(void *, void))v4[2];
  swift_retain();
  v5(v4, 0);
  _Block_release(v4);

  swift_release();
}

- (void)dumpAnalysisStatusWithContext:(id)a3 reply:(id)a4
{
  v4 = (void (**)(void *, void, void *))_Block_copy(a4);
  sub_1D2271D28();
  v5 = (void *)swift_allocError();
  *(void *)uint64_t v6 = 0xD000000000000026;
  *(void *)(v6 + 8) = 0x80000001D243BAF0;
  *(void *)(v6 + 16) = 0xD00000000000004ALL;
  *(void *)(v6 + 24) = 0x80000001D243BB20;
  *(unsigned char *)(v6 + 32) = 3;
  swift_retain();
  v7 = (void *)sub_1D2423C10();
  v4[2](v4, 0, v7);

  _Block_release(v4);

  swift_release();
}

- (void)cancelOperationsWithIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  uint64_t v11 = sub_1D2425570();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1D2218734;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v11;
  v15[6] = sub_1D2366F6C;
  v15[7] = v13;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1D21F6270((uint64_t)v9, (uint64_t)&unk_1EA684088, (uint64_t)v15);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)writeQALog:(id)a3
{
  uint64_t v3 = sub_1D24253E0();
  unint64_t v5 = v4;
  swift_retain();
  sub_1D2366D6C(v3, v5);
  swift_release();

  swift_bridgeObjectRelease();
}

@end