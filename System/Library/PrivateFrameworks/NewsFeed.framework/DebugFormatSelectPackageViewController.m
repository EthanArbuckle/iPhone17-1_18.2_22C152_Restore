@interface DebugFormatSelectPackageViewController
- (_TtC8NewsFeed38DebugFormatSelectPackageViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed38DebugFormatSelectPackageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDismissView;
- (void)doNext;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatSelectPackageViewController

- (_TtC8NewsFeed38DebugFormatSelectPackageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C09816A0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C097F6E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(DebugFormatSelectPackageViewController *)&v7 viewWillAppear:v3];
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
  [(DebugFormatSelectPackageViewController *)&v14 viewWillLayoutSubviews];
  BOOL v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_tableView];
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
  }
  else
  {
    __break(1u);
  }
}

- (void)doDismissView
{
}

- (void)doNext
{
  v2 = self;
  sub_1C098005C();
}

- (_TtC8NewsFeed38DebugFormatSelectPackageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed38DebugFormatSelectPackageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_editorURL;
  uint64_t v4 = sub_1C1515FDC();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C0981C0C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *((unsigned char *)&self->super._tabElement+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_tableView));
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController____lazy_storage___nextBarButtonItem);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_templates))[2];
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
  double v12 = (void *)sub_1C09804E0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = (void *)sub_1C151E5EC();
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_1C09817F8();

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
  sub_1C0981AE0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end