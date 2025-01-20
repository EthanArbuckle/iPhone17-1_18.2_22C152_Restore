@interface TPSSplitViewController
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC4Tips22TPSSplitViewController)initWithCoder:(id)a3;
- (_TtC4Tips22TPSSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Tips22TPSSplitViewController)initWithStyle:(int64_t)a3;
@end

@implementation TPSSplitViewController

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  sub_10000C8F4();
  v4 = v3;

  return (UIViewController *)v4;
}

- (_TtC4Tips22TPSSplitViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPSSplitViewController();
  return [(TPSSplitViewController *)&v5 initWithStyle:a3];
}

- (_TtC4Tips22TPSSplitViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPSSplitViewController();
  return [(TPSSplitViewController *)&v5 initWithCoder:a3];
}

- (_TtC4Tips22TPSSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for TPSSplitViewController();
  v9 = [(TPSSplitViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

@end