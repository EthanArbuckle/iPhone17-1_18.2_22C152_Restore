@interface MultiHomeCustomizeViewController
- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)tableView:canEditRowAtIndexPath:;
- (void)requestDismiss;
- (void)selectContinue;
- (void)switchDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation MultiHomeCustomizeViewController

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100020548();
}

- (void)requestDismiss
{
  v2 = self;
  sub_100013D0C(1);
}

- (void)selectContinue
{
  v2 = self;
  sub_100020840();
}

- (void)switchDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100020B98((uint64_t)v4);
}

- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC21MediaSetupViewService32MultiHomeCustomizeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = &self->OBTableWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_log];
  uint64_t v4 = sub_100029870();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  id v5 = *(void **)&self->OBTableWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_heightConstraint];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (uint64_t)tableView:canEditRowAtIndexPath:
{
  uint64_t v0 = sub_100029840();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100029820();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100029840();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100029820();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_100021524(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(void *)&self->OBTableWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService32MultiHomeCustomizeViewController_viewModel];
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_100029D00();

  swift_bridgeObjectRelease();
  return v9;
}

@end