@interface DebugFormatErrorViewController
- (_TtC8NewsFeed30DebugFormatErrorViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed30DebugFormatErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatErrorViewController

- (_TtC8NewsFeed30DebugFormatErrorViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_tableView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_styler;
  type metadata accessor for DebugFormatStyler();
  v9 = (objc_class *)swift_allocObject();
  *((void *)v9 + 2) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v8) = v9;

  result = (_TtC8NewsFeed30DebugFormatErrorViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C11E1B08();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatErrorViewController *)&v14 viewWillLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_tableView];
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

- (_TtC8NewsFeed30DebugFormatErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed30DebugFormatErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_tableView));
  swift_release();
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(void *)(*(void *)((char *)&self->super.super._responderFlags
                               + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel)
                   + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel + 8);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 24 * a4 + 48) + 16);
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
  double v12 = (void *)sub_1C11E1F20();

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
  if (*(void *)(*(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel + 8)
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

@end