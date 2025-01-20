@interface LemonadeBookmarksManager
- (void)preferencesDidChange;
@end

@implementation LemonadeBookmarksManager

- (void)preferencesDidChange
{
  Class isa = self->super.isa;
  sub_1A9BF7650(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8, v4);
  v6 = (char *)&v12 - v5;
  uint64_t v7 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  sub_1AB23AD0C();
  sub_1AB22F8DC();
  sub_1AB22F8DC();
  uint64_t v9 = sub_1AB23ACFC();
  v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4FBCFD8];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v8;
  v10[5] = isa;
  swift_release();
  sub_1A9BF49C0((uint64_t)v6, (uint64_t)&unk_1E982DF00, (uint64_t)v10);
  swift_release();
  swift_release();
}

@end