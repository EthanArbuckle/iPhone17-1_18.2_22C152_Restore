@interface MiniPlayerViewController
- (_TtC5Music24MiniPlayerViewController)initWithCoder:(id)a3;
- (_TtC5Music24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation MiniPlayerViewController

- (_TtC5Music24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for MiniPlayerViewController();
  v9 = [(MiniPlayerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5Music24MiniPlayerViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MiniPlayerViewController();
  return [(MiniPlayerViewController *)&v5 initWithCoder:a3];
}

@end