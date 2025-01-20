@interface DebugFormatLayoutViewController
- (_TtC8NewsFeed31DebugFormatLayoutViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatLayoutViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapOnOverlay:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatLayoutViewController

- (_TtC8NewsFeed31DebugFormatLayoutViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0CD044C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0CCB91C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1C0CD0ABC(0, &qword_1EB8711A8, MEMORY[0x1E4F27DE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v14 - v7;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = self;
  [(DebugFormatLayoutViewController *)&v14 viewWillAppear:v3];
  id v10 = objc_msgSend(*(id *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tableView), sel_indexPathForSelectedRow);
  if (v10)
  {
    v11 = v10;
    sub_1C151672C();

    uint64_t v12 = sub_1C151677C();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1C151677C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  sub_1C151F1FC();
  sub_1C0CD0888((uint64_t)v8, &qword_1EB8711A8, MEMORY[0x1E4F27DE8]);
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatLayoutViewController *)&v14 viewWillLayoutSubviews];
  BOOL v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tableView];
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

- (void)didTapOnOverlay:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0CCD5D4(v4);
}

- (_TtC8NewsFeed31DebugFormatLayoutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatLayoutViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tableView));
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController____lazy_storage___heatmapToolbar));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tree);
  swift_beginAccess();
  return *(void *)(*(void *)(v3 + 16) + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tree);
  int64_t result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = *(void *)(v5 + 16);
    if (*(void *)(v7 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v7 + 24 * a4 + 48) + 16);
    }
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
  id v10 = a3;
  double v11 = self;
  double v12 = (void *)sub_1C0CCE4D0((uint64_t)v10, (uint64_t)v9);

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
  sub_1C0CD0558();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tree);
  id result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)(v5 + 16) + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return v7;
}

@end