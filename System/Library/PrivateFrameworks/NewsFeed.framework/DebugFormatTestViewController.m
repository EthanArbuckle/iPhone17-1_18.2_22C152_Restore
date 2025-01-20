@interface DebugFormatTestViewController
- (_TtC8NewsFeed29DebugFormatTestViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed29DebugFormatTestViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)runTests;
- (void)showTOCWithSender:(id)a3;
- (void)stopTests;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatTestViewController

- (_TtC8NewsFeed29DebugFormatTestViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1282E2C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C127E354();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(DebugFormatTestViewController *)&v7 viewWillAppear:v3];
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
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatTestViewController *)&v14 viewWillLayoutSubviews];
  BOOL v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_tableView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_toolbarLabel], sel_sizeToFit);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DebugFormatTestViewController *)&v3 viewDidLayoutSubviews];
  sub_1C151AB5C();
}

- (_TtC8NewsFeed29DebugFormatTestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed29DebugFormatTestViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_packages, sizeof(v3));
  sub_1C09C51F8((uint64_t)v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_tableView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_toolbarLabel));
}

- (void)stopTests
{
  id v2 = self;
  sub_1C127F7DC();
}

- (void)runTests
{
  id v2 = self;
  sub_1C127F18C();
}

- (void)showTOCWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C127FBA4((uint64_t)v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_9:
    __break(1u);
    return self;
  }
  uint64_t v5 = v4 + 40 * a4;
  uint64_t v6 = v5 + 32;
  int v7 = *(unsigned __int8 *)(v5 + 64) >> 6;
  if (!v7) {
    return *(void *)(*(void *)v6 + 16);
  }
  if (v7 == 1)
  {
    v6 += 16;
    return *(void *)(*(void *)v6 + 16);
  }
  return 1;
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
  double v12 = (void *)sub_1C12808B8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_12:
    __break(1u);
    return self;
  }
  int v5 = *(unsigned __int8 *)(v4 + 40 * a4 + 64) >> 6;
  if (v5)
  {
    if (v5 != 1)
    {
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    sub_1C0D3D080();
  }
  uint64_t v6 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
LABEL_8:
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v4 = self;
  uint64_t v5 = *(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections);
  if (*(void *)(v5 + 16) <= (unint64_t)a4)
  {
LABEL_11:
    __break(1u);
    return self;
  }
  uint64_t v6 = v5 + 40 * a4;
  unsigned __int8 v7 = *(unsigned char *)(v6 + 64);
  if ((v7 & 0xC0) != 0x40) {
    goto LABEL_6;
  }
  uint64_t v8 = (uint64_t *)(v6 + 32);
  uint64_t v10 = v8[2];
  uint64_t v9 = v8[3];
  uint64_t v12 = *v8;
  uint64_t v11 = v8[1];
  id v13 = a3;
  id v14 = v4;
  sub_1C1282C38(v12, v11, v10, v9, v7);
  sub_1C126CF14();
  uint64_t v16 = v15;
  sub_1C1282B38(v12, v11, v10, v9, v7);

  if (v16)
  {
    v17 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    v17 = 0;
  }
  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1C12818F4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end