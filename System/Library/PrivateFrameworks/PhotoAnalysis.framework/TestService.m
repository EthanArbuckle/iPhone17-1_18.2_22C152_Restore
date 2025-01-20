@interface TestService
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)performGetStringWithOperationID:(NSString *)a3 reply:(id)a4;
- (void)performLongOperationWithOperationID:(NSString *)a3 reply:(id)a4;
@end

@implementation TestService

- (void)performGetStringWithOperationID:(NSString *)a3 reply:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA683260;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA683268;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1D2319190((uint64_t)v9, (uint64_t)&unk_1EA683270, (uint64_t)v14);
  swift_release();
}

- (void)performLongOperationWithOperationID:(NSString *)a3 reply:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D2425660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA683230;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA681AE8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1D2319190((uint64_t)v9, (uint64_t)&unk_1EA6837C0, (uint64_t)v14);
  swift_release();
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD2D730);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  sub_1D21F6270((uint64_t)v8, (uint64_t)&unk_1EA683220, (uint64_t)v14);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end