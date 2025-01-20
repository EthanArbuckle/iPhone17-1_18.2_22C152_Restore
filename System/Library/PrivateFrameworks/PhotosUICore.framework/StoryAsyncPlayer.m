@interface StoryAsyncPlayer
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
@end

@implementation StoryAsyncPlayer

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  sub_1A9CD7A64();
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = sub_1A9D5E1DC;
  v14[7] = v12;
  id v15 = a3;
  swift_retain_n();
  id v16 = v15;
  sub_1AB22F8DC();
  sub_1A9BF49C0((uint64_t)v10, (uint64_t)&unk_1E9823D10, (uint64_t)v14);

  swift_release();
  swift_release();
  swift_release();
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
}

@end