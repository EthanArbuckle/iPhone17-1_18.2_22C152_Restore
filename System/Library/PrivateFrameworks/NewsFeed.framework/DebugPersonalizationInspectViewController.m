@interface DebugPersonalizationInspectViewController
- (_TtC8NewsFeed41DebugPersonalizationInspectViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed41DebugPersonalizationInspectViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:heightForRowAtIndexPath:;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDismiss;
- (void)doTapToRadar;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugPersonalizationInspectViewController

- (_TtC8NewsFeed41DebugPersonalizationInspectViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1428288();
}

- (_TtC8NewsFeed41DebugPersonalizationInspectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed41DebugPersonalizationInspectViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_cloudContext));
  swift_unknownObjectRelease();
  sub_1BFF1BAA8((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_key, (uint64_t (*)(void))type metadata accessor for DebugGroupLayoutKey);
  sub_1BFF1BAA8((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_bindings, (uint64_t (*)(void))type metadata accessor for GroupLayoutBindingContext);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_1C066A0EC((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_inventory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_submitView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_submitContainerView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_headlineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_tagService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_webEmbedDataSourceService);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_header));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_titleView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C1421E94();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C14227B0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1C1422900();
}

- (void)doDismiss
{
  v5 = self;
  v2 = (_TtC8NewsFeed41DebugPersonalizationInspectViewController *)[(DebugPersonalizationInspectViewController *)v5 presentingViewController];
  if (v2)
  {
    id v3 = v2;
    [(DebugPersonalizationInspectViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (void)doTapToRadar
{
  swift_getObjectType();
  id v3 = self;
  sub_1C151932C();
  sub_1BFC39268(0, (unint64_t *)&qword_1EB87A1B0);
  id v4 = (void *)sub_1C151F56C();
  sub_1C151901C();
  swift_release();

  v5 = (void *)sub_1C151F56C();
  sub_1C151904C();

  swift_release();
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewDataSource_sections;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewDataSource_sections;
  int64_t result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v5 + 16) > (unint64_t)a4)
  {
    return *(void *)(*(void *)(*(void *)v5 + (a4 << 6) + 64) + 16);
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  v11 = self;
  sub_1C1424E6C(v10, v9);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1C14274FC((uint64_t)v6, a4);

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v5 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewDataSource_sections;
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
  if (*(void *)(*(void *)v5 + (a4 << 6) + 88))
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

- (double)tableView:heightForRowAtIndexPath:
{
  uint64_t v0 = sub_1C151677C();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  double v4 = *MEMORY[0x1E4FB2F28];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

@end