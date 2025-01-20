@interface FMTrackAnnotationView
- (_TtC6FindMy21FMTrackAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC6FindMy21FMTrackAnnotationView)initWithCoder:(id)a3;
- (void)prepareForDisplay;
@end

@implementation FMTrackAnnotationView

- (void)prepareForDisplay
{
  v2 = self;
  sub_100437728();
}

- (_TtC6FindMy21FMTrackAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for FMTrackAnnotationView();
  v7 = [(FMTrackAnnotationView *)&v9 initWithAnnotation:a3 reuseIdentifier:v6];

  swift_unknownObjectRelease();
  return v7;
}

- (_TtC6FindMy21FMTrackAnnotationView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMTrackAnnotationView();
  return [(FMTrackAnnotationView *)&v5 initWithCoder:a3];
}

@end