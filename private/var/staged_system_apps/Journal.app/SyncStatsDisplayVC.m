@interface SyncStatsDisplayVC
- (_TtC7Journal18SyncStatsDisplayVC)initWithCoder:(id)a3;
- (_TtC7Journal18SyncStatsDisplayVC)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal18SyncStatsDisplayVC)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation SyncStatsDisplayVC

- (void)viewDidLoad
{
  v2 = self;
  sub_100266540();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18SyncStatsDisplayVC_dataObjects))[2];
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
  v12 = (void *)sub_10026AA68();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1002667C8(v10);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC7Journal18SyncStatsDisplayVC)initWithStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal18SyncStatsDisplayVC_dataObjects) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SyncStatsDisplayVC();
  return [(SyncStatsDisplayVC *)&v5 initWithStyle:a3];
}

- (_TtC7Journal18SyncStatsDisplayVC)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal18SyncStatsDisplayVC_dataObjects) = (Class)_swiftEmptyArrayStorage;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal18SyncStatsDisplayVC_dataObjects) = (Class)_swiftEmptyArrayStorage;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SyncStatsDisplayVC();
  v9 = [(SyncStatsDisplayVC *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal18SyncStatsDisplayVC)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal18SyncStatsDisplayVC_dataObjects) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SyncStatsDisplayVC();
  return [(SyncStatsDisplayVC *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end