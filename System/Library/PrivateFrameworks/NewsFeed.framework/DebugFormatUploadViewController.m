@interface DebugFormatUploadViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (_TtC8NewsFeed31DebugFormatUploadViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatUploadViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDismiss;
- (void)doNext;
- (void)doTocWithSender:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatUploadViewController

- (_TtC8NewsFeed31DebugFormatUploadViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C09EC12C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C09E5FC4();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(DebugFormatUploadViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setToolbarHidden_animated_, 0, 0);

    id v4 = v6;
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C09E7894();
}

- (_TtC8NewsFeed31DebugFormatUploadViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatUploadViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_diffViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController____lazy_storage___nextBarButtonItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)doDismiss
{
}

- (void)doNext
{
  v2 = self;
  sub_1C09E7D20();
}

- (void)doTocWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C09E7F24((uint64_t)v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_filteredSections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_filteredSections);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 32 * a4 + 56) + 16);
    }
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1C09E8B80();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = sub_1C09E99FC((uint64_t)v6, a4);

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_filteredSections);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  if (*(void *)(v4 + 32 * a4 + 48))
  {
    swift_bridgeObjectRetain();
    id v5 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1C151677C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1C09ECF70(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C0062994(0, &qword_1EB8711A8, MEMORY[0x1E4F27DE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8);
  id v12 = (char *)&v18 - v11;
  sub_1C151672C();
  id v13 = a3;
  uint64_t v14 = self;
  sub_1C09EA094((uint64_t)v9, (uint64_t)v12);

  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
  {
    v16 = (void *)sub_1C151670C();
    v15(v12, v6);
  }
  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_1C09ED164();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C09EA920(v4);
}

@end