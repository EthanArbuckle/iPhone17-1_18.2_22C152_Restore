@interface BKBookMessagesDebugViewController
- (BKBookMessagesDebugViewController)init;
- (BKBookMessagesDebugViewController)initWithCoder:(id)a3;
- (BKBookMessagesDebugViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKBookMessagesDebugViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation BKBookMessagesDebugViewController

- (BKBookMessagesDebugViewController)init
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_manager) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKBookMessagesDebugViewController_propertyConfiguration) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_configurations) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_properties) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BookMessagesDebugViewController();
  return [(BKBookMessagesDebugViewController *)&v3 initWithStyle:2];
}

- (BKBookMessagesDebugViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKBookMessagesDebugViewController_manager) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKBookMessagesDebugViewController_propertyConfiguration) = 0;
  id v4 = a3;

  result = (BKBookMessagesDebugViewController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  BookMessagesDebugViewController.viewDidLoad()();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = _s5Books31BookMessagesDebugViewControllerC05tableE0_21numberOfRowsInSectionSiSo07UITableE0C_SitF_0();

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  _s5Books31BookMessagesDebugViewControllerC05tableE0_23titleForHeaderInSectionSSSgSo07UITableE0C_SitF_0();
  uint64_t v8 = v7;

  if (v8)
  {
    NSString v9 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSString v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)BookMessagesDebugViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSString v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  BookMessagesDebugViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BKBookMessagesDebugViewController)initWithStyle:(int64_t)a3
{
  result = (BKBookMessagesDebugViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BKBookMessagesDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BKBookMessagesDebugViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end