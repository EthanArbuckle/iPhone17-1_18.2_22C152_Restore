@interface InsightsAdminVC
- (_TtC7Journal15InsightsAdminVC)initWithCoder:(id)a3;
- (_TtC7Journal15InsightsAdminVC)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal15InsightsAdminVC)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)refreshData;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation InsightsAdminVC

- (void)viewDidLoad
{
  v2 = self;
  sub_10019248C();
}

- (void)refreshData
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_100800CC0, (uint64_t)v9);
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal15InsightsAdminVC_data))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1001953B8(a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_1001953F0(a4);
  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_100195454(v8);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_100195604();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC7Journal15InsightsAdminVC)initWithStyle:(int64_t)a3
{
  uint64_t v4 = OBJC_IVAR____TtC7Journal15InsightsAdminVC_context;
  uint64_t v5 = qword_1007F6D38;
  uint64_t v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = *(objc_class **)(*(void *)(qword_10083D2F8 + 16) + OBJC_IVAR____TtC7Journal13CoreDataStack_contextMain);
  *(Class *)((char *)&v6->super.super.super.super.isa + v4) = v7;
  *(Class *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR____TtC7Journal15InsightsAdminVC_data) = (Class)_swiftEmptyArrayStorage;
  uint64_t v8 = v7;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for InsightsAdminVC();
  return [(InsightsAdminVC *)&v10 initWithStyle:a3];
}

- (_TtC7Journal15InsightsAdminVC)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal15InsightsAdminVC *)sub_100194F18(v5, v7, a4);
}

- (_TtC7Journal15InsightsAdminVC)initWithCoder:(id)a3
{
  return (_TtC7Journal15InsightsAdminVC *)sub_100195090(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end