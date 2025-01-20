@interface DebugIncomingWeatherAlertViewController
- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithCoder:(id)a3;
- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DebugIncomingWeatherAlertViewController

- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10072AC9C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10072AD44();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_10072AF1C((uint64_t)self, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_10072AF7C((uint64_t)self, a4);
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10072B004();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
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
  id v12 = sub_10072B23C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  double v12 = sub_10072B42C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithStyle:(int64_t)a3
{
}

- (_TtC7Weather39DebugIncomingWeatherAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_10072BEF4();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC7Weather39DebugIncomingWeatherAlertViewController_alert;
  uint64_t v4 = type metadata accessor for WeatherAlertEntity();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Weather39DebugIncomingWeatherAlertViewController____lazy_storage___dateFormatter));
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Weather39DebugIncomingWeatherAlertViewController_mapView);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  id v8 = sub_1003FBF14((uint64_t)v7, (uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

@end