@interface GenerativeStoryVisualDiagnosticsProvider
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
@end

@implementation GenerativeStoryVisualDiagnosticsProvider

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  Class isa = self->super.isa;
  sub_1A9AF39CC(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8, v9);
  v11 = (char *)&v18 - v10;
  v12 = _Block_copy(a4);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = sub_1A9D5E1DC;
  v15[7] = v13;
  v15[8] = isa;
  id v16 = a3;
  swift_retain_n();
  id v17 = v16;
  sub_1AB22F8DC();
  sub_1A9BF49C0((uint64_t)v11, (uint64_t)&unk_1E9825350, (uint64_t)v15);
  swift_release();
  swift_release();
  swift_release();
}

@end