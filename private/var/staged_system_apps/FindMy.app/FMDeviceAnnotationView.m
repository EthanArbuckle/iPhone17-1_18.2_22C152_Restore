@interface FMDeviceAnnotationView
- (_TtC6FindMy22FMDeviceAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC6FindMy22FMDeviceAnnotationView)initWithCoder:(id)a3;
@end

@implementation FMDeviceAnnotationView

- (_TtC6FindMy22FMDeviceAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_unknownObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain();
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMDeviceAnnotationView();
  v7 = [(FMMapAnnotationView *)&v9 initWithAnnotation:a3 reuseIdentifier:v6];

  swift_unknownObjectRelease();
  return v7;
}

- (_TtC6FindMy22FMDeviceAnnotationView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMDeviceAnnotationView();
  return [(FMMapAnnotationView *)&v5 initWithCoder:a3];
}

@end