@interface AdminEntriesVC
- (_TtC7Journal14AdminEntriesVC)initWithCoder:(id)a3;
- (_TtC7Journal14AdminEntriesVC)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal14AdminEntriesVC)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addItem;
- (void)batchCreate;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(int64_t)a5 forChangeType:(unint64_t)a6;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)dealloc;
- (void)deleteAllCoreData;
- (void)deleteAllMarkAsRemoved;
- (void)showActionSheet;
- (void)syncEngineSyncEndWithNotification:(id)a3;
- (void)syncEngineSyncStartWithNotification:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AdminEntriesVC

- (void)viewDidLoad
{
  v2 = self;
  sub_100275A5C();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AdminEntriesVC();
  [(AdminEntriesVC *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14AdminEntriesVC_activityIndicator);
}

- (void)showActionSheet
{
  v2 = self;
  sub_100275F58();
}

- (void)addItem
{
  v2 = self;
  sub_1002792F0();
}

- (void)deleteAllMarkAsRemoved
{
}

- (void)deleteAllCoreData
{
}

- (void)batchCreate
{
}

- (_TtC7Journal14AdminEntriesVC)initWithStyle:(int64_t)a3
{
  return (_TtC7Journal14AdminEntriesVC *)sub_10027B10C(a3);
}

- (_TtC7Journal14AdminEntriesVC)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC7Journal14AdminEntriesVC *)sub_10027B238(v5, v7, a4);
}

- (_TtC7Journal14AdminEntriesVC)initWithCoder:(id)a3
{
  return (_TtC7Journal14AdminEntriesVC *)sub_10027B3E4(a3);
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
  v12 = (void *)sub_100281AE4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = *(void **)(*(char **)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14AdminEntriesVC_model)
                + OBJC_IVAR____TtCC7Journal10Journaling18EntryListViewModel_fetchedResultsController);
  if (!v3) {
    return 0;
  }
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = [v3 sections];
  if (v7)
  {
    sub_100010218(&qword_1007F9BD0);
    unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      id v7 = (id)_CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      id v7 = *(id *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);

      swift_bridgeObjectRelease();
    }
  }
  else
  {
  }
  return (int64_t)v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100281C70(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  int64_t v8 = sub_100281DD4(a4);

  return v8;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  NSString v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_100281F1C();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_100282924();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100282AF0();
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(int64_t)a5 forChangeType:(unint64_t)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_100282BC4(a5, a6);

  swift_unknownObjectRelease();
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12 = sub_100010218((uint64_t *)&unk_1007FD5D0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = &v26[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  v17 = &v26[-v16];
  id v18 = a3;
  swift_unknownObjectRetain();
  v19 = self;
  id v20 = a5;
  id v21 = a7;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v20)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  if (v21)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v24 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v14, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v14, 1, 1, v25);
  }
  sub_100282E28((uint64_t)v26, (uint64_t)v17, a6, (uint64_t)v14);

  sub_10001457C((uint64_t)v14, (uint64_t *)&unk_1007FD5D0);
  sub_10001457C((uint64_t)v17, (uint64_t *)&unk_1007FD5D0);
  _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v26);
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  uint64_t v7 = self;
  id v5 = [(AdminEntriesVC *)v7 tableView];
  if (v5)
  {
    uint64_t v6 = v5;
    [v5 endUpdates];

    sub_10027AAB4();
  }
  else
  {
    __break(1u);
  }
}

- (void)syncEngineSyncStartWithNotification:(id)a3
{
}

- (void)syncEngineSyncEndWithNotification:(id)a3
{
}

@end