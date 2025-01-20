@interface LocalPresetLocationsViewController
- (_TtC7Weather34LocalPresetLocationsViewController)initWithCoder:(id)a3;
- (_TtC7Weather34LocalPresetLocationsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather34LocalPresetLocationsViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation LocalPresetLocationsViewController

- (_TtC7Weather34LocalPresetLocationsViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10031724C();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1003173A8((uint64_t)self, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_1003174F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_100317428);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_1003174F0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t))sub_100317468);
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
  id v12 = sub_10031754C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100317730();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC7Weather34LocalPresetLocationsViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather34LocalPresetLocationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1003181E0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1003188A0((uint64_t)self + OBJC_IVAR____TtC7Weather34LocalPresetLocationsViewController_appState, (void (*)(void))type metadata accessor for PresetAppState);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end