@interface SharingPuzzleTypeTextActivityItemSource
- (_TtC8NewsFeed39SharingPuzzleTypeTextActivityItemSource)init;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation SharingPuzzleTypeTextActivityItemSource

- (_TtC8NewsFeed39SharingPuzzleTypeTextActivityItemSource)init
{
  result = (_TtC8NewsFeed39SharingPuzzleTypeTextActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s8NewsFeed39SharingPuzzleTypeTextActivityItemSourceC22activityViewController_010subjectForgE0SSSo010UIActivitykL0C_So0oE0aSgtF_0();

  v6 = (void *)sub_1C1520CCC();
  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  SharingPuzzleTypeTextActivityItemSource.activityViewController(_:itemForActivityType:)(a4, (uint64_t)v17);

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

    self = (_TtC8NewsFeed39SharingPuzzleTypeTextActivityItemSource *)a4;
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
  id v7 = a4;
  id v8 = self;
  _s8NewsFeed39SharingPuzzleTypeTextActivityItemSourceC22activityViewController_010subjectForgE0SSSo010UIActivitykL0C_So0oE0aSgtF_0();

  id v9 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return v9;
}

@end