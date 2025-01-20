@interface PerceptionModelImpl
- (void)performQuery:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation PerceptionModelImpl

- (void)performQuery:(int64_t)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8C3948);
  MEMORY[0x1F4188790]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_1D95D2738();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA8C3958;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA8C3968;
  v13[5] = v12;
  swift_retain();
  sub_1D95CEC5C((uint64_t)v8, (uint64_t)&unk_1EA8C3978, (uint64_t)v13);
  swift_release();
}

@end