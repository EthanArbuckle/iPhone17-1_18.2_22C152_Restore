@interface DebugFormatLogViewController
- (_TtC8NewsFeed28DebugFormatLogViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed28DebugFormatLogViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)scrollViewWillBeginDragging:(void *)a3;
- (void)doClearLog;
- (void)doNow;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatLogViewController

- (_TtC8NewsFeed28DebugFormatLogViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C110C730();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C1109A08();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatLogViewController *)&v14 viewWillLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_tableView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
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

- (void)doNow
{
  v2 = self;
  sub_1C110A920();
}

- (void)doClearLog
{
  uint64_t v2 = qword_1EA1943D0;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_retain();
  sub_1C151950C();

  swift_release();
}

- (_TtC8NewsFeed28DebugFormatLogViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed28DebugFormatLogViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_consolePaneDisplayController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController____lazy_storage___nowBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController____lazy_storage___clearLogBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_searchBar));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v6 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_entries);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  double v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_1C15204BC();

  swift_bridgeObjectRelease();
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
  double v12 = (void *)sub_1C110AC7C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  double v11 = self;
  sub_1C110B084(v10);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C110B2A4();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1C110B3A4((uint64_t)v6, a4);
}

- (uint64_t)scrollViewWillBeginDragging:(void *)a3
{
  id v4 = a3;
  id v5 = a1;
  swift_retain();
  sub_1C151895C();

  return swift_release();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  double v11 = self;
  sub_1C110B530(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = sub_1C151E62C();
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_1C110C8C8(v6, v8);

  swift_bridgeObjectRelease();
}

@end