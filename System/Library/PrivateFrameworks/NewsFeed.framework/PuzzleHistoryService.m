@interface PuzzleHistoryService
- (_TtC8NewsFeed20PuzzleHistoryService)init;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
- (void)puzzleHistory:(id)a3 didAddPuzzleItems:(id)a4 modifiedPuzzleItems:(id)a5 removedPuzzleItems:(id)a6;
@end

@implementation PuzzleHistoryService

- (_TtC8NewsFeed20PuzzleHistoryService)init
{
  result = (_TtC8NewsFeed20PuzzleHistoryService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed20PuzzleHistoryService_puzzleService);
  swift_bridgeObjectRelease();
}

- (void)puzzleHistory:(id)a3 didAddPuzzleItems:(id)a4 modifiedPuzzleItems:(id)a5 removedPuzzleItems:(id)a6
{
  sub_1BFC39268(0, (unint64_t *)&unk_1EA1ACC88);
  unint64_t v8 = sub_1C151EBCC();
  unint64_t v9 = sub_1C151EBCC();
  unint64_t v10 = sub_1C151EBCC();
  id v11 = a3;
  v12 = self;
  sub_1C11D497C(v8, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  id v7 = objc_msgSend(a4, sel_puzzlesConfig);
  objc_msgSend(*(id *)((char *)&v6->super.isa + OBJC_IVAR____TtC8NewsFeed20PuzzleHistoryService_puzzleHistory), sel_setAllowLowerProgressOnCompletedPuzzles_, objc_msgSend(v7, sel_allowLowerProgressOnCompletedPuzzles));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end