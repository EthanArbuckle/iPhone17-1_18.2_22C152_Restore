@interface GenerativeStoryCreationViewModel
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
@end

@implementation GenerativeStoryCreationViewModel

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  sub_1A9B7F204(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8, v6);
  v8 = (char *)&v13 - v7;
  swift_unknownObjectRetain();
  sub_1AB22F8DC();
  v9 = (void *)sub_1AB23A72C();
  id v10 = objc_msgSend(a3, sel_beginCollectionOperationWithName_timeout_, v9, 100.0);

  uint64_t v11 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = v10;
  swift_unknownObjectRetain();
  sub_1AB22F8DC();
  sub_1A9BF49C0((uint64_t)v8, (uint64_t)&unk_1E9836508, (uint64_t)v12);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

@end