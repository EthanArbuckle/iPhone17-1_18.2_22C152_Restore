@interface DebugFormatInspectorPaneViewController
- (_TtC8NewsFeed38DebugFormatInspectorPaneViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed38DebugFormatInspectorPaneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatInspectorPaneViewController

- (_TtC8NewsFeed38DebugFormatInspectorPaneViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0CFD354();
}

- (void)dealloc
{
  v2 = self;
  sub_1C0CF115C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_image));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_contentSizeObserver);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0CF1298();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DebugFormatInspectorPaneViewController();
  v2 = (char *)v14.receiver;
  [(DebugFormatInspectorPaneViewController *)&v14 viewWillLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_tableView];
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

- (_TtC8NewsFeed38DebugFormatInspectorPaneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed38DebugFormatInspectorPaneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_filteredGroups))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_filteredGroups);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 40 * a4 + 64) + 16);
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
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  double v10 = (char *)a3;
  double v11 = self;
  double v12 = sub_1C0CF1DC8(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)((char *)self
                             + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_filteredGroups)
                 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorPaneViewController_filteredGroups);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  if (*(void *)(v4 + 40 * a4 + 56))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  double v11 = self;
  double v12 = sub_1C0CFD450();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
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
  sub_1C0CF9B4C(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1C151677C();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  double v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1C0CFD8D8(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  double v11 = self;
  id v12 = (void *)sub_1C0CFDE30();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end