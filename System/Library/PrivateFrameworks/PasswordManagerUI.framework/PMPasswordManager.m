@interface PMPasswordManager
- (void)accountStoreDidChange;
@end

@implementation PMPasswordManager

- (void)accountStoreDidChange
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0A9790);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_258D6F798();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_258D6F768();
  swift_retain_n();
  uint64_t v7 = sub_258D6F758();
  v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = self;
  sub_258B2C8E0((uint64_t)v5, (uint64_t)&unk_26A0B26B8, (uint64_t)v8);
  swift_release();
  swift_release();
}

@end