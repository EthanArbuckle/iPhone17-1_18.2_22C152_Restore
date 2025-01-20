@interface SpotlightDebugVC
- (_TtC7Journal16SpotlightDebugVC)initWithCoder:(id)a3;
- (_TtC7Journal16SpotlightDebugVC)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal16SpotlightDebugVC)initWithStyle:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation SpotlightDebugVC

- (void)viewDidLoad
{
  v2 = self;
  sub_1002F89CC();
}

- (_TtC7Journal16SpotlightDebugVC)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpotlightDebugVC();
  return [(TitleValueTableViewController *)&v5 initWithStyle:a3];
}

- (_TtC7Journal16SpotlightDebugVC)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for SpotlightDebugVC();
  v9 = [(TitleValueTableViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal16SpotlightDebugVC)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpotlightDebugVC();
  return [(TitleValueTableViewController *)&v5 initWithCoder:a3];
}

@end