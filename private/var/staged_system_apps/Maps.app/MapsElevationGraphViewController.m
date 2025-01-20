@interface MapsElevationGraphViewController
+ (id)makeHostingControllerFor:(id)a3 width:(double)a4 isMetric:(BOOL)a5 traitCollection:(id)a6 shouldHighlight:(BOOL)a7 chartStyle:(id)a8 currentPosition:(id)a9;
- (_TtC4Maps32MapsElevationGraphViewController)initWithCoder:(id)a3;
- (_TtC4Maps32MapsElevationGraphViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation MapsElevationGraphViewController

+ (id)makeHostingControllerFor:(id)a3 width:(double)a4 isMetric:(BOOL)a5 traitCollection:(id)a6 shouldHighlight:(BOOL)a7 chartStyle:(id)a8 currentPosition:(id)a9
{
  uint64_t v15 = sub_1000FF33C(&qword_1015D16E8);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100100830(0, (unint64_t *)&qword_1015D19E8);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v19 = a3;
  id v20 = a6;
  v21 = (char *)a8;
  v22 = (void *)sub_10031E0F8(a3, a5, (uint64_t)v20, a7, v21, (uint64_t)v18, a4);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);

  return v22;
}

- (_TtC4Maps32MapsElevationGraphViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MapsElevationGraphViewController();
  v9 = [(MapsElevationGraphViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC4Maps32MapsElevationGraphViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsElevationGraphViewController();
  return [(MapsElevationGraphViewController *)&v5 initWithCoder:a3];
}

@end