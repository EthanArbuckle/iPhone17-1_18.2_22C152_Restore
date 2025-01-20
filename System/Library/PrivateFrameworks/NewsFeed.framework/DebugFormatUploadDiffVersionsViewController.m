@interface DebugFormatUploadDiffVersionsViewController
- (_TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDismiss;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatUploadDiffVersionsViewController

- (_TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController_tableView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0C1BC90();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatUploadDiffVersionsViewController *)&v14 viewWillLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController_tableView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)doDismiss
{
}

- (_TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController_tableView));
  sub_1BFEC001C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController_selectedRemoteVersion);
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed43DebugFormatUploadDiffVersionsViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  int64_t v8 = sub_1C0C1E4CC(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  double v11 = self;
  double v12 = (void *)sub_1C0C1C378((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_1C0C1E5CC(a4);
  if (v4)
  {
    uint64_t v5 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1C0C1E6F0(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    id v10 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

@end