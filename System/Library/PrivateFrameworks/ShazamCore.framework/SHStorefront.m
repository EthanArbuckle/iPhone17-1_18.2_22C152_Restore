@interface SHStorefront
- (SHStorefront)init;
- (void)storefrontCountryCode:(id)a3;
@end

@implementation SHStorefront

- (void)storefrontCountryCode:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26815D978);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_226DA1640();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26815D988;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26815D998;
  v12[5] = v11;
  v13 = self;
  sub_226DA0C38((uint64_t)v7, (uint64_t)&unk_26815D9A8, (uint64_t)v12);
  swift_release();
}

- (SHStorefront)init
{
  v3.receiver = self;
  v3.super_class = (Class)SHStorefront;
  return [(SHStorefront *)&v3 init];
}

@end