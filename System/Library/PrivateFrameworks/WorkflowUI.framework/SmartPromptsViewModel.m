@interface SmartPromptsViewModel
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
@end

@implementation SmartPromptsViewModel

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  sub_22D9A6F3C(0, &qword_268593108);
  sub_22DA5A7B4(&qword_268594C70, &qword_268593108);
  uint64_t v7 = sub_22DC92CF8();
  uint64_t v8 = sub_22DC92CF8();
  uint64_t v9 = sub_22DC92CF8();
  id v10 = a3;
  uint64_t v11 = swift_retain();
  sub_22DA53BFC(v11, v7, v8, v9);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end