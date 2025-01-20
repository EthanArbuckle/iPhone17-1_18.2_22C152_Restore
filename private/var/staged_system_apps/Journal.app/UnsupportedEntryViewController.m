@interface UnsupportedEntryViewController
- (_TtC7Journal30UnsupportedEntryViewController)initWithCoder:(id)a3;
- (_TtC7Journal30UnsupportedEntryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleCloseButton;
- (void)viewDidLoad;
@end

@implementation UnsupportedEntryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1005620F4();
}

- (void)handleCloseButton
{
}

- (_TtC7Journal30UnsupportedEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for UnsupportedEntryViewController();
  v9 = [(UnsupportedEntryViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal30UnsupportedEntryViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UnsupportedEntryViewController();
  return [(UnsupportedEntryViewController *)&v5 initWithCoder:a3];
}

@end