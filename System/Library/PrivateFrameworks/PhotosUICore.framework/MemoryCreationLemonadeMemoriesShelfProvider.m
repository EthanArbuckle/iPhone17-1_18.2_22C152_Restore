@interface MemoryCreationLemonadeMemoriesShelfProvider
- (void)preferencesDidChange;
@end

@implementation MemoryCreationLemonadeMemoriesShelfProvider

- (void)preferencesDidChange
{
  sub_1A9B7F364(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v2 - 8, v3);
  v5 = (char *)&v11 - v4;
  uint64_t v6 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  sub_1AB23AD0C();
  sub_1AB22F8DC();
  sub_1AB22F8DC();
  uint64_t v8 = sub_1AB23ACFC();
  v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x1E4FBCFD8];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  swift_release();
  sub_1A9BF49C0((uint64_t)v5, (uint64_t)&unk_1E98399C8, (uint64_t)v9);
  swift_release();
  swift_release();
}

@end