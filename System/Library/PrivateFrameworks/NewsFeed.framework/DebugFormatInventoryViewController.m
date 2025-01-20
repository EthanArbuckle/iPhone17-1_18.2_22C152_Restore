@interface DebugFormatInventoryViewController
- (_TtC8NewsFeed34DebugFormatInventoryViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed34DebugFormatInventoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)tableView:(void *)a3 didDeselectRowAtIndexPath:;
- (void)doCompileUpload;
- (void)doCreatePackage;
- (void)doDismiss;
- (void)doShowVersioningModePicker:(id)a3;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatInventoryViewController

- (_TtC8NewsFeed34DebugFormatInventoryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0D263D8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0D1F818();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(DebugFormatInventoryViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setToolbarHidden_animated_, 0, 0);
  }
  sub_1C0D208D4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C0D212F8();
}

- (_TtC8NewsFeed34DebugFormatInventoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed34DebugFormatInventoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController_packages, sizeof(v3));
  sub_1C09C51F8((uint64_t)v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController____lazy_storage___uploadBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController____lazy_storage___versionBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController____lazy_storage___createPackageBarButtonItem));
  swift_release();
  swift_release();
}

- (void)doDismiss
{
}

- (void)doCompileUpload
{
  v2 = self;
  sub_1C0D21764();
}

- (void)doShowVersioningModePicker:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C0D21EFC((uint64_t)v4);
}

- (void)doCreatePackage
{
  v2 = self;
  sub_1C0D22064();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  int64_t v8 = sub_1C0D26570(a4);

  return v8;
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
  v12 = sub_1C0D223B0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (uint64_t)tableView:(void *)a3 didDeselectRowAtIndexPath:
{
  uint64_t v5 = sub_1C151677C();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v9 = a3;
  id v10 = a1;
  sub_1C0D267FC();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  sub_1C0D271E4(0, &qword_1EB8711A8, MEMORY[0x1E4F27DE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v14 - v8;
  if (a4)
  {
    sub_1C151672C();
    uint64_t v10 = sub_1C151677C();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1C151677C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_1C0D208D4();

  sub_1C0D2716C((uint64_t)v9, &qword_1EB8711A8, MEMORY[0x1E4F27DE8]);
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1C0D23DC8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1C0D26B18);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1C0D23DC8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1C0D26D20);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = sub_1C0D23EE8((uint64_t)v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 40.0;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C0D246BC(v4);
}

@end