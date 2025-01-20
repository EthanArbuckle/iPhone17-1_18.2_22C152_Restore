@interface PhotoLibraryService
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)computeCacheDidLoad:(id)a3;
- (void)curatedAssetsFromAssetUUIDs:(NSArray *)a3 options:(NSDictionary *)a4 operationID:(NSString *)a5 reply:(id)a6;
- (void)extendedCuratedAssetsFromAssetUUIDs:(NSArray *)a3 options:(NSDictionary *)a4 operationID:(NSString *)a5 reply:(id)a6;
- (void)keyAssetFromAssetUUIDs:(NSArray *)a3 inAllAssets:(NSArray *)a4 operationID:(NSString *)a5 reply:(id)a6;
- (void)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(NSSet *)a3 candidateAssetUUIDs:(NSSet *)a4 operationID:(NSString *)a5 reply:(id)a6;
- (void)requestPersonalizedSensingRefreshWithReply:(id)a3;
- (void)updateKeyAssetOfSocialGroupsWithUUIDs:(NSSet *)a3 operationID:(NSString *)a4 reply:(id)a5;
@end

@implementation PhotoLibraryService

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
  sub_1D21F6270((uint64_t)v8, (uint64_t)&unk_1EA681BC8, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateKeyAssetOfSocialGroupsWithUUIDs:(NSSet *)a3 operationID:(NSString *)a4 reply:(id)a5
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
  v15[4] = &unk_1EA681BB0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA681BB8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1D2319190((uint64_t)v11, (uint64_t)&unk_1EA681BC0, (uint64_t)v16);
  swift_release();
}

- (void)keyAssetUUIDOfSocialGroupWithPersonUUIDs:(NSSet *)a3 candidateAssetUUIDs:(NSSet *)a4 operationID:(NSString *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EA681B90;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA681B98;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_1D2319190((uint64_t)v13, (uint64_t)&unk_1EA681BA0, (uint64_t)v18);
  swift_release();
}

- (void)keyAssetFromAssetUUIDs:(NSArray *)a3 inAllAssets:(NSArray *)a4 operationID:(NSString *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EA681B58;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA681B60;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_1D2319190((uint64_t)v13, (uint64_t)&unk_1EA681B68, (uint64_t)v18);
  swift_release();
}

- (void)curatedAssetsFromAssetUUIDs:(NSArray *)a3 options:(NSDictionary *)a4 operationID:(NSString *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EA681B38;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA681B40;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_1D2319190((uint64_t)v13, (uint64_t)&unk_1EA681B48, (uint64_t)v18);
  swift_release();
}

- (void)extendedCuratedAssetsFromAssetUUIDs:(NSArray *)a3 options:(NSDictionary *)a4 operationID:(NSString *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EA681B18;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EA681B20;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_1D2319190((uint64_t)v13, (uint64_t)&unk_1EA681B28, (uint64_t)v18);
  swift_release();
}

- (void)computeCacheDidLoad:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA681AF8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA681B00;
  v12[5] = v11;
  swift_retain();
  sub_1D2319190((uint64_t)v7, (uint64_t)&unk_1EA681B08, (uint64_t)v12);
  swift_release();
}

- (void)requestPersonalizedSensingRefreshWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA681AE0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA681AE8;
  v12[5] = v11;
  swift_retain();
  sub_1D2319190((uint64_t)v7, (uint64_t)&unk_1EA6837C0, (uint64_t)v12);
  swift_release();
}

@end