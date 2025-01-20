@interface VoiceRefreshViewModel
- (void)timerFired;
@end

@implementation VoiceRefreshViewModel

- (void)timerFired
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A1E30);
  MEMORY[0x270FA5388](v3 - 8, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F53DAE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_25F53DAB8();
  swift_retain_n();
  uint64_t v8 = sub_25F53DAA8();
  v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = self;
  sub_25F43AEA4((uint64_t)v6, (uint64_t)&unk_26A7A3638, (uint64_t)v9);
  swift_release();
  swift_release();
}

@end