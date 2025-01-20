@interface DebugFormatDeviceViewController
- (_TtC8NewsFeed31DebugFormatDeviceViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDismiss;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatDeviceViewController

- (_TtC8NewsFeed31DebugFormatDeviceViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed31DebugFormatDeviceViewController_tableView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed31DebugFormatDeviceViewController_filteredDevices) = (Class)MEMORY[0x1E4FBC860];

  result = (_TtC8NewsFeed31DebugFormatDeviceViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C138DE18();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatDeviceViewController *)&v14 viewWillLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed31DebugFormatDeviceViewController_tableView];
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

- (_TtC8NewsFeed31DebugFormatDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatDeviceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDeviceViewController_tableView));
  swift_release();
  swift_bridgeObjectRelease();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatDeviceViewController_filteredDevices))[2];
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
  double v12 = (void *)sub_1C138E964();

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
  sub_1C138EC94(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end