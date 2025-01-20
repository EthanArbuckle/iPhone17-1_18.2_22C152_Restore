@interface BKLocalSignalStressTestViewController
- (BKLocalSignalStressTestViewController)init;
- (BKLocalSignalStressTestViewController)initWithCoder:(id)a3;
- (BKLocalSignalStressTestViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKLocalSignalStressTestViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)enableRandomAssetIDsCell:(id)a3;
- (void)fetchBookHistories:(id)a3;
- (void)generateFakeLocalSignals:(id)a3;
- (void)viewDidLoad;
@end

@implementation BKLocalSignalStressTestViewController

- (BKLocalSignalStressTestViewController)init
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_cellDatas) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_operationInProgress) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKLocalSignalStressTestViewController____lazy_storage___dateFormatter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocalSignalStressTestViewController();
  return [(BKLocalSignalStressTestViewController *)&v3 initWithStyle:2];
}

- (BKLocalSignalStressTestViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_cellDatas) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLocalSignalStressTestViewController_operationInProgress) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___BKLocalSignalStressTestViewController____lazy_storage___dateFormatter) = 0;
  id v4 = a3;

  result = (BKLocalSignalStressTestViewController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10057B4DC();
}

- (void)generateFakeLocalSignals:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v9 = self;
  }
  uint64_t v10 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1007FE100();
  v11 = self;
  uint64_t v12 = sub_1007FE0F0();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  sub_10004BC14((uint64_t)v7, (uint64_t)&unk_100B3B4C0, (uint64_t)v13);
  swift_release();

  sub_10005AFE8((uint64_t)v14, (uint64_t *)&unk_100B269C0);
}

- (void)fetchBookHistories:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1005823D0();

  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)enableRandomAssetIDsCell:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_100580C0C();

  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  NSString v4 = sub_1007FDC30();

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKLocalSignalStressTestViewController_cellDatas))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  id v12 = sub_100580F10(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BKLocalSignalStressTestViewController)initWithStyle:(int64_t)a3
{
  result = (BKLocalSignalStressTestViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BKLocalSignalStressTestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BKLocalSignalStressTestViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___BKLocalSignalStressTestViewController____lazy_storage___dateFormatter);
}

@end