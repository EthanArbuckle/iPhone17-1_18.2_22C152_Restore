@interface DebugFormatCreatePackageViewController
- (_TtC8NewsFeed38DebugFormatCreatePackageViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed38DebugFormatCreatePackageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doCreatePackage;
- (void)doDismissView;
- (void)doEndEditing;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatCreatePackageViewController

- (_TtC8NewsFeed38DebugFormatCreatePackageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0A74D0C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0A71154();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatCreatePackageViewController *)&v14 viewWillLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_tableView];
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

- (void)doDismissView
{
}

- (void)doEndEditing
{
  id v4 = self;
  id v2 = [(DebugFormatCreatePackageViewController *)v4 view];
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_endEditing_, 1);

    sub_1C0A717B0();
  }
  else
  {
    __break(1u);
  }
}

- (void)doCreatePackage
{
  id v2 = self;
  sub_1C0A71A90();
}

- (_TtC8NewsFeed38DebugFormatCreatePackageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed38DebugFormatCreatePackageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_editorURL;
  uint64_t v4 = sub_1C1515FDC();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  sub_1C0648314(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *((unsigned char *)&self->super._tabElement+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_tableView));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController____lazy_storage___createBarButtonItem);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(self + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections);
    if (*(void *)(v4 + 16) > (unint64_t)a4) {
      return *(void *)(*(void *)(v4 + 104 * a4 + 128) + 16);
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
  double v12 = (void *)sub_1C0A730A4();

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
  if (*(void *)(*(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections)
                 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  swift_bridgeObjectRetain();
  sub_1C151E80C();
  sub_1C151E80C();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1C151E5EC();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)((char *)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections)
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C151677C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C151672C();
  id v10 = a3;
  double v11 = self;
  sub_1C0A73D98(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end