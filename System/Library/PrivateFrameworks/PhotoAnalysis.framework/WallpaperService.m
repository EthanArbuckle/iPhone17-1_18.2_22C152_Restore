@interface WallpaperService
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)upgradePosterConfigurationWithAssetDirectory:(NSURL *)a3 options:(NSDictionary *)a4 reply:(id)a5;
@end

@implementation WallpaperService

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_1D2425570();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1D2218734;
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = v10;
  v14[6] = sub_1D221873C;
  v14[7] = v12;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1D21F6270((uint64_t)v8, (uint64_t)&unk_1EA682E70, (uint64_t)v14);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)upgradePosterConfigurationWithAssetDirectory:(NSURL *)a3 options:(NSDictionary *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA682E68;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA681AE8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA6837C0, (uint64_t)v16);
  swift_release();
}

@end