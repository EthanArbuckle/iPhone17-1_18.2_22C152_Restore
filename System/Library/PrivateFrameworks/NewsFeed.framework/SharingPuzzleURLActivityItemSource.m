@interface SharingPuzzleURLActivityItemSource
- (_TtC8NewsFeed34SharingPuzzleURLActivityItemSource)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation SharingPuzzleURLActivityItemSource

- (_TtC8NewsFeed34SharingPuzzleURLActivityItemSource)init
{
  result = (_TtC8NewsFeed34SharingPuzzleURLActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C002F608((uint64_t)self + OBJC_IVAR____TtC8NewsFeed34SharingPuzzleURLActivityItemSource_puzzleURL);
  swift_release();
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  SharingPuzzleURLActivityItemSource.activityViewControllerPlaceholderItem(_:)((uint64_t)v8);

  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v6 = (void *)sub_1C1520A7C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  SharingPuzzleURLActivityItemSource.activityViewController(_:itemForActivityType:)((uint64_t)a4, (uint64_t)v17);

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

- (id)activityViewControllerLinkMetadata:(id)a3
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8NewsFeed34SharingPuzzleURLActivityItemSource_linkPresentationSource))
  {
    id v4 = a3;
    v5 = self;
    sub_1C1518CEC();
    id v6 = objc_msgSend(v8, sel_linkMetadata);

    swift_unknownObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

@end