@interface DebugFormatGroupViewController
- (_TtC8NewsFeed30DebugFormatGroupViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed30DebugFormatGroupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatGroupViewController

- (_TtC8NewsFeed30DebugFormatGroupViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_contentSizeObserver) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_tableView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed30DebugFormatGroupViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_1C0C415FC();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_contentSizeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_tableView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0C4172C();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatGroupViewController *)&v14 viewWillLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_tableView];
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

- (_TtC8NewsFeed30DebugFormatGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed30DebugFormatGroupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_sections);
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
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  double v11 = self;
  double v12 = sub_1C0C41FA4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v4 = self;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_sections);
  if (*(void *)(v5 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  uint64_t v6 = v5 + 32 * a4;
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(v6 + 40);
  char v9 = *(unsigned char *)(v6 + 48);
  id v10 = a3;
  id v11 = v4;
  sub_1C0C44A40(v7, v8, v9);
  sub_1C1227BB4(v7, v8, v9);
  uint64_t v13 = v12;
  sub_1C0C44A58(v7, v8, v9);

  if (v13)
  {
    uint64_t v14 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  char v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  id v11 = self;
  sub_1C0C437F8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end