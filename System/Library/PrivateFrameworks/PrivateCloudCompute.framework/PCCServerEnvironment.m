@interface PCCServerEnvironment
- (PCCServerEnvironment)init;
- (void)selectedEnvironmentNameWithCompletionHandler:(id)a3;
@end

@implementation PCCServerEnvironment

- (PCCServerEnvironment)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCCServerEnvironment;
  return [(PCCServerEnvironment *)&v3 init];
}

- (void)selectedEnvironmentNameWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B329CF8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25A6C7630();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A44C3F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A44C408;
  v12[5] = v11;
  v13 = self;
  sub_25A69383C((uint64_t)v7, (uint64_t)&unk_26A44C418, (uint64_t)v12);
  swift_release();
}

@end