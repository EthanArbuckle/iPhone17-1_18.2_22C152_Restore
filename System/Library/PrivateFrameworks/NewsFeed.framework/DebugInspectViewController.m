@interface DebugInspectViewController
- (_TtC8NewsFeed26DebugInspectViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed26DebugInspectViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDismiss;
- (void)doTapToRadar;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugInspectViewController

- (_TtC8NewsFeed26DebugInspectViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tableView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_searchController;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1BF8]), sel_initWithSearchResultsController_, 0);

  result = (_TtC8NewsFeed26DebugInspectViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed26DebugInspectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed26DebugInspectViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_cloudContext));
  swift_unknownObjectRelease();
  sub_1C0DD9BFC((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_key, (uint64_t (*)(void))type metadata accessor for DebugGroupLayoutKey);
  sub_1C0DD9BFC((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_result, (uint64_t (*)(void))type metadata accessor for DebugInspectViewResult);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_factory);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_1C066A0EC((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_inventory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tableView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_headlineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tagService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_webEmbedDataSourceService);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_searchController);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0DCD66C();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(DebugInspectViewController *)&v15 viewWillLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tableView];
  id v4 = objc_msgSend(v2, sel_view, v15.receiver, v15.super_class);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
    id v14 = sub_1C0DCDD1C();
    objc_msgSend(v3, sel_setTableHeaderView_, v14);
  }
  else
  {
    __break(1u);
  }
}

- (void)doDismiss
{
  uint64_t v5 = self;
  v2 = (_TtC8NewsFeed26DebugInspectViewController *)[(DebugInspectViewController *)v5 presentingViewController];
  if (v2)
  {
    v3 = v2;
    [(DebugInspectViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (void)doTapToRadar
{
  v2 = self;
  sub_1C0DCE128();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  int64_t result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v5 + 16) > (unint64_t)a4)
  {
    return *(void *)(*(void *)(*(void *)v5 + 48 * a4 + 64) + 16);
  }
  __break(1u);
  return result;
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
  double v12 = sub_1C0DCFAA0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  id result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(*(void *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (*(void *)(*(void *)v5 + 48 * a4 + 40))
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  id result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(*(void *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (*(void *)(*(void *)v5 + 48 * a4 + 56))
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
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
  sub_1C0DD3928(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1C0DD66B4(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1C0DD7738);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1C0DD66B4(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1C0DD807C);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C0DD6E3C(v4);
}

@end