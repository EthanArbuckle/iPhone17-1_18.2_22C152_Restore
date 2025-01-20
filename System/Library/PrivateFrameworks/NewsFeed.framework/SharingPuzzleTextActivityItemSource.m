@interface SharingPuzzleTextActivityItemSource
- (_TtC8NewsFeed35SharingPuzzleTextActivityItemSource)init;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation SharingPuzzleTextActivityItemSource

- (_TtC8NewsFeed35SharingPuzzleTextActivityItemSource)init
{
  result = (_TtC8NewsFeed35SharingPuzzleTextActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1C04B3A80(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData), *(void *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData], *(void *)&self->shareData[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData], *(void *)&self->shareData[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData + 8]);
  sub_1C0D10FF8((uint64_t)self + OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_puzzleRankProvider, &qword_1EB891A10, (unint64_t *)&unk_1EB884AB0, (uint64_t)&protocol descriptor for PuzzleRankProviderType);
  sub_1C0D10FF8((uint64_t)self + OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_puzzleDifficultyDescriptionProvider, &qword_1EB893CD0, &qword_1EB893B50, (uint64_t)&protocol descriptor for PuzzleDifficultyDescriptionProviderType);
  swift_bridgeObjectRelease();
  sub_1BFEF2F40(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithTimeText), *(void *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithTimeText]);
  sub_1BFEF2F40(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithRankText), *(void *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithRankText]);
  sub_1BFEF2F40(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedPuzzleTypeText), *(void *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedPuzzleTypeText]);
  sub_1BFEF2F40(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithTimeText), *(void *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithTimeText]);
  sub_1BFEF2F40(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedDifficultyText), *(void *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedDifficultyText]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithRank);
  uint64_t v4 = *(void *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithRank];
  sub_1BFEF2F40(v3, v4);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0D11068();

  v6 = (void *)sub_1C1520CCC();
  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  SharingPuzzleTextActivityItemSource.activityViewController(_:itemForActivityType:)(a4, (uint64_t)v17);

  uint64_t v9 = v18;
  if (v18)
  {
    v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    __n128 v12 = MEMORY[0x1F4188790](v10);
    v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
    v15 = (void *)sub_1C1520A7C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if (!a4)
  {
    id v11 = a3;
    __n128 v12 = self;
    goto LABEL_9;
  }
  if (sub_1C151E62C() == 0xD000000000000026 && v7 == 0x80000001C160BC20)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = self;
    swift_bridgeObjectRelease();
LABEL_7:

    self = (_TtC8NewsFeed35SharingPuzzleTextActivityItemSource *)a4;
    goto LABEL_9;
  }
  char v13 = sub_1C1520A9C();
  id v14 = a4;
  id v15 = a3;
  v16 = self;
  swift_bridgeObjectRelease();
  if (v13) {
    goto LABEL_7;
  }

LABEL_9:
  v17 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = a4;
  sub_1C0D11A38(&OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedPuzzleTypeText, sub_1C0D1162C);
  if (!v9) {
    sub_1C0D11068();
  }

  v10 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return v10;
}

@end